<?php
require __DIR__ . '/../shared/bootstrap.php';

// Lấy 4 sản phẩm BÁN CHẠY NHẤT đang active
$stmt = $db->query("SELECT * FROM products WHERE status = 'active' ORDER BY sold_count DESC LIMIT 4");
$featured_products = $stmt->fetchAll();

view('home', [
    'title' => 'Trang chủ',
    'featured_products' => $featured_products
]);