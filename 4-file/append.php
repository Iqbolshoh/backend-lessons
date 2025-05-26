<?php
$file_davomidan_yozish = fopen("data.txt", "a"); // "a" — append mode
fwrite($file_davomidan_yozish, "\nYangi matn yozish!");
fclose($file_davomidan_yozish);
?>