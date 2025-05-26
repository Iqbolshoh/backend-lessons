/*
 * ======================================================================
 *                 UNIVERSITET MA'LUMOTLARINI JOIN SO'ROVLARI
 * ======================================================================
 *
 * Ushbu SQL so'rovlari universitet tizimi jadvallaridagi ma'lumotlarni
 * INNER JOIN, LEFT JOIN, RIGHT JOIN va FULL JOIN operatorlari yordamida
 * birlashtiradi. Har bir so'rov maqsadi va natijasi tushuntirilgan.
 * So'rovlar talabalar, guruhlar, yo'nalishlar, fakultetlar va universitetlar
 * o'rtasidagi bog'lanishlarni ko'rsatadi.
 * ======================================================================
 */

-- 1. INNER JOIN: TALABALAR VA GURUHLAR
SELECT s.name AS student_name, g.name AS group_name
FROM students s
INNER JOIN `group` g ON s.group_id = g.id
WHERE g.course_year = 1
ORDER BY s.name;
/*
 * Natija: 1-kursdagi talabalar va ularning guruh nomlari
 * Maqsad: Faqat guruhga ega talabalarni ko'rsatish
 */

-- 2. INNER JOIN: GURUHLAR VA YO'NALISHLAR
SELECT g.name AS group_name, d.name AS direction_name
FROM `group` g
INNER JOIN direction d ON g.direction_id = d.id
WHERE d.id = 1
ORDER BY g.name;
/*
 * Natija: Dasturiy injinering yo'nalishidagi guruhlar
 * Maqsad: Muayyan yo'nalishdagi guruhlarni ko'rsatish
 */

-- 3. INNER JOIN: FAKULTETLAR, YO'NALISHLAR VA GURUHLAR
SELECT f.name AS faculty_name, d.name AS direction_name, g.name AS group_name
FROM faculty f
INNER JOIN direction d ON d.faculty_id = f.id
INNER JOIN `group` g ON g.direction_id = d.id
WHERE f.university_id = 1
ORDER BY g.name;
/*
 * Natija: SamDU fakultetlari, yo'nalishlari va guruhlari
 * Maqsad: Universitet bo'yicha tuzilmani ko'rsatish
 */

-- 4. LEFT JOIN: BARCHA GURUHLAR VA ULARGA TEGISHLI TALABALAR
SELECT g.name AS group_name, COUNT(s.id) AS student_count
FROM `group` g
LEFT JOIN students s ON s.group_id = g.id
GROUP BY g.id, g.name
ORDER BY g.name;
/*
 * Natija: Barcha guruhlar va ulardagi talabalar soni (talabasiz guruhlar uchun 0)
 * Maqsad: Guruhlar bo'yicha talabalar statistikasini ko'rish
 */

-- 5. LEFT JOIN: BARCHA YO'NALISHLAR VA ULARGA TEGISHLI GURUHLAR
SELECT d.name AS direction_name, g.name AS group_name
FROM direction d
LEFT JOIN `group` g ON g.direction_id = d.id
WHERE d.faculty_id = 1
ORDER BY d.name, g.name;
/*
 * Natija: IT fakulteti yo'nalishlari va ularga tegishli guruhlar (guruhsiz yo'nalishlar ham kiritiladi)
 * Maqsad: Yo'nalishlar va guruhlar bog'lanishini ko'rsatish
 */

-- 6. LEFT JOIN: FAKULTETLAR VA TALABALAR
SELECT f.name AS faculty_name, COUNT(s.id) AS student_count
FROM faculty f
LEFT JOIN direction d ON d.faculty_id = f.id
LEFT JOIN `group` g ON g.direction_id = d.id
LEFT JOIN students s ON s.group_id = g.id
GROUP BY f.id, f.name
ORDER BY f.name;
/*
 * Natija: Har bir fakultetdagi talabalar soni (talabasiz fakultetlar uchun 0)
 * Maqsad: Fakultetlar bo'yicha talabalar statistikasini ko'rish
 */

-- 7. RIGHT JOIN: BARCHA GURUHLAR VA ULARGA TEGISHLI TALABALAR
SELECT g.name AS group_name, s.name AS student_name
FROM students s
RIGHT JOIN `group` g ON s.group_id = g.id
WHERE g.course_year = 2
ORDER BY g.name, s.name;
/*
 * Natija: 2-kursdagi barcha guruhlar va ulardagi talabalar (talabasiz guruhlar ham kiritiladi)
 * Maqsad: Guruhlar va talabalar bog'lanishini ko'rsatish
 */

-- 8. RIGHT JOIN: YO'NALISHLAR VA GURUHLAR
SELECT d.name AS direction_name, g.name AS group_name
FROM `group` g
RIGHT JOIN direction d ON g.direction_id = d.id
WHERE d.faculty_id = 3
ORDER BY d.name, g.name;
/*
 * Natija: Filologiya fakulteti yo'nalishlari va ularga tegishli guruhlar (guruhsiz yo'nalishlar kiritiladi)
 * Maqsad: Yo'nalishlar va guruhlar tuzilmasini ko'rsatish
 */

-- 9. FULL JOIN (EMULATED): UNIVERSITETLAR VA FAKULTETLAR
SELECT u.name AS university_name, f.name AS faculty_name
FROM university u
LEFT JOIN faculty f ON f.university_id = u.id
UNION
SELECT u.name AS university_name, f.name AS faculty_name
FROM university u
RIGHT JOIN faculty f ON f.university_id = u.id
WHERE u.id IS NULL
ORDER BY university_name, faculty_name;
/*
 * Natija: Barcha universitetlar va fakultetlar (fakultetsiz universitetlar va universiteitsiz fakultetlar ham kiritiladi)
 * Maqsad: Universitet va fakultetlar bog'lanishini to'liq ko'rsatish
 */
 
-- 10. FULL JOIN (EMULATED): GURUHLAR VA TALABALAR
SELECT g.name AS group_name, COUNT(s.id) AS student_count
FROM `group` g
LEFT JOIN students s ON s.group_id = g.id
GROUP BY g.id, g.name
UNION
SELECT NULL AS group_name, COUNT(s.id) AS student_count
FROM students s
WHERE s.group_id IS NULL
ORDER BY group_name;
/*
 * Natija: Barcha guruhlar va ulardagi talabalar soni (talabasiz guruhlar va guruhsiz talabalar kiritiladi)
 * Maqsad: To'liq guruh-talaba statistikasini ko'rsatish
 */