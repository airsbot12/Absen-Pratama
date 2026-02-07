<?php
// ================================
// AUTH CHECK (SESSION GUARD)
// ================================

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

include 'koneksi.php';

/*
  ATURAN:
  - Jika session sudah tidak ada → logout normal → DIAM
  - Jika session ada tapi device tidak cocok → REVOKED
*/

if (!isset($_SESSION['nis']) || !isset($_SESSION['device_id'])) {
    // Logout normal, jangan anggap revoke
    exit;
}

$nis    = $_SESSION['nis'];
$device = $_SESSION['device_id'];

// Cek apakah device ini masih device aktif
$q = mysqli_query($conn, "
    SELECT 1 FROM active_device
    WHERE nis = '$nis'
      AND device_id = '$device'
    LIMIT 1
");

if (mysqli_num_rows($q) === 0) {
    echo "REVOKED";   // Admin sudah approve device lain
} else {
    echo "OK";        // Device masih sah
}
