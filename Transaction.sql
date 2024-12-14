-- Thêm khách hàng và hợp đồng, sau đó hủy
START TRANSACTION;
INSERT INTO KhachHang (HoTen, SoDienThoai, CoQuan)
VALUES ('Le Minh Tuan', '0356900905', 'Công ty XYZ');
INSERT INTO HopDong (MaNha, MaKH, NgayBatDau, NgayKetThuc)
VALUES (2, LAST_INSERT_ID(), '2024-12-01', '2025-12-01');
ROLLBACK;

-- Cập nhật tên chủ nhà
START TRANSACTION;
UPDATE NhaChoThue
SET TenChuNha = 'Anh A'
WHERE MaNha = 1;
ROLLBACK;

-- Xóa khách hàng và các thông tin liên quan
START TRANSACTION;
DELETE FROM HoaDon WHERE MaKH = 1;
DELETE FROM PhieuThue WHERE MaKH = 1;
DELETE FROM HopDong WHERE MaKH = 1;
DELETE FROM KhachHang WHERE MaKH = 1;
ROLLBACK;

-- Cập nhật trạng thái nhà và thêm phiếu thuê mới
START TRANSACTION;
UPDATE NhaChoThue
SET TinhTrang = 'Đã thuê'
WHERE MaNha = 3;
INSERT INTO PhieuThue (MaNha, MaKH, NgayBatDau, NgayKetThuc, GiaThue)
VALUES (3, 2, '2024-12-01', '2025-12-01', 3000.00);
ROLLBACK;

-- Đổi trạng thái nhà cho thuê và thêm dịch vụ mới
START TRANSACTION;
UPDATE NhaChoThue
SET TinhTrang = 'Đang bảo trì'
WHERE MaNha = 4;
INSERT INTO DichVu (TenDV, GiaDV)
VALUES ('Dịch vụ vệ sinh', 500.00);
INSERT INTO PhieuDichVu (MaPT, MaDV, NgayLap, ThanhTien)
VALUES (1, LAST_INSERT_ID(), CURDATE(), 500.00);
ROLLBACK;
