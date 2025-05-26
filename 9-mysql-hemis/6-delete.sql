/*
 * ======================================================================
 *               UNIVERSITET MA'LUMOTLARINI O'CHIRISH SO'ROVLARI
 * ======================================================================
 *
 * Ushbu SQL so'rovlari universitet tizimi jadvallaridagi ma'lumotlarni
 * turli usullarda o'chirishni ko'rsatadi. Har bir so'rov maqsadi va
 * ta'siri tushuntirilgan. JOIN va subquery ishlatilmagan.
 * ======================================================================
 */

-- 1. BARCHA TALABALARNI O'CHIRISH
DELETE FROM students;
/*
 * Ta'sir: students jadvalidagi barcha yozuvlar o'chadi
 * Eslatma: Bu juda xavfli operatsiya, odatda WHERE sharti bilan ishlatiladi
 */

-- 2. MUAYYAN ID DAGI TALABANI O'CHIRISH
DELETE FROM students 
WHERE id = 5;
/*
 * Ta'sir: ID raqami 5 bo'lgan talaba o'chadi
 * Foydalanish: Muayyan talabani ro'yxatdan olib tashlash uchun
 */

-- 3. DI-303 GURUHIDAGI TALABALARNI O'CHIRISH
DELETE FROM students 
WHERE group_id = 1;
/*
 * Ta'sir: group_id 1 (DI-303) bo'lgan barcha talabalar o'chadi
 * Foydalanish: Muayyan guruhdagi talabalarni o'chirish uchun
 */

-- 4. 20 YOSHDAN KICHIK TALABALARNI O'CHIRISH
DELETE FROM students 
WHERE age < 20;
/*
 * Ta'sir: 20 yoshdan kichik barcha talabalar o'chadi
 * Foydalanish: Yosh chegarasiga ko'ra talabalarni filtrlash uchun
 */

-- 5. MUAYYAN GURUHNI O'CHIRISH
DELETE FROM `group` 
WHERE id = 3;
/*
 * Ta'sir: ID raqami 3 bo'lgan guruh (SI-201) o'chadi
 * Eslatma: Guruhga bog'langan talabalar oldin o'chirilishi kerak
 */

-- 6. DASTURIY INJINERING YO'NALISHINI O'CHIRISH
DELETE FROM direction 
WHERE id = 1;
/*
 * Ta'sir: ID raqami 1 bo'lgan yo'nalish (Dasturiy injinering) o'chadi
 * Eslatma: Bog'langan guruhlar va talabalar oldin o'chirilishi kerak
 */

-- 7. MUAYYAN FAKULTETNI O'CHIRISH
DELETE FROM faculty 
WHERE id = 2;
/*
 * Ta'sir: ID raqami 2 bo'lgan fakultet (Matematika fakulteti) o'chadi
 * Eslatma: Bog'langan yo'nalishlar, guruhlar va talabalar oldin o'chirilishi kerak
 */

-- 8. 1-KURSDAGI GURUHLARNI O'CHIRISH
DELETE FROM `group` 
WHERE course_year = 1;
/*
 * Ta'sir: 1-kursdagi barcha guruhlar o'chadi
 * Foydalanish: Muayyan kurs guruhlarini ro'yxatdan olib tashlash uchun
 */

-- 9. ISMI 'A' HARFI BILAN BOSHLANADIGAN TALABALARNI O'CHIRISH
DELETE FROM students 
WHERE name LIKE 'A%';
/*
 * Ta'sir: Ismi 'A' harfi bilan boshlanadigan barcha talabalar o'chadi
 * Foydalanish: Muayyan ism shartiga ko'ra talabalarni filtrlash uchun
 */

-- 10. TALABALAR JADVALINI TOZALASH
TRUNCATE TABLE students;
/*
 * Ta'sir: students jadvalidagi barcha ma'lumotlar tozalanadi
 * Farqi: DELETE dan farqli o'laroq, TRUNCATE jadval strukturasini saqlab qoladi
 * Eslatma: Bu juda xavfli operatsiya, qaytarib bo'lmaydi
 */