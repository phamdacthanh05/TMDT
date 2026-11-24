<div class="data-card">
    <div class="data-header">
        <div>
            <h3>Danh sách Khách hàng</h3>
            <p style="font-size: 0.85rem; color: #64748b; margin-top: 2px;">Quản lý tài khoản thành viên và số dư ví điện tử</p>
        </div>
    </div>
    
    <div class="table-responsive">
        <table>
            <thead>
                <tr>
                    <th style="width: 80px;">ID</th>
                    <th>Họ tên</th>
                    <th>Email</th>
                    <th>Số dư ví</th>
                    <th>Trạng thái</th>
                    <th>Ngày đăng ký</th>
                    <th style="text-align: right; width: 120px;">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($users)): ?>
                    <tr><td colspan="7" style="text-align: center; padding: 36px; color: #64748b;">Chưa có người dùng nào.</td></tr>
                <?php else: ?>
                    <?php foreach ($users as $u): ?>
                    <tr>
                        <td style="font-weight: 700; color: #64748b;">#<?= $u['id'] ?></td>
                        <td style="font-weight: 600; color: #0f172a;"><?= e($u['name']) ?></td>
                        <td><?= e($u['email']) ?></td>
                        <td style="color: #15803d; font-weight: 700;"><?= money($u['balance']) ?></td>
                        <td>
                            <?php if ($u['status'] == 'active'): ?>
                                <span class="badge badge-success">● Hoạt động</span>
                            <?php else: ?>
                                <span class="badge badge-danger">○ Bị khóa</span>
                            <?php endif; ?>
                        </td>
                        <td style="color: #64748b; font-size: 0.875rem;"><?= date('d/m/Y', strtotime($u['created_at'])) ?></td>
                        <td style="text-align: right;">
                            <a href="<?= ADMIN_BASE ?>/pages/user-detail.php?id=<?= $u['id'] ?>" class="btn-action btn-action-edit">Chi tiết</a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>
