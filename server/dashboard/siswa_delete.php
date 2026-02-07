<?php
include '../koneksi.php';

if(isset($_GET['nis'])){
  mysqli_query($conn,"DELETE FROM siswa WHERE nis='$_GET[nis]'");
  header("Location:siswa.php");
  exit;
}
