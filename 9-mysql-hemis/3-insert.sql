/*
 * ======================================================================
 *              UNIVERSITET MA'LUMOTLAR BAZASINI TO'LDIRISH
 * ======================================================================
 *
 * Ushbu skript universitet tizimi jadvallariga namuna ma'lumotlarni kiritadi:
 * 1. Universitetlar
 * 2. Fakultetlar
 * 3. Yo'nalishlar
 * 4. Guruhlar
 * 5. Talabalar
 *
 * Har bir jadval uchun real hayotga mos namuna ma'lumotlar kiritilgan.
 * ======================================================================
 */

-- ==================== Universitetlar Jadvaliga Ma'lumotlar ====================
INSERT INTO `university` (`name`) VALUES 
('Samarkand davlat universiteti'),  -- O'zbekistonning eng qadimgi universitetlaridan biri
('Buxoro davlat universiteti');     -- Buxoro viloyatidagi yetakchi oliy ta'lim muassasasi

-- ==================== Fakultetlar Jadvaliga Ma'lumotlar ====================
INSERT INTO `faculty` (`name`, `university_id`) VALUES 
('Intellektual tizimlar va kompyuter texnologiyalari fakulteti', 1),  -- SamDU IT fakulteti
('Matematika fakulteti', 1),                                          -- SamDU Matematika
('Filologiya fakulteti', 1),                                          -- SamDU Filologiya
('Kimyo fakulteti', 2),                                               -- BuxDU Kimyo
('Iqtisod fakulteti', 2);                                             -- BuxDU Iqtisod

/*
 * Har bir universitet uchun turli fakultetlar qo'shildi
 */

-- ==================== Yo'nalishlar Jadvaliga Ma'lumotlar ====================
INSERT INTO `direction` (`name`, `faculty_id`) VALUES 
('Dasturiy injinering', 1),      -- SamDU IT fakulteti, Dasturiy injinering
('Suniy Intelekt', 1),           -- SamDU IT fakulteti, Suniy Intelekt
('Matematika', 2),               -- SamDU Matematika fakulteti
('Iqtisodiyot', 5),              -- BuxDU Iqtisod fakulteti
('Tojik Filologiyasi', 3),       -- SamDU Filologiya fakulteti
('Rus Filologiyasi', 3),         -- SamDU Filologiya fakulteti
('Kimyo', 4);                    -- BuxDU Kimyo fakulteti

/*
 * Har bir fakultet uchun tegishli yo'nalishlar qo'shildi
 */

-- ==================== Guruhlar Jadvaliga Ma'lumotlar ====================
INSERT INTO `group` (`name`, `course_year`, `direction_id`) VALUES 
('DI-303', 3, 1),  -- Dasturiy injinering 3-kurs guruhi
('DI-304', 3, 1),  -- Dasturiy injinering 3-kurs guruhi
('SI-201', 2, 2),  -- Suniy Intelekt 2-kurs guruhi
('M-101', 1, 3),   -- Matematika 1-kurs guruhi
('M-202', 2, 3),   -- Matematika 2-kurs guruhi
('I-303', 3, 4),   -- Iqtisodiyot 3-kurs guruhi
('I-101', 1, 4),   -- Iqtisodiyot 1-kurs guruhi
('TF-201', 2, 5),  -- Tojik Filologiyasi 2-kurs guruhi
('RF-101', 1, 6),  -- Rus Filologiyasi 1-kurs guruhi
('K-101', 1, 7),   -- Kimyo 1-kurs guruhi
('K-202', 2, 7),   -- Kimyo 2-kurs guruhi
('DI-101', 1, 1),  -- Dasturiy injinering 1-kurs guruhi
('TF-101', 1, 5),  -- Tojik Filologiyasi 1-kurs guruhi
('RF-202', 2, 6),  -- Rus Filologiyasi 2-kurs guruhi
('SI-101', 1, 2);  -- Suniy Intelekt 1-kurs guruhi

/*
 * Har bir yo'nalish uchun turli kurslardagi guruhlar yaratildi
 */

-- ==================== Talabalar Jadvaliga Ma'lumotlar ====================
INSERT INTO `students` (`name`, `age`, `group_id`) VALUES 
('Iqbolshoh Ilhomjonov', 22, 1),  -- DI-303, Dasturiy injinering
('Nodira Rahimova', 21, 1),       -- DI-303, Dasturiy injinering
('Ali Valiev', 22, 2),            -- DI-304, Dasturiy injinering
('Zilola Saidova', 20, 2),        -- DI-304, Dasturiy injinering
('Shaxzod Usmonov', 21, 3),       -- SI-201, Suniy Intelekt
('Malika Xolova', 20, 3),         -- SI-201, Suniy Intelekt
('Bobur Mirzoev', 19, 4),         -- M-101, Matematika
('Zarina Toshova', 18, 4),        -- M-101, Matematika
('Diyor Rahmonov', 20, 5),        -- M-202, Matematika
('Gulnora Karimova', 21, 5),      -- M-202, Matematika
('Sardor Xojiev', 23, 6),         -- I-303, Iqtisodiyot
('Nargiza Yusupova', 22, 6),      -- I-303, Iqtisodiyot
('Jamshid Sobirov', 19, 7),       -- I-101, Iqtisodiyot
('Feruza Murodova', 18, 7),       -- I-101, Iqtisodiyot
('Jasmina Rahimova', 20, 8),      -- TF-201, Tojik Filologiyasi
('Shirin Alieva', 21, 8),         -- TF-201, Tojik Filologiyasi
('Rustam Xudoyberdiev', 19, 9),   -- RF-101, Rus Filologiyasi
('Madina Olimova', 18, 9),        -- RF-101, Rus Filologiyasi
('Nilufar Qodirova', 20, 10),     -- K-101, Kimyo
('Oybek Sattorov', 19, 10),       -- K-101, Kimyo
('Azizbek Ergashev', 21, 11),     -- K-202, Kimyo
('Moxira Abdullaeva', 20, 11),    -- K-202, Kimyo
('Farhod Jumaev', 19, 12),        -- DI-101, Dasturiy injinering
('Lola Xasanova', 18, 12),        -- DI-101, Dasturiy injinering
('Komiljon Tojiev', 20, 13),      -- TF-101, Tojik Filologiyasi
('Zuhra Muminova', 19, 13),       -- TF-101, Tojik Filologiyasi
('Ilyosbek Nematov', 21, 14),     -- RF-202, Rus Filologiyasi
('Sevinch Qosimova', 20, 14),     -- RF-202, Rus Filologiyasi
('Behruz Xoshimov', 19, 15),      -- SI-101, Suniy Intelekt
('Dildora Akramova', 18, 15),     -- SI-101, Suniy Intelekt
('Temur Xoliqov', 20, 1),         -- DI-303, Dasturiy injinering
('Gulbahor Yuldasheva', 21, 2);   -- DI-304, Dasturiy injinering

/*
 * 32 ta talaba qo'shildi, har bir fakultet, yo'nalish va guruh uchun
 * mos ravishda taqsimlandi
 */

/*
 * ======================================================================
 * MA'LUMOTLAR BAZASI TO'LDIRILDI
 * Endi sizda quyidagilar mavjud:
 * - 2 ta universitet
 * - 5 ta fakultet
 * - 7 ta yo'nalish
 * - 15 ta guruh
 * - 32 ta talaba
 * ======================================================================
 */