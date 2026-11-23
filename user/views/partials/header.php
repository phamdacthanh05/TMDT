<?php
$isLoggedIn = is_logged_in();
$u = $isLoggedIn ? current_user() : null;
// Lấy tên file hiện tại để làm nổi bật (highlight) menu đang chọn
$current_page = basename($_SERVER['PHP_SELF']); 
?>
<header class="header">
    <div class="container">
        <div class="header-inner">
            <!-- Logo Thương hiệu -->
            <a href="<?= APP_BASE ?>/index.php" class="logo">
                <div class="logo-icon">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <polyline points="16 18 22 12 16 6"></polyline>
                        <polyline points="8 6 2 12 8 18"></polyline>
                    </svg>
                </div>
                <span>DigitalShop</span>
            </a>

            <!-- Checkbox toggle và Icon Hamburger trên Mobile -->
            <input type="checkbox" id="nav-toggle-check">
            <label for="nav-toggle-check" class="mobile-nav-toggle" aria-label="Toggle navigation">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="3" y1="12" x2="21" y2="12"></line>
                    <line x1="3" y1="6" x2="21" y2="6"></line>
                    <line x1="3" y1="18" x2="21" y2="18"></line>
                </svg>
            </label>

            <!-- Menu Điều Hướng -->
            <ul class="nav-links">
                <li><a href="<?= APP_BASE ?>/index.php" class="nav-link <?= ($current_page == 'index.php') ? 'active' : '' ?>">Trang chủ</a></li>
                <li><a href="<?= APP_BASE ?>/pages/products.php" class="nav-link <?= ($current_page == 'products.php' || $current_page == 'product-detail.php') ? 'active' : '' ?>">Sản phẩm số</a></li>
                <li><a href="<?= APP_BASE ?>/pages/promotions.php" class="nav-link">Đặc quyền D2C</a></li>
                <li><a href="#support" class="nav-link">Hỗ trợ</a></li>
            </ul>

            <!-- Khu vực User / Xác thực -->
            <div class="header-actions">
                <?php if ($isLoggedIn && $u): ?>
                    <!-- Badge Số Dư Ví (Bấm vào để nạp tiền) -->
                    <a href="<?= APP_BASE ?>/pages/deposit.php" class="wallet-badge" title="Bấm để nạp thêm tiền" style="text-decoration: none; cursor: pointer;">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="2" y="4" width="20" height="16" rx="2"></rect>
                            <path d="M16 10h4a2 2 0 0 1 2 2v2a2 2 0 0 1-2 2h-4"></path>
                            <circle cx="18" cy="13" r="1" fill="currentColor"></circle>
                        </svg>
                        <span><?= money($u['balance']) ?></span>
                        <span style="font-size: 1.2rem; font-weight: bold; margin-left: 4px;">+</span>
                    </a>

                    <!-- CHUÔNG THÔNG BÁO -->
                    <div class="notification-wrapper" style="position: relative; display: flex; align-items: center; margin-right: 10px;">
                        <button id="notif-bell" style="background: none; border: none; cursor: pointer; position: relative; color: var(--slate-600); padding: 5px;">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
                                <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                            </svg>
                            <span id="notif-count" style="display: none; position: absolute; top: 0; right: 0; background: #ef4444; color: white; border-radius: 50%; padding: 2px 5px; font-size: 10px; font-weight: bold; transform: translate(50%, -50%);">0</span>
                        </button>

                        <!-- Dropdown thông báo -->
                        <div id="notif-dropdown" style="display: none; position: absolute; top: 100%; right: 0; width: 320px; background: #fff; box-shadow: 0 10px 25px rgba(0,0,0,0.1); border-radius: 8px; border: 1px solid #e2e8f0; z-index: 1000; margin-top: 15px;">
                            <div style="padding: 12px 16px; border-bottom: 1px solid #e2e8f0; font-weight: 700; color: #0f172a; font-size: 0.95rem;">Thông báo của bạn</div>
                            <div id="notif-list" style="max-height: 300px; overflow-y: auto;">
                                <!-- Nội dung thông báo sẽ được JS đổ vào đây -->
                            </div>
                        </div>
                    </div>

                    <!-- Dropdown Cá Nhân Người Dùng -->
                    <div class="user-dropdown">
                        <div class="user-trigger" tabindex="0">
                            <div class="user-avatar-placeholder">
                                <?= mb_strtoupper(mb_substr($u['name'] ?? 'U', 0, 1, 'UTF-8')) ?>
                            </div>
                            <span><?= e($u['name']) ?></span>
                            <svg class="dropdown-arrow" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="6 9 12 15 18 9"></polyline>
                            </svg>
                        </div>
                        
                        <!-- Menu Thả Xuống -->
                        <div class="dropdown-menu">
                            <div class="dropdown-header">
                                <div class="user-name"><?= e($u['name']) ?></div>
                                <div class="user-email"><?= e($u['email']) ?></div>
                            </div>
                            
                            <a href="<?= APP_BASE ?>/pages/auth/profile.php" class="dropdown-item">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="12" cy="7" r="4"></circle>
                                </svg>
                                <span>Trang cá nhân</span>
                            </a>
                            
                            <a href="<?= APP_BASE ?>/pages/my-orders.php" class="dropdown-item">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
                                    <line x1="3" y1="6" x2="21" y2="6"></line>
                                    <path d="M16 10a4 4 0 0 1-8 0"></path>
                                </svg>
                                <span>Lịch sử mua hàng</span>
                            </a>

                            <!-- LINK TRUNG TÂM HỖ TRỢ MỚI THÊM -->
                            <a href="<?= APP_BASE ?>/pages/support-list.php" class="dropdown-item">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                                    <line x1="12" y1="17" x2="12.01" y2="17"></line>
                                </svg>
                                <span>Trung tâm hỗ trợ</span>
                            </a>

                            <a href="<?= APP_BASE ?>/pages/auth/change-password.php" class="dropdown-item">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                    <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                </svg>
                                <span>Đổi mật khẩu</span>
                            </a>
                            
                            <div class="dropdown-divider"></div>
                            
                            <a href="<?= APP_BASE ?>/pages/auth/logout.php" class="dropdown-item logout">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                    <polyline points="16 17 21 12 16 7"></polyline>
                                    <line x1="21" y1="12" x2="9" y2="12"></line>
                                </svg>
                                <span>Đăng xuất</span>
                            </a>
                        </div>
                    </div>
                <?php else: ?>
                    <a href="<?= APP_BASE ?>/pages/auth/login.php" class="btn btn-outline btn-sm">Đăng nhập</a>
                    <a href="<?= APP_BASE ?>/pages/auth/register.php" class="btn btn-primary btn-sm">Đăng ký</a>
                <?php endif; ?>
            </div>
        </div>
    </div>
