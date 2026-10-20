-- ============================================
-- PRAKTIKUM BASIS DATA
-- Materi: Subquery
-- Database: subquery
-- ============================================

-- 1. Membuat dan memilih database
CREATE DATABASE IF NOT EXISTS subquery;
USE subquery;

-- 2. Membuat tabel pegawai
CREATE TABLE pegawai (
    NIP INT NOT NULL PRIMARY KEY,
    NAMA VARCHAR(20),
    ALAMAT VARCHAR(50),
    JABATAN VARCHAR(20),
    GAJI INT
);

-- 3. Memasukkan data praktikum
INSERT INTO pegawai VALUES
('110', 'Dani', 'Jogja', 'Direktur', '8000000'),
('111', 'Ardi', 'Jakarta', 'CEO', '9000000'),
('112', 'Irni', 'Jakarta', 'Supervisor', '5000000'),
('113', 'Erni', 'Bandung', 'Supervisor', '5000000'),
('114', 'Rudi', 'Surabaya', 'Wadir', '7000000'),
('115', 'Roni', 'Surabaya', 'Staff', '4000000'),
('116', 'Rani', 'Bandung', 'Staff', '4000000'),
('117', 'Fani', 'Bandung', 'Staff', '4000000'),
('118', 'Fazi', 'Jogja', 'Staff', '4000000'),
('119', 'Razi', 'Jogja', 'Supervisor', '5000000'),
('120', 'Ruzi', 'Jakarta', 'Supervisor', '5000000');

-- 4. Menampilkan seluruh data pegawai
SELECT * FROM pegawai;

-- 5. Membuat tabel job
CREATE TABLE job (
    id INT NOT NULL PRIMARY KEY,
    job VARCHAR(20)
);

-- 6. Memasukkan data job
INSERT INTO job VALUES
('1', 'Direktur'),
('2', 'Wadir'),
('3', 'Supervisor'),
('4', 'Staff');

-- 7. Menampilkan seluruh data job
SELECT * FROM job;

-- 8. Menggunakan subquery untuk mencari pegawai dengan jabatan CEO
SELECT nama, gaji
FROM pegawai
WHERE JABATAN = (
    SELECT JABATAN
    FROM pegawai
    WHERE JABATAN = 'CEO'
);

-- 9. Menggunakan subquery IN untuk mencari pegawai dengan jabatan Staff
SELECT nama, gaji
FROM pegawai
WHERE jabatan IN (
    SELECT jabatan
    FROM pegawai
    WHERE jabatan = 'Staff'
);

-- 10. Menggunakan subquery IN untuk jabatan Supervisor dan Staff
-- dengan gaji kurang dari 6000000
SELECT nama, gaji
FROM pegawai
WHERE JABATAN IN (
    SELECT job
    FROM job
    WHERE job IN ('Supervisor', 'Staff')
)
AND gaji < 6000000;

-- 11. Menggunakan subquery NOT IN untuk mengecualikan jabatan CEO
SELECT nama, gaji
FROM pegawai
WHERE JABATAN NOT IN (
    SELECT JABATAN
    FROM pegawai
    WHERE JABATAN = 'CEO'
);

-- 12. Menampilkan NIP, nama, dan jabatan selain CEO
SELECT nip, nama, jabatan
FROM pegawai
WHERE JABATAN NOT IN (
    SELECT JABATAN
    FROM pegawai
    WHERE JABATAN = 'CEO'
);
