<?php
// ===============================
// KONEKSI DATABASE LOKAL (XAMPP)
// ===============================

// Aktifkan error (biar enak debug di lokal)
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Konfigurasi database lokal
$host = "localhost";
$user = "root";
$pass = "";
$db   = "wagw"; // pastikan database ini ada di phpMyAdmin

// Koneksi
$conn = mysqli_connect($host, $user, $pass, $db);

// Cek koneksi
if (!$conn) {
    die("Koneksi database gagal: " . mysqli_connect_error());
}
