<!-- Hero Section Phong Cách SaaS -->
<section class="hero-section">
    <div class="container">
        <!-- Badge định vị sản phẩm -->
        <div class="hero-badge">
            <span>🚀 Nền tảng phân phối tài nguyên số D2C #1 cho Developers</span>
        </div>

        <!-- Headline chính -->
        <h1 class="hero-title">
            Kho Tài Nguyên Số <span class="gradient-text">Chất Lượng Cao</span> Cho Nhà Sáng Tạo & Lập Trình Viên
        </h1>

        <!-- Đoạn mô tả giá trị -->
        <p class="hero-subtitle">
            Sở hữu Source Code hoàn chỉnh, Template chuẩn SEO, UI/UX Kit hiện đại và tài liệu chuyên sâu. Thanh toán tự động, tải về tức thì 24/7.
        </p>

        <!-- CTA Buttons -->
        <div class="hero-cta">
            <a href="#featured-products" class="btn btn-primary btn-lg">
                <span>Khám phá ngay</span>
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="5" y1="12" x2="19" y2="12"></line>
                    <polyline points="12 5 19 12 12 19"></polyline>
                </svg>
            </a>
            <?php if (!is_logged_in()): ?>
                <a href="<?= APP_BASE ?>/pages/auth/register.php" class="btn btn-secondary btn-lg">
                    Tạo tài khoản miễn phí
                </a>
            <?php else: ?>
                <a href="<?= APP_BASE ?>/pages/auth/profile.php" class="btn btn-secondary btn-lg">
                    Quản lý ví & Tài khoản
                </a>
            <?php endif; ?>
        </div>

        <!-- Trust & Features Strip (Giữ nguyên 3 ô nhỏ xinh này) -->
        <div class="features-strip" id="features">
            <div class="feature-pill">
                <div class="feature-pill-icon">⚡</div>
                <div class="feature-pill-text">
                    <h4>Tải Về Tức Thì</h4>
                    <p>Hệ thống tự động kích hoạt link tải ngay sau khi thanh toán hoàn tất.</p>
                </div>
            </div>
            <div class="feature-pill">
                <div class="feature-pill-icon">🛡️</div>
                <div class="feature-pill-text">
                    <h4>Source Code Sạch 100%</h4>
                    <p>Mã nguồn được kiểm duyệt, không mã độc, sẵn sàng triển khai.</p>
                </div>
            </div>
            <div class="feature-pill">
                <div class="feature-pill-icon">🔄</div>
                <div class="feature-pill-text">
                    <h4>Cập Nhật Trọn Đời</h4>
                    <p>Miễn phí cập nhật phiên bản mới và hỗ trợ kỹ thuật tận tình.</p>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- PHẦN MỚI 1: QUY TRÌNH 3 BƯỚC (HOOK)          -->
