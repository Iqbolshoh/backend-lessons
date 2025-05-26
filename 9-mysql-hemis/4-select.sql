/*
 * ======================================================================
 *               UNIVERSITET MA'LUMOTLARINI OLISH SO'ROVLARI
 * ======================================================================
 *
 * Ushbu SQL so'rovlari universitet tizimi jadvallaridan turli usullarda
 * ma'lumot olishni ko'rsatadi. Har bir so'rov oddiy SELECT va WHERE 
 * operatorlari yordamida yozilgan, JOIN ishlatilmagan. Har bir so'rovning 
 * maqsadi va ishlashi tushuntirilgan.
 * ======================================================================
 */

-- 1. BARCHA UNIVERSITETLAR RO'YXATI
SELECT id, name 
FROM university;
/*
 * Natija: Barcha universitetlarning to'liq ma'lumotlari
 * Foydalanish: Platformadagi barcha universitetlarni ko'rish uchun
 */

-- 2. SAMDU UNIVERSITETIGA TEGISHLI FAKULTETLAR
SELECT `id`, `name` 
FROM faculty 
WHERE university_id = 1;
/*
 * Natija: Samarkand davlat universitetiga tegishli fakultetlar
 * Foydalanish: Muayyan universitetning fakultetlarini ko'rish uchun
 */

-- 3. IT FAKULTETIDAGI YO'NALISHLAR
SELECT id, name 
FROM direction 
WHERE faculty_id = 1;
/*
 * Natija: Intellektual tizimlar va kompyuter texnologiyalari fakultetidagi yo'nalishlar
 * Foydalanish: Fakultet bo'yicha mutaxassisliklarni ko'rish uchun
 */

-- 4. DASTURIY INJINERING YO'NALISHIDAGI GURUHLAR
SELECT id, name, course_year 
FROM `group` 
WHERE direction_id = 1;
/*
 * Natija: Dasturiy injinering yo'nalishidagi barcha guruhlar
 * Foydalanish: Muayyan yo'nalishdagi guruhlarni ko'rish uchun
 */

-- 5. 1-KURSDAGI GURUHLAR
SELECT name, direction_id 
FROM `group` 
WHERE course_year = 1 
ORDER BY name;
/*
 * Natija: 1-kursdagi barcha guruhlar, nom bo'yicha saralangan
 * Foydalanish: Muayyan kursdagi guruhlarni ko'rish uchun
 */

-- 6. 20 YOSHDAN KATTA TALABALAR
SELECT name, age, group_id 
FROM students 
WHERE age >= 20 
ORDER BY age DESC, name;
/*
 * Natija: 20 yosh va undan katta talabalar, yosh bo'yicha kamayish tartibida
 * Foydalanish: Muayyan yoshdagi talabalarni filtr qilish uchun
 */

-- 7. DI-303 GURUHIDAGI TALABALAR
SELECT name, age 
FROM students 
WHERE group_id = 1 
ORDER BY name;
/*
 * Natija: DI-303 guruhidagi talabalar ro'yxati, nom bo'yicha saralangan
 * Foydalanish: Muayyan guruhdagi talabalarni ko'rish uchun
 */

-- 8. BUXORO DAVLAT UNIVERSITETIDAGI FAKULTETLAR
SELECT id, name 
FROM faculty 
WHERE university_id = 2;
/*
 * Natija: Buxoro davlat universitetiga tegishli fakultetlar
 * Foydalanish: Boshqa universitetning fakultetlarini ko'rish uchun
 */

-- 9. TALABALAR SONI GURUH BO'YICHA
SELECT group_id, COUNT(*) AS student_count 
FROM students 
GROUP BY group_id 
ORDER BY student_count DESC;
/*
 * Natija: Har bir guruhdagi talabalar soni, kamayish tartibida
 * Foydalanish: Guruhlar bo'yicha talabalar statistikasini ko'rish uchun
 */

-- 10. KIMYO YO'NALISHIDAGI GURUHLAR
SELECT name, course_year 
FROM `group` 
WHERE direction_id = 7 
ORDER BY course_year;
/*
 * Natija: Kimyo yo'nalishidagi guruhlar, kurs bo'yicha saralangan
 * Foydalanish: Muayyan yo'nalishdagi guruhlar haqida ma'lumot olish uchun
 */