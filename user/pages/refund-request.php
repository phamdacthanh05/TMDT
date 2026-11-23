<?php
require __DIR__ . '/../../shared/bootstrap.php';
if (!is_logged_in()) redirect(APP_BASE . '/pages/auth/login.php');

$user_id = $_SESSION['user_id'];
$order_id = isset($_GET['order_id']) ? (int)$_GET['order_id'] : 0;

// Kiểm tra đơn hàng có tồn tại và thuộc về user này không
$stmt = $db->prepare("SELECT * FROM orders WHERE id = ? AND user_id = ? AND status = 'completed'");
$stmt->execute([$order_id, $user_id]);
$order = $stmt->fetch();

if (!$order) {
    $_SESSION['flash_error'] = 'Đơn hàng không hợp lệ hoặc không thể hoàn tiền.';
    redirect(APP_BASE . '/pages/my-orders.php');
}

// Kiểm tra xem đơn này đã gửi yêu cầu hoàn tiền chưa
$stmt = $db->prepare("SELECT id FROM refunds WHERE order_id = ?");
$stmt->execute([$order_id]);
if ($stmt->fetch()) {
    $_SESSION['flash_error'] = 'Bạn đã gửi yêu cầu hoàn tiền cho đơn hàng này rồi.';
    redirect(APP_BASE . '/pages/my-orders.php');
}

$errors = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    csrf_check();
    $reason = trim($_POST['reason'] ?? '');

    if (empty($reason)) {
        $errors[] = 'Vui lòng nhập lý do hoàn hàng.';
    }

    if (empty($errors)) {
        // Lưu yêu cầu vào database
        $stmt = $db->prepare("INSERT INTO refunds (order_id, user_id, reason) VALUES (?, ?, ?)");
        $stmt->execute([$order_id, $user_id, $reason]);
        
        $_SESSION['flash_success'] = 'Đã gửi yêu cầu hoàn tiền thành công! Vui lòng chờ Admin xử lý.';
        redirect(APP_BASE . '/pages/my-orders.php');
    }
}

view('refund-request', [
    'title' => 'Yêu cầu hoàn tiền',
    'order' => $order,
    'errors' => $errors
]);