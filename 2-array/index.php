<?php include 'data.php'; ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <style>
        body {
            font-family: Arial;
            background: #f0f4f8;
        }

        .student {
            background: white;
            border: 1px solid #ccc;
            padding: 15px;
            margin: 15px auto;
            width: 400px;
            border-radius: 10px;
            box-shadow: 2px 2px 10px #ddd;
        }

        .student h3 {
            margin: 5px 0;
        }

        .btn {
            display: inline-block;
            padding: 8px 12px;
            margin-top: 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

    <h1 style="text-align:center;">Student List</h1>

    <?php foreach ($students as $student): ?>
        <div class="student">
            <h3>Name: <?= $student['name'] ?></h3>
            <h3>Course: <?= $student['course'] ?></h3>
            <h4>Count grades: <?= count($student['grades']) ?></h4>
            <a class="btn" href="student.php?id=<?= $student['id'] ?>">Batafsil</a>
        </div>
    <?php endforeach; ?>

</body>

</html>