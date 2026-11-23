<div class="data-card" style="padding: 24px; max-width: 800px;">
    <div class="data-header" style="padding: 0; border: none; margin-bottom: 20px;">
        <h3>Tạo Mã Giảm Giá Mới</h3>
        <a href="<?= ADMIN_BASE ?>/pages/coupons.php" class="btn btn-sm" style="background: #e2e8f0; color: #0f172a;">Quay lại</a>
    </div>

    <?php if (!empty($errors)): ?>
        <div style="background: #fee2e2; color: #991b1b; padding: 12px; border-radius: 8px; margin-bottom: 20px;">
            <?php foreach ($errors as $err) echo "<div>• $err</div>"; ?>
        </div>
    <?php endif; ?>

    <form method="post">
        <?= admin_csrf_field() ?>
        
        <!-- Hàng 1: Mã Code & Trạng thái -->
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
            <div class="form-group">
                <label>Mã giảm giá (Code) *</label>
                <input type="text" name="code" class="form-control" value="<?= e($old['code']) ?>" required placeholder="VD: SALE20, TET2024..." style="text-transform: uppercase;">
                <small style="color:#64748b; display:block; margin-top:4px;">Viết liền không dấu, khách hàng sẽ nhập mã này khi thanh toán.</small>
            </div>
            
            <div class="form-group">
                <label>Trạng thái</label>
                <select name="status" class="form-control">
                    <option value="active" <?= ($old['status'] ?? '') == 'active' ? 'selected' : '' ?>>Kích hoạt (Cho phép dùng)</option>
                    <option value="hidden" <?= ($old['status'] ?? '') == 'hidden' ? 'selected' : '' ?>>Tạm ẩn (Không cho dùng)</option>
                </select>
            </div>
        </div>

        <!-- Hàng 2: Loại giảm giá & Giá trị -->
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
            <div class="form-group">
                <label>Hình thức giảm giá *</label>
                <select name="discount_type" class="form-control">
                    <option value="percent" <?= $old['discount_type'] == 'percent' ? 'selected' : '' ?>>Giảm theo phần trăm (%)</option>
                    <option value="fixed" <?= $old['discount_type'] == 'fixed' ? 'selected' : '' ?>>Giảm số tiền cố định (VNĐ)</option>
                </select>
            </div>

            <div class="form-group">
                <label>Giá trị giảm *</label>
                <input type="number" name="discount_value" class="form-control" value="<?= e($old['discount_value']) ?>" required min="1" placeholder="VD: 20 (tương đương 20% hoặc 20.000đ)">
            </div>
        </div>

        <!-- Hàng 3: Đơn tối thiểu & Số lượng -->
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
            <div class="form-group">
                <label>Giá trị đơn hàng tối thiểu (VNĐ)</label>
                <input type="number" name="min_order_value" class="form-control" value="<?= e($old['min_order_value']) ?>" min="0" step="10000" placeholder="VD: 100000">
                <small style="color:#64748b; display:block; margin-top:4px;">Nhập 0 nếu không yêu cầu giá trị tối thiểu.</small>
            </div>

            <div class="form-group">
                <label>Số lượng mã phát hành</label>
                <input type="number" name="usage_limit" class="form-control" value="<?= e($old['usage_limit']) ?>" min="0" placeholder="VD: 100">
                <small style="color:#64748b; display:block; margin-top:4px;">Nhập 0 nếu muốn phát hành không giới hạn.</small>
            </div>
        </div>

        <!-- Hàng 4: Ngày hết hạn -->
        <div class="form-group">
            <label>Ngày hết hạn (Tùy chọn)</label>
            <input type="datetime-local" name="expires_at" class="form-control" value="<?= $old['expires_at'] ?>">
            <small style="color:#64748b; display:block; margin-top:4px;">Bỏ trống nếu muốn mã có hiệu lực vĩnh viễn.</small>
        </div>

        <button type="submit" class="btn btn-primary" style="padding: 12px 24px; margin-top: 10px;">Lưu Mã Giảm Giá</button>
    </form>
</div>