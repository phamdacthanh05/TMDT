<?php
require __DIR__ . '/../../shared/bootstrap.php';
if (!is_logged_in()) exit;

$stmt = $db->prepare("UPDATE notifications SET is_read = 1 WHERE user_id = ?");
$stmt->execute([$_SESSION['user_id']]);
echo json_encode(['status' => 'success']);