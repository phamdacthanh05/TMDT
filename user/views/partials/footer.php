<footer class="footer" id="support">
    <div class="container">
        <div class="footer-grid">
            <!-- Cột 1: Giới thiệu thương hiệu -->
            <div class="footer-col">
                <a href="<?= APP_BASE ?>/index.php" class="footer-logo">
                    <div class="logo-icon" style="width:32px;height:32px;font-size:16px;">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="16 18 22 12 16 6"></polyline>
                            <polyline points="8 6 2 12 8 18"></polyline>
                        </svg>
                    </div>
                    <span>DigitalShop</span>
                </a>
                <p class="footer-desc">
                    Hệ thống thương mại điện tử phân phối tài nguyên số trực tiếp (D2C). Cung cấp Source Code, Template và Tài liệu chuyên sâu cho Developers & Designers.
                </p>
                <div class="footer-badges">
                    <span class="footer-badge-item">🔒 Thanh toán bảo mật</span>
                    <span class="footer-badge-item">⚡ Tải file tức thì</span>
                    <span class="footer-badge-item">💯 Bản quyền sạch</span>
                </div>
            </div>

            <!-- Cột 2: Danh mục tài nguyên -->
            <div class="footer-col">
                <h4 class="footer-title">Tài nguyên số</h4>
                <ul class="footer-links">
                    <li><a href="<?= APP_BASE ?>/pages/products.php?category=Source+Code">Source Code Web & Mobile</a></li>
                    <li><a href="<?= APP_BASE ?>/pages/products.php?category=Template+Admin">Giao diện Admin Template</a></li>
                    <li><a href="<?= APP_BASE ?>/pages/products.php?category=HTML5+Landing">HTML5 Landing Page</a></li>
                    <li><a href="<?= APP_BASE ?>/pages/products.php?category=Ebook+%2F+T%C3%A0i+li%E1%BB%87u">Ebook & Tài liệu lập trình</a></li>
                    <li><a href="<?= APP_BASE ?>/pages/products.php?category=T%C3%A0i+kho%E1%BA%A3n+%2F+Key+Ph%E1%BA%A7n+m%E1%BB%81m">Tài khoản & Key bản quyền</a></li>
                </ul>
            </div>

            <!-- Cột 3: Hỗ trợ & Khách hàng -->
            <div class="footer-col">
                <h4 class="footer-title">Hỗ trợ khách hàng</h4>
                <ul class="footer-links">
                    <li><a href="<?= APP_BASE ?>/pages/deposit.php">Hướng dẫn nạp ví</a></li>
                    <li><a href="<?= APP_BASE ?>/pages/policies.php">Chính sách đổi trả & bảo hành</a></li>
                    <li><a href="<?= APP_BASE ?>/pages/promotions.php">Khuyến mãi & Ưu đãi</a></li>
                    <li><a href="javascript:void(0)">Câu hỏi thường gặp (FAQ)</a></li>
                    <li><a href="<?= APP_BASE ?>/pages/support-create.php">Liên hệ đội ngũ hỗ trợ</a></li>
                </ul>
            </div>

            <!-- Cột 4: Bản tin & Khuyến mãi -->
            <div class="footer-col footer-newsletter">
                <h4 class="footer-title">Nhận bản tin công nghệ</h4>
                <p>Nhận ngay mã giảm giá 15% cho đơn hàng đầu tiên và thông báo cập nhật source code mới mỗi tuần.</p>
                <form class="newsletter-form" onsubmit="event.preventDefault(); alert('Cảm ơn bạn đã đăng ký nhận bản tin khuyến mãi!');">
                    <input type="email" class="newsletter-input" placeholder="Nhập địa chỉ email..." required>
                    <button type="submit" class="btn btn-primary btn-sm">Gửi</button>
                </form>
            </div>
        </div>

        <!-- Bản quyền & Bottom Links -->
        <div class="footer-bottom">
            <p>&copy; <?= date('Y') ?> DigitalShop. Nền tảng D2C Tài Nguyên Số. All rights reserved.</p>
            <div class="footer-bottom-links">
                <a href="<?= APP_BASE ?>/pages/policies.php">Điều khoản dịch vụ</a>
                <a href="<?= APP_BASE ?>/pages/policies.php">Chính sách bảo mật</a>
                <a href="<?= APP_BASE ?>/pages/policies.php">Bảo mật thanh toán</a>
            </div>
        </div>
    </div>
</footer>