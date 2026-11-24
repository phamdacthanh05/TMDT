<div class="data-card">
    <?php if (isset($_SESSION['admin_flash_success'])): ?>
        <div style="background: var(--success-bg); color: var(--success-text); border: 1px solid var(--success-border); padding: 14px 20px; border-radius: 10px; margin: 20px 24px 0 24px; font-weight: 600; display: flex; align-items: center; gap: 8px;">
            <span>✓</span> <?= $_SESSION['admin_flash_success']; unset($_SESSION['admin_flash_success']); ?>
        </div>
    <?php endif; ?>

    <div class="data-header">
        <div>
            <h3>Danh sách Tài nguyên số</h3>
            <p style="font-size: 0.85rem; color: #64748b; margin-top: 2px;">Quản lý kho Source Code, Template và Tài liệu số</p>
        </div>
        <a href="<?= ADMIN_BASE ?>/pages/product-add.php" class="btn btn-primary btn-sm">+ Thêm sản phẩm</a>
    </div>

    <div class="table-responsive">
        <table>
            <thead>
                <tr>
                    <th style="width: 70px;">ID</th>
                    <th style="width: 70px;">Ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá bán</th>
                    <th>Đã bán</th>
                    <th>Trạng thái</th>
                    <th style="text-align: right; width: 180px;">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($products)): ?>
                    <tr><td colspan="7" style="text-align: center; padding: 36px; color: #64748b;">Chưa có sản phẩm nào trong hệ thống.</td></tr>
                <?php else: ?>
                    <?php foreach ($products as $p): ?>
                    <tr>
                        <td style="font-weight: 700; color: #64748b;">#<?= $p['id'] ?></td>
                        <td>
                            <img src="<?= product_image($p['image']) ?>" alt="" style="width: 44px; height: 44px; object-fit: cover; border-radius: 8px; border: 1px solid #e2e8f0;">
                        </td>
                        <td>
                            <div style="font-weight: 600; color: #0f172a;"><?= e($p['name']) ?></div>
                            <div style="font-size: 0.75rem; color: #64748b;"><?= e($p['category'] ?? 'Tài nguyên số') ?></div>
                        </td>
                        <td>
                            <span style="color: #2563eb; font-weight: 700;"><?= money($p['sale_price'] ?: $p['price']) ?></span>
                            <?php if ($p['sale_price']): ?>
                                <span style="font-size: 0.75rem; color: #94a3b8; text-decoration: line-through; display: block;"><?= money($p['price']) ?></span>
                            <?php endif; ?>
                        </td>
                        <td style="font-weight: 600; color: #0f172a;"><?= number_format($p['sold_count']) ?></td>
                        
                        <td>
                            <?php if ($p['status'] == 'active'): ?>
                                <span class="badge badge-success">● Đang bán</span>
                            <?php else: ?>
                                <span class="badge badge-muted">○ Đã ẩn</span>
                            <?php endif; ?>
                        </td>
                        
                        <td style="text-align: right;">
                            <div class="action-group" style="justify-content: flex-end;">
                                <?php if ($p['product_type'] == 'account'): ?>
                                    <a href="<?= ADMIN_BASE ?>/pages/product-stock.php?id=<?= $p['id'] ?>" class="btn-action btn-action-stock" title="Quản lý kho Key/Tài khoản">Kho</a>
                                <?php endif; ?>

                                <a href="<?= ADMIN_BASE ?>/pages/product-edit.php?id=<?= $p['id'] ?>" class="btn-action btn-action-edit">Sửa</a>
                                <a href="<?= ADMIN_BASE ?>/pages/product-delete.php?id=<?= $p['id'] ?>" 
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');" 
                                   class="btn-action btn-action-delete">Xóa</a>
                            </div>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>
