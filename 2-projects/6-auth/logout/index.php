<?php
// 🔐 Sessiyani ishga tushuramiz, chunki biz sessiya dan foydalanmoqdamiz
session_start();

// 🧹 Barcha sessiya o'zgaruvchilarini tozalaymiz
// (username, loggedin va boshqa barcha sessiya ma'lumotlari o'chadi)
session_unset();

// 💣 Sessiyani butunlay yo'q qilamiz - bu foydalanuvchini tizimdan chiqaradi
session_destroy();

// 🔄 Foydalanuvchini login sahifasiga qaytaramiz
header('Location: ../login/');
exit; // ⛔ Kodni to'xtatamiz, keyingi qismlar ishlamasin
