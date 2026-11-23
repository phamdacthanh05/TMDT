<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= e($title ?? APP_NAME) ?></title>
    <!-- Google Fonts: Inter & Plus Jakarta Sans -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Plus+Jakarta+Sans:wght@600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<?= APP_BASE ?>/assets/css/style.css">
</head>
<body>
    <!-- Header Sticky & Navigation -->
    <?php require __DIR__ . '/../partials/header.php'; ?>
    
    <!-- Main Content Area -->
    <main class="site-main">
        <?php require __DIR__ . '/../' . $template . '.php'; ?>
    </main>
    
    <!-- Dark Theme Footer -->
    <?php require __DIR__ . '/../partials/footer.php'; ?>
    <?php require __DIR__ . '/../partials/confirm-modal.php'; ?>
</body>
</html>
