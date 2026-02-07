<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<!-- ===== TOPBAR MOBILE ===== -->
<div class="topbar">
  <div class="hamburger" onclick="toggleMenu()">☰</div>
  <div>QR ADMIN</div>
</div>

<div class="container">

  <!-- ===== SIDEBAR ===== -->
  <div class="sidebar" id="sidebar">
    <h2>QR ADMIN</h2>
    <a href="index.php">🏠 Dashboard</a>
    <a href="../index_gerbang.html">📱QR CODE SISWA</a>
    <a href="siswa.php">👨‍🎓 Data Siswa</a>
    <a href="absensi.php">🕘 Absensi</a>
    <a href="active_device.php">📱 Active Device</a>
    <a href="approve_device.php">✅ Approve Device</a>
  </div>

  <!-- ===== CONTENT ===== -->
  <div class="content">
    <div class="card">
      <h3>Dashboard</h3>
      <p>Silakan pilih menu di samping.</p>
    </div>
  </div>

</div>

<script>
function toggleMenu(){
  document.getElementById("sidebar").classList.toggle("active");
}
</script>

</body>
</html>
