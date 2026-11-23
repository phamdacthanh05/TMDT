<?php
require __DIR__ . '/../../../shared/bootstrap.php';

if (!is_logged_in()) {
    redirect(APP_BASE . '/pages/auth/login.php');
}

$user = current_user();
$errors = [];
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    csrf_check();
    $old_pass = $_POST['old_password'] ?? '';
    $new_pass = $_POST['new_password'] ?? '';
    $confirm_pass = $_POST['confirm_password'] ?? '';

    // 1. Kiểm tra mật khẩu cũ có đúng không
    if (!password_verify($old_pass, $user['password_hash'])) {
        $errors[] = 'Mật khẩu hiện tại không đúng.';
    }
    
    // 2. Kiểm tra mật khẩu mới
    if (strlen($new_pass) < 6) {
        $errors[] = 'Mật khẩu mới phải có ít nhất 6 ký tự.';
    }
    if ($new_pass !== $confirm_pass) {
        $errors[] = 'Xác nhận mật khẩu mới không khớp.';
    }

    if (empty($errors)) {
        // Mã hóa mật khẩu mới và cập nhật
        $new_hash = password_hash($new_pass, PASSWORD_DEFAULT);
        $stmt = $db->prepare("UPDATE users SET password_hash = ? WHERE id = ?");
        $stmt->execute([$new_hash, $user['id']]);
        $success = 'Đổi mật khẩu thành công!';
    }
}

view('auth/change-password', [
    'title' => 'Đổi mật khẩu',
    'errors' => $errors,
    'success' => $success
]);