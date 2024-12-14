-- Tính tổng tiền phải thanh toán của một phiếu thuê
DROP PROCEDURE IF EXISTS TinhTongTienPhieuThue;
DELIMITER $$

CREATE PROCEDURE TinhTongTienPhieuThue(IN MaPhieuThue INT)
BEGIN
    DECLARE SoThang INT;
    DECLARE TongTienThue DECIMAL(15,2);
    DECLARE TongTienDichVu DECIMAL(15, 2);
    DECLARE TongTien DECIMAL(15, 2);
    -- Tính số tháng 
    SELECT
        (DATEDIFF(NgayKetThuc, NgayBatDau)/30)
    INTO SoThang
    FROM PhieuThue
    WHERE MaPT = MaPhieuThue;
    -- Tính tổng tiền dịch vụ
    SELECT COALESCE(SUM(ThanhTien), 0)
    INTO TongTienDichVu
    FROM PhieuDichVu
    WHERE MaPT = MaPhieuThue;
    -- Tính tổng tiền thuê trực tiếp (Giá thuê * Số tháng)
    SELECT GiaThue * SoThang
    INTO TongTienThue
    FROM PhieuThue
    WHERE MaPT = MaPhieuThue;
    -- Cộng tổng tiền thuê và tổng tiền dịch vụ để ra tổng tiền
    SET TongTien = TongTienThue + TongTienDichVu;
    -- Trả về kết quả
    SELECT TongTienThue AS TongTienThue, TongTienDichVu AS TongTienDichVu, TongTien AS TongTienPhiThue;
END $$

DELIMITER ;

-- Thêm thông tin khách hàng và hợp đồng
DROP PROCEDURE IF EXISTS ThemKhachHangVaHopDong;
DELIMITER $$
CREATE PROCEDURE ThemKhachHangVaHopDong(
    IN p_HoTen VARCHAR(100),
    IN p_SoDienThoai VARCHAR(15),
    IN p_CoQuan VARCHAR(100),
    IN p_MaNha INT,
    IN p_NgayBatDau DATE,
    IN p_NgayKetThuc DATE
)
BEGIN
    DECLARE newMaKH INT;
    INSERT INTO KhachHang (HoTen, SoDienThoai, CoQuan)
    VALUES (p_HoTen, p_SoDienThoai, p_CoQuan);
    SET newMaKH = LAST_INSERT_ID();
    INSERT INTO HopDong (MaNha, MaKH, NgayBatDau, NgayKetThuc)
    VALUES (p_MaNha, newMaKH, p_NgayBatDau, p_NgayKetThuc);
END $$
DELIMITER ;

-- Cập nhật giá thuê nhà
DELIMITER $$
CREATE PROCEDURE CapNhatGiaThue(
    IN p_MaNha INT, 
    IN p_GiaThue DECIMAL(10, 2))
BEGIN
    UPDATE NhaChoThue 
    SET GiaThue = p_GiaThue 
    WHERE MaNha = p_MaNha;
END$$
DELIMITER ;

-- Xóa hợp đồng thuê của một khách hàng
DELIMITER $$
CREATE PROCEDURE XoaHopDong(
    IN p_MaKH INT, 
    IN p_MaNha INT)
BEGIN
    DELETE FROM HopDong 
    WHERE MaKH = p_MaKH AND MaNha = p_MaNha;
END$$
DELIMITER ;

