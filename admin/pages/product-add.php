<?php
require __DIR__ . '/../../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');

$errors = [];
$old = ['name' => '', 'category' => 'Source Code', 'product_type' => 'file', 'price' => '', 'sale_price' => '', 'description' => '', 'image' => '', 'download_link' => ''];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    admin_csrf_check();
    
    $old['name'] = trim($_POST['name'] ?? '');
    $old['category'] = $_POST['category'] ?? 'Source Code';
    $old['product_type'] = $_POST['product_type'] ?? 'file'; // Nhận loại sản phẩm
    $old['price'] = (int)($_POST['price'] ?? 0);
    $old['sale_price'] = !empty($_POST['sale_price']) ? (int)$_POST['sale_price'] : null;
    $old['description'] = trim($_POST['description'] ?? '');
    $old['image'] = trim($_POST['image'] ?? '');
    $old['download_link'] = trim($_POST['download_link'] ?? ''); // Nhận link tải
    $status = $_POST['status'] ?? 'active';

    // Validate cơ bản
    if (empty($old['name'])) $errors[] = 'Vui lòng nhập tên sản phẩm.';
    if ($old['price'] <= 0) $errors[] = 'Giá sản phẩm phải lớn hơn 0.';
    if (empty($old['description'])) $errors[] = 'Vui lòng nhập mô tả sản phẩm.';

    // Nếu không có lỗi thì lưu vào Database
    if (empty($errors)) {
        $image_to_save = $old['image'] ?: 'hero.jpg';

        // Thêm cột download_link vào câu lệnh INSERT
        $stmt = $db->prepare("INSERT INTO products (name, category, product_type, price, sale_price, description, image, download_link, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([
            $old['name'], 
            $old['category'], 
            $old['product_type'], 
            $old['price'], 
            $old['sale_price'], 
            $old['description'], 
            $image_to_save, 
            $old['download_link'], // Lưu link tải
            $status
        ]);
        
        $_SESSION['admin_flash_success'] = 'Thêm sản phẩm thành công!';
        redirect(ADMIN_BASE . '/pages/products.php');
    }
}

admin_view('product-add', [
    'title' => 'Thêm Sản phẩm Mới',
    'errors' => $errors,
    'old' => $old
]);