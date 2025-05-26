/* 
 * ======================================================
 *              DATABASE YARATISH SKRIPTI              
 * ======================================================
 * 
 * Bu skript quyidagi amallarni bajaradi:
 * 1. Avvalgi database mavjud bo'lsa, uni to'liq o'chiradi
 * 2. Yangi database yaratadi
 * 3. Yangi yaratilgan databaseni ishlatish uchun tanlaydi
 * 
 * Diqqat: Database o'chirish barcha ma'lumotlarni 
 *         butunlay yo'q qiladi!
 * ======================================================
 */

-- 1. Avvalgi versiyani tozalash (agar mavjud bo'lsa)
DROP DATABASE IF EXISTS hemis;

-- 2. Yangi database yaratish
CREATE DATABASE hemis;

-- 3. Database aktivlashtirish
USE hemis;

-- ======================================================
-- Yangi database muvaffaqiyatli yaratildi va tanlandi
-- ======================================================