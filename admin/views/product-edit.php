<div class="data-card" style="padding: 32px; max-width: 880px; margin: 0 auto;">
    <div class="data-header" style="padding: 0; border: none; margin-bottom: 24px;">
        <div>
            <h3>Sửa Sản phẩm: <?= e($old['name']) ?></h3>
            <p style="font-size: 0.85rem; color: #64748b; margin-top: 2px;">Chỉnh sửa thông tin, giá và cấu hình giao hàng</p>
        </div>
        <a href="<?= ADMIN_BASE ?>/pages/products.php" class="btn btn-secondary btn-sm">&larr; Quay lại danh sách</a>
    </div>

    <?php if (!empty($errors)): ?>
        <div style="background: var(--danger-bg); color: var(--danger-text); border: 1px solid var(--danger-border); padding: 14px 20px; border-radius: 10px; margin-bottom: 24px;">
            <?php foreach ($errors as $err) echo "<div style='margin-bottom: 4px;'>• $err</div>"; ?>
        </div>
    <?php endif; ?>

    <form method="post">
        <?= admin_csrf_field() ?>
        
        <!-- Hàng 1: Tên & Danh mục -->
        <div class="form-grid">
            <div class="form-group">
                <label>Tên sản phẩm *</label>
                <input type="text" name="name" class="form-control" value="<?= e($old['name']) ?>" required>
            </div>
            
            <div class="form-group">
                <label>Danh mục *</label>
                <select name="category" class="form-control">
                    <?php 
                    $cats = ['Source Code', 'Template Admin', 'Ebook / Tài liệu', 'HTML5 Landing', 'Tài khoản / Key Phần mềm'];
                    foreach ($cats as $c) {
                        $sel = ($old['category'] == $c) ? 'selected' : '';
                        echo "<option value=\"$c\" $sel>$c</option>";
                    }
                    ?>
                </select>
            </div>
        </div>

        <!-- Hàng 2: Loại sản phẩm & Trạng thái -->
        <div class="form-grid">
            <div class="form-group">
                <label>Loại sản phẩm (Cách giao hàng) *</label>
                <select name="product_type" class="form-control" style="border-color: #3b82f6; background-color: #eff6ff;">
                    <option value="file" <?= ($old['product_type'] ?? '') == 'file' ? 'selected' : '' ?>>File (Giao link tải)</option>
                    <option value="account" <?= ($old['product_type'] ?? '') == 'account' ? 'selected' : '' ?>>Tài khoản / Key (Cấp phát từ kho)</option>
                </select>
            </div>

            <div class="form-group">
                <label>Trạng thái</label>
                <select name="status" class="form-control">
                    <option value="active" <?= $old['status'] == 'active' ? 'selected' : '' ?>>Hiển thị (Đang bán)</option>
                    <option value="hidden" <?= $old['status'] == 'hidden' ? 'selected' : '' ?>>Ẩn (Lưu nháp)</option>
                </select>
            </div>
        </div>

        <!-- Hàng 3: Giá gốc & Giá khuyến mãi -->
        <div class="form-grid">
            <div class="form-group">
                <label>Giá gốc (VNĐ) *</label>
                <input type="number" name="price" class="form-control" value="<?= e($old['price']) ?>" required min="0">
            </div>

            <div class="form-group">
                <label>Giá khuyến mãi (VNĐ)</label>
                <input type="number" name="sale_price" class="form-control" value="<?= e($old['sale_price']) ?>" min="0">
            </div>
        </div>

        <!-- Hàng 4: Link ảnh đại diện -->
        <div class="form-group">
            <label>Link Ảnh (URL)</label>
            <input type="text" name="image" class="form-control" value="<?= e($old['image']) ?>">
        </div>

        <!-- Hàng 5: Link tải file -->
        <div class="form-group">
            <label>Link Tải File / Source Code (Chỉ dùng cho loại File)</label>
            <input type="text" name="download_link" class="form-control" value="<?= e($old['download_link'] ?? '') ?>" placeholder="VD: https://drive.google.com/...">
            <small>Bỏ trống nếu là sản phẩm loại Tài khoản / Key.</small>
        </div>
        
        <!-- Hàng 6: Mô tả chi tiết -->
        <div class="form-group">
            <label>Mô tả chi tiết *</label>
            <textarea name="description" class="form-control" rows="6" required><?= e($old['description']) ?></textarea>
        </div>

        <button type="submit" class="btn btn-primary" style="padding: 13px 28px; width: 100%;">Cập nhật Sản phẩm</button>
    </form>
</div>
