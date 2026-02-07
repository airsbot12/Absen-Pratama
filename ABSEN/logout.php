<?php
session_start();
session_unset();
session_destroy();

// PAKSA REDIRECT KE LOGIN
header("Location: auth.php");
exit;
