<?php

include 'config.php';
$db = new Database();

echo "<pre>";

// 1. executeQuery 
$result = $db->executeQuery("SELECT 
s.id AS student_id, 
s.name AS student_name, 
s.age AS student_age, 
u.name AS university_name, 
f.name AS faculty_name, 
d.name AS direction_name, 
g.course_year, 
g.name AS group_name
FROM `students` s 
INNER JOIN `group` g ON s.group_id = g.id
INNER JOIN `direction` d ON g.direction_id = d.id
INNER JOIN `faculty` f ON d.faculty_id = f.id
INNER JOIN `university`u ON f.university_id = u.id
ORDER BY u.name, f.name, d.name, g.name, s.name;
");
if ($result) {
    $data = $result->get_result()->fetch_all(MYSQLI_ASSOC);
    print_r($data);
}

// 2. select
$result = $db->select('students', 'id, name, age', "id % 2 = ? AND age > ? ORDER BY id DESC", [1, 18], "ii");
echo "<pre>";
print_r($result);


// 3. insert
echo "<br>";
$insertResult = $db->insert('students', [
    'name' => 'Iqbolshoh',
    'age' => 20,
    'group_id' => 1
]);
print_r($insertResult);

// 4. update
echo "<br>";
$updateResult = $db->update('students', ['name' => 'Iqbolshoh_777'], "id = ?", [36], "i");
print_r($updateResult);

// 5. delete
echo "<br>";
$deleteResult = $db->delete('students', "id = ?", [30], "i");
print_r($deleteResult);

echo "</pre>";