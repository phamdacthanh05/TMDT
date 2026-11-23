<?php
require __DIR__ . '/../../shared/bootstrap.php';

// 1. Khai báo danh sách danh mục cố định (Khớp với ảnh bạn gửi)
$categories = [
    'Source Code',
    'Template Admin',
    'Ebook', // Sửa lại ở đây cho khớp với Database
    'HTML5 Landing',
    'Tài khoản / Key Phần mềm'
];

// 2. Nhận các tham số lọc từ URL (GET)
$keyword = trim($_GET['keyword'] ?? '');
$category = trim($_GET['category'] ?? '');
$min_price = isset($_GET['min_price']) ? (int)$_GET['min_price'] : 0;
$max_price = isset($_GET['max_price']) ? (int)$_GET['max_price'] : 0;
$sort = $_GET['sort'] ?? 'newest';

// 3. Xây dựng câu truy vấn động
$sql = "SELECT * FROM products WHERE status = 'active'";
$params = [];

// Lọc theo từ khóa
if ($keyword !== '') {
    $sql .= " AND name LIKE ?";
    $params[] = '%' . $keyword . '%';
}

// Lọc theo danh mục
if ($category !== '') {
    $sql .= " AND category = ?";
    $params[] = $category;
}

// Lọc theo khoảng giá (dùng giá sale nếu có, ngược lại giá gốc)
if ($min_price > 0) {
    $sql .= " AND COALESCE(sale_price, price) >= ?";
    $params[] = $min_price;
}
if ($max_price > 0) {
    $sql .= " AND COALESCE(sale_price, price) <= ?";
    $params[] = $max_price;
}

// Sắp xếp
switch ($sort) {
    case 'price_asc':
        $sql .= " ORDER BY COALESCE(sale_price, price) ASC";
        break;
    case 'price_desc':
        $sql .= " ORDER BY COALESCE(sale_price, price) DESC";
        break;
    case 'best_seller':
        $sql .= " ORDER BY sold_count DESC";
        break;
    case 'newest':
    default:
        $sql .= " ORDER BY created_at DESC";
        break;
}

// 4. Thực thi truy vấn
$stmt = $db->prepare($sql);
$stmt->execute($params);
$products = $stmt->fetchAll();

// 5. Truyền dữ liệu sang view
view('products', [
    'title' => 'Tất cả sản phẩm',
    'products' => $products,
    'categories' => $categories, // Truyền mảng cứng sang view
    'filters' => [
        'keyword' => $keyword,
        'category' => $category,
        'min_price' => $min_price,
        'max_price' => $max_price,
        'sort' => $sort,
    ]
]);