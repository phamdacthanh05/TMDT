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
    } else { 
        $error = 'Email hoặc mật khẩu không chính xác. Vui lòng kiểm tra lại!'; 
    }
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập Quản trị viên - DigitalShop Admin</title>
    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        /* ==========================================================================
           CSS VARIABLES & RESET (SAAS STANDARDS)
           ========================================================================== */
        :root {
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --primary-glow: rgba(37, 99, 235, 0.15);
            --slate-950: #020617;
            --slate-900: #0f172a;
            --slate-800: #1e293b;
            --slate-700: #334155;
            --slate-600: #475569;
            --slate-500: #64748b;
            --slate-400: #94a3b8;
            --slate-300: #cbd5e1;
            --slate-200: #e2e8f0;
            --slate-100: #f1f5f9;
            --slate-50:  #f8fafc;
            --white:     #ffffff;
            
            --danger-bg: #fef2f2;
            --danger-border: #fecaca;
            --danger-text: #991b1b;
            
            --radius-md: 8px;
            --font-sans: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        *, *::before, *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        html, body {
            height: 100%;
            font-family: var(--font-sans);
            background-color: var(--slate-900);
            color: var(--slate-800);
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            line-height: 1.5;
        }

        /* ==========================================================================
           BỐ CỤC CHIA ĐÔI MÀN HÌNH (SPLIT-SCREEN)
           ========================================================================== */
        .split-layout {
            display: flex;
            min-height: 100vh;
            width: 100%;
        }

        /* Cột 1 (Trái): Form Đăng Nhập */
        .col-form {
            flex: 0 0 50%;
            max-width: 50%;
            background-color: var(--white);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 48px 40px;
            position: relative;
            z-index: 2;
        }

        .form-card {
            width: 100%;
            max-width: 420px;
            margin: 0 auto;
        }

        /* Header Form & Logo */
        .brand-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 28px;
        }

        .brand-logo-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, var(--primary) 0%, #1e40af 100%);
            border-radius: var(--radius-md);
            color: var(--white);
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 10px rgba(37, 99, 235, 0.25);
            flex-shrink: 0;
        }

        .brand-text-group {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .brand-name {
            font-size: 1.25rem;
            font-weight: 800;
            color: var(--slate-900);
            letter-spacing: -0.02em;
        }

        .brand-badge {
            font-size: 0.7rem;
            font-weight: 700;
            background: #eff6ff;
            color: var(--primary);
            padding: 2px 8px;
            border-radius: 9999px;
            border: 1px solid #dbeafe;
            letter-spacing: 0.05em;
        }

        .heading-group {
            margin-bottom: 28px;
        }

        .heading-title {
            font-size: 1.75rem;
            font-weight: 800;
            color: var(--slate-900);
            letter-spacing: -0.025em;
            margin-bottom: 6px;
        }

        .heading-desc {
            font-size: 0.925rem;
            color: var(--slate-500);
        }

        /* ==========================================================================
           THÔNG BÁO LỖI (ALERT PASTEL)
           ========================================================================== */
        .alert-error {
            background-color: var(--danger-bg);
            border: 1px solid var(--danger-border);
            color: var(--danger-text);
            border-radius: var(--radius-md);
            padding: 12px 16px;
            margin-bottom: 24px;
            font-size: 0.875rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
            animation: fadeIn 0.2s ease-in-out;
        }

        .alert-error svg {
            flex-shrink: 0;
            color: var(--danger-text);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-4px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* ==========================================================================
           INPUT WITH LEADING ICON (CHUẨN UI - TUYỆT ĐỐI KHÔNG ĐÈ CHỮ)
           ========================================================================== */
        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-size: 0.875rem;
            font-weight: 600;
            color: var(--slate-700);
        }

        /* Div bọc icon và input */
        .input-wrapper {
            position: relative;
            width: 100%;
        }

        /* Icon bên trái: canh giữa tuyệt đối, không nhận click (pointer-events: none) */
        .input-icon-leading {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
            pointer-events: none;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 2;
        }

        /* Thẻ input BẮT BUỘC padding-left: 42px để text không đè lên icon */
        .form-input {
            width: 100% !important;
            box-sizing: border-box !important;
            padding: 12px 16px 12px 42px !important;
            background-color: var(--white) !important;
            border: 1px solid var(--slate-300) !important;
            border-radius: var(--radius-md) !important;
            font-size: 0.95rem !important;
            color: var(--slate-900) !important;
            outline: none !important;
            transition: border-color 0.2s ease, box-shadow 0.2s ease !important;
            font-family: inherit !important;
            min-height: 44px;
        }

        .form-input::placeholder {
            color: #94a3b8;
        }

        /* Hiệu ứng focus: viền xanh, đổ bóng nhẹ */
        .form-input:focus {
            border-color: var(--primary) !important;
            box-shadow: 0 0 0 3px var(--primary-glow) !important;
        }

        /* Ô có nút con mắt: padding-right 42px */
        .form-input.has-trailing {
            padding-right: 42px !important;
        }

        /* Icon Con Mắt (Hiện/Ẩn mật khẩu) bên phải */
        .btn-toggle-eye {
            position: absolute;
            right: 14px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            background: none;
            border: none;
            padding: 0;
            color: #94a3b8;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 2;
            transition: color 0.15s ease;
        }

        .btn-toggle-eye:hover {
            color: var(--slate-700);
        }

        /* ==========================================================================
           NÚT SUBMIT ĐĂNG NHẬP
           ========================================================================== */
        .btn-submit {
            width: 100%;
            padding: 13px 20px;
            background-color: var(--primary);
            color: var(--white);
            border: none;
            border-radius: var(--radius-md);
            font-size: 0.95rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s ease, transform 0.15s ease, box-shadow 0.2s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            box-shadow: 0 2px 8px rgba(37, 99, 235, 0.25);
            margin-top: 10px;
            min-height: 44px;
        }

        .btn-submit:hover {
            background-color: var(--primary-hover);
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.35);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        /* Footer bảo mật nội bộ */
        .security-notice {
            margin-top: 28px;
            padding-top: 20px;
            border-top: 1px solid var(--slate-100);
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.78rem;
            color: var(--slate-400);
            line-height: 1.4;
        }

        .security-notice svg {
            flex-shrink: 0;
            color: var(--slate-400);
        }

        /* ==========================================================================
           CỘT 2 (PHẢI): ẢNH NỀN & OVERLAY TỐI (CYBER THEME)
           ========================================================================== */
        .col-visual {
            flex: 0 0 50%;
            max-width: 50%;
            background-color: var(--slate-900);
            background-image: url('<?= IMG_URL ?>/hero.jpg');
            background-size: cover;
            background-position: center;
            position: relative;
            display: flex;
            align-items: stretch;
        }

        .visual-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(135deg, rgba(15, 23, 42, 0.94) 0%, rgba(15, 23, 42, 0.78) 50%, rgba(30, 58, 138, 0.88) 100%);
            backdrop-filter: blur(3px);
            -webkit-backdrop-filter: blur(3px);
            padding: 60px 48px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            color: var(--white);
        }

        .visual-content {
            max-width: 480px;
        }

        .visual-tag {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(56, 189, 248, 0.15);
            border: 1px solid rgba(56, 189, 248, 0.3);
            padding: 4px 12px;
            border-radius: 9999px;
            font-size: 0.725rem;
            font-weight: 700;
            color: #38bdf8;
            margin-bottom: 20px;
            letter-spacing: 0.08em;
            text-transform: uppercase;
        }

        .visual-tag-dot {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background-color: #38bdf8;
        }

        .visual-title {
            font-size: 2.1rem;
            font-weight: 800;
            line-height: 1.25;
            margin-bottom: 14px;
            color: var(--white);
            letter-spacing: -0.025em;
        }

        .visual-slogan {
            font-size: 0.975rem;
            color: var(--slate-300);
            line-height: 1.6;
            margin-bottom: 32px;
        }

        .visual-features {
            display: flex;
            flex-direction: column;
            gap: 16px;
            margin-bottom: 36px;
        }

        .feature-row {
            display: flex;
            align-items: flex-start;
            gap: 12px;
        }

        .feature-badge {
            width: 22px;
            height: 22px;
            border-radius: 50%;
            background: rgba(37, 99, 235, 0.35);
            color: #60a5fa;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 800;
            flex-shrink: 0;
            margin-top: 2px;
        }

        .feature-info strong {
            display: block;
            font-size: 0.925rem;
            color: var(--white);
            margin-bottom: 2px;
        }

        .feature-info span {
            font-size: 0.825rem;
            color: var(--slate-400);
            line-height: 1.4;
        }

        .visual-copyright {
            font-size: 0.8rem;
            color: var(--slate-500);
            padding-top: 16px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        /* ==========================================================================
           RESPONSIVE DESIGN (DESKTOP / TABLET / MOBILE)
           ========================================================================== */
        /* Tablet (768px - 1024px) */
        @media (max-width: 1024px) and (min-width: 768px) {
            .col-form {
                padding: 36px 24px;
            }
            .visual-overlay {
                padding: 40px 32px;
            }
            .visual-title {
                font-size: 1.75rem;
            }
            .visual-slogan {
                display: none; /* Ẩn slogan để form gọn gàng trên tablet */
            }
            .visual-features {
                gap: 12px;
                margin-bottom: 24px;
            }
        }

        /* Mobile (< 768px): Ẩn cột ảnh, Form tràn 100%, Touch target >= 44px */
        @media (max-width: 767.98px) {
            .split-layout {
                flex-direction: column;
            }

            .col-visual {
                display: none !important; /* Ẩn hoàn toàn cột ảnh */
            }

            .col-form {
                flex: 0 0 100% !important;
                max-width: 100% !important;
                width: 100% !important;
                padding: 32px 20px;
                min-height: 100vh;
            }

            .form-card {
                max-width: 100%;
            }

            .heading-title {
                font-size: 1.5rem;
            }

            /* Touch target thoải mái cho điện thoại */
            .form-input {
                min-height: 48px !important;
                font-size: 1rem !important;
            }

            .btn-submit {
                min-height: 48px;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="split-layout">
        <!-- CỘT 1 (TRÁI): FORM ĐĂNG NHẬP -->
        <div class="col-form">
            <div class="form-card">
                <!-- Brand Logo & Header -->
                <div class="brand-header">
                    <div class="brand-logo-icon">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                        </svg>
                    </div>
                    <div class="brand-text-group">
                        <span class="brand-name">DigitalShop</span>
                        <span class="brand-badge">ADMIN</span>
                    </div>
                </div>

                <!-- Tiêu đề & Lời chào -->
                <div class="heading-group">
                    <h1 class="heading-title">Chào mừng trở lại</h1>
                    <p class="heading-desc">Vui lòng nhập thông tin xác thực để truy cập bảng điều khiển.</p>
                </div>

                <!-- Thông báo lỗi (Alert Box) -->
                <?php if (!empty($error)): ?>
                    <div class="alert-error" role="alert">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10"></circle>
                            <line x1="12" y1="8" x2="12" y2="12"></line>
                            <line x1="12" y1="16" x2="12.01" y2="16"></line>
                        </svg>
                        <span><?= e($error) ?></span>
                    </div>
                <?php endif; ?>

                <!-- Form đăng nhập -->
                <form method="post" action="" autocomplete="off">
                    <?= admin_csrf_field() ?>

                    <!-- Ô Email (Icon User Leading) -->
                    <div class="form-group">
                        <label for="email" class="form-label">Tài khoản Email</label>
                        <div class="input-wrapper">
                            <span class="input-icon-leading">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="12" cy="7" r="4"></circle>
                                </svg>
                            </span>
                            <input type="email" id="email" name="email" class="form-input" placeholder="admin@shop.com" required autofocus value="<?= e($_POST['email'] ?? '') ?>">
                        </div>
                    </div>

                    <!-- Ô Mật khẩu (Icon Khóa Leading & Icon Con Mắt Trailing) -->
                    <div class="form-group">
                        <label for="password" class="form-label">Mật khẩu bảo mật</label>
                        <div class="input-wrapper">
                            <span class="input-icon-leading">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                    <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                </svg>
                            </span>
                            <input type="password" id="password" name="password" class="form-input has-trailing" placeholder="••••••••" required>
                            
                            <!-- Nút con mắt Hiện/Ẩn mật khẩu -->
                            <button type="button" class="btn-toggle-eye" id="togglePasswordBtn" aria-label="Hiện/Ẩn mật khẩu" title="Hiện/Ẩn mật khẩu">
                                <!-- Mắt mở -->
                                <svg id="eyeOpenIcon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                    <circle cx="12" cy="12" r="3"></circle>
                                </svg>
                                <!-- Mắt gạch chéo -->
                                <svg id="eyeCloseIcon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display: none;">
                                    <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
                                    <line x1="1" y1="1" x2="23" y2="23"></line>
                                </svg>
                            </button>
                        </div>
                    </div>

                    <!-- Nút Submit Đăng nhập -->
                    <button type="submit" class="btn-submit">
                        <span>Đăng nhập hệ thống</span>
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                            <polyline points="12 5 19 12 12 19"></polyline>
                        </svg>
                    </button>
                </form>

                <!-- Cảnh báo bảo mật nội bộ -->
                <div class="security-notice">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                    </svg>
                    <span>Khu vực truy cập bảo mật nội bộ. Mọi hoạt động đăng nhập đều được ghi nhận IP và giám sát.</span>
                </div>
            </div>
        </div>

        <!-- CỘT 2 (PHẢI): ẢNH NỀN VÀ SLOGAN (CYBER D2C) -->
        <div class="col-visual">
            <div class="visual-overlay">
                <div class="visual-content">
                    <div class="visual-tag">
                        <span class="visual-tag-dot"></span>
                        <span>Enterprise Control Panel</span>
                    </div>

                    <h2 class="visual-title">Hệ Thống Quản Trị Tài Nguyên Số D2C</h2>
                    
                    <p class="visual-slogan">
                        Bảng điều khiển tập trung giúp quản lý kho mã nguồn, phân quyền tài khoản tự động, kiểm soát doanh thu và xử lý khiếu nại tức thì.
                    </p>

                    <div class="visual-features">
                        <div class="feature-row">
                            <div class="feature-badge">✓</div>
                            <div class="feature-info">
                                <strong>Bảo mật phân quyền khép kín</strong>
                                <span>Phiên xác thực quản trị tách biệt độc lập với người dùng.</span>
                            </div>
                        </div>
                        <div class="feature-row">
                            <div class="feature-badge">✓</div>
                            <div class="feature-info">
                                <strong>Cấp phát kho hàng tự động</strong>
                                <span>Tự động gửi link tải, tài khoản/key ngay sau thanh toán.</span>
                            </div>
                        </div>
                        <div class="feature-row">
                            <div class="feature-badge">✓</div>
                            <div class="feature-info">
                                <strong>Báo cáo doanh thu chuẩn xác</strong>
                                <span>Theo dõi sát sao từng giao dịch và biến động số dư ví khách.</span>
                            </div>
                        </div>
                    </div>

                    <div class="visual-copyright">
                        DigitalShop Enterprise © <?= date('Y') ?>. All rights reserved.
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JAVASCRIPT THUẦN XỬ LÝ ẨN / HIỆN MẬT KHẨU -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const toggleBtn = document.getElementById('togglePasswordBtn');
            const pwdInput = document.getElementById('password');
            const eyeOpen = document.getElementById('eyeOpenIcon');
            const eyeClose = document.getElementById('eyeCloseIcon');

            if (toggleBtn && pwdInput) {
                toggleBtn.addEventListener('click', function(e) {
                    e.preventDefault();
                    if (pwdInput.type === 'password') {
                        pwdInput.type = 'text';
                        eyeOpen.style.display = 'none';
                        eyeClose.style.display = 'block';
                    } else {
                        pwdInput.type = 'password';
                        eyeOpen.style.display = 'block';
                        eyeClose.style.display = 'none';
                    }
                    pwdInput.focus();
                });
            }
        });
    </script>
</body>
</html>
