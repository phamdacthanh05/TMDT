<?php
require __DIR__ . '/../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');
$total_products = $db->query("SELECT COUNT(*) FROM products")->fetchColumn();
$total_users = $db->query("SELECT COUNT(*) FROM users")->fetchColumn();
admin_view('dashboard', ['title' => 'Tổng quan', 'total_products' => $total_products, 'total_users' => $total_users]);