-- Trigger cập nhật giá thuê khi giá thuê của một nhà thay đổi
DELIMITER //
CREATE TRIGGER CapNhatGiaThueHopDong
AFTER UPDATE ON NhaChoThue
FOR EACH ROW
BEGIN
    IF OLD.GiaThue <> NEW.GiaThue THEN
        UPDATE HopDong 
        SET GiaThue = NEW.GiaThue
        WHERE MaNha = NEW.MaNha;
    END IF;
END; //
DELIMITER ;

-- Trigger kiểm tra xem ngày kết thúc hợp đồng có hợp lý không
DELIMITER //
CREATE TRIGGER KiemTraNgayKetThucHopDong
BEFORE INSERT ON HopDong
FOR EACH ROW
BEGIN
    IF NEW.NgayKetThuc <= NEW.NgayBatDau THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ngày kết thúc hợp đồng phải sau ngày bắt đầu';
    END IF;
END; //
DELIMITER ;

-- Trigger tự động cập nhật trạng thái nhà cho thuê khi có khách thuê
DELIMITER //
CREATE TRIGGER CapNhatTinhTrangNhaKhiThue
AFTER INSERT ON HopDong
FOR EACH ROW
BEGIN
    -- Cập nhật trạng thái nhà cho thuê khi có hợp đồng
    UPDATE NhaChoThue
    SET TinhTrang = 'Đã thuê'
    WHERE MaNha = NEW.MaNha;
END; //
DELIMITER ;







