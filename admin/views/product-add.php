<div class="data-card" style="padding: 32px; max-width: 880px; margin: 0 auto;">
    <div class="data-header" style="padding: 0; border: none; margin-bottom: 24px;">
        <div>
            <h3>Thêm Sản phẩm Mới</h3>
            <p style="font-size: 0.85rem; color: #64748b; margin-top: 2px;">Điền thông tin để đăng bán tài nguyên số lên hệ thống</p>
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
                <input type="text" name="name" class="form-control" value="<?= e($old['name']) ?>" required placeholder="VD: Source Code Web Bán Hàng PHP...">
            </div>
            
            <div class="form-group">
                <label>Danh mục *</label>
                <select name="category" class="form-control">
                    <option value="Source Code" <?= $old['category'] == 'Source Code' ? 'selected' : '' ?>>Source Code</option>
                    <option value="Template Admin" <?= $old['category'] == 'Template Admin' ? 'selected' : '' ?>>Template Admin</option>
                    <option value="Ebook" <?= $old['category'] == 'Ebook' ? 'selected' : '' ?>>Ebook / Tài liệu</option>
                    <option value="HTML5 Landing" <?= $old['category'] == 'HTML5 Landing' ? 'selected' : '' ?>>HTML5 Landing</option>
                    <option value="Tài khoản/Key" <?= $old['category'] == 'Tài khoản/Key' ? 'selected' : '' ?>>Tài khoản / Key Phần mềm</option>
                </select>
            </div>
        </div>

        <!-- Hàng 2: Loại sản phẩm & Trạng thái -->
        <div class="form-grid">
            <div class="form-group">
                <label>Loại sản phẩm (Cách giao hàng) *</label>
                <select name="product_type" class="form-control" style="border-color: #3b82f6; background-color: #eff6ff;">
                    <option value="file" <?= ($old['product_type'] ?? '') == 'file' ? 'selected' : '' ?>>File (Giao link tải ngay)</option>
                    <option value="account" <?= ($old['product_type'] ?? '') == 'account' ? 'selected' : '' ?>>Tài khoản / Key (Cấp phát tự động từ kho)</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Trạng thái</label>
                <select name="status" class="form-control">
                    <option value="active">Hiển thị (Đang bán)</option>
                    <option value="hidden">Ẩn (Lưu nháp)</option>
                </select>
            </div>
        </div>

        <!-- Hàng 3: Giá gốc & Giá khuyến mãi -->
        <div class="form-grid">
            <div class="form-group">
                <label>Giá gốc (VNĐ) *</label>
                <input type="number" name="price" class="form-control" value="<?= e($old['price']) ?>" required min="0" placeholder="VD: 500000">
            </div>

            <div class="form-group">
                <label>Giá khuyến mãi (VNĐ)</label>
                <input type="number" name="sale_price" class="form-control" value="<?= e($old['sale_price']) ?>" min="0" placeholder="Bỏ trống nếu không giảm giá">
            </div>
        </div>

        <!-- Hàng 4: Link ảnh đại diện -->
        <div class="form-group">
            <label>Link Ảnh đại diện (URL)</label>
            <input type="text" name="image" class="form-control" value="<?= e($old['image'] ?? '') ?>" placeholder="VD: https://i.imgur.com/abcxyz.jpg">
            <small>Bỏ trống sẽ dùng ảnh mặc định của hệ thống.</small>
        </div>

        <!-- Hàng 5: Link tải file -->
        <div class="form-group">
            <label>Link Tải File / Source Code (Chỉ áp dụng cho loại File)</label>
            <input type="text" name="download_link" class="form-control" value="<?= e($old['download_link'] ?? '') ?>" placeholder="VD: https://drive.google.com/...">
            <small>Bỏ trống nếu là sản phẩm loại Tài khoản / Key.</small>
        </div>

        <!-- Hàng 6: Mô tả chi tiết -->
        <div class="form-group">
            <label>Mô tả chi tiết *</label>
            <textarea name="description" class="form-control" rows="6" required placeholder="Nhập các tính năng, công nghệ sử dụng, hướng dẫn cài đặt..."><?= e($old['description']) ?></textarea>
        </div>

        <button type="submit" class="btn btn-primary" style="padding: 13px 28px; width: 100%;">Lưu Sản phẩm Mới</button>
    </form>
</div>
