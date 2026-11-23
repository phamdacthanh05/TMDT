<?php
require __DIR__ . '/../../shared/bootstrap.php';
if (!is_logged_in()) redirect(APP_BASE . '/pages/auth/login.php');

$user_id = $_SESSION['user_id'];

// Lấy lịch sử nạp tiền của user này
$stmt = $db->prepare("SELECT * FROM deposits WHERE user_id = ? ORDER BY created_at DESC LIMIT 10");
$stmt->execute([$user_id]);
$deposits = $stmt->fetchAll();

view('deposit', [
    'title' => 'Nạp tiền vào ví',
    'deposits' => $deposits
]);