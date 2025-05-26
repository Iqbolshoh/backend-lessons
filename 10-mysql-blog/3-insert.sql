/*
 * ======================================================================
 *                BLOG PLATFORMASI MA'LUMOTLARINI TO'LDIRISH
 * ======================================================================
 *
 * Ushbu SQL skripti blog platformasining asosiy jadvallariga
 * kengaytirilgan namuna ma'lumotlarni kiritadi:
 * 1. Foydalanuvchilar (users) - 6 ta yangi foydalanuvchi
 * 2. Postlar (posts) - 12 ta turli mavzudagi blog postlari
 * 3. Izohlar (comments) - 24 ta postlarga yozilgan izohlar
 *
 * Ma'lumotlar real hayotga mos va tizimni sinash uchun yetarli.
 * Har bir foydalanuvchi va post o'ziga xos va mazmunli.
 * ======================================================================
 */

-- ==================== Foydalanuvchilar Jadvaliga Ma'lumotlar ====================
INSERT INTO users (name, email, password) VALUES
('Ilhomjonov Iqbolshoh', 'iilhomjonov@gmail.com', 'hash_password_1'),  -- Dasturchi (asosiy foydalanuvchi)
('Nigora Karimova', 'nigora.karimova@example.com', 'hash_password_2'),  -- Web dizayner
('Rustam Rahimov', 'rustam.rahimov@example.com', 'hash_password_3'),    -- Full-stack dasturchi
('Zilola Saidova', 'zilola.saidova@example.com', 'hash_password_4'),     -- Frontend dasturchi
('Jasur Xolmatov', 'jasur.xolmatov@example.com', 'hash_password_5'),     -- Backend dasturchi
('Malika Usmonova', 'malika.usmonova@example.com', 'hash_password_6');   -- Kontent muallifi

/*
 * 6 ta foydalanuvchi qo'shildi:
 * - Dasturchi
 * - Web dizayner
 * - Full-stack dasturchi
 * - Frontend dasturchi
 * - Backend dasturchi
 * - Kontent muallifi
 */

-- ==================== Postlar Jadvaliga Ma'lumotlar ====================
INSERT INTO posts (user_id, title, body) VALUES
(1, 'Dasturlashga kirish', 'Dasturlash asoslari haqida qisqacha ma‘lumot va yangi boshlovchilar uchun maslahatlar.'),  -- Dasturlash asoslari
(2, 'Laravel framework', 'Laravel haqida batafsil ma‘lumot va real loyihalarda qo‘llanilishi.'),    -- PHP frameworki
(3, 'Web dizayn trendlari 2025', '2025 yil uchun web dizayn tendensiyalari va ulardan foydalanish.'),      -- Dizayn trendlari
(1, 'JavaScript haqida', 'JavaScript dasturlash tili va uning zamonaviy imkoniyatlari.'), -- JS dasturlash
(4, 'React bilan frontend ishlab chiqish', 'React.js yordamida interaktiv veb ilovalar yaratish.'), -- Frontend
(5, 'Node.js va backend', 'Node.js yordamida samarali backend tizimlarni ishlab chiqish.'), -- Backend
(3, 'Cybersecurity asoslari', 'Axborot xavfsizligi bo‘yicha asosiy tamoyillar va maslahatlar.'), -- Xavfsizlik
(2, 'PHPda API yaratish', 'PHP va Laravel yordamida REST API yaratish bo‘yicha qo‘llanma.'), -- API
(6, 'Blog yozish san’ati', 'Muvaffaqiyatli blog postlarini yozish bo‘yicha maslahatlar.'), -- Kontent yaratish
(4, 'CSS Grid va Flexbox', 'Zamonaviy veb dizayn uchun CSS Grid va Flexbox texnikalari.'), -- CSS
(5, 'Ma’lumotlar bazasi optimallashtirish', 'MySQL va boshqa DB’larda samaradorlikni oshirish usullari.'), -- DB optimallashtirish
(6, 'SEO asoslari', 'Blog postlarini qidiruv tizimlari uchun optimallashtirish bo‘yicha qo‘llanma.'); -- SEO

/*
 * 12 ta turli mavzudagi postlar qo'shildi:
 * - Dasturlash asoslari
 * - PHP va Laravel frameworklari
 * - Web dizayn trendlari
 * - JavaScript
 * - React.js va frontend
 * - Node.js va backend
 * - Xavfsizlik
 * - API ishlab chiqish
 * - Blog yozish san’ati
 * - CSS Grid va Flexbox
 * - Ma’lumotlar bazasi optimallashtirish
 * - SEO
 */

