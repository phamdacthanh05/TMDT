<?php
require __DIR__ . '/../../shared/bootstrap.php';

// Lấy các mã giảm giá đang hoạt động (active), chưa hết hạn và còn lượt dùng
$sql = "SELECT * FROM coupons 
        WHERE status = 'active' 
        AND (expires_at IS NULL OR expires_at > NOW()) 
        AND (usage_limit = 0 OR used_count < usage_limit)
        ORDER BY created_at DESC";
$stmt = $db->query($sql);
$coupons = $stmt->fetchAll();

view('promotions', [
    'title' => 'Chương trình khuyến mãi',
    'coupons' => $coupons // Truyền dữ liệu sang view
]);