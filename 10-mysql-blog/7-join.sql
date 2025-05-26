/*
 * ======================================================================
 *               BLOG PLATFORMASIDA JOIN SO'ROVLARI
 * ======================================================================
 *
 * Ushbu SQL so'rovlari blog platformasining jadvallarini turli JOIN
 * usullari bilan birlashtirishni ko'rsatadi. Har bir JOIN turi va
 * uning ishlashi tushuntirilgan. So'rovlar users, posts va comments
 * jadvallarini qamrab oladi.
 * ======================================================================
 */

-- 1. INNER JOIN - FAQAT MOS KELUVCHI YOZUVLAR
SELECT 
    users.id AS user_id, 
    users.name, 
    posts.id AS post_id, 
    posts.title
FROM users
INNER JOIN posts ON users.id = posts.user_id;
/*
 * Natija: Faqat post yozgan foydalanuvchilar va ularning postlari (12 ta post)
 * Ishlash tartibi:
 * - users va posts jadvallarini birlashtiradi
 * - Faqat ikkala jadvalda ham mos keladigan user_id bo'lgan yozuvlarni oladi
 * Foydalanish: Faol foydalanuvchilar va ularning postlarini ko'rish uchun
 */

-- 2. LEFT JOIN - BARCHA FOYDALANUVCHILAR VA ULARNING POSTLARI
SELECT 
    users.id AS user_id, 
    users.name, 
    posts.id AS post_id, 
    posts.title
FROM users
LEFT JOIN posts ON users.id = posts.user_id;
/*
 * Natija: Barcha foydalanuvchilar (6 ta) va agar post yozgan bo'lsa ularning postlari
 * Ishlash tartibi:
 * - users jadvalidagi BARCHA yozuvlarni oladi
 * - posts jadvalidan mos keluvchi yozuvlarni qo'shadi
 * - Post bo'lmagan foydalanuvchilar uchun post maydonlari NULL bo'ladi
 * Foydalanish: Post yozmagan foydalanuvchilarni aniqlash uchun
 */

-- 3. RIGHT JOIN - BARCHA POSTLAR VA ULARNING MUALLIFLARI
SELECT 
    users.id AS user_id, 
    users.name, 
    posts.id AS post_id, 
    posts.title
FROM users
RIGHT JOIN posts ON users.id = posts.user_id;
/*
 * Natija: Barcha postlar (12 ta) va ularning mualliflari
 * Ishlash tartibi:
 * - posts jadvalidagi BARCHA yozuvlarni oladi
 * - users jadvalidan mos keluvchi yozuvlarni qo'shadi
 * - Muallif topilmasa (masalan, user o'chirilgan), user maydonlari NULL bo'ladi
 * Foydalanish: Barcha postlarni va ularning mualliflarini ko'rish uchun
 */

-- 4. FULL OUTER JOIN (MySQLda UNION bilan)
SELECT 
    users.id AS user_id, 
    users.name, 
    posts.id AS post_id, 
    posts.title
FROM users
LEFT JOIN posts ON users.id = posts.user_id
UNION
SELECT 
    users.id AS user_id, 
    users.name, 
    posts.id AS post_id, 
    posts.title
FROM users
RIGHT JOIN posts ON users.id = posts.user_id;
/*
 * Natija: Barcha foydalanuvchilar va barcha postlar, mos kelmaganlar NULL bilan
 * Ishlash tartibi:
 * - LEFT JOIN va RIGHT JOIN natijalarini birlashtiradi
 * - users yoki posts jadvalidagi BARCHA yozuvlarni oladi
 * - Mos kelmagan maydonlar NULL bilan to'ldiriladi
 * Foydalanish: To'liq ma'lumotlar holatini tahlil qilish uchun
 */

-- 5. MULTIPLE JOIN - FOYDALANUVCHILAR, POSTLAR VA IZOHLAR
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    posts.id AS post_id,
    posts.title AS post_title,
    comments.id AS comment_id,
    comments.content AS comment_text
FROM users
INNER JOIN posts ON users.id = posts.user_id
LEFT JOIN comments ON posts.id = comments.post_id;
/*
 * Natija: Post yozgan foydalanuvchilar, ularning postlari va izohlari
 * Ishlash tartibi:
 * - users va posts jadvallarini INNER JOIN qiladi
 * - comments jadvalidan izohlarni LEFT JOIN qiladi
 * - Izoh bo'lmagan postlar uchun comment maydonlari NULL bo'ladi
 * Foydalanish: Kontent va muhokamalarni to'liq ko'rish uchun
 */

