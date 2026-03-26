-- ==========================================
-- b. Truy vấn sử dụng các hàm tổng hợp (Aggregate functions)
-- ==========================================

-- 1. Đếm số lượng sản phẩm trong csdl
SELECT COUNT(*) AS tong_so_san_pham FROM products;

-- 2. Đếm số lượng sản phẩm có giá > 1000
SELECT COUNT(*) AS san_pham_gia_cao FROM products WHERE product_price > 1000;

-- 3. Tính tổng số tiền tất cả các sản phẩm có trong csdl
SELECT SUM(product_price) AS tong_gia_tri_san_pham FROM products;

-- 4. Tìm sản phẩm có giá cao nhất trong csdl
-- Cách dùng subquery với MAX() để lấy đầy đủ thông tin sản phẩm
SELECT * FROM products WHERE product_price = (SELECT MAX(product_price) FROM products);

-- 5. Tìm sản phẩm có giá thấp nhất trong csdl
-- Cách dùng subquery với MIN() để lấy đầy đủ thông tin sản phẩm
SELECT * FROM products WHERE product_price = (SELECT MIN(product_price) FROM products);
-- 6. Tính trung bình giá các sản phẩm
SELECT AVG(product_price) AS trung_binh_gia FROM products;

-- 7. Tính tổng tiền của đơn hàng có order_id = 1
-- (Kết nối bảng order_details và products để lấy giá tiền)
SELECT SUM(p.product_price) AS tong_tien_don_1 
FROM order_details od 
JOIN products p ON od.product_id = p.product_id 
WHERE od.order_id = 1;

-- 8. Có bao nhiêu người dùng mua hàng
-- (Đếm số lượng user_id duy nhất trong bảng orders)
SELECT COUNT(DISTINCT user_id) AS so_luong_nguoi_mua FROM orders;

-- 9. Những người dùng nào đã mua hàng
-- (Lấy thông tin user có tồn tại trong bảng orders)
SELECT DISTINCT u.user_id, u.user_name, u.user_email 
FROM users u 
JOIN orders o ON u.user_id = o.user_id;

-- 10. Người dùng nào mua nhiều tiền nhất
-- (Kết nối 4 bảng: users -> orders -> order_details -> products, tính tổng tiền, xếp giảm dần và lấy 1 người đầu tiên)
SELECT u.user_id, u.user_name, SUM(p.product_price) AS tong_tien_mua
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY u.user_id, u.user_name
ORDER BY tong_tien_mua DESC
LIMIT 1;
