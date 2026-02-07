<?php
session_start();
include "../koneksi.php";

$id = intval($_GET['id']);

mysqli_query($conn,"
  UPDATE device_request
  SET status='rejected'
  WHERE id='$id'
");

header("Location: device_request.php");
exit;
