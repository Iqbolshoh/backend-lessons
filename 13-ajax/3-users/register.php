<?php
header('Content-Type: application/json');

include 'config.php';
$db = new Database();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    exit(json_encode(['success' => false, 'message' => "Noto'g'ri so'rov"]));
}

if (in_array('', [$_POST['name'], $_POST['username'], $_POST['password']])) {
    exit(json_encode(['success' => false, 'message' => "Barcha maydonlar to'ldirilishi kerak"]));
}

if (strlen($_POST['username']) < 3 || strlen($_POST['password']) < 8) {
    exit(json_encode(['success' => false, 'message' => 'Username yoki parol yetarli uzunlikda emas']));
}

if ($db->select('users', '*', 'username = ?', [$_POST['username']], 's')) {
    exit(json_encode(['success' => false, 'message' => 'Username allaqachon mavjud']));
}

$data = [
    'name' => $_POST['name'],
    'username' => strtolower($_POST['username']),
    'password' => password_hash($_POST['password'], PASSWORD_DEFAULT),
    'role' => 'user'
];

$res = $db->insert('users', $data);

echo json_encode([
    'success' => $res ? true : false,
    'message' => $res ? "Ro'yxatdan o'tish muvaffaqiyatli" : 'Serverda xatolik yuz berdi'
]);
