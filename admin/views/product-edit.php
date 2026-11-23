<div class="data-card" style="padding: 24px; max-width: 800px;">
    <div class="data-header" style="padding: 0; border: none; margin-bottom: 20px;">
        <h3>Sửa Sản phẩm: <?= e($old['name']) ?></h3>
        <a href="<?= ADMIN_BASE ?>/pages/products.php" class="btn btn-sm" style="background: #e2e8f0; color: #0f172a;">Quay lại</a>
    </div>

    <?php if (!empty($errors)): ?>
        <div style="background: #fee2e2; color: #991b1b; padding: 12px; border-radius: 8px; margin-bottom: 20px;">
            <?php foreach ($errors as $err) echo "<div>• $err</div>"; ?>
        </div>
    <?php endif; ?>

    <form method="post">
        <?= admin_csrf_field() ?>
        
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
            <div class="form-group">
                <label>Tên sản phẩm *</label>
                <input type="text" name="name" class="form-control" value="<?= e($old['name']) ?>" required>
            </div>
            
            <div class="form-group">
                <label>Danh mục *</label>
                <select name="category" class="form-control">
                    <?php 
                    // Đồng bộ danh sách này với bên product-add.php
                    $cats = ['Source Code', 'Template Admin', 'Ebook / Tài liệu', 'HTML5 Landing', 'Tài khoản / Key Phần mềm'];
                    foreach ($cats as $c) {
                        // Logic chọn danh mục hiện tại
                        $sel = ($old['category'] == $c) ? 'selected' : '';
                        echo "<option value=\"$c\" $sel>$c</option>";
                    }
                    ?>
                </select>
            </div>
        </div>

        <!-- THÊM PHẦN CHỌN LOẠI SẢN PHẨM -->
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
            <div class="form-group">
                <label>Loại sản phẩm (Cách giao hàng) *</label>
                <select name="product_type" class="form-control" style="border-color: #3b82f6; background: #eff6ff;">
                    <option value="file" <?= ($old['product_type'] ?? '') == 'file' ? 'selected' : '' ?>>File (Giao link tải)</option>
                    <option value="account" <?= ($old['product_type'] ?? '') == 'account' ? 'selected' : '' ?>>Tài khoản / Key (Cấp phát từ kho)</option>
                </select>
            </div>

            <div class="form-group">
                <label>Trạng thái</label>
                <select name="status" class="form-control">
                    <option value="active" <?= $old['status'] == 'active' ? 'selected' : '' ?>>Hiển thị</option>
                    <option value="hidden" <?= $old['status'] == 'hidden' ? 'selected' : '' ?>>Ẩn</option>
                </select>
            </div>
        </div>

        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
            <div class="form-group">
                <label>Giá gốc (VNĐ) *</label>
                <input type="number" name="price" class="form-control" value="<?= e($old['price']) ?>" required min="0">
            </div>

            <div class="form-group">
                <label>Giá khuyến mãi (VNĐ)</label>
                <input type="number" name="sale_price" class="form-control" value="<?= e($old['sale_price']) ?>" min="0">
            </div>
        </div>

        <div class="form-group">
            <label>Link Ảnh (URL)</label>
            <input type="text" name="image" class="form-control" value="<?= e($old['image']) ?>">
        </div>

       <div class="form-group">
            <label>Link Tải File / Source Code (Chỉ dùng cho loại File)</label>
            <input type="text" name="download_link" class="form-control" value="<?= e($old['download_link'] ?? '') ?>" placeholder="VD: https://drive.google.com/...">
            <small style="color:#64748b; display:block; margin-top:4px;">Bỏ trống nếu là sản phẩm loại Tài khoản / Key.</small>
        </div>
        
        <div class="form-group">
            <label>Mô tả chi tiết *</label>
            <textarea name="description" class="form-control" rows="5" required><?= e($old['description']) ?></textarea>
        </div>

        <button type="submit" class="btn btn-primary" style="padding: 12px 24px;">Cập nhật Sản phẩm</button>
    </form>
</div>