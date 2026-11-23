<?php
require __DIR__ . '/../../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');

// Lấy danh sách đơn hàng kèm tên user
$sql = "SELECT o.*, u.name as user_name, u.email as user_email 
        FROM orders o 
        JOIN users u ON o.user_id = u.id 
        ORDER BY o.created_at DESC";
$orders = $db->query($sql)->fetchAll();

admin_view('orders', [
    'title' => 'Quản lý Đơn hàng',
    'orders' => $orders
]);