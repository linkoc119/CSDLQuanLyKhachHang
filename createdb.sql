DROP DATABASE IF EXISTS DB04;
CREATE DATABASE DB04;
USE DB04;
DROP TABLE IF EXISTS HoaDon;
DROP TABLE IF EXISTS HopDong;
DROP TABLE IF EXISTS NhaChoThue;
DROP TABLE IF EXISTS KhachHang;
DROP TABLE IF EXISTS PhieuThue;

CREATE TABLE KhachHang (
    MaKH INT PRIMARY KEY AUTO_INCREMENT,
    HoTen VARCHAR(100) NOT NULL,
    SoDienThoai VARCHAR(15),
    CoQuan VARCHAR(100)
);

CREATE TABLE NhaChoThue (
    MaNha INT PRIMARY KEY AUTO_INCREMENT,
    DiaChi VARCHAR(255),
    GiaThue DECIMAL(10, 2),
    TenChuNha VARCHAR(100)
);

CREATE TABLE HopDong (
    MaNha INT,
    MaKH INT,
    NgayBatDau DATE,
    NgayKetThuc DATE,
    PRIMARY KEY (MaNha, MaKH),
    FOREIGN KEY (MaNha) REFERENCES NhaChoThue(MaNha),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

CREATE TABLE HoaDon (
    MaHD INT PRIMARY KEY AUTO_INCREMENT,
    MaKH INT,
    MaNha INT,
    TenKH VARCHAR(100),
    NgayLap DATE,
    SoThangThue INT,
    TongTien DECIMAL(15, 2),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
    FOREIGN KEY (MaNha) REFERENCES NhaChoThue(MaNha)
);

CREATE TABLE PhieuThue (
    MaPT INT PRIMARY KEY AUTO_INCREMENT,
    MaNha INT,
    MaKH INT,
    TenKH VARCHAR(100),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    GiaThue DECIMAL(10, 2),
    FOREIGN KEY (MaNha) REFERENCES NhaChoThue(MaNha),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);