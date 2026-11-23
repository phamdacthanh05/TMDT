<?php
require __DIR__ . '/../../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$stmt = $db->prepare("SELECT * FROM users WHERE id = ?");
$stmt->execute([$id]);
$user = $stmt->fetch();

if (!$user) redirect(ADMIN_BASE . '/pages/users.php');

$errors = [];
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    admin_csrf_check();
    $action = $_POST['action'] ?? '';

    if ($action === 'adjust_balance') {
        $amount = (int)($_POST['amount'] ?? 0);
        
        if ($amount == 0) {
            $errors[] = 'Số tiền điều chỉnh không được bằng 0.';
        } else {
            $db->beginTransaction();
            try {
                // Khóa dòng user để tránh xung đột
                $stmt = $db->prepare("SELECT balance FROM users WHERE id = ? FOR UPDATE");
                $stmt->execute([$id]);
                $current_balance = (int)$stmt->fetchColumn();
                $new_balance = $current_balance + $amount;

                if ($new_balance < 0) {
                    throw new Exception('Số dư không thể âm. Khách hàng không đủ tiền để trừ.');
                }

                // Cập nhật số dư
                $stmt = $db->prepare("UPDATE users SET balance = ? WHERE id = ?");
                $stmt->execute([$new_balance, $id]);
                
                // Cập nhật lại data hiển thị
                $user['balance'] = $new_balance;

                $db->commit();
                $success = 'Đã cập nhật số dư thành công!';
            } catch (Exception $e) {
                $db->rollBack();
                $errors[] = $e->getMessage();
            }
        }
    } elseif ($action === 'toggle_status') {
        $new_status = ($user['status'] == 'active') ? 'banned' : 'active';
        $stmt = $db->prepare("UPDATE users SET status = ? WHERE id = ?");
        $stmt->execute([$new_status, $id]);
        $user['status'] = $new_status;
        $success = 'Đã thay đổi trạng thái tài khoản.';
    }
}

admin_view('user-detail', [
    'title' => 'Chi tiết Khách hàng',
    'user' => $user,
    'errors' => $errors,
    'success' => $success
]);