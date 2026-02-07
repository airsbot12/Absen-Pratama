<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require __DIR__.'/PHPMailer/src/Exception.php';
require __DIR__.'/PHPMailer/src/PHPMailer.php';
require __DIR__.'/PHPMailer/src/SMTP.php';

function kirimEmail($to, $nama, $subjek, $isiHTML){
  $mail = new PHPMailer(true);

  try{
    $mail->isSMTP();
    $mail->Host       = 'smtp.gmail.com';
    $mail->SMTPAuth   = true;
    $mail->Username   = 'smkpertama02@gmail.com';
    $mail->Password   = 'APP_PASSWORD_GMAIL';
    $mail->SMTPSecure = 'tls';
    $mail->Port       = 587;

    $mail->setFrom('emailkamu@gmail.com','Sistem Absensi Sekolah');
    $mail->addAddress($to,$nama);

    $mail->isHTML(true);
    $mail->Subject = $subjek;
    $mail->Body    = $isiHTML;

    $mail->send();
    return true;
  }catch(Exception $e){
    return false;
  }
}