<section class="section" style="background: var(--slate-50); padding-bottom: 40px;">
    <div class="container">
        <div style="text-align: center; max-width: 700px; margin: 0 auto 50px auto;">
            <div class="section-tag">Quy trình mua hàng</div>
            <h2 class="section-title">Sở hữu tài nguyên số chỉ trong 3 bước</h2>
            <p class="section-subtitle">Không cần chờ duyệt, không cần chát chờ Admin. Hệ thống xử lý tự động 24/7.</p>
        </div>

        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 24px; position: relative;">
            <!-- Bước 1 -->
            <div style="background: #fff; padding: 30px; border-radius: 16px; border: 1px solid var(--slate-200); box-shadow: var(--shadow-sm); position: relative; overflow: hidden; z-index: 1;">
                <div style="position: absolute; top: -10px; right: -10px; font-size: 6rem; font-weight: 900; color: var(--slate-100); line-height: 1; z-index: -1;">1</div>
                <div style="width: 48px; height: 48px; background: var(--primary); color: #fff; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 1.5rem; font-weight: bold; margin-bottom: 20px;">1</div>
                <h3 style="font-size: 1.2rem; font-weight: 700; color: var(--slate-900); margin-bottom: 10px;">Nạp tiền vào ví</h3>
                <p style="color: var(--slate-500); font-size: 0.95rem; line-height: 1.6;">Nạp tiền nhanh chóng qua cổng thanh toán tự động. Nhận ngay khuyến mãi lên đến 10%.</p>
            </div>
            
            <!-- Bước 2 -->
            <div style="background: #fff; padding: 30px; border-radius: 16px; border: 1px solid var(--slate-200); box-shadow: var(--shadow-sm); position: relative; overflow: hidden; z-index: 1;">
                <div style="position: absolute; top: -10px; right: -10px; font-size: 6rem; font-weight: 900; color: var(--slate-100); line-height: 1; z-index: -1;">2</div>
                <div style="width: 48px; height: 48px; background: var(--primary); color: #fff; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 1.5rem; font-weight: bold; margin-bottom: 20px;">2</div>
                <h3 style="font-size: 1.2rem; font-weight: 700; color: var(--slate-900); margin-bottom: 10px;">Chọn sản phẩm</h3>
                <p style="color: var(--slate-500); font-size: 0.95rem; line-height: 1.6;">Tìm kiếm Source Code, Tài khoản Premium hoặc Template ưng ý từ kho tài nguyên khổng lồ.</p>
            </div>

            <!-- Bước 3 -->
            <div style="background: #fff; padding: 30px; border-radius: 16px; border: 1px solid var(--primary); box-shadow: 0 4px 20px rgba(37, 99, 235, 0.1); position: relative; overflow: hidden; z-index: 1;">
                <div style="position: absolute; top: -10px; right: -10px; font-size: 6rem; font-weight: 900; color: var(--primary-light); line-height: 1; z-index: -1;">3</div>
                <div style="width: 48px; height: 48px; background: var(--primary); color: #fff; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 1.5rem; font-weight: bold; margin-bottom: 20px;">3</div>
                <h3 style="font-size: 1.2rem; font-weight: 700; color: var(--slate-900); margin-bottom: 10px;">Nhận Key & Tải File</h3>
                <p style="color: var(--slate-500); font-size: 0.95rem; line-height: 1.6;">Thanh toán thành công, hệ thống lập tức cấp tài khoản/Key và link tải file ngay trên màn hình.</p>
            </div>
        </div>
    </div>
</section>

<!-- ========================================== -->
<!-- PHẦN MỚI 2: TẠI SAO CHỌN CHÚNG TÔI          -->
<!-- ========================================== -->
<section class="section" style="background: #fff; border-top: 1px solid var(--slate-200);">
    <div class="container">
        <div style="text-align: center; max-width: 600px; margin: 0 auto 50px auto;">
            <div class="section-tag">Đặc quyền D2C</div>
            <h2 class="section-title">Tại sao Developers chọn DigitalShop?</h2>
            <p class="section-subtitle">Chúng tôi mang đến trải nghiệm mua sắm tài nguyên số an toàn và minh bạch nhất.</p>
        </div>

        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 32px;">
            <!-- Đặc quyền 1 -->
            <div style="text-align: center; padding: 24px;">
                <div style="width: 64px; height: 64px; margin: 0 auto 20px auto; background: var(--primary-light); color: var(--primary); border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
                </div>
                <h3 style="font-size: 1.1rem; font-weight: 700; color: var(--slate-900); margin-bottom: 8px;">Bảo Hành 1 Đổi 1</h3>
                <p style="font-size: 0.9rem; color: var(--slate-500); line-height: 1.6;">Cam kết bảo hành xuyên suốt thời hạn. Tài khoản lỗi sẽ được đổi mới ngay lập tức.</p>
            </div>
            <!-- Đặc quyền 2 -->
            <div style="text-align: center; padding: 24px;">
                <div style="width: 64px; height: 64px; margin: 0 auto 20px auto; background: #fef3c7; color: #d97706; border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon></svg>
                </div>
                <h3 style="font-size: 1.1rem; font-weight: 700; color: var(--slate-900); margin-bottom: 8px;">Giao Hàng Tự Động</h3>
                <p style="font-size: 0.9rem; color: var(--slate-500); line-height: 1.6;">Hệ thống tự động cấp phát tài khoản, Key hoặc link tải file ngay sau khi thanh toán.</p>
            </div>
            <!-- Đặc quyền 3 -->
            <div style="text-align: center; padding: 24px;">
                <div style="width: 64px; height: 64px; margin: 0 auto 20px auto; background: #dcfce7; color: #16a34a; border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
                </div>
                <h3 style="font-size: 1.1rem; font-weight: 700; color: var(--slate-900); margin-bottom: 8px;">Hỗ Trợ 1-1 Tận Tâm</h3>
                <p style="font-size: 0.9rem; color: var(--slate-500); line-height: 1.6;">Đội ngũ Admin túc trực 24/7. Mọi vấn đề của bạn sẽ được xử lý qua hệ thống Ticket.</p>
            </div>
            <!-- Đặc quyền 4 -->
            <div style="text-align: center; padding: 24px;">
                <div style="width: 64px; height: 64px; margin: 0 auto 20px auto; background: #fee2e2; color: #dc2626; border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="8" r="7"></circle><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline></svg>
                </div>
                <h3 style="font-size: 1.1rem; font-weight: 700; color: var(--slate-900); margin-bottom: 8px;">Bản Quyền Sạch</h3>
                <p style="font-size: 0.9rem; color: var(--slate-500); line-height: 1.6;">100% Source Code và Template được kiểm duyệt, mã nguồn sạch, không chứa mã độc.</p>
            </div>
        </div>
    </div>
</section>

<!-- Section Sản Phẩm Nổi Bật -->
<section class="section" id="featured-products">
    <div class="container">
        <div class="section-header">
            <div>
                <div class="section-tag">Bộ sưu tập tuyển chọn</div>
                <h2 class="section-title">Sản Phẩm Bán Chạy Nhất</h2>
                <p class="section-subtitle">Các mẫu mã nguồn, template và tài liệu được các lập trình viên tin dùng và mua nhiều nhất.</p>
            </div>
            <a href="<?= APP_BASE ?>/pages/products.php" class="btn btn-outline btn-sm">Xem tất cả tài nguyên &rarr;</a>
        </div>

        <div class="product-grid">
            <?php if (empty($featured_products)): ?>
                <p style="grid-column: 1 / -1; text-align: center; color: var(--slate-500);">Chưa có sản phẩm nào được đăng bán.</p>
            <?php else: ?>
                <?php foreach ($featured_products as $item): ?>
                    <div class="product-card">
                        <div class="product-thumb">
                            <img src="<?= product_image($item['image']) ?>" alt="<?= e($item['name']) ?>">
                            <span class="product-badge"><?= e($item['category']) ?></span>
                            <span class="product-badge" style="left: auto; right: 12px; background: rgba(239, 68, 68, 0.9);">
                                🔥 Đã bán <?= $item['sold_count'] ?>
                            </span>
                        </div>
                        <div class="product-content">
                            <h3 class="product-title">
                                <a href="<?= APP_BASE ?>/pages/product-detail.php?id=<?= $item['id'] ?>"><?= e($item['name']) ?></a>
                            </h3>
                            <p class="product-desc">
                                <?= e($item['description']) ?>
                            </p>
                            <div class="product-footer">
                                <div class="product-price-box">
                                    <?php if ($item['sale_price']): ?>
                                        <span class="product-price"><?= money($item['sale_price']) ?></span>
                                        <span class="product-price-old"><?= money($item['price']) ?></span>
                                    <?php else: ?>
                                        <span class="product-price"><?= money($item['price']) ?></span>
                                    <?php endif; ?>
                                </div>
                                <a href="<?= APP_BASE ?>/pages/product-detail.php?id=<?= $item['id'] ?>" class="btn btn-primary btn-sm">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
    </div>
</section>

<!-- PHẦN MỚI 3: CAM KẾT VÀNG & CTA CHỐT HẠ     -->
<section class="section" style="background: var(--slate-900); color: #fff; text-align: center; padding-bottom: 80px;">
    <div class="container">
        <h2 style="font-size: 2.2rem; font-weight: 800; margin-bottom: 16px; color: #fff;">Sẵn sàng nâng cấp công cụ của bạn?</h2>
        <p style="font-size: 1.1rem; color: var(--slate-300); max-width: 600px; margin: 0 auto 40px auto; line-height: 1.6;">
            Tham gia cùng hàng ngàn lập trình viên và nhà thiết kế đang sử dụng DigitalShop mỗi ngày. Giao dịch an toàn, nhận hàng tức thì.
        </p>
        <div style="display: flex; justify-content: center; gap: 16px; flex-wrap: wrap;">
            <a href="<?= APP_BASE ?>/pages/products.php" class="btn btn-primary btn-lg" style="padding: 14px 32px; font-size: 1.1rem;">Khám phá kho tài nguyên</a>
            <?php if (!is_logged_in()): ?>
                <a href="<?= APP_BASE ?>/pages/auth/register.php" class="btn btn-outline btn-lg" style="padding: 14px 32px; font-size: 1.1rem; background: transparent; color: #fff; border-color: var(--slate-600);">Tạo tài khoản miễn phí</a>
            <?php endif; ?>
        </div>
    </div>
</section>