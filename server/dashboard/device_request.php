<?php
session_start();
include "../koneksi.php";
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Approve Device</title>
<link rel="stylesheet" href="style.css">
<style>
table{
  width:100%;
  border-collapse:collapse;
}
th,td{
  padding:10px;
  border-bottom:1px solid #ddd;
  text-align:left;
}
.btn{
  padding:6px 12px;
  text-decoration:none;
  border-radius:4px;
  font-size:14px;
}
.btn-add{
  background:#4caf50;
  color:#fff;
}
.btn-del{
  background:#f44336;
  color:#fff;
}
</style>
</head>

<body>

<div class="content card">
  <a href="index.php" class="btn-back">← Kembali ke Dashboard</a>

  <h3>Approve Device Request</h3>

  <table>
    <tr>
      <th>NIS</th>
      <th>Device Baru</th>
      <th>Status</th>
      <th>Aksi</th>
    </tr>

<?php
$q = mysqli_query($conn,"
  SELECT id, nis, new_device_id, status
  FROM device_request
  ORDER BY request_time DESC
");

if(!$q){
  die("SQL ERROR: ".mysqli_error($conn));
}

if(mysqli_num_rows($q)==0){
  echo "<tr><td colspan='4'>Belum ada request</td></tr>";
}

while($r = mysqli_fetch_assoc($q)){
?>
<tr>
  <td><?= htmlspecialchars($r['nis']) ?></td>
  <td><?= htmlspecialchars(substr($r['new_device_id'],0,25)) ?>...</td>
  <td><?= $r['status'] ?></td>
  <td>
    <?php if($r['status']=='pending'): ?>
      <a class="btn btn-add"
         href="approve.php?id=<?= $r['id'] ?>"
         onclick="return confirm('Approve device ini?')">
         Approve
      </a>

      <a class="btn btn-del"
         href="reject.php?id=<?= $r['id'] ?>"
         onclick="return confirm('Reject request ini?')">
         Reject
      </a>
    <?php else: ?>
      -
    <?php endif; ?>
  </td>
</tr>
<?php } ?>

  </table>
</div>

</body>
</html>
