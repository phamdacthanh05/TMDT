<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= e($title ?? 'Admin Panel') ?> - DigitalShop Quản trị</title>
    <!-- Google Fonts: Inter & Plus Jakarta Sans -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Plus+Jakarta+Sans:wght@600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<?= ADMIN_BASE ?>/assets/css/admin.css">
</head>
<body>
    <!-- Overlay mờ khi mở Sidebar trên Mobile -->
    <div class="sidebar-overlay" id="sidebarOverlay" onclick="toggleSidebar()"></div>

    <!-- SIDEBAR CHÍNH (DARK SLATE) -->
    <aside class="sidebar" id="adminSidebar">
        <!-- Logo thương hiệu -->
        <a href="<?= ADMIN_BASE ?>/index.php" class="sidebar-logo">
            <div class="logo-badge">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="16 18 22 12 16 6"></polyline>
                    <polyline points="8 6 2 12 8 18"></polyline>
                </svg>
            </div>
            <div class="logo-text-group">
                <span class="logo-brand">DigitalShop</span>
                <span class="logo-tag">Admin Panel</span>
            </div>
        </a>

        <!-- Menu điều hướng -->
        <ul class="sidebar-menu">
            <li>
                <a href="<?= ADMIN_BASE ?>/index.php" class="<?= (basename($_SERVER['PHP_SELF']) == 'index.php') ? 'active' : '' ?>">
                    <svg class="nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor"><rect x="3" y="3" width="7" height="7" rx="1.5"></rect><rect x="14" y="3" width="7" height="7" rx="1.5"></rect><rect x="14" y="14" width="7" height="7" rx="1.5"></rect><rect x="3" y="14" width="7" height="7" rx="1.5"></rect></svg>
                    <span>Tổng quan</span>
                </a>
            </li>
            <li>
                <a href="<?= ADMIN_BASE ?>/pages/products.php" class="<?= (basename($_SERVER['PHP_SELF']) == 'products.php' || basename($_SERVER['PHP_SELF']) == 'product-add.php' || basename($_SERVER['PHP_SELF']) == 'product-edit.php' || basename($_SERVER['PHP_SELF']) == 'product-stock.php') ? 'active' : '' ?>">
                    <svg class="nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg>
                    <span>Quản lý Sản phẩm</span>
                </a>
            </li>
            <li>
                <a href="<?= ADMIN_BASE ?>/pages/users.php" class="<?= (basename($_SERVER['PHP_SELF']) == 'users.php' || basename($_SERVER['PHP_SELF']) == 'user-detail.php') ? 'active' : '' ?>">
                    <svg class="nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                    <span>Quản lý Khách hàng</span>
                </a>
            </li>
            <li>
                <a href="<?= ADMIN_BASE ?>/pages/orders.php" class="<?= (basename($_SERVER['PHP_SELF']) == 'orders.php' || basename($_SERVER['PHP_SELF']) == 'order-detail.php') ? 'active' : '' ?>">
                    <svg class="nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
                    <span>Quản lý Đơn hàng</span>
                </a>
            </li>
            <li>
                <a href="<?= ADMIN_BASE ?>/pages/tickets.php" class="<?= (basename($_SERVER['PHP_SELF']) == 'tickets.php' || basename($_SERVER['PHP_SELF']) == 'ticket-detail.php') ? 'active' : '' ?>">
                    <svg class="nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
                    <span>Hỗ trợ Khách hàng</span>
                </a>
            </li>
            <li>
                <a href="<?= ADMIN_BASE ?>/pages/coupons.php" class="<?= (basename($_SERVER['PHP_SELF']) == 'coupons.php' || basename($_SERVER['PHP_SELF']) == 'coupon-add.php') ? 'active' : '' ?>">
                    <svg class="nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z"></path><line x1="7" y1="7" x2="7.01" y2="7"></line></svg>
                    <span>Mã Khuyến mãi</span>
                </a>
            </li>
            <li>
                <a href="<?= ADMIN_BASE ?>/pages/refunds.php" class="<?= (basename($_SERVER['PHP_SELF']) == 'refunds.php' || basename($_SERVER['PHP_SELF']) == 'refund-process.php') ? 'active' : '' ?>">
                    <svg class="nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor"><polyline points="1 4 1 10 7 10"></polyline><path d="M3.51 15a9 9 0 1 0 2.13-9.36L1 10"></path></svg>
                    <span>Quản lý Hoàn tiền</span>
                </a>
            </li>
        </ul>

        <!-- Footer Sidebar -->
        <div class="sidebar-footer">
            <a href="/TMDT/user/index.php" target="_blank" class="sidebar-footer-link website" title="Xem website phía người dùng">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"></path><polyline points="15 3 21 3 21 9"></polyline><line x1="10" y1="14" x2="21" y2="3"></line></svg>
                <span>Xem Website</span>
            </a>
            <a href="<?= ADMIN_BASE ?>/logout.php" class="sidebar-footer-link logout">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
                <span>Đăng xuất</span>
            </a>
        </div>
    </aside>

    <!-- KHU VỰC NỘI DUNG CHÍNH -->
    <main class="main-content">
        <!-- TOPBAR NỀN TRẮNG -->
        <header class="topbar">
            <div class="topbar-left">
                <!-- Nút toggle sidebar trên Mobile -->
                <button type="button" class="mobile-sidebar-toggle" onclick="toggleSidebar()" aria-label="Toggle Menu">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
                </button>
                <h1 class="topbar-title"><?= e($title ?? 'Dashboard') ?></h1>
            </div>

            <div class="topbar-actions">
                <!-- Chuông thông báo -->
                <button type="button" class="btn-icon" title="Thông báo hệ thống">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
                    <span class="notification-badge-dot"></span>
                </button>

                <!-- Avatar & Thông tin Admin -->
                <?php $currentAdmin = current_admin(); ?>
                <div class="topbar-user">
                    <div class="admin-avatar">
                        <?= mb_strtoupper(mb_substr($currentAdmin['name'] ?? 'A', 0, 1, 'UTF-8')) ?>
                    </div>
                    <div class="admin-info">
                        <span class="admin-name"><?= e($currentAdmin['name'] ?? 'Administrator') ?></span>
                        <span class="admin-role">Quản trị viên</span>
                    </div>
                </div>
            </div>
        </header>

        <!-- CONTENT AREA (NỀN XÁM NHẠT #f8fafc) -->
        <div class="content-area">
            <?php require __DIR__ . '/../' . $template . '.php'; ?>
        </div>
    </main>

    <!-- Script đóng/mở sidebar trên Mobile -->
    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('adminSidebar');
            const overlay = document.getElementById('sidebarOverlay');
            sidebar.classList.toggle('open');
            overlay.classList.toggle('active');
        }
    </script>
</body>
</html>
