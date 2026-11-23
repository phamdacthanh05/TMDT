<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"><title><?= e($title ?? 'Admin') ?></title>
    <link rel="stylesheet" href="<?= ADMIN_BASE ?>/assets/css/admin.css">
</head>
<body>
    <aside class="sidebar">
        <a href="<?= ADMIN_BASE ?>/index.php" class="sidebar-logo">DigitalShop Admin</a>
        <ul class="sidebar-menu">
            <li><a href="<?= ADMIN_BASE ?>/index.php" class="<?= (basename($_SERVER['PHP_SELF']) == 'index.php') ? 'active' : '' ?>">Tổng quan</a></li>
            <li><a href="<?= ADMIN_BASE ?>/pages/products.php" class="<?= (basename($_SERVER['PHP_SELF']) == 'products.php') ? 'active' : '' ?>">Quản lý Sản phẩm</a></li>
            <li><a href="<?= ADMIN_BASE ?>/pages/users.php" class="<?= (basename($_SERVER['PHP_SELF']) == 'users.php' || basename($_SERVER['PHP_SELF']) == 'user-detail.php') ? 'active' : '' ?>">Quản lý Người dùng</a></li>
            <li><a href="<?= ADMIN_BASE ?>/pages/orders.php" class="<?= (basename($_SERVER['PHP_SELF']) == 'orders.php' || basename($_SERVER['PHP_SELF']) == 'order-detail.php') ? 'active' : '' ?>">Quản lý Đơn hàng</a></li>
            <li><a href="<?= ADMIN_BASE ?>/pages/tickets.php" class="<?= (basename($_SERVER['PHP_SELF']) == 'tickets.php' || basename($_SERVER['PHP_SELF']) == 'ticket-detail.php') ? 'active' : '' ?>">Hỗ trợ khách hàng</a></li>
            <li><a href="<?= ADMIN_BASE ?>/pages/coupons.php" class="<?= (basename($_SERVER['PHP_SELF']) == 'coupons.php') ? 'active' : '' ?>">Quản lý Khuyến mãi</a></li>
            <li>
    <a href="<?= ADMIN_BASE ?>/pages/refunds.php" class="<?= (basename($_SERVER['PHP_SELF']) == 'refunds.php') ? 'active' : '' ?>">
        Quản lý Hoàn tiền
    </a>
</li>
        </ul>
        <div class="sidebar-footer"><a href="<?= ADMIN_BASE ?>/logout.php">← Đăng xuất</a></div>
    </aside>

    <main class="main-content">
        <header class="topbar">
            <h2><?= e($title ?? 'Dashboard') ?></h2>
            <div>Chào, <strong><?= e(current_admin()['name']) ?></strong></div>
        </header>
        <div class="content-area">
            <?php require __DIR__ . '/../' . $template . '.php'; ?>
        </div>
    </main>
</body>
</html>