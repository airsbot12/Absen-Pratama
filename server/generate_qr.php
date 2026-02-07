<?php
date_default_timezone_set('Asia/Makassar');
include 'koneksi.php';
header('Content-Type: application/json');

$token = bin2hex(random_bytes(16));
$expired_at = date('Y-m-d H:i:s', strtotime('+3 seconds'));
$id = 1;

$query = "INSERT INTO qr_token (id, token, expired_at) VALUES('$id', '$token', '$expired_at') ON DUPLICATE KEY UPDATE token='$token', expired_at = '$expired_at'";

mysqli_query($conn, $query);

echo json_encode(["token" => $token]);
