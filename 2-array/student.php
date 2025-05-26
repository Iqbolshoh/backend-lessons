<?php
include 'data.php';

$id = $_GET['id'] ?? null;
$student = array_values(array_filter($students, fn($s) => $s['id'] == $id))[0] ?? null;
?>

<!DOCTYPE html>
<html>

<head>
    <title>Student Details</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
            padding: 40px;
        }

        .card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
            text-align: center;
        }

        .profile-img {
            width: 160px;
            height: 160px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 4px solid #3f51b5;
        }

        h2 {
            color: #333;
        }

        p {
            margin: 8px 0;
            font-size: 18px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #3f51b5;
            color: white;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: white;
            background-color: #4caf50;
            padding: 10px 15px;
            border-radius: 6px;
        }

        a:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>

    <div class="card">
        <?php if ($student): ?>
            <img src="<?= $student['image'] ?? 'images/default.png' ?>" alt="Profile Image" class="profile-img">
            <h2><?= $student['name'] ?></h2>
            <p><strong>Course:</strong> <?= $student['course'] ?></p>
            <p><strong>Group:</strong> <?= $student['group'] ?></p>
            <p><strong>Major:</strong> <?= $student['major'] ?></p>

            <?php if (!empty($student['grades'])): ?>
                <h3>📘 Grades</h3>
                <table>
                    <tr>
                        <th>Subject</th>
                        <th>Grade</th>
                    </tr>
                    <?php foreach ($student['grades'] as $subject => $grade): ?>
                        <tr>
                            <td><?= $subject ?></td>
                            <td><?= $grade ?></td>
                        </tr>
                    <?php endforeach; ?>
                </table>
            <?php endif; ?>

            <a href="./">⬅️ Back to list</a>
        <?php else: ?>
            <h2 style="color:red;">Student not found 😕</h2>
        <?php endif; ?>
    </div>

</body>

</html>