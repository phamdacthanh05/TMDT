<?php
require __DIR__ . '/../../shared/bootstrap.php';
if (!is_logged_in()) redirect(APP_BASE . '/pages/auth/login.php');

$user_id = $_SESSION['user_id'];
$errors = [];
$success = '';

// Lấy danh sách đơn hàng của khách để chọn (chỉ lấy đơn thành công)
$stmt = $db->prepare("SELECT id, created_at FROM orders WHERE user_id = ? AND status = 'completed' ORDER BY created_at DESC");
$stmt->execute([$user_id]);
$orders = $stmt->fetchAll();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    csrf_check();
    $subject = trim($_POST['subject'] ?? '');
    $order_id = !empty($_POST['order_id']) ? (int)$_POST['order_id'] : null;
    $message = trim($_POST['message'] ?? '');

    if (!$subject || !$message) {
        $errors[] = 'Vui lòng nhập tiêu đề và nội dung cần hỗ trợ.';
    }

    if (empty($errors)) {
        $db->beginTransaction();
        try {
            // 1. Tạo phiếu
            $stmt = $db->prepare("INSERT INTO tickets (user_id, order_id, subject) VALUES (?, ?, ?)");
            $stmt->execute([$user_id, $order_id, $subject]);
            $ticket_id = $db->lastInsertId();

            // 2. Thêm tin nhắn đầu tiên
            $stmt = $db->prepare("INSERT INTO ticket_replies (ticket_id, sender_type, message) VALUES (?, 'user', ?)");
            $stmt->execute([$ticket_id, $message]);

            // 3. Báo cho Admin
            $stmt = $db->prepare("INSERT INTO notifications (user_id, title, message) VALUES (1, 'Yêu cầu hỗ trợ mới', 'Khách hàng vừa tạo yêu cầu: $subject')");
            $stmt->execute();

            $db->commit();
            $_SESSION['flash_success'] = 'Đã gửi yêu cầu hỗ trợ thành công!';
            redirect(APP_BASE . '/pages/support-list.php');
        } catch (Exception $e) {
            $db->rollBack();
            $errors[] = 'Lỗi hệ thống: ' . $e->getMessage();
        }
    }
}

view('support-create', ['title' => 'Gửi yêu cầu hỗ trợ', 'errors' => $errors, 'orders' => $orders]);