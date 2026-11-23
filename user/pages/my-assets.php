<?php
require __DIR__ . '/../../shared/bootstrap.php';
if (!is_logged_in()) redirect(APP_BASE . '/pages/auth/login.php');

$user_id = $_SESSION['user_id'];

// Lấy danh sách các sản phẩm đã mua (chỉ lấy đơn thành công)
$sql = "SELECT oi.*, p.name as product_name, p.product_type, p.image as product_image, o.created_at as purchase_date 
        FROM order_items oi 
        JOIN orders o ON oi.order_id = o.id 
        JOIN products p ON oi.product_id = p.id 
        WHERE o.user_id = ? AND o.status = 'completed' 
        ORDER BY o.created_at DESC";
$stmt = $db->prepare($sql);
$stmt->execute([$user_id]);
$assets = $stmt->fetchAll();

view('my-assets', [
    'title' => 'Tài sản số của tôi',
    'assets' => $assets
]);