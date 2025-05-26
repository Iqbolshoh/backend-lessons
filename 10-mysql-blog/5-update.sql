/*
 * ======================================================================
 *               BLOG PLATFORMASIDA MA'LUMOTLARNI YANGILASH
 * ======================================================================
 *
 * Ushbu SQL so'rovlari blog platformasining jadvallaridagi ma'lumotlarni
 * turli usullarda yangilashni ko'rsatadi. Har bir so'rov maqsadi va 
 * ta'siri tushuntirilgan. So'rovlar faqat UPDATE, SET va WHERE 
 * operatorlaridan foydalanadi, JOIN yoki subquery ishlatilmaydi.
 * ======================================================================
 */

-- 1. FOYDALANUVCHI PROFILINI YANGILASH
UPDATE users 
SET name = 'Ilhomjonov Iqbolshoh Akajon', 
    email = 'iilhomjonov777@gmail.com' 
WHERE id = 1;
/*
 * Ta'sir: ID=1 foydalanuvchining ismi va email manzili yangilanadi
 * Eslatma: Email manzil unikal bo'lishi kerak
 */

-- 2. BLOG POSTINI YANGILASH
UPDATE posts 
SET title = 'Dasturlashga kirish — yangi boshlovchilar uchun', 
    body = 'Dasturlash asoslari va amaliy mashqlar haqida to‘liq qo‘llanma.' 
WHERE id = 1;
/*
 * Ta'sir: ID=1 postning sarlavhasi va asosiy matni yangilanadi
 * Eslatma: updated_at maydoni avtomatik yangilanadi
 */

-- 3. POST MUALLIFINI O'ZGARTIRISH
UPDATE posts 
SET user_id = 2 
WHERE id = 5;
/*
 * Ta'sir: ID=5 post muallifi Nigora Karimova (ID=2) ga o'zgartiriladi
 * Eslatma: user_id mavjud foydalanuvchi ID bo'lishi kerak (1-6)
 */

-- 4. IZOH KONTENTINI YANGILASH
UPDATE comments 
SET content = 'Ajoyib maqola, juda ko‘p foydali ma‘lumot oldim!' 
WHERE id = 1;
/*
 * Ta'sir: ID=1 izohning matni yangilanadi
 * Eslatma: updated_at maydoni avtomatik yangilanadi
 */

-- 5. IZOH MUALLIFINI O'ZGARTIRISH
UPDATE comments 
SET user_id = 2 
WHERE id = 5;
/*
 * Ta'sir: ID=5 izoh muallifi Nigora Karimova (ID=2) ga o'zgartiriladi
 * Eslatma: user_id mavjud foydalanuvchi ID bo'lishi kerak (1-6)
 */

-- 6. BIR NECHTA IZOHLARNI YANGILASH
UPDATE comments 
SET content = CONCAT(content, ' (Yangilangan)') 
WHERE post_id = 7;
/*
 * Ta'sir: ID=7 postga (Cybersecurity asoslari) tegishli izohlar oxiriga "(Yangilangan)" qo'shiladi
 * Maqsad: Ma'lum bir postdagi izohlarni bir vaqtda yangilash
 */

-- 7. FOYDALANUVCHI PAROLINI YANGILASH
UPDATE users 
SET `password` = 'new_hash_password_3' 
WHERE id = 3;
/*
 * Ta'sir: ID=3 (Rustam Rahimov) foydalanuvchi paroli yangilanadi
 * Eslatma: Parol doimo hash qilingan holda saqlanishi kerak
 */

-- 8. POST SARLAVHASINI QISQARTIRISH
UPDATE posts 
SET title = LEFT(title, 50) 
WHERE id = 3;
/*
 * Ta'sir: ID=3 postning ("Web dizayn trendlari 2025") sarlavhasi 50 belgigacha qisqartiriladi
 * Maqsad: Uzoq sarlavhalarni qisqa va aniq qilish
 */

-- 9. FOYDALANUVCHI IZOHLARINI TEKSHIRILDI DEB BELGILASH
UPDATE comments 
SET content = CONCAT(content, ' [Tekshirildi]') 
WHERE user_id = 3;
/*
 * Ta'sir: ID=3 (Rustam Rahimov) foydalanuvchi yozgan izohlar oxiriga "[Tekshirildi]" qo'shiladi
 * Maqsad: Muayyan foydalanuvchining izohlarini tekshirilgan deb belgilash
 * Eslatma: Rustamning 4 ta izohi yangilanadi
 */

-- 10. FOYDALANUVCHI POSTLARIGA PREFIKS QO'SHISH
UPDATE posts 
SET title = CONCAT('[Frontend] ', title) 
WHERE user_id = 4;
/*
 * Ta'sir: ID=4 (Zilola Saidova) foydalanuvchi postlarining sarlavhasiga "[Frontend]" prefiksi qo'shiladi
 * Maqsad: Frontend mavzusidagi postlarni aniq belgilash
 * Eslatma: 2 ta post (React va CSS Grid) yangilanadi
 */