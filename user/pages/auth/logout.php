<?php
require __DIR__ . '/../../../shared/bootstrap.php';

// 1. Xóa toàn bộ dữ liệu session
$_SESSION = [];

// 2. Xóa cookie session (nếu có) để trình duyệt không lưu lại
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}

// 3. Hủy session
session_destroy();

// 4. Quay về trang chủ
redirect(APP_BASE . '/index.php');