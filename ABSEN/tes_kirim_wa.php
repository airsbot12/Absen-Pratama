<?php
include 'koneksi.php';

if (isset($_POST['kirim'])) {

  $sql = "
    INSERT INTO outbox
    (wa_mode, wa_no, wa_text, wa_time)
    VALUES
    ('text', '6282352625225', 'TES DARI PHP MANUAL', NOW())
  ";

  if (mysqli_query($conn, $sql)) {
    echo "<b>BERHASIL:</b> Data masuk ke OUTBOX";
  } else {
    echo "<b>GAGAL:</b> " . mysqli_error($conn);
  }
}
?>

<!DOCTYPE html>
<html>
<head>
  <title>Test Kirim WA-GW</title>
</head>
<body>

<h3>TEST KIRIM WHATSAPP (WA-GW)</h3>

<form method="post">
  <button type="submit" name="kirim">
    KIRIM TEST WA
  </button>
</form>

</body>
</html>
