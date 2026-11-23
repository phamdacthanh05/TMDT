<div class="data-card" style="padding: 24px;">
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
        <h3>Kho tài khoản: <?= e($product['name']) ?></h3>
        <a href="<?= ADMIN_BASE ?>/pages/products.php" class="btn btn-sm" style="background: #e2e8f0; color: #0f172a;">Quay lại</a>
    </div>

    <?php if ($success): ?>
        <div style="background: #dcfce7; color: #166534; padding: 12px; border-radius: 8px; margin-bottom: 20px;">✓ <?= $success ?></div>
    <?php endif; ?>

    <!-- Form nhập kho -->
    <form method="post" style="margin-bottom: 30px; background: #f8fafc; padding: 20px; border-radius: 8px; border: 1px solid #e2e8f0;">
        <?= admin_csrf_field() ?>
        <label style="font-weight: 600; display: block; margin-bottom: 8px;">Dán danh sách tài khoản / Key (Mỗi dòng 1 tài khoản)</label>
        <textarea name="stock_data" class="form-control" rows="5" placeholder="canva_user1@gmail.com|pass123&#10;canva_user2@gmail.com|pass456"></textarea>
        <button type="submit" class="btn btn-primary" style="margin-top: 12px;">Nhập vào Kho</button>
    </form>

    <!-- Danh sách kho -->
    <table>
        <thead>
            <tr>
                <th>ID</th><th>Dữ liệu (Account/Key)</th><th>Trạng thái</th><th>Người mua (User ID)</th>
            </tr>
        </thead>
        <tbody>
            <?php if (empty($stocks)): ?>
                <tr><td colspan="4" style="text-align:center;">Kho đang trống. Hãy nhập thêm tài khoản!</td></tr>
            <?php else: ?>
                <?php foreach ($stocks as $s): ?>
                <tr>
                    <td>#<?= $s['id'] ?></td>
                    <td style="font-family: monospace; font-size: 0.9rem;"><?= e($s['account_data']) ?></td>
                    <td>
                        <?php if ($s['status'] == 'available'): ?>
                            <span style="color: #10b981; font-weight: 600;">● Chưa bán (Trong kho)</span>
                        <?php else: ?>
                            <span style="color: #ef4444; font-weight: 600;">○ Đã bán</span>
                        <?php endif; ?>
                    </td>
                    <td><?= $s['user_id'] ? 'User #' . $s['user_id'] : '-' ?></td>
                </tr>
                <?php endforeach; ?>
            <?php endif; ?>
        </tbody>
    </table>
</div>