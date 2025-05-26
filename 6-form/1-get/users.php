<?php

$users = [
    [
        'first_name' => 'Iqbolshoh',
        'last_name' => 'Ilhomjonov',
        'age' => 20,
        'username' => 'iqbolshoh',
        'password' => password_hash('123456', PASSWORD_DEFAULT),
    ],
    [
        'first_name' => 'Murod',
        'last_name' => 'Shahriyorov',
        'age' => 28,
        'username' => 'murod_28',
        'password' => password_hash('123456', PASSWORD_DEFAULT),
    ],
    [
        'first_name' => 'Diyor',
        'last_name' => 'Sultonov',
        'age' => 22,
        'username' => 'diyor22',
        'password' => password_hash('123456', PASSWORD_DEFAULT),
    ]
];

if (isset($_GET['username'])) {
    $username = $_GET['username'];

    foreach ($users as $u) {
        if ($u['username'] == $username) {
            echo "Salom " . $u['first_name'] . " " . $u['last_name'] . "<br>";
            echo "Sizning yoshingiz: " . $u['age'] . "<br>";
            echo "Username: " . $u['username'] . "<br>";
            echo "Password: " . $u['password'] . "<br>";
        }
    }
}