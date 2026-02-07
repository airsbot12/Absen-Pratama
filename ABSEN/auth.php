<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

if (session_status() === PHP_SESSION_NONE) session_start();
include 'koneksi.php';

$locked = false;
$lock_nis = "";
$lock_device = "";
$msg = "";

/* =========================
   AUTO LOGIN VIA COOKIE
========================= */
if (!isset($_SESSION['nis']) && isset($_COOKIE['absen_login'])) {

  $q = mysqli_query($conn,"SELECT nis, device_hash FROM siswa");

  while ($s = mysqli_fetch_assoc($q)) {
    if ($s['device_hash'] &&
        hash('sha256', $s['nis'].$s['device_hash']) === $_COOKIE['absen_login']) {

      $_SESSION['nis'] = $s['nis'];
      $_SESSION['device_id'] = $s['device_hash'];

      mysqli_query($conn,"
        INSERT INTO active_device (nis, device_id, last_login)
        VALUES ('{$s['nis']}', '{$s['device_hash']}', NOW())
        ON DUPLICATE KEY UPDATE
          device_id='{$s['device_hash']}',
          last_login=NOW()
      ");

      header("Location: scan.php");
      exit;
    }
  }
}

/* =========================
   LOGIN (NAMA + PASSWORD)
========================= */
if (isset($_POST['login'])) {

  $nama   = mysqli_real_escape_string($conn, $_POST['nama']);
  $pass   = $_POST['password'];
  $device = hash('sha256', $_POST['device']);

  $q = mysqli_query($conn,"
    SELECT * FROM siswa
    WHERE nama='$nama'
    LIMIT 1
  ");
  $s = mysqli_fetch_assoc($q);

  if (!$s || !password_verify($pass, $s['password'])) {
    $msg = "❌ Login gagal. Nama atau password salah.";

  } else {

    $nis = $s['nis'];

    /* ===== LOGIN PERTAMA ===== */
    if ($s['device_hash'] === NULL) {

      mysqli_query($conn,"
        UPDATE siswa SET device_hash='$device'
        WHERE nis='$nis'
      ");

      mysqli_query($conn,"
        INSERT INTO active_device (nis, device_id, last_login)
        VALUES ('$nis', '$device', NOW())
        ON DUPLICATE KEY UPDATE
          device_id='$device',
          last_login=NOW()
      ");

      $_SESSION['nis'] = $nis;
      $_SESSION['device_id'] = $device;

      setcookie(
        "absen_login",
        hash('sha256', $nis.$device),
        time() + 60*60*24*30,
        "/"
      );

      header("Location: scan.php");
      exit;
    }

    /* ===== DEVICE BERBEDA ===== */
    if ($s['device_hash'] !== $device) {
      $locked = true;
      $lock_nis = $nis;
      $lock_device = $device;
      $msg = "🔒 Akun sedang digunakan di perangkat lain";

    } else {

      /* ===== DEVICE SAMA ===== */
      mysqli_query($conn,"
        INSERT INTO active_device (nis, device_id, last_login)
        VALUES ('$nis', '$device', NOW())
        ON DUPLICATE KEY UPDATE
          device_id='$device',
          last_login=NOW()
      ");

      $_SESSION['nis'] = $nis;
      $_SESSION['device_id'] = $device;

      setcookie(
        "absen_login",
        hash('sha256', $nis.$device),
        time() + 60*60*24*30,
        "/"
      );

      header("Location: scan.php");
      exit;
    }
  }
}

/* =========================
   REQUEST AKSES KE ADMIN
========================= */
if (isset($_POST['request'])) {

  $nis = $_POST['req_nis'];
  $new_device = $_POST['req_device'];

  $cek = mysqli_query($conn,"
    SELECT id FROM device_request
    WHERE nis='$nis' AND status='pending'
  ");

  if (mysqli_num_rows($cek) == 0) {

    mysqli_query($conn,"
      INSERT INTO device_request (nis, new_device_id)
      VALUES ('$nis', '$new_device')
    ");

    if(mysqli_error($conn)){
      die("SQL ERROR: ".mysqli_error($conn));
    }

    $msg = "✅ Request akses dikirim ke admin";
  } else {
    $msg = "⏳ Request sudah dikirim, tunggu admin";
  }
}

?>

<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Absensi</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<header class="header">
  <h1>SMK TI PRATAMA PGRI SAMARINDA</h1>
  <p>Sistem Absensi QR Code</p>
</header>

<main class="container">
  <div class="card">

    <h2>Login Siswa</h2>

    <?php if ($msg): ?>
      <p style="color:#ff9800"><?= $msg ?></p>
    <?php endif; ?>

    <form method="POST">
      <input name="nama" placeholder="Nama Lengkap" required>
      <input type="password" name="password" placeholder="Password" required>
      <input type="hidden" name="device" id="device">
      <button class="btn" name="login">Login</button>
    </form>

    <?php if ($locked): ?>
    <hr>
    <form method="POST">
      <input type="hidden" name="req_nis" value="<?= $lock_nis ?>">
      <input type="hidden" name="req_device" value="<?= $lock_device ?>">
      <button class="btn secondary" name="request">
        Request Akses ke Admin
      </button>
    </form>
    <?php endif; ?>

  </div>
</main>

<footer class="footer">
  © 2025 SMK TI PRATAMA PGRI SAMARINDA
</footer>

<script>
/* DEVICE ID STABIL */
if (!localStorage.getItem("device_id")) {
  localStorage.setItem(
    "device_id",
    btoa(
      navigator.userAgent +
      screen.width +
      screen.height +
      Intl.DateTimeFormat().resolvedOptions().timeZone
    )
  );
}
document.getElementById("device").value =
  localStorage.getItem("device_id");
</script>

</body>
</html>
