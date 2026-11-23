<?php
require __DIR__ . '/../../../shared/bootstrap.php';
if (is_logged_in()) redirect(APP_BASE . '/index.php');

$errors = [];
$old_name = ''; $old_email = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    csrf_check();
    $old_name = trim($_POST['name'] ?? '');
    $old_email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';

    if (!$old_name || !$old_email || !$password) $errors[] = 'Vui lòng nhập đầy đủ thông tin.';
    
    if (empty($errors)) {
        $stmt = $db->prepare("SELECT id FROM users WHERE email = ?");
        $stmt->execute([$old_email]);
        if ($stmt->fetch()) {
            $errors[] = 'Email này đã được đăng ký.';
        } else {
            $stmt = $db->prepare("INSERT INTO users (name, email, password_hash, balance) VALUES (?, ?, ?, 0)");
            $stmt->execute([$old_name, $old_email, password_hash($password, PASSWORD_DEFAULT)]);
            redirect(APP_BASE . '/pages/auth/login.php?registered=1');
        }
    }
}

// Sử dụng layout mặc định user.php (có Navbar sticky và Footer)
view('auth/register', [
    'title' => 'Đăng ký', 
    'errors' => $errors, 
    'old_name' => $old_name, 
    'old_email' => $old_email
]);
