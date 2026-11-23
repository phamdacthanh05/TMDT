<div class="data-card">
    <div class="data-header">
        <h3>Danh sách Khách hàng</h3>
    </div>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Họ tên</th>
                <th>Email</th>
                <th>Số dư ví</th>
                <th>Trạng thái</th>
                <th>Ngày đăng ký</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <?php if (empty($users)): ?>
                <tr><td colspan="7" style="text-align: center;">Chưa có người dùng nào.</td></tr>
            <?php else: ?>
                <?php foreach ($users as $u): ?>
                <tr>
                    <td>#<?= $u['id'] ?></td>
                    <td style="font-weight: 600;"><?= e($u['name']) ?></td>
                    <td><?= e($u['email']) ?></td>
                    <td style="color: #10b981; font-weight: 700;"><?= money($u['balance']) ?></td>
                    <td>
                        <?php if ($u['status'] == 'active'): ?>
                            <span style="color: #10b981; font-weight: 600;">● Hoạt động</span>
                        <?php else: ?>
                            <span style="color: #ef4444; font-weight: 600;">○ Bị khóa</span>
                        <?php endif; ?>
                    </td>
                    <td style="color: #64748b; font-size: 0.9rem;"><?= date('d/m/Y', strtotime($u['created_at'])) ?></td>
                    <td>
                        <a href="<?= ADMIN_BASE ?>/pages/user-detail.php?id=<?= $u['id'] ?>" class="btn btn-sm" style="background:#3b82f6; color:#fff; text-decoration:none;">Chi tiết</a>
                    </td>
                </tr>
                <?php endforeach; ?>
            <?php endif; ?>
        </tbody>
    </table>
</div>