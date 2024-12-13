INSERT INTO KhachHang (MaKH, HoTen, SoDienThoai, CoQuan) VALUES
(1, 'Nguyễn Văn Linh', '0123456789', 'Bệnh viện Bạch Mai'),
(2, 'Trần Thị Xuyến Chi', '0987654321', 'Công ty Chứng khoán ACB'),
(3, 'Lê Hoàng Nguyễn', '0912345678', 'Trường Đại học FPT'),
(4, 'Phạm Văn Lập', '0908765432', 'Ngân hàng Vietcombank'),
(5, 'Nguyễn Thị Thanh Huyền', '0934567890', 'Bệnh viện Đa khoa Quốc tế Vinmec'),
(6, 'Đoàn Văn Hậu', '0923456789', 'Công ty Samsung Việt Nam'),
(7, 'Võ Thị Quế', '0945678901', 'Truyền hình VTV'),
(8, 'Phạm Minh Hiếu', '0967890123', 'Công ty Google Việt Nam'),
(9, 'Lê Thanh Huyền', '0954321789', 'Công ty Microsoft Việt Nam'),
(10, 'Nguyễn Hoàng Anh', '0976543210', 'Công ty VinGroup');

INSERT INTO NhaChoThue (MaNha, DiaChi, GiaThue, TenChuNha) VALUES
(1, '123 Lê Lợi, Q1', 10000000.00, 'Đỗ Việt Trung'),
(2, '456 Nguyễn Trãi, Q5', 8000000.00, 'Nguyễn Ngọc Bảo Long'),
(3, '789 Trần Hưng Đạo, Q1', 15000000.00, 'Đỗ Quyên'),
(4, '321 Cách Mạng Tháng 8, Q10', 7000000.00, 'Trần Đức Anh'),
(5, '654 Điện Biên Phủ, Q3', 12000000.00, 'Đỗ Nhật Minh'),
(6, '987 Lý Tự Trọng, Q1', 20000000.00, 'Vũ Trung Kiên'),
(7, '213 Pasteur, Q3', 11000000.00, 'Đào Duy Huỳnh'),
(8, '435 Hai Bà Trưng, Q1', 9000000.00, 'Nguyễn Hà Phương'),
(9, '678 Võ Văn Tần, Q3', 17000000.00, 'Đỗ Hoàng Tú'),
(10, '890 Hoàng Diệu, Q4', 6000000.00, 'Phạm Quốc Đạt');

INSERT INTO HopDong (MaNha, MaKH, NgayBatDau, NgayKetThuc) VALUES
(1, 1, '2023-01-01', '2023-12-31'),
(1, 2, '2023-02-01', '2023-12-31'),
(2, 3, '2023-03-01', '2023-11-30'),
(3, 4, '2023-01-15', '2023-10-15'),
(4, 5, '2023-05-01', '2023-09-30'),
(5, 6, '2023-04-01', '2023-12-31'),
(6, 7, '2023-06-01', '2023-12-31'),
(7, 8, '2023-07-01', '2023-12-31'),
(8, 9, '2023-08-01', '2023-12-31'),
(10, 10, '2023-09-01', '2023-12-31');

INSERT INTO PhieuThue (MaPT, MaNha, MaKH, TenKH, NgayBatDau, NgayKetThuc, GiaThue) VALUES
(1, 1, 1, 'Nguyễn Văn Linh', '2023-01-01', '2023-12-31', 10000000.00),
(2, 1, 2, 'Trần Thị Xuyến Chi', '2023-02-01', '2023-12-31', 10000000.00),
(3, 2, 3, 'Lê Hoàng Nguyễn', '2023-03-01', '2023-11-30', 15000000.00),
(4, 3, 4, 'Phạm Văn Lập', '2023-01-15', '2023-10-15', 7000000.00),
(5, 4, 5, 'Nguyễn Thị Thanh Huyền', '2023-05-01', '2023-09-30', 12000000.00),
(6, 5, 6, 'Đoàn Văn Hậu', '2023-04-01', '2023-12-31', 20000000.00),
(7, 6, 7, 'Võ Thị Quế', '2023-06-01', '2023-12-31', 11000000.00),
(8, 7, 8, 'Phạm Minh Hiếu', '2023-07-01', '2023-12-31', 9000000.00),
(9, 8, 9, 'Lê Thanh Huyền', '2023-08-01', '2023-12-31', 17000000.00),
(10, 10, 10, 'Nguyễn Hoàng Anh', '2023-09-01', '2023-12-31', 6000000.00);

INSERT INTO HoaDon (MaHD, MaKH, MaNha, TenKH, NgayLap, SoThangThue, TongTien) VALUES
(1, 1, 1, 'Nguyễn Văn Linh', '2023-01-10', 12, 120000000.00),
(2, 2, 1, 'Trần Thị Xuyến Chi', '2023-02-10', 12, 120000000.00),
(3, 3, 2, 'Lê Hoàng Nguyễn', '2023-03-10', 9, 135000000.00),
(4, 4, 3, 'Phạm Văn Lập', '2023-01-20', 9, 63000000.00),
(5, 5, 4, 'Nguyễn Thị Thanh Huyền', '2023-05-10', 5, 60000000.00),
(6, 6, 5, 'Đoàn Văn Hậu', '2023-04-15', 9, 180000000.00),
(7, 7, 6, 'Võ Thị Quế', '2023-06-10', 7, 77000000.00),
(8, 8, 7, 'Phạm Minh Hiếu', '2023-07-10', 6, 54000000.00),
(9, 9, 8, 'Lê Thanh Huyền', '2023-08-10', 5, 85000000.00),
(10, 10, 10, 'Nguyễn Hoàng Anh', '2023-09-15', 4, 24000000.00);