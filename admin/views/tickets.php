<div class="data-card">
    <div class="data-header"><h3>Danh sách Yêu cầu Hỗ trợ</h3></div>
    <table>
        <thead>
            <tr><th>Mã</th><th>Khách hàng</th><th>Tiêu đề</th><th>Trạng thái</th><th>Ngày</th><th></th></tr>
        </thead>
        <tbody>
            <?php foreach ($tickets as $t): ?>
            <tr>
                <td>#<?= $t['id'] ?></td>
                <td style="font-weight: 600;"><?= e($t['user_name']) ?></td>
                <td><?= e($t['subject']) ?></td>
                <td>
                    <?php if ($t['status'] == 'open'): ?><span style="color: #f59e0b; font-weight: 600;">⏳ Chờ xử lý</span>
                    <?php elseif ($t['status'] == 'processing'): ?><span style="color: #3b82f6; font-weight: 600;">💬 Đang chat</span>
                    <?php else: ?><span style="color: #64748b; font-weight: 600;">✓ Đã đóng</span><?php endif; ?>
                </td>
                <td><?= date('d/m/Y H:i', strtotime($t['created_at'])) ?></td>
                <td><a href="<?= ADMIN_BASE ?>/pages/ticket-detail.php?id=<?= $t['id'] ?>" class="btn btn-sm" style="background:#3b82f6; color:#fff; text-decoration:none;">Xem</a></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>