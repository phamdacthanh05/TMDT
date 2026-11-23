<?php
require __DIR__ . '/../../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');

$product_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$stmt = $db->prepare("SELECT * FROM products WHERE id = ?");
$stmt->execute([$product_id]);
$product = $stmt->fetch();
if (!$product) redirect(ADMIN_BASE . '/pages/products.php');

$success = '';

// Xử lý khi Admin dán danh sách tài khoản vào
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    admin_csrf_check();
    $raw_data = trim($_POST['stock_data'] ?? '');
    
    if (!empty($raw_data)) {
        // Tách từng dòng (mỗi dòng là 1 tài khoản/key)
        $lines = explode("\n", $raw_data);
        $count = 0;
        
        $stmt_insert = $db->prepare("INSERT INTO product_stocks (product_id, account_data, status) VALUES (?, ?, 'available')");
        
        foreach ($lines as $line) {
            $line = trim($line);
            if (!empty($line)) {
                $stmt_insert->execute([$product_id, $line]);
                $count++;
            }
        }
        $success = "Đã nhập thành công $count tài khoản vào kho!";
    }
}

// Lấy danh sách kho hiện tại
$stmt = $db->prepare("SELECT * FROM product_stocks WHERE product_id = ? ORDER BY id ASC");
$stmt->execute([$product_id]);
$stocks = $stmt->fetchAll();

admin_view('product-stock', [
    'title' => 'Quản lý kho: ' . $product['name'],
    'product' => $product,
    'stocks' => $stocks,
    'success' => $success
]);