-- 6. INNER JOIN - POSTLAR VA IZOH MUALLIFLARI
SELECT 
    posts.id AS post_id,
    posts.title AS post_title,
    users.id AS commenter_id,
    users.name AS commenter_name,
    comments.content AS comment_text
FROM posts
INNER JOIN comments ON posts.id = comments.post_id
INNER JOIN users ON comments.user_id = users.id;
/*
 * Natija: Faqat izoh yozilgan postlar va izoh mualliflarining ma'lumotlari
 * Ishlash tartibi:
 * - posts va comments jadvallarini birlashtiradi
 * - comments va users jadvallarini birlashtiradi
 * - Faqat izoh bo'lgan postlar ko'rsatiladi
 * Foydalanish: Izoh yozuvchilar va ularning faoliyatini tahlil qilish uchun
 */

-- 7. LEFT JOIN - POSTLAR VA ULARGA YOZILGAN IZOHLAR
SELECT 
    posts.id AS post_id,
    posts.title,
    COUNT(comments.id) AS comment_count
FROM posts
LEFT JOIN comments ON posts.id = comments.post_id
GROUP BY posts.id, posts.title
ORDER BY comment_count DESC;
/*
 * Natija: Barcha postlar va ularga yozilgan izohlar soni (izohsizlar uchun 0)
 * Ishlash tartibi:
 * - posts jadvalidagi barcha postlarni oladi
 * - comments jadvalidan mos izohlarni qo'shadi
 * - GROUP BY bilan har bir post uchun izohlar sonini hisoblaydi
 * Foydalanish: Eng faol postlarni aniqlash uchun
 */

-- 8. RIGHT JOIN - IZOHLAR VA ULAR YOZILGAN POSTLAR
SELECT 
    comments.id AS comment_id,
    comments.content AS comment_text,
    posts.id AS post_id,
    posts.title AS post_title
FROM comments
RIGHT JOIN posts ON comments.post_id = posts.id;
/*
 * Natija: Barcha postlar va ularga yozilgan izohlar, izohsiz postlar ham kiradi
 * Ishlash tartibi:
 * - posts jadvalidagi barcha yozuvlarni oladi
 * - comments jadvalidan mos keluvchi izohlarni qo'shadi
 * - Izoh bo'lmagan postlar uchun comment maydonlari NULL bo'ladi
 * Foydalanish: Izohsiz postlarni aniqlash uchun
 */

-- 9. LEFT JOIN - FOYDALANUVCHILAR VA ULARNING IZOHLARI
SELECT 
    users.id AS user_id,
    users.name,
    COUNT(comments.id) AS comment_count
FROM users
LEFT JOIN comments ON users.id = comments.user_id
GROUP BY users.id, users.name
ORDER BY comment_count DESC;
/*
 * Natija: Barcha foydalanuvchilar va ular yozgan izohlar soni (izohsizlar uchun 0)
 * Ishlash tartibi:
 * - users jadvalidagi barcha foydalanuvchilarni oladi
 * - comments jadvalidan mos izohlarni qo'shadi
 * - GROUP BY bilan har bir foydalanuvchi uchun izohlar sonini hisoblaydi
 * Foydalanish: Eng faol izoh yozuvchilarni aniqlash uchun
 */

-- 10. MULTIPLE INNER JOIN - TO'LIQ MUHOKAMA TAHLILI
SELECT 
    posts.id AS post_id,
    posts.title AS post_title,
    users_p.name AS post_author,
    users_c.name AS commenter_name,
    comments.content AS comment_text
FROM posts
INNER JOIN users AS users_p ON posts.user_id = users_p.id
INNER JOIN comments ON posts.id = comments.post_id
INNER JOIN users AS users_c ON comments.user_id = users_c.id;
/*
 * Natija: Postlar, ularning mualliflari va izoh yozgan foydalanuvchilar
 * Ishlash tartibi:
 * - posts va users (post muallifi sifatida) jadvallarini birlashtiradi
 * - comments jadvalidan izohlarni qo'shadi
 * - users (izoh muallifi sifatida) jadvalidan izoh yozuvchilarni qo'shadi
 * Foydalanish: Postlar va muhokama ishtirokchilarini to'liq ko'rish uchun
 */