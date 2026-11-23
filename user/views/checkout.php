<section class="section" style="padding-top: 120px; padding-bottom: 60px; background: var(--slate-50);">
    <div class="container" style="max-width: 900px;">
        <h1 class="section-title" style="margin-bottom: 24px; text-align: center;">Xác Nhận Thanh Toán</h1>

        <?php if (isset($_SESSION['flash_error'])): ?>
            <div class="alert alert-error" style="margin-bottom: 24px;">
                <p><?= $_SESSION['flash_error']; unset($_SESSION['flash_error']); ?></p>
            </div>
        <?php endif; ?>

        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 24px;">
            
            <!-- CỘT TRÁI: SẢN PHẨM & PHƯƠNG THỨC -->
            <div>
                <div style="background: #fff; border: 1px solid var(--slate-200); border-radius: 12px; padding: 24px; margin-bottom: 24px;">
                    <h3 style="margin-bottom: 16px; border-bottom: 1px solid var(--slate-100); padding-bottom: 12px;">Sản phẩm thanh toán</h3>
                    <div style="display: flex; gap: 16px; align-items: center;">
                        <img src="<?= product_image($product['image']) ?>" style="width: 80px; height: 80px; border-radius: 8px; object-fit: cover;">
                        <div>
                            <div style="font-weight: 700; color: var(--slate-900); font-size: 1.1rem;"><?= e($product['name']) ?></div>
                            <div style="color: var(--slate-500); font-size: 0.9rem; margin-top: 4px;">Danh mục: <?= e($product['category']) ?></div>
                            <div style="font-weight: 700; color: #ef4444; margin-top: 8px; font-size: 1.1rem;"><?= money($original_price) ?></div>
                        </div>
                    </div>
                </div>

                <div style="background: #fff; border: 1px solid var(--slate-200); border-radius: 12px; padding: 24px;">
                    <h3 style="margin-bottom: 16px;">Phương thức thanh toán</h3>
                    <div style="display: flex; align-items: center; gap: 12px; padding: 16px; border: 2px solid var(--primary); border-radius: 8px; background: var(--primary-light);">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="var(--primary)" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="2"></rect><path d="M16 10h4a2 2 0 0 1 2 2v2a2 2 0 0 1-2 2h-4"></path><circle cx="18" cy="13" r="1" fill="var(--primary)"></circle></svg>
                        <div>
                            <div style="font-weight: 700; color: var(--primary);">Ví điện tử DigitalShop</div>
                            <div style="font-size: 0.85rem; color: var(--slate-600);">Số dư hiện tại: <b><?= money($user['balance']) ?></b></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- CỘT PHẢI: TÍNH TIỀN & ĐẶT HÀNG -->
            <div>
                <div style="background: #fff; border: 1px solid var(--slate-200); border-radius: 12px; padding: 24px; position: sticky; top: 100px;">
                    <h3 style="margin-bottom: 20px; border-bottom: 1px solid var(--slate-100); padding-bottom: 12px;">Tóm tắt đơn hàng</h3>
                    
                    <!-- FORM ÁP DỤNG MÃ (Chỉ tính toán) -->
                    <form method="POST" action="" style="margin-bottom: 20px;">
                        <input type="hidden" name="action" value="apply_coupon">
                        <input type="hidden" name="product_id" value="<?= $product['id'] ?>">
                        <label class="form-label" style="font-size: 0.9rem;">Mã giảm giá</label>
                        <div style="display: flex; gap: 8px;">
                            <input type="text" name="coupon_code" class="form-control" value="<?= e($coupon_code) ?>" placeholder="Nhập mã..." style="text-transform: uppercase;">
                            <button type="submit" class="btn btn-outline" style="white-space: nowrap;">Áp dụng</button>
                        </div>
                        <?php if ($coupon_error): ?>
                            <small style="color: #ef4444; display: block; margin-top: 6px; font-weight: 600;"><?= $coupon_error ?></small>
                        <?php elseif ($discount_amount > 0): ?>
                            <small style="color: #10b981; display: block; margin-top: 6px; font-weight: 600;">✓ Đã áp dụng mã giảm giá!</small>
                        <?php endif; ?>
                    </form>

                    <div style="border-top: 1px dashed var(--slate-300); margin: 20px 0; padding-top: 20px;">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 12px; color: var(--slate-600);">
                            <span>Tạm tính:</span>
                            <span><?= money($original_price) ?></span>
                        </div>
                        
                        <?php if ($discount_amount > 0): ?>
                        <div style="display: flex; justify-content: space-between; margin-bottom: 12px; color: #10b981; font-weight: 600;">
                            <span>Giảm giá:</span>
                            <span>-<?= money($discount_amount) ?></span>
                        </div>
                        <?php endif; ?>

                        <div style="display: flex; justify-content: space-between; margin-bottom: 20px; font-size: 1.2rem; font-weight: 800; color: var(--slate-900);">
                            <span>Thành tiền:</span>
                            <span style="color: #ef4444;"><?= money($final_price) ?></span>
                        </div>
                    </div>

                    <!-- FORM CHỐT ĐƠN (Có nút xác nhận Modal) -->
                    <form method="POST" action="" id="order-form">
                        <?= csrf_field() ?>
                        <input type="hidden" name="action" value="place_order">
                        <input type="hidden" name="product_id" value="<?= $product['id'] ?>">
                        <input type="hidden" name="coupon_code" value="<?= e($coupon_code) ?>">
                        
                        <button type="button" onclick="showOrderConfirm()" class="btn btn-primary btn-lg" style="width: 100%;">
                            Xác nhận Đặt hàng
                        </button>
                    </form>
                    
                    <a href="<?= APP_BASE ?>/pages/product-detail.php?id=<?= $product['id'] ?>" style="display: block; text-align: center; margin-top: 16px; color: var(--slate-500); font-size: 0.9rem; text-decoration: none;">&larr; Quay lại chi tiết</a>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
function showOrderConfirm() {
    // Sử dụng hàm showConfirm() có sẵn từ file confirm-modal.php
    showConfirm(
        'Bạn có chắc chắn muốn thanh toán <?= money($final_price) ?> bằng ví điện tử không?',
        function() {
            document.getElementById('order-form').submit();
        },
        'Xác nhận thanh toán',
        'Đồng ý',
        false // false = nút màu xanh (hành động bình thường), true = nút màu đỏ (hành động xóa)
    );
}
</script>