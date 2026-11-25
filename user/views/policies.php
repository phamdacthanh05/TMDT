<?php
/**
 * DigitalShop - Trang Chính Sách & Điều Khoản Sử Dụng (D2C Standard)
 * Thiết kế giao diện hiện đại, trực quan, hỗ trợ Sticky TOC & ScrollSpy
 */
?>
<!-- POLICIES PAGE WRAPPER -->
<div class="policies-wrapper">
    <!-- HERO HEADER BANNER -->
    <header class="policies-hero">
        <div class="container">
            <!-- Breadcrumbs -->
            <nav class="policies-breadcrumbs" aria-label="Breadcrumb">
                <a href="<?= APP_BASE ?>/">Trang chủ</a>
                <span class="breadcrumb-separator">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                </span>
                <span class="breadcrumb-current">Chính sách & Điều khoản</span>
            </nav>

            <div class="policies-hero-content">
                <div class="policies-badge">
                    <span class="badge-dot"></span>
                    <span>Quy Chuẩn Vận Hành D2C</span>
                </div>
                <h1 class="policies-title">Chính Sách & Điều Khoản Dịch Vụ</h1>
                <p class="policies-desc">
                    Minh bạch - Bảo mật - Tận tâm. Cam kết chất lượng tài nguyên số chuẩn mực và bảo vệ 100% quyền lợi khách hàng tại DigitalShop.
                </p>

                <!-- Meta Badges -->
                <div class="policies-meta-bar">
                    <div class="meta-item">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                        <span>Cập nhật: Tháng 11/2026</span>
                    </div>
                    <div class="meta-separator">•</div>
                    <div class="meta-item">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                        <span>10 Điều khoản quy chuẩn</span>
                    </div>
                    <div class="meta-separator">•</div>
                    <div class="meta-item">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
                        <span>Bảo vệ quyền lợi người mua</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- MOBILE QUICK NAV (HORIZONTAL SCROLL PILLS) -->
    <div class="policies-mobile-nav">
        <div class="container">
            <div class="mobile-nav-scroll" id="mobileNavScroll">
                <a href="#d2c" class="mobile-nav-pill active" data-target="d2c">1. Mô hình D2C</a>
                <a href="#purchase" class="mobile-nav-pill" data-target="purchase">2. Mua hàng</a>
                <a href="#payment" class="mobile-nav-pill" data-target="payment">3. Thanh toán</a>
                <a href="#delivery" class="mobile-nav-pill" data-target="delivery">4. Giao hàng số</a>
                <a href="#pricing" class="mobile-nav-pill" data-target="pricing">5. Chính sách giá</a>
                <a href="#promotion" class="mobile-nav-pill" data-target="promotion">6. Khuyến mãi</a>
                <a href="#warranty" class="mobile-nav-pill" data-target="warranty">7. Bảo hành 1-1</a>
                <a href="#refund" class="mobile-nav-pill" data-target="refund">8. Hoàn tiền</a>
                <a href="#privacy" class="mobile-nav-pill" data-target="privacy">9. Bảo mật</a>
                <a href="#copyright" class="mobile-nav-pill" data-target="copyright">10. Bản quyền</a>
            </div>
        </div>
    </div>

    <!-- MAIN POLICIES BODY (TWO COLUMNS) -->
    <div class="policies-body">
        <div class="container">
            <div class="policies-grid">
                
                <!-- CỘT TRÁI: STICKY SIDEBAR (MỤC LỤC & HỖ TRỢ) -->
                <aside class="policies-sidebar">
                    <div class="sticky-sidebar-card">
                        <div class="sidebar-header">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3.01" y2="6"></line><line x1="3" y1="12" x2="3.01" y2="12"></line><line x1="3" y1="18" x2="3.01" y2="18"></line></svg>
                            <span>Mục lục chính sách</span>
                        </div>

                        <nav class="sidebar-nav" id="policiesNav">
                            <a href="#d2c" class="toc-link active" data-target="d2c">
                                <span class="toc-num">01</span>
                                <span class="toc-text">Cam kết mô hình D2C</span>
                                <svg class="toc-arrow" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                            </a>
                            <a href="#purchase" class="toc-link" data-target="purchase">
                                <span class="toc-num">02</span>
                                <span class="toc-text">Chính sách mua hàng</span>
                                <svg class="toc-arrow" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                            </a>
                            <a href="#payment" class="toc-link" data-target="payment">
                                <span class="toc-num">03</span>
                                <span class="toc-text">Chính sách thanh toán</span>
                                <svg class="toc-arrow" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                            </a>
                            <a href="#delivery" class="toc-link" data-target="delivery">
                                <span class="toc-num">04</span>
                                <span class="toc-text">Giao hàng kỹ thuật số</span>
                                <svg class="toc-arrow" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                            </a>
                            <a href="#pricing" class="toc-link" data-target="pricing">
                                <span class="toc-num">05</span>
                                <span class="toc-text">Chính sách giá & Chi phí</span>
                                <svg class="toc-arrow" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                            </a>
                            <a href="#promotion" class="toc-link" data-target="promotion">
                                <span class="toc-num">06</span>
                                <span class="toc-text">Khuyến mãi & Mã giảm giá</span>
                                <svg class="toc-arrow" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                            </a>
                            <a href="#warranty" class="toc-link" data-target="warranty">
                                <span class="toc-num">07</span>
                                <span class="toc-text">Bảo hành Tài khoản / Key</span>
                                <svg class="toc-arrow" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                            </a>
                            <a href="#refund" class="toc-link" data-target="refund">
                                <span class="toc-num">08</span>
                                <span class="toc-text">Hoàn tiền & Khiếu nại</span>
                                <svg class="toc-arrow" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                            </a>
                            <a href="#privacy" class="toc-link" data-target="privacy">
                                <span class="toc-num">09</span>
                                <span class="toc-text">Bảo mật thông tin</span>
                                <svg class="toc-arrow" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                            </a>
                            <a href="#copyright" class="toc-link" data-target="copyright">
                                <span class="toc-num">10</span>
                                <span class="toc-text">Bản quyền & Sở hữu trí tuệ</span>
                                <svg class="toc-arrow" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                            </a>
                        </nav>

                        <!-- Support Card Widget -->
                        <div class="sidebar-help-widget">
                            <div class="help-widget-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path><line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
                            </div>
                            <h4 class="help-widget-title">Cần giải đáp điều khoản?</h4>
                            <p class="help-widget-desc">Đội ngũ kỹ thuật & chăm sóc khách hàng luôn sẵn sàng hỗ trợ bạn.</p>
                            <a href="<?= APP_BASE ?>/pages/support-create.php" class="btn btn-primary btn-sm btn-full">
                                <span>Gửi yêu cầu hỗ trợ</span>
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
                            </a>
                        </div>
                    </div>
                </aside>

                <!-- CỘT PHẢI: NỘI DUNG CHÍNH SÁCH CHI TIẾT -->
                <main class="policies-content">
                    
                    <!-- MỤC 1: MÔ HÌNH D2C -->
                    <article id="d2c" class="policy-section">
                        <header class="section-card-header">
                            <div class="section-badge-icon">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                            </div>
                            <div class="section-title-wrap">
                                <span class="section-order">PHẦN 01</span>
                                <h2 class="section-heading">Cam kết mô hình D2C (Direct-to-Consumer)</h2>
                            </div>
                        </header>
                        <div class="section-card-body">
                            <p class="lead-text">
                                <strong>DigitalShop</strong> vận hành theo mô hình <strong>D2C (Direct-to-Consumer)</strong> - phân phối trực tiếp tài nguyên số từ nhà cung cấp & phát triển gốc đến tay người tiêu dùng.
                            </p>
                            <p class="body-text">
                                Bằng việc loại bỏ 100% các tầng nấc trung gian (đại lý cấp 2, trung gian mua đi bán lại), chúng tôi mang đến giá trị thực chất nhất cho khách hàng:
                            </p>

                            <!-- D2C 3-Pillar Highlight Grid -->
                            <div class="d2c-pillars-grid">
                                <div class="pillar-card">
                                    <div class="pillar-icon pillar-blue">
                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="1" x2="12" y2="23"></line><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg>
                                    </div>
                                    <h4 class="pillar-title">Giá Tận Gốc Cực Tốt</h4>
                                    <p class="pillar-desc">Cắt bỏ chi phí hoa hồng trung gian, mang lại mức giá tiết kiệm từ 30% - 60% so với thị trường truyền thống.</p>
                                </div>

                                <div class="pillar-card">
                                    <div class="pillar-icon pillar-emerald">
                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                                    </div>
                                    <h4 class="pillar-title">Kiểm Soát 100% Chất Lượng</h4>
                                    <p class="pillar-desc">Toàn bộ Source Code, Key bản quyền và tài nguyên đều được đội ngũ kiểm định mã độc và bảo đảm hoạt động trước khi đăng bán.</p>
                                </div>

                                <div class="pillar-card">
                                    <div class="pillar-icon pillar-indigo">
                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
                                    </div>
                                    <h4 class="pillar-title">Hỗ Trợ Kỹ Thuật 1 - 1</h4>
                                    <p class="pillar-desc">Khách hàng trao đổi trực tiếp với quản trị viên & kỹ sư hệ thống, không qua nhân viên trung gian tiếp thị.</p>
                                </div>
                            </div>
                        </div>
                    </article>

                    <!-- MỤC 2: CHÍNH SÁCH MUA HÀNG -->
                    <article id="purchase" class="policy-section">
                        <header class="section-card-header">
                            <div class="section-badge-icon">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
                            </div>
                            <div class="section-title-wrap">
                                <span class="section-order">PHẦN 02</span>
                                <h2 class="section-heading">Chính sách mua hàng trực tuyến</h2>
                            </div>
                        </header>
                        <div class="section-card-body">
                            <p class="body-text">
                                DigitalShop cung cấp các sản phẩm và tài nguyên kỹ thuật số thông qua website. Quý khách hàng chủ động lựa chọn và đặt mua trực tuyến theo quy trình chuẩn hoá 4 bước:
                            </p>

                            <!-- Process 4 Steps Timeline -->
                            <div class="process-steps-list">
                                <div class="process-step-item">
                                    <div class="step-badge">1</div>
                                    <div class="step-content">
                                        <h4>Tìm hiểu & Lựa chọn sản phẩm</h4>
                                        <p>Xem chi tiết mô tả, tính năng kỹ thuật, bản demo (nếu có), thời hạn sử dụng và phiên bản tương thích trước khi bấm mua.</p>
                                    </div>
                                </div>

                                <div class="process-step-item">
                                    <div class="step-badge">2</div>
                                    <div class="step-content">
                                        <h4>Đăng nhập & Kiểm tra số dư</h4>
                                        <p>Khách hàng cần đăng nhập tài khoản DigitalShop và đảm bảo số dư ví nội bộ đủ để thanh toán cho đơn hàng.</p>
                                    </div>
                                </div>

                                <div class="process-step-item">
                                    <div class="step-badge">3</div>
                                    <div class="step-content">
                                        <h4>Xác nhận đặt mua & Áp dụng mã ưu đãi</h4>
                                        <p>Kiểm tra giỏ hàng, nhập mã giảm giá (nếu có) và xác nhận trừ tiền tự động từ số dư ví điện tử.</p>
                                    </div>
                                </div>

                                <div class="process-step-item">
                                    <div class="step-badge">4</div>
                                    <div class="step-content">
                                        <h4>Nhận Key / Tài nguyên & Hướng dẫn sử dụng</h4>
                                        <p>Hệ thống tự động cấp phát Key Unlock, thông tin tài khoản hoặc link tải mã nguồn kèm hóa đơn điện tử trong mục Lịch sử mua hàng.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="policy-note-box note-info">
                                <div class="note-icon">
                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="16" x2="12" y2="12"></line><line x1="12" y1="8" x2="12.01" y2="8"></line></svg>
                                </div>
                                <div class="note-text">
                                    <strong>Trách nhiệm người mua:</strong> Khách hàng vui lòng kiểm tra kỹ mô tả sản phẩm, cấu hình máy chủ/môi trường chạy code yêu cầu trước khi tiến hành thanh toán.
                                </div>
                            </div>
                        </div>
                    </article>

                    <!-- MỤC 3: CHÍNH SÁCH THANH TOÁN -->
                    <article id="payment" class="policy-section">
                        <header class="section-card-header">
                            <div class="section-badge-icon">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg>
                            </div>
                            <div class="section-title-wrap">
                                <span class="section-order">PHẦN 03</span>
                                <h2 class="section-heading">Chính sách thanh toán qua ví nội bộ</h2>
                            </div>
                        </header>
                        <div class="section-card-body">
                            <p class="body-text">
                                Nhằm đảm bảo an toàn giao dịch, tính bảo mật cao và tốc độ xử lý tức thì, DigitalShop áp dụng hình thức thanh toán thông qua <strong>Số dư ví tài khoản</strong>.
                            </p>

                            <div class="features-checklist">
                                <div class="checklist-item">
                                    <span class="check-icon">✓</span>
                                    <div>
                                        <strong>Phương thức nạp tiền linh hoạt:</strong>
                                        <p>Hỗ trợ quét mã VietQR tự động qua mọi ứng dụng ngân hàng tại Việt Nam (MB, Vietcombank, Techcombank, VPBank,...) và chuyển khoản nhanh 24/7.</p>
                                    </div>
                                </div>

                                <div class="checklist-item">
                                    <span class="check-icon">✓</span>
                                    <div>
                                        <strong>Khớp lệnh tự động & Cộng tiền tức thì:</strong>
                                        <p>Ngay sau khi ngân hàng ghi nhận chuyển khoản đúng cú pháp, bot tự động cộng số dư vào ví trong vòng 10 - 30 giây.</p>
                                    </div>
                                </div>

                                <div class="checklist-item">
                                    <span class="check-icon">✓</span>
                                    <div>
                                        <strong>Không phụ phí phát sinh:</strong>
                                        <p>DigitalShop miễn phí 100% phí nạp tiền ví. Số tiền bạn chuyển bằng chính xác 100% số dư thực nhận trong tài khoản.</p>
                                    </div>
                                </div>

                                <div class="checklist-item">
                                    <span class="check-icon">✓</span>
                                    <div>
                                        <strong>Hỗ trợ đối soát chuyển nhầm:</strong>
                                        <p>Trường hợp nhập thiếu mã nội dung chuyển khoản hoặc hệ thống ngân hàng bảo trì chậm trễ, đội ngũ Admin sẽ đối soát thủ công qua biên lai ngân hàng bạn cung cấp.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>

                    <!-- MỤC 4: CHÍNH SÁCH GIAO HÀNG SỐ -->
                    <article id="delivery" class="policy-section">
                        <header class="section-card-header">
                            <div class="section-badge-icon">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg>
                            </div>
                            <div class="section-title-wrap">
                                <span class="section-order">PHẦN 04</span>
                                <h2 class="section-heading">Chính sách giao hàng kỹ thuật số (Instant Delivery)</h2>
                            </div>
                        </header>
                        <div class="section-card-body">
                            <p class="body-text">
                                Toàn bộ sản phẩm phân phối tại DigitalShop là <strong>tài nguyên kỹ thuật số</strong>. Hoàn toàn không phát sinh quy trình vận chuyển hay giao nhận hàng hóa vật lý.
                            </p>

                            <div class="delivery-types-grid">
                                <div class="delivery-type-card">
                                    <div class="del-icon">🔑</div>
                                    <h4>KEY UNLOCK / License</h4>
                                    <p>Mã khóa kích hoạt bản quyền hiển thị ngay trên màn hình đơn hàng và lưu trữ vĩnh viễn.</p>
                                </div>
                                <div class="delivery-type-card">
                                    <div class="del-icon">👤</div>
                                    <h4>Tài khoản / Slot dùng chung</h4>
                                    <p>Thông tin đăng nhập tài khoản (Email, Mật khẩu, Profile) được cấp tự động từ kho dữ liệu.</p>
                                </div>
                                <div class="delivery-type-card">
                                    <div class="del-icon">📦</div>
                                    <h4>Source Code & Template</h4>
                                    <p>Link tải trực tiếp tốc độ cao Google Drive / GitHub Repository bảo đảm không giới hạn băng thông.</p>
                                </div>
                            </div>

                            <div class="policy-note-box note-warning">
                                <div class="note-icon">
                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path><line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
                                </div>
                                <div class="note-text">
                                    <strong>Bảo mật thông tin sau nhận hàng:</strong> Khách hàng có trách nhiệm tự bảo mật Key, mật khẩu và dữ liệu sau khi nhận. Tuyệt đối không chia sẻ công khai lên mạng xã hội để tránh bị thu hồi bản quyền.
                                </div>
                            </div>
                        </div>
                    </article>

                    <!-- MỤC 5: CHÍNH SÁCH GIÁ -->
                    <article id="pricing" class="policy-section">
                        <header class="section-card-header">
                            <div class="section-badge-icon">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z"></path><line x1="7" y1="7" x2="7.01" y2="7"></line></svg>
                            </div>
                            <div class="section-title-wrap">
                                <span class="section-order">PHẦN 05</span>
                                <h2 class="section-heading">Chính sách giá & Cam kết minh bạch</h2>
                            </div>
                        </header>
                        <div class="section-card-body">
                            <ul class="styled-bullet-list">
                                <li>
                                    <strong>Giá niêm yết rõ ràng:</strong> Mọi giá bán trên website đều tính theo đơn vị Đồng Việt Nam (VND), đã bao gồm quyền truy cập tải tài nguyên và các quyền lợi bảo hành đi kèm.
                                </li>
                                <li>
                                    <strong>Không chi phí ẩn:</strong> Số tiền hiển thị tại bước xác nhận thanh toán là số tiền cuối cùng bị trừ từ ví. Tuyệt đối không có phí dịch vụ hay phụ phí phát sinh.
                                </li>
                                <li>
                                    <strong>Bảo lưu giá đơn hàng đã chốt:</strong> Việc hệ thống điều chỉnh tăng giá trong tương lai theo chính sách nhà phát hành sẽ không ảnh hưởng đến các đơn hàng đã thanh toán thành công trước đó.
                                </li>
                            </ul>
                        </div>
                    </article>

                    <!-- MỤC 6: CHÍNH SÁCH KHUYẾN MÃI -->
                    <article id="promotion" class="policy-section">
                        <header class="section-card-header">
                            <div class="section-badge-icon">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 12 20 22 4 22 4 12"></polyline><rect x="2" y="7" width="20" height="5"></rect><line x1="12" y1="22" x2="12" y2="7"></line><path d="M12 7H7.5a2.5 2.5 0 0 1 0-5C11 2 12 7 12 7z"></path><path d="M12 7h4.5a2.5 2.5 0 0 0 0-5C13 2 12 7 12 7z"></path></svg>
                            </div>
                            <div class="section-title-wrap">
                                <span class="section-order">PHẦN 06</span>
                                <h2 class="section-heading">Chính sách khuyến mãi & Mã giảm giá</h2>
                            </div>
                        </header>
                        <div class="section-card-body">
                            <p class="body-text">
                                DigitalShop thường xuyên triển khai các sự kiện tặng thưởng số dư ví và phát hành phiếu giảm giá (Coupon Code):
                            </p>
                            <div class="promo-guidelines-box">
                                <div class="guideline-row">
                                    <span class="guideline-tag">Ưu đãi nạp ví</span>
                                    <span>Tặng thêm 5% khi nạp từ 100.000đ; tặng thêm 10% khi nạp từ 500.000đ (tự động cộng vào ví).</span>
                                </div>
                                <div class="guideline-row">
                                    <span class="guideline-tag">Mã Voucher</span>
                                    <span>Áp dụng trực tiếp tại bước thanh toán. Mỗi đơn hàng chỉ áp dụng 01 mã giảm giá hợp lệ.</span>
                                </div>
                                <div class="guideline-row">
                                    <span class="guideline-tag">Thời hạn & Giới hạn</span>
                                    <span>Mỗi mã giảm giá có điều kiện giá trị đơn hàng tối thiểu và số lượt sử dụng nhất định, kết thúc khi hết hạn hoặc hết ngân sách.</span>
                                </div>
                            </div>
                        </div>
                    </article>

                    <!-- MỤC 7: BẢO HÀNH TÀI KHOẢN / KEY -->
                    <article id="warranty" class="policy-section">
                        <header class="section-card-header">
                            <div class="section-badge-icon">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
                            </div>
                            <div class="section-title-wrap">
                                <span class="section-order">PHẦN 07</span>
                                <h2 class="section-heading">Chính sách bảo hành 1 đổi 1 (Tài khoản / Key)</h2>
                            </div>
                        </header>
                        <div class="section-card-body">
                            <p class="lead-text">
                                Chúng tôi áp dụng chính sách <strong>Bảo hành 1 đổi 1</strong> xuyên suốt toàn bộ thời hạn cam kết của gói dịch vụ:
                            </p>

                            <!-- Two Columns Comparison Grid -->
                            <div class="warranty-comparison-grid">
                                <!-- Thẻ xanh: Được bảo hành -->
                                <div class="warranty-card warranty-valid">
                                    <div class="card-status-title">
                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                        <span>Được Bảo Hành 1 Đổi 1</span>
                                    </div>
                                    <ul class="warranty-rules-list">
                                        <li>Tài khoản bị sai thông tin đăng nhập hoặc bị reset do lỗi máy chủ gốc.</li>
                                        <li>Key bản quyền bị lỗi kích hoạt hoặc bị thu hồi trước hạn cam kết.</li>
                                        <li>Lỗi phát sinh do nhà cung cấp hoặc hệ thống DigitalShop.</li>
                                        <li>Thời gian xử lý cấp mới: Trong vòng <strong>24h làm việc</strong> kể từ khi tiếp nhận Ticket.</li>
                                    </ul>
                                </div>

                                <!-- Thẻ đỏ: Từ chối bảo hành -->
                                <div class="warranty-card warranty-invalid">
                                    <div class="card-status-title">
                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                        <span>Từ Chối Bảo Hành</span>
                                    </div>
                                    <ul class="warranty-rules-list">
                                        <li>Khách hàng tự ý thay đổi Email, Mật khẩu gốc đối với các tài khoản dùng chung.</li>
                                        <li>Chia sẻ tài khoản hoặc Key kích hoạt vượt quá số lượng thiết bị quy định.</li>
                                        <li>Sử dụng sản phẩm vi phạm chính sách của nhà cung cấp (cheat, bot, spam,...).</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </article>

                    <!-- MỤC 8: HOÀN TIỀN & KHIẾU NẠI -->
                    <article id="refund" class="policy-section">
                        <header class="section-card-header">
                            <div class="section-badge-icon">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 2v6h6"></path><path d="M21 12A9 9 0 0 0 6 5.3L3 8"></path><path d="M21 22v-6h-6"></path><path d="M3 12a9 9 0 0 0 15 6.7l3-2.7"></path></svg>
                            </div>
                            <div class="section-title-wrap">
                                <span class="section-order">PHẦN 08</span>
                                <h2 class="section-heading">Chính sách Hoàn tiền & Tiếp nhận Khiếu nại</h2>
                            </div>
                        </header>
                        <div class="section-card-body">
                            
                            <!-- Important Refund Warning Alert Box -->
                            <div class="policy-alert-box alert-danger">
                                <div class="alert-icon">
                                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12.01" y2="16"></line></svg>
                                </div>
                                <div class="alert-content">
                                    <h4 class="alert-title">Quy Định Đặc Thù Với Tài Nguyên Số</h4>
                                    <p class="alert-desc">
                                        Do tính chất sao chép tức thì của dữ liệu số, DigitalShop <strong>không hỗ trợ hoàn tiền</strong> đối với các sản phẩm File / Source Code / Template đã được Unlock thành công bằng Key. Quý khách vui lòng kiểm tra kỹ thông tin trước khi mở khóa.
                                    </p>
                                </div>
                            </div>

                            <div class="refund-details-block">
                                <h4 class="sub-heading">Điều kiện được xét duyệt hoàn tiền:</h4>
                                <ul class="styled-bullet-list">
                                    <li><strong>Sản phẩm bị lỗi và hết hàng thay thế:</strong> Đối với Tài khoản hoặc Key không hoạt động, nếu ban quản trị không thể khắc phục hoặc không còn tài nguyên thay thế trong vòng 24h - 48h, hệ thống sẽ hoàn trả <strong>100% số tiền</strong> vào số dư ví của khách hàng.</li>
                                    <li><strong>Phương thức nhận tiền hoàn:</strong> Tiền hoàn được cộng trực tiếp vào ví nội bộ DigitalShop để quý khách mua sắm sản phẩm khác bất kỳ lúc nào.</li>
                                </ul>

                                <h4 class="sub-heading" style="margin-top: 24px;">Quy trình gửi yêu cầu khiếu nại / hoàn tiền:</h4>
                                <div class="refund-steps-flow">
                                    <div class="flow-step">
                                        <div class="flow-num">1</div>
                                        <p>Truy cập vào <strong>Lịch sử mua hàng</strong>, tìm đến đơn hàng gặp sự cố.</p>
                                    </div>
                                    <div class="flow-step">
                                        <div class="flow-num">2</div>
                                        <p>Bấm nút <strong>Yêu cầu hoàn tiền</strong>, mô tả chi tiết lỗi kèm ảnh chụp bằng chứng.</p>
                                    </div>
                                    <div class="flow-step">
                                        <div class="flow-num">3</div>
                                        <p>Admin kiểm tra, phản hồi và giải quyết minh bạch trong vòng <strong>24h - 48h làm việc</strong>.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>

                    <!-- MỤC 9: BẢO MẬT THÔNG TIN -->
                    <article id="privacy" class="policy-section">
                        <header class="section-card-header">
                            <div class="section-badge-icon">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                            </div>
                            <div class="section-title-wrap">
                                <span class="section-order">PHẦN 09</span>
                                <h2 class="section-heading">Bảo mật thông tin & Dữ liệu khách hàng</h2>
                            </div>
                        </header>
                        <div class="section-card-body">
                            <p class="body-text">
                                DigitalShop cam kết bảo mật tuyệt đối thông tin định danh và số dư của toàn thể khách hàng:
                            </p>
                            <div class="privacy-features-grid">
                                <div class="privacy-item">
                                    <div class="privacy-icon">🔐</div>
                                    <div>
                                        <h4>Mã Hóa Mật Khẩu Chuẩn bcrypt</h4>
                                        <p>Mật khẩu người dùng được băm (hash) 1 chiều an toàn tuyệt đối. Kể cả quản trị viên cũng không thể đọc mật khẩu gốc của bạn.</p>
                                    </div>
                                </div>

                                <div class="privacy-item">
                                    <div class="privacy-icon">🛡️</div>
                                    <div>
                                        <h4>Không Chia Sẻ Dữ Liệu</h4>
                                        <p>Chúng tôi tuyệt đối không bán, cho thuê hay thương mại hóa email, số điện thoại hay thông tin tài khoản cho bất kỳ bên thứ ba nào.</p>
                                    </div>
                                </div>

                                <div class="privacy-item">
                                    <div class="privacy-icon">⚡</div>
                                    <div>
                                        <h4>An Toàn Giao Dịch Số Dư</h4>
                                        <p>Toàn bộ lịch sử nạp tiền, chi tiêu và số dư ví đều được lưu vết kiểm toán (Audit Log) chặt chẽ, chống thất thoát hoặc sai lệch số liệu.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>

                    <!-- MỤC 10: BẢN QUYỀN & SỞ HỮU TRÍ TUỆ -->
                    <article id="copyright" class="policy-section">
                        <header class="section-card-header">
                            <div class="section-badge-icon">
                                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><path d="M14.83 14.83a4 4 0 1 1 0-5.66"></path></svg>
                            </div>
                            <div class="section-title-wrap">
                                <span class="section-order">PHẦN 10</span>
                                <h2 class="section-heading">Bản quyền & Sở hữu trí tuệ</h2>
                            </div>
                        </header>
                        <div class="section-card-body">
                            <p class="body-text">
                                Mọi Source Code, Template và Tài liệu được phân phối trên hệ thống DigitalShop đều có nguồn gốc hợp pháp và cam kết <strong>100% sạch mã độc</strong> (No Malware / Virus-free):
                            </p>
                            <div class="copyright-rules-box">
                                <div class="rule-block allowed">
                                    <div class="rule-tag">Quyền Được Phép</div>
                                    <p>Khách hàng có toàn quyền chỉnh sửa, cá nhân hóa, triển khai sử dụng cho dự án kinh doanh cá nhân hoặc doanh nghiệp của mình.</p>
                                </div>
                                <div class="rule-block forbidden">
                                    <div class="rule-tag">Nghiêm Cấm Tuyệt Đối</div>
                                    <p>Nghiêm cấm sao chép, đóng gói lại để bán phá giá hoặc phát tán công khai mã nguồn lên các diễn đàn mà không có văn bản ủy quyền từ tác giả / DigitalShop.</p>
                                </div>
                            </div>
                        </div>
                    </article>

                    <!-- FOOTER CTA CARD (SUPPORT & FAQ) -->
                    <div class="policies-cta-card">
                        <div class="cta-card-content">
                            <div class="cta-icon-glow">
                                <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
                            </div>
                            <div>
                                <h3 class="cta-title">Bạn có câu hỏi hoặc cần giải đáp về chính sách?</h3>
                                <p class="cta-desc">Đội ngũ kỹ thuật & hỗ trợ khách hàng của DigitalShop luôn trực tuyến để đồng hành cùng bạn.</p>
                            </div>
                        </div>
                        <div class="cta-actions">
                            <a href="<?= APP_BASE ?>/pages/support-create.php" class="btn btn-primary">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
                                <span>Gửi Ticket Hỗ Trợ</span>
                            </a>
                            <a href="<?= APP_BASE ?>/pages/promotions.php" class="btn btn-outline">
                                <span>Xem Khuyến Mãi</span>
                            </a>
                        </div>
                    </div>

                    <!-- LAST UPDATED FOOTNOTE -->
                    <div class="policies-updated-footer">
                        <p>Chính sách và điều khoản này có hiệu lực từ ngày công bố và áp dụng cho toàn thể người dùng trên nền tảng DigitalShop.</p>
                        <p>© <?= date('Y') ?> DigitalShop Platform. Tất cả quyền được bảo lưu.</p>
                    </div>

                </main>
            </div>
        </div>
    </div>
