<?php
/*------------------------------
| ⚙️ COOKIE ISHLATISH SAHIFASI
| Ichida: yaratish, ko‘rish, o‘chirish
-------------------------------*/

// Cookie muddati
$expiry = time() + (86400 * 7); // 7 kun

/*------------------------------
| 🍪 COOKIE YARATISH
| Avtomatik tarzda (formalarsiz)
-------------------------------*/
setcookie("username", "iqbolshoh", $expiry, "/");
setcookie("theme", "dark", $expiry, "/");
setcookie("lang", "uz", $expiry, "/");

/*------------------------------
| ❌ COOKIE O‘CHIRISH
| Agar URL’da ?reset=1 bo‘lsa
-------------------------------*/
if (isset($_GET['reset'])) {
    $past = time() - 3600;
    setcookie("username", "", $past, "/");
    setcookie("theme", "", $past, "/");
    setcookie("lang", "", $past, "/");
}

?>

<!DOCTYPE html>
<html lang="uz">

<head>
    <meta charset="UTF-8">
    <title>Cookie Demo (Auto)</title>
</head>

<body style="font-family: sans-serif; line-height: 1.6;">

    <h2>🍪 Cookie Demo Sahifasi (Formsiz)</h2>

    <h3>📦 Saqlangan cookie’lar:</h3>
    <ul>
        <li>👤 Username: <?= $_COOKIE["username"] ?? "yo‘q" ?></li>
        <li>🎨 Theme: <?= $_COOKIE["theme"] ?? "yo‘q" ?></li>
        <li>🌐 Language: <?= $_COOKIE["lang"] ?? "yo‘q" ?></li>
    </ul>

    <a href="./" style="color:green;">Cookie’larni o'rnatish</a>
    <a href="?reset=1" style="color:red;">Cookie’larni o‘chirish</a>
</body>

</html>