-- Thêm thông tin khách hàng và hợp đồng thuê
DELIMITER $$
CREATE PROCEDURE ThemKhachHangVaHopDong(
    IN p_HoTen VARCHAR(100),
    IN p_CoQuan VARCHAR(100),
    IN p_MaNha INT,
    IN p_NgayBatDau DATE,
    IN p_NgayKetThuc DATE
)
BEGIN
    DECLARE new_MaKH INT;
    INSERT INTO KhachHang (HoTen, CoQuan) 
    VALUES (p_HoTen, p_CoQuan);
    SET new_MaKH = LAST_INSERT_ID();
    INSERT INTO HopDong (MaKH, MaNha, NgayBatDau, NgayKetThuc) 
    VALUES (new_MaKH, p_MaNha, p_NgayBatDau, p_NgayKetThuc);
END$$
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