</header>

<!-- SCRIPT XỬ LÝ REAL-TIME THÔNG BÁO -->
<?php if ($isLoggedIn): ?>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const bell = document.getElementById('notif-bell');
    const dropdown = document.getElementById('notif-dropdown');
    const countBadge = document.getElementById('notif-count');
    const notifList = document.getElementById('notif-list');

    function fetchNotifications() {
        // Gọi API lấy thông báo
        fetch('<?= APP_BASE ?>/api/get-notifications.php')
            .then(res => res.json())
            .then(data => {
                if (data.count > 0) {
                    countBadge.textContent = data.count;
                    countBadge.style.display = 'inline-block';
                } else {
                    countBadge.style.display = 'none';
                }

                if (data.notifications.length === 0) {
                    notifList.innerHTML = '<div style="padding: 20px; text-align: center; color: #64748b; font-size: 14px;">Không có thông báo nào</div>';
                } else {
                    let html = '';
                    data.notifications.forEach(n => {
                        const isRead = n.is_read == 1 ? 'opacity: 0.7;' : 'background: #eff6ff;';
                        html += `
                        <div style="padding: 12px 16px; border-bottom: 1px solid #e2e8f0; ${isRead} transition: 0.2s;">
                            <div style="font-weight: 600; font-size: 14px; color: #0f172a;">${n.title}</div>
                            <div style="font-size: 13px; color: #475569; margin-top: 4px; line-height: 1.4;">${n.message}</div>
                            <div style="font-size: 11px; color: #94a3b8; margin-top: 6px;">${n.created_at}</div>
                        </div>`;
                    });
                    notifList.innerHTML = html;
                }
            }).catch(err => console.log('Lỗi tải thông báo', err));
    }

    // Gọi lần đầu khi tải trang
    fetchNotifications();

    // Cứ mỗi 10 giây tự động gọi lại 1 lần (Real-time Polling)
    setInterval(fetchNotifications, 10000);

    // Bật/tắt Dropdown
    bell.addEventListener('click', function(e) {
        e.stopPropagation();
        if (dropdown.style.display === 'none') {
            dropdown.style.display = 'block';
            // Đánh dấu đã đọc khi mở ra
            fetch('<?= APP_BASE ?>/api/mark-read.php').then(() => {
                countBadge.style.display = 'none';
            });
        } else {
            dropdown.style.display = 'none';
        }
    });

    // Bấm ra ngoài thì đóng dropdown
    document.addEventListener('click', function(e) {
        if (!dropdown.contains(e.target) && e.target !== bell && !bell.contains(e.target)) {
            dropdown.style.display = 'none';
        }
    });
});
</script>
<?php endif; ?>