<div class="data-card">
    <?php if (isset($_SESSION['admin_flash_success'])): ?>
        <div style="background: #dcfce7; color: #166534; padding: 16px; border-radius: 8px; margin: 20px 20px 0 20px; font-weight: 600;">
            ✓ <?= $_SESSION['admin_flash_success']; unset($_SESSION['admin_flash_success']); ?>
        </div>
    <?php endif; ?>

    <div class="data-header">
        <h3>Danh sách Tài nguyên số</h3>
        <a href="<?= ADMIN_BASE ?>/pages/product-add.php" class="btn btn-primary btn-sm">+ Thêm sản phẩm</a>
    </div>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Ảnh</th>
                <th>Tên sản phẩm</th>
                <th>Giá bán</th>
                <th>Đã bán</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <?php if (empty($products)): ?>
                <tr><td colspan="7" style="text-align: center;">Chưa có sản phẩm nào.</td></tr>
            <?php else: ?>
                <?php foreach ($products as $p): ?>
                <tr>
                    <td>#<?= $p['id'] ?></td>
                    <td>
                        <!-- Sử dụng hàm product_image() để hiển thị ảnh -->
                        <img src="<?= product_image($p['image']) ?>" alt="" style="width: 50px; height: 50px; object-fit: cover; border-radius: 6px;">
                    </td>
                    <td style="font-weight:600;"><?= e($p['name']) ?></td>
                    <td style="color:#ef4444; font-weight:700;"><?= money($p['sale_price'] ?: $p['price']) ?></td>
                    <td style="font-weight:600; color:#0f172a;"><?= $p['sold_count'] ?></td>
                    
                    <td>
                        <?php if ($p['status'] == 'active'): ?>
                            <span style="color: #10b981; font-weight: 600;">● Đang bán</span>
                        <?php else: ?>
                            <span style="color: #64748b; font-weight: 600;">○ Đã ẩn</span>
                        <?php endif; ?>
                    </td>
                    
                    <td>
                        <!-- NÚT KHO MỚI THÊM VÀO ĐÂY -->
                        <?php if ($p['product_type'] == 'account'): ?>
                            <a href="<?= ADMIN_BASE ?>/pages/product-stock.php?id=<?= $p['id'] ?>" style="color:#f59e0b; text-decoration:none; margin-right:10px; font-weight:700;">Kho</a>
                        <?php endif; ?>

                        <a href="<?= ADMIN_BASE ?>/pages/product-edit.php?id=<?= $p['id'] ?>" style="color:#3b82f6; text-decoration:none; margin-right:10px;">Sửa</a>
                        <a href="<?= ADMIN_BASE ?>/pages/product-delete.php?id=<?= $p['id'] ?>" 
                           onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');" 
                           style="color:#ef4444; text-decoration:none;">Xóa</a>
                    </td>
                </tr>
                <?php endforeach; ?>
            <?php endif; ?>
        </tbody>
    </table>
</div>