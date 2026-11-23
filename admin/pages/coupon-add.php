<?php
require __DIR__ . '/../../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');

$errors = [];
$old = [
    'code' => '', 
    'discount_type' => 'percent', 
    'discount_value' => '', 
    'min_order_value' => 0, 
    'usage_limit' => 0, 
    'expires_at' => ''
];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    admin_csrf_check();
    
    // Lấy dữ liệu từ form
    $old['code'] = strtoupper(trim($_POST['code'] ?? '')); // Chuyển thành chữ hoa
    $old['discount_type'] = $_POST['discount_type'] ?? 'percent';
    $old['discount_value'] = (int)($_POST['discount_value'] ?? 0);
    $old['min_order_value'] = (int)($_POST['min_order_value'] ?? 0);
    $old['usage_limit'] = (int)($_POST['usage_limit'] ?? 0);
    $old['expires_at'] = trim($_POST['expires_at'] ?? '');
    $status = $_POST['status'] ?? 'active';

    // Validate
    if (empty($old['code'])) {
        $errors[] = 'Vui lòng nhập mã giảm giá.';
    } else {
        // Kiểm tra mã đã tồn tại chưa
        $stmt = $db->prepare("SELECT id FROM coupons WHERE code = ?");
        $stmt->execute([$old['code']]);
        if ($stmt->fetch()) {
            $errors[] = 'Mã giảm giá này đã tồn tại trên hệ thống.';
        }
    }

    if ($old['discount_value'] <= 0) {
        $errors[] = 'Giá trị giảm phải lớn hơn 0.';
    }
    if ($old['discount_type'] === 'percent' && $old['discount_value'] > 100) {
        $errors[] = 'Giảm giá theo % không được vượt quá 100%.';
    }

    // Xử lý ngày hết hạn (nếu có)
    $expires_at_sql = !empty($old['expires_at']) ? date('Y-m-d H:i:s', strtotime($old['expires_at'])) : null;

    // Lưu vào Database
    if (empty($errors)) {
        $stmt = $db->prepare("INSERT INTO coupons (code, discount_type, discount_value, min_order_value, usage_limit, expires_at, status) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([
            $old['code'], 
            $old['discount_type'], 
            $old['discount_value'], 
            $old['min_order_value'], 
            $old['usage_limit'], 
            $expires_at_sql, 
            $status
        ]);
        
        $_SESSION['admin_flash_success'] = 'Thêm mã giảm giá thành công!';
        redirect(ADMIN_BASE . '/pages/coupons.php');
    }
}

admin_view('coupon-add', [
    'title' => 'Tạo Mã Giảm Giá Mới',
    'errors' => $errors,
    'old' => $old
]);