</div>

<!-- ==========================================================================
     SCOPED STYLES FOR POLICIES PAGE (MODERN SAAS AESTHETIC)
     ========================================================================== -->
<style>
/* Policies Layout */
.policies-wrapper {
    background-color: var(--slate-50);
    min-height: 100vh;
    padding-bottom: 80px;
}

/* Hero Section */
.policies-hero {
    background: linear-gradient(180deg, #ffffff 0%, var(--slate-50) 100%);
    border-bottom: 1px solid var(--slate-200);
    padding: 36px 0 44px;
    position: relative;
}

.policies-breadcrumbs {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 0.875rem;
    color: var(--slate-500);
    margin-bottom: 20px;
}

.policies-breadcrumbs a {
    color: var(--slate-600);
    text-decoration: none;
    transition: var(--transition-fast);
}

.policies-breadcrumbs a:hover {
    color: var(--primary);
}

.breadcrumb-separator {
    display: inline-flex;
    align-items: center;
    color: var(--slate-400);
}

.breadcrumb-current {
    color: var(--slate-900);
    font-weight: 600;
}

.policies-badge {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    background: var(--primary-light);
    border: 1px solid #dbeafe;
    color: var(--primary);
    font-size: 0.75rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    padding: 4px 12px;
    border-radius: var(--radius-full);
    margin-bottom: 16px;
}

.badge-dot {
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background-color: var(--primary);
}

.policies-title {
    font-size: 2.25rem;
    font-weight: 800;
    color: var(--slate-900);
    letter-spacing: -0.025em;
    line-height: 1.25;
    margin-bottom: 12px;
}

.policies-desc {
    font-size: 1.05rem;
    color: var(--slate-600);
    max-width: 760px;
    line-height: 1.6;
    margin-bottom: 24px;
}

.policies-meta-bar {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    gap: 12px;
    font-size: 0.85rem;
    color: var(--slate-500);
}

.meta-item {
    display: flex;
    align-items: center;
    gap: 6px;
}

.meta-item svg {
    color: var(--primary);
}

.meta-separator {
    color: var(--slate-300);
}

/* Mobile Quick Nav Bar */
.policies-mobile-nav {
    display: none;
    position: sticky;
    top: 72px;
    z-index: 40;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    border-bottom: 1px solid var(--slate-200);
    padding: 10px 0;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.03);
}

