<?php
require __DIR__ . '/../../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if ($id > 0) {
    // Thực hiện xóa
    $stmt = $db->prepare("DELETE FROM products WHERE id = ?");
    $stmt->execute([$id]);
    $_SESSION['admin_flash_success'] = 'Đã xóa sản phẩm thành công!';
}

// Xóa xong quay về danh sách
redirect(ADMIN_BASE . '/pages/products.php');