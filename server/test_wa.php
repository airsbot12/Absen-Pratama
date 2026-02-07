<?php
define('FONNTE_TOKEN','zsJP14cWdQsBhCJS5BLz');

function kirimWA($no, $pesan){
  $curl = curl_init();
  curl_setopt_array($curl, [
    CURLOPT_URL => "https://api.fonnte.com/send",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_POST => true,
    CURLOPT_POSTFIELDS => [
      'target' => $no,
      'message' => $pesan
    ],
    CURLOPT_HTTPHEADER => [
      "Authorization: ".FONNTE_TOKEN
    ],
  ]);
  $res = curl_exec($curl);
  curl_close($curl);
  echo $res;
}

kirimWA('6289694225798','✅ Test WA berhasil');
