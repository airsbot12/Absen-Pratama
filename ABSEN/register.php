<?php
include 'koneksi.php';

if($_SERVER['REQUEST_METHOD']=="POST"){
  $nis   = $_POST['nis'];
  $nama  = $_POST['nama'];
  $kelas = $_POST['kelas'];
  $pass  = password_hash($_POST['password'], PASSWORD_DEFAULT);

  mysqli_query($conn,
   "INSERT INTO siswa(nis,nama,kelas,password)
    VALUES('$nis','$nama','$kelas','$pass')"
  );

  echo "Registrasi berhasil";
}
?>

<form method="POST">
  NIS <input name="nis"><br>
  Nama <input name="nama"><br>
  Kelas <input name="kelas"><br>
  Password <input type="password" name="password"><br>
  <button>Daftar</button>
</form>
