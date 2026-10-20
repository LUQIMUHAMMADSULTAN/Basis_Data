-- ============================================
-- PRAKTIKUM BASIS DATA
-- Materi: Kondisi SQL menggunakan CASE dan IF
-- Database: pertemuan4
-- ============================================

-- 1. Membuat dan memilih database
CREATE DATABASE IF NOT EXISTS pertemuan4;
USE pertemuan4;

-- 2. Membuat tabel kondisi
CREATE TABLE kondisi (
    NPM CHAR(5) PRIMARY KEY,
    ABJAD CHAR(1)
);

-- 3. Memasukkan data praktikum
INSERT INTO kondisi (NPM, ABJAD) VALUES
('1001', 'A'),
('1002', 'B'),
('1003', 'C'),
('1004', 'D'),
('1005', 'B'),
('1006', 'E'),
('1007', 'A'),
('1008', 'E'),
('1000', 'B'),
('1009', 'C');

-- 4. Menampilkan seluruh data
SELECT * FROM kondisi;

-- 5. Menentukan keterangan menggunakan CASE
SELECT *,
    CASE ABJAD
        WHEN 'A' THEN 'sangat baik'
        WHEN 'B' THEN 'baik'
        WHEN 'C' THEN 'cukup'
        WHEN 'D' THEN 'jelek'
        ELSE 'sangat jelek'
    END AS keterangan
FROM kondisi;

-- 6. Menentukan keterangan menggunakan IF
SELECT *,
    IF(ABJAD = 'A', 'Sangat baik',
        IF(ABJAD = 'B', 'baik',
            IF(ABJAD = 'C', 'cukup',
                IF(ABJAD = 'D', 'jelek',
                    'sangat jelek'
                )
            )
        )
    ) AS keterangan
FROM kondisi;
