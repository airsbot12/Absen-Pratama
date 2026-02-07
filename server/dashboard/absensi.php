<?php
include '../koneksi.php';

$cari = isset($_GET['cari']) ? $_GET['cari'] : '';
?>

<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Rekap Absensi</title>
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
  <a href="dashboard.php">🏠 Dashboard</a>
  <a href="siswa.php">👨‍🎓 Data Siswa</a>
  <a href="absensi.php" class="active">🕘 Rekap Absensi</a>
  <a href="active_device.php">📱 Active Device</a>
  <a href="approve_device.php">✅ Approve Device</a>
</div>

<!-- ===== CONTENT ===== -->
<div class="content">

<!-- ===== HEADER ===== -->
<div class="card">
  <h2>Rekap Absensi Siswa</h2>
  <p>Gunakan pencarian untuk melihat absensi berdasarkan <b>nama siswa</b>.</p>

  <form method="GET">
    <input
      type="text"
      name="cari"
      placeholder="Cari nama siswa..."
      value="<?= htmlspecialchars($cari) ?>"
    >
  </form>
</div>

<!-- ===== TABLE ===== -->
<div class="card">
<div class="table-wrap">

<table class="table-admin">
  <thead>
    <tr>
      <th>Tanggal</th>
      <th>Jam</th>
      <th>NIS</th>
      <th>Nama Siswa</th>
      <th>Status</th>
    </tr>
  </thead>

  <tbody>
  <?php
  $sql = "
    SELECT
      a.tanggal,
      a.jam,
      a.nis,
      s.nama,
      a.status
    FROM absensi a
    LEFT JOIN siswa s ON a.nis = s.nis
  ";

  if($cari != ''){
    $safe = mysqli_real_escape_string($conn, $cari);
    $sql .= " WHERE s.nama LIKE '%$safe%'";
  }

  $sql .= " ORDER BY a.tanggal DESC, a.jam DESC";

  $q = mysqli_query($conn, $sql) or die(mysqli_error($conn));

  if(mysqli_num_rows($q) == 0){
    echo "<tr><td colspan='5' class='empty'>Data tidak ditemukan</td></tr>";
  }

  while($a = mysqli_fetch_assoc($q)){
  ?>
    <tr>
      <td><?= $a['tanggal'] ?></td>
      <td><?= $a['jam'] ?></td>
      <td><?= $a['nis'] ?></td>
      <td><?= $a['nama'] ?? '<i>Nama tidak ditemukan</i>' ?></td>
      <td class="status <?= strtolower($a['status']) ?>">
        <?= $a['status'] ?>
      </td>
    </tr>
  <?php } ?>
  </tbody>
</table>

</div>
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
