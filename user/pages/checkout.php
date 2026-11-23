<?php
require __DIR__ . '/../../shared/bootstrap.php';
if (!is_logged_in()) redirect(APP_BASE . '/pages/auth/login.php');

$user_id = $_SESSION['user_id'];
$product_id = isset($_GET['id']) ? (int)$_GET['id'] : (isset($_POST['product_id']) ? (int)$_POST['product_id'] : 0);

// Lấy thông tin sản phẩm
$stmt = $db->prepare("SELECT * FROM products WHERE id = ? AND status = 'active'");
$stmt->execute([$product_id]);
$product = $stmt->fetch();
if (!$product) {
    $_SESSION['flash_error'] = 'Sản phẩm không tồn tại.';
    redirect(APP_BASE . '/pages/products.php');
}

// Lấy thông tin user
$stmt = $db->prepare("SELECT * FROM users WHERE id = ?");
$stmt->execute([$user_id]);
$user = $stmt->fetch();

$original_price = $product['sale_price'] ?: $product['price'];
$discount_amount = 0;
$final_price = $original_price;
$coupon_code = '';
$coupon_id = null;
$coupon_error = '';

// XỬ LÝ KHI BẤM NÚT "ÁP DỤNG" MÃ GIẢM GIÁ
if (isset($_POST['action']) && $_POST['action'] === 'apply_coupon') {
    $coupon_code = strtoupper(trim($_POST['coupon_code'] ?? ''));
    
    if ($coupon_code !== '') {
        $stmt = $db->prepare("SELECT * FROM coupons WHERE code = ? AND status = 'active'");
        $stmt->execute([$coupon_code]);
        $coupon = $stmt->fetch();

        if (!$coupon) {
            $coupon_error = 'Mã giảm giá không tồn tại hoặc đã bị khóa.';
        } elseif ($coupon['expires_at'] && strtotime($coupon['expires_at']) < time()) {
            $coupon_error = 'Mã giảm giá đã hết hạn.';
        } elseif ($coupon['usage_limit'] > 0 && $coupon['used_count'] >= $coupon['usage_limit']) {
            $coupon_error = 'Mã giảm giá đã hết lượt sử dụng.';
        } elseif ($original_price < $coupon['min_order_value']) {
            $coupon_error = 'Đơn hàng chưa đạt giá trị tối thiểu ' . money($coupon['min_order_value']) . ' để dùng mã này.';
        } else {
            // Mã hợp lệ, tính tiền giảm
            if ($coupon['discount_type'] == 'percent') {
                $discount_amount = ($original_price * $coupon['discount_value']) / 100;
            } else {
                $discount_amount = $coupon['discount_value'];
            }
            if ($discount_amount > $original_price) $discount_amount = $original_price;
            $final_price = $original_price - $discount_amount;
            $coupon_id = $coupon['id'];
        }
    }
}

// XỬ LÝ KHI BẤM NÚT "XÁC NHẬN ĐẶT HÀNG"
if (isset($_POST['action']) && $_POST['action'] === 'place_order') {
    csrf_check();
    $coupon_code = strtoupper(trim($_POST['coupon_code'] ?? ''));

    $db->beginTransaction();
    try {
        // Khóa sản phẩm
        $stmt = $db->prepare("SELECT * FROM products WHERE id = ? AND status = 'active' FOR UPDATE");
        $stmt->execute([$product_id]);
        $product = $stmt->fetch();
        if (!$product) throw new Exception('Sản phẩm không tồn tại.');

        $original_price = $product['sale_price'] ?: $product['price'];
        $discount_amount = 0;
        $final_price = $original_price;
        $coupon_id = null;

        // Kiểm tra lại mã giảm giá lần cuối (để bảo mật)
        if ($coupon_code !== '') {
            $stmt = $db->prepare("SELECT * FROM coupons WHERE code = ? AND status = 'active' FOR UPDATE");
            $stmt->execute([$coupon_code]);
            $coupon = $stmt->fetch();

            if ($coupon && (!$coupon['expires_at'] || strtotime($coupon['expires_at']) >= time()) && ($coupon['usage_limit'] == 0 || $coupon['used_count'] < $coupon['usage_limit']) && $original_price >= $coupon['min_order_value']) {
                if ($coupon['discount_type'] == 'percent') {
                    $discount_amount = ($original_price * $coupon['discount_value']) / 100;
                } else {
                    $discount_amount = $coupon['discount_value'];
                }
                if ($discount_amount > $original_price) $discount_amount = $original_price;
                $final_price = $original_price - $discount_amount;
                $coupon_id = $coupon['id'];

                $db->prepare("UPDATE coupons SET used_count = used_count + 1 WHERE id = ?")->execute([$coupon_id]);
            } else {
                throw new Exception('Mã giảm giá không còn hợp lệ.');
            }
        }

        // Kiểm tra số dư
        $stmt = $db->prepare("SELECT balance FROM users WHERE id = ? FOR UPDATE");
        $stmt->execute([$user_id]);
        $user_balance = (int)$stmt->fetchColumn();
        if ($user_balance < $final_price) throw new Exception('Số dư ví không đủ để thanh toán.');

        // Kiểm tra kho
        $account_data = null;
        $stock_id = null;
        if ($product['product_type'] === 'account') {
            $stmt = $db->prepare("SELECT id, account_data FROM product_stocks WHERE product_id = ? AND status = 'available' LIMIT 1 FOR UPDATE");
            $stmt->execute([$product_id]);
            $stock = $stmt->fetch();
            if (!$stock) throw new Exception('Sản phẩm này hiện đã hết hàng trong kho.');
            $stock_id = $stock['id'];
            $account_data = $stock['account_data'];
        }

        // Trừ tiền và tạo đơn
        $db->prepare("UPDATE users SET balance = balance - ? WHERE id = ?")->execute([$final_price, $user_id]);
        $db->prepare("INSERT INTO orders (user_id, total_amount, status, payment_method, coupon_id, created_at) VALUES (?, ?, 'completed', 'wallet', ?, NOW())")->execute([$user_id, $final_price, $coupon_id]);
        $order_id = $db->lastInsertId();

        $db->prepare("INSERT INTO order_items (order_id, product_id, price, quantity, account_data) VALUES (?, ?, ?, 1, ?)")->execute([$order_id, $product_id, $final_price, $account_data]);

        if ($stock_id) {
            $db->prepare("UPDATE product_stocks SET status = 'sold', user_id = ?, sold_at = NOW() WHERE id = ?")->execute([$user_id, $stock_id]);
        }
        $db->prepare("UPDATE products SET sold_count = sold_count + 1 WHERE id = ?")->execute([$product_id]);
        $db->prepare("INSERT INTO notifications (user_id, title, message) VALUES (1, 'Đơn hàng mới', 'Khách hàng vừa thanh toán đơn hàng #$order_id')")->execute();

        $db->commit();
        $_SESSION['flash_success'] = 'Thanh toán thành công!';
        redirect(APP_BASE . '/pages/my-orders.php');

    } catch (Exception $e) {
        $db->rollBack();
        $_SESSION['flash_error'] = $e->getMessage();
        redirect(APP_BASE . '/pages/checkout.php?id=' . $product_id);
    }
}

// Truyền dữ liệu sang view
view('checkout', [
    'title' => 'Thanh toán đơn hàng',
    'product' => $product,
    'user' => $user,
    'original_price' => $original_price,
    'discount_amount' => $discount_amount,
    'final_price' => $final_price,
    'coupon_code' => $coupon_code,
    'coupon_error' => $coupon_error
]);