<?php
// print_r($_GET);
$s = "";

if (isset($_GET['first_name']) && !empty($_GET['first_name'])) {
    $s .= " Salom " . $_GET['first_name'] . " ";
}

if (isset($_GET['age']) && !empty($_GET['age'])) {
    $s .= " Sizning yoshingiz: " . $_GET['age'];
}

$file = fopen("data.txt", "a");
fwrite($file, $s . "\n");
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form | GET</title>
</head>

<body>

    <form action="" method="GET">
        <input type="text" name="first_name" placeholder="First Name" required>
        <input type="number" name="age" placeholder="Age" required>
        <button type="submit">Yuborish</button>
    </form>

</body>

</html>