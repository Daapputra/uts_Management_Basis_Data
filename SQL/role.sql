-- Membuat role 
CREATE ROLE backend_dev LOGIN PASSWORD 'backend123';
CREATE ROLE bi_dev LOGIN PASSWORD 'bidev123';
CREATE ROLE data_engineer LOGIN PASSWORD 'dataeng123';

-- 1. Role backend_dev: CRUD semua tabel
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA SALAM TO backend_dev;

-- 2. Role bi_dev: hanya boleh membaca 
GRANT SELECT ON ALL TABLES IN SCHEMA SALAM TO bi_dev;

-- 3. Role data_engineer: bisa membuat, mengubah, dan menghapus object dan CRUD tabel
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA SALAM TO data_engineer;
GRANT CREATE ON SCHEMA SALAM TO data_engineer;
ALTER DEFAULT PRIVILEGES IN SCHEMA SALAM GRANT ALL ON TABLES TO data_engineer;

-- CARA PENGUJIAN
-- role backend
SET ROLE backend_dev;
INSERT INTO SALAM.mahasiswas (nim, nama, umur, ipk, email)
VALUES ('1237050061', 'Daffa Naufal', 21, 3.7, 'daffa@backend.com');

-- Harus error karena hanya SELECT yang diizinkan
-- role biDev
SET ROLE bi_dev;
INSERT INTO SALAM.mahasiswas (nim, nama, umur, ipk, email)
VALUES ('1237050041', 'Udin', 23, 3.4, 'udin@bi.com');

-- role data engineer
SET ROLE data_engineer;
CREATE TABLE SALAM.test_table (
    id SERIAL PRIMARY KEY,
    info TEXT
);