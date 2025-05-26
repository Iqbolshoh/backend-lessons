<?php
session_start();

if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true) {
    if ($_SESSION['role'] === 'admin') {
        header('Location: ../admin/');
        exit;
    } elseif ($_SESSION['role'] === 'user') {
        header('Location: ../');
        exit;
    } else {
        echo "⚠️ Bunday role mavjud emas!";
        exit;
    }
}

include "../config.php";
$db = new Database();

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    if (!empty($_POST['username']) && !empty($_POST['password'])) {
        $username = strtolower(trim($_POST['username']));
        $password = $_POST['password'];

        $user = $db->select('users', '*', 'username = ?', [$username], 's');

        if ($user && isset($user[0])) {
            $hashedPassword = $user[0]['password'];
            $name = $user[0]['name'];
            $role = $user[0]['role'];

            if (password_verify($password, $hashedPassword)) {
                $_SESSION['loggedin'] = true;
                $_SESSION['name'] = $name;
                $_SESSION['username'] = $username;
                $_SESSION['role'] = $role;

                if ($role === 'admin') {
                    header('Location: ../admin/');
                    exit;
                } elseif ($role === 'user') {
                    header('Location: ../');
                    exit;
                } else {
                    echo "⚠️ Bunday role mavjud emas!";
                }
            } else {
                echo "❌ Noto‘g‘ri parol, qayta urinib ko‘ring. 😥";
            }
        } else {
            echo "❌ Bunday foydalanuvchi topilmadi. 🙅‍♂️";
        }
    } else {
        echo "⚠️ Iltimos, login va parol maydonlarini to‘ldiring!";
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">
    <div class="container">
        <div class="row justify-content-center align-items-center vh-100">
            <div class="col-md-6 col-lg-4">
                <div class="card shadow">
                    <div class="card-body p-4">
                        <h2 class="text-center mb-4">Login</h2>
                        <form method="POST">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" name="username" placeholder="Enter username"
                                    required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" name="password" placeholder="Enter password"
                                    required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Login</button>
                        </form>
                        <p class="text-center mt-3">Don't have an account? <a href="../signup/">Sign Up</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>