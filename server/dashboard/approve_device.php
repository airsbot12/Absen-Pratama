<?php include '../koneksi.php'; ?>
<link rel="stylesheet" href="style.css">

<div class="content card">
<a href="dashboard.php" class="btn-back">← Kembali ke Dashboard</a>

<h3>Approve Device</h3>

<table>
<tr>
  <th>NIS</th>
  <th>Device Baru</th>
  <th>Aksi</th>
</tr>

<?php
$q = mysqli_query($conn,"SELECT id, nis, new_device_id FROM device_request WHERE status='pending'");
if(!$q) die(mysqli_error($conn));

if(mysqli_num_rows($q)==0){
  echo "<tr><td colspan='3'>Tidak ada request</td></tr>";
}

while($r=mysqli_fetch_assoc($q)){
?>
<tr>
  <td><?= htmlspecialchars($r['nis']) ?></td>
  <td><?= htmlspecialchars(substr($r['new_device_id'],0,20)) ?>...</td>
  <td>
    <a class="btn btn-add" href="approve.php?id=<?= $r['id'] ?>">Approve</a>
    <a class="btn btn-del" href="reject.php?id=<?= $r['id'] ?>">Reject</a>
  </td>
</tr>
<?php } ?>
</table>
</div>
