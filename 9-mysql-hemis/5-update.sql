/*
 * ======================================================================
 *               UNIVERSITET MA'LUMOTLARINI YANGILASH SO'ROVLARI
 * ======================================================================
 *
 * Ushbu SQL so'rovlari universitet tizimi jadvallaridagi ma'lumotlarni
 * turli usullarda yangilashni ko'rsatadi. Har bir so'rov maqsadi va
 * ta'siri tushuntirilgan. JOIN operatsiyalari ishlatilmagan.
 * ======================================================================
 */

-- 1. UNIVERSITET NOMINI YANGILASH
UPDATE university
SET name = 'Samarqand Davlat Universiteti'
WHERE id = 1;
/*
 * Ta'sir: 1-IDli universitet nomi yangilanadi
 * Eslatma: To'g'ri yozuvni ta'minlash uchun
 */

-- 2. FAKULTET NOMINI VA UNIVERSITETINI YANGILASH
UPDATE faculty
SET 
    name = 'Axborot Texnologiyalari Fakulteti',
    university_id = 1
WHERE id = 1;
/*
 * Ta'sir: 1-IDli fakultet nomi va universitet bog'liqligi yangilanadi
 * Diqqat: university_id mavjud universitetga tegishli bo'lishi kerak
 */

-- 3. YO'NALISH NOMINI YANGILASH
UPDATE direction
SET name = 'Dasturiy Injinering va Sun''iy Intellekt'
WHERE id = 1;
/*
 * Ta'sir: 1-IDli yo'nalish nomi yangilanadi
 * Maqsad: Yo'nalish nomini zamonaviy talablarga moslashtirish
 */

-- 4. GURUH NOMINI VA KURSINI YANGILASH
UPDATE `group`
SET 
    name = 'DI-303-A',
    course_year = 4
WHERE id = 1;
/*
 * Ta'sir: 1-IDli guruh nomi va kursi yangilanadi
 * Eslatma: Guruh nomi standart formatda bo'lishi kerak
 */

-- 5. TALABA MA'LUMOTLARINI YANGILASH
UPDATE students
SET 
    name = 'Iqbolshoh Ilhomjonov Ikromjonovich',
    age = 23,
    group_id = 2
WHERE id = 1;
/*
 * Ta'sir: 1-IDli talabaning ismi, yoshi va guruhi yangilanadi
 * Diqqat: group_id mavjud guruhga tegishli bo'lishi kerak
 */

-- 6. BIR NECHTA TALABALARNING GURUHINI YANGILASH
UPDATE students
SET group_id = 8  -- TF-201 guruhi
WHERE group_id = 2;
/*
 * Ta'sir: 2-IDli guruhdagi barcha talabalar 8-IDli guruhga o'tkaziladi
 * Maqsad: Talabalarni yangi guruhga o'tkazish
 */

-- 7. BERILGAN GURUHDAGI BARCHA TALABALARNING YOSHINI YANGILASH
UPDATE students
SET age = age + 1  -- Har bir talaba yoshini 1 ga oshiradi
WHERE group_id = 3;  -- SI-201 guruhi
/*
 * Ta'sir: 3-IDli guruhdagi barcha talabalar yoshi 1 yoshga oshadi
 * Maqsad: Yangi o'quv yili boshlanganda yoshlarni yangilash
 */

-- 8. BUXORO DAVLAT UNIVERSITETIDAGI FAKULTET NOMINI YANGILASH
UPDATE faculty
SET name = 'Kimyo va Biologiya Fakulteti'
WHERE id = 4;
/*
 * Ta'sir: 4-IDli fakultet nomi yangilanadi
 * Maqsad: Fakultet nomini kengaytirilgan yo'nalishlarga moslashtirish
 */

-- 9. MUAYYAN YO'NALISHDA GI GURUHLARNING KURSINI YANGILASH
UPDATE `group`
SET course_year = 2
WHERE direction_id = 5 AND course_year = 1;  -- Tojik Filologiyasi, 1-kurs
/*
 * Ta'sir: Tojik Filologiyasi yo'nalishidagi 1-kurs guruhlari 2-kursga o'tkaziladi
 * Maqsad: Guruhlar kursini yangi o'quv yiliga ko'ra yangilash
 */

-- 10. MUAYYAN YOSHDAGI TALABALARNING GURUHINI YANGILASH
UPDATE students
SET group_id = 15  -- SI-101 guruhi
WHERE age = 18;
/*
 * Ta'sir: 18 yoshdagi barcha talabalar SI-101 guruhiga o'tkaziladi
 * Maqsad: Yosh bo'yicha talabalarni yangi guruhga ko'chirish
 */