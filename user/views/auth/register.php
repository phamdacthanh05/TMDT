<div class="auth-section">
    <div class="container auth-container">
        <div class="auth-card">
            <!-- Cột Trái: Form Nhập Liệu (60%) -->
            <div class="auth-form-side">
                <div class="auth-header">
                    <span class="auth-badge">Bắt đầu ngay hôm nay</span>
                    <h1 class="auth-title">Tạo tài khoản mới</h1>
                    <p class="auth-subtitle">Bắt đầu hành trình mua sắm và sở hữu tài nguyên số của bạn.</p>
                </div>

                <!-- Hiển thị các lỗi đăng ký -->
                <?php if (!empty($errors)): ?>
                    <div class="error" style="margin-bottom: 20px;">
                        <?php foreach ($errors as $err) echo "<p style='margin:0;'>$err</p>"; ?>
                    </div>
                <?php endif; ?>

                <form method="post" class="auth-form">
                    <?= csrf_field() ?>
                    
                    <div class="form-group">
                        <label class="form-label" for="reg-name">Họ và tên</label> 
                        <input type="text" id="reg-name" name="name" class="form-control" value="<?= e($old_name) ?>" placeholder="VD: Nguyễn Văn A..." required>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="reg-email">Email</label> 
                        <input type="email" id="reg-email" name="email" class="form-control" value="<?= e($old_email) ?>" placeholder="Nhập email của bạn..." required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="reg-password">Mật khẩu</label> 
                        <input type="password" id="reg-password" name="password" class="form-control" placeholder="Tạo mật khẩu (tối thiểu 6 ký tự)..." required>
                    </div>
                    
                    <button type="submit" class="btn-auth-submit">Đăng ký tài khoản</button>
                </form>

                <p class="auth-footer">
                    Đã có tài khoản? <a href="<?= APP_BASE ?>/pages/auth/login.php">Đăng nhập ngay</a>
                </p>
            </div>

            <!-- Cột Phải: Ảnh Background Hero + Overlay (40%) -->
            <div class="auth-image-side" style="background-image: url('<?= IMG_URL ?>/hero.jpg');">
                <div class="auth-image-overlay">
                    <span class="overlay-badge">Cộng đồng Developers</span>
                    <h2 class="overlay-title">Gia nhập cộng đồng DigitalShop.</h2>
                    <p class="overlay-desc">Trải nghiệm mua sắm an toàn, thanh toán tự động và nhận file ngay lập tức.</p>
                    
                    <div class="overlay-features">
                        <div class="overlay-feature-item">
                            <span class="feature-check">✓</span>
                            <span>Quản lý số dư ví tiện lợi</span>
                        </div>
                        <div class="overlay-feature-item">
                            <span class="feature-check">✓</span>
                            <span>Cập nhật mã nguồn trọn đời miễn phí</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
