-- INNER JOIN 
-- Lấy thông tin hợp đồng và khách hàng
SELECT KhachHang.HoTen, HopDong.MaNha, HopDong.NgayBatDau, HopDong.NgayKetThuc
FROM HopDong
INNER JOIN KhachHang ON HopDong.MaKH = KhachHang.MaKH;


-- LEFT OUTER JOIN 
-- Tấy tất cả khách hàng và hợp đồng (bao gồm cả những khách hàng không có hợp đồng)
SELECT KhachHang.HoTen, HopDong.MaNha, HopDong.NgayBatDau, HopDong.NgayKetThuc
FROM KhachHang
LEFT OUTER JOIN HopDong ON KhachHang.MaKH = HopDong.MaKH;


-- SUBQUERY IN WHERE 
-- Tìm kiếm các khách hàng đã thuê nhà có giá thuê trên 10 triệu
SELECT KhachHang.HoTen
FROM KhachHang
WHERE KhachHang.MaKH IN (
    SELECT HopDong.MaKH -- Lọc các khách hàng có hợp đồng thuê nhà với giá thuê > 10 triệu
    FROM HopDong
    INNER JOIN NhaChoThue ON HopDong.MaNha = NhaChoThue.MaNha
    WHERE NhaChoThue.GiaThue > 10000000
);


-- SUBQUERY IN FROM
-- Tính trung bình số hợp đồng của khách hàng cho mỗi cơ quan
SELECT KhachHang.CoQuan, AVG(ContractCount) AS AvgContracts
FROM (
    SELECT KhachHang.MaKH, COUNT(HopDong.MaNha) AS ContractCount
    FROM KhachHang
    JOIN HopDong ON KhachHang.MaKH = HopDong.MaKH
    GROUP BY KhachHang.MaKH
) AS UserContracts
JOIN KhachHang ON UserContracts.MaKH = KhachHang.MaKH
GROUP BY KhachHang.CoQuan;



-- QUERY USING GROUP BY AND AGGREGATE FUNCTIONS
-- Tính tổng số hợp đồng của mỗi khách hàng
SELECT KhachHang.HoTen, COUNT(HopDong.MaNha) AS SoHopDong
FROM KhachHang
LEFT JOIN HopDong ON KhachHang.MaKH = HopDong.MaKH
GROUP BY KhachHang.MaKH;
