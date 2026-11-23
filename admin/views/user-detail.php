<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 24px;">
    
    <!-- Cột Trái: Thông tin cá nhân & Trạng thái -->
    <div>
        <div class="data-card" style="padding: 24px; margin-bottom: 24px;">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                <h3>Thông tin cơ bản</h3>
                <a href="<?= ADMIN_BASE ?>/pages/users.php" class="btn btn-sm" style="background: #e2e8f0; color: #0f172a; text-decoration: none;">Quay lại</a>
            </div>
            
            <p style="margin-bottom: 10px;"><strong>ID:</strong> #<?= $user['id'] ?></p>
            <p style="margin-bottom: 10px;"><strong>Họ tên:</strong> <?= e($user['name']) ?></p>
            <p style="margin-bottom: 10px;"><strong>Email:</strong> <?= e($user['email']) ?></p>
            <p style="margin-bottom: 10px;"><strong>Ngày đăng ký:</strong> <?= date('d/m/Y H:i', strtotime($user['created_at'])) ?></p>
            <p style="margin-bottom: 10px;"><strong>Trạng thái:</strong> 
                <?php if ($user['status'] == 'active'): ?>
                    <span style="color: #10b981; font-weight: 600;">● Đang hoạt động</span>
                <?php else: ?>
                    <span style="color: #ef4444; font-weight: 600;">○ Đang bị khóa</span>
                <?php endif; ?>
            </p>
            
            <form method="post" style="margin-top: 24px; border-top: 1px solid #e2e8f0; padding-top: 20px;">
                <?= admin_csrf_field() ?>
                <input type="hidden" name="action" value="toggle_status">
                <button type="submit" class="btn" style="width: 100%; background: <?= $user['status'] == 'active' ? '#ef4444' : '#10b981' ?>; color: white;">
                    <?= $user['status'] == 'active' ? 'Khóa tài khoản này' : 'Mở khóa tài khoản' ?>
                </button>
            </form>
        </div>
    </div>

    <!-- Cột Phải: Quản lý số dư ví -->
    <div>
        <div class="data-card" style="padding: 24px;">
            <h3 style="margin-bottom: 16px; border-bottom: 1px solid #e2e8f0; padding-bottom: 12px;">Ví điện tử</h3>
            
            <div style="background: #f8fafc; padding: 20px; border-radius: 8px; text-align: center; margin-bottom: 20px;">
                <p style="color: #64748b; font-size: 0.9rem; margin-bottom: 8px;">Số dư hiện tại</p>
                <div style="font-size: 2.5rem; font-weight: 800; color: #10b981;"><?= money($user['balance']) ?></div>
            </div>

            <?php if (!empty($errors)): ?>
                <div style="background: #fee2e2; color: #991b1b; padding: 12px; border-radius: 8px; margin-bottom: 20px;">
                    <?php foreach ($errors as $err) echo "<div>• $err</div>"; ?>
                </div>
            <?php endif; ?>
            <?php if ($success): ?>
                <div style="background: #dcfce7; color: #166534; padding: 12px; border-radius: 8px; margin-bottom: 20px;">✓ <?= $success ?></div>
            <?php endif; ?>

            <form method="post">
                <?= admin_csrf_field() ?>
                <input type="hidden" name="action" value="adjust_balance">
                
                <div class="form-group">
                    <label>Số tiền thay đổi (VNĐ)</label>
                    <input type="number" name="amount" class="form-control" placeholder="VD: 100000 hoặc -50000" required>
                    <small style="color:#64748b; display:block; margin-top:4px;">Nhập số dương (VD: 50000) để cộng tiền. Nhập số âm (VD: -20000) để trừ tiền.</small>
                </div>
                
                <button type="submit" class="btn btn-primary" style="width: 100%;">Cập nhật số dư</button>
            </form>
        </div>
    </div>
</div>