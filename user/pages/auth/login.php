<?php
require __DIR__ . '/../../../shared/bootstrap.php';
if (is_logged_in()) redirect(APP_BASE . '/index.php');

$error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    csrf_check();
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';

    $stmt = $db->prepare("SELECT * FROM users WHERE email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch();

    if ($user && password_verify($password, $user['password_hash'])) {
        $_SESSION['user_id'] = $user['id'];
        redirect(APP_BASE . '/index.php');
    } else {
        $error = 'Email hoặc mật khẩu không đúng.';
    }
}
// Sử dụng layout mặc định user.php (có Navbar sticky và Footer)
view('auth/login', ['title' => 'Đăng nhập', 'error' => $error]);
