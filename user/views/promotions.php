<section class="section" style="padding-top: 120px; padding-bottom: 60px;">
    <div class="container" style="max-width: 900px;">
        <div style="text-align: center; margin-bottom: 40px;">
            <h1 class="section-title">Ưu Đãi & Khuyến Mãi</h1>
            <p class="section-subtitle">Săn mã giảm giá và nhận quà tặng hấp dẫn khi mua sắm tại DigitalShop.</p>
        </div>

        <div style="display: grid; gap: 24px;">
            <!-- Ưu đãi cố định: Nạp tiền -->
            <div style="background: linear-gradient(135deg, #eff6ff 0%, #fff 100%); border: 1px solid var(--primary-light); border-radius: 12px; padding: 24px; display: flex; justify-content: space-between; align-items: center; box-shadow: var(--shadow-sm);">
                <div>
                    <h3 style="color: var(--primary); font-size: 1.3rem; margin-bottom: 8px;">🎁 Nạp tiền nhận thưởng</h3>
                    <p style="color: var(--slate-600);">Nạp từ 100.000đ tặng thêm 5%. Nạp từ 500.000đ tặng thêm 10% vào số dư ví.</p>
                </div>
                <a href="<?= APP_BASE ?>/pages/deposit.php" class="btn btn-primary" style="white-space: nowrap;">Nạp ngay</a>
            </div>

            <!-- Hiển thị các mã giảm giá động từ Admin -->
            <?php if (empty($coupons)): ?>
                <div class="alert" style="background: #fff; border: 1px solid #e2e8f0; text-align: center;">
                    <p>Hiện tại chưa có mã giảm giá nào được phát hành. Vui lòng quay lại sau!</p>
                </div>
            <?php else: ?>
                <?php foreach ($coupons as $c): ?>
                    <div style="background: #fff; border: 1px solid var(--slate-200); border-radius: 12px; padding: 24px; display: flex; justify-content: space-between; align-items: center; box-shadow: var(--shadow-sm); position: relative; overflow: hidden;">
                        
                        <!-- Phần thông tin mã -->
                        <div>
                            <h3 style="color: var(--slate-900); font-size: 1.2rem; margin-bottom: 8px;">
                                🔥 Mã giảm giá: 
                                <span style="color: #ef4444; font-weight: 800; font-family: monospace; background: #fee2e2; padding: 2px 8px; border-radius: 4px; font-size: 1.3rem;">
                                    <?= e($c['code']) ?>
                                </span>
                            </h3>
                            
                            <ul style="list-style: none; padding: 0; margin: 0; color: var(--slate-600); font-size: 0.95rem; line-height: 1.6;">
                                <li>✨ Giảm: <b><?= $c['discount_type'] == 'percent' ? $c['discount_value'] . '%' : money($c['discount_value']) ?></b></li>
                                <li>💰 Đơn tối thiểu: <b><?= $c['min_order_value'] == 0 ? 'Không yêu cầu' : money($c['min_order_value']) ?></b></li>
                                <?php if ($c['expires_at']): ?>
                                    <li>⏳ Hạn sử dụng: <b style="color: #d97706;"><?= date('d/m/Y H:i', strtotime($c['expires_at'])) ?></b></li>
                                <?php endif; ?>
                            </ul>
                        </div>

                        <!-- Phần nút hành động -->
                        <div>
                            <?php if (is_logged_in()): ?>
                                <a href="<?= APP_BASE ?>/pages/products.php" class="btn btn-outline" style="white-space: nowrap;">Mua sắm ngay</a>
                            <?php else: ?>
                                <a href="<?= APP_BASE ?>/pages/auth/login.php" class="btn btn-outline" style="white-space: nowrap;">Đăng nhập để dùng</a>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
    </div>
</section>