<div class="data-card" style="padding: 24px;">
    <?php if (isset($_SESSION['admin_flash_success'])): ?>
        <div style="background: #dcfce7; color: #166534; padding: 16px; border-radius: 8px; margin-bottom: 20px; font-weight: 600;">
            ✓ <?= $_SESSION['admin_flash_success']; unset($_SESSION['admin_flash_success']); ?>
        </div>
    <?php endif; ?>
    
    <?php if (isset($_SESSION['admin_flash_error'])): ?>
        <div style="background: #fee2e2; color: #991b1b; padding: 16px; border-radius: 8px; margin-bottom: 20px; font-weight: 600;">
            ✕ <?= $_SESSION['admin_flash_error']; unset($_SESSION['admin_flash_error']); ?>
        </div>
    <?php endif; ?>

    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
        <h3>Danh sách Yêu cầu Hoàn tiền</h3>
    </div>

    <div style="background: #fff; border-radius: 12px; border: 1px solid #e2e8f0; overflow: hidden;">
        <!-- Header của bảng -->
        <div style="display: grid; grid-template-columns: 80px 1.5fr 1fr 1fr 1.2fr 150px; padding: 16px 24px; background: #f8fafc; font-weight: 600; color: #475569; font-size: 0.9rem; border-bottom: 1px solid #e2e8f0;">
            <div>Mã YC</div>
            <div>Khách hàng</div>
            <div>Đơn hàng</div>
            <div>Tổng tiền</div>
            <div>Trạng thái</div>
            <div style="text-align: right;">Hành động</div>
        </div>

        <!-- Danh sách (Accordion) -->
        <?php if (empty($refunds)): ?>
            <div style="padding: 20px; text-align: center; color: #64748b;">Chưa có yêu cầu hoàn tiền nào.</div>
        <?php else: ?>
            <?php foreach ($refunds as $r): ?>
                <details style="border-bottom: 1px solid #e2e8f0;">
                    <!-- Dòng tóm tắt -->
                    <summary style="display: grid; grid-template-columns: 80px 1.5fr 1fr 1fr 1.2fr 150px; padding: 16px 24px; align-items: center; outline: none; cursor: pointer;">
                        <div style="font-weight: 700;">#<?= $r['id'] ?></div>
                        <div>
                            <div style="font-weight: 600; color: #0f172a;"><?= e($r['user_name']) ?></div>
                            <div style="font-size: 0.8rem; color: #64748b;"><?= e($r['user_email']) ?></div>
                        </div>
                        <div style="font-weight: 600; color: #2563eb;">Đơn #<?= $r['order_id'] ?></div>
                        <div style="font-weight: 700; color: #ef4444;"><?= money($r['total_amount']) ?></div>
                        <div>
                            <?php if ($r['status'] == 'pending'): ?>
                                <span style="color: #f59e0b; font-weight: 600;">⏳ Chờ duyệt</span>
                            <?php elseif ($r['status'] == 'approved'): ?>
                                <span style="color: #10b981; font-weight: 600;">✓ Đã duyệt</span>
                            <?php else: ?>
                                <span style="color: #ef4444; font-weight: 600;">✕ Từ chối</span>
                            <?php endif; ?>
                        </div>
                        <div style="text-align: right;">
                            <span style="background: #e2e8f0; color: #0f172a; padding: 6px 12px; border-radius: 6px; font-size: 0.85rem; font-weight: 600; display: inline-block;">Xem chi tiết</span>
                        </div>
                    </summary>

                    <!-- Nội dung xổ xuống -->
                    <div style="padding: 0 24px 24px 24px; background: #fafafa;">
                        <div style="background: #fff; border: 1px solid #e2e8f0; border-radius: 8px; padding: 16px;">
                            
                            <!-- LÝ DO KHÁCH BÁO -->
                            <div style="margin-bottom: 16px; padding: 12px; background: #fef2f2; border: 1px solid #fecaca; border-radius: 8px; color: #991b1b;">
                                <strong>Lý do khách báo hoàn:</strong> <?= nl2br(e($r['reason'])) ?>
                            </div>

                            <!-- CHI TIẾT SẢN PHẨM & TÀI KHOẢN ĐÃ CẤP -->
                            <h4 style="margin-bottom: 12px; font-size: 0.95rem; color: #0f172a;">Sản phẩm & Tài khoản đã cấp:</h4>
                            
                            <?php if (isset($items_grouped[$r['order_id']])): ?>
                                <?php foreach ($items_grouped[$r['order_id']] as $item): ?>
                                    <div style="display: flex; gap: 16px; padding: 12px; border: 1px solid #e2e8f0; border-radius: 8px; margin-bottom: 12px; align-items: center;">
                                        <img src="<?= product_image($item['product_image']) ?>" style="width: 40px; height: 40px; border-radius: 6px; object-fit: cover;">
                                        <div style="flex: 1;">
                                            <div style="font-weight: 600; font-size: 0.95rem;"><?= e($item['product_name']) ?></div>
                                            <div style="font-size: 0.85rem; color: #ef4444; font-weight: 600;">Giá: <?= money($item['price']) ?></div>
                                        </div>
                                        
                                        <div style="text-align: right; min-width: 200px;">
                                            <?php if ($item['product_type'] == 'account'): ?>
                                                <div style="font-size: 0.75rem; color: #64748b; text-transform: uppercase; margin-bottom: 4px;">Tài khoản đã cấp:</div>
                                                <div style="font-family: monospace; font-weight: 700; background: #f1f5f9; padding: 6px 10px; border-radius: 4px; word-break: break-all;">
                                                    <?= e($item['account_data']) ?>
                                                </div>
                                            <?php else: ?>
                                                <div style="font-size: 0.85rem; color: #64748b;">Sản phẩm File (Không có TK)</div>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <p style="color: #64748b; font-size: 0.9rem;">Không tìm thấy dữ liệu sản phẩm.</p>
                            <?php endif; ?>

                            <!-- NÚT HÀNH ĐỘNG -->
                            <?php if ($r['status'] !== 'approved'): ?>
                                <div style="margin-top: 20px; border-top: 1px solid #e2e8f0; padding-top: 16px;">
                                    
                                    <?php if ($r['status'] == 'pending'): ?>
                                        <!-- Form Từ chối (Chỉ hiện khi đang chờ duyệt) -->
                                        <form method="POST" action="<?= ADMIN_BASE ?>/pages/refund-process.php" style="margin-bottom: 12px;">
                                            <input type="hidden" name="id" value="<?= $r['id'] ?>">
                                            <input type="hidden" name="action" value="reject">
                                            <div class="form-group" style="margin-bottom: 12px;">
                                                <label style="font-size: 0.85rem; font-weight: 600; color: #ef4444;">Lý do từ chối (Bắt buộc phải nhập):</label>
                                                <input type="text" name="admin_note" class="form-control" placeholder="VD: Tài khoản vẫn hoạt động, lỗi do khách nhập sai..." required>
                                            </div>
                                            <button type="submit" onclick="return confirm('Bạn chắc chắn muốn từ chối yêu cầu này?');" class="btn" style="background: #fff; border: 1px solid #ef4444; color: #ef4444; padding: 8px 16px; width: 100%;">Xác nhận Từ chối</button>
                                        </form>
                                    <?php endif; ?>

                                    <!-- Nút Duyệt (Hiện cả khi đang chờ hoặc đã bị từ chối) -->
                                    <a href="<?= ADMIN_BASE ?>/pages/refund-process.php?id=<?= $r['id'] ?>&action=approve" 
                                       onclick="return confirm('Duyệt yêu cầu này? Tiền sẽ được cộng lại vào ví khách hàng.');" 
                                       class="btn btn-primary" 
                                       style="padding: 8px 16px; width: 100%; text-align: center; display: block; <?= $r['status'] == 'rejected' ? 'background: #10b981; border-color: #10b981;' : '' ?>">
                                       <?= $r['status'] == 'rejected' ? 'Duyệt lại (Hoàn tiền)' : 'Duyệt hoàn tiền' ?>
                                    </a>
                                </div>
                            <?php else: ?>
                                <!-- Hiển thị ghi chú của admin (nếu đã từ chối trước đó) -->
                                <?php if (!empty($r['admin_note'])): ?>
                                    <div style="margin-top: 16px; padding: 12px; background: #f8fafc; border: 1px dashed #cbd5e1; border-radius: 8px; font-size: 0.9rem;">
                                        <strong>Ghi chú cũ của Admin:</strong> <?= e($r['admin_note']) ?>
                                    </div>
                                <?php endif; ?>
                            <?php endif; ?>
                        </div>
                    </div>
                </details>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</div>

<style>
    summary::-webkit-details-marker { display: none; }
    details[open] summary { background-color: #f1f5f9; }
    summary:hover { background-color: #f8fafc; }
</style>