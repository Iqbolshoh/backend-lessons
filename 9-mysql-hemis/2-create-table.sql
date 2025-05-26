/*
 * ======================================================================
 *               UNIVERSITET TA'LIM TIZIMI JADVALLARI
 * ======================================================================
 *
 * Ushbu skript oliy ta'lim muassasasi uchun ma'lumotlar bazasi strukturasi:
 * 1. Universitetlar (university)
 * 2. Fakultetlar (faculty)
 * 3. Yo'nalishlar (direction)
 * 4. Guruhlar (group)
 * 5. Talabalar (students)
 *
 * Jadval dizayni:
 * - Har bir jadval uchun avtomatik o'suvchi asosiy kalit
 * - Bog'liqliklar referential integrityni ta'minlash uchun
 * - Mantiqiy tuzilma (universitet -> fakultet -> yo'nalish -> guruh -> talaba)
 * ======================================================================
 */

-- ==================== Universitetlar ====================
CREATE TABLE `university` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,           -- Unikal ID
    `name` VARCHAR(150) NOT NULL                   -- Universitet nomi
);

/*
 * Universitetlar ro'yxati - har bir universitet fakultetlar orqali bog'liq
 */

-- ==================== Fakultetlar ====================
CREATE TABLE `faculty` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,           -- Unikal ID
    `name` VARCHAR(150) NOT NULL,                  -- Fakultet nomi
    `university_id` INT NOT NULL,                  -- Universitet FK
    FOREIGN KEY (`university_id`) REFERENCES `university`(`id`) ON DELETE CASCADE
);

/*
 * Fakultetlar ro'yxati - har bir fakultet ma'lum bir universitetga tegishli
 */

-- ==================== Yo'nalishlar ====================
CREATE TABLE `direction` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,           -- Unikal ID
    `name` VARCHAR(150) NOT NULL,                  -- Yo'nalish nomi
    `faculty_id` INT NOT NULL,                     -- Fakultet FK
    FOREIGN KEY (`faculty_id`) REFERENCES `faculty`(`id`) ON DELETE CASCADE
);

/*
 * Yo'nalishlar ro'yxati - har bir yo'nalish bitta fakultetga tegishli
 */

-- ==================== Guruhlar ====================
CREATE TABLE `group` (                     -- "group" so'zi SQLda reserved keyword
    `id` INT AUTO_INCREMENT PRIMARY KEY,           -- Unikal ID
    `name` VARCHAR(50) NOT NULL,                   -- Guruh nomi (masalan: DI-303)
    `direction_id` INT NOT NULL,                   -- Yo'nalish FK
    `course_year` TINYINT NOT NULL,                -- Kurs (1-4)
    FOREIGN KEY (`direction_id`) REFERENCES `direction`(`id`) ON DELETE CASCADE
);

/*
 * Guruhlar ro'yxati - har bir guruh bitta yo'nalishga biriktirilgan
 */

-- ==================== Talabalar ====================
CREATE TABLE `students` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,           -- Talaba ID
    `name` VARCHAR(150) NOT NULL,                  -- Ism familya
    `age` TINYINT,                                 -- Yosh
    `group_id` INT NOT NULL,                       -- Guruh FK
    FOREIGN KEY (`group_id`) REFERENCES `group`(`id`) ON DELETE CASCADE
);

/*
 * Talabalar ro'yxati - har bir talaba o'zining universiteti, fakulteti,
 * yo'nalishi va guruhiga bog'langan (indirekt tarzda)
 */

/*
 * ======================================================================
 * MUHIM ESASLATMA:
 * 1. Har bir jadval UTF8mb4 kodlashida - barcha tillar va emojilar uchun
 * 2. CASCADE o'chirish - ota-ona yozuv o'chirilsa, bolalari ham o'chadi
 * 3. NOT NULL cheklovlari - majburiy maydonlar uchun
 * ======================================================================
 */