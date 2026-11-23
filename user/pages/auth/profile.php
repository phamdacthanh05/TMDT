<?php
require __DIR__ . '/../../../shared/bootstrap.php';

// Bắt buộc phải đăng nhập mới được vào trang này
if (!is_logged_in()) {
    redirect(APP_BASE . '/pages/auth/login.php');
}

$user = current_user();
$errors = [];
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    csrf_check();
    $name = trim($_POST['name'] ?? '');
    $email = trim($_POST['email'] ?? '');

    if (!$name || !$email) {
        $errors[] = 'Vui lòng nhập đầy đủ họ tên và email.';
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = 'Email không hợp lệ.';
    }

    // Kiểm tra xem email mới có bị trùng với người khác không
    if (empty($errors)) {
        $stmt = $db->prepare("SELECT id FROM users WHERE email = ? AND id != ?");
        $stmt->execute([$email, $user['id']]);
        if ($stmt->fetch()) {
            $errors[] = 'Email này đã được sử dụng bởi tài khoản khác.';
        }
    }

    if (empty($errors)) {
        $stmt = $db->prepare("UPDATE users SET name = ?, email = ? WHERE id = ?");
        $stmt->execute([$name, $email, $user['id']]);
        $success = 'Cập nhật thông tin thành công!';
        // Cập nhật lại dữ liệu mới nhất để hiển thị ra form
        $stmt = $db->prepare("SELECT * FROM users WHERE id = ?");
        $stmt->execute([$user['id']]);
        $user = $stmt->fetch();
    }
}

view('auth/profile', [
    'title' => 'Trang cá nhân',
    'user' => $user,
    'errors' => $errors,
    'success' => $success
]);