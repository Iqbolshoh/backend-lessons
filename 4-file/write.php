<?php
$file_yozish = fopen("data.txt", "w"); // "w" — write mode

fwrite($file_yozish, "Salom, PHP dunyo!\n");
fwrite($file_yozish, "2-qator\n");
fwrite($file_yozish, "3-qator");

fclose($file_yozish);
?>