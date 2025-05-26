<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POST so'rov</title>
</head>

<body>


    <form action="" method="POST">
        <input type="number" name="a" placeholder="a ni kiriting">
        <input type="number" name="b" placeholder="b ni kiriting">
        <button type="submit">Yuborish</button>
    </form>


    <?php
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

        if (isset($_POST['a']) && isset($_POST['b'])) {
            $a = $_POST['a'];
            $b = $_POST['b'];

            file_put_contents('natija.txt', "$a + $b = " . $a + $b);
        }

        header("Location: " . $_SERVER['PHP_SELF']);
        exit;
    }
    ?>

</body>

</html>