<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// panggil file kirim email
include __DIR__.'/lib/kirim_email.php';

$isi = "
<h2>✅ TEST EMAIL BERHASIL</h2>
<p>Jika kamu menerima email ini, berarti:</p>
<ul>
  <li>PHPMailer OK</li>
  <li>SMTP Gmail OK</li>
  <li>Path folder BENAR</li>
</ul>
<p><b>Waktu:</b> ".date('Y-m-d H:i:s')."</p>
";

// GANTI email tujuan di sini
$hasil = kirimEmail(
  'akunultra111@gmail.com',
  'Tes User',
  'TES EMAIL SISTEM ABSENSI',
  $isi
);

if($hasil){
  echo "✅ EMAIL TERKIRIM (cek inbox / spam)";
}else{
  echo "❌ EMAIL GAGAL (cek setting SMTP)";
}
