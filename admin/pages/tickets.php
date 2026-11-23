<?php
require __DIR__ . '/../../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');

$stmt = $db->query("SELECT t.*, u.name as user_name FROM tickets t JOIN users u ON t.user_id = u.id ORDER BY t.status ASC, t.created_at DESC");
$tickets = $stmt->fetchAll();

admin_view('tickets', ['title' => 'Quản lý Hỗ trợ', 'tickets' => $tickets]);