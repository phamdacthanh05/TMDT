<?php
require __DIR__ . '/../../shared/bootstrap.php';
if (!is_logged_in()) redirect(APP_BASE . '/pages/auth/login.php');

$amount = isset($_GET['amount']) ? (int)$_GET['amount'] : 0;
if ($amount < 10000) {
    $_SESSION['flash_error'] = 'Số tiền nạp tối thiểu là 10.000đ.';
    redirect(APP_BASE . '/pages/deposit.php');
}

$bonus = 0;
if ($amount >= 500000) $bonus = (int)($amount * 0.10);
elseif ($amount >= 100000) $bonus = (int)($amount * 0.05);
$total = $amount + $bonus;
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cổng Thanh Toán VNPAY (Sandbox)</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f1f5f9; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
        .gateway-card { background: #fff; width: 100%; max-width: 450px; border-radius: 8px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); overflow: hidden; }
        .gateway-header { background: #0052cc; color: white; padding: 15px 20px; display: flex; justify-content: space-between; align-items: center; }
        .gateway-header img { height: 30px; }
        .gateway-body { padding: 24px; }
        .form-group { margin-bottom: 16px; }
        .form-group label { display: block; font-size: 0.85rem; color: #475569; margin-bottom: 6px; font-weight: 600; }
        .form-control { width: 100%; padding: 10px 12px; border: 1px solid #cbd5e1; border-radius: 6px; font-size: 0.95rem; outline: none; box-sizing: border-box; }
        .form-control:focus { border-color: #0052cc; }
        .row { display: flex; gap: 12px; }
        .row .form-group { flex: 1; }
        .total-box { background: #f8fafc; padding: 16px; border-radius: 8px; margin-bottom: 20px; border: 1px dashed #cbd5e1; }
        .total-row { display: flex; justify-content: space-between; margin-bottom: 8px; font-size: 0.95rem; color: #475569; }
        .total-row:last-child { margin-bottom: 0; border-top: 1px solid #e2e8f0; padding-top: 8px; font-size: 1.1rem; font-weight: bold; }
        .total-amount { color: #ef4444; }
        .btn-submit { width: 100%; padding: 14px; background: #0052cc; color: white; border: none; border-radius: 6px; font-size: 1rem; font-weight: 600; cursor: pointer; transition: 0.2s; }
        .btn-submit:hover { background: #003d99; }
        .test-info { background: #eff6ff; border: 1px solid #bfdbfe; color: #1e40af; padding: 12px; border-radius: 6px; font-size: 0.85rem; margin-bottom: 20px; }
        .test-info b { display: block; margin-bottom: 4px; }
    </style>
</head>
<body>
    <div class="gateway-card">
        <div class="gateway-header">
            <h2 style="margin:0; font-size:1.2rem;">VNPAY SANDBOX</h2>
            <span style="font-size:0.8rem; background:rgba(255,255,255,0.2); padding:4px 8px; border-radius:4px;">Môi trường Test</span>
        </div>
        
        <div class="gateway-body">
            <!-- Khung hiển thị thông tin thẻ test -->
            <div class="test-info">
                <b>💳 Thông tin thẻ Test (Vui lòng nhập đúng):</b>
                - Số thẻ: <b>9704 1234 5678 9012</b><br>
                - Tên chủ thẻ: <b>NGUYEN VAN A</b><br>
                - Ngày phát hành: <b>07/15</b> (hoặc bất kỳ)<br>
                - Mật khẩu OTP: <b>123456</b>
            </div>

            <!-- Form nhập thông tin thanh toán -->
            <form action="<?= APP_BASE ?>/pages/payment-callback.php" method="POST" id="paymentForm">
                <input type="hidden" name="amount" value="<?= $amount ?>">
                <input type="hidden" name="status" value="success">
                
                <div class="form-group">
                    <label>Số thẻ ATM</label>
                    <input type="text" name="card_number" class="form-control" placeholder="Nhập số thẻ..." required>
                </div>
                
                <div class="form-group">
                    <label>Tên chủ thẻ</label>
                    <input type="text" name="card_name" class="form-control" placeholder="VD: NGUYEN VAN A" required style="text-transform: uppercase;">
                </div>

                <div class="row">
                    <div class="form-group">
                        <label>Ngày phát hành</label>
                        <input type="text" name="card_date" class="form-control" placeholder="MM/YY" required>
                    </div>
                    <div class="form-group">
                        <label>Mã OTP</label>
                        <input type="text" name="otp" class="form-control" placeholder="Nhập 123456" required>
                    </div>
                </div>

                <div class="total-box">
                    <div class="total-row">
                        <span>Số tiền nạp:</span>
                        <span><?= money($amount) ?></span>
                    </div>
                    <div class="total-row">
                        <span>Tiền thưởng:</span>
                        <span style="color: #10b981;">+<?= money($bonus) ?></span>
                    </div>
                    <div class="total-row">
                        <span>Thực nhận:</span>
                        <span class="total-amount"><?= money($total) ?></span>
                    </div>
                </div>

                <button type="submit" class="btn-submit" id="btnSubmit">Xác nhận Thanh toán</button>
                <div style="text-align: center; margin-top: 12px;">
                    <a href="<?= APP_BASE ?>/pages/deposit.php" style="color: #64748b; font-size: 0.9rem; text-decoration: none;">Hủy giao dịch và quay lại</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Hiệu ứng loading giả lập khi bấm thanh toán
        document.getElementById('paymentForm').addEventListener('submit', function(e) {
            const btn = document.getElementById('btnSubmit');
            
            // Kiểm tra OTP (bắt buộc phải là 123456 để giả lập đúng)
            const otp = document.querySelector('input[name="otp"]').value;
            if (otp !== '123456') {
                e.preventDefault(); // Chặn không cho submit
                alert('Mã OTP không đúng! Vui lòng nhập 123456 (theo thông tin thẻ test).');
                return;
            }
            
            btn.innerHTML = 'Đang kết nối ngân hàng...';
            btn.style.opacity = '0.7';
            btn.style.pointerEvents = 'none';
        });
    </script>
</body>
</html>