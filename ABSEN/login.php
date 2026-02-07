<?php
session_start();
include 'koneksi.php';

$locked = false;
$nis_locked = "";
$new_device = "";

// generate device id
$device = hash('sha256',
  ($_SERVER['HTTP_USER_AGENT'] ?? '') .
  ($_SERVER['REMOTE_ADDR'] ?? '')
);

// PROSES LOGIN
if(isset($_POST['login'])){
  $nis = $_POST['nis'];
  $p   = $_POST['password'];

  $q = mysqli_query($conn,"SELECT * FROM siswa WHERE nis='$nis'");
  $s = mysqli_fetch_assoc($q);

  if(!$s || !password_verify($p,$s['password'])){
    $error = "Login gagal";
  }else{

    // cek device aktif
    $d = mysqli_query($conn,"SELECT * FROM active_device WHERE nis='$nis'");
    $ad = mysqli_fetch_assoc($d);

    if(!$ad){
      // login pertama
      mysqli_query($conn,"
        INSERT INTO active_device(nis,device_id,last_login)
        VALUES('$nis','$device',NOW())
      ");
      $_SESSION['nis']=$nis;
      header("Location: scan.php"); exit;

    }else if($ad['device_id'] != $device){
      // device beda → LOCK
      $locked = true;
      $nis_locked = $nis;
      $new_device = $device;

    }else{
      // device sama
      $_SESSION['nis']=$nis;
      header("Location: scan.php"); exit;
    }
  }
}

// REQUEST AKSES
if(isset($_POST['request'])){
  $nis = $_POST['req_nis'];
  $new = $_POST['req_device'];

  $ad = mysqli_fetch_assoc(
    mysqli_query($conn,"SELECT device_id FROM active_device WHERE nis='$nis'")
  );

  // cegah request ganda
  $cek = mysqli_query($conn,"
    SELECT * FROM device_request
    WHERE nis='$nis' AND status='pending'
  ");

  if(mysqli_num_rows($cek)==0){
    mysqli_query($conn,"
      INSERT INTO device_request(nis,new_device_id,old_device_id)
      VALUES('$nis','$new','".$ad['device_id']."')
    ");
  }

  echo "<p style='color:green'>Request dikirim ke admin</p>";
}
?>

<form method="POST">
  NIS <input name="nis" required><br>
  Password <input type="password" name="password" required><br>
  <button name="login">Login</button>
</form>

<?php if(isset($error)) echo "<p style='color:red'>$error</p>"; ?>

<?php if($locked): ?>
<hr>
<p style="color:orange">
  🔒 Akun terkunci di device lain
</p>

<form method="POST">
  <input type="hidden" name="req_nis" value="<?= $nis_locked ?>">
  <input type="hidden" name="req_device" value="<?= $new_device ?>">
  <button name="request">Request Akses ke Admin</button>
</form>
<?php endif; ?>
