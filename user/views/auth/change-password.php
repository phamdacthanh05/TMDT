<div class="container settings-wrapper">
    <div class="settings-card">
        <!-- Tiêu đề & mô tả -->
        <div class="settings-header">
            <h2 class="settings-title">Đổi Mật Khẩu</h2>
            <p class="settings-desc">Bảo vệ tài khoản của bạn bằng mật khẩu mạnh mẽ và an toàn.</p>
        </div>

        <!-- Thông báo lỗi & thành công -->
        <?php foreach ($errors as $err) echo "<p class='error'>$err</p>"; ?>
        <?php if ($success) echo "<p class='success'>$success</p>"; ?>

        <!-- Form đổi mật khẩu -->
        <form method="post" class="form">
            <?= csrf_field() ?>
            
            <div class="form-group">
                <label class="form-label">Mật khẩu hiện tại</label> 
                <input type="password" name="old_password" class="form-control" required placeholder="Nhập mật khẩu đang dùng...">
            </div>
            
            <div class="form-group">
                <label class="form-label">Mật khẩu mới (tối thiểu 6 ký tự)</label> 
                <input type="password" name="new_password" class="form-control" required placeholder="Tạo mật khẩu mới...">
            </div>
            
            <div class="form-group">
                <label class="form-label">Xác nhận mật khẩu mới</label> 
                <input type="password" name="confirm_password" class="form-control" required placeholder="Nhập lại mật khẩu mới...">
            </div>
            
            <button type="submit" class="btn-submit">Cập nhật mật khẩu mới</button>
        </form>

        <!-- Quay lại -->
        <div class="settings-nav-links">
            <a href="<?= APP_BASE ?>/pages/auth/profile.php">&larr; Quay lại thông tin cá nhân</a>
        </div>
    </div>
</div>
