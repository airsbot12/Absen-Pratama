<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

date_default_timezone_set('Asia/Jakarta');
if (session_status() === PHP_SESSION_NONE) session_start();

include 'koneksi.php';

function stop($msg){
  echo "❌ ERROR: $msg";
  exit;
}

echo "DEBUG: FILE DIPANGGIL<br>";

/* ======================
   CEK SESSION
====================== */
if (empty($_SESSION['nis'])) {
  stop("SESSION NIS KOSONG (belum login)");
}
$nis = $_SESSION['nis'];
echo "DEBUG: SESSION OK (NIS=$nis)<br>";

/* ======================
   AMBIL TOKEN
====================== */
$data = json_decode(file_get_contents("php://input"), true);
if (!$data) {
  stop("DATA JSON TIDAK MASUK (fetch salah)");
}

$token = $data['token'] ?? '';
if ($token === '') {
  stop("TOKEN KOSONG");
}
echo "DEBUG: TOKEN OK ($token)<br>";

$now = date('Y-m-d H:i:s');

/* ======================
   VALIDASI QR
====================== */
$q = mysqli_query($conn, "
  SELECT 1 FROM qr_token
  WHERE token='$token'
  AND expired_at >= '$now'
");

if (!$q) {
  stop("SQL ERROR QR_TOKEN: ".mysqli_error($conn));
}

if (mysqli_num_rows($q) == 0) {
  stop("QR TIDAK VALID / KADALUARSA");
}
echo "DEBUG: QR VALID<br>";

/* ======================
   CEK ABSEN HARI INI
====================== */
$tgl = date('Y-m-d');
$cek = mysqli_query($conn, "
  SELECT 1 FROM absensi
  WHERE nis='$nis' AND tanggal='$tgl'
");

if (!$cek) {
  stop("SQL ERROR ABSENSI: ".mysqli_error($conn));
}

if (mysqli_num_rows($cek) > 0) {
  stop("SUDAH ABSEN HARI INI");
}
echo "DEBUG: BELUM ABSEN<br>";

/* ======================
   SIMPAN ABSENSI
====================== */
if (!mysqli_query($conn, "
  INSERT INTO absensi (nis, tanggal, jam, status, waktu)
  VALUES ('$nis', '$tgl', CURTIME(), 'MASUK', NOW())
")) {
  stop("GAGAL INSERT ABSENSI: ".mysqli_error($conn));
}
echo "DEBUG: ABSENSI DISIMPAN<br>";

/* ======================
   AMBIL NO WA ORTU
====================== */
$s = mysqli_query($conn, "
  SELECT no_wa_ortu
  FROM siswa
  WHERE nis='$nis'
");

if (!$s) {
  stop("SQL ERROR SISWA: ".mysqli_error($conn));
}

$d = mysqli_fetch_assoc($s);
if (empty($d['no_wa_ortu'])) {
  stop("NO WA ORTU KOSONG DI TABEL SISWA");
}
echo "DEBUG: NO WA ORTU OK ({$d['no_wa_ortu']})<br>";

$no_wa = preg_replace('/^0/', '62', $d['no_wa_ortu']);

/* ======================
   INSERT OUTBOX
====================== */
$sql = "
INSERT INTO outbox
(wa_mode, wa_no, wa_text, wa_time)
VALUES
('text', '$no_wa', 'TEST DEBUG ABSEN', NOW())
";

if (!mysqli_query($conn, $sql)) {
  stop("GAGAL INSERT OUTBOX: ".mysqli_error($conn));
}

echo "OUTBOX INSERT OK";
