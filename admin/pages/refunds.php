<?php
require __DIR__ . '/../../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');

// Lấy danh sách yêu cầu hoàn tiền
$sql = "SELECT r.*, o.total_amount, u.name as user_name, u.email as user_email 
        FROM refunds r 
        JOIN orders o ON r.order_id = o.id 
        JOIN users u ON r.user_id = u.id 
        ORDER BY r.status ASC, r.created_at DESC";
$refunds = $db->query($sql)->fetchAll();

// Lấy chi tiết sản phẩm của các đơn hàng đang có yêu cầu hoàn tiền
$order_ids = array_column($refunds, 'order_id');
$items_grouped = [];

if (!empty($order_ids)) {
    $inQuery = implode(',', array_fill(0, count($order_ids), '?'));
    // Lấy thông tin sản phẩm và tài khoản đã cấp (nếu có)
    $sql_items = "SELECT oi.*, p.name as product_name, p.product_type, p.image as product_image, 
                         ps.account_data as stock_account, ps.status as stock_status
                  FROM order_items oi 
                  JOIN products p ON oi.product_id = p.id 
                  LEFT JOIN product_stocks ps ON ps.user_id = oi.order_id AND ps.product_id = p.id -- Giả lập mối quan hệ, thực tế lấy từ bảng order_items
                  WHERE oi.order_id IN ($inQuery)";
    
    // Vì bảng order_items đã lưu account_data khi mua, ta chỉ cần lấy từ đó là đủ
    $sql_items = "SELECT oi.*, p.name as product_name, p.product_type, p.image as product_image 
                  FROM order_items oi 
                  JOIN products p ON oi.product_id = p.id 
                  WHERE oi.order_id IN ($inQuery)";
                  
    $stmt_items = $db->prepare($sql_items);
    $stmt_items->execute($order_ids);
    $items = $stmt_items->fetchAll();

    foreach ($items as $item) {
        $items_grouped[$item['order_id']][] = $item;
    }
}

admin_view('refunds', [
    'title' => 'Quản lý Hoàn tiền',
    'refunds' => $refunds,
    'items_grouped' => $items_grouped
]);