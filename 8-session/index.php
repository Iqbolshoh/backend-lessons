<?php

/**
 * PHP sessiyasini boshlaymiz.
 * $_SESSION superglobalidan foydalanishdan oldin bu zarur.
 */
session_start();

/**
 * Foydalanuvchi ma'lumotlarini sessiyaga yozamiz.
 *
 * Bu qiymatlar foydalanuvchi sessiyasi davomida vaqtincha saqlanadi
 * va sahifalar orasida foydalanish mumkin bo‘ladi.
 */
$_SESSION['id'] = "777";                     // Foydalanuvchining ID raqami
$_SESSION['name'] = "Ilhomjonov Iqbolshoh";  // Foydalanuvchining to‘liq ismi
$_SESSION['username'] = "iqbolshoh";         // Foydalanuvchining login (foydalanuvchi nomi)

/**
 * Sessiyadagi barcha ma'lumotlarni ekranga chiqaramiz.
 *
 * print_r() — debugging (tekshirish) uchun ishlatiladi,
 * <pre> teglari bilan ko‘rinishi chiroyli bo‘ladi.
 */
echo "<pre>";
print_r($_SESSION);
echo "</pre>";

/**
 * Sessiyadagi barcha o‘zgaruvchilarni tozalaymiz.
 *
 * session_unset() — $_SESSION array ichidagi barcha qiymatlarni olib tashlaydi,
 * lekin sessiyaning o‘zi hanuz mavjud bo‘ladi.
 */
session_unset();

/**
 * Sessiyani butunlay yo‘q qilamiz.
 *
 * Bu serverdagi sessiya ma’lumotlarini o‘chiradi
 * va mijoz (brauzer)dagi sessiya ID ni bekor qiladi.
 */
session_destroy();

/**
 * Sessiyani yo‘q qilgandan keyin, yana ekranga chiqarishga harakat qilamiz.
 *
 * Lekin sessiya yo‘q bo‘lgani uchun, natija bo‘sh array (massiv) bo‘ladi.
 */
echo "<pre>";
print_r($_SESSION);
echo "</pre>";
