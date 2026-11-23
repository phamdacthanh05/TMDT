<?php
require __DIR__ . '/../shared/bootstrap-admin.php';
if (is_admin_logged_in()) redirect(ADMIN_BASE . '/index.php');

$error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    admin_csrf_check();
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';
    $stmt = $db->prepare("SELECT * FROM admins WHERE email = ?");
    $stmt->execute([$email]);
    $admin = $stmt->fetch();
    if ($admin && password_verify($password, $admin['password_hash'])) {
        $_SESSION['admin_id'] = $admin['id'];
        redirect(ADMIN_BASE . '/index.php');
    } else { $error = 'Sai email hoặc mật khẩu!'; }
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"><title>Đăng nhập Admin</title>
    <link rel="stylesheet" href="<?= ADMIN_BASE ?>/assets/css/admin.css">
    <style>body{display:flex;align-items:center;justify-content:center;background:#0f172a;}.login-box{background:#fff;padding:40px;border-radius:12px;width:100%;max-width:400px;}</style>
</head>
<body>
    <div class="login-box">
        <h2 style="text-align:center;margin-bottom:24px;color:#0f172a;">Hệ Thống Quản Trị</h2>
        <?php if ($error): ?><div style="color:red;margin-bottom:15px;text-align:center;"><?= $error ?></div><?php endif; ?>
        <form method="post">
            <?= admin_csrf_field() ?>
            <div class="form-group"><label>Email</label><input type="email" name="email" class="form-control" required placeholder="admin@shop.com"></div>
            <div class="form-group"><label>Mật khẩu</label><input type="password" name="password" class="form-control" required placeholder="••••••••"></div>
            <button type="submit" class="btn btn-primary" style="width:100%;">Đăng nhập</button>
        </form>
    </div>
</body>
</html>