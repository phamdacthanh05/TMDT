<?php
require __DIR__ . '/../../shared/bootstrap.php';
if (!is_logged_in()) redirect(APP_BASE . '/pages/auth/login.php');

$user_id = $_SESSION['user_id'];

// Lấy đơn hàng trong 7 ngày VÀ CHƯA BỊ ẨN (is_hidden = 0)
$stmt = $db->prepare("SELECT * FROM orders 
                      WHERE user_id = ? 
                      AND created_at >= DATE_SUB(NOW(), INTERVAL 7 DAY) 
                      AND is_hidden = 0
                      ORDER BY created_at DESC");
$stmt->execute([$user_id]);
$orders = $stmt->fetchAll();

$order_ids = array_column($orders, 'id');
$items_grouped = [];
$refund_info = []; // Biến lưu thông tin hoàn tiền

if (!empty($order_ids)) {
    $inQuery = implode(',', array_fill(0, count($order_ids), '?'));

    // 1. Lấy chi tiết sản phẩm
    $sql = "SELECT oi.*, p.name as product_name, p.product_type, p.image as product_image, p.download_link 
            FROM order_items oi 
            JOIN products p ON oi.product_id = p.id 
            WHERE oi.order_id IN ($inQuery)";
    $stmt = $db->prepare($sql);
    $stmt->execute($order_ids);
    $items = $stmt->fetchAll();

    foreach ($items as $item) {
        $items_grouped[$item['order_id']][] = $item;
    }

    // 2. Lấy thông tin hoàn tiền (refunds) của các đơn hàng này
    $sql_refund = "SELECT * FROM refunds WHERE order_id IN ($inQuery)";
    $stmt_refund = $db->prepare($sql_refund);
    $stmt_refund->execute($order_ids);
    $refunds = $stmt_refund->fetchAll();

    foreach ($refunds as $ref) {
        $refund_info[$ref['order_id']] = $ref;
    }
}

// Truyền dữ liệu sang View
view('my-orders', [
    'title' => 'Lịch sử mua hàng',
    'orders' => $orders,
    'items_grouped' => $items_grouped,
    'refund_info' => $refund_info // BẮT BUỘC PHẢI CÓ DÒNG NÀY
]);