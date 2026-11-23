<?php
require __DIR__ . '/../../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');
$products = $db->query("SELECT * FROM products ORDER BY created_at DESC")->fetchAll();
admin_view('products', ['title' => 'Quản lý Sản phẩm', 'products' => $products]);