<?php
require __DIR__ . '/../../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');

// Xử lý xóa mã
if (isset($_GET['delete_id'])) {
    $del_id = (int)$_GET['delete_id'];
    $db->prepare("DELETE FROM coupons WHERE id = ?")->execute([$del_id]);
    $_SESSION['admin_flash_success'] = 'Đã xóa mã giảm giá!';
    redirect(ADMIN_BASE . '/pages/coupons.php');
}

// Lấy danh sách mã
$coupons = $db->query("SELECT * FROM coupons ORDER BY created_at DESC")->fetchAll();

// Gọi View hiển thị danh sách
admin_view('coupons', [
    'title' => 'Quản lý Mã giảm giá',
    'coupons' => $coupons
]);