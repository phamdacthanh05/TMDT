<section class="section" style="padding-top: 120px;">
    <div class="container" style="max-width: 800px;">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px;">
            <div>
                <h2 style="margin: 0; color: #0f172a;"><?= e($ticket['subject']) ?></h2>
                <p style="color: #64748b; font-size: 0.9rem;">Mã phiếu: #<?= $ticket['id'] ?> | Ngày tạo: <?= date('d/m/Y H:i', strtotime($ticket['created_at'])) ?></p>
            </div>
            <a href="<?= APP_BASE ?>/pages/support-list.php" class="btn btn-outline btn-sm">Quay lại</a>
        </div>

        <div style="background: #fff; border: 1px solid #e2e8f0; border-radius: 12px; overflow: hidden; display: flex; flex-direction: column; height: 600px;">
            <!-- Khung chat -->
            <div style="flex: 1; padding: 24px; overflow-y: auto; background: #f8fafc;">
                <?php foreach ($replies as $r): ?>
                    <?php $isAdmin = ($r['sender_type'] == 'admin'); ?>
                    <div style="display: flex; margin-bottom: 16px; justify-content: <?= $isAdmin ? 'flex-start' : 'flex-end'; ?>;">
                        <div style="max-width: 75%;">
                            <div style="font-size: 0.75rem; color: #64748b; margin-bottom: 4px; text-align: <?= $isAdmin ? 'left' : 'right'; ?>;">
                                <?= $isAdmin ? 'Ban Quản Trị (Admin)' : 'Bạn' ?> - <?= date('H:i d/m', strtotime($r['created_at'])) ?>
                            </div>
                            <div style="padding: 12px 16px; border-radius: 12px; font-size: 0.95rem; line-height: 1.5; <?= $isAdmin ? 'background: #fff; border: 1px solid #e2e8f0; color: #0f172a; border-top-left-radius: 0;' : 'background: #2563eb; color: #fff; border-top-right-radius: 0;' ?>">
                                <?= nl2br(e($r['message'])) ?>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>

            <!-- Form nhập tin nhắn -->
            <div style="padding: 16px; background: #fff; border-top: 1px solid #e2e8f0;">
                <?php if ($ticket['status'] == 'closed'): ?>
                    <p style="text-align: center; color: #64748b;">Phiếu này đã bị đóng. Gửi tin nhắn để mở lại.</p>
                <?php endif; ?>
                <form method="post" style="display: flex; gap: 12px;">
                    <?= csrf_field() ?>
                    <input type="text" name="message" class="form-control" placeholder="Nhập tin nhắn phản hồi..." required style="flex: 1; border-radius: 24px;">
                    <button type="submit" class="btn btn-primary" style="border-radius: 24px; padding: 0 24px;">Gửi</button>
                </form>
            </div>
        </div>
    </div>
</section>