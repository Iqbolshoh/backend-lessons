/*
 * ======================================================================
 *               BLOG PLATFORMASIDA MA'LUMOTLARNI O'CHIRISH
 * ======================================================================
 *
 * Ushbu SQL so'rovlari blog platformasining jadvallaridagi ma'lumotlarni
 * turli darajada o'chirishni ko'rsatadi. Har bir so'rov xavf darajasi bilan
 * birga tushuntirilgan.
 * ======================================================================
 */

-- 1. BITTA IZOHNI ID BO'YICHA O'CHIRISH
DELETE FROM comments
WHERE id = 3;
/*
 * Ta'sir: Faqat 3-IDli izoh o'chiriladi
 * Xavf darajasi: Past - bitta izohning yo'qolishi
 * Eslatma: Bu boshqa ma'lumotlarga ta'sir qilmaydi
 */

-- 2. BITTA POSTNI VA UNGA TEGISHLI IZOHLARNI O'CHIRISH
DELETE FROM posts
WHERE id = 2;
/*
 * Ta'sir: 2-IDli post va unga yozilgan barcha izohlar o'chiriladi
 * Xavf darajasi: O'rta - post va uning izohlari yo'qoladi
 * Mexanizm: ON DELETE CASCADE bog'liqlik tufayli izohlar avtomatik o'chadi
 */

-- 3. BITTA FOYDALANUVCHINI VA UNING KONTENTINI O'CHIRISH
DELETE FROM users
WHERE id = 3;
/*
 * Ta'sir: 3-IDli foydalanuvchi, uning postlari va izohlari o'chiriladi
 * Xavf darajasi: Yuqori - foydalanuvchi va uning barcha kontenti yo'qoladi
 * Mexanizm: CASCADE bog'liqliklar tufayli bog'liq ma'lumotlar avtomatik o'chadi
 */

-- 4. BIR NECHTA IZOHLARNI POST_ID BO'YICHA O'CHIRISH
DELETE FROM comments
WHERE post_id = 7;
/*
 * Ta'sir: 7-IDli postga yozilgan barcha izohlar o'chiriladi
 * Xavf darajasi: O'rta - bir postdagi barcha muhokamalar yo'qoladi
 * Eslatma: Postning o'zi saqlanib qoladi
 */

-- 5. FOYDALANUVCHINING BARCHA POSTLARINI O'CHIRISH
DELETE FROM posts
WHERE user_id = 1;
/*
 * Ta'sir: 1-IDli foydalanuvchining barcha postlari va ularga tegishli izohlar o'chiriladi
 * Xavf darajasi: Yuqori - foydalanuvchining barcha maqolalari yo'qoladi
 * Eslatma: Foydalanuvchi hisobi saqlanib qoladi
 */

-- 6. BARCHA FOYDALANUVCHILARNI VA ULARNING KONTENTINI O'CHIRISH
DELETE FROM users;
/*
 * Ta'sir: Barcha foydalanuvchilar, ularning postlari va izohlari o'chiriladi
 * Xavf darajasi: Juda yuqori - butun platforma ma'lumotlari yo'qoladi
 * Ogohlantirish: Bu operatsiyani ishlatishdan oldin ikki marta o'ylab ko'ring
 * Alternativa: TRUNCATE TABLE - bu tezroq, lekin CASCADE qo'llanmaydi
 */