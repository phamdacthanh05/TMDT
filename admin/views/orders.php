<div class="data-card">
    <div class="data-header">
        <div>
            <h3>Lịch sử Đơn hàng</h3>
            <p style="font-size: 0.85rem; color: #64748b; margin-top: 2px;">Theo dõi tất cả giao dịch và trạng thái thanh toán</p>
        </div>
    </div>
    
    <div class="table-responsive">
        <table>
            <thead>
                <tr>
                    <th style="width: 90px;">Mã Đơn</th>
                    <th>Khách hàng</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                    <th>Ngày đặt</th>
                    <th style="text-align: right; width: 120px;">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($orders)): ?>
                    <tr><td colspan="6" style="text-align: center; padding: 36px; color: #64748b;">Chưa có đơn hàng nào được ghi nhận.</td></tr>
                <?php else: ?>
                    <?php foreach ($orders as $o): ?>
                    <tr>
                        <td style="font-weight: 700; color: #2563eb;">#<?= $o['id'] ?></td>
                        <td>
                            <div style="font-weight: 600; color: #0f172a;"><?= e($o['user_name']) ?></div>
                            <div style="font-size: 0.8rem; color: #64748b;"><?= e($o['user_email']) ?></div>
                        </td>
                        <td style="font-weight: 700; color: #0f172a;"><?= money($o['total_amount']) ?></td>
                        <td>
                            <?php if ($o['status'] == 'completed'): ?>
                                <span class="badge badge-success">● Thành công</span>
                            <?php elseif ($o['status'] == 'pending'): ?>
                                <span class="badge badge-warning">● Chờ xử lý</span>
                            <?php else: ?>
                                <span class="badge badge-danger">● Đã hủy</span>
                            <?php endif; ?>
                        </td>
                        <td style="color: #64748b; font-size: 0.875rem;"><?= date('d/m/Y H:i', strtotime($o['created_at'])) ?></td>
                        <td style="text-align: right;">
                            <a href="<?= ADMIN_BASE ?>/pages/order-detail.php?id=<?= $o['id'] ?>" class="btn-action btn-action-edit">Xem chi tiết</a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>
