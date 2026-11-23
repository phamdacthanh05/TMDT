<div style="display: grid; grid-template-columns: 2fr 1fr; gap: 24px;">
    <div style="background: #fff; border: 1px solid #e2e8f0; border-radius: 12px; overflow: hidden; display: flex; flex-direction: column; height: 600px;">
        <div style="padding: 16px; background: #f8fafc; border-bottom: 1px solid #e2e8f0;">
            <h3 style="margin: 0; color: #0f172a;"><?= e($ticket['subject']) ?></h3>
            <p style="margin: 4px 0 0 0; color: #64748b; font-size: 0.9rem;">Khách: <?= e($ticket['user_name']) ?> (<?= e($ticket['user_email']) ?>)</p>
        </div>
        
        <div style="flex: 1; padding: 24px; overflow-y: auto; background: #f8fafc;">
            <?php foreach ($replies as $r): ?>
                <?php $isAdmin = ($r['sender_type'] == 'admin'); ?>
                <div style="display: flex; margin-bottom: 16px; justify-content: <?= $isAdmin ? 'flex-end' : 'flex-start'; ?>;">
                    <div style="max-width: 75%;">
                        <div style="font-size: 0.75rem; color: #64748b; margin-bottom: 4px; text-align: <?= $isAdmin ? 'right' : 'left'; ?>;">
                            <?= $isAdmin ? 'Bạn (Admin)' : e($ticket['user_name']) ?> - <?= date('H:i d/m', strtotime($r['created_at'])) ?>
                        </div>
                        <div style="padding: 12px 16px; border-radius: 12px; font-size: 0.95rem; line-height: 1.5; <?= $isAdmin ? 'background: #2563eb; color: #fff; border-top-right-radius: 0;' : 'background: #fff; border: 1px solid #e2e8f0; color: #0f172a; border-top-left-radius: 0;' ?>">
                            <?= nl2br(e($r['message'])) ?>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>

        <div style="padding: 16px; background: #fff; border-top: 1px solid #e2e8f0;">
            <form method="post" style="display: flex; gap: 12px;">
                <?= admin_csrf_field() ?>
                <input type="text" name="message" class="form-control" placeholder="Nhập tin nhắn trả lời khách..." required style="flex: 1; border-radius: 24px;">
                <button type="submit" class="btn btn-primary" style="border-radius: 24px; padding: 0 24px;">Gửi</button>
            </form>
        </div>
    </div>

    <!-- Cột Phải: Trạng thái -->
    <div>
        <div class="data-card" style="padding: 24px;">
            <h3 style="margin-bottom: 16px;">Trạng thái Phiếu</h3>
            <form method="post">
                <?= admin_csrf_field() ?>
                <input type="hidden" name="action" value="change_status">
                <select name="status" class="form-control" style="margin-bottom: 12px;">
                    <option value="open" <?= $ticket['status'] == 'open' ? 'selected' : '' ?>>Chờ xử lý (Mở)</option>
                    <option value="processing" <?= $ticket['status'] == 'processing' ? 'selected' : '' ?>>Đang xử lý (Chat)</option>
                    <option value="closed" <?= $ticket['status'] == 'closed' ? 'selected' : '' ?>>Đã đóng (Hoàn tất)</option>
                </select>
                <button type="submit" class="btn btn-primary" style="width: 100%;">Cập nhật trạng thái</button>
            </form>
        </div>
        <a href="<?= ADMIN_BASE ?>/pages/tickets.php" class="btn" style="display:block; text-align:center; background:#e2e8f0; color:#0f172a; text-decoration:none; margin-top: 16px;">Quay lại danh sách</a>
    </div>
</div>