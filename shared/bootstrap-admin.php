<?php
define('ADMIN_BASE', '/TMDT/admin'); 
define('APP_NAME', 'DigitalShop Admin');
define('IMG_URL', '/TMDT/images'); 

$host = '127.0.0.1'; $dbname = 'digital_shop'; $user = 'root'; $pass = '';
try {
    $db = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $user, $pass);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch (Exception $e) { die("Lỗi DB: " . $e->getMessage()); }

// SESSION RIÊNG CHO ADMIN
if (session_status() === PHP_SESSION_NONE) {
    session_name('ADMINSESS'); 
    session_start();
}

function e($s) { return htmlspecialchars($s ?? '', ENT_QUOTES, 'UTF-8'); }
function redirect($url) { header("Location: $url"); exit; }
function money($amount) { return number_format($amount, 0, ',', '.') . 'đ'; }
function is_admin_logged_in() { return isset($_SESSION['admin_id']); }
function current_admin() {
    global $db;
    if (!is_admin_logged_in()) return null;
    $stmt = $db->prepare("SELECT * FROM admins WHERE id = ?");
    $stmt->execute([$_SESSION['admin_id']]);
    return $stmt->fetch();
}
function admin_csrf_field() {
    if (empty($_SESSION['admin_csrf'])) $_SESSION['admin_csrf'] = bin2hex(random_bytes(32));
    return '<input type="hidden" name="_csrf" value="' . $_SESSION['admin_csrf'] . '">';
}
function admin_csrf_check() {
    if (empty($_POST['_csrf']) || $_POST['_csrf'] !== ($_SESSION['admin_csrf'] ?? '')) die('Lỗi CSRF.');
}
function admin_view($template, $data = []) {
    extract($data);
    require __DIR__ . '/../admin/views/layouts/admin.php';
}
// Hàm xử lý ảnh (dùng chung cho cả Admin)
function product_image($image) {
    if (empty($image)) return IMG_URL . '/hero.jpg'; // Ảnh mặc định
    if (strpos($image, 'http://') === 0 || strpos($image, 'https://') === 0) {
        return $image;
    }
    return IMG_URL . '/' . $image;
}