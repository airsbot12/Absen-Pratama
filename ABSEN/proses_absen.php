<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

date_default_timezone_set('Asia/Makassar');
if (session_status() === PHP_SESSION_NONE) session_start();

include 'koneksi.php';

/* ======================
   CEK SESSION LOGIN
====================== */
if (empty($_SESSION['nis'])) {
  exit("SESSION HABIS");
}
$nis = $_SESSION['nis'];

/* ======================
   AMBIL DATA DARI FETCH
====================== */
$data = json_decode(file_get_contents("php://input"), true);
$token = $data['token'] ?? '';

if ($token == '') {
  exit("TOKEN KOSONG");
}

$now = date('Y-m-d H:i:s');

/* ======================
   VALIDASI QR
====================== */
$q = mysqli_query($conn, "
  SELECT 1 FROM qr_token
  WHERE token='$token'
  AND expired_at >= '$now'
");

if (!$q || mysqli_num_rows($q) == 0) {
  exit("QR TIDAK VALID / KADALUARSA");
}

/* ======================
   CEK ABSEN HARI INI
====================== */
$tgl = date('Y-m-d');
$cek = mysqli_query($conn, "
  SELECT 1 FROM absensi
  WHERE nis='$nis' AND tanggal='$tgl'
");

if (mysqli_num_rows($cek) > 0) {
  exit("SUDAH ABSEN HARI INI");
}

/* ======================
   SIMPAN ABSENSI
====================== */
mysqli_query($conn, "
  INSERT INTO absensi (nis, tanggal, jam, status, waktu)
  VALUES ('$nis', '$tgl', CURTIME(), 'MASUK', NOW())
");

/* ======================
   AMBIL DATA SISWA
====================== */
$s = mysqli_query($conn, "
  SELECT nama, kelas, no_wa_ortu
  FROM siswa
  WHERE nis='$nis'
");

$d = mysqli_fetch_assoc($s);

if (empty($d['no_wa_ortu'])) {
  exit("NO WA ORTU BELUM DIISI");
}

/* ======================
   SIAPKAN PESAN WA
====================== */
$jam = date('H:i');
$no_wa = preg_replace('/^0/', '62', $d['no_wa_ortu']);

$pesan_wa = "
ABSENSI SISWA SMK TI PRATAMA PGRI 

Nama   : {$d['nama']}
Kelas  : {$d['kelas']}
Jam    : $jam

Status : HADIR
";

/* ======================
   KIRIM KE OUTBOX WA-GW
====================== */
mysqli_query($conn, "
INSERT INTO outbox
(wa_mode, wa_no, wa_text, wa_time)
VALUES
('text', '$no_wa',
 '".mysqli_real_escape_string($conn,$pesan_wa)."',
 NOW())
");

/* ======================
   RESPONSE KE CLIENT
====================== */
echo "ABSEN BERHASIL";