-- ==================== Izohlar Jadvaliga Ma'lumotlar ====================
INSERT INTO comments (post_id, user_id, content) VALUES
-- Dasturlashga kirish postiga izohlar
(1, 2, 'Ajoyib maqola, yangi boshlovchilar uchun juda foydali!'),  -- Dizayner fikri
(1, 3, 'Rahmat, dasturlashga qiziqish uyg‘otdi.'),  -- Full-stack fikri
(1, 4, 'Qisqacha va aniq, davom ettiring!'),  -- Frontend fikri
-- Laravel framework postiga izohlar
(2, 1, 'Laravel bilan loyihalarimni tezlashtirdim.'),  -- Dasturchi fikri
(2, 5, 'API yaratish bo‘yicha ajoyib maslahatlar.'),  -- Backend fikri
(2, 6, 'Laravel haqida ko‘proq yozing!'),  -- Kontent muallifi fikri
-- Web dizayn trendlari postiga izohlar
(3, 4, '2025 trendlari haqida juda foydali ma‘lumot.'),  -- Frontend fikri
(3, 1, 'Dizaynda soddalik muhim, rahmat!'),  -- Dasturchi fikri
-- JavaScript haqida postiga izohlar
(4, 3, 'JavaScript o‘rganish uchun eng zo‘r resurs.'),  -- Full-stack fikri
(4, 4, 'JS’da ko‘p mashq qilish kerakligi to‘g‘ri.'),  -- Frontend fikri
-- React bilan frontend ishlab chiqish postiga izohlar
(5, 1, 'React bilan ishlash juda qulay, rahmat!'),  -- Dasturchi fikri
(5, 2, 'React dizaynni yanada interaktiv qiladi.'),  -- Dizayner fikri
-- Node.js va backend postiga izohlar
(6, 3, 'Node.js bilan backend ishlab chiqish osonlashdi.'),  -- Full-stack fikri
(6, 5, 'Ajoyib qo‘llanma, davom ettiring!'),  -- Backend fikri
-- Cybersecurity asoslari postiga izohlar
(7, 2, 'Xavfsizlik bo‘yicha ko‘proq maqola kerak.'),  -- Dizayner fikri
(7, 6, 'Bu mavzuni har bir dasturchi o‘rganishi kerak.'),  -- Kontent muallifi fikri
-- PHPda API yaratish postiga izohlar
(8, 1, 'API yaratish bo‘yicha juda aniq qo‘llanma.'),  -- Dasturchi fikri
(8, 3, 'Laravel API uchun eng zo‘r vosita.'),  -- Full-stack fikri
-- Blog yozish san’ati postiga izohlar
(9, 2, 'Blog yozish bo‘yicha foydali maslahatlar.'),  -- Dizayner fikri
(9, 4, 'Kontent yaratish bo‘yicha yaxshi yo‘l-yo‘riq.'),  -- Frontend fikri
-- CSS Grid va Flexbox postiga izohlar
(10, 2, 'CSS Grid dizaynni osonlashtiradi.'),  -- Dizayner fikri
(10, 1, 'Flexbox haqida ko‘proq misollar kerak.'),  -- Dasturchi fikri
-- Ma’lumotlar bazasi optimallashtirish postiga izohlar
(11, 3, 'DB optimallashtirish bo‘yicha foydali maslahatlar.'),  -- Full-stack fikri
(11, 5, 'MySQL’da indekslash haqida yaxshi tushuntirilgan.'),  -- Backend fikri
-- SEO asoslari postiga izohlar
(12, 6, 'SEO bo‘yicha juda foydali maqola.'),  -- Kontent muallifi fikri
(12, 2, 'Qidiruv tizimlari uchun optimallashtirishni o‘rganmoqdaman.');  -- Dizayner fikri

/*
 * 24 ta izoh qo'shildi:
 * - Har bir postga kamida 2 ta izoh
 * - Har bir foydalanuvchi kamida 3 ta izoh yozgan
 * - Izohlar post mavzusiga mos va mazmunli
 */

/*
 * ======================================================================
 * MA'LUMOTLAR BAZASI TO'LDIRILDI
 * Jami:
 * - 6 ta foydalanuvchi
 * - 12 ta post
 * - 24 ta izoh
 * ======================================================================
 */