<?php
// print_r($_POST);
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $s = "";
    if (isset($_POST['first_name']) && !empty($_POST['first_name'])) {
        $s .= " Salom " . $_POST['first_name'] . " ";
    }

    if (isset($_POST['age']) && !empty($_POST['age'])) {
        $s .= " Sizning yoshingiz: " . $_POST['age'];
    }

    $file = fopen("data.txt", "a");
    fwrite($file, $s . "\n");

    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form | POST</title>
</head>

<body>

    <form action="" method="POST">
        <input type="text" name="first_name" placeholder="First Name" required>
        <input type="number" name="age" placeholder="Age" required>
        <button type="submit">Yuborish</button>
    </form>

</body>

</html>