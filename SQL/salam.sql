-- 1. Membuat schema SALAM
CREATE SCHEMA IF NOT EXISTS SALAM;

-- 2. Membuat tabel mahasiswas pake berbagai constraint
CREATE TABLE SALAM.mahasiswas (
    id SERIAL PRIMARY KEY,                      -- Primary Key
    nim VARCHAR(12) UNIQUE NOT NULL,            -- Unique Constraint
    nama VARCHAR(100) NOT NULL,
    umur INT CHECK (umur >= 17 AND umur <= 60), -- Check Constraint
    ipk NUMERIC(3,2) CHECK (ipk >= 0 AND ipk <= 4.0),
    email VARCHAR(100) UNIQUE
);

-- 3. Membuktikan constraint nya jalan

--  Berhasil 
INSERT INTO SALAM.mahasiswas (nim, nama, umur, ipk, email)
VALUES ('1237050060', 'Daffa Putra', 20, 3.50, 'daffa@example.com');

--  Gagal (umur < 17 tidak masuk CHECK constraint)
INSERT INTO SALAM.mahasiswas (nim, nama, umur, ipk, email)
VALUES ('1237050070', 'Haqi', 16, 3.20, 'haqi@example.com');

--  Gagal (nim duplikat karna UNIQUE constraint)
INSERT INTO SALAM.mahasiswas (nim, nama, umur, ipk, email)
VALUES ('1237050060', 'Sayyid', 22, 3.80, 'citra@example.com');