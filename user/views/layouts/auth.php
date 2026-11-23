<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= e($title ?? APP_NAME) ?></title>
    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<?= APP_BASE ?>/assets/css/style.css">
</head>
<body class="auth-body">
    
    <!-- Nút quay về trang chủ -->
    <a href="<?= APP_BASE ?>/index.php" class="auth-back">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <line x1="19" y1="12" x2="5" y2="12"></line>
            <polyline points="12 19 5 12 12 5"></polyline>
        </svg>
        <span>Về trang chủ</span>
    </a>

    <div class="auth-wrapper">
        <!-- Nhúng form đăng nhập / đăng ký -->
        <?php require __DIR__ . '/../' . $template . '.php'; ?>
    </div>

</body>
</html>
