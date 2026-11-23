<?php
require __DIR__ . '/../../shared/bootstrap.php';
if (!is_logged_in()) redirect(APP_BASE . '/pages/auth/login.php');

// Nhận dữ liệu từ POST (do Cổng thanh toán gửi về)
$status = $_POST['status'] ?? 'cancel';
$amount = isset($_POST['amount']) ? (int)$_POST['amount'] : 0;
$user_id = $_SESSION['user_id'];

if ($status === 'success' && $amount >= 10000) {
    $db->beginTransaction();
    try {
        // 1. Tính tiền thưởng
        $bonus = 0;
        if ($amount >= 500000) $bonus = (int)($amount * 0.10);
        elseif ($amount >= 100000) $bonus = (int)($amount * 0.05);

        // 2. Lưu lịch sử nạp tiền (Trạng thái Completed)
        $stmt = $db->prepare("INSERT INTO deposits (user_id, amount, bonus, status, created_at) VALUES (?, ?, ?, 'completed', NOW())");
        $stmt->execute([$user_id, $amount, $bonus]);

        // 3. Cộng tiền vào ví
        $total_add = $amount + $bonus;
        $stmt = $db->prepare("UPDATE users SET balance = balance + ? WHERE id = ?");
        $stmt->execute([$total_add, $user_id]);

        // 4. Gửi thông báo cho User
        $msg = "Nạp thành công " . money($amount) . " qua VNPay (Thưởng: " . money($bonus) . "). Số dư được cộng: " . money($total_add) . ".";
        $stmt = $db->prepare("INSERT INTO notifications (user_id, title, message) VALUES (?, 'Nạp tiền thành công', ?)");
        $stmt->execute([$user_id, $msg]);

        $db->commit();
        $_SESSION['flash_success'] = "Giao dịch thành công! Số dư ví đã được cập nhật.";
    } catch (Exception $e) {
        $db->rollBack();
        $_SESSION['flash_error'] = "Lỗi hệ thống: " . $e->getMessage();
    }
} else {
    $_SESSION['flash_error'] = "Giao dịch đã bị hủy bỏ.";
}

// Quay trở lại trang nạp tiền
redirect(APP_BASE . '/pages/deposit.php');