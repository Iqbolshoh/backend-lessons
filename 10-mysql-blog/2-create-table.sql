/*
 * ======================================================================
 *                     BLOG PLATFORMASI JADVALLARI
 * ======================================================================
 *
 * Ushbu skript blog platformasi uchun asosiy jadvallarni yaratadi:
 * 1. Foydalanuvchilar (users)
 * 2. Postlar (posts) 
 * 3. Izohlar (comments)
 *
 * Har bir jadval uchun:
 * - Avtomatik o'suvchi primary key
 * - Yaratilgan va yangilangan vaqt belgilari
 * - Tegishli cheklovlar va indekslar
 * - Jadvalar orasidagi bog'liqliklar (foreign keys)
 *
 * Muhim: CASCADE qoidalari bog'liq ma'lumotlarni avtomatik o'chiradi
 * ======================================================================
 */

-- ==================== Foydalanuvchilar Jadvali ====================
CREATE TABLE users (
    `id` INT AUTO_INCREMENT PRIMARY KEY,             -- Foydalanuvchi unikal identifikatori
    `name` VARCHAR(100) NOT NULL,                    -- To'liq ism (majburiy maydon)
    `email` VARCHAR(150) UNIQUE NOT NULL,            -- Elektron pochta (takrorlanmas va majburiy)
    `password` VARCHAR(255) NOT NULL,                -- Parol hash (maxfiy va majburiy)
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,               -- Yozuv yaratilgan vaqt (avtomatik)
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Oxirgi yangilanish vaqti (avtomatik)
);

/*
 * =====================================================================
 * Foydalanuvchilar jadvali platformaning barcha ro'yxatdan o'tgan
 * a'zolarini saqlaydi. Email manzili unikal bo'lishi ta'minlangan.
 * =====================================================================
 */

-- ==================== Postlar Jadvali ====================
CREATE TABLE posts (
    `id` INT AUTO_INCREMENT PRIMARY KEY,             -- Post unikal identifikatori
    `user_id` INT NOT NULL,                          -- Muallifning foydalanuvchi IDsi (majburiy)
    `title` VARCHAR(255) NOT NULL,                   -- Post sarlavhasi (majburiy)
    `body` TEXT NOT NULL,                            -- Post asosiy matni (majburiy)
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,               -- Post yaratilgan vaqt (avtomatik)
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Post yangilangan vaqt (avtomatik)
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE -- Foydalanuvchi o'chirilsa, postlari ham o'chadi
);

/*
 * =====================================================================
 * Postlar jadvali foydalanuvchilar yaratgan blog postlarini saqlaydi.
 * Har bir post aniq bir foydalanuvchiga tegishli bo'ladi.
 * =====================================================================
 */

-- ==================== Izohlar Jadvali ====================
CREATE TABLE comments (
    `id` INT AUTO_INCREMENT PRIMARY KEY,             -- Izoh unikal identifikatori
    `post_id` INT NOT NULL,                          -- Izoh yozilgan post IDsi (majburiy)
    `user_id` INT NOT NULL,                          -- Izoh muallifi IDsi (majburiy)
    `content` TEXT NOT NULL,                         -- Izoh matni (majburiy)
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,               -- Izoh yaratilgan vaqt (avtomatik)
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Izoh yangilangan vaqt (avtomatik)
    FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`) ON DELETE CASCADE, -- Post o'chirilsa, izohlar ham o'chadi
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE  -- Foydalanuvchi o'chirilsa, izohlari ham o'chadi
);

/*
 * =====================================================================
 * Izohlar jadvali postlarga yozilgan fikr-mulohazalarni saqlaydi.
 * Har bir izoh aniq bir postga va foydalanuvchiga bog'liq bo'ladi.
 * =====================================================================
 */

-- ======================================================================
-- Jadvalar muvaffaqiyatli yaratildi
-- Endi sizda to'liq funksional blog platformasi ma'lumotlar bazasi mavjud
-- ======================================================================