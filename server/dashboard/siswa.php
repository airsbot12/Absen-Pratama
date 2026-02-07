<?php
include '../koneksi.php';

/* ======================
   CREATE / UPDATE
====================== */
if(isset($_POST['aksi'])){

  $pass_sql = "";

  if(!empty($_POST['password'])){
    $password_plain = $_POST['password'];
    $hash = password_hash($password_plain, PASSWORD_DEFAULT);
    $pass_sql = ", password='$hash', password_view='$password_plain'";
  }

  // CREATE
  if($_POST['aksi']=='add'){

    if(empty($_POST['password'])){
      die('Password wajib diisi');
    }

    $password_plain = $_POST['password'];
    $hash = password_hash($password_plain, PASSWORD_DEFAULT);

    mysqli_query($conn,"
      INSERT INTO siswa
      (nis,nama,kelas,password,password_view,no_wa_ortu,device_hash,device_status)
      VALUES (
        '$_POST[nis]',
        '$_POST[nama]',
        '$_POST[kelas]',
        '$hash',
        '$password_plain',
        '$_POST[no_wa_ortu]',
        '$_POST[device_hash]',
        'AKTIF'
      )
    ") or die(mysqli_error($conn));

    header("Location:siswa.php");
    exit;
  }

  // UPDATE
  if($_POST['aksi']=='edit'){
    mysqli_query($conn,"
      UPDATE siswa SET
        nama='$_POST[nama]',
        kelas='$_POST[kelas]',
        no_wa_ortu='$_POST[no_wa_ortu]',
        device_hash='$_POST[device_hash]'
        $pass_sql
      WHERE nis='$_POST[nis]'
    ") or die(mysqli_error($conn));

    header("Location:siswa.php");
    exit;
  }
}

/* ======================
   DELETE
====================== */
if(isset($_GET['hapus'])){
  mysqli_query($conn,"DELETE FROM siswa WHERE nis='$_GET[hapus]'");
  header("Location:siswa.php");
  exit;
}

/* ======================
   DATA EDIT
====================== */
$edit = false;
if(isset($_GET['edit'])){
  $edit = mysqli_fetch_assoc(
    mysqli_query($conn,"SELECT * FROM siswa WHERE nis='$_GET[edit]'")
  );
}

/* ======================
   DATA TABLE (INI YANG TADI HILANG ❗)
====================== */
$q = mysqli_query($conn,"SELECT * FROM siswa ORDER BY nama ASC");
?>

<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CRUD SISWA</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<a href="index.php" class="btn-back">← Kembali ke Dashboard</a>

<div class="card">
<h2><?= $edit ? 'Edit Siswa' : 'Tambah Siswa' ?></h2>

<form method="POST">
<input type="hidden" name="aksi" value="<?= $edit ? 'edit' : 'add' ?>">

<div class="form-grid">

  <div>
    <label>NIS</label>
    <input name="nis" value="<?= $edit['nis'] ?? '' ?>" <?= $edit?'readonly':'' ?> required>
  </div>

  <div>
    <label>Nama</label>
    <input name="nama" value="<?= $edit['nama'] ?? '' ?>" required>
  </div>

  <div>
    <label>Kelas</label>
    <input name="kelas" value="<?= $edit['kelas'] ?? '' ?>" required>
  </div>

  <div>
    <label>Password <?= $edit?'(kosongkan jika tidak diganti)':'' ?></label>
    <input type="password" name="password" <?= $edit?'':'required' ?>>
  </div>

  <div>
    <label>No WhatsApp Ortu</label>
    <input name="no_wa_ortu" value="<?= $edit['no_wa_ortu'] ?? '' ?>">
  </div>
  <div>
    <label>Email Wali Murid</label>
    <input type="email" name="email_ortu" value="<?= $edit['email_ortu'] ?? '' ?>">

  </div>
  


 
</div>

<br>
<button type="submit">Simpan</button>
</form>
</div>

<div class="card">
<h3>Data Siswa</h3>

<div class="table-wrap">
<table>
  <thead>
    <tr>
      <th>NIS</th>
      <th>Nama</th>
      <th>Kelas</th>
      <th>No WA Ortu</th>
      <th>Device</th>
      <th>Password</th>
      <th>Aksi</th>
    </tr>
  </thead>

  <tbody>
  <?php while($s=mysqli_fetch_assoc($q)){ ?>
    <tr>
      <td><?= $s['nis'] ?></td>
      <td><?= $s['nama'] ?></td>
      <td><?= $s['kelas'] ?></td>
      <td><?= $s['no_wa_ortu'] ?></td>
      <td><?= substr($s['device_hash'],0,15) ?>...</td>

      <td class="pw-col">
        <input type="password"
               value="<?= $s['password_view'] ?>"
               readonly
               id="pw<?= $s['nis'] ?>">
        <button type="button" onclick="togglePw('<?= $s['nis'] ?>')">👁</button>
      </td>

      <td class="action">
        <a href="?edit=<?= $s['nis'] ?>">Edit</a>
        <a href="?hapus=<?= $s['nis'] ?>" onclick="return confirm('Hapus data?')">Delete</a>
      </td>
    </tr>
  <?php } ?>
  </tbody>
</table>
</div>
</div>

<script>
function togglePw(nis){
  const el = document.getElementById('pw'+nis);
  el.type = el.type === 'password' ? 'text' : 'password';
}
</script>

</body>
</html>
