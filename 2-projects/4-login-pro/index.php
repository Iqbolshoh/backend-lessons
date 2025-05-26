<?php
session_start();

if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] != true) {
    header('Location: ./login/');
    exit;
}

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
    <link rel="stylesheet" href="./src/css/dashboard.css">
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
                    <a href="#" class="btn btn-primary" id="logout-btn">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </div>
            </nav>
        </div>
        <!-- Modal -->
        <div class="modal" id="logout-modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Confirm Logout</h2>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to log out of your account?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-outline" id="modal-cancel">No</button>
                    <a href="./logout/" class="btn btn-danger" id="modal-confirm">Yes, log out</a>
                </div>
            </div>
        </div>
    </header>

    <main>
        <section class="hero">
            <img src="./src/<?= htmlspecialchars($userData['image']) ?>" alt="Profile image" class="profile-img">
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

    <script>
        document.getElementById('logout-btn').addEventListener('click', function(e) {
            e.preventDefault();
            document.getElementById('logout-modal').classList.add('show');
        });

        document.getElementById('modal-cancel').addEventListener('click', function() {
            document.getElementById('logout-modal').classList.remove('show');
        });

        document.getElementById('logout-modal').addEventListener('click', function(e) {
            if (e.target === this) {
                this.classList.remove('show');
            }
        });
    </script>
</body>

</html>