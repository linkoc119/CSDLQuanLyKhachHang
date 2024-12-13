-- 1. Tự động xóa tất cả các hợp đồng liên quan đến nhà cho thuê khi một nhà cho thuê bị xóa khỏi hệ thống
DROP TRIGGER IF EXISTS BeforeHouseDelete;
DELIMITER $$
CREATE TRIGGER BeforeHouseDelete
BEFORE DELETE ON NhaChoThue
FOR EACH ROW
BEGIN
    DELETE FROM HopDong WHERE MaNha = OLD.MaNha;
END $$

DELIMITER ;

-- 2. Tự động tính toán và cập nhật lại tổng tiền thuê khi một phiếu thuê mới được thêm vào
DROP TRIGGER IF EXISTS AfterRentalInsert;
DELIMITER $$
CREATE TRIGGER AfterRentalInsert
AFTER INSERT ON PhieuThue
FOR EACH ROW
BEGIN
    UPDATE HoaDon
    SET TongTien = NEW.GiaThue * DATEDIFF(NEW.NgayKetThuc, NEW.NgayBatDau)
    WHERE MaKH = NEW.MaKH AND MaNha = NEW.MaNha;
END $$

DELIMITER ;

-- 3. Tự động xóa tất cả hợp đồng và phiếu thuê liên quan khi một khách hàng bị xóa
DROP TRIGGER IF EXISTS BeforeCustomerDelete;
DELIMITER $$
CREATE TRIGGER BeforeCustomerDelete
BEFORE DELETE ON KhachHang
FOR EACH ROW
BEGIN
    -- Xóa tất cả hợp đồng và phiếu thuê liên quan đến khách hàng trước khi xóa khách hàng
    DELETE FROM HopDong WHERE MaKH = OLD.MaKH;
    DELETE FROM PhieuThue WHERE MaKH = OLD.MaKH;
END $$

DELIMITER ;
