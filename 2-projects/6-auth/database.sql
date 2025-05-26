/* 
 * ======================================================
 *                    DATABASE YARATISH              
 * ======================================================
 */

-- 1. Avvalgi versiyani tozalash (agar mavjud bo'lsa)
DROP DATABASE IF EXISTS auth;

-- 2. Yangi database yaratish
CREATE DATABASE auth;

-- 3. Database aktivlashtirish
USE auth;

-- ==================== Users ====================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

