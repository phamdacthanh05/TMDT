<div class="auth-section">
    <div class="container auth-container">
        <div class="auth-card">
            <!-- Cột Trái: Form Nhập Liệu (60%) -->
            <div class="auth-form-side">
                <div class="auth-header">
                    <span class="auth-badge">Chào mừng trở lại</span>
                    <h1 class="auth-title">Đăng nhập tài khoản</h1>
                    <p class="auth-subtitle">Nhập email và mật khẩu của bạn để tiếp tục mua sắm tài nguyên.</p>
                </div>

                <!-- Thông báo đăng ký thành công -->
                <?php if (isset($_GET['registered'])): ?>
                    <p class="success">Đăng ký thành công! Hãy đăng nhập để bắt đầu.</p>
                <?php endif; ?>

                <!-- Thông báo lỗi đăng nhập -->
                <?php if (!empty($error)) echo "<p class='error'>$error</p>"; ?>

                <form method="post" class="auth-form">
                    <?= csrf_field() ?>
                    
                    <div class="form-group">
                        <label class="form-label" for="login-email">Email</label> 
                        <input type="email" id="login-email" name="email" class="form-control" placeholder="Nhập email của bạn..." required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="login-password">Mật khẩu</label> 
                        <input type="password" id="login-password" name="password" class="form-control" placeholder="Nhập mật khẩu..." required>
                    </div>
                    
                    <button type="submit" class="btn-auth-submit">Đăng nhập</button>
                </form>

                <p class="auth-footer">
                    Chưa có tài khoản? <a href="<?= APP_BASE ?>/pages/auth/register.php">Đăng ký ngay</a>
                </p>
            </div>

            <!-- Cột Phải: Ảnh Background Hero + Overlay (40%) -->
            <div class="auth-image-side" style="background-image: url('<?= IMG_URL ?>/hero.jpg');">
                <div class="auth-image-overlay">
                    <span class="overlay-badge">Kho tài nguyên D2C</span>
                    <h2 class="overlay-title">Khám phá kho tàng tài nguyên số.</h2>
                    <p class="overlay-desc">Hàng ngàn Source Code, Template, Tài liệu chất lượng đang chờ bạn.</p>
                    
                    <div class="overlay-features">
                        <div class="overlay-feature-item">
                            <span class="feature-check">✓</span>
                            <span>Thanh toán tự động, tải về tức thì</span>
                        </div>
                        <div class="overlay-feature-item">
                            <span class="feature-check">✓</span>
                            <span>Mã nguồn sạch, bảo hành trọn đời</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
