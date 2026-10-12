
-- ============================================
-- PRAKTIKUM BASIS DATA
-- Materi: Relasi Antar Tabel
-- Database: tugas1
-- ============================================

-- 1. Membuat dan memilih database
CREATE DATABASE IF NOT EXISTS tugas1;
USE tugas1;

-- 2. Membuat tabel matkul
CREATE TABLE matkul (
    kd_matkul INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(20),
    sks CHAR(1)
);

-- Menampilkan struktur tabel matkul
DESC matkul;

-- 3. Membuat tabel dosen
CREATE TABLE dosen (
    nid CHAR(5) NOT NULL PRIMARY KEY,
    nama_dosen VARCHAR(20),
    alamat VARCHAR(30)
);

-- Menampilkan struktur tabel dosen
DESC dosen;

-- 4. Membuat tabel nilai
CREATE TABLE nilai (
    kd_nilai INT,
    kd_matkul INT,
    nid CHAR(5),
    tanggal DATE,
    keterangan VARCHAR(20),

    CONSTRAINT fk_nilai_matkul
        FOREIGN KEY (kd_matkul)
        REFERENCES matkul(kd_matkul),

    CONSTRAINT fk_nilai_dosen
        FOREIGN KEY (nid)
        REFERENCES dosen(nid)
);

-- Menampilkan struktur tabel nilai
DESC nilai;