.mobile-nav-scroll {
    display: flex;
    gap: 8px;
    overflow-x: auto;
    scrollbar-width: none;
    -ms-overflow-style: none;
    padding-bottom: 2px;
}

.mobile-nav-scroll::-webkit-scrollbar {
    display: none;
}

.mobile-nav-pill {
    white-space: nowrap;
    padding: 6px 14px;
    background: var(--slate-100);
    color: var(--slate-700);
    font-size: 0.825rem;
    font-weight: 600;
    border-radius: var(--radius-full);
    text-decoration: none;
    transition: var(--transition-fast);
    border: 1px solid transparent;
}

.mobile-nav-pill:hover {
    background: var(--slate-200);
    color: var(--slate-900);
}

.mobile-nav-pill.active {
    background: var(--primary);
    color: var(--white);
    border-color: var(--primary);
}

/* Two-column Body Grid */
.policies-body {
    padding-top: 40px;
}

.policies-grid {
    display: grid;
    grid-template-columns: 290px 1fr;
    gap: 36px;
    align-items: start;
}

/* Sticky Sidebar */
.policies-sidebar {
    position: sticky;
    top: 96px;
    z-index: 20;
}

.sticky-sidebar-card {
    background: var(--white);
    border: 1px solid var(--slate-200);
    border-radius: var(--radius-lg);
    box-shadow: var(--shadow-sm);
    padding: 20px;
}

