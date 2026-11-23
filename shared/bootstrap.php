<?php
define('APP_BASE', '/TMDT/user');
define('APP_NAME', 'DigitalShop');
define('IMG_URL', '/TMDT/images');

$host = '127.0.0.1'; $dbname = 'digital_shop'; $user = 'root'; $pass = '';
try {
    $db = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $user, $pass);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch (Exception $e) {
    die("Lỗi kết nối DB: " . $e->getMessage());
}

if (session_status() === PHP_SESSION_NONE) session_start();

function e($s) { return htmlspecialchars($s ?? '', ENT_QUOTES, 'UTF-8'); }
function redirect($url) { header("Location: $url"); exit; }
function money($amount) { return number_format($amount, 0, ',', '.') . 'đ'; }
function is_logged_in() { return isset($_SESSION['user_id']); }

function current_user() {
    global $db;
    if (!is_logged_in()) return null;
    $stmt = $db->prepare("SELECT * FROM users WHERE id = ?");
    $stmt->execute([$_SESSION['user_id']]);
    return $stmt->fetch();
}

function csrf_field() {
    if (empty($_SESSION['csrf'])) $_SESSION['csrf'] = bin2hex(random_bytes(32));
    return '<input type="hidden" name="_csrf" value="' . $_SESSION['csrf'] . '">';
}
function csrf_check() {
    if (empty($_POST['_csrf']) || $_POST['_csrf'] !== ($_SESSION['csrf'] ?? '')) {
        die('Lỗi bảo mật CSRF. Vui lòng F5 tải lại trang.');
    }
}

function view($template, $data = [], $layout = 'user') {
    extract($data);
    require __DIR__ . '/../user/views/layouts/' . $layout . '.php';
}
// Hàm tự động nhận diện link ảnh ngoài hay ảnh nội bộ
function product_image($image) {
    if (empty($image)) return IMG_URL . '/hero.jpg'; // Ảnh mặc định
    
    // Nếu chuỗi bắt đầu bằng http:// hoặc https:// thì trả về nguyên gốc
    if (strpos($image, 'http://') === 0 || strpos($image, 'https://') === 0) {
        return $image;
    }
    
    // Nếu chỉ là tên file (VD: hero.jpg) thì ghép với đường dẫn thư mục ảnh
    return IMG_URL . '/' . $image;
}