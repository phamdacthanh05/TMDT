<section class="section" style="padding-top: 120px; padding-bottom: 60px;">
    <div class="container" style="max-width: 600px;">
        <h1 class="section-title" style="margin-bottom: 24px; text-align: center;">Yêu Cầu Hoàn Tiền</h1>
        
        <div style="background: #fff; border: 1px solid #e2e8f0; border-radius: 12px; padding: 32px;">
            <div style="margin-bottom: 24px; padding: 16px; background: var(--slate-50); border-radius: 8px;">
                <p style="margin: 0; color: var(--slate-600);">Mã đơn hàng: <strong>#<?= $order['id'] ?></strong></p>
                <p style="margin: 4px 0 0 0; color: var(--slate-600);">Số tiền: <strong style="color: #ef4444;"><?= money($order['total_amount']) ?></strong></p>
            </div>

            <?php foreach ($errors as $err) echo "<div class='alert alert-error'>$err</div>"; ?>

            <form method="post">
                <?= csrf_field() ?>
                <div class="form-group">
                    <label class="form-label">Lý do hoàn hàng *</label>
                    <textarea name="reason" class="form-control" rows="5" required placeholder="Vui lòng mô tả chi tiết lý do bạn muốn hoàn tiền (VD: Tài khoản bị sai mật khẩu, không đúng mô tả...)"></textarea>
                </div>

                <div style="display: flex; gap: 12px;">
                    <a href="<?= APP_BASE ?>/pages/my-orders.php" class="btn btn-outline" style="width: 50%;">Hủy bỏ</a>
                    <button type="submit" class="btn btn-primary" style="width: 50%;">Gửi yêu cầu</button>
                </div>
            </form>
        </div>
    </div>
</section>