.sidebar-header {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 0.95rem;
    font-weight: 700;
    color: var(--slate-900);
    padding-bottom: 14px;
    border-bottom: 1px solid var(--slate-100);
    margin-bottom: 10px;
}

.sidebar-header svg {
    color: var(--primary);
}

.sidebar-nav {
    display: flex;
    flex-direction: column;
    gap: 4px;
}

.toc-link {
    display: flex;
    align-items: center;
    padding: 9px 12px;
    border-radius: var(--radius-md);
    color: var(--slate-600);
    font-size: 0.875rem;
    font-weight: 500;
    text-decoration: none;
    transition: var(--transition-fast);
    position: relative;
}

.toc-num {
    font-size: 0.75rem;
    font-weight: 700;
    color: var(--slate-400);
    width: 22px;
    flex-shrink: 0;
}

.toc-text {
    flex: 1;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.toc-arrow {
    opacity: 0;
    transform: translateX(-4px);
    transition: var(--transition-fast);
    color: var(--primary);
    flex-shrink: 0;
}

.toc-link:hover {
    background-color: var(--slate-50);
    color: var(--primary);
}

.toc-link:hover .toc-arrow {
    opacity: 1;
    transform: translateX(0);
}

.toc-link.active {
    background-color: var(--primary-light);
    color: var(--primary);
    font-weight: 700;
}

.toc-link.active .toc-num {
    color: var(--primary);
}

.toc-link.active .toc-arrow {
    opacity: 1;
    transform: translateX(0);
}

/* Sidebar Help Widget */
.sidebar-help-widget {
    margin-top: 20px;
    padding-top: 18px;
    border-top: 1px solid var(--slate-100);
    background: linear-gradient(180deg, #ffffff 0%, var(--slate-50) 100%);
    border-radius: var(--radius-md);
    text-align: left;
}

.help-widget-icon {
    width: 34px;
    height: 34px;
    background: #e0f2fe;
    color: #0284c7;
    border-radius: var(--radius-md);
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 10px;
}

.help-widget-title {
    font-size: 0.9rem;
    font-weight: 700;
    color: var(--slate-900);
    margin-bottom: 4px;
}

.help-widget-desc {
    font-size: 0.8rem;
    color: var(--slate-500);
    line-height: 1.45;
    margin-bottom: 12px;
}

.btn-full {
    width: 100%;
    justify-content: center;
}

/* Main Content Policy Cards */
.policies-content {
    display: flex;
    flex-direction: column;
    gap: 28px;
}

.policy-section {
    background: var(--white);
    border: 1px solid var(--slate-200);
    border-radius: var(--radius-lg);
    box-shadow: var(--shadow-sm);
    padding: 32px;
    scroll-margin-top: 96px;
    transition: border-color 0.2s ease, box-shadow 0.2s ease;
}

.policy-section:hover {
    border-color: #cbd5e1;
    box-shadow: var(--shadow-md);
}

/* Section Card Header */
.section-card-header {
    display: flex;
    align-items: center;
    gap: 16px;
    margin-bottom: 22px;
    padding-bottom: 18px;
    border-bottom: 1px solid var(--slate-100);
}

.section-badge-icon {
    width: 48px;
    height: 48px;
    border-radius: 12px;
    background: var(--primary-light);
    color: var(--primary);
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    box-shadow: 0 2px 6px rgba(37, 99, 235, 0.1);
}

.section-title-wrap {
    flex: 1;
}

.section-order {
    display: block;
    font-size: 0.75rem;
    font-weight: 800;
    color: var(--primary);
    letter-spacing: 0.08em;
    margin-bottom: 2px;
}

.section-heading {
    font-size: 1.4rem;
    font-weight: 800;
    color: var(--slate-900);
    letter-spacing: -0.02em;
    margin: 0;
    line-height: 1.3;
}

/* Typography Inside Policy Cards */
.lead-text {
    font-size: 1.025rem;
    color: var(--slate-800);
    line-height: 1.7;
    margin-bottom: 14px;
}

.body-text {
    font-size: 0.95rem;
    color: var(--slate-600);
    line-height: 1.7;
    margin-bottom: 18px;
}

.sub-heading {
    font-size: 1.05rem;
    font-weight: 700;
    color: var(--slate-900);
    margin-bottom: 12px;
}

/* D2C Pillars Grid */
.d2c-pillars-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 16px;
    margin-top: 20px;
}

.pillar-card {
    background: var(--slate-50);
    border: 1px solid var(--slate-200);
    border-radius: var(--radius-md);
    padding: 20px;
    transition: transform 0.2s ease, border-color 0.2s ease;
}

.pillar-card:hover {
    transform: translateY(-2px);
    border-color: var(--primary);
    background: #ffffff;
}

.pillar-icon {
    width: 38px;
    height: 38px;
    border-radius: var(--radius-md);
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 12px;
}

.pillar-blue {
    background: #eff6ff;
    color: #2563eb;
}

.pillar-emerald {
    background: #ecfdf5;
    color: #059669;
}

.pillar-indigo {
    background: #eef2ff;
    color: #4f46e5;
}

.pillar-title {
    font-size: 0.95rem;
    font-weight: 700;
    color: var(--slate-900);
    margin-bottom: 6px;
}

.pillar-desc {
    font-size: 0.85rem;
    color: var(--slate-600);
    line-height: 1.5;
    margin: 0;
}

/* Process Steps 4-Item List */
.process-steps-list {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
    margin-bottom: 20px;
}

.process-step-item {
    display: flex;
    align-items: flex-start;
    gap: 14px;
    background: var(--slate-50);
    border: 1px solid var(--slate-200);
    border-radius: var(--radius-md);
    padding: 16px;
}

.step-badge {
    width: 28px;
    height: 28px;
    border-radius: 50%;
    background: var(--primary);
    color: var(--white);
    font-weight: 700;
    font-size: 0.85rem;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
}

.step-content h4 {
    font-size: 0.95rem;
    font-weight: 700;
    color: var(--slate-900);
    margin-bottom: 4px;
}

.step-content p {
    font-size: 0.85rem;
    color: var(--slate-600);
    line-height: 1.5;
    margin: 0;
}

/* Checklist items with green tick */
.features-checklist {
    display: flex;
    flex-direction: column;
    gap: 14px;
}

.checklist-item {
    display: flex;
    align-items: flex-start;
    gap: 12px;
}

.check-icon {
    width: 22px;
    height: 22px;
    border-radius: 50%;
    background: #dcfce7;
    color: #16a34a;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 800;
    font-size: 12px;
    flex-shrink: 0;
    margin-top: 2px;
}

.checklist-item strong {
    display: block;
    font-size: 0.95rem;
    color: var(--slate-900);
    margin-bottom: 2px;
}

.checklist-item p {
    font-size: 0.875rem;
    color: var(--slate-600);
    line-height: 1.55;
    margin: 0;
}

/* Delivery Types Grid */
.delivery-types-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 16px;
    margin-bottom: 20px;
}

