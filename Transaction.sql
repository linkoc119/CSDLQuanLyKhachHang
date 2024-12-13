-- Thêm khách hàng và hợp đồng, sau đó hủy
START TRANSACTION;
INSERT INTO KhachHang (HoTen, SoDienThoai, CoQuan)
VALUES ('Nguyen Thi Mai', '0987654321', 'Bệnh viện HCM');
INSERT INTO HopDong (MaKH, MaNha, NgayBatDau, NgayKetThuc)
VALUES (LAST_INSERT_ID(), '11', '2024-01-01', '2025-01-01');
ROLLBACK;

-- Thêm nhà sau đó hủy
START TRANSACTION;
INSERT INTO NhaChoThue (MaNha, DiaChi, GiaThue, TenChuNha)
VALUES (12, '72 Nguyen Trai, Hanoi', 5000, 'Mr. A');
ROLLBACK;

-- Cập nhật hợp đồng và hóa đơn, sau đó hủy
START TRANSACTION;
UPDATE HopDong
SET NgayKetThuc = '2025-12-31'
WHERE MaNha = '1' AND MaKH = 1;
UPDATE HoaDon
SET TongTien = TongTien + 500
WHERE MaKH = 1 AND MaNha = '1';
ROLLBACK;
