<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GET so'rov</title>
</head>

<body>


    <form action="" method="GET">
        <input type="number" name="a" placeholder="a ni kiriting">
        <input type="number" name="b" placeholder="b ni kiriting">
        <button type="submit">Yuborish</button>
    </form>


    <a href="?a=2&b=3">Qo'shish</a>

    <?php
    if (isset($_GET['a']) && isset($_GET['b'])) {
        $a = $_GET['a'];
        $b = $_GET['b'];
        echo "$a + $b = " . $a + $b;
    }
    ?>

</body>

</html>