.delivery-type-card {
    background: var(--slate-50);
    border: 1px solid var(--slate-200);
    border-radius: var(--radius-md);
    padding: 18px;
    text-align: center;
}

.del-icon {
    font-size: 1.75rem;
    margin-bottom: 8px;
}

.delivery-type-card h4 {
    font-size: 0.925rem;
    font-weight: 700;
    color: var(--slate-900);
    margin-bottom: 6px;
}

.delivery-type-card p {
    font-size: 0.825rem;
    color: var(--slate-600);
    line-height: 1.45;
    margin: 0;
}

/* Styled Bullet Lists */
.styled-bullet-list {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.styled-bullet-list li {
    position: relative;
    padding-left: 24px;
    font-size: 0.925rem;
    color: var(--slate-700);
    line-height: 1.65;
}

.styled-bullet-list li::before {
    content: "•";
    position: absolute;
    left: 8px;
    top: 0;
    color: var(--primary);
    font-size: 1.3rem;
    line-height: 1.4;
}

/* Promo guidelines box */
.promo-guidelines-box {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.guideline-row {
    display: flex;
    align-items: flex-start;
    gap: 12px;
    font-size: 0.9rem;
    color: var(--slate-700);
    line-height: 1.5;
}

.guideline-tag {
    font-size: 0.75rem;
    font-weight: 700;
    background: #fef3c7;
    color: #b45309;
    padding: 2px 8px;
    border-radius: 4px;
    white-space: nowrap;
    border: 1px solid #fde68a;
    flex-shrink: 0;
}

/* Warranty Comparison Grid */
.warranty-comparison-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
    margin-top: 16px;
}

.warranty-card {
    border-radius: var(--radius-md);
    padding: 20px;
    border: 1px solid transparent;
}

.warranty-valid {
    background: #f0fdf4;
    border-color: #bbf7d0;
}

.warranty-valid .card-status-title {
    color: #166534;
}

.warranty-valid .card-status-title svg {
    color: #16a34a;
}

.warranty-invalid {
    background: #fff1f2;
    border-color: #fecdd3;
}

.warranty-invalid .card-status-title {
    color: #9f1239;
}

.warranty-invalid .card-status-title svg {
    color: #e11d48;
}

.card-status-title {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 1rem;
    font-weight: 700;
    margin-bottom: 14px;
}

.warranty-rules-list {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    flex-direction: column;
    gap: 10px;
    font-size: 0.875rem;
    color: var(--slate-700);
    line-height: 1.55;
}

.warranty-rules-list li {
    position: relative;
    padding-left: 18px;
}

.warranty-rules-list li::before {
    content: "–";
    position: absolute;
    left: 0;
    color: var(--slate-400);
}

/* Policy Note & Alert Boxes */
.policy-note-box {
    display: flex;
    align-items: flex-start;
    gap: 12px;
    padding: 14px 16px;
    border-radius: var(--radius-md);
    font-size: 0.875rem;
    line-height: 1.55;
    margin-top: 16px;
}

.note-info {
    background: #f0f9ff;
    border: 1px solid #bae6fd;
    color: #0369a1;
}

.note-info .note-icon {
    color: #0284c7;
    flex-shrink: 0;
}

.note-warning {
    background: #fffbeb;
    border: 1px solid #fde68a;
    color: #92400e;
}

.note-warning .note-icon {
    color: #d97706;
    flex-shrink: 0;
}

.policy-alert-box {
    display: flex;
    align-items: flex-start;
    gap: 14px;
    padding: 18px 20px;
    border-radius: var(--radius-md);
    margin-bottom: 22px;
}

.alert-danger {
    background: #fef2f2;
    border: 1px solid #fecaca;
    color: #991b1b;
}

.alert-danger .alert-icon {
    color: #dc2626;
    flex-shrink: 0;
    margin-top: 2px;
}

.alert-title {
    font-size: 0.95rem;
    font-weight: 700;
    margin-bottom: 4px;
    color: #991b1b;
}

.alert-desc {
    font-size: 0.875rem;
    line-height: 1.55;
    margin: 0;
    color: #7f1d1d;
}

/* Refund Flow Steps */
.refund-steps-flow {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 14px;
    margin-top: 12px;
}

.flow-step {
    background: var(--slate-50);
    border: 1px solid var(--slate-200);
    border-radius: var(--radius-md);
    padding: 14px;
    text-align: center;
}

.flow-num {
    width: 26px;
    height: 26px;
    border-radius: 50%;
    background: var(--primary-light);
    color: var(--primary);
    font-weight: 800;
    font-size: 0.8rem;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 8px;
}

.flow-step p {
    font-size: 0.825rem;
    color: var(--slate-600);
    line-height: 1.45;
    margin: 0;
}

/* Privacy Features Grid */
.privacy-features-grid {
    display: flex;
    flex-direction: column;
    gap: 14px;
}

.privacy-item {
    display: flex;
    align-items: flex-start;
    gap: 14px;
    background: var(--slate-50);
    border: 1px solid var(--slate-200);
    border-radius: var(--radius-md);
    padding: 16px;
}

.privacy-icon {
    font-size: 1.5rem;
    flex-shrink: 0;
}

.privacy-item h4 {
    font-size: 0.95rem;
    font-weight: 700;
    color: var(--slate-900);
    margin-bottom: 4px;
}

.privacy-item p {
    font-size: 0.85rem;
    color: var(--slate-600);
    line-height: 1.5;
    margin: 0;
}

/* Copyright Rules Box */
.copyright-rules-box {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
    margin-top: 16px;
}

.rule-block {
    padding: 18px;
    border-radius: var(--radius-md);
}

.rule-block.allowed {
    background: #f0fdf4;
    border: 1px solid #bbf7d0;
}

.rule-block.allowed .rule-tag {
    background: #dcfce7;
    color: #15803d;
}

.rule-block.forbidden {
    background: #fef2f2;
    border: 1px solid #fecaca;
}

.rule-block.forbidden .rule-tag {
    background: #fee2e2;
    color: #b91c1c;
}

.rule-tag {
    display: inline-block;
    font-size: 0.75rem;
    font-weight: 700;
    padding: 2px 8px;
    border-radius: 4px;
    margin-bottom: 8px;
    text-transform: uppercase;
}

.rule-block p {
    font-size: 0.875rem;
    color: var(--slate-700);
    line-height: 1.55;
    margin: 0;
}

/* Footer CTA Box */
.policies-cta-card {
    background: linear-gradient(135deg, var(--slate-900) 0%, #1e293b 100%);
    border-radius: var(--radius-lg);
    padding: 32px;
    color: var(--white);
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 24px;
    box-shadow: var(--shadow-lg);
    margin-top: 12px;
}

.cta-card-content {
    display: flex;
    align-items: center;
    gap: 20px;
}

.cta-icon-glow {
    width: 56px;
    height: 56px;
    border-radius: 14px;
    background: rgba(37, 99, 235, 0.2);
    border: 1px solid rgba(56, 189, 248, 0.3);
    color: #38bdf8;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
}

.cta-title {
    font-size: 1.25rem;
    font-weight: 800;
    color: var(--white);
    margin-bottom: 6px;
}

.cta-desc {
    font-size: 0.9rem;
    color: var(--slate-400);
    margin: 0;
    line-height: 1.5;
}

.cta-actions {
    display: flex;
    align-items: center;
    gap: 12px;
    flex-shrink: 0;
}

.policies-updated-footer {
    text-align: center;
    padding-top: 24px;
    border-top: 1px solid var(--slate-200);
    color: var(--slate-500);
    font-size: 0.85rem;
    line-height: 1.6;
}

/* ==========================================================================
   RESPONSIVE DESIGN (BREAKPOINTS)
   ========================================================================== */
@media (max-width: 1024px) {
    .policies-grid {
        grid-template-columns: 1fr;
    }

    .policies-sidebar {
        display: none; /* Sử dụng mobile nav pills thay cho sidebar lớn */
    }

    .policies-mobile-nav {
        display: block;
    }

    .d2c-pillars-grid {
        grid-template-columns: 1fr;
    }

    .process-steps-list {
        grid-template-columns: 1fr;
    }

    .delivery-types-grid {
        grid-template-columns: 1fr;
    }

    .warranty-comparison-grid {
        grid-template-columns: 1fr;
    }

    .refund-steps-flow {
        grid-template-columns: 1fr;
    }

    .copyright-rules-box {
        grid-template-columns: 1fr;
    }

    .policies-cta-card {
        flex-direction: column;
        align-items: flex-start;
        padding: 24px;
    }

    .cta-card-content {
        flex-direction: column;
        align-items: flex-start;
        gap: 14px;
    }

    .cta-actions {
        width: 100%;
        flex-direction: column;
    }

    .cta-actions .btn {
        width: 100%;
        justify-content: center;
    }
}

@media (max-width: 640px) {
    .policies-hero {
        padding: 24px 0 32px;
    }

    .policies-title {
        font-size: 1.75rem;
    }

    .policies-desc {
        font-size: 0.95rem;
    }

    .policy-section {
        padding: 22px 18px;
    }

    .section-card-header {
        gap: 12px;
    }

    .section-badge-icon {
        width: 40px;
        height: 40px;
    }

    .section-heading {
        font-size: 1.2rem;
    }
}
</style>

<!-- ==========================================================================
     VANILLA JAVASCRIPT: SCROLLSPY & SMOOTH SCROLL INTERACTION
     ========================================================================== */ -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const sections = document.querySelectorAll('.policy-section');
    const tocLinks = document.querySelectorAll('.sidebar-nav .toc-link');
    const mobilePills = document.querySelectorAll('.mobile-nav-scroll .mobile-nav-pill');
    const mobileNavScroll = document.getElementById('mobileNavScroll');

    if (!sections.length) return;

    // ScrollSpy: Tự động active mục tương ứng khi cuộn
    function updateActiveNav() {
        const scrollPosition = window.scrollY + 120; // 120px offset cho sticky header

        sections.forEach(section => {
            const top = section.offsetTop;
            const height = section.offsetHeight;
            const id = section.getAttribute('id');

            if (scrollPosition >= top && scrollPosition < top + height) {
                // Active trong sidebar TOC
                tocLinks.forEach(link => {
                    if (link.getAttribute('data-target') === id) {
                        link.classList.add('active');
                    } else {
                        link.classList.remove('active');
                    }
                });

                // Active trong mobile pills
                mobilePills.forEach(pill => {
                    if (pill.getAttribute('data-target') === id) {
                        pill.classList.add('active');
                        // Tự cuộn thanh pill đến vị trí đang chọn nếu bị tràn
                        if (mobileNavScroll) {
                            const pillLeft = pill.offsetLeft;
                            const pillWidth = pill.offsetWidth;
                            const containerWidth = mobileNavScroll.offsetWidth;
                            mobileNavScroll.scrollTo({
                                left: pillLeft - (containerWidth / 2) + (pillWidth / 2),
                                behavior: 'smooth'
                            });
                        }
                    } else {
                        pill.classList.remove('active');
                    }
                });
            }
        });
    }

    // Lắng nghe sự kiện scroll (dùng throttle nhẹ)
    let isThrottled = false;
    window.addEventListener('scroll', function() {
        if (!isThrottled) {
            window.requestAnimationFrame(function() {
                updateActiveNav();
                isThrottled = false;
            });
            isThrottled = true;
        }
    });

    // Kích hoạt ngay khi tải trang
    updateActiveNav();

    // Xử lý click mượt mà cho TOC Links
    [...tocLinks, ...mobilePills].forEach(link => {
        link.addEventListener('click', function(e) {
            const targetId = this.getAttribute('data-target');
            const targetEl = document.getElementById(targetId);
            if (targetEl) {
                e.preventDefault();
                targetEl.scrollIntoView({ behavior: 'smooth', block: 'start' });
                // Cập nhật URL hash nhẹ nhàng
                history.pushState(null, null, '#' + targetId);
            }
        });
    });
});
</script>
