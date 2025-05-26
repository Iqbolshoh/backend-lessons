<?php
// 1) index.php fileagi barcha text o'qib matn o'zgaruvchisiga taminlaydi
$file_oqish = fopen("index.php", "r"); // "r" — read mode
$matn = fread($file_oqish, filesize("index.php"));

// 2) main.php file yaratib, matn o'zgaruvchisidagi malumotni yozadi
$file_yozish = fopen("main.php", "w"); // "w" — write mode
fwrite($file_yozish, $matn);

// 3) main.php file davomiga yangi matn yozish
$file_davomiga_yozish = fopen("main.php", "a"); // "a" - davomidan yozish
fwrite($file_davomiga_yozish, "echo 'salom';");

fclose($file_oqish);
fclose($file_yozish);
fclose($file_davomiga_yozish);

// "r" mode - o'qish
// "w" mode - yozish
// "a" mode - davomidan yozish

// fopen($file, "mode") - file ni ochadi
// $matn = fread($file, "uzunligi") - file malumotini qayataradi
// fwrite($file, "malumot") - filega malumot yozish
// fclose($file)
