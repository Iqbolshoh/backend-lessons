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

$students = mysqli_fetch_all(mysqli_query($conn, "
    SELECT 
        s.id AS student_id,
        s.name AS student_name,
        s.age AS student_age,
        u.name AS university_name,
        f.name AS faculty_name,
        d.name AS direction_name,
        g.name AS group_name
    FROM students s
    LEFT JOIN `group` g ON s.group_id = g.id
    LEFT JOIN direction d ON g.direction_id = d.id
    LEFT JOIN faculty f ON d.faculty_id = f.id
    LEFT JOIN university u ON f.university_id = u.id
"), MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>HEMIS Ma'lumotlar</title>
    <style>
        h2,
        th {
            color: #2c3e50
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f7fa;
            color: #333
        }

        .section,
        h2 {
            margin-bottom: 30px
        }

        h2 {
            text-align: center;
            padding-bottom: 10px;
            border-bottom: 2px solid #3498db
        }

        .section {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, .1);
            overflow: hidden
        }

        .section-title {
            background-color: #3498db;
            color: #fff;
            padding: 12px 20px;
            cursor: pointer;
            font-weight: 700;
            display: flex;
            justify-content: space-between;
            align-items: center
        }

        .section-title:hover {
            background-color: #2980b9
        }

        .section-title::after {
            content: "▼";
            font-size: 12px;
            transition: transform .3s
        }

        .section-title.collapsed::after {
            transform: rotate(-90deg)
        }

        .table-wrapper {
            overflow-x: auto;
            transition: max-height .3s
        }

        .collapsed+.table-wrapper {
            max-height: 0;
            overflow: hidden
        }

        table {
            width: 100%;
            border-collapse: collapse
        }

        td,
        th {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0
        }

        th {
            background-color: #f8f9fa;
            position: sticky;
            top: 0;
            font-weight: 600
        }

        tr {
            transition: background-color .2s
        }

        tr:not(:first-child):hover {
            background-color: #f1f8ff;
            cursor: pointer
        }

        tr.details-row {
            background-color: #f8fafc;
            display: none
        }

        tr.details-row td {
            padding: 15px 20px;
            color: #555
        }

        .toggle-icon {
            margin-right: 8px;
            display: inline-block;
            transition: transform .3s
        }

        .expanded .toggle-icon {
            transform: rotate(90deg)
        }

        @media (max-width:768px) {

            td,
            th {
                padding: 8px 10px;
                font-size: 14px
            }
        }
    </style>
</head>

<body>

    <h2>📚 HEMIS Ma'lumotlar Bazasi</h2>

    <!-- Universitetlar -->
    <div class="section">
        <div class="section-title" onclick="toggleSection(this)">Universitetlar</div>
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nomi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($universities as $index => $u): ?>
                        <tr onclick="toggleDetails(<?= $index ?>, 'university')">
                            <td><?= $u['id'] ?></td>
                            <td><?= htmlspecialchars($u['name']) ?></td>
                        </tr>
                        <tr id="details-university-<?= $index ?>" class="details-row">
                            <td colspan="2">
                                <strong>Qo'shimcha ma'lumot:</strong><br>
                                Universitet ID: <?= $u['id'] ?><br>
                                Nomi: <?= htmlspecialchars($u['name']) ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Fakultetlar -->
    <div class="section">
        <div class="section-title" onclick="toggleSection(this)">Fakultetlar</div>
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nomi</th>
                        <th>Universitet ID</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($faculties as $index => $f): ?>
                        <tr onclick="toggleDetails(<?= $index ?>, 'faculty')">
                            <td><?= $f['id'] ?></td>
                            <td><?= htmlspecialchars($f['name']) ?></td>
                            <td><?= $f['university_id'] ?></td>
                        </tr>
                        <tr id="details-faculty-<?= $index ?>" class="details-row">
                            <td colspan="3">
                                <strong>Qo'shimcha ma'lumot:</strong><br>
                                Fakultet ID: <?= $f['id'] ?><br>
                                Nomi: <?= htmlspecialchars($f['name']) ?><br>
                                Universitet ID: <?= $f['university_id'] ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Yo'nalishlar -->
    <div class="section">
        <div class="section-title" onclick="toggleSection(this)">Yo'nalishlar</div>
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nomi</th>
                        <th>Fakultet ID</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($directions as $index => $d): ?>
                        <tr onclick="toggleDetails(<?= $index ?>, 'direction')">
                            <td><?= $d['id'] ?></td>
                            <td><?= htmlspecialchars($d['name']) ?></td>
                            <td><?= $d['faculty_id'] ?></td>
                        </tr>
                        <tr id="details-direction-<?= $index ?>" class="details-row">
                            <td colspan="3">
                                <strong>Qo'shimcha ma'lumot:</strong><br>
                                Yo'nalish ID: <?= $d['id'] ?><br>
                                Nomi: <?= htmlspecialchars($d['name']) ?><br>
                                Fakultet ID: <?= $d['faculty_id'] ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Guruhlar -->
    <div class="section">
        <div class="section-title" onclick="toggleSection(this)">Guruhlar</div>
        <div class="table-wrapper">
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
                    <?php foreach ($groups as $index => $g): ?>
                        <tr onclick="toggleDetails(<?= $index ?>, 'group')">
                            <td><?= $g['id'] ?></td>
                            <td><?= htmlspecialchars($g['name']) ?></td>
                            <td><?= $g['course_year'] ?></td>
                            <td><?= $g['direction_id'] ?></td>
                        </tr>
                        <tr id="details-group-<?= $index ?>" class="details-row">
                            <td colspan="4">
                                <strong>Qo'shimcha ma'lumot:</strong><br>
                                Guruh ID: <?= $g['id'] ?><br>
                                Nomi: <?= htmlspecialchars($g['name']) ?><br>
                                Kurs: <?= $g['course_year'] ?><br>
                                Yo'nalish ID: <?= $g['direction_id'] ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Talabalar -->
    <div class="section">
        <div class="section-title" onclick="toggleSection(this)">Talabalar</div>
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Ism</th>
                        <th>Yosh</th>
                        <th>Universitet</th>
                        <th>Fakultet</th>
                        <th>Yo'nalish</th>
                        <th>Guruh</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($students as $index => $s): ?>
                        <tr onclick="toggleDetails(<?= $index ?>, 'student')">
                            <td><?= $s['student_id'] ?></td>
                            <td><?= htmlspecialchars($s['student_name']) ?></td>
                            <td><?= $s['student_age'] ?></td>
                            <td><?= htmlspecialchars($s['university_name']) ?></td>
                            <td><?= htmlspecialchars($s['faculty_name']) ?></td>
                            <td><?= htmlspecialchars($s['direction_name']) ?></td>
                            <td><?= htmlspecialchars($s['group_name']) ?></td>
                        </tr>
                        <tr id="details-student-<?= $index ?>" class="details-row">
                            <td colspan="7">
                                <strong>Qo'shimcha ma'lumot:</strong><br>
                                Talaba ID: <?= $s['student_id'] ?><br>
                                Ism: <?= htmlspecialchars($s['student_name']) ?><br>
                                Yosh: <?= $s['student_age'] ?><br>
                                Universitet: <?= htmlspecialchars($s['university_name']) ?><br>
                                Fakultet: <?= htmlspecialchars($s['faculty_name']) ?><br>
                                Yo'nalish: <?= htmlspecialchars($s['direction_name']) ?><br>
                                Guruh: <?= htmlspecialchars($s['group_name']) ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function toggleSection(element) {
            element.classList.toggle('collapsed');
            element.nextElementSibling.classList.toggle('collapsed');
        }
        function toggleDetails(index, type) {
            const row = document.getElementById(`details-${type}-${index}`);
            if (row.style.display === 'table-row') {
                row.style.display = 'none';
            } else {
                document.querySelectorAll('.details-row').forEach(r => {
                    if (r.id !== `details-${type}-${index}`) {
                        r.style.display = 'none';
                    }
                });
                row.style.display = 'table-row';
            }
        }
        document.addEventListener('DOMContentLoaded', function () {
            const rows = document.querySelectorAll('tr:not(.details-row)');
            rows.forEach(row => {
                row.addEventListener('mouseenter', function () {
                    this.style.backgroundColor = '#f1f8ff';
                });
                row.addEventListener('mouseleave', function () {
                    this.style.backgroundColor = '';
                });
            });
        });
    </script>
</body>

</html>

<?php
/*----------------------------------------
| 4. ULANISHNI YOPISH
|----------------------------------------*/
mysqli_close($conn);
?>