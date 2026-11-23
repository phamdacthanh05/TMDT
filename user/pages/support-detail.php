<?php
require __DIR__ . '/../../shared/bootstrap.php';
if (!is_logged_in()) redirect(APP_BASE . '/pages/auth/login.php');

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$user_id = $_SESSION['user_id'];

$stmt = $db->prepare("SELECT * FROM tickets WHERE id = ? AND user_id = ?");
$stmt->execute([$id, $user_id]);
$ticket = $stmt->fetch();
if (!$ticket) redirect(APP_BASE . '/pages/support-list.php');

// Xử lý gửi tin nhắn trả lời
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    csrf_check();
    $message = trim($_POST['message'] ?? '');
    if ($message) {
        $stmt = $db->prepare("INSERT INTO ticket_replies (ticket_id, sender_type, message) VALUES (?, 'user', ?)");
        $stmt->execute([$id, $message]);
        
        // Đổi trạng thái sang processing nếu đang open
        if ($ticket['status'] == 'closed') {
            $db->prepare("UPDATE tickets SET status = 'open' WHERE id = ?")->execute([$id]);
        }
        redirect(APP_BASE . '/pages/support-detail.php?id=' . $id);
    }
}

// Lấy danh sách tin nhắn
$stmt = $db->prepare("SELECT * FROM ticket_replies WHERE ticket_id = ? ORDER BY created_at ASC");
$stmt->execute([$id]);
$replies = $stmt->fetchAll();

view('support-detail', ['title' => 'Chi tiết yêu cầu #' . $id, 'ticket' => $ticket, 'replies' => $replies]);