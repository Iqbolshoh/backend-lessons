/*
 * ======================================================================
 *               BLOG PLATFORMASIDAN MA'LUMOT OLISH SO'ROVLARI
 * ======================================================================
 *
 * Ushbu SQL so'rovlari blog platformasining asosiy jadvallaridan turli 
 * usullarda ma'lumot olishni ko'rsatadi. Har bir so'rov faqat SELECT va 
 * WHERE operatorlaridan foydalanadi, JOIN yoki subquery ishlatilmaydi. 
 * So'rovlar users, posts va comments jadvallarini qamrab oladi va 
 * real hayotga mos natijalar beradi.
 * ======================================================================
 */

-- 1. BARCHA FOYDALANUVCHILAR ISMI VA EMAIL
SELECT name, email 
FROM users 
ORDER BY name;
/*
 * Natija: Barcha foydalanuvchilarning ismi va email manzillari, ism bo'yicha saralangan
 * Maqsad: Tizimdagi ro'yxatdan o'tgan foydalanuvchilarning kontakt ma'lumotlarini ko'rish
 */

-- 2. SO'NGGI YARATILGAN 5 TA FOYDALANUVCHI
SELECT name, email, created_at 
FROM users 
ORDER BY created_at DESC 
LIMIT 5;
/*
 * Natija: Eng so'nggi ro'yxatdan o'tgan 5 ta foydalanuvchi
 * Maqsad: Yangi foydalanuvchilar faoliyatini kuzatish
 */

-- 3. BARCHA POSTLAR SARLAVHASI VA YARATILGAN VAQTI
SELECT title, created_at 
FROM posts 
ORDER BY created_at DESC;
/*
 * Natija: Barcha postlarning sarlavhalari va yaratilgan vaqtlari
 * Maqsad: Platformadagi yangi kontentni ko'rib chiqish
 */

-- 4. MUAYYAN FOYDALANUVCHINING POSTLARI (ID=1)
SELECT title, body, created_at 
FROM posts 
WHERE user_id = 1 
ORDER BY created_at DESC;
/*
 * Natija: ID=1 (Ilhomjonov Iqbolshoh) foydalanuvchi yozgan postlar
 * Maqsad: Muayyan muallifning barcha maqolalarini ko'rish
 */

-- 5. DASTURLASH MAVZUSIDAGI POSTLAR
SELECT title, body 
FROM posts 
WHERE title LIKE '%Dasturlash%' 
ORDER BY title;
/*
 * Natija: Sarlavhasida "Dasturlash" so'zi bo'lgan postlar
 * Maqsad: Muayyan mavzudagi postlarni filtr qilish
 */

-- 6. BARCHA IZOHLAR VA ULARNING POST IDsI
SELECT post_id, content, created_at 
FROM comments 
ORDER BY created_at DESC;
/*
 * Natija: Barcha izohlar, ularning post IDsI va yaratilgan vaqti
 * Maqsad: Tizimdagi barcha fikr-mulohazalarni ko'rish
 */

-- 7. MUAYYAN POSTGA YOZILGAN IZOHLAR (ID=3)
SELECT content, created_at 
FROM comments 
WHERE post_id = 3 
ORDER BY created_at;
/*
 * Natija: ID=3 ("Web dizayn trendlari 2025") postiga yozilgan izohlar
 * Maqsad: Muayyan postdagi muhokamalarni ko'rish
 */

-- 8. MUAYYAN FOYDALANUVCHINING IZOHLARI (ID=2)
SELECT post_id, content, created_at 
FROM comments 
WHERE user_id = 2 
ORDER BY created_at DESC;
/*
 * Natija: ID=2 (Nigora Karimova) foydalanuvchi yozgan izohlar
 * Maqsad: Muayyan foydalanuvchining izoh faoliyatini ko'rish
 */

-- 9. SO'NGGI 3 OYDA YOZILGAN IZOHLAR
SELECT post_id, content, created_at 
FROM comments 
WHERE created_at >= DATE_SUB(CURRENT_DATE, INTERVAL 3 MONTH) 
ORDER BY created_at DESC;
/*
 * Natija: Oxirgi 3 oyda yozilgan izohlar va ularning post IDsI
 * Maqsad: Eng yangi izoh faoliyatini tahlil qilish
 */

-- 10. POSTLAR BO'YICHA IZOHLAR SONI
SELECT post_id, COUNT(id) AS comment_count 
FROM comments 
GROUP BY post_id 
ORDER BY comment_count DESC;
/*
 * Natija: Har bir postga yozilgan izohlar soni
 * Maqsad: Eng faol muhokama bo'lgan postlarni aniqlash
 */