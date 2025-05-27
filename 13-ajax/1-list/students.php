<?php
header('Content-Type: application/json');

$students = [
    ['name' => 'Ali', 'age' => 20],
    ['name' => 'Sara', 'age' => 22],
    ['name' => 'Olim', 'age' => 19],
    ['name' => 'Nargiza', 'age' => 21],
];

echo json_encode($students);
?>