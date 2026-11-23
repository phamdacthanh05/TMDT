<section class="section">
    <div class="container">
        <!-- Breadcrumb (Đường dẫn) -->
        <div style="margin-bottom: 24px; font-size: 0.9rem; color: var(--slate-500);">
            <a href="<?= APP_BASE ?>/index.php" style="color: var(--slate-500);">Trang chủ</a> 
            <span style="margin: 0 8px;">/</span>
            <a href="<?= APP_BASE ?>/pages/products.php" style="color: var(--slate-500);">Sản phẩm</a> 
            <span style="margin: 0 8px;">/</span>
            <span style="color: var(--slate-800); font-weight: 600;"><?= e($product['name']) ?></span>
        </div>

        <!-- Khung chi tiết -->
        <div class="product-detail-wrapper">
            <!-- Cột Trái: Ảnh -->
            <div class="product-detail-image">
                <img src="<?= product_image($product['image']) ?>" alt="<?= e($product['name']) ?>">
            </div>

            <!-- Cột Phải: Thông tin -->
            <div class="product-detail-info">
                <span class="product-detail-badge"><?= e($product['category']) ?></span>
                
                <h1 class="product-detail-title"><?= e($product['name']) ?></h1>

                <!-- Giá & Tồn kho -->
                <div class="product-detail-price-box" style="flex-wrap: wrap; align-items: center; gap: 16px;">
                    <?php if ($product['sale_price']): ?>
                        <span class="price-sale"><?= money($product['sale_price']) ?></span>
                        <span class="price-old"><?= money($product['price']) ?></span>
                        <span class="price-discount">
                            -<?= round((1 - $product['sale_price'] / $product['price']) * 100) ?>%
                        </span>
                    <?php else: ?>
                        <span class="price-normal"><?= money($product['price']) ?></span>
                    <?php endif; ?>

                    <!-- HIỂN THỊ SỐ LƯỢNG KHO -->
                    <?php if ($product['product_type'] === 'account'): ?>
                        <?php if ($stock_count > 0): ?>
                            <span style="background: #dcfce7; color: #166534; padding: 6px 12px; border-radius: 8px; font-size: 0.9rem; font-weight: 700; display: inline-flex; align-items: center; gap: 6px;">
                                <span style="width: 8px; height: 8px; background: #10b981; border-radius: 50%; display: inline-block;"></span>
                                Còn hàng (<?= $stock_count ?>)
                            </span>
                        <?php else: ?>
                            <span style="background: #fee2e2; color: #991b1b; padding: 6px 12px; border-radius: 8px; font-size: 0.9rem; font-weight: 700; display: inline-flex; align-items: center; gap: 6px;">
                                <span style="width: 8px; height: 8px; background: #ef4444; border-radius: 50%; display: inline-block;"></span>
                                Tạm hết hàng
                            </span>
                        <?php endif; ?>
                    <?php endif; ?>
                </div>
                

                <!-- Mô tả -->
                <div class="product-detail-desc">
                    <h3>Mô tả sản phẩm</h3>
                    <p><?= nl2br(e($product['description'])) ?></p>
                </div>

                <!-- Nút Mua -->
                <div class="product-detail-actions">
                    <?php if (is_logged_in()): ?>
                        <!-- Đổi thành thẻ <a> trỏ sang trang Checkout (GET) -->
                        <a href="<?= APP_BASE ?>/pages/checkout.php?id=<?= $product['id'] ?>" class="btn btn-primary btn-lg" style="width: 100%; display: flex; align-items: center; justify-content: center; text-decoration: none;">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="margin-right: 8px;">
                                <circle cx="9" cy="21" r="1"></circle>
                                <circle cx="20" cy="21" r="1"></circle>
                                <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                            </svg>
                            Tiến hành thanh toán
                        </a>
                    <?php else: ?>
                        <a href="<?= APP_BASE ?>/pages/auth/login.php" class="btn btn-primary btn-lg" style="width: 100%;">
                            Đăng nhập để mua
                        </a>
                    <?php endif; ?>
                </div>

                <!-- Cam kết -->
                <div class="product-detail-guarantees">
                    <div><span>✓</span> Thanh toán an toàn</div>
                    <div><span>✓</span> Tải file ngay lập tức</div>
                    <div><span>✓</span> Hỗ trợ kỹ thuật 24/7</div>
                </div>
            </div>
        </div>
    </div>
</section>