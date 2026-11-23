<?php
require __DIR__ . '/../../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

// Lấy thông tin đơn
$stmt = $db->prepare("SELECT o.*, u.name as user_name, u.email as user_email FROM orders o JOIN users u ON o.user_id = u.id WHERE o.id = ?");
$stmt->execute([$id]);
$order = $stmt->fetch();

if (!$order) redirect(ADMIN_BASE . '/pages/orders.php');

$success = '';

// Xử lý đổi trạng thái
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    admin_csrf_check();
    $new_status = $_POST['status'] ?? 'pending';
    
    // Nếu trạng thái thực sự thay đổi thì mới bắn thông báo
    if ($order['status'] !== $new_status) {
        // 1. Cập nhật đơn hàng
        $stmt = $db->prepare("UPDATE orders SET status = ? WHERE id = ?");
        $stmt->execute([$new_status, $id]);
        
        // 2. Tạo thông báo cho User
        $status_text = [
            'pending' => 'đang chờ xử lý', 
            'completed' => 'đã hoàn thành (Hàng đã được giao)', 
            'cancelled' => 'đã bị hủy'
        ];
        $msg = "Đơn hàng #{$id} của bạn " . $status_text[$new_status];
        
        $stmt_notif = $db->prepare("INSERT INTO notifications (user_id, title, message) VALUES (?, 'Cập nhật đơn hàng', ?)");
        $stmt_notif->execute([$order['user_id'], $msg]);
        
        $order['status'] = $new_status;
        $success = 'Đã cập nhật trạng thái và gửi thông báo cho khách hàng!';
    }
}

// Lấy chi tiết các món đồ đã mua
$stmt = $db->prepare("SELECT oi.*, p.name as product_name, p.image as product_image FROM order_items oi JOIN products p ON oi.product_id = p.id WHERE oi.order_id = ?");
$stmt->execute([$id]);
$items = $stmt->fetchAll();

admin_view('order-detail', [
    'title' => 'Chi tiết Đơn hàng #' . $id,
    'order' => $order,
    'items' => $items,
    'success' => $success
]);