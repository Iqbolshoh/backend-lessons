<?php
header('Content-Type: application/json');

include 'config.php';
$db = new Database();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (empty($_POST['name']) || empty($_POST['username']) || empty($_POST['password'])) {
        echo json_encode(['success' => false, 'message' => "Barcha maydonlar to'ldirilishi kerak"]);
        exit;
    }

    if (strlen($_POST['username']) < 3) {
        echo json_encode(['success' => false, 'message' => 'Username kamida 3 belgidan iborat bo\'lishi kerak']);
        exit;
    }

    if (strlen($_POST['password']) < 8) {
        echo json_encode(['success' => false, 'message' => 'Parol kamida 8 belgidan iborat bo\'lishi kerak']);
        exit;
    }

    $usernameExists = $db->select('users', "*", "username = ?", [$_POST['username']], "s");
    if (!empty($usernameExists)) {
        echo json_encode(['success' => false, 'message' => 'Username allaqachon mavjud']);
        exit;
    }

    $name = trim($_POST['name']);
    $username = strtolower(trim($_POST['username']));
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $role = 'user';

    $inserted = $db->insert('users', [
        'name' => $name,
        'username' => $username,
        'password' => $password,
        'role' => $role
    ]);

    if ($inserted) {
        echo json_encode(['success' => true, 'message' => "Ro'yxatdan o'tish muvaffaqiyatli"]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Serverda xatolik yuz berdi']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Noto\'g\'ri so\'rov']);
}
?>