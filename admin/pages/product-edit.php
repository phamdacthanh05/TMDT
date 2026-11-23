<?php
require __DIR__ . '/../../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$stmt = $db->prepare("SELECT * FROM products WHERE id = ?");
$stmt->execute([$id]);
$product = $stmt->fetch();

if (!$product) redirect(ADMIN_BASE . '/pages/products.php');

$errors = [];
$old = $product; // Gán dữ liệu cũ vào mảng $old

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    admin_csrf_check();
    
    $old['name'] = trim($_POST['name'] ?? '');
    $old['category'] = $_POST['category'] ?? 'Source Code';
    $old['product_type'] = $_POST['product_type'] ?? 'file'; 
    $old['price'] = (int)($_POST['price'] ?? 0);
    $old['sale_price'] = !empty($_POST['sale_price']) ? (int)$_POST['sale_price'] : null;
    $old['description'] = trim($_POST['description'] ?? '');
    $old['image'] = trim($_POST['image'] ?? '');
    $old['download_link'] = trim($_POST['download_link'] ?? ''); // Nhận link tải
    $old['status'] = $_POST['status'] ?? 'active';

    if (empty($old['name'])) $errors[] = 'Vui lòng nhập tên sản phẩm.';
    if ($old['price'] <= 0) $errors[] = 'Giá sản phẩm phải lớn hơn 0.';
    if (empty($old['description'])) $errors[] = 'Vui lòng nhập mô tả.';

    if (empty($errors)) {
        // Cập nhật thêm cột download_link
        $stmt = $db->prepare("UPDATE products SET name = ?, category = ?, product_type = ?, price = ?, sale_price = ?, description = ?, image = ?, download_link = ?, status = ? WHERE id = ?");
        $stmt->execute([
            $old['name'], $old['category'], $old['product_type'], $old['price'], $old['sale_price'], $old['description'], $old['image'], $old['download_link'], $old['status'], $id
        ]);
        
        $_SESSION['admin_flash_success'] = 'Cập nhật sản phẩm thành công!';
        redirect(ADMIN_BASE . '/pages/products.php');
    }
}

admin_view('product-edit', [
    'title' => 'Sửa Sản phẩm',
    'errors' => $errors,
    'old' => $old,
    'id' => $id
]);