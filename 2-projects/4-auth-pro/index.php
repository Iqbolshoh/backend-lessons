<?php
// 🚦 Sessiyani boshlaymiz
session_start();

// 🔒 Tizimga kirmagan foydalanuvchini login sahifasiga qaytaramiz
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] != true) {
    header('Location: ./login/');
    exit;
}

// 📂 Foydalanuvchi ma'lumotlarini yuklaymiz
$userData = include './user-data.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | <?= htmlspecialchars($userData['name']) ?></title>
    <link rel="icon" href="https://iqbolshoh.uz" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
    <header class="header">
        <div class="container">
            <nav class="nav">
                <div class="logo"><?= htmlspecialchars($userData['name']) ?></div>
                <div class="nav-links">
                    <a href="./profile.php" class="btn btn-outline">
                        <i class="fas fa-user"></i> My Profile
                    </a>
                    <a href="./logout/" class="btn btn-primary">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </div>
            </nav>
        </div>
    </header>

    <main>
        <section class="hero">
            <img src="<?= htmlspecialchars($userData['image']) ?>" alt="Profile image" class="profile-img">
            <h1>Welcome, <?= htmlspecialchars(explode(' ', $userData['name'])[0]) ?>! 👋</h1>
            <p class="subtitle">You're now logged in to your personal dashboard</p>
        </section>

        <section class="card">
            <h2>About Me</h2>
            <p><?= htmlspecialchars($userData['bio']) ?></p>

            <?php if (isset($userData['skills']) && !empty($userData['skills'])): ?>
                <h3 class="mt-4">Key Skills:</h3>
                <div class="skills">
                    <?php foreach ($userData['skills'] as $skill): ?>
                        <span class="skill-tag"><?= htmlspecialchars($skill) ?></span>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
        </section>
    </main>

    <footer class="footer">
        <div class="container">
            <p>© <?= date('Y') ?> <?= htmlspecialchars($userData['name']) ?>. All rights reserved.</p>
        </div>
    </footer>
</body>

</html>