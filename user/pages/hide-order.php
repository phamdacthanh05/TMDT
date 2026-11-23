<?php
require __DIR__ . '/../../shared/bootstrap.php';
if (!is_logged_in()) redirect(APP_BASE . '/pages/auth/login.php');

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$user_id = $_SESSION['user_id'];

if ($id > 0) {
    // Đánh dấu ẩn đơn hàng (is_hidden = 1)
    $stmt = $db->prepare("UPDATE orders SET is_hidden = 1 WHERE id = ? AND user_id = ?");
    $stmt->execute([$id, $user_id]);
    $_SESSION['flash_success'] = 'Đã ẩn đơn hàng khỏi lịch sử thành công.';
}

redirect(APP_BASE . '/pages/my-orders.php');