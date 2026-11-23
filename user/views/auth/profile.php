<div class="container settings-wrapper">
    <div class="settings-card">
        <!-- Tiêu đề & mô tả -->
        <div class="settings-header">
            <h2 class="settings-title">Thông Tin Cá Nhân</h2>
            <p class="settings-desc">Quản lý hồ sơ cá nhân và theo dõi số dư tài khoản của bạn.</p>
        </div>

        <!-- Thẻ Số Dư Ví Cá Nhân -->
        <div class="balance-card">
            <div class="balance-info">
                <span>Số dư tài khoản khả dụng</span>
                <div class="balance-amount"><?= money($user['balance']) ?></div>
            </div>
            <!-- Đã sửa nút Nạp tiền để trỏ sang trang deposit.php -->
            <a href="<?= APP_BASE ?>/pages/deposit.php" class="btn btn-primary btn-sm" style="background: rgba(255,255,255,0.15); border: 1px solid rgba(255,255,255,0.25); color: #fff; text-decoration: none;">
                + Nạp thêm số dư
            </a>
        </div>

        <!-- Thông báo lỗi & thành công -->
        <?php foreach ($errors as $err) echo "<p class='error'>$err</p>"; ?>
        <?php if ($success) echo "<p class='success'>$success</p>"; ?>

        <!-- Form cập nhật thông tin -->
        <form method="post" class="form">
            <?= csrf_field() ?>
            
            <div class="form-group">
                <label class="form-label">Họ và tên</label> 
                <input type="text" name="name" class="form-control" value="<?= e($user['name']) ?>" required placeholder="Nhập họ và tên...">
            </div>
            
            <div class="form-group">
                <label class="form-label">Địa chỉ Email</label> 
                <input type="email" name="email" class="form-control" value="<?= e($user['email']) ?>" required placeholder="Nhập địa chỉ email...">
            </div>
            
            <button type="submit" class="btn-submit">Lưu thay đổi hồ sơ</button>
        </form>

        <!-- Điều hướng bổ sung -->
        <div class="settings-nav-links">
            <span>Bảo mật:</span>
            <a href="<?= APP_BASE ?>/pages/auth/change-password.php">Đổi mật khẩu đăng nhập &rarr;</a>
        </div>
    </div>
</div>