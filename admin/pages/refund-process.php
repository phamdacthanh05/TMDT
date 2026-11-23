<?php
require __DIR__ . '/../../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');

$id = isset($_REQUEST['id']) ? (int)$_REQUEST['id'] : 0;
$action = $_REQUEST['action'] ?? '';

if ($id <= 0 || !in_array($action, ['approve', 'reject'])) {
    redirect(ADMIN_BASE . '/pages/refunds.php');
}

// Lấy thông tin yêu cầu (Bỏ điều kiện status = 'pending' để có thể duyệt lại)
$stmt = $db->prepare("SELECT * FROM refunds WHERE id = ?");
$stmt->execute([$id]);
$refund = $stmt->fetch();

if (!$refund) {
    $_SESSION['admin_flash_error'] = 'Yêu cầu này không tồn tại.';
    redirect(ADMIN_BASE . '/pages/refunds.php');
}

// Nếu đã duyệt rồi thì không làm gì nữa để tránh cộng tiền 2 lần
if ($refund['status'] === 'approved') {
    $_SESSION['admin_flash_error'] = 'Yêu cầu này đã được duyệt hoàn tiền trước đó.';
    redirect(ADMIN_BASE . '/pages/refunds.php');
}

$db->beginTransaction();
try {
    if ($action === 'approve') {
        // Lấy số tiền của đơn hàng
        $stmt = $db->prepare("SELECT total_amount FROM orders WHERE id = ?");
        $stmt->execute([$refund['order_id']]);
        $amount = (int)$stmt->fetchColumn();

        // 1. Cập nhật trạng thái yêu cầu thành Đã duyệt, xóa lý do từ chối cũ (nếu có)
        $db->prepare("UPDATE refunds SET status = 'approved', admin_note = NULL WHERE id = ?")->execute([$id]);

        // 2. Cập nhật đơn hàng thành Đã hủy
        $db->prepare("UPDATE orders SET status = 'cancelled' WHERE id = ?")->execute([$refund['order_id']]);

        // 3. Cộng lại tiền vào ví cho khách
        $db->prepare("UPDATE users SET balance = balance + ? WHERE id = ?")->execute([$amount, $refund['user_id']]);

        // 4. Gửi thông báo cho khách
        $msg = "Yêu cầu hoàn tiền cho đơn hàng #{$refund['order_id']} đã được duyệt. Số tiền " . money($amount) . " đã được cộng lại vào ví của bạn.";
        $db->prepare("INSERT INTO notifications (user_id, title, message) VALUES (?, 'Hoàn tiền thành công', ?)")->execute([$refund['user_id'], $msg]);

        $_SESSION['admin_flash_success'] = 'Đã duyệt hoàn tiền và cộng lại tiền vào ví khách hàng thành công!';
    } else {
        // XỬ LÝ TỪ CHỐI
        $admin_note = trim($_POST['admin_note'] ?? '');
        if (empty($admin_note)) {
            throw new Exception('Vui lòng nhập lý do từ chối.');
        }

        $db->prepare("UPDATE refunds SET status = 'rejected', admin_note = ? WHERE id = ?")->execute([$admin_note, $id]);
        
        $msg = "Yêu cầu hoàn tiền cho đơn hàng #{$refund['order_id']} đã bị từ chối. Lý do: $admin_note. Vui lòng liên hệ hỗ trợ nếu có thắc mắc.";
        $db->prepare("INSERT INTO notifications (user_id, title, message) VALUES (?, 'Yêu cầu hoàn tiền bị từ chối', ?)")->execute([$refund['user_id'], $msg]);

        $_SESSION['admin_flash_success'] = 'Đã từ chối yêu cầu hoàn tiền.';
    }

    $db->commit();
} catch (Exception $e) {
    $db->rollBack();
    $_SESSION['admin_flash_error'] = 'Lỗi: ' . $e->getMessage();
}

redirect(ADMIN_BASE . '/pages/refunds.php');