<?php
/*
|--------------------------------------------------------------------------
| HEMIS MA'LUMOTLAR BAZASIDAN MA'LUMOTLARNI CHIQARISH
|--------------------------------------------------------------------------
| Barcha asosiy jadvallarni: university, faculty, direction, group, students
| chiroyli va toza HTML sahifada ko'rsatadi.
*/

/*----------------------------------------
| 1. MYSQL BAZASIGA ULANISH
|----------------------------------------*/
define("DB_SERVER", "localhost");
define("DB_USERNAME", "root");
define("DB_PASSWORD", "");
define("DB_NAME", "hemis");

$conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

if (!$conn) {
    die("❌ Baza bilan ulanishda xatolik: " . mysqli_connect_error());
}

/*----------------------------------------
| 2. BARCHA MA'LUMOTLARNI OLIB KELISH
|----------------------------------------*/
$universities = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM `university`"), MYSQLI_ASSOC);
$faculties = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM `faculty`"), MYSQLI_ASSOC);
$directions = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM `direction`"), MYSQLI_ASSOC);
$groups = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM `group`"), MYSQLI_ASSOC);
$students = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM `students`"), MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <title>HEMIS Ma'lumotlar</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { color: #2c3e50; text-align: center; }
        h2 { color: #3498db; border-bottom: 2px solid #3498db; padding-bottom: 5px; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        th, td { padding: 10px; text-align: left; border: 1px solid #ddd; }
        th { background-color: #3498db; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        tr:hover { background-color: #e6f7ff; }
    </style>
</head>
<body>
    <h1>HEMIS Ma'lumotlar Bazasi</h1>

    <!-- Universitetlar jadvali -->
    <h2>Universitetlar</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nomi</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($universities as $university): ?>
                <tr>
                    <td><?= $university['id'] ?></td>
                    <td><?= htmlspecialchars($university['name']) ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <!-- Fakultetlar jadvali -->
    <h2>Fakultetlar</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nomi</th>
                <th>Universitet ID</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($faculties as $faculty): ?>
                <tr>
                    <td><?= $faculty['id'] ?></td>
                    <td><?= htmlspecialchars($faculty['name']) ?></td>
                    <td><?= $faculty['university_id'] ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <!-- Yo'nalishlar jadvali -->
    <h2>Yo'nalishlar</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nomi</th>
                <th>Fakultet ID</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($directions as $direction): ?>
                <tr>
                    <td><?= $direction['id'] ?></td>
                    <td><?= htmlspecialchars($direction['name']) ?></td>
                    <td><?= $direction['faculty_id'] ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <!-- Guruhlar jadvali -->
    <h2>Guruhlar</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nomi</th>
                <th>Kurs</th>
                <th>Yo'nalish ID</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($groups as $group): ?>
                <tr>
                    <td><?= $group['id'] ?></td>
                    <td><?= htmlspecialchars($group['name']) ?></td>
                    <td><?= $group['course_year'] ?></td>
                    <td><?= $group['direction_id'] ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <!-- Talabalar jadvali -->
    <h2>Talabalar</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Ism</th>
                <th>Yosh</th>
                <th>Guruh ID</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($students as $student): ?>
                <tr>
                    <td><?= $student['id'] ?></td>
                    <td><?= htmlspecialchars($student['name']) ?></td>
                    <td><?= $student['age'] ?></td>
                    <td><?= $student['group_id'] ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

</body>
</html>

<?php
/*----------------------------------------
| 4. ULANISHNI YOPISH
|----------------------------------------*/
mysqli_close($conn);
?>