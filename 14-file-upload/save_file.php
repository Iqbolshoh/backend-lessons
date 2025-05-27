<?php
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST' || !isset($_FILES['file'])) {
    exit(json_encode(['success' => false, 'message' => 'Fayl yuborilmadi']));
}

$file = $_FILES['file'];
$allowed = ['png', 'jpg', 'jpeg'];
$maxSize = 2 * 1024 * 1024;

$ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
if (!in_array($ext, $allowed)) {
    exit(json_encode(['success' => false, 'message' => 'Faqat PNG, JPG va JPEG fayllar ruxsat etilgan']));
}

if ($file['size'] > $maxSize) {
    exit(json_encode(['success' => false, 'message' => 'Fayl hajmi 2MB dan oshmasligi kerak']));
}

$uploadDir = __DIR__ . '/uploads/';
!is_dir($uploadDir) && mkdir($uploadDir, 0755, true);

$newName = uniqid('file_', true) . '.' . $ext;
$dest = $uploadDir . $newName;

if (move_uploaded_file($file['tmp_name'], $dest)) {
    echo json_encode(['success' => true, 'message' => 'Fayl yuklandi', 'file' => 'uploads/' . $newName]);
} else {
    echo json_encode(['success' => false, 'message' => 'Yuklashda xatolik yuz berdi']);
}
