<div class="data-card">
    <div class="data-header">
        <h3>Lịch sử Đơn hàng</h3>
    </div>
    <table>
        <thead>
            <tr>
                <th>Mã Đơn</th>
                <th>Khách hàng</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
                <th>Ngày đặt</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <?php if (empty($orders)): ?>
                <tr><td colspan="6" style="text-align: center;">Chưa có đơn hàng nào.</td></tr>
            <?php else: ?>
                <?php foreach ($orders as $o): ?>
                <tr>
                    <td style="font-weight: 700; color: #3b82f6;">#<?= $o['id'] ?></td>
                    <td>
                        <div style="font-weight: 600;"><?= e($o['user_name']) ?></div>
                        <div style="font-size: 0.8rem; color: #64748b;"><?= e($o['user_email']) ?></div>
                    </td>
                    <td style="font-weight: 700; color: #10b981;"><?= money($o['total_amount']) ?></td>
                    <td>
                        <?php if ($o['status'] == 'completed'): ?>
                            <span style="background: #dcfce7; color: #166534; padding: 4px 8px; border-radius: 4px; font-size: 0.85rem; font-weight: 600;">Thành công</span>
                        <?php elseif ($o['status'] == 'pending'): ?>
                            <span style="background: #fef3c7; color: #92400e; padding: 4px 8px; border-radius: 4px; font-size: 0.85rem; font-weight: 600;">Chờ xử lý</span>
                        <?php else: ?>
                            <span style="background: #fee2e2; color: #991b1b; padding: 4px 8px; border-radius: 4px; font-size: 0.85rem; font-weight: 600;">Đã hủy</span>
                        <?php endif; ?>
                    </td>
                    <td style="color: #64748b;"><?= date('d/m/Y H:i', strtotime($o['created_at'])) ?></td>
                    <td>
                        <a href="<?= ADMIN_BASE ?>/pages/order-detail.php?id=<?= $o['id'] ?>" class="btn btn-sm" style="background:#3b82f6; color:#fff; text-decoration:none;">Xem chi tiết</a>
                    </td>
                </tr>
                <?php endforeach; ?>
            <?php endif; ?>
        </tbody>
    </table>
</div>