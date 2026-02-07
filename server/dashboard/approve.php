<?php
session_start();
include "../koneksi.php";

if (!isset($_GET['id'])) {
  die("ID tidak ada");
}

$id = intval($_GET['id']);

// ambil request pending
$q = mysqli_query($conn,"
  SELECT * FROM device_request
  WHERE id='$id' AND status='pending'
");
if (!$q) {
  die("SQL ERROR: " . mysqli_error($conn));
}

$r = mysqli_fetch_assoc($q);
if (!$r) {
  die("Request tidak valid");
}

$nis        = $r['nis'];
$new_device = $r['new_device_id']; // ✅ FIX UTAMA

// 🔴 revoke device lama (WAJIB biar auth_check jalan)
mysqli_query($conn,"
  DELETE FROM active_device
  WHERE nis='$nis'
");

// update device di siswa
mysqli_query($conn,"
  UPDATE siswa
  SET device_hash='$new_device',
      device_status='active'
  WHERE nis='$nis'
");

// set device baru aktif
mysqli_query($conn,"
  INSERT INTO active_device (nis, device_id, last_login)
  VALUES ('$nis','$new_device',NOW())
  ON DUPLICATE KEY UPDATE
    device_id='$new_device',
    last_login=NOW()
");

// approve request
mysqli_query($conn,"
  UPDATE device_request
  SET status='approved'
  WHERE id='$id'
");

header("Location: device_request.php");
exit;
