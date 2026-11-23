<section class="section" style="padding-top: 120px;">
    <div class="container" style="max-width: 900px;">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px;">
            <h1 class="section-title" style="margin: 0;">Yêu Cầu Hỗ Trợ Của Bạn</h1>
            <a href="<?= APP_BASE ?>/pages/support-create.php" class="btn btn-primary">+ Tạo yêu cầu mới</a>
        </div>

        <?php if (isset($_SESSION['flash_success'])): ?>
            <div class="alert alert-success" style="margin-bottom: 20px;"><p><?= $_SESSION['flash_success']; unset($_SESSION['flash_success']); ?></p></div>
        <?php endif; ?>

        <div style="background: #fff; border-radius: 12px; border: 1px solid #e2e8f0; overflow: hidden;">
            <table style="width: 100%; border-collapse: collapse; text-align: left;">
                <thead style="background: #f8fafc;">
                    <tr>
                        <th style="padding: 16px;">Mã</th>
                        <th style="padding: 16px;">Tiêu đề</th>
                        <th style="padding: 16px;">Trạng thái</th>
                        <th style="padding: 16px;">Ngày gửi</th>
                        <th style="padding: 16px;"></th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (empty($tickets)): ?>
                        <tr><td colspan="5" style="padding: 30px; text-align: center; color: #64748b;">Bạn chưa có yêu cầu hỗ trợ nào.</td></tr>
                    <?php else: ?>
                        <?php foreach ($tickets as $t): ?>
                        <tr style="border-bottom: 1px solid #e2e8f0;">
                            <td style="padding: 16px; font-weight: bold; color: #2563eb;">#<?= $t['id'] ?></td>
                            <td style="padding: 16px; font-weight: 500;"><?= e($t['subject']) ?></td>
                            <td style="padding: 16px;">
                                <?php if ($t['status'] == 'open'): ?>
                                    <span style="color: #f59e0b; font-weight: 600;">⏳ Đang chờ</span>
                                <?php elseif ($t['status'] == 'processing'): ?>
                                    <span style="color: #3b82f6; font-weight: 600;">💬 Đang xử lý</span>
                                <?php else: ?>
                                    <span style="color: #64748b; font-weight: 600;">✓ Đã đóng</span>
                                <?php endif; ?>
                            </td>
                            <td style="padding: 16px; color: #64748b;"><?= date('d/m/Y H:i', strtotime($t['created_at'])) ?></td>
                            <td style="padding: 16px; text-align: right;">
                                <a href="<?= APP_BASE ?>/pages/support-detail.php?id=<?= $t['id'] ?>" class="btn btn-sm" style="background:#f1f5f9; color:#0f172a; text-decoration:none;">Xem chi tiết</a>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</section>