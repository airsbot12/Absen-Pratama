<?php
include '../koneksi.php';

if(isset($_POST['simpan'])){

  if(empty($_POST['password'])){
    die('PASSWORD WAJIB DIISI');
  }

  $password_plain = $_POST['password'];
  $hash = password_hash($password_plain, PASSWORD_DEFAULT);

  mysqli_query($conn,"
    INSERT INTO siswa
    (nis,nama,kelas,password,password_view,no_wa_ortu,email_ortu,device_hash,device_status)
    VALUES (
      '$_POST[nis]',
      '$_POST[nama]',
      '$_POST[kelas]',
      '$hash',
      '$password_plain',
      '$_POST[no_wa_ortu]',
      '$_POST[email_ortu]',
      '$_POST[device_hash]',
      'AKTIF'
    )
  ") or die(mysqli_error($conn));

  header("Location:siswa.php");
  exit;
}
