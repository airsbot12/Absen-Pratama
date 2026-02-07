<?php include '../koneksi.php'; ?>
<link rel="stylesheet" href="style.css">

<div class="content card">
  <a href="index.php" class="btn-back">← Kembali ke Dashboard</a>

  <h3>Active Device</h3>

  <table>
    <tr>
      <th>NIS</th>
      <th>Device</th>
      <th>Terakhir Login</th>
    </tr>

<?php
$q = mysqli_query($conn,"SELECT * FROM active_device");
if(!$q){
  die(mysqli_error($conn));
}

if(mysqli_num_rows($q)==0){
  echo "<tr><td colspan='3'>Tidak ada device aktif</td></tr>";
}

while($d = mysqli_fetch_assoc($q)){
?>
<tr>
  <td><?= htmlspecialchars($d['nis']) ?></td>
  <td><?= htmlspecialchars(substr($d['device_id'],0,20)) ?>...</td>
  <td><?= $d['last_login'] ?></td>
</tr>
<?php } ?>
  </table>
</div>
