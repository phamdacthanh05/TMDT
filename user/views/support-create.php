<section class="section" style="padding-top: 120px;">
    <div class="container" style="max-width: 800px;">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px;">
            <h1 class="section-title" style="margin: 0;">Gửi Yêu Cầu Hỗ Trợ</h1>
            <a href="<?= APP_BASE ?>/pages/support-list.php" class="btn btn-outline btn-sm">Quay lại danh sách</a>
        </div>

        <div style="background: #fff; border: 1px solid #e2e8f0; border-radius: 12px; padding: 32px;">
            <?php foreach ($errors as $err) echo "<div class='alert alert-error'>$err</div>"; ?>

            <form method="post" class="form">
                <?= csrf_field() ?>
                
                <div class="form-group">
                    <label class="form-label">Tiêu đề vấn đề *</label>
                    <input type="text" name="subject" class="form-control" required placeholder="VD: Tài khoản Canva bị sai mật khẩu...">
                </div>

                <div class="form-group">
                    <label class="form-label">Liên quan đến đơn hàng nào? (Tùy chọn)</label>
                    <select name="order_id" class="form-control">
                        <option value="">-- Không liên quan đến đơn hàng cụ thể --</option>
                        <?php foreach ($orders as $o): ?>
                            <option value="<?= $o['id'] ?>">Đơn hàng #<?= $o['id'] ?> (<?= date('d/m/Y', strtotime($o['created_at'])) ?>)</option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="form-group">
                    <label class="form-label">Nội dung chi tiết *</label>
                    <textarea name="message" class="form-control" rows="6" required placeholder="Mô tả chi tiết lỗi bạn đang gặp phải để Admin dễ dàng hỗ trợ..."></textarea>
                </div>

                <button type="submit" class="btn btn-primary" style="padding: 12px 24px;">Gửi Yêu Cầu</button>
            </form>
        </div>
    </div>
</section>