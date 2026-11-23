<?php
require __DIR__ . '/../../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');

// Lấy toàn bộ user
$users = $db->query("SELECT * FROM users ORDER BY created_at DESC")->fetchAll();

admin_view('users', [
    'title' => 'Quản lý Người dùng',
    'users' => $users
]);