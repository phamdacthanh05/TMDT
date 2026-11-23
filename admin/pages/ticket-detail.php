<?php
require __DIR__ . '/../../shared/bootstrap-admin.php';
if (!is_admin_logged_in()) redirect(ADMIN_BASE . '/login.php');

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

$stmt = $db->prepare("SELECT t.*, u.name as user_name, u.email as user_email FROM tickets t JOIN users u ON t.user_id = u.id WHERE t.id = ?");
$stmt->execute([$id]);
$ticket = $stmt->fetch();
if (!$ticket) redirect(ADMIN_BASE . '/pages/tickets.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    admin_csrf_check();
    
    // Nếu Admin đổi trạng thái
    if (isset($_POST['action']) && $_POST['action'] == 'change_status') {
        $status = $_POST['status'] ?? 'open';
        $db->prepare("UPDATE tickets SET status = ? WHERE id = ?")->execute([$status, $id]);
        
        // Báo cho User
        $msg = "Yêu cầu hỗ trợ #$id đã được Admin cập nhật trạng thái: " . strtoupper($status);
        $db->prepare("INSERT INTO notifications (user_id, title, message) VALUES (?, 'Cập nhật Hỗ trợ', ?)")->execute([$ticket['user_id'], $msg]);
        
        redirect(ADMIN_BASE . '/pages/ticket-detail.php?id=' . $id);
    }
    
    // Nếu Admin gửi tin nhắn
    $message = trim($_POST['message'] ?? '');
    if ($message) {
        $db->prepare("INSERT INTO ticket_replies (ticket_id, sender_type, message) VALUES (?, 'admin', ?)")->execute([$id, $message]);
        // Đổi trạng thái sang đang chat
        $db->prepare("UPDATE tickets SET status = 'processing' WHERE id = ? AND status = 'open'")->execute([$id]);
        
        // Báo cho User
        $db->prepare("INSERT INTO notifications (user_id, title, message) VALUES (?, 'Phản hồi hỗ trợ mới', 'Admin vừa trả lời yêu cầu hỗ trợ #$id của bạn.')")->execute([$ticket['user_id']]);
        
        redirect(ADMIN_BASE . '/pages/ticket-detail.php?id=' . $id);
    }
}

$stmt = $db->prepare("SELECT * FROM ticket_replies WHERE ticket_id = ? ORDER BY created_at ASC");
$stmt->execute([$id]);
$replies = $stmt->fetchAll();

admin_view('ticket-detail', ['title' => 'Hỗ trợ #' . $id, 'ticket' => $ticket, 'replies' => $replies]);