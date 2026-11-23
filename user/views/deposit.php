<section class="section" style="padding-top: 120px;">
    <div class="container">
        <h1 class="section-title" style="margin-bottom: 24px;">Nạp Tiền Vào Ví</h1>

        <!-- Thông báo -->
        <?php if (isset($_SESSION['flash_success'])): ?>
            <div class="alert alert-success" style="margin-bottom: 20px;">
                <p><?= $_SESSION['flash_success']; unset($_SESSION['flash_success']); ?></p>
            </div>
        <?php endif; ?>
        <?php if (isset($_SESSION['flash_error'])): ?>
            <div class="alert alert-error" style="margin-bottom: 20px;">
                <p><?= $_SESSION['flash_error']; unset($_SESSION['flash_error']); ?></p>
            </div>
        <?php endif; ?>

        <div style="display: grid; grid-template-columns: 1fr 1.5fr; gap: 24px;">
            
            <!-- Cột Trái: Form tạo lệnh nạp -->
            <div style="background: #fff; border: 1px solid #e2e8f0; border-radius: 12px; padding: 24px; height: fit-content;">
                <h3 style="margin-bottom: 16px; color: #0f172a;">Tạo lệnh nạp tiền</h3>
                
                <!-- Form trỏ thẳng sang cổng thanh toán VNPAY giả lập -->
                <form action="<?= APP_BASE ?>/pages/mock-gateway.php" method="GET">
                    <div class="form-group">
                        <label class="form-label">Số tiền muốn nạp (VNĐ)</label>
                        <input type="number" name="amount" class="form-control" min="10000" step="10000" required placeholder="VD: 100000">
                    </div>
                    
                    <div style="background: #eff6ff; padding: 12px; border-radius: 8px; margin-bottom: 20px; font-size: 0.9rem; color: #1e40af;">
                        <b>Ưu đãi nạp thẻ:</b><br>
                        - Nạp từ 100.000đ: Tặng thêm 5%<br>
                        - Nạp từ 500.000đ: Tặng thêm 10%
                    </div>

                    <button type="submit" class="btn btn-primary" style="width: 100%; padding: 12px;">
                        Thanh toán qua Cổng API
                    </button>
                </form>
            </div>

            <!-- Cột Phải: Lịch sử nạp tiền -->
            <div style="background: #fff; border: 1px solid #e2e8f0; border-radius: 12px; padding: 24px;">
                <h3 style="margin-bottom: 16px; color: #0f172a;">Lịch sử nạp tiền gần đây</h3>
                
                <div style="overflow-x: auto;">
                    <table style="width: 100%; border-collapse: collapse; text-align: left;">
                        <thead>
                            <tr style="border-bottom: 1px solid #e2e8f0; color: #64748b; font-size: 0.85rem; text-transform: uppercase;">
                                <th style="padding: 12px 8px;">Mã GD</th>
                                <th style="padding: 12px 8px;">Số tiền</th>
                                <th style="padding: 12px 8px;">Khuyến mãi</th>
                                <th style="padding: 12px 8px;">Trạng thái</th>
                                <th style="padding: 12px 8px;">Ngày</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (empty($deposits)): ?>
                                <tr>
                                    <td colspan="5" style="text-align: center; padding: 30px; color: #94a3b8;">
                                        Chưa có giao dịch nạp tiền nào.
                                    </td>
                                </tr>
                            <?php else: ?>
                                <?php foreach ($deposits as $d): ?>
                                <tr style="border-bottom: 1px solid #f1f5f9;">
                                    <td style="padding: 12px 8px; font-weight: 600; color: #2563eb;">#<?= $d['id'] ?></td>
                                    <td style="padding: 12px 8px; font-weight: 600;"><?= money($d['amount']) ?></td>
                                    <td style="padding: 12px 8px; color: #10b981; font-weight: 500;">+<?= money($d['bonus']) ?></td>
                                    <td style="padding: 12px 8px;">
                                        <?php if ($d['status'] == 'completed'): ?>
                                            <span style="color: #10b981; font-weight: 600;">● Thành công</span>
                                        <?php elseif ($d['status'] == 'pending'): ?>
                                            <span style="color: #f59e0b; font-weight: 600;">⏳ Chờ duyệt</span>
                                        <?php else: ?>
                                            <span style="color: #ef4444; font-weight: 600;">✕ Đã hủy</span>
                                        <?php endif; ?>
                                    </td>
                                    <td style="padding: 12px 8px; color: #64748b; font-size: 0.85rem;">
                                        <?= date('d/m/Y H:i', strtotime($d['created_at'])) ?>
                                    </td>
                                </tr>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
            
        </div>
    </div>
</section>