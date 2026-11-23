<?php
require __DIR__ . '/../../shared/bootstrap.php';
if (!is_logged_in()) exit(json_encode(['count' => 0, 'notifications' => []]));

$user_id = $_SESSION['user_id'];

// Đếm số thông báo chưa đọc
$stmt = $db->prepare("SELECT COUNT(*) FROM notifications WHERE user_id = ? AND is_read = 0");
$stmt->execute([$user_id]);
$count = $stmt->fetchColumn();

// Lấy 5 thông báo mới nhất
$stmt = $db->prepare("SELECT * FROM notifications WHERE user_id = ? ORDER BY created_at DESC LIMIT 5");
$stmt->execute([$user_id]);
$notifications = $stmt->fetchAll();

echo json_encode(['count' => $count, 'notifications' => $notifications]);