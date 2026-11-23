<section class="section" style="padding-top: 120px;">
    <div class="container">
        <h1 class="section-title" style="margin-bottom: 8px;">Lịch Sử Mua Hàng & Tài Sản Số</h1>
        <p style="color: #64748b; font-size: 0.95rem; margin-bottom: 24px;">
            * Hệ thống chỉ lưu trữ lịch sử trong vòng 7 ngày. Bấm vào từng đơn hàng để xem tài khoản/File đã mua.
        </p>

        <!-- Thông báo thanh toán thành công hoặc ẩn đơn thành công -->
        <?php if (isset($_SESSION['flash_success'])): ?>
            <div class="alert alert-success" style="margin-bottom: 20px;">
                <p><?= $_SESSION['flash_success']; unset($_SESSION['flash_success']); ?></p>
            </div>
        <?php endif; ?>

        <?php if (empty($orders)): ?>
            <div class="alert" style="background: #fff; border: 1px solid #e2e8f0; text-align: center;">
                <p>Bạn chưa có đơn hàng nào. <a href="<?= APP_BASE ?>/pages/products.php">Mua sắm ngay!</a></p>
            </div>
        <?php else: ?>
            <div style="background: #fff; border-radius: 12px; border: 1px solid #e2e8f0; overflow: hidden;">
                
                <!-- Header của bảng -->
                <div style="display: grid; grid-template-columns: 1fr 2fr 1.5fr 1.5fr 120px; padding: 16px 24px; background: #f8fafc; font-weight: 600; color: #475569; font-size: 0.9rem; border-bottom: 1px solid #e2e8f0;">
                    <div>Mã Đơn</div>
                    <div>Ngày đặt</div>
                    <div>Tổng tiền</div>
                    <div>Trạng thái</div>
                    <div style="text-align: right;">Hành động</div>
                </div>

                <!-- Danh sách đơn hàng (Accordion) -->
                <?php foreach ($orders as $o): ?>
                    <details style="border-bottom: 1px solid #e2e8f0; cursor: pointer;">
                        <!-- Dòng tóm tắt -->
                        <summary style="display: grid; grid-template-columns: 1fr 2fr 1.5fr 1.5fr 120px; padding: 16px 24px; align-items: center; outline: none;">
                            <div style="font-weight: 700; color: #2563eb;">#<?= $o['id'] ?></div>
                            <div style="color: #334155;"><?= date('d/m/Y H:i', strtotime($o['created_at'])) ?></div>
                            <div style="font-weight: 700; color: #ef4444;"><?= money($o['total_amount']) ?></div>
                            <div>
                                <?php if ($o['status'] == 'completed'): ?>
                                    <span style="color: #10b981; font-weight: 600;">● Thành công</span>
                                <?php elseif ($o['status'] == 'pending'): ?>
                                    <span style="color: #f59e0b; font-weight: 600;">⏳ Chờ xử lý</span>
                                <?php else: ?>
                                    <span style="color: #ef4444; font-weight: 600;">✕ Đã hủy</span>
                                <?php endif; ?>
                            </div>
                            
                            <!-- Nút Xem Chi Tiết (Dùng thẻ span để không bị lỗi click) -->
                            <div style="text-align: right;">
                                <span style="background: #2563eb; color: #fff; padding: 6px 12px; border-radius: 6px; font-size: 0.85rem; font-weight: 600; display: inline-block; transition: 0.2s;" onmouseover="this.style.background='#1d4ed8'" onmouseout="this.style.background='#2563eb'">
                                    Xem chi tiết
                                </span>
                            </div>
                        </summary>

                        <!-- Nội dung xổ xuống (Chi tiết sản phẩm & Tài khoản) -->
                        <div style="padding: 0 24px 24px 24px; background: #fafafa; cursor: default;">
                            <div style="background: #fff; border: 1px solid #e2e8f0; border-radius: 8px; padding: 16px;">
                                
                                <!-- Thanh công cụ: Tiêu đề & Nút Ẩn đơn -->
                                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px; border-bottom: 1px solid #e2e8f0; padding-bottom: 12px;">
                                    <h4 style="color: #0f172a; font-size: 1rem;">Chi tiết sản phẩm:</h4>
                                        <a href="javascript:void(0);" 
                                        onclick="showConfirm(
                                            'Bạn muốn ẩn đơn hàng này khỏi lịch sử? (Thông tin tài khoản vẫn được bảo lưu an toàn trên hệ thống)', 
                                            function() { window.location.href = '<?= APP_BASE ?>/pages/hide-order.php?id=<?= $o['id'] ?>'; },
                                            'Xóa đơn hàng',
                                            'Xóa khỏi lịch sử',
                                            true
                                        );" 
                                        style="color: #ef4444; font-size: 0.9rem; text-decoration: none; font-weight: 500; display: inline-flex; align-items: center;">
                                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="margin-right:4px;"><path d="M3 6h18"></path><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
                                        Xóa khỏi lịch sử
                                        </a>
                                </div>
                                
                                <?php if (isset($items_grouped[$o['id']])): ?>
                                    <?php foreach ($items_grouped[$o['id']] as $item): ?>
                                        <div style="display: flex; gap: 16px; padding: 12px 0; border-bottom: 1px dashed #e2e8f0; align-items: center;">
                                            <img src="<?= product_image($item['product_image']) ?>" style="width: 50px; height: 50px; border-radius: 6px; object-fit: cover;">
                                            <div style="flex: 1;">
                                                <div style="font-weight: 600; color: #1e293b;"><?= e($item['product_name']) ?></div>
                                                <div style="font-size: 0.85rem; color: #64748b;">Giá: <?= money($item['price']) ?></div>
                                            </div>
                                            
                                            <!-- Khu vực cấp phát (Tài khoản hoặc Tải file) -->
                                            <div style="text-align: right; min-width: 250px;">
                                                <?php if ($item['product_type'] == 'account'): ?>
                                                    <div style="font-size: 0.8rem; color: #64748b; margin-bottom: 4px;">Tài khoản / Key:</div>
                                                    
                                                    <!-- Khối hiển thị Tài khoản & Nút Copy -->
                                                    <div style="display: flex; gap: 8px; justify-content: flex-end; align-items: center;">
                                                        <div id="acc-<?= $item['id'] ?>" style="font-family: monospace; font-weight: 600; color: #0f172a; background: #f1f5f9; padding: 6px 10px; border-radius: 4px; word-break: break-all; flex: 1; text-align: left;">
                                                            <?= e($item['account_data']) ?>
                                                        </div>
                                                        <button onclick="event.preventDefault(); copyText('acc-<?= $item['id'] ?>')" class="btn btn-sm" style="background:#10b981; color:#fff; border:none; padding: 6px 10px; border-radius: 4px; cursor:pointer;" title="Sao chép tài khoản">Copy</button>
                                                    </div>
                                                    
                                                <?php else: ?>
                                                    <!-- CODE MỚI DÀNH CHO TẢI FILE -->
                                                    <?php if (!empty($item['download_link'])): ?>
                                                        <a href="<?= e($item['download_link']) ?>" target="_blank" rel="noopener noreferrer" class="btn btn-primary btn-sm" style="text-decoration: none; display: inline-flex; align-items: center; gap: 6px;">
                                                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="7 10 12 15 17 10"></polyline><line x1="12" y1="15" x2="12" y2="3"></line></svg>
                                                            Tải File Ngay
                                                        </a>
                                                    <?php else: ?>
                                                        <span style="font-size: 0.85rem; color: #ef4444;">Đang cập nhật link tải...</span>
                                                    <?php endif; ?>
                                                <?php endif; ?>
                                            </div>
                                        </div>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <p style="color: #64748b; font-size: 0.9rem;">Không có dữ liệu sản phẩm cho đơn này.</p>
                                <?php endif; ?>
                            </div>
                        </div>
                    </details>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
</section>

<!-- CSS bổ sung -->
<style>
    summary::-webkit-details-marker { display: none; }
    details[open] summary { background-color: #f1f5f9; }
    summary:hover { background-color: #f8fafc; }
</style>

<!-- JavaScript xử lý nút Copy -->
<script>
function copyText(elementId) {
    var text = document.getElementById(elementId).innerText;
    navigator.clipboard.writeText(text).then(function() {
        alert('Đã sao chép tài khoản vào bộ nhớ tạm!');
    }).catch(function(err) {
        alert('Lỗi khi sao chép: ' + err);
    });
}
</script>