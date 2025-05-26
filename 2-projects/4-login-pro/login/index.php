<?php
session_start();

$USER_DATA = include '../user-data.php';

if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
    header('Location: ../');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    if (!empty($_POST['username']) && !empty($_POST['password'])) {
        $username = strtolower($_POST['username']);
        $password = md5($_POST['password']);

        if ($USER_DATA['username'] == $username && $USER_DATA['password'] == $password) {
            $_SESSION['loggedin'] = true;
            $_SESSION['username'] = $USER_DATA['username'];
            header('Location: ../');
            exit;
        } else {
            echo "Invalid username or password!";
        }
    } else {
        echo "Please fill in all fields!";
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../src/css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <title>Login</title>
</head>

<body>
    <form action="" method="POST">
        <div class="form-header">
            <h1>Login to Your Account</h1>
        </div>
        <div class="input-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
        </div>
        <div class="input-group">
            <label for="password">Password</label>
            <div>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
                <button type="button" class="toggle-password">
                    <i class="fas fa-eye"></i>
                </button>
            </div>
        </div>
        <button type="submit">Sign In</button>
    </form>
    <script>
        document.querySelector('.toggle-password').addEventListener('click', function() {
            const passwordInput = document.getElementById('password');
            const icon = this.querySelector('i');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        });
    </script>
</body>

</html>