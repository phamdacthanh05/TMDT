<div style="display: grid; grid-template-columns: 2fr 1fr; gap: 24px;">
    
    <!-- Cột Trái: Danh sách sản phẩm trong đơn -->
    <div class="data-card" style="padding: 24px;">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
            <h3>Sản phẩm trong đơn #<?= $order['id'] ?></h3>
            <a href="<?= ADMIN_BASE ?>/pages/orders.php" class="btn btn-sm" style="background: #e2e8f0; color: #0f172a; text-decoration: none;">Quay lại</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Sản phẩm</th>
                    <th>Giá mua</th>
                    <th>SL</th>
                    <th>Tổng</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($items as $item): ?>
                <tr>
                    <td>
                        <div style="display: flex; align-items: center; gap: 12px;">
                            <img src="<?= product_image($item['product_image']) ?>" style="width: 40px; height: 40px; border-radius: 6px; object-fit: cover;">
                            <span style="font-weight: 600;"><?= e($item['product_name']) ?></span>
                        </div>
                    </td>
                    <td><?= money($item['price']) ?></td>
                    <td>x<?= $item['quantity'] ?></td>
                    <td style="font-weight: 700; color: #ef4444;"><?= money($item['price'] * $item['quantity']) ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3" style="text-align: right; font-weight: 600;">Tổng cộng:</td>
                    <td style="font-size: 1.2rem; font-weight: 800; color: #ef4444;"><?= money($order['total_amount']) ?></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <!-- Cột Phải: Thông tin khách & Trạng thái -->
    <div>
        <div class="data-card" style="padding: 24px; margin-bottom: 24px;">
            <h3 style="margin-bottom: 16px; border-bottom: 1px solid #e2e8f0; padding-bottom: 12px;">Thông tin khách hàng</h3>
            <p style="margin-bottom: 8px;"><strong>Tên:</strong> <?= e($order['user_name']) ?></p>
            <p style="margin-bottom: 8px;"><strong>Email:</strong> <?= e($order['user_email']) ?></p>
            <p style="margin-bottom: 8px;"><strong>Ngày đặt:</strong> <?= date('d/m/Y H:i', strtotime($order['created_at'])) ?></p>
            <p style="margin-bottom: 8px;"><strong>Thanh toán:</strong> Qua ví điện tử</p>
        </div>

        <div class="data-card" style="padding: 24px;">
            <h3 style="margin-bottom: 16px;">Cập nhật Trạng thái</h3>
            
            <?php if ($success): ?>
                <div style="background: #dcfce7; color: #166534; padding: 12px; border-radius: 8px; margin-bottom: 16px;">✓ <?= $success ?></div>
            <?php endif; ?>

            <form method="post">
                <?= admin_csrf_field() ?>
                <div class="form-group">
                    <select name="status" class="form-control" style="font-weight: 600;">
                        <option value="pending" <?= $order['status'] == 'pending' ? 'selected' : '' ?>>Chờ xử lý</option>
                        <option value="completed" <?= $order['status'] == 'completed' ? 'selected' : '' ?>>Hoàn thành (Đã giao hàng)</option>
                        <option value="cancelled" <?= $order['status'] == 'cancelled' ? 'selected' : '' ?>>Hủy đơn hàng</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary" style="width: 100%;">Lưu Trạng thái</button>
            </form>
        </div>
    </div>
</div>