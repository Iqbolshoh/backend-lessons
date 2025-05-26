<?php
// 🚦 Sessiyani boshlaymiz
session_start();

// 🔒 Tizimga kirmagan foydalanuvchini login sahifasiga qaytaramiz
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] != true) {
    header('Location: ./login/');
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>

<body>
    <h1> Salom <?= $_SESSION['name'] ?> siz tizimga kirdingiz.</h1>
    <a href="./logout/">Chiqish</a>
</body>

</html>