<?php
if (session_status() === PHP_SESSION_NONE) session_start();
if (!isset($_SESSION['nis'])) {
    header("Location: auth.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Scan Absensi</title>

<link rel="stylesheet" href="style.css">
<script src="https://unpkg.com/html5-qrcode"></script>
</head>

<body>

<header class="header">
  <h1>SMK TI PRATAMA PGRI SAMARINDA</h1>
  <p>Sistem Absensi QR Code</p>
</header>

<main class="container">
  <div class="card">
    <h2>Scan QR Absensi</h2>
    <p class="info-text">Klik tombol lalu arahkan kamera ke QR</p>

    <div id="reader" style="width:300px;margin:auto;display:none;"></div>

    <!-- INI KUNCI NYA -->
    <button class="btn" onclick="mulaiScan()">Mulai Scan QR</button>

    <button class="btn logout" onclick="doLogout()">Logout</button>
  </div>
</main>

<footer class="footer">
  © 2025 SMK TI PRATAMA PGRI SAMARINDA
</footer>

<script>
let qrScanner = null;
let authInterval = null;

function mulaiScan() {
  const reader = document.getElementById("reader");
  reader.style.display = "block";

  if (qrScanner) return;

  qrScanner = new Html5Qrcode("reader");

  qrScanner.start(
    { facingMode: "environment" },
    { fps: 10, qrbox: 250 },
    token => {
      qrScanner.stop().catch(()=>{});
      qrScanner = null;

      fetch("proses_absen.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ token })
      })
      .then(r => r.text())
      .then(res => {
        alert(res);
        location.reload();
      });
    },
    err => {}
  ).catch(err => {
    console.error(err);
    alert("❌ Kamera gagal diakses.\nPastikan izin kamera ALLOW.");
  });
}

/* FORCE LOGOUT */
authInterval = setInterval(() => {
  fetch("auth_check.php")
    .then(r => r.text())
    .then(res => {
      if (res === "REVOKED") {
        doLogout("Akun dipindahkan ke device lain");
      }
    });
}, 3000);

function doLogout(msg) {
  if (qrScanner) qrScanner.stop().catch(()=>{});
  if (authInterval) clearInterval(authInterval);
  if (msg) alert(msg);

  fetch("logout.php", { method: "POST" })
    .then(() => window.location.replace("auth.php"));
}
</script>

</body>
</html>
