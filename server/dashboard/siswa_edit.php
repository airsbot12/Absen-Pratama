<?php
include '../koneksi.php';

if(isset($_POST['update'])){

  $pass_sql = "";
  if(!empty($_POST['password'])){
    $password_plain = $_POST['password'];
    $hash = password_hash($password_plain, PASSWORD_DEFAULT);
    $pass_sql = ", password='$hash', password_view='$password_plain'";
  }

  mysqli_query($conn,"
    UPDATE siswa SET
      nama='$_POST[nama]',
      kelas='$_POST[kelas]',
      no_wa_ortu='$_POST[no_wa_ortu]',
      email_ortu='$_POST[email_ortu]',
      device_hash='$_POST[device_hash]'
      $pass_sql
    WHERE nis='$_POST[nis]'
  ") or die(mysqli_error($conn));

  header("Location:siswa.php");
  exit;
}
