<?php
$file_oqish = fopen("data.txt", "r"); // "r" — read mode
$matn = fread($file_oqish, filesize("data.txt"));
fclose($file_oqish);
echo $matn;
?>