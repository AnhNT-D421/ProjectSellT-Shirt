-- Create Database
CREATE DATABASE DB_JV5_Seller;
USE DB_JV5_Seller;

-- Create Tables
CREATE TABLE san_pham (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ma_san_pham VARCHAR(255),
    ten_san_pham VARCHAR(255),
    trang_thai INT
);

CREATE TABLE mau_sac (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ma_mau VARCHAR(255),
    ten_mau VARCHAR(255),
    trang_thai INT
);
CREATE TABLE size (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ma_size VARCHAR(255),
    ten_size VARCHAR(255),
    trang_thai INT
);

CREATE TABLE khach_hang (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ho_ten NVARCHAR(255),
    dia_chi NVARCHAR(255),
    sdt VARCHAR(20),
    trang_thai INT
);

CREATE TABLE ctsp (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_sp INT NULL,
    id_mau_sac INT NULL,
    id_size INT NULL,
	ma_ctsp varchar(255) null,
	ten_ctsp varchar(255) null,
    images varchar(max) NULL,
    gia_ban DECIMAL(18, 2),
    so_luong_ton INT,
    trang_thai INT,
    CONSTRAINT fk_sp FOREIGN KEY (id_sp) REFERENCES san_pham(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_mau_sac FOREIGN KEY (id_mau_sac) REFERENCES mau_sac(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_size FOREIGN KEY (id_size) REFERENCES size(id) ON UPDATE CASCADE ON DELETE CASCADE,
);
CREATE TABLE nhan_vien (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255),
    code VARCHAR(255),
    username VARCHAR(255),
    password VARCHAR(255),
	role int,
    trang_thai int
);

CREATE TABLE hoa_don (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_khach_hang INT NULL,
    id_nhan_vien INT NULL,
	tong_tien DECIMAL(18, 2),
	trang_thai INT,
    CONSTRAINT fk_khach_hang FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_nhan_vien FOREIGN KEY (id_nhan_vien) REFERENCES nhan_vien(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE hdct (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_hoa_don INT NULL,
    id_ctsp INT NULL,
    so_luong_mua INT,
    gia_ban DECIMAL(18, 2),
    tong_tien DECIMAL(18, 2),
    trang_thai INT,
    CONSTRAINT fk_hoa_don FOREIGN KEY (id_hoa_don) REFERENCES hoa_don(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_ctsp FOREIGN KEY (id_ctsp) REFERENCES ctsp(id) ON UPDATE CASCADE ON DELETE CASCADE
);
insert into nhan_vien values('Tuan Anh','NV01','admin_anhnt','123',1,1)

-- Insert Data into the san_pham table
INSERT INTO san_pham (ma_san_pham, ten_san_pham, trang_thai)
VALUES 
    ('SP001', 'Product 1', 1),
    ('SP002', 'Product 2', 1),
    ('SP003', 'Product 3', 0),
    ('SP004', 'Product 4', 1),
    ('SP005', 'Product 5', 1),
    ('SP006', 'Product 6', 0),
    ('SP007', 'Product 7', 1),
    ('SP008', 'Product 8', 1),
    ('SP009', 'Product 9', 0),
    ('SP010', 'Product 10', 1),
    ('SP011', 'Product 11', 1),
    ('SP012', 'Product 12', 0),
    ('SP013', 'Product 13', 1),
    ('SP014', 'Product 14', 1),
    ('SP015', 'Product 15', 0);

-- Insert data into the mau_sac table
INSERT INTO mau_sac (ma_mau, ten_mau, trang_thai)
VALUES 
    ('MS001', 'Red', 1),
    ('MS002', 'Blue', 1),
    ('MS003', 'Green', 0),
    ('MS004', 'Yellow', 1),
    ('MS005', 'Purple', 1),
    ('MS006', 'Black', 0),
    ('MS007', 'White', 1),
    ('MS008', 'Pink', 1),
    ('MS009', 'Orange', 0),
    ('MS010', 'Brown', 1),
    ('MS011', 'Gray', 1),
    ('MS012', 'Violet', 0),
    ('MS013', 'Indigo', 1),
    ('MS014', 'Teal', 1),
    ('MS015', 'Magenta', 0);

-- Insert data into the size table
INSERT INTO size (ma_size, ten_size, trang_thai)
VALUES 
    ('S001', 'Small', 1),
    ('S002', 'Medium', 1),
    ('S003', 'Large', 0),
    ('S004', 'XL', 1),
    ('S005', 'XXL', 1),
    ('S006', 'XXXL', 0),
    ('S007', 'XS', 1),
    ('S008', 'S', 1),
    ('S009', 'M', 0),
    ('S010', 'L', 1),
    ('S011', 'XL', 1),
    ('S012', 'XXL', 0),
    ('S013', 'XXXL', 1),
    ('S014', 'XS', 1),
    ('S015', 'S', 0);

-- Insert data into the khach_hang table
INSERT INTO khach_hang (ho_ten, dia_chi, sdt, trang_thai)
VALUES 
    ('John Doe', '123 Main St', '0374441985', 1),
    ('Jane Smith', '456 Elm St', '0987654321', 1),
    ('Bob Johnson', '789 Oak St', '1357924680', 0),
    ('Alice White', '101 First St', '1212121212', 1),
    ('Charlie Brown', '202 Second St', '1313131313', 1),
    ('Eve Black', '303 Third St', '1414141414', 0),
    ('Grace Hopper', '404 Fourth St', '1515151515', 1),
    ('Hank Pym', '505 Fifth St', '1616161616', 1),
    ('Ivy Green', '606 Sixth St', '1717171717', 0),
    ('Jack Ryan', '707 Seventh St', '1818181818', 1),
    ('Karen Carpenter', '808 Eighth St', '1919191919', 1),
    ('Larry Page', '909 Ninth St', '2020202020', 0),
    ('Mia Farrow',	 '100 Tenth St', '2121212121', 1),
    ('Nina Simone', '111 Eleventh St', '2222222222', 1),
    ('Oscar Wilde', '122 Twelfth St', '2323232323', 0);

-- Insert data into the anh_ctsp table

-- Insert data into the ctsp table
INSERT INTO ctsp (id_sp, id_mau_sac, id_size, images, gia_ban, so_luong_ton, trang_thai)
VALUES 
    (1, 1, 1, null, 50.00, 100, 1),
    (2, 2, 2, null, 75.00, 50, 1),
    (3, 3, 3, null, 100.00, 25, 0),
    (4, 4, 4, null, 55.00, 100, 1),
    (5, 5, 5, null, 80.00, 50, 1),
    (6, 6, 6, null, 105.00, 25, 0),
    (7, 7, 7, null, 60.00, 100, 1),
    (8, 8, 8, null, 85.00, 50, 1),
    (9, 9, 9, null, 110.00, 25, 0),
    (10, 10, 10, null, 65.00, 100, 1),
    (11, 11, 11, null, 90.00, 50, 1),
    (12, 12, 12, null, 115.00, 25, 0),
    (13, 13, 13, null, 70.00, 100, 1),
    (14, 14, 14, null, 95.00, 50,1)

-- Insert data into the nhan_vien table
INSERT INTO nhan_vien (name, code, username, password,role, trang_thai)
VALUES 
    ('Alice Nguyen', 'NV001', 'alice', 'password123',1, 1),
    ('David Tran', 'NV002', 'david', 'password456',0, 1),
    ('Eva Le', 'NV003', 'eva', 'password789',0, 0),
    ('Frank Pham', 'NV004', 'frank', 'password111',0, 1),
    ('Grace Kim', 'NV005', 'grace', 'password222', 0,1),
    ('Helen Yu', 'NV006', 'helen', 'password333',0, 0),
    ('Ian Ho', 'NV007', 'ian', 'password444',0, 1),
    ('Jane Park', 'NV008', 'jane', 'password555',0, 1)

-- Insert data into the hoa_don table
INSERT INTO hoa_don (id_khach_hang, id_nhan_vien, tong_tien, trang_thai)
VALUES 
    (1, 1, 100.00, 0),
    (2, 2, 200.00, 1),
    (3, 3, 300.00, 2),
    (4, 4, 400.00, 0),
    (5, 5, 500.00, 1),
    (6, 6, 600.00, 2),
    (7, 7, 700.00, 0),
    (8, 8, 800.00, 1),
    (9, 9, 900.00, 2),
    (10, 10, 1000.00, 0),
    (11, 11, 1100.00, 1),
    (12, 12, 1200.00, 2),
    (13, 13, 1300.00, 0),
    (14, 14, 1400.00, 1),
    (15, 15, 1500.00, 2);

-- Insert data into the hdct table	
INSERT INTO hdct (id_hoa_don, id_ctsp, so_luong_mua, gia_ban, tong_tien, trang_thai)
VALUES 
    (1, 1, 2, 50.00, 100.00, 0),
    (2, 2, 1, 75.00, 75.00, 1),
    (3, 3, 3, 100.00, 300.00, 2),
    (4, 4, 2, 55.00, 110.00, 0),
    (5, 5, 1, 80.00, 80.00, 1),
    (6, 6, 3, 105.00, 315.00, 2),
    (7, 7, 2, 60.00, 120.00, 0),
    (8, 8, 1, 85.00, 85.00, 1),
    (9, 9, 3, 110.00, 330.00, 2),
    (10, 10, 2, 65.00, 130.00, 0),
    (11, 11, 1, 90.00, 90.00, 1),
    (12, 12, 3, 115.00, 345.00, 2),
    (13, 13, 2, 70.00, 140.00, 0),
    (14, 14, 1, 95.00, 95.00, 1),
    (15, 15, 3, 120.00, 360.00, 2);


	select * from hoa_don
