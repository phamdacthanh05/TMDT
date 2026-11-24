<?php
// Truy vấn doanh thu và đơn hàng mới nhất (nếu có dữ liệu)
global $db;
$total_revenue = 0;
$recent_orders = [];

try {
    $rev_stmt = $db->query("SELECT SUM(total_amount) FROM orders WHERE status = 'completed'");
    $total_revenue = $rev_stmt ? ($rev_stmt->fetchColumn() ?: 0) : 0;
    
    $order_stmt = $db->query("SELECT * FROM orders ORDER BY id DESC LIMIT 5");
    $recent_orders = $order_stmt ? $order_stmt->fetchAll() : [];
} catch (Exception $e) {
    // Dự phòng an toàn nếu bảng chưa có
}
?>

<!-- HÀNG THỐNG KÊ (STAT CARDS) -->
<div class="stat-grid">
    <!-- Thẻ 1: Tổng Sản Phẩm -->
    <div class="stat-card">
        <div class="stat-header">
            <span class="stat-title">Tổng Sản Phẩm</span>
            <div class="stat-icon-wrapper blue">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg>
            </div>
        </div>
        <div class="stat-value"><?= number_format($total_products) ?></div>
        <div class="stat-footer">
            <span class="stat-badge-trend">↑ +12%</span>
            <span>So với tháng trước</span>
        </div>
    </div>

    <!-- Thẻ 2: Khách Hàng -->
    <div class="stat-card">
        <div class="stat-header">
            <span class="stat-title">Khách Hàng Đăng Ký</span>
            <div class="stat-icon-wrapper green">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
            </div>
        </div>
        <div class="stat-value"><?= number_format($total_users) ?></div>
        <div class="stat-footer">
            <span class="stat-badge-trend">↑ +8.5%</span>
            <span>Khách mới tuần này</span>
        </div>
    </div>

    <!-- Thẻ 3: Tổng Doanh Thu -->
    <div class="stat-card">
        <div class="stat-header">
            <span class="stat-title">Doanh Thu Đã Thu</span>
            <div class="stat-icon-wrapper amber">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="5" width="20" height="14" rx="2"></rect><line x1="2" y1="10" x2="22" y2="10"></line></svg>
            </div>
        </div>
        <div class="stat-value" style="color: #2563eb;"><?= money($total_revenue) ?></div>
        <div class="stat-footer">
            <span class="stat-badge-trend">↑ +18.2%</span>
            <span>Tăng trưởng định kỳ</span>
        </div>
    </div>
</div>

<!-- BẢNG ĐƠN HÀNG MỚI NHẤT -->
<div class="data-card">
    <div class="data-header">
        <div>
            <h3>Đơn hàng mới nhất</h3>
            <p style="font-size: 0.85rem; color: #64748b; margin-top: 2px;">Các giao dịch tài nguyên số phát sinh gần đây</p>
        </div>
        <a href="<?= ADMIN_BASE ?>/pages/orders.php" class="btn btn-secondary btn-sm">Xem tất cả đơn hàng &rarr;</a>
    </div>

    <div class="table-responsive">
        <table>
            <thead>
                <tr>
                    <th>Mã Đơn</th>
                    <th>Khách hàng</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                    <th>Thời gian</th>
                    <th style="text-align: right;">Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($recent_orders)): ?>
                    <tr>
                        <td colspan="6" style="text-align: center; padding: 32px; color: #64748b;">
                            Chưa có đơn hàng nào phát sinh gần đây.
                        </td>
                    </tr>
                <?php else: ?>
                    <?php foreach ($recent_orders as $ro): ?>
                    <tr>
                        <td style="font-weight: 700; color: #2563eb;">#<?= $ro['id'] ?></td>
                        <td>
                            <div style="font-weight: 600; color: #0f172a;"><?= e($ro['user_name']) ?></div>
                            <div style="font-size: 0.8rem; color: #64748b;"><?= e($ro['user_email']) ?></div>
                        </td>
                        <td style="font-weight: 700; color: #0f172a;"><?= money($ro['total_amount']) ?></td>
                        <td>
                            <?php if ($ro['status'] == 'completed'): ?>
                                <span class="badge badge-success">● Thành công</span>
                            <?php elseif ($ro['status'] == 'pending'): ?>
                                <span class="badge badge-warning">● Chờ xử lý</span>
                            <?php else: ?>
                                <span class="badge badge-danger">● Đã hủy</span>
                            <?php endif; ?>
                        </td>
                        <td style="color: #64748b; font-size: 0.875rem;">
                            <?= date('d/m/Y H:i', strtotime($ro['created_at'])) ?>
                        </td>
                        <td style="text-align: right;">
                            <a href="<?= ADMIN_BASE ?>/pages/order-detail.php?id=<?= $ro['id'] ?>" class="btn-action btn-action-edit">
                                Chi tiết
                            </a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>
