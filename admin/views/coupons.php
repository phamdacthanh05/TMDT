<div class="data-card" style="padding: 24px;">
    <?php if (isset($_SESSION['admin_flash_success'])): ?>
        <div style="background: #dcfce7; color: #166534; padding: 16px; border-radius: 8px; margin-bottom: 20px; font-weight: 600;">
            ✓ <?= $_SESSION['admin_flash_success']; unset($_SESSION['admin_flash_success']); ?>
        </div>
    <?php endif; ?>

    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
        <h3>Danh sách Mã giảm giá</h3>
        <a href="<?= ADMIN_BASE ?>/pages/coupon-add.php" class="btn btn-primary btn-sm">+ Tạo mã mới</a>
    </div>

    <table style="width: 100%; border-collapse: collapse; text-align: left;">
        <thead>
            <tr style="border-bottom: 1px solid #e2e8f0;">
                <th style="padding: 12px 8px;">Mã Code</th>
                <th style="padding: 12px 8px;">Giảm giá</th>
                <th style="padding: 12px 8px;">Đơn tối thiểu</th>
                <th style="padding: 12px 8px;">Đã dùng / Tổng số</th>
                <th style="padding: 12px 8px;">Hết hạn</th>
                <th style="padding: 12px 8px;">Trạng thái</th>
                <th style="padding: 12px 8px;">Hành động</th>
            </tr>
        </thead>
        <tbody>
            <?php if (empty($coupons)): ?>
                <tr><td colspan="7" style="text-align: center; padding: 20px;">Chưa có mã giảm giá nào.</td></tr>
            <?php else: ?>
                <?php foreach ($coupons as $c): ?>
                <tr style="border-bottom: 1px solid #f1f5f9;">
                    <td style="padding: 12px 8px; font-weight: 700; color: #2563eb; font-family: monospace; font-size: 1.1rem;"><?= e($c['code']) ?></td>
                    <td style="padding: 12px 8px;">
                        <?php if ($c['discount_type'] == 'percent'): ?>
                            <span style="color: #ef4444; font-weight: 700;">-<?= $c['discount_value'] ?>%</span>
                        <?php else: ?>
                            <span style="color: #ef4444; font-weight: 700;">-<?= money($c['discount_value']) ?></span>
                        <?php endif; ?>
                    </td>
                    <td style="padding: 12px 8px;"><?= money($c['min_order_value']) ?></td>
                    <td style="padding: 12px 8px;"><strong><?= $c['used_count'] ?></strong> / <?= $c['usage_limit'] == 0 ? '∞' : $c['usage_limit'] ?></td>
                    <td style="padding: 12px 8px; color: #64748b;"><?= $c['expires_at'] ? date('d/m/Y H:i', strtotime($c['expires_at'])) : 'Không có' ?></td>
                    <td style="padding: 12px 8px;">
                        <?php if ($c['status'] == 'active'): ?>
                            <span style="color: #10b981; font-weight: 600;">● Đang chạy</span>
                        <?php else: ?>
                            <span style="color: #64748b; font-weight: 600;">○ Đã ẩn</span>
                        <?php endif; ?>
                    </td>
                    <td style="padding: 12px 8px;">
                        <a href="<?= ADMIN_BASE ?>/pages/coupons.php?delete_id=<?= $c['id'] ?>" onclick="return confirm('Bạn có chắc muốn xóa mã này?');" style="color:#ef4444; text-decoration: none; font-weight: 600;">Xóa</a>
                    </td>
                </tr>
                <?php endforeach; ?>
            <?php endif; ?>
        </tbody>
    </table>
</div>