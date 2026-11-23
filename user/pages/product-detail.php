<?php
require __DIR__ . '/../../shared/bootstrap.php';

// Lấy ID từ URL, ép kiểu về số nguyên để bảo mật
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if ($id <= 0) {
    redirect(APP_BASE . '/pages/products.php');
}

// Truy vấn sản phẩm (chỉ lấy sản phẩm đang active)
$stmt = $db->prepare("SELECT * FROM products WHERE id = ? AND status = 'active'");
$stmt->execute([$id]);
$product = $stmt->fetch();

// Nếu không tìm thấy sản phẩm, quay về trang danh sách
if (!$product) {
    redirect(APP_BASE . '/pages/products.php');
}

// ĐẾM SỐ LƯỢNG TỒN KHO (Chỉ áp dụng cho sản phẩm loại 'account')
$stock_count = 0;
if ($product['product_type'] === 'account') {
    $stmt_stock = $db->prepare("SELECT COUNT(*) FROM product_stocks WHERE product_id = ? AND status = 'available'");
    $stmt_stock->execute([$id]);
    $stock_count = $stmt_stock->fetchColumn();
}

view('product-detail', [
    'title' => $product['name'],
    'product' => $product,
    'stock_count' => $stock_count // Truyền biến này sang View
]);