<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_FILES['rasm']) && $_FILES['rasm']['error'] == 0) {
        $fileName = time() . '_' . basename($_FILES['rasm']['name']);
        $tmpName = $_FILES['rasm']['tmp_name'];
        $uploadDir = __DIR__ . '/images/';
        $path = $uploadDir . $fileName;

        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0755, true);
        }

        if (move_uploaded_file($tmpName, $path)) {
            echo "✅ Rasm muvaffaqiyatli yuklandi:<br>";
        } else {
            echo "❌ Yuklashda xatolik yuz berdi!";
            exit;
        }
    } else {
        echo "⚠️ Fayl tanlanmagan yoki yuklashda xatolik mavjud.";
        exit;
    }

    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}
?>

<!DOCTYPE html>
<html lang="uz">

<head>
    <meta charset="UTF-8">
    <title>Rasm Yuklash</title>
</head>

<body>
    <h2>📤 Rasm yuklash formasi</h2>
    <form action="" method="POST" enctype="multipart/form-data">
        <input type="text" name="first_name" placeholder="Ismingiz" required> <br><br>
        <input type="file" name="rasm" required> <br><br>
        <button type="submit">Yuborish</button>
    </form>
</body>

</html>