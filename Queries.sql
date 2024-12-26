-- 1. Query using INNER JOIN
-- Lấy thông tin hợp đồng, khách hàng, và nhà cho thuê
SELECT KhachHang.HoTen AS TenKH, NhaChoThue.DiaChi AS DiaChiNha, HopDong.NgayBatDau, HopDong.NgayKetThuc
FROM HopDong
INNER JOIN KhachHang ON HopDong.MaKH = KhachHang.MaKH
INNER JOIN NhaChoThue ON HopDong.MaNha = NhaChoThue.MaNha;

-- 2. Query using OUTER JOIN
-- Lấy thông tin khách hàng và hợp đồng thuê
SELECT KhachHang.HoTen AS TenKH, NhaChoThue.DiaChi AS DiaChiNha, HopDong.NgayBatDau, HopDong.NgayKetThuc
FROM KhachHang
LEFT OUTER JOIN HopDong ON KhachHang.MaKH = HopDong.MaKH
LEFT OUTER JOIN NhaChoThue ON HopDong.MaNha = NhaChoThue.MaNha;

-- 3. Using Subquery in WHERE
-- Tìm khách hàng có hợp đồng thuê với giá thuê lớn hơn giá thuê trung bình
SELECT KhachHang.HoTen AS TenKH, PhieuThue.GiaThue
FROM KhachHang
INNER JOIN PhieuThue ON KhachHang.MaKH = PhieuThue.MaKH
WHERE PhieuThue.GiaThue > (SELECT AVG(GiaThue) FROM PhieuThue);

-- 4. Using Subquery in FROM
-- Lấy danh sách khách hàng có tổng tiền thuê lớn hơn 100 triệu
SELECT KH.MaKH, KH.HoTen, KH.SoDienThoai, KH.CoQuan, TotalRent.TongTienThue
FROM (
    SELECT PT.MaKH, SUM(PT.GiaThue * (DATEDIFF(PT.NgayKetThuc, PT.NgayBatDau)/30)) AS TongTienThue
    FROM PhieuThue PT
    GROUP BY PT.MaKH
) AS TotalRent
JOIN KhachHang KH ON KH.MaKH = TotalRent.MaKH
WHERE TotalRent.TongTienThue > 100000000;

-- 5. Query using GROUP BY and Aggregate Functions
-- Tính tổng số tiền thuê của các khách hàng
SELECT KhachHang.HoTen AS TenKH, SUM(PhieuThue.GiaThue) AS TongTienThue
FROM KhachHang
INNER JOIN PhieuThue ON KhachHang.MaKH = PhieuThue.MaKH
GROUP BY KhachHang.MaKH;


