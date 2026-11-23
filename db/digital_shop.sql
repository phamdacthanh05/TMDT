-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 23, 2026 lúc 12:06 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `auth_demo`
--
CREATE DATABASE IF NOT EXISTS `auth_demo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `auth_demo`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `my_courses`
--

CREATE TABLE `my_courses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `password_hash`, `avatar`) VALUES
(6, 'thanh', 'dokok49767@mobilesm.com', '$2y$10$1kjxIVdUwZLAq8v/ZZwSHuW5CVFKC6dVMRGzVrm7k/6Uh3sPQdMuO', '$2y$10$/lf5mavWPindPbwxqSkH9u373/3wG6IRmiNVkYm3M9yYwzkN1vUk6', 'uploads/avatar_6_1758351314.png'),
(7, 'Thanh', 'thanhgpt@gmail.com', '', '$2y$10$6FReO.k0DNuz5cU4AU25I.IF5xyWmuDqjCY8BmWaSkts0m2GjkKJC', NULL),
(8, 'em thanh dai de', 'thanh123@gmail.com', '', '$2y$10$gjOwM3vHo9KpwxJAoiLPF.V1Cn5CkNc.4PzeEYEb80Q77.kECNwve', NULL),
(10, 'Phạm Thanh', 'dokok49767@mobilesm.com2', '', '$2y$10$TaiqFLEyp0SAv5Y614iwMuF87iZy2FqLcqLOUrc/vfqQwEZ37DmuK', NULL),
(11, 'uyeen', 'dthanh123@gmail.com', '', '$2y$10$lbj88f58odd017NsbYfjg.lsqEnN3UeIG6S5DYOktDBNpv6WSroIS', 'uploads/avatar_11_1766047550.jpg'),
(12, 'Thanh', 'dacthanh123@gmail.com', '', '$2y$10$K8cKc4diOBw64qsmKvB7Out3VBTwkrnRJOzEnQCvVqhECBm03EEuO', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_courses`
--

CREATE TABLE `user_courses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_courses`
--

INSERT INTO `user_courses` (`id`, `user_id`, `course_name`, `file_path`, `created_at`) VALUES
(13, 6, '1', 'uploads/1758454680_1.jpg', '2025-09-21 11:38:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `my_courses`
--
ALTER TABLE `my_courses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `user_courses`
--
ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `my_courses`
--
ALTER TABLE `my_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `user_courses`
--
ALTER TABLE `user_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Cơ sở dữ liệu: `dichvusotudong`
--
CREATE DATABASE IF NOT EXISTS `dichvusotudong` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dichvusotudong`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text DEFAULT NULL,
  `platform` varchar(50) DEFAULT 'Tiktok',
  `price_changes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`price_changes`)),
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `content`, `platform`, `price_changes`, `is_active`, `created_by`, `created_at`) VALUES
(1, '🎉 Chào mừng thành viên mới!', 'Tặng ngay 100 xu cho tài khoản mới đăng ký hôm nay', 'TDS', NULL, 1, 1, '2026-06-09 02:07:17'),
(2, 'Cập nhật giá TikTok', 'Điều chỉnh giá dịch vụ follow', 'Tiktok', '{\"changes\":[\"Tăng giá mua tiktok_follow từ 1100xu -> 1500xu\",\"Tăng giá nhận xu từ 1000xu -> 1400xu\"]}', 1, 1, '2026-06-09 02:07:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `platform` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `target_id` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `remains` int(11) NOT NULL,
  `price_per_unit` int(11) NOT NULL,
  `status` varchar(20) DEFAULT 'running',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `campaigns`
--

INSERT INTO `campaigns` (`id`, `user_id`, `platform`, `type`, `target_id`, `quantity`, `remains`, `price_per_unit`, `status`, `created_at`) VALUES
(1, 5, 'tiktok', 'FOLLOW', 'https:/www.tiktok.com/@em.thanh.i2', 50, 50, 1000, 'running', '2026-07-02 06:42:03'),
(2, 5, 'tiktok', 'FOLLOW', 'https:/www.tiktok.com/@em.thanh.i2', 50, 50, 1000, 'running', '2026-07-02 06:59:42'),
(3, 5, 'tiktok', 'FOLLOW', 'https://www.tiktok.com/@vietquang216216', 30, 30, 1000, 'running', '2026-07-13 02:43:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `campaign_completions`
--

CREATE TABLE `campaign_completions` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `xu_earned` int(11) NOT NULL DEFAULT 0,
  `completed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `announcement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `username`, `content`, `created_at`, `announcement_id`) VALUES
(1, 5, 'user01', '.', '2026-06-11 03:03:11', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tiktok_followers_cache`
--

CREATE TABLE `tiktok_followers_cache` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `synced_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tiktok_followers_cache`
--

INSERT INTO `tiktok_followers_cache` (`id`, `username`, `synced_at`) VALUES
(1, 'em.thanh.i2', '2026-07-07 09:26:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `type` enum('task_reward','gift','purchase','admin_add','daily_bonus') DEFAULT 'task_reward',
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `type`, `description`, `created_at`) VALUES
(2, 6, 100, 'daily_bonus', 'Thưởng đăng ký tài khoản mới', '2026-07-02 07:01:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `xu_balance` int(11) DEFAULT 100,
  `money_balance` int(11) NOT NULL DEFAULT 0,
  `frozen_balance` bigint(20) DEFAULT 0,
  `avatar` varchar(255) DEFAULT NULL,
  `total_jobs` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `fullname`, `role`, `xu_balance`, `money_balance`, `frozen_balance`, `avatar`, `total_jobs`, `created_at`, `last_login`) VALUES
(1, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'thanh@admin.com', 'Administrator', 'admin', 1000000, 0, 0, NULL, 0, '2026-06-09 02:07:17', NULL),
(2, '10a3i', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user1@example.com', 'Nguyễn Văn A', 'user', 194320, 0, 0, NULL, 152, '2026-06-09 02:07:17', NULL),
(3, 'Halal123', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user2@example.com', 'Trần Thị B', 'user', 171900, 0, 0, NULL, 128, '2026-06-09 02:07:17', NULL),
(4, 'halal', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user3@example.com', 'Lê Văn C', 'user', 167830, 0, 0, NULL, 110, '2026-06-09 02:07:17', NULL),
(5, 'user01', '$2y$10$OuHg1TJmoyP3e3YWqA195.3OzonQO0CpVRSN19It2OTe3nkRkVQ/S', 'thanhtest01@gmail.com', 'Phạm Đắc Thanh', 'user', 9870000, 100000, 0, NULL, 0, '2026-06-09 02:08:48', '2026-07-13 02:07:28'),
(6, 'user02', '$2y$10$8L2aHDOx8WN1aeZ1zHXoYO98NMDNz2qniDnxCs1tGwj4/ns57Awti', 'thanhtest02@gmail.com', 'Đại Đế', 'user', 100, 0, 0, NULL, 0, '2026-07-02 07:01:31', '2026-07-13 02:31:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_social_accounts`
--

CREATE TABLE `user_social_accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `platform` enum('facebook','tiktok') NOT NULL,
  `account_id` varchar(100) NOT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `status` enum('active','pending') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_checked_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_social_accounts`
--

INSERT INTO `user_social_accounts` (`id`, `user_id`, `platform`, `account_id`, `is_public`, `status`, `created_at`, `last_checked_at`, `updated_at`) VALUES
(5, 5, 'facebook', '100077333093672', NULL, 'active', '2026-07-07 08:56:45', '2026-07-07 08:56:45', '2026-07-07 08:56:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_social_account_history`
--

CREATE TABLE `user_social_account_history` (
  `id` int(11) NOT NULL,
  `account_row_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` enum('select','deselect','create','reject') NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_social_account_history`
--

INSERT INTO `user_social_account_history` (`id`, `account_row_id`, `user_id`, `action`, `note`, `created_at`) VALUES
(1, 5, 5, 'create', 'Cấu hình mới nền tảng facebook', '2026-07-07 08:56:45');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `campaign_completions`
--
ALTER TABLE `campaign_completions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_campaign_user` (`campaign_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_comment_announcement` (`announcement_id`);

--
-- Chỉ mục cho bảng `tiktok_followers_cache`
--
ALTER TABLE `tiktok_followers_cache`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `user_social_accounts`
--
ALTER TABLE `user_social_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_social_account_history`
--
ALTER TABLE `user_social_account_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_row_id` (`account_row_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `campaign_completions`
--
ALTER TABLE `campaign_completions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tiktok_followers_cache`
--
ALTER TABLE `tiktok_followers_cache`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `user_social_accounts`
--
ALTER TABLE `user_social_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `user_social_account_history`
--
ALTER TABLE `user_social_account_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `campaign_completions`
--
ALTER TABLE `campaign_completions`
  ADD CONSTRAINT `campaign_completions_ibfk_1` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `campaign_completions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_comment_announcement` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_social_account_history`
--
ALTER TABLE `user_social_account_history`
  ADD CONSTRAINT `user_social_account_history_ibfk_1` FOREIGN KEY (`account_row_id`) REFERENCES `user_social_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_social_account_history_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Cơ sở dữ liệu: `digital_shop`
--
CREATE DATABASE IF NOT EXISTS `digital_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `digital_shop`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'super_admin',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password_hash`, `role`, `created_at`) VALUES
(1, 'Super Admin', 'admin@shop.com', '$2y$10$EjmmGmW9K/9LerXNElPJ..qq5hkwRei7np6FDJN7SxUyhmi84348q', 'super_admin', '2026-11-22 17:32:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `discount_type` enum('percent','fixed') NOT NULL DEFAULT 'percent',
  `discount_value` bigint(20) NOT NULL,
  `min_order_value` bigint(20) DEFAULT 0,
  `usage_limit` int(11) DEFAULT 0,
  `used_count` int(11) DEFAULT 0,
  `expires_at` datetime DEFAULT NULL,
  `status` enum('active','hidden') DEFAULT 'active',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount_type`, `discount_value`, `min_order_value`, `usage_limit`, `used_count`, `expires_at`, `status`, `created_at`) VALUES
(1, 'SALENGUOIMOI', 'percent', 20, 500000, 5, 0, '2026-11-30 16:50:00', 'active', '2026-11-23 16:50:24'),
(2, 'SALE20', 'percent', 10, 50000, 500000, 2, '2026-11-24 17:05:00', 'active', '2026-11-23 17:06:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `amount` bigint(20) NOT NULL,
  `bonus` bigint(20) NOT NULL DEFAULT 0,
  `status` enum('pending','completed','rejected') DEFAULT 'completed',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `amount`, `bonus`, `status`, `created_at`) VALUES
(1, 1, 100000, 5000, 'completed', '2026-11-23 13:45:48'),
(2, 1, 5000000, 500000, 'completed', '2026-11-23 16:12:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `is_read`, `created_at`) VALUES
(1, 1, 'Cập nhật đơn hàng', 'Đơn hàng #2 của bạn đang chờ xử lý', 1, '2026-11-23 12:53:45'),
(2, 1, 'Cập nhật đơn hàng', 'Đơn hàng #2 của bạn đã hoàn thành (Hàng đã được giao)', 1, '2026-11-23 12:53:55'),
(3, 1, 'Đơn hàng mới', 'Khách hàng vừa thanh toán đơn hàng #3', 1, '2026-11-23 13:06:29'),
(4, 1, 'Nạp tiền thành công', 'Nạp thành công 100.000đ qua VNPay (Thưởng: 5.000đ). Số dư được cộng: 105.000đ.', 1, '2026-11-23 13:45:48'),
(5, 1, 'Yêu cầu hỗ trợ mới', 'Khách hàng vừa tạo yêu cầu: Tài khoản bị lỗi không đăng nhập được', 1, '2026-11-23 13:58:50'),
(6, 1, 'Phản hồi hỗ trợ mới', 'Admin vừa trả lời yêu cầu hỗ trợ #1 của bạn.', 1, '2026-11-23 13:59:23'),
(7, 1, 'Phản hồi hỗ trợ mới', 'Admin vừa trả lời yêu cầu hỗ trợ #1 của bạn.', 1, '2026-11-23 13:59:37'),
(8, 1, 'Phản hồi hỗ trợ mới', 'Admin vừa trả lời yêu cầu hỗ trợ #1 của bạn.', 1, '2026-11-23 14:05:21'),
(9, 1, 'Cập nhật Hỗ trợ', 'Yêu cầu hỗ trợ #1 đã được Admin cập nhật trạng thái: CLOSED', 1, '2026-11-23 14:05:26'),
(10, 1, 'Nạp tiền thành công', 'Nạp thành công 5.000.000đ qua VNPay (Thưởng: 500.000đ). Số dư được cộng: 5.500.000đ.', 1, '2026-11-23 16:12:12'),
(11, 1, 'Đơn hàng mới', 'Khách hàng vừa thanh toán đơn hàng #4', 1, '2026-11-23 16:12:25'),
(12, 1, 'Đơn hàng mới', 'Khách hàng vừa thanh toán đơn hàng #5', 1, '2026-11-23 16:59:22'),
(13, 1, 'Đơn hàng mới', 'Khách hàng vừa thanh toán đơn hàng #6', 1, '2026-11-23 17:06:11'),
(14, 1, 'Đơn hàng mới', 'Khách hàng vừa thanh toán đơn hàng #7', 1, '2026-11-23 17:08:12'),
(15, 1, 'Yêu cầu hoàn tiền bị từ chối', 'Yêu cầu hoàn tiền cho đơn hàng #3 đã bị từ chối. Lý do: Tài khoản vẫn hoạt động. Vui lòng liên hệ hỗ trợ nếu có thắc mắc.', 1, '2026-11-23 17:58:38'),
(16, 1, 'Hoàn tiền thành công', 'Yêu cầu hoàn tiền cho đơn hàng #3 đã được duyệt. Số tiền 100.000đ đã được cộng lại vào ví của bạn.', 1, '2026-11-23 18:03:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `total_amount` bigint(20) NOT NULL,
  `status` enum('pending','completed','cancelled') DEFAULT 'pending',
  `payment_method` varchar(50) DEFAULT 'wallet',
  `coupon_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `status`, `payment_method`, `coupon_id`, `created_at`, `is_hidden`) VALUES
(1, 1, 749000, 'completed', 'wallet', NULL, '2026-11-20 10:30:00', 1),
(2, 1, 250000, 'completed', 'wallet', NULL, '2026-11-22 15:45:00', 1),
(3, 1, 100000, 'cancelled', 'wallet', NULL, '2026-11-23 13:06:29', 0),
(4, 1, 260000, 'completed', 'wallet', NULL, '2026-11-23 16:12:25', 0),
(5, 1, 249000, 'completed', 'wallet', NULL, '2026-11-23 16:59:22', 0),
(6, 1, 296100, 'completed', 'wallet', 2, '2026-11-23 17:06:11', 0),
(7, 1, 144000, 'completed', 'wallet', 2, '2026-11-23 17:08:12', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `price` bigint(20) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `account_data` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `price`, `quantity`, `account_data`, `created_at`) VALUES
(1, 1, 1, 499000, 1, NULL, '2026-11-23 12:42:49'),
(2, 1, 2, 250000, 1, NULL, '2026-11-23 12:42:49'),
(3, 2, 2, 250000, 1, NULL, '2026-11-23 12:42:49'),
(4, 3, 5, 100000, 1, 'emthanhcanva@gmail.com|emthanh123', '2026-11-23 13:06:29'),
(5, 4, 22, 260000, 1, NULL, '2026-11-23 16:12:25'),
(6, 5, 5, 249000, 1, 'emthanhcanva01@gmail.com|emthanh123', '2026-11-23 16:59:22'),
(7, 6, 10, 296100, 1, 'emthanhcanva12@gmail.com|emthanh123', '2026-11-23 17:06:11'),
(8, 7, 24, 144000, 1, NULL, '2026-11-23 17:08:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` bigint(20) NOT NULL,
  `sale_price` bigint(20) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'hero.jpg',
  `download_link` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT 'Source Code',
  `product_type` enum('file','account') NOT NULL DEFAULT 'file',
  `status` enum('active','hidden') DEFAULT 'active',
  `created_at` datetime DEFAULT current_timestamp(),
  `sold_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `sale_price`, `image`, `download_link`, `category`, `product_type`, `status`, `created_at`, `sold_count`) VALUES
(5, 'Tài Khoản Canva Pro 1 Năm', 'Gói thời hạn: 1 Năm.\r\n\r\nTính năng nổi bật:\r\n\r\nTruy cập không giới hạn hơn 100 triệu ảnh, video, âm thanh, phông chữ và hàng trăm nghìn mẫu thiết kế (Template) độc quyền.\r\n\r\nSử dụng đầy đủ bộ công cụ thông minh: Xóa nền ảnh/video chỉ với 1 cú nhấp chuột, Magic Switch (đổi kích thước thiết kế hàng loạt) và các công cụ Magic Studio hỗ trợ bởi AI.\r\n\r\nTạo bộ nhận diện thương hiệu (Brand Kit) gồm bảng màu, logo, phông chữ riêng và xuất file chất lượng cao với nền trong suốt.\r\n\r\nHình thức giao hàng: Nâng cấp trực tiếp trên tài khoản Canva cá nhân của khách hàng qua email (kích hoạt gói Pro/Team).\r\n\r\nBảo hành: Bảo hành xuyên suốt thời hạn gói; hỗ trợ đổi slot nhanh chóng nếu phát sinh lỗi.', 249000, NULL, 'https://images-eds-ssl.xboxlive.com/image?url=4rt9.lXDC4H_93laV1_eHM0OYfiFeMI2p9MWie0CvL99U4GA1gf6_kayTt_kBblFwHwo8BW8JXlqfnYxKPmmBb8YkqrmoFjcMUJULGOJelBAsBew_8MiVtDkw16MOHEvwUiH7E1QjDHQxEjXm_q0iU9td7mK3MJ3WLcYut47sts-&format=source', NULL, 'Tài khoản / Key Phần mềm', 'account', 'active', '2026-11-23 12:38:10', 2),
(6, 'Tài Khoản CapCut Pro (1 Tháng)', 'Mô tả: Mở khóa toàn bộ hiệu ứng, transition, bộ lọc, tính năng xóa nền tự động và xuất video chất lượng cao không dính watermark trên điện thoại và PC.\r\n\r\nĐịnh dạng / Hình thức giao: Thông tin đăng nhập (Email | Mật khẩu) hoặc kích hoạt trực tiếp qua email\r\n\r\nGói / Thời hạn: 1 Tháng', 49000, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSBCMQJHvkRQo6Tjk0_eGrEy54En4n2hbKXppOwb1fVg&s=10', NULL, 'Tài khoản / Key Phần mềm', 'account', 'active', '2026-11-23 14:07:19', 0),
(10, 'Tài Khoản ChatGPT Plus (3 tháng)', 'Gói thời hạn: 3 Tháng.   \r\n\r\nTính năng nổi bật: Truy cập các mô hình suy luận và xử lý nâng cao (như dòng GPT-6 / GPT-6.1) với hạn mức sử dụng cao hơn bản miễn phí.   \r\n\r\nHỗ trợ phân tích tài liệu, bảng biểu, biểu đồ trực quan, Deep Research và tạo hình ảnh chất lượng cao.   \r\nHỗ trợ viết code, gỡ lỗi, tạo Custom GPTs và quản lý dự án (Projects) hiệu quả cho học tập & công việc.   \r\nHình thức giao hàng: Tài khoản cấp sẵn (Email | Mật khẩu) hoặc nâng cấp chính chủ theo email (tùy cấu hình biến thể).\r\n\r\nBảo hành: Bảo hành xuyên suốt thời hạn gói theo chính sách cửa hàng.', 329000, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSBCMQJHvkRQo6Tjk0_eGrEy54En4n2hbKXppOwb1fVg&s=10', NULL, 'Tài khoản / Key Phần mềm', 'account', 'active', '2026-11-23 15:11:12', 1),
(11, 'Tài Khoản Google AI Pro – Gemini (1 Tháng)', 'Gói thời hạn: 1 Tháng.\r\n\r\nTính năng nổi bật:Sử dụng các mô hình Gemini nâng cao với hạn mức truy cập cao gấp nhiều lần bản miễn phí và cửa sổ ngữ cảnh lớn để xử lý tài liệu dài.   \r\n\r\nTích hợp hỗ trợ trực tiếp trong các ứng dụng Google (Gmail, Tài liệu/Docs, Drive, Vids...) giúp soạn thảo, tóm tắt và nghiên cứu nhanh chóng.   \r\n\r\nHỗ trợ tạo nội dung đa phương tiện (hình ảnh, báo cáo chuyên sâu, hỗ trợ lập trình) và đi kèm dung lượng lưu trữ Google One lớn.   \r\n\r\nHình thức giao hàng: Cấp slot/nâng cấp trên tài khoản Google hoặc tài khoản cấp sẵn.\r\n\r\nBảo hành: Bảo hành xuyên suốt thời hạn gói theo chính sách cửa hàng.', 129000, NULL, 'https://www.gstatic.com/lamda/images/gemini_aurora_thumbnail_4g_e74822ff0ca4259beb718.png', NULL, 'Tài khoản / Key Phần mềm', 'account', 'active', '2026-11-23 15:32:01', 0),
(12, 'Tài Khoản Google AI Pro – Gemini (3 Tháng)', 'Gói thời hạn: 1 Tháng hoặc 3 Tháng.\r\n\r\nTính năng nổi bật:Sử dụng các mô hình Gemini nâng cao với hạn mức truy cập cao gấp nhiều lần bản miễn phí và cửa sổ ngữ cảnh lớn để xử lý tài liệu dài.   \r\n\r\nTích hợp hỗ trợ trực tiếp trong các ứng dụng Google (Gmail, Tài liệu/Docs, Drive, Vids...) giúp soạn thảo, tóm tắt và nghiên cứu nhanh chóng.   \r\n\r\nHỗ trợ tạo nội dung đa phương tiện (hình ảnh, báo cáo chuyên sâu, hỗ trợ lập trình) và đi kèm dung lượng lưu trữ Google One lớn.   \r\n\r\nHình thức giao hàng: Cấp slot/nâng cấp trên tài khoản Google hoặc tài khoản cấp sẵn.Bảo hành: \r\n\r\nBảo hành xuyên suốt thời hạn gói theo chính sách cửa hàng.', 359000, NULL, 'https://www.gstatic.com/lamda/images/gemini_aurora_thumbnail_4g_e74822ff0ca4259beb718.png', NULL, 'Tài khoản / Key Phần mềm', 'account', 'active', '2026-11-23 15:33:17', 0),
(13, 'Tài Khoản Claude Pro (1 Tháng)', 'Gói thời hạn: 1 Tháng hoặc 3 Tháng.\r\n\r\nTính năng nổi bật: Mở rộng hạn mức sử dụng theo chu kỳ so với bản miễn phí và truy cập đầy đủ các dòng mô hình của Claude (như Opus, Sonnet, Haiku).   \r\n\r\nVăn phong viết mạch lạc, sắc bén; hỗ trợ tốt việc đọc hiểu tài liệu dài, phân tích dữ liệu, viết code và tạo Artifacts trực quan.\r\n\r\nHỗ trợ tạo tài liệu, slide, kết nối công cụ và làm việc liên tục trên web, desktop lẫn di động.   \r\n\r\nHình thức giao hàng: Tài khoản cấp sẵn hoặc nâng cấp theo yêu cầu.\r\n\r\nBảo hành: Bảo hành xuyên suốt thời hạn gói theo chính sách cửa hàng.', 129000, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSer4Id9amOxABFdhlrdif74rgwMw9TQYze81AnRDwywg&s=10', NULL, 'Tài khoản / Key Phần mềm', 'account', 'active', '2026-11-23 15:34:49', 0),
(14, 'Tài Khoản Claude Pro (3 Tháng)', 'Gói thời hạn: 1 Tháng hoặc 3 Tháng.\r\n\r\nTính năng nổi bật: Mở rộng hạn mức sử dụng theo chu kỳ so với bản miễn phí và truy cập đầy đủ các dòng mô hình của Claude (như Opus, Sonnet, Haiku).   \r\n\r\nVăn phong viết mạch lạc, sắc bén; hỗ trợ tốt việc đọc hiểu tài liệu dài, phân tích dữ liệu, viết code và tạo Artifacts trực quan.\r\n\r\nHỗ trợ tạo tài liệu, slide, kết nối công cụ và làm việc liên tục trên web, desktop lẫn di động.   \r\n\r\nHình thức giao hàng: Tài khoản cấp sẵn hoặc nâng cấp theo yêu cầu.\r\n\r\nBảo hành: Bảo hành xuyên suốt thời hạn gói theo chính sách cửa hàng.', 359000, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7Ca9bzsg_2rDqZjl6QvuUjdBG_6EhzNGY99R_SOBF5P1eEm2rxCUdf-s&s=10', NULL, 'Tài khoản / Key Phần mềm', 'account', 'active', '2026-11-23 15:36:01', 0),
(15, 'Tài Khoản Canva Pro (1 Tháng)', 'Gói thời hạn: 1 Tháng.\r\n\r\nTính năng nổi bật:\r\n\r\nTruy cập không giới hạn hơn 100 triệu ảnh, video, âm thanh, phông chữ và hàng trăm nghìn mẫu thiết kế (Template) độc quyền.\r\n\r\nSử dụng đầy đủ bộ công cụ thông minh: Xóa nền ảnh/video chỉ với 1 cú nhấp chuột, Magic Switch (đổi kích thước thiết kế hàng loạt) và các công cụ Magic Studio hỗ trợ bởi AI.\r\n\r\nTạo bộ nhận diện thương hiệu (Brand Kit) gồm bảng màu, logo, phông chữ riêng và xuất file chất lượng cao với nền trong suốt.\r\n\r\nHình thức giao hàng: Nâng cấp trực tiếp trên tài khoản Canva cá nhân của khách hàng qua email (kích hoạt gói Pro/Team).\r\n\r\nBảo hành: Bảo hành xuyên suốt thời hạn gói; hỗ trợ đổi slot nhanh chóng nếu phát sinh lỗi.', 35000, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeVUEKHKUjTpedl6xl1xChKEKeFaWp0ij074-ijJRDQA&s=10', NULL, 'Tài khoản / Key Phần mềm', 'account', 'active', '2026-11-23 15:38:33', 0),
(16, 'Tài Khoản Canva Pro (3 Tháng)', 'Gói thời hạn: 3 Tháng.\r\n\r\nTính năng nổi bật:\r\n\r\nTruy cập không giới hạn hơn 100 triệu ảnh, video, âm thanh, phông chữ và hàng trăm nghìn mẫu thiết kế (Template) độc quyền.\r\n\r\nSử dụng đầy đủ bộ công cụ thông minh: Xóa nền ảnh/video chỉ với 1 cú nhấp chuột, Magic Switch (đổi kích thước thiết kế hàng loạt) và các công cụ Magic Studio hỗ trợ bởi AI.\r\n\r\nTạo bộ nhận diện thương hiệu (Brand Kit) gồm bảng màu, logo, phông chữ riêng và xuất file chất lượng cao với nền trong suốt.\r\n\r\nHình thức giao hàng: Nâng cấp trực tiếp trên tài khoản Canva cá nhân của khách hàng qua email (kích hoạt gói Pro/Team).\r\n\r\nBảo hành: Bảo hành xuyên suốt thời hạn gói; hỗ trợ đổi slot nhanh chóng nếu phát sinh lỗi.', 89000, NULL, 'https://images-eds-ssl.xboxlive.com/image?url=4rt9.lXDC4H_93laV1_eHM0OYfiFeMI2p9MWie0CvL99U4GA1gf6_kayTt_kBblFwHwo8BW8JXlqfnYxKPmmBb8YkqrmoFjcMUJULGOJelBAsBew_8MiVtDkw16MOHEvwUiH7E1QjDHQxEjXm_q0iU9td7mK3MJ3WLcYut47sts-&format=source', NULL, 'Tài khoản / Key Phần mềm', 'account', 'active', '2026-11-23 15:39:21', 0),
(17, 'Source Code Website Bán Hàng & Quản Lý Kho (React + Node.js)', 'Công nghệ sử dụng: ReactJS, Node.js (Express), MongoDB / MySQL, RESTful API.\r\n\r\nTính năng nổi bật:\r\n\r\nGiao diện người dùng responsive: tìm kiếm, lọc theo danh mục, chi tiết sản phẩm, giỏ hàng, mã giảm giá và theo dõi trạng thái đơn hàng.\r\n\r\nTrang quản trị (Admin): quản lý sản phẩm, biến thể, danh mục, người dùng, xử lý đơn hàng và xem thống kê doanh thu.\r\n\r\nPhân quyền rõ ràng (Admin / Customer), xác thực đăng nhập bảo mật và cấu trúc code dễ đọc, dễ mở rộng cho đồ án.\r\n\r\nĐịnh dạng bàn giao: File .zip (Source code Frontend + Backend + Database mẫu + File hướng dẫn cài đặt).', 1, NULL, 'https://topcode.vn/FilesUpload/CodeUpload/source-code-react-nodejs-website-ban-hang-94153.jpg', 'https://drive.google.com/file/d/1EZZ6fVJabDRFx_qTHVzlI-W2pOFnk-WS/view?usp=sharing', 'Source Code', 'file', 'active', '2026-11-23 15:55:59', 0),
(18, 'Source Code Hệ Thống Đặt Lịch & Quản Lý Phòng Khám / Spa (PHP / Laravel hoặc Next.js)', 'Công nghệ sử dụng: Next.js / PHP Laravel, MySQL, Tailwind CSS / Bootstrap.\r\n\r\nTính năng nổi bật:\r\n\r\nKhách hàng xem danh sách dịch vụ, bảng giá, chọn ngày/giờ còn trống và đặt lịch nhanh chóng không cần thao tác rườm rà.\r\n\r\nQuản trị viên duyệt/hủy/đổi lịch hẹn, quản lý dịch vụ, khung giờ làm việc, hồ sơ khách hàng và báo cáo số lượng lịch đặt.\r\n\r\nTích hợp sẵn giao diện responsive mượt mà trên cả điện thoại và máy tính.\r\n\r\nĐịnh dạng bàn giao: File .zip (Full source code + Script tạo database + Tài liệu hướng dẫn chạy local).', 2, NULL, 'https://gsheets.vn/wp-content/uploads/2026/02/Webapp-Quan-Ly-Spa-Phong-kham-v1.0-6.webp', 'https://drive.google.com/file/d/1EZZ6fVJabDRFx_qTHVzlI-W2pOFnk-WS/view?usp=sharing', 'Source Code', 'file', 'active', '2026-11-23 15:57:06', 0),
(19, 'Source Code Blog / Trang Tin Tức Công Nghệ Chuẩn SEO (Next.js / Node.js)', 'Công nghệ sử dụng: Next.js / React + Node.js, PostgreSQL / MongoDB.\r\n\r\nTính năng nổi bật:\r\n\r\nHiển thị bài viết theo chuyên mục, thẻ tag, bài nổi bật, bài liên quan và thanh tìm kiếm từ khóa tức thì.\r\n\r\nTrang quản trị viết/sửa/xóa bài viết, quản lý chuyên mục, bình luận và cấu hình thông tin meta cơ bản cho từng bài.\r\n\r\nTốc độ tải trang nhanh, bố cục sạch sẽ, dễ tùy chỉnh màu sắc và logo thương hiệu.\r\n\r\nĐịnh dạng bàn giao: File .zip (Source code + Dữ liệu bài viết mẫu + Hướng dẫn cấu hình biến môi trường).', 3, NULL, 'https://images.vinhweb.com/storage/products/thanhlapcongty/608-1x-shots-so.jpeg', 'https://drive.google.com/file/d/1EZZ6fVJabDRFx_qTHVzlI-W2pOFnk-WS/view?usp=sharing', 'Source Code', 'file', 'active', '2026-11-23 15:58:29', 0),
(20, 'Template Admin Quản Trị Thương Mại Điện Tử & Thống Kê Doanh Thu (React + Tailwind CSS)', 'Công nghệ sử dụng: React, Tailwind CSS, Chart/Recharts, Responsive Layout.\r\n\r\nTính năng nổi bật:\r\n\r\nMàn hình tổng quan (Dashboard) hiển thị doanh thu, đơn hàng mới, tỷ lệ chuyển đổi và biểu đồ theo thời gian thực.\r\n\r\nĐầy đủ trang quản lý sản phẩm, danh mục, khách hàng, đơn hàng, mã giảm giá và chi tiết hóa đơn.\r\n\r\nTích hợp Dark/Light Mode, thanh tìm kiếm nhanh, thông báo và giao diện tương thích mượt mà trên nhiều kích thước màn hình.\r\n\r\nĐịnh dạng bàn giao: File .zip (Source giao diện + Dữ liệu mẫu mock data + Hướng dẫn chạy dự án).', 220000, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEn47Iy82YWOFLVktEMY4oz0S5xLYXRqUUaYGNlXFze4qfxzcT0f1uldSr&s=10', 'https://drive.google.com/file/d/1EZZ6fVJabDRFx_qTHVzlI-W2pOFnk-WS/view?usp=sharing', 'Template Admin', 'file', 'active', '2026-11-23 16:00:38', 0),
(21, 'Template Admin Quản Lý Hệ Thống, Người Dùng & Phân Quyền (HTML5 + Bootstrap 5)', 'Công nghệ sử dụng: HTML5, CSS3, JavaScript, Bootstrap 5.\r\n\r\nTính năng nổi bật:\r\n\r\nCấu trúc component rõ ràng gồm: sidebar thu gọn, navbar, modal xác nhận, alert, form validation và bảng dữ liệu phân trang/tìm kiếm.\r\n\r\nCó sẵn các trang quản lý tài khoản, vai trò/phân quyền, nhật ký hoạt động và trang cấu hình hệ thống.\r\n\r\nDễ dàng cắt ghép vào mọi backend như PHP, Node.js, Java, .NET hoặc Python cho đồ án môn học.\r\n\r\nĐịnh dạng bàn giao: File .zip (Bộ HTML/CSS/JS hoàn chỉnh + Tài liệu cấu trúc thư mục).', 150000, NULL, 'https://tatthanh.com.vn/pic/News/image(687)_HasThumb.png', 'https://drive.google.com/file/d/1EZZ6fVJabDRFx_qTHVzlI-W2pOFnk-WS/view?usp=sharing', 'Template Admin', 'file', 'active', '2026-11-23 16:01:49', 0),
(22, 'Template Admin Quản Lý Dự Án, Công Việc & Nhân Sự (Next.js + TypeScript)', 'Công nghệ sử dụng: Next.js, TypeScript, Tailwind CSS.\r\n\r\nTính năng nổi bật:\r\n\r\nTích hợp giao diện quản lý công việc dạng danh sách và bảng Kanban kéo thả trực quan theo trạng thái tiến độ.\r\n\r\nCung cấp các màn hình hồ sơ nhân sự, chấm công/nghỉ phép, báo cáo hiệu suất và hộp thư thông báo nội bộ.\r\n\r\nCode chia module sạch sẽ, dễ mở rộng thêm các trang nghiệp vụ mới khi demo hoặc phát triển tiếp.\r\n\r\nĐịnh dạng bàn giao: File .zip (Source code template + Dữ liệu mẫu + Hướng dẫn cài đặt).', 260000, NULL, 'https://cdn-aniq-ui.com/blog/images/5cf983cf-a158-4dd7-8854-b00dc8f4c460.jpg', 'https://drive.google.com/file/d/1EZZ6fVJabDRFx_qTHVzlI-W2pOFnk-WS/view?usp=sharing', 'Template Admin', 'file', 'active', '2026-11-23 16:02:43', 1),
(23, 'HTML5 Landing Page Giới Thiệu Sản Phẩm Công Nghệ & Ứng Dụng (HTML5 + Tailwind CSS + JS)', 'Công nghệ sử dụng: HTML5, CSS3 (Tailwind CSS), Vanilla JavaScript, AOS / Lucide Icons.\r\n\r\nTính năng nổi bật:\r\n\r\nThiết kế responsive tối ưu cho cả desktop, tablet và smartphone với thanh điều hướng cuộn thông minh.\r\n\r\nĐầy đủ các section quan trọng: Hero banner, tính năng nổi bật, quy trình hoạt động, bảng giá các gói dịch vụ, đánh giá người dùng, FAQ accordion và form đăng ký dùng thử.\r\n\r\nTốc độ tải nhanh, không phụ thuộc framework nặng, dễ chỉnh sửa màu sắc, hình ảnh và nội dung.\r\n\r\nĐịnh dạng bàn giao: File .zip (Mã nguồn HTML/CSS/JS + Ảnh placeholder + File hướng dẫn tùy chỉnh).', 140000, NULL, 'https://website366.com/wp-content/uploads/2026/08/tao-menu-website-giao-dien-dien-thoai-bang-AI.gif', 'https://drive.google.com/file/d/1EZZ6fVJabDRFx_qTHVzlI-W2pOFnk-WS/view?usp=sharing', 'HTML5 Landing', 'file', 'active', '2026-11-23 16:07:02', 0),
(24, 'HTML5 Landing Page Bất Động Sản & Dự Án Căn Hộ (HTML5 + Bootstrap 5 + JS)', 'Công nghệ sử dụng: HTML5, CSS3, Bootstrap 5, JavaScript.\r\n\r\nTính năng nổi bật:\r\n\r\nTrình bày trực quan tổng quan dự án, vị trí kết nối, tiện ích nội khu/ngoại khu và mặt bằng chi tiết từng loại căn hộ.\r\n\r\nTích hợp gallery xem ảnh phóng to, bảng tính dự toán tham khảo cơ bản và form gửi thông tin nhận tư vấn/bảng giá.\r\n\r\nCấu trúc thẻ semantic rõ ràng, dễ tối ưu SEO on-page và gắn mã theo dõi sự kiện chuyển đổi.\r\n\r\nĐịnh dạng bàn giao: File .zip (Full template HTML/CSS/JS + Tài liệu hướng dẫn sử dụng).', 160000, NULL, 'https://mona.media/wp-content/uploads/2025/12/theme-landing-page-bat-dong-san-pho-bien.jpg', 'https://drive.google.com/file/d/1EZZ6fVJabDRFx_qTHVzlI-W2pOFnk-WS/view?usp=sharing', 'HTML5 Landing', 'file', 'active', '2026-11-23 16:07:54', 1),
(25, 'Lộ Trình Tự Học Lập Trình Web Fullstack Từ Cơ Bản Đến Thực Chiến', 'Định dạng & Dung lượng: File .pdf (165 trang, bố cục rõ ràng, kèm sơ đồ luồng xử lý và checklist theo từng giai đoạn).\r\n\r\nNội dung nổi bật:\r\n\r\nNền tảng HTML5, CSS3, JavaScript hiện đại, cách chia component giao diện và tối ưu trải nghiệm người dùng trên nhiều màn hình.\r\n\r\nXây dựng RESTful API, xác thực/phân quyền người dùng, thiết kế cơ sở dữ liệu quan hệ/phi quan hệ và xử lý lỗi chuẩn chỉnh.\r\n\r\nHướng dẫn đóng gói, cấu hình môi trường, đưa dự án lên môi trường chạy thực tế và cách trình bày/bảo vệ sản phẩm phần mềm.\r\n\r\nHình thức bàn giao: Tải trực tiếp file .pdf ngay sau khi hoàn tất đơn hàng.', 129000, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrdIHRqabRya15SWYR5WJ-YVHVOABPcoIvUQ9iTY3RWFOy__ZRmHMg0Do&s=10', 'https://drive.google.com/file/d/1EZZ6fVJabDRFx_qTHVzlI-W2pOFnk-WS/view?usp=sharing', 'Source Code', 'file', 'active', '2026-11-23 16:10:29', 0),
(26, 'Cẩm Nang Thiết Kế Kiến Trúc & Tối Ưu Cơ Sở Dữ Liệu', 'Định dạng & Dung lượng: File .pdf + .epub (140 trang, kèm ví dụ truy vấn và tình huống tối ưu thực tế).\r\n\r\nNội dung nổi bật:\r\n\r\nNguyên tắc chuẩn hóa dữ liệu, thiết kế khóa chính/khóa ngoại, quan hệ 1-1, 1-n, n-n và các lưu ý khi mở rộng quy mô.\r\n\r\nCách nhận diện câu truy vấn chậm, đọc kế hoạch thực thi (Execution Plan), đánh index hợp lý và tránh lỗi phổ biến khi dữ liệu tăng cao.\r\n\r\nCác kỹ thuật cơ bản về giao dịch (Transaction), phân trang hiệu quả, lưu trữ tệp đính kèm và sao lưu phục hồi dữ liệu.\r\n\r\nHình thức bàn giao: Tải trực tiếp file .pdf và .epub ngay trên hệ thống.', 149000, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMG7T5esGQDfIVtjQKCVz2-UaOVT5XrgmaV3qCSqKUV4vv5mSWbS0fUtU&s=10', 'https://drive.google.com/file/d/1EZZ6fVJabDRFx_qTHVzlI-W2pOFnk-WS/view?usp=sharing', 'Source Code', 'file', 'active', '2026-11-23 16:11:34', 0),
(27, 'Bộ Tài Liệu & Mẫu Checklist Quản Lý Dự Án Phần Mềm Cho Sinh Viên & Startup', 'Định dạng & Dung lượng: File .zip gồm tài liệu .pdf (95 trang) và các mẫu biểu/checklist có thể chỉnh sửa.\r\n\r\nNội dung nổi bật:\r\n\r\nHướng dẫn xác định phạm vi tính năng, ước lượng thời gian, chia sprint/milestone và theo dõi rủi ro trong suốt vòng đời dự án.\r\n\r\nMẫu checklist kiểm thử chức năng, kiểm thử giao diện, tài liệu bàn giao và khung chuẩn bị kịch bản demo sản phẩm.\r\n\r\nPhù hợp cho nhóm làm đồ án môn học, đồ án tốt nghiệp hoặc đội ngũ phát triển sản phẩm giai đoạn đầu.\r\n\r\nHình thức bàn giao: Tải trực tiếp file .zip sau khi đặt hàng thành công.', 99000, NULL, 'https://fast.com.vn/wp-content/uploads/2024/07/checklist-cong-viec-2.jpg', 'https://drive.google.com/file/d/1EZZ6fVJabDRFx_qTHVzlI-W2pOFnk-WS/view?usp=sharing', 'Source Code', 'file', 'active', '2026-11-23 16:15:43', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `account_data` text NOT NULL,
  `status` enum('available','sold') DEFAULT 'available',
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `sold_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `account_data`, `status`, `user_id`, `sold_at`, `created_at`) VALUES
(1, 5, 'emthanhcanva@gmail.com|emthanh123', 'sold', 1, '2026-11-23 13:06:29', '2026-11-23 12:38:34'),
(2, 5, 'emthanhcanva01@gmail.com|emthanh123', 'sold', 1, '2026-11-23 16:59:22', '2026-11-23 12:38:34'),
(3, 5, 'emthanhcanva04@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(4, 5, 'emthanhcanva05@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(5, 5, 'emthanhcanva98gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(6, 5, 'emthanhcanva333@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(7, 5, 'emthanhcanva12@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(8, 5, 'emthanhcanva27@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(9, 5, 'emthanhcanva39@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(10, 5, 'emthanhcanva45@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(11, 5, 'emthanhcanva58@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(12, 5, 'emthanhcanva64@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(13, 5, 'emthanhcanva71@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(14, 5, 'emthanhcanva83@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(15, 5, 'emthanhcanva96@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(16, 5, 'emthanhcanva105@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(17, 5, 'emthanhcanva214@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(18, 5, 'emthanhcanva328@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(19, 5, 'emthanhcanva459@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(20, 5, 'emthanhcanva572@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(21, 5, 'emthanhcanva680@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(22, 5, 'emthanhcanva791@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(23, 5, 'emthanhcanva834@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(24, 5, 'emthanhcanva947@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(25, 5, 'emthanhcanva1029@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(26, 5, 'emthanhcanva2048@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:18'),
(27, 6, 'emthanhcanva12@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(28, 6, 'emthanhcanva27@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(29, 6, 'emthanhcanva39@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(30, 6, 'emthanhcanva45@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(31, 6, 'emthanhcanva58@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(32, 6, 'emthanhcanva64@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(33, 6, 'emthanhcanva71@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(34, 6, 'emthanhcanva83@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(35, 6, 'emthanhcanva96@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(36, 6, 'emthanhcanva105@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(37, 6, 'emthanhcanva214@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(38, 6, 'emthanhcanva328@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(39, 6, 'emthanhcanva459@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(40, 6, 'emthanhcanva572@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(41, 6, 'emthanhcanva680@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(42, 6, 'emthanhcanva791@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(43, 6, 'emthanhcanva834@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(44, 6, 'emthanhcanva947@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(45, 6, 'emthanhcanva1029@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(46, 6, 'emthanhcanva2048@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:29'),
(47, 10, 'emthanhcanva12@gmail.com|emthanh123', 'sold', 1, '2026-11-23 17:06:11', '2026-11-23 17:04:34'),
(48, 10, 'emthanhcanva27@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(49, 10, 'emthanhcanva39@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(50, 10, 'emthanhcanva45@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(51, 10, 'emthanhcanva58@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(52, 10, 'emthanhcanva64@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(53, 10, 'emthanhcanva71@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(54, 10, 'emthanhcanva83@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(55, 10, 'emthanhcanva96@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(56, 10, 'emthanhcanva105@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(57, 10, 'emthanhcanva214@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(58, 10, 'emthanhcanva328@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(59, 10, 'emthanhcanva459@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(60, 10, 'emthanhcanva572@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(61, 10, 'emthanhcanva680@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(62, 10, 'emthanhcanva791@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(63, 10, 'emthanhcanva834@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(64, 10, 'emthanhcanva947@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(65, 10, 'emthanhcanva1029@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(66, 10, 'emthanhcanva2048@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:34'),
(67, 11, 'emthanhcanva12@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(68, 11, 'emthanhcanva27@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(69, 11, 'emthanhcanva39@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(70, 11, 'emthanhcanva45@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(71, 11, 'emthanhcanva58@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(72, 11, 'emthanhcanva64@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(73, 11, 'emthanhcanva71@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(74, 11, 'emthanhcanva83@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(75, 11, 'emthanhcanva96@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(76, 11, 'emthanhcanva105@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(77, 11, 'emthanhcanva214@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(78, 11, 'emthanhcanva328@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(79, 11, 'emthanhcanva459@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(80, 11, 'emthanhcanva572@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(81, 11, 'emthanhcanva680@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(82, 11, 'emthanhcanva791@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(83, 11, 'emthanhcanva834@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(84, 11, 'emthanhcanva947@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(85, 11, 'emthanhcanva1029@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(86, 11, 'emthanhcanva2048@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:42'),
(87, 12, 'emthanhcanva12@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(88, 12, 'emthanhcanva27@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(89, 12, 'emthanhcanva39@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(90, 12, 'emthanhcanva45@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(91, 12, 'emthanhcanva58@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(92, 12, 'emthanhcanva64@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(93, 12, 'emthanhcanva71@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(94, 12, 'emthanhcanva83@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(95, 12, 'emthanhcanva96@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(96, 12, 'emthanhcanva105@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(97, 12, 'emthanhcanva214@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(98, 12, 'emthanhcanva328@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(99, 12, 'emthanhcanva459@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(100, 12, 'emthanhcanva572@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(101, 12, 'emthanhcanva680@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(102, 12, 'emthanhcanva791@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(103, 12, 'emthanhcanva834@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(104, 12, 'emthanhcanva947@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(105, 12, 'emthanhcanva1029@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(106, 12, 'emthanhcanva2048@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:48'),
(107, 13, 'emthanhcanva12@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(108, 13, 'emthanhcanva27@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(109, 13, 'emthanhcanva39@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(110, 13, 'emthanhcanva45@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(111, 13, 'emthanhcanva58@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(112, 13, 'emthanhcanva64@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(113, 13, 'emthanhcanva71@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(114, 13, 'emthanhcanva83@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(115, 13, 'emthanhcanva96@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(116, 13, 'emthanhcanva105@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(117, 13, 'emthanhcanva214@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(118, 13, 'emthanhcanva328@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(119, 13, 'emthanhcanva459@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(120, 13, 'emthanhcanva572@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(121, 13, 'emthanhcanva680@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(122, 13, 'emthanhcanva791@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(123, 13, 'emthanhcanva834@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(124, 13, 'emthanhcanva947@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(125, 13, 'emthanhcanva1029@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(126, 13, 'emthanhcanva2048@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:53'),
(127, 14, 'emthanhcanva12@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(128, 14, 'emthanhcanva27@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(129, 14, 'emthanhcanva39@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(130, 14, 'emthanhcanva45@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(131, 14, 'emthanhcanva58@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(132, 14, 'emthanhcanva64@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(133, 14, 'emthanhcanva71@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(134, 14, 'emthanhcanva83@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(135, 14, 'emthanhcanva96@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(136, 14, 'emthanhcanva105@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(137, 14, 'emthanhcanva214@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(138, 14, 'emthanhcanva328@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(139, 14, 'emthanhcanva459@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(140, 14, 'emthanhcanva572@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(141, 14, 'emthanhcanva680@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(142, 14, 'emthanhcanva791@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(143, 14, 'emthanhcanva834@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(144, 14, 'emthanhcanva947@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(145, 14, 'emthanhcanva1029@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(146, 14, 'emthanhcanva2048@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:04:58'),
(147, 15, 'emthanhcanva12@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(148, 15, 'emthanhcanva27@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(149, 15, 'emthanhcanva39@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(150, 15, 'emthanhcanva45@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(151, 15, 'emthanhcanva58@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(152, 15, 'emthanhcanva64@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(153, 15, 'emthanhcanva71@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(154, 15, 'emthanhcanva83@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(155, 15, 'emthanhcanva96@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(156, 15, 'emthanhcanva105@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(157, 15, 'emthanhcanva214@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(158, 15, 'emthanhcanva328@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(159, 15, 'emthanhcanva459@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(160, 15, 'emthanhcanva572@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(161, 15, 'emthanhcanva680@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(162, 15, 'emthanhcanva791@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(163, 15, 'emthanhcanva834@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(164, 15, 'emthanhcanva947@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(165, 15, 'emthanhcanva1029@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(166, 15, 'emthanhcanva2048@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:03'),
(167, 16, 'emthanhcanva12@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(168, 16, 'emthanhcanva27@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(169, 16, 'emthanhcanva39@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(170, 16, 'emthanhcanva45@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(171, 16, 'emthanhcanva58@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(172, 16, 'emthanhcanva64@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(173, 16, 'emthanhcanva71@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(174, 16, 'emthanhcanva83@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(175, 16, 'emthanhcanva96@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(176, 16, 'emthanhcanva105@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(177, 16, 'emthanhcanva214@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(178, 16, 'emthanhcanva328@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(179, 16, 'emthanhcanva459@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(180, 16, 'emthanhcanva572@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(181, 16, 'emthanhcanva680@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(182, 16, 'emthanhcanva791@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(183, 16, 'emthanhcanva834@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(184, 16, 'emthanhcanva947@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(185, 16, 'emthanhcanva1029@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09'),
(186, 16, 'emthanhcanva2048@gmail.com|emthanh123', 'available', NULL, NULL, '2026-11-23 17:05:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `refunds`
--

CREATE TABLE `refunds` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `reason` text NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `admin_note` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `refunds`
--

INSERT INTO `refunds` (`id`, `order_id`, `user_id`, `reason`, `status`, `admin_note`, `created_at`) VALUES
(1, 3, 1, 'Tài khoản hoặc mật khẩu sai', 'approved', NULL, '2026-11-23 17:51:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) UNSIGNED DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `status` enum('open','processing','closed') DEFAULT 'open',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `order_id`, `subject`, `status`, `created_at`) VALUES
(1, 1, 3, 'Tài khoản bị lỗi không đăng nhập được', 'closed', '2026-11-23 13:58:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int(11) UNSIGNED NOT NULL,
  `ticket_id` int(11) UNSIGNED NOT NULL,
  `sender_type` enum('user','admin') NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ticket_replies`
--

INSERT INTO `ticket_replies` (`id`, `ticket_id`, `sender_type`, `message`, `created_at`) VALUES
(1, 1, 'user', 'Tài khoản bị lỗi không đăng nhập được', '2026-11-23 13:58:50'),
(2, 1, 'admin', 'Chào bạn .', '2026-11-23 13:59:23'),
(3, 1, 'admin', 'Mình có thể giúp được gì cho bạn', '2026-11-23 13:59:37'),
(4, 1, 'admin', 'ok giải quyết xong rồi đó bạn', '2026-11-23 14:05:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `balance` bigint(20) NOT NULL DEFAULT 0,
  `status` enum('active','banned') NOT NULL DEFAULT 'active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `balance`, `status`, `created_at`) VALUES
(1, 'Em Thanh', 'dacthanh123@gmail.com', '$2y$10$iu3c35dayrKzFBi7Kau.NOvVqJNdNb0KEVA.v/yWPJ/1RIl1CLeTu', 4755900, 'active', '2026-11-22 15:28:54');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Chỉ mục cho bảng `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT cho bảng `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Cơ sở dữ liệu: `di_san_daklak`
--
CREATE DATABASE IF NOT EXISTS `di_san_daklak` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `di_san_daklak`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chatbot_faqs`
--

CREATE TABLE `chatbot_faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `sources` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`sources`)),
  `hit_count` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chatbot_faqs`
--

INSERT INTO `chatbot_faqs` (`id`, `question`, `answer`, `sources`, `hit_count`, `created_at`, `updated_at`) VALUES
(1, 'xin chào', 'Xin chào bạn! Mình là Trợ lý Di sản Đắk Lắk. Mình có thể giúp bạn tìm hiểu về các địa danh, lễ hội, văn hóa và ẩm thực của vùng đất Tây Nguyên này. Bạn cần mình giúp gì không?', '[]', 1, '2026-11-05 05:26:56', '2026-11-05 05:26:56'),
(2, 'chào bạn', 'Chào bạn! Rất vui được trò chuyện với bạn. Bạn muốn khám phá điều gì về di sản Đắk Lắk hôm nay?', '[]', 1, '2026-11-05 05:26:56', '2026-11-05 05:26:56'),
(3, 'bạn là ai', 'Mình là \'Trợ lý Di sản Đắk Lắk\' - một trí tuệ nhân tạo (AI) được tạo ra để giúp mọi người tìm hiểu về văn hóa, lịch sử và du lịch của tỉnh Đắk Lắk. Mình trả lời dựa trên kho tư liệu cộng đồng đã được kiểm duyệt và luôn dẫn nguồn rõ ràng.', '[]', 1, '2026-11-05 05:26:56', '2026-11-05 05:26:56'),
(4, 'tôi muốn đi du lịch đắk lắk 2 ngày 1 đêm thì nên đi đâu', 'Chào bạn! Nếu có 2 ngày 1 đêm ở Đắk Lắk, mình gợi ý lịch trình như sau:\n- **Ngày 1:** Buổi sáng khám phá Khu du lịch sinh thái Bản Đôn (cưỡi voi, xem nhà sàn cổ). Buổi chiều ghé thăm Hồ Lắk và trải nghiệm văn hóa M\'nông. Tối nghỉ ngơi tại Buôn Ma Thuột.\n- **Ngày 2:** Sáng tham quan Thác Thủy Tiên hoặc Thác Dray Sáp Thượng. Chiều ghé thăm Nhà đày Buôn Ma Thuột để hiểu thêm về lịch sử, sau đó thưởng thức cà phê Buôn Ma Thuột trước khi kết thúc chuyến đi. Chúc bạn có chuyến đi vui vẻ!', '[{\"title\":\"H\\u1ed3 L\\u1eafk\",\"url\":\"http:\\/\\/localhost\\/tu-lieu\\/7\"}]', 1, '2026-11-05 05:26:56', '2026-11-05 05:26:56'),
(5, 'hồ lắk ở đâu', 'Hồ Lắk nằm ở huyện Lắk, tỉnh Đắk Lắk, cách trung tâm TP. Buôn Ma Thuột khoảng 56km về phía Nam. Đây là hồ nước ngọt tự nhiên lớn thứ hai Việt Nam và là điểm du lịch sinh thái - văn hóa nổi tiếng gắn liền với đồng bào M\'nông.', '[{\"title\":\"H\\u1ed3 L\\u1eafk\",\"url\":\"http:\\/\\/localhost\\/tu-lieu\\/7\"}]', 1, '2026-11-05 05:26:56', '2026-11-05 05:26:56'),
(6, 'lễ hội cồng chiêng là gì', 'Không gian văn hóa Cồng chiêng Tây Nguyên là một kiệt tác di sản truyền khẩu và phi vật thể của nhân loại. Đối với đồng bào Ê Đê, M\'nông ở Đắk Lắk, cồng chiêng là tiếng nói của thần linh, thường được đánh trong các dịp lễ hội, mừng lúa mới, cưới hỏi. Năm 2005, UNESCO đã công nhận đây là Di sản văn hóa phi vật thể đại diện của nhân loại.', '[]', 2, '2026-11-05 05:26:56', '2026-11-05 05:30:56'),
(7, 'đặc sản đắk lắk có gì', 'Đắk Lắk nổi tiếng nhất với Cà phê Buôn Ma Thuột (đậm đà, thơm nồng). Ngoài ra, bạn nhất định phải thử Rượu cần Tây Nguyên (đặc trưng văn hóa các dân tộc), các món nướng như Gà nướng Bản Đôn, và Bún đỏ Buôn Ma Thuột.', '[]', 1, '2026-11-05 05:26:56', '2026-11-05 05:26:56'),
(8, 'sử thi đăm săn kể về ai', 'Sử thi Đăm Săn là bản anh hùng ca vĩ đại nhất của người Ê Đê. Tác phẩm kể về cuộc đời và những chiến công của người anh hùng Đăm Săn - một tù trưởng tài ba, dũng cảm, đại diện cho sức mạnh và khát vọng chinh phục thiên nhiên, bảo vệ buôn làng của người dân Tây Nguyên cổ đại.', '[]', 1, '2026-11-05 05:26:56', '2026-11-05 05:26:56'),
(9, 'làm sao để đóng góp tư liệu', 'Để đóng góp tư liệu, bạn hãy đăng nhập vào hệ thống, sau đó bấm vào nút \'Đóng góp\' trên thanh menu. Bạn hãy điền đầy đủ thông tin (Tiêu đề, nội dung, người kể, hình ảnh...) và bấm \'Gửi duyệt\'. Tư liệu của bạn sẽ được các biên tập viên kiểm duyệt trước khi hiển thị công khai. Cảm ơn bạn đã chung tay giữ gìn di sản!', '[]', 1, '2026-11-05 05:26:56', '2026-11-05 05:26:56'),
(10, 'cảm ơn bạn', 'Không có gì đâu bạn! Rất vui vì đã giúp được bạn tìm hiểu thêm về mảnh đất và con người Đắk Lắk. Nếu có bất kỳ câu hỏi nào khác, bạn cứ tự nhiên hỏi mình nhé!', '[]', 1, '2026-11-05 05:26:56', '2026-11-05 05:26:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contributions`
--

CREATE TABLE `contributions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` text DEFAULT NULL,
  `thumbnail` text DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `content` text NOT NULL,
  `historical_context` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `ethnicity` varchar(255) DEFAULT NULL,
  `storyteller` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `video_url` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `reject_reason` text DEFAULT NULL,
  `consent_share` tinyint(1) NOT NULL DEFAULT 0,
  `hide_personal` tinyint(1) NOT NULL DEFAULT 0,
  `license` varchar(255) NOT NULL DEFAULT 'CC-BY-4.0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `duplicate_of_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ai_duplicate_analysis` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`ai_duplicate_analysis`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contributions`
--

INSERT INTO `contributions` (`id`, `title`, `summary`, `thumbnail`, `tags`, `images`, `content`, `historical_context`, `type`, `ethnicity`, `storyteller`, `locality`, `video_url`, `status`, `reject_reason`, `consent_share`, `hide_personal`, `license`, `created_at`, `updated_at`, `user_id`, `duplicate_of_id`, `ai_duplicate_analysis`) VALUES
(1, 'Di tích lịch sử Nhà đày Buôn Ma Thuột', 'Nhà đày Buôn Ma Thuột là di tích lịch sử quốc gia đặc biệt, nơi ghi dấu tội ác của thực dân Pháp và tinh thần đấu tranh bất khuất của các chiến sĩ cách mạng.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzV7IzEApzDy0FqVB7UoNPyuV2QYE2G0B5CUcHgKzxaw&s=10', '[\"nh\\u00e0 \\u0111\\u00e0y\",\"di t\\u00edch l\\u1ecbch s\\u1eed\",\"c\\u00e1ch m\\u1ea1ng\",\"bu\\u00f4n ma thu\\u1ed9t\",\"\\u0111\\u1ecba ch\\u1ec9 \\u0111\\u1ecf\"]', '[\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxTngrFt85BGU2b4lP0v3MbI4RmtYSGj4ZoYJKfQWM3Q&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRID6tN7Z7Nb_WStw-a3IssDYbh6zBY_xCeRjyqdYpyyg&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgUrZDUtarWLZ9gshPAZkYlbT3mhCIaXol5hy2N2V8qQ&s=10\"]', 'Nhà đày Buôn Ma Thuột được thực dân Pháp xây dựng vào năm 1930, ban đầu là nơi giam giữ các tù nhân chính trị. Đây là một trong những nhà tù lớn nhất ở Tây Nguyên thời Pháp thuộc. Nơi đây đã giam giữ hàng nghìn chiến sĩ cộng sản, trong đó có nhiều đồng chí lãnh đạo cao cấp của Đảng. Di tích hiện nay là một địa chỉ đỏ để giáo dục truyền thống cách mạng cho thế hệ trẻ. Năm 2018, Nhà đày Buôn Ma Thuột được xếp hạng Di tích lịch sử quốc gia đặc biệt.', 'Được xây dựng năm 1930, là nhà tù lớn nhất Tây Nguyên thời Pháp thuộc, ghi dấu nhiều phong trào đấu tranh cách mạng.', 'place', 'Kinh', 'Ban quản lý di tích tỉnh Đắk Lắk', 'TP. Buôn Ma Thuột, Đắk Lắk', NULL, 'published', NULL, 1, 0, 'CC-BY-4.0', '2026-11-05 02:38:04', '2026-11-05 02:43:39', 2, NULL, NULL),
(2, 'Di tích lịch sử đường Trường Sơn - Đường Hồ Chí Minh', 'Đường Trường Sơn - Đường Hồ Chí Minh là tuyến giao thông huyết mạch trong kháng chiến chống Mỹ, biểu tượng của ý chí thống nhất đất nước.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6PRqvIrjW6r-LLqo6_J2eebw_XN65wY6qdGgfINrwqg&s=10', '[\"\\u0111\\u01b0\\u1eddng tr\\u01b0\\u1eddng s\\u01a1n\",\"\\u0111\\u01b0\\u1eddng h\\u1ed3 ch\\u00ed minh\",\"di t\\u00edch l\\u1ecbch s\\u1eed\",\"kh\\u00e1ng chi\\u1ebfn ch\\u1ed1ng m\\u1ef9\"]', '[\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJPUnFUmd--2YZCraKCmffbzKVQJQX04R8EL8oxCQkxr2Xdu_8PEjXVTU&s=10\",\"https://daklakmuseum.vn/static/huyquansu/imgs/1599703190200552.jpg\",\"https://thegioidisan.vn/assets/media/2017/thang%207/duong-truong-son-2.jpg\"]', 'Đường Trường Sơn (đường Hồ Chí Minh) là hệ thống giao thông quân sự chiến lược chạy từ Bắc vào Nam, đi qua nhiều tỉnh thành trong đó có Đắk Lắk. Tuyến đường này đóng vai trò quan trọng trong việc vận chuyển lương thực, vũ khí và bộ đội từ miền Bắc chi viện cho miền Nam trong cuộc kháng chiến chống Mỹ cứu nước. Đoạn đường qua Đắk Lắk gắn liền với nhiều trận đánh lịch sử và sự hy sinh anh dũng của quân và dân ta. Di tích được xếp hạng Di tích lịch sử quốc gia đặc biệt.', 'Tuyến đường chi viện chiến lược Bắc - Nam trong kháng chiến chống Mỹ, gắn liền với nhiều chiến công hiển hách.', 'place', 'Nhiều dân tộc', 'Cựu chiến binh địa phương', 'Nhiều huyện, tỉnh Đắk Lắk', NULL, 'published', NULL, 1, 0, 'CC-BY-4.0', '2026-11-05 02:38:04', '2026-11-05 02:43:39', 2, NULL, NULL),
(3, 'Thác Thủy Tiên', 'Thác Thủy Tiên là danh lam thắng cảnh nổi tiếng với vẻ đẹp hoang sơ, thơ mộng, thu hút du khách đến với Đắk Lắk.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxl35MlOu-moY33HONtFVWrecehXE9nDHLJ5bdlTKbjA&s=10', '[\"th\\u00e1c th\\u1ee7y ti\\u00ean\",\"danh lam th\\u1eafng c\\u1ea3nh\",\"du l\\u1ecbch\",\"bu\\u00f4n ma thu\\u1ed9t\"]', '[\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM3FhafMfpIFmu0OoszwEiRX8xskCAHN1U45qTLsWqZQ&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcPHYxR1Yz_GGwhvi8EheGJ5umnlGAod2yfU7jDec3ew&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnBABYuETylRgds_UIIjnDHQosImJDM7uD-6JMx7mRSg&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSx2h2TDwp_DprlKY-7CvUuZJgp33rA0kZJ9Mp9a-lkQ&s=10\"]', 'Thác Thủy Tiên nằm cách trung tâm TP. Buôn Ma Thuột khoảng 5km về phía Tây Bắc, thuộc địa phận xã Ea Tu. Thác có dòng nước đổ từ độ cao khoảng 20m, tạo thành những bậc thang đá tự nhiên tuyệt đẹp. Xung quanh thác là rừng cây xanh mát, không khí trong lành. Đây là điểm du lịch sinh thái lý tưởng, thu hút đông đảo du khách trong và ngoài tỉnh. Thác Thủy Tiên đã được Bộ Văn hóa, Thể thao và Du lịch xếp hạng danh lam thắng cảnh cấp quốc gia.', 'Danh lam thắng cảnh cấp quốc gia, gắn với văn hóa du lịch sinh thái của Đắk Lắk.', 'place', 'Kinh', 'Hướng dẫn viên du lịch địa phương', 'TP. Buôn Ma Thuột, Đắk Lắk', NULL, 'published', NULL, 1, 0, 'CC-BY-4.0', '2026-11-05 02:38:04', '2026-11-05 02:43:39', 2, NULL, NULL),
(4, 'Đình Lạc Giao', 'Đình Lạc Giao là di tích lịch sử quốc gia, nơi thờ Thành hoàng và ghi dấu nhiều sự kiện cách mạng quan trọng của Đắk Lắk.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQED6gEdMB5GcgUBgBExxZHyFi8Nc846Q-ae8T_NBScKA&s=10', '[\"\\u0111\\u00ecnh l\\u1ea1c giao\",\"di t\\u00edch l\\u1ecbch s\\u1eed\",\"t\\u00edn ng\\u01b0\\u1ee1ng\",\"c\\u00e1ch m\\u1ea1ng\"]', '[\"https://media.vov.vn/sites/default/files/styles/large_watermark/public/2024-04/mot_goc_dinh_noi_co_goc_cay_da_do_dai_ta_y_blok_eban_trong_tu_nam_1990-min.jpg\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH4uoVM7sni5_RsNzzyvSqYVDwQ6NOnZI0ULt1q6I96_eYXtvVtLOisZA&s=10\",\"https://img.lsvn.vn/uploads/2020/02/chinh-dinh-lac-giao-van-con-luu-giu-duoc-nhung-vet-tich-cua-thoi-gian-1-5c26bf926606c.jpg\",\"https://daklakmuseum.vn/static/huyquansu/imgs/1591588428207693.jpg\"]', 'Đình Lạc Giao tọa lạc tại phường Thống Nhất, TP. Buôn Ma Thuột. Đình được xây dựng vào năm 1928 để thờ Thành hoàng làng, theo tín ngưỡng của người Việt di cư đến Đắk Lắk. Trong kháng chiến chống Pháp và chống Mỹ, đình Lạc Giao là nơi diễn ra nhiều cuộc họp bí mật của các chiến sĩ cách mạng, là cơ sở hoạt động của Đảng. Di tích đã được xếp hạng Di tích lịch sử quốc gia vào năm 1998.', 'Xây dựng năm 1928, là cơ sở hoạt động cách mạng bí mật, ghi dấu nhiều sự kiện lịch sử quan trọng.', 'place', 'Kinh', 'Ban quản lý di tích đình Lạc Giao', 'TP. Buôn Ma Thuột, Đắk Lắk', NULL, 'published', NULL, 1, 0, 'CC-BY-4.0', '2026-11-05 02:38:04', '2026-11-05 02:43:39', 2, NULL, NULL),
(5, 'Tháp Chăm Yang Prông', 'Tháp Chăm Yang Prông là di tích kiến trúc cổ duy nhất còn lại của người Chăm trên đất Đắk Lắk, mang giá trị văn hóa - lịch sử đặc biệt.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTdx7Su7SsfmKJs2xH_7cejy8QyJ8Vy1UXdIBuj2HLlUs07ENq-kUJkqax&s=10', '[\"th\\u00e1p ch\\u0103m\",\"yang pr\\u00f4ng\",\"ki\\u1ebfn tr\\u00fac c\\u1ed5\",\"v\\u0103n h\\u00f3a ch\\u0103m\",\"di t\\u00edch qu\\u1ed1c gia\"]', '[\"https://mia.vn/media/uploads/blog-du-lich/kham-pha-thap-cham-yang-prong-vo-cung-co-kinh-o-buon-ma-thuot-05-1652691051.jpg\",\"https://daklakmuseum.vn/static/huyquansu/imgs/1592363170735612.jpg\",\"https://cdn.xanhsm.com/2024/12/d61461ce-thap-cham-yang-prong-4.jpg\"]', 'Tháp Yang Prông nằm ở huyện Ea Súp, tỉnh Đắk Lắk, cách TP. Buôn Ma Thuột khoảng 100km về phía Tây Bắc. Tháp được xây dựng vào khoảng thế kỷ XIII - XIV, thờ thần Shiva theo tín ngưỡng Hindu giáo của người Chăm. Đây là ngôi tháp Chăm duy nhất còn lại trên địa bàn tỉnh Đắk Lắk, là minh chứng cho sự giao thoa văn hóa giữa người Chăm và các dân tộc Tây Nguyên. Tháp đã được xếp hạng Di tích kiến trúc nghệ thuật cấp quốc gia.', 'Tháp Chăm cổ từ thế kỷ XIII-XIV, thờ thần Shiva, là di sản văn hóa Chăm duy nhất tại Đắk Lắk.', 'place', 'Chăm', 'Người dân địa phương', 'Huyện Ea Súp, Đắk Lắk', NULL, 'published', NULL, 1, 0, 'CC-BY-4.0', '2026-11-05 02:38:04', '2026-11-05 02:43:39', 2, NULL, NULL),
(6, 'Di tích lịch sử Hang đá buôn Đăk Tuar', 'Hang đá buôn Đăk Tuar là di tích lịch sử gắn với phong trào đấu tranh của đồng bào dân tộc thiểu số chống thực dân Pháp.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp4m6mEe8T9Vzogrg48SLooejr-5Ozl0DfDWLKzuJJrg&s=10', '[\"hang \\u0111\\u00e1\",\"\\u0111\\u0103k tuar\",\"di t\\u00edch l\\u1ecbch s\\u1eed\",\"kh\\u00e1ng chi\\u1ebfn ch\\u1ed1ng ph\\u00e1p\",\"d\\u00e2n t\\u1ed9c thi\\u1ec3u s\\u1ed1\"]', '[\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBQMhtkqkxv2P3DVEZqSZXSPHXg7CQ0dVclUTmv5cScw&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs1lnabCsjvgyBzZUeNOQo21lB8CvGiG-cVKla7ALteQ&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTum0jG-z4ix5rMJHciqmC-zAs_ksp16LowP7iECFoCSA&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmhgde0d24_e8eYk_ujNDk9ji8YqHxh4YfhuS4MozS2Q&s=10\"]', 'Hang đá buôn Đăk Tuar nằm ở huyện Krông Nô (nay thuộc huyện Krông Nô, tỉnh Đắk Nông, giáp Đắk Lắk). Trong thời kỳ kháng chiến chống Pháp, hang đá này từng là nơi trú ẩn và hoạt động bí mật của các chiến sĩ cách mạng và đồng bào dân tộc thiểu số. Di tích ghi dấu tinh thần đoàn kết, ý chí kiên cường của đồng bào các dân tộc Tây Nguyên trong công cuộc bảo vệ quê hương. Đã được xếp hạng Di tích lịch sử cấp quốc gia.', 'Căn cứ cách mạng bí mật trong kháng chiến chống Pháp, gắn với đồng bào dân tộc thiểu số.', 'place', 'Ê Đê, M\'nông', 'Già làng buôn Đăk Tuar', 'Huyện Krông Nô, Đắk Lắk (giáp Đắk Nông)', NULL, 'published', NULL, 1, 0, 'CC-BY-4.0', '2026-11-05 02:38:04', '2026-11-05 02:43:39', 2, NULL, NULL),
(7, 'Hồ Lắk', 'Hồ Lắk là danh lam thắng cảnh quốc gia, hồ nước ngọt tự nhiên lớn thứ hai Việt Nam, gắn liền với văn hóa của người M\'nông.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH7cQoGfNdQtz1C4AN5Cu3zz6d08dfAYYTTRTfsWA-RA&s=10', '[\"h\\u1ed3 l\\u1eafk\",\"danh lam th\\u1eafng c\\u1ea3nh\",\"m\'n\\u00f4ng\",\"du l\\u1ecbch sinh th\\u00e1i\",\"c\\u1ed3ng chi\\u00eang\"]', '[\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ10315mOkuRu0ngkgUBkyuA9Mk0Ds1ntBEHgv5qCCO9A&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUI7Lblm3q6cEtGGN7OBC6xw9dDUgSSSa6A86GtGyQmQ&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUI7Lblm3q6cEtGGN7OBC6xw9dDUgSSSa6A86GtGyQmQ&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAxm10_TwykmiRsxnUPS516KjI6GCadIUmrerqv19hWw&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyKp7LCXDmrPP3qV1GtKHx6oyjvY2D3h_yZBKxUaIrxw&s=10\"]', 'Hồ Lắk nằm ở huyện Lắk, tỉnh Đắk Lắk, cách TP. Buôn Ma Thuột khoảng 56km về phía Nam. Đây là hồ nước ngọt tự nhiên lớn thứ hai Việt Nam (sau hồ Ba Bể), có diện tích mặt nước khoảng 6,2 km². Hồ Lắk không chỉ là danh lam thắng cảnh nổi tiếng mà còn gắn liền với đời sống văn hóa của đồng bào M\'nông. Xung quanh hồ có nhiều buôn làng truyền thống, du khách có thể trải nghiệm văn hóa cồng chiêng, ẩm thực địa phương. Hồ Lắk được xếp hạng Danh lam thắng cảnh cấp quốc gia.', 'Hồ tự nhiên lớn thứ hai Việt Nam, trung tâm văn hóa của người M\'nông, điểm du lịch sinh thái - văn hóa nổi tiếng.', 'place', 'M\'nông', 'Nghệ nhân văn hóa M\'nông', 'Huyện Lắk, Đắk Lắk', NULL, 'published', NULL, 1, 0, 'CC-BY-4.0', '2026-11-05 02:38:04', '2026-11-05 02:43:39', 2, NULL, NULL),
(8, 'Thác Dray Sáp Thượng', 'Thác Dray Sáp Thượng là danh lam thắng cảnh quốc gia, dòng thác hùng vĩ giữa đại ngàn Tây Nguyên.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSslloHZfRRT0bjmuSrMFhi0gjl6bzDHzIqI_7ieOQwYg&s=10', '[\"th\\u00e1c dray s\\u00e1p\",\"s\\u00ear\\u00eap\\u1ed1k\",\"danh lam th\\u1eafng c\\u1ea3nh\",\"du l\\u1ecbch sinh th\\u00e1i\",\"bu\\u00f4n \\u0111\\u00f4n\"]', '[\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4GmqIdnZekK5JJS-6Hct0XT7VPS0U45qRjemiRCchYg&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnl7NjSHg6ZEcQJUXGqRnEG7kDv9l5iGPpVkwrRAP2DA&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlls2RrNRP49k_QR4RmVsmhT6ik33GXJ9lrha91h7nXA&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1SKMhqXzKIhhMmLU3S-foZyUAwJvVvO1AmSg_KhQiwA&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThTH4RpRXYPLogzB4QMH6zmGreHVWjcCVyKoGub4z-tg&s=10\"]', 'Thác Dray Sáp Thượng nằm trên dòng sông Sêrêpốk, thuộc huyện Buôn Đôn, tỉnh Đắk Lắk. Thác có chiều cao khoảng 20m, dòng nước đổ ầm ầm quanh năm, tạo nên khung cảnh hùng vĩ giữa núi rừng Tây Nguyên. Xung quanh thác là hệ sinh thái rừng nhiệt đới phong phú. Đây là điểm du lịch mạo hiểm và sinh thái hấp dẫn du khách. Thác Dray Sáp Thượng đã được xếp hạng Danh lam thắng cảnh cấp quốc gia.', 'Danh lam thắng cảnh quốc gia trên dòng Sêrêpốk, biểu tượng thiên nhiên hùng vĩ của Đắk Lắk.', 'place', 'Kinh, Ê Đê', 'Hướng dẫn viên du lịch', 'Huyện Buôn Đôn, Đắk Lắk', NULL, 'published', NULL, 1, 0, 'CC-BY-4.0', '2026-11-05 02:38:04', '2026-11-05 02:43:39', 2, NULL, NULL),
(9, 'Di tích lịch sử Đồn điền CADA', 'Đồn điền CADA là di tích lịch sử quốc gia, ghi dấu phong trào đấu tranh của công nhân đồn điền chống thực dân Pháp.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS82SXFvQnPD8xb1nRUhm84eQ3WFsaNS0E9G_blYnWHuQ&s=10', '[\"\\u0111\\u1ed3n \\u0111i\\u1ec1n cada\",\"di t\\u00edch l\\u1ecbch s\\u1eed\",\"c\\u00f4ng nh\\u00e2n\",\"kh\\u00e1ng chi\\u1ebfn ch\\u1ed1ng ph\\u00e1p\",\"kr\\u00f4ng p\\u1eafc\"]', '[\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwrUmrms2US1Cl6wwVfU8eN1M73Po0Kjy_VwP68w9LGg&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKHSILiv_7hrVUSDfe2lm4OjSzW-4BtsjgVbWLQu5aFQ&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY6otHdD_fMPoWk0iEz7J3VwncZbDzWPl2XfNep5z_bw&s=10\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFBm8SbuXq1_lCvOuhzJLszFFmDgIAx0o9lkIETxVrPg&s=10\"]', 'Đồn điền CADA (Compagnie Agricole d\'Asie) được thực dân Pháp thành lập vào đầu thế kỷ XX tại huyện Krông Pắc, tỉnh Đắk Lắk, chuyên trồng cà phê, cao su. Đây là nơi diễn ra nhiều cuộc đấu tranh của công nhân đồn điền đòi quyền lợi, chống lại sự bóc lột của chủ nghĩa thực dân. Di tích là minh chứng cho tinh thần đấu tranh giai cấp và ý thức cách mạng của giai cấp công nhân Đắk Lắk. Đã được xếp hạng Di tích lịch sử cấp quốc gia.', 'Đồn điền do Pháp lập đầu thế kỷ XX, nơi diễn ra phong trào đấu tranh của công nhân cao su, cà phê.', 'place', 'Kinh', 'Cựu công nhân đồn điền', 'Huyện Krông Pắc, Đắk Lắk', NULL, 'published', NULL, 1, 0, 'CC-BY-4.0', '2026-11-05 02:38:04', '2026-11-05 02:43:39', 2, NULL, NULL),
(10, 'Khu căn cứ kháng chiến tỉnh Đắk Lắk (1965-1975)', 'Khu căn cứ kháng chiến tỉnh Đắk Lắk là di tích lịch sử quốc gia, căn cứ địa cách mạng quan trọng trong kháng chiến chống Mỹ.', 'https://images.vietnamtourism.gov.vn/vn//images/2022/thang_9/2609.dak-lak1.jpg', '[\"c\\u0103n c\\u1ee9 kh\\u00e1ng chi\\u1ebfn\",\"di t\\u00edch l\\u1ecbch s\\u1eed\",\"kh\\u00e1ng chi\\u1ebfn ch\\u1ed1ng m\\u1ef9\",\"kr\\u00f4ng b\\u00f4ng\",\"t\\u1ec9nh \\u1ee7y\"]', '[\"https://images.vietnamtourism.gov.vn/vn//images/2022/thang_9/2609.dak-lak2.jpg\", \"https://vhttdl.daklak.gov.vn/Upload/Images/L%C3%A2m/khu%20can%20cu%20khang%20chien.jpg\",\"https://vhttdl.daklak.gov.vn/Upload/Images/L%C3%A2m/cancukc.jpg\",\"https://daklakmuseum.vn/baotangdaklak/imgs/175247742002881.jpeg\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqfLnHx78DgHBuG51lMN24Srlo-3P3oumucfTycjL-IDoKyu3UveajBT0d&s=10\"]', 'Khu căn cứ kháng chiến tỉnh Đắk Lắk (1965-1975) nằm ở huyện Krông Bông, tỉnh Đắk Lắk. Đây là căn cứ địa cách mạng của Tỉnh ủy Đắk Lắk trong những năm tháng ác liệt của cuộc kháng chiến chống Mỹ cứu nước. Khu căn cứ bao gồm hệ thống hầm hào, công sự, nhà làm việc, được xây dựng bí mật trong rừng sâu. Nơi đây đã chứng kiến nhiều cuộc họp quan trọng, chỉ đạo phong trào cách mạng của tỉnh. Di tích được xếp hạng Di tích lịch sử cấp quốc gia.', 'Căn cứ địa của Tỉnh ủy Đắk Lắk trong kháng chiến chống Mỹ, giai đoạn 1965-1975.', 'place', 'Nhiều dân tộc', 'Cựu chiến binh, nhân chứng lịch sử', 'Huyện Krông Bông, Đắk Lắk', NULL, 'published', NULL, 1, 0, 'CC-BY-4.0', '2026-11-05 02:38:05', '2026-11-05 02:43:39', 2, NULL, NULL),
(11, 'Lễ hội Cồng chiêng Tây Nguyên - Di sản văn hóa thế giới', 'Không gian văn hóa Cồng chiêng là di sản phi vật thể đại diện của nhân loại, gắn liền với đời sống tâm linh và các nghi lễ truyền thống của đồng bào dân tộc Tây Nguyên.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwNaqnKfEVPL1wSQ1gBsOL4qHl56hh7r0omPlC-czz8g&s=10', '[\"c\\u1ed3ng chi\\u00eang\",\"l\\u1ec5 h\\u1ed9i\",\"t\\u00e2y nguy\\u00ean\",\"unesco\",\"\\u00ea \\u0111\\u00ea\",\"v\\u0103n h\\u00f3a phi v\\u1eadt th\\u1ec3\"]', '[\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcQ2hHDYApzROQ_oZrNA-LUcf_CFsy2KwiZ05M-84reZlQ&s=10\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcQ1nIY3CZ36Scod5e8bx35TAlJFQLyLlOhkfKw_SQ3zAg&s=10\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcSvaW0LExW29VCHGVsMA2x-C9wD23ZB2YibXB927w07KA&s=10\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcQnWrYeZcTjOMraw15dWwnEdkiYbVlybSA3997qTxu0qQ&s=10\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcQpRUeEeV7mIkjfXvshyo709WUiykFFcufvvFclE29vKA&s=10\"]', 'Lễ hội Cồng chiêng thường được tổ chức trong các dịp lễ trọng đại của buôn làng như mừng lúa mới, cúng cơm mới, mừng nhà mới, cưới hỏi... Tiếng cồng chiêng đối với người Ê Đê, M\'nông không chỉ là nhạc cụ mà còn là phương tiện giao tiếp với thần linh. Mỗi bộ cồng chiêng có từ 3 đến 12 chiếc, được đánh theo những nhịp điệu đặc trưng, kết hợp với các điệu múa xoang uyển chuyển của các chàng trai, cô gái. Trong không gian lễ hội, tiếng chiêng vang vọng giữa núi rừng tạo nên một bầu không khí linh thiêng và kết nối cộng đồng mạnh mẽ.', 'UNESCO công nhận \"Không gian văn hóa Cồng chiêng Tây Nguyên\" là Kiệt tác di sản truyền khẩu và phi vật thể của nhân loại (năm 2005) và Di sản văn hóa phi vật thể đại diện của nhân loại (năm 2008).', 'festival', 'Ê Đê, M\'nông, Gia Rai', 'Nghệ nhân ưu tú Ama H\'Wing', 'TP. Buôn Ma Thuột, Đắk Lắk', NULL, 'published', NULL, 1, 1, 'CC-BY-4.0', '2026-11-05 05:50:04', '2026-11-05 05:59:24', 1, NULL, NULL),
(12, 'Khu căn cứ kháng chiến tỉnh Đắk Lắk (1965-1975)', '\"Khu căn cứ kháng chiến tỉnh Đắk Lắk là di tích lịch sử quốc gia, căn cứ địa cách mạng quan trọng trong kháng chiến chống Mỹ.\"', NULL, NULL, '[]', 'Khu căn cứ kháng chiến tỉnh Đắk Lắk (1965-1975) nằm ở huyện Krông Bông, tỉnh Đắk Lắk. Đây là căn cứ địa cách mạng của Tỉnh ủy Đắk Lắk trong những năm tháng ác liệt của cuộc kháng chiến chống Mỹ cứu nước. Khu căn cứ bao gồm hệ thống hầm hào, công sự, nhà làm việc, được xây dựng bí mật trong rừng sâu. Nơi đây đã chứng kiến nhiều cuộc họp quan trọng, chỉ đạo phong trào cách mạng của tỉnh. Di tích được xếp hạng Di tích lịch sử cấp quốc gia.', NULL, 'festival', NULL, NULL, NULL, NULL, 'returned', NULL, 1, 0, 'CC-BY-4.0', '2026-11-05 06:00:52', '2026-11-05 06:18:32', 1, NULL, NULL),
(13, 'Cơm Lam', 'Cơm lam là một đặc sản ẩm thực độc đáo của đồng bào các dân tộc vùng cao phía Bắc và Tây Nguyên. Món ăn vừa là biểu tượng cho nét văn hóa ẩm thực mộc mạc gắn liền với đời sống nương rẫy, vừa phản ánh sự sáng tạo, tinh tế của con người trong việc tận dụng nguồn nguyên liệu tự nhiên của núi rừng.', 'https://vnn.1cdn.vn/2026/06/30/com-lam-1.jpg', NULL, '[\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTLLDETjmnMtkjZkzdE1qvpuuag0TKZ5FtWs-RgXDbTPEbQ_NjnBqilPcd&s=10\",\"https:\\/\\/vietfood.org.vn\\/wp-content\\/uploads\\/2022\\/03\\/comlam2.jpg\",\"https:\\/\\/cdnv2.tgdd.vn\\/mwg-static\\/common\\/Common\\/nksdjfkjasejfasjefoasj.jpg\",\"https:\\/\\/kenh14cdn.com\\/203336854389633024\\/2022\\/10\\/26\\/photo-14-16667750630331752049144.jpeg\"]', '1. Minh chứng cho sự sáng tạo và nét văn hóa nương rẫy độc đáo\r\n- Phương pháp chế biến tinh tế từ tự nhiên: Xuất phát từ những chuyến đi rừng, làm nương rẫy dài ngày của người dân bản địa, cơm lam ra đời bằng cách cho gạo nếp ngâm vào ống tre, nứa tươi rồi nướng chín trực tiếp trên than hồng. Sự kết hợp này giúp lưu giữ trọn vẹn hương vị tự nhiên mà không cần đến nồi niêu phức tạp.\r\n- Biểu tượng của tinh thần gắn kết gia đình và bản làng: Đêm bên bếp lửa hồng nướng cơm lam không chỉ là công đoạn nấu nướng, mà còn là không gian sinh hoạt cộng đồng, nơi gia đình và dân làng quây quần, trò chuyện và truyền lại những câu chuyện văn hóa đời đời.\r\n\r\n2. Minh chứng cho hương vị ẩm thực núi rừng đậm đà, khó quên\r\n- Sự hòa quyện tuyệt vời của hương vị: Khi chín, lớp vỏ tre bên ngoài được gọt bóc khéo léo để lộ lớp màng lụa mỏng ôm trọn lấy ruột cơm nếp dẻo thơm. Hạt cơm thấm đượm vị ngọt mát thanh khiết của ống tre tươi hòa cùng hương thơm bùi lỏng lẻo của gạo nếp nương.\r\n- Phong cách thưởng thức giản dị mà tinh tế: Cơm lam thường được cắt thành từng khúc nhỏ, ăn kèm với muối vừng (mè), muối lạc hoặc các món thịt lợn mán, gà nướng nương. Sự kết hợp giản dị này mang lại hương vị đậm đà, quyến rũ, để lại ấn tượng sâu sắc cho bất kỳ ai từng thưởng thức.', 'Cơm lam bắt nguồn từ tập quán canh tác nương rẫy và các chuyến đi rừng dài ngày của người dân vùng cao. Trong điều kiện thiếu thốn dụng cụ nấu nướng, người dân đã tận dụng những ống tre, ống nứa sẵn có trong tự nhiên cùng nguồn nước suối thanh mát để nấu chín hạt gạo nếp nương. Trải qua thời gian, cơm lam không chỉ dừng lại là một món ăn sinh tồn mộc mạc mà đã trở thành biểu tượng ẩm thực truyền thống mang đậm nét tinh tế và bản sắc văn hóa độc đáo của các dân tộc Tây Nguyên và Tây Bắc.', 'cuisine', 'Ê Đê, Ba Na, M\'nông, Gia Rai, Thái, H\'Mông', NULL, 'Tây Nguyên', NULL, 'published', NULL, 1, 1, 'CC-BY-4.0', '2026-11-09 00:06:40', '2026-11-09 00:07:52', 1, NULL, NULL),
(14, 'Truyền thuyết Hồ Lắk: Giấc mộng khổng lồ và lời nguyền chìm đáy nước', 'Câu chuyện dân gian kỳ bí gắn liền với hồ nước tự nhiên lớn nhất Tây Nguyên tại Đắk Lắk. Từ một giấc mơ khổng lồ và những toan tính giấu kín của con người, vùng đất trù phú xưa đã chìm sâu dưới làn nước xanh thẳm, để lại nhiều huyền thoại uẩn khúc lưu truyền qua các thế hệ.', 'https://cdn3.ivivu.com/2022/10/h%E1%BB%93-lak-ivivu-5.jpg', '[\"truy\\u1ec1n thuy\\u1ebft h\\u1ed3 l\\u1eafk\",\"\\u0111\\u1eafk l\\u1eafk\",\"chuy\\u1ec7n k\\u1ec3 k\\u1ef3 b\\u00ed\",\"v\\u0103n h\\u00f3a d\\u00e2n gian\",\"m\'n\\u00f4ng\",\"t\\u00e2y nguy\\u00ean\"]', '[\"https:\\/\\/storage.googleapis.com\\/blogvxr-uploads\\/2026\\/04\\/645b5319-khu-du-lich-ho-lak-7996386-1250x715.jpg\",\"https:\\/\\/daklakmuseum.vn\\/static\\/huyquansu\\/imgs\\/1592361516695721.jpg\",\"https:\\/\\/encrypted-tbn0.gstatic.com\\/images?q=tbn:ANd9GcRc8huOT0ucoaDbCpa1IQFiup_Ml7y3-K34ddkf1RaGDQ&s=10\",\"https:\\/\\/cdn3.ivivu.com\\/2022\\/10\\/h%E1%BB%93-l%C4%83k1.jpg\"]', 'Xưa kia, tại vùng đất thuộc huyện Lắk (Đắk Lắk) ngày nay từng tồn tại một buôn làng trù phú và yên bình. Theo lời kể dân gian, có một người đàn ông khổng lồ nằm mơ thấy điềm báo lạ về sự biến đổi của đất trời nên đã kể lại cho dân làng nghe và dặn dò cách phòng tránh.\r\n\r\nTuy nhiên, trước những lời cảnh báo ấy, không phải ai cũng giữ lòng thành thật hay làm theo đúng lời dặn. Có những toan tính ích kỷ, sự chủ quan và những điều giấu kín sau hậu trường của một vài người trong cộng đồng khiến sự việc rẽ sang hướng bi kịch. Khi biến cố xảy ra, cơn mưa lớn kéo dài dữ dội khiến cả vùng đất rộng lớn sụt lún, nước dâng ngập trắng xóa, biến buôn làng xưa thành mặt hồ Lắk mênh mông, sâu thẳm.\r\n\r\nTừ đó, mặt nước phẳng lặng nhưng đầy bí ẩn của Hồ Lắk luôn gợi lên những câu chuyện truyền miệng rờn rợn và chiêm nghiệm về nhân – quả, sự tôn kính thiên nhiên và những góc khuất lòng người.', 'Truyền thuyết về sự hình thành Hồ Lắk là một phần trong kho tàng văn hóa dân gian đặc sắc của cộng đồng các dân tộc bản địa Tây Nguyên, đặc biệt là người M\'nông tại Đắk Lắk. Thông qua những yếu tố kỳ ảo như giấc mộng báo trước, thiên tai và sự sụp đổ của một buôn làng, câu chuyện gửi gắm bài học đạo đức sâu sắc: con người phải sống thuận hòa với núi rừng, giữ chữ tín, tránh lòng tham và sự dối trá nếu không muốn phải trả giá trước sức mạnh của thiên nhiên và thần linh.', 'story', 'M\'nông, Ê-đê', 'Già làng', 'Hồ Lắk, Đắk Lắk', NULL, 'published', NULL, 1, 1, 'CC-BY-4.0', '2026-11-21 20:37:23', '2026-11-21 20:40:11', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_11_04_034450_create_contributions_table', 2),
(5, '2026_11_05_091332_update_contributions_table_for_details', 3),
(6, '2026_11_05_093007_add_role_to_users_table', 4),
(7, '2026_11_05_093738_add_user_id_to_contributions_table', 5),
(8, '2026_11_05_121940_create_chatbot_faqs_table', 6),
(9, '2026_11_05_123251_add_ai_check_to_contributions_table', 7),
(10, '2026_11_05_131724_add_ai_duplicate_to_contributions_table', 8),
(11, '2026_11_08_000000_widen_contribution_text_columns', 9),
(12, '2026_11_20_080742_add_reject_reason_to_contributions_table', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('hSHY23njRGmeCShuUN8KXZTI3ucAAiKNG8O93PbD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.147.0 Chrome/150.0.7871.250 Electron/43.8.9 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaU1ubUZRa2l6NGhhaDFDMjA5SzkzcjNnWDlqNUFKdGVmdmM1bXpaUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1795317051),
('KT2GU2orYhaWjmPcdk0sUGs3ox1kAuIiGBBb3PaY', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/158.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiTDhpYTJhRVBPamZwTzJkRkVzZnNPZERWR1dJeTBtb2xScFduZ0gxdSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6IjA5N2YzYzRjM2ZhMWI4NjE1MmIzNTRkZWEyYjQ4ZmJkYWNhN2Y5NjJlMTZkOTEyZmQ3MmRiMmFiMmY1MjQ3MDEiO30=', 1795319020),
('pvDfhJmgYEB1NRLw3ewoX1gb5Vb6bJidTouP8Exo', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/158.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUnJNeHEwY0o4c3liSnA1YzMybG12Slo4MkZVaXdaQWE0Sk5JNkp2bSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiNWY5NjQzNmFjMGY1NjNhZjBlMGQzNzFhYzZiZDIzZjg4ZDM2MjVhNTVhYmEyNGUzMTA0YjE5ZDM1Yzk3MzBkYyI7fQ==', 1795321132);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'member',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Phạm Đắc Thanh', 'dacthanh@gmail.com', NULL, '$2y$12$HwyfEzs/ogWTzARZOlvEredSgWfIE9Iv1xMK3WZ08Ey7DJJ4w2ym6', 'member', NULL, '2026-11-05 02:30:25', '2026-11-05 02:30:25'),
(2, 'Quản trị viên', 'admin@daklak.vn', NULL, '$2y$12$xAUg3X5I61RP0muFWMHihOcPbpSWoJnzonOYQc758Is4k0Qv8/3P.', 'admin', NULL, '2026-11-05 02:36:56', '2026-11-21 20:10:36');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Chỉ mục cho bảng `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Chỉ mục cho bảng `chatbot_faqs`
--
ALTER TABLE `chatbot_faqs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chatbot_faqs_question_unique` (`question`);

--
-- Chỉ mục cho bảng `contributions`
--
ALTER TABLE `contributions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contributions_user_id_foreign` (`user_id`),
  ADD KEY `contributions_duplicate_of_id_foreign` (`duplicate_of_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chatbot_faqs`
--
ALTER TABLE `chatbot_faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `contributions`
--
ALTER TABLE `contributions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `contributions`
--
ALTER TABLE `contributions`
  ADD CONSTRAINT `contributions_duplicate_of_id_foreign` FOREIGN KEY (`duplicate_of_id`) REFERENCES `contributions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `contributions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Cơ sở dữ liệu: `doc_analyse_db`
--
CREATE DATABASE IF NOT EXISTS `doc_analyse_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `doc_analyse_db`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `scan_history`
--

CREATE TABLE `scan_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `risk_level` enum('safe','warning','danger') NOT NULL,
  `total_links` int(11) DEFAULT 0,
  `suspicious_links` int(11) DEFAULT 0,
  `hidden_codes` int(11) DEFAULT 0,
  `scan_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `scan_history`
--

INSERT INTO `scan_history` (`id`, `user_id`, `file_name`, `file_type`, `risk_level`, `total_links`, `suspicious_links`, `hidden_codes`, `scan_date`) VALUES
(1, 1, 'test link.txt', 'txt', 'safe', 1, 0, 0, '2026-10-18 09:37:19'),
(2, 1, 'test link.txt', 'txt', 'danger', 1, 0, 1, '2026-10-18 09:38:45'),
(3, 1, 'malware.xlsx', 'xlsx', 'safe', 0, 0, 0, '2026-10-18 10:01:19'),
(4, 1, 'malware-macro.xlsm', 'xlsm', 'safe', 0, 0, 0, '2026-10-18 10:03:17'),
(5, 1, 'malware-macro.xlsm', 'xlsm', 'safe', 0, 0, 0, '2026-10-18 10:04:43'),
(6, 1, 'malware-macro.xlsm', 'xlsm', 'safe', 0, 0, 0, '2026-10-18 10:05:20'),
(7, 1, 'malware-macro.xlsm', 'xlsm', 'safe', 0, 0, 0, '2026-10-18 10:05:55'),
(8, 1, 'malware-macro.xlsm', 'xlsm', 'safe', 1, 0, 0, '2026-10-18 10:09:31'),
(9, 1, 'malware-macro.xlsm', 'xlsm', 'danger', 1, 0, 1, '2026-10-18 10:10:49'),
(10, 1, 'malware-macro.xlsm', 'xlsm', 'danger', 1, 0, 1, '2026-10-18 10:13:45'),
(11, 1, 'malware-macro.xlsm', 'xlsm', 'danger', 1, 0, 2, '2026-10-18 10:15:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(1, 'Em Thanh', 'dacthanh0605@gmail.com', '$2y$10$/z.V8iAIx1AhJ.CTd9N0f.YdskOTr./6cz2h3ZH18Go2Qlna518Yi', '2026-10-18 03:03:45');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `scan_history`
--
ALTER TABLE `scan_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `scan_history`
--
ALTER TABLE `scan_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `scan_history`
--
ALTER TABLE `scan_history`
  ADD CONSTRAINT `scan_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Cơ sở dữ liệu: `lich`
--
CREATE DATABASE IF NOT EXISTS `lich` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lich`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `review` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `notes`
--

INSERT INTO `notes` (`id`, `title`, `content`, `date`, `created_at`, `status`, `review`) VALUES
(1, 'Ăn dầm nằm dề', 'Không làm gì', '2026-10-02', '2026-10-01 09:26:12', 'pending', NULL),
(4, 'Đọc sách', '11h30 - 13h00', '2026-10-13', '2026-10-13 05:41:05', 'partial', 'Đọc thì trời mưa nên tạm nghỉ'),
(5, 'Nấu cơm', '16h30 - 18h00', '2026-10-13', '2026-10-13 05:56:26', 'done', ''),
(6, 'Đi thực hành', '13h31\nĐi thực hành cô Giang', '2026-10-14', '2026-10-14 09:02:55', 'done', ''),
(7, 'Edit video', '18h00\nEdit video Footy POV', '2026-10-14', '2026-10-14 09:03:34', 'done', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Cơ sở dữ liệu: `ltdnt-30`
--
CREATE DATABASE IF NOT EXISTS `ltdnt-30` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ltdnt-30`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Rau củ quả', 'Rau, củ, trái cây tươi', '2026-10-05 07:11:50'),
(2, 'Thịt - Trứng', 'Thịt heo, bò, gà và trứng', '2026-10-05 07:11:50'),
(3, 'Hải sản', 'Cá, tôm, mực tươi sống', '2026-10-05 07:11:50'),
(4, 'Đồ khô - Gia vị', 'Gạo, nấm, gia vị, nông sản khô', '2026-10-05 07:11:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `image` varchar(500) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `category_id`, `stock`, `created_at`) VALUES
(1, 'Táo Fuji nhập khẩu', 'Táo Fuji giòn ngọt, giàu vitamin, nhập khẩu New Zealand.', 45000.00, 'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb?w=400', 1, 100, '2026-10-05 07:34:33'),
(2, 'Chuối già Nam Mỹ', 'Chuối chín tự nhiên, ngọt dịu, tốt cho tiêu hóa.', 25000.00, 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=400', 1, 80, '2026-10-05 07:34:33'),
(3, 'Cà chua bi Đà Lạt', 'Cà chua bi tươi ngon, giàu lycopene.', 30000.00, 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?w=400', 1, 60, '2026-10-05 07:34:33'),
(4, 'Thịt ba chỉ heo', 'Thịt ba chỉ heo tươi, phù hợp nấu canh, kho.', 120000.00, 'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?w=400', 2, 40, '2026-10-05 07:34:33'),
(5, 'Trứng gà ta', 'Trứng gà ta thả vườn, vỏ hồng tự nhiên.', 35000.00, 'https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?w=400', 2, 200, '2026-10-05 07:34:33'),
(6, 'Tôm sú tươi', 'Tôm sú tươi sống, chắc thịt, size 30 con/kg.', 320000.00, 'https://images.unsplash.com/photo-1565680018434-b513d5e5fd47?w=400', 3, 25, '2026-10-05 07:34:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `phone` varchar(15) DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `role`, `phone`, `blocked`, `created_at`) VALUES
(5, 'Em Thanh', 'dacthanh0605@gmail.com', '$2a$10$xPYTuagc0iZGAXzraI.63ubWPbzspzLfkkTdewvVCSmM.Ghku.TNm', 'admin', NULL, 0, '2026-10-05 08:49:22'),
(6, 'Thanh', 'thanh@gmail.com', '$2a$10$.CIi7400MvhuR5STMj4aOOlv14B3qrYcRWPfogyfQY223H8ekIbQa', 'user', NULL, 0, '2026-10-05 08:55:51');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;
--
-- Cơ sở dữ liệu: `ltdnt-group`
--
CREATE DATABASE IF NOT EXISTS `ltdnt-group` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ltdnt-group`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `conversations`
--

CREATE TABLE `conversations` (
  `id` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `productId` varchar(191) DEFAULT NULL,
  `orderId` varchar(191) DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `conversations`
--

INSERT INTO `conversations` (`id`, `userId`, `productId`, `orderId`, `subject`, `createdAt`, `updatedAt`) VALUES
('ef21a20e-e95a-4d25-b2ee-63427a35a12a', '626482d4-e3e6-4844-bf8a-d0161b1992c9', NULL, NULL, 'Tài khoản GPT', '2026-09-14 07:57:39.626', '2026-10-01 08:51:48.710');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` varchar(191) NOT NULL,
  `conversationId` varchar(191) NOT NULL,
  `senderRole` enum('USER','ADMIN') NOT NULL,
  `senderUserId` varchar(191) DEFAULT NULL,
  `content` text NOT NULL,
  `isRead` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `conversationId`, `senderRole`, `senderUserId`, `content`, `isRead`, `createdAt`) VALUES
('8fe95396-46c2-4054-8242-2a72e6c39763', 'ef21a20e-e95a-4d25-b2ee-63427a35a12a', 'ADMIN', NULL, 'không em', 1, '2026-10-01 08:51:01.112'),
('e647c23f-9482-496e-9850-a0d6794ba686', 'ef21a20e-e95a-4d25-b2ee-63427a35a12a', 'USER', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 'có tài khoản GPT plus ko shop', 1, '2026-09-14 07:57:39.626'),
('fd8b73ba-0e60-46fc-a3d3-b159c08f9eda', 'ef21a20e-e95a-4d25-b2ee-63427a35a12a', 'USER', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 'ok', 1, '2026-10-01 08:51:48.715');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `totalAmount` decimal(12,0) NOT NULL,
  `status` enum('PENDING','PAID','DELIVERED','CANCELLED') NOT NULL DEFAULT 'PENDING',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `userId`, `totalAmount`, `status`, `createdAt`, `updatedAt`) VALUES
('42f7e2db-3e2f-417d-b7b4-e2d78498cb84', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 49000, 'DELIVERED', '2026-10-01 09:34:05.972', '2026-10-01 09:34:06.028'),
('bdd8aeab-1610-449e-8401-cd0414749d52', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 49000, 'DELIVERED', '2026-10-03 03:55:12.426', '2026-10-03 03:55:12.559');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` varchar(191) NOT NULL,
  `orderId` varchar(191) NOT NULL,
  `productId` varchar(191) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitPrice` decimal(12,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `orderId`, `productId`, `quantity`, `unitPrice`) VALUES
('34319b14-39dc-4cc0-93a8-b9dcf8bb0207', 'bdd8aeab-1610-449e-8401-cd0414749d52', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 1, 49000),
('f7870f1b-7c39-4fe6-91eb-f505eb6a4d8a', '42f7e2db-3e2f-417d-b7b4-e2d78498cb84', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 1, 49000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` varchar(191) NOT NULL,
  `orderId` varchar(191) NOT NULL,
  `method` enum('MOMO','WALLET') NOT NULL,
  `status` enum('PENDING','SUCCESS','FAILED') NOT NULL DEFAULT 'PENDING',
  `transactionId` varchar(191) DEFAULT NULL,
  `rawResponse` longtext DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payments`
--

INSERT INTO `payments` (`id`, `orderId`, `method`, `status`, `transactionId`, `rawResponse`, `createdAt`, `updatedAt`) VALUES
('a4407b5e-718d-4519-9455-8fd2bbac8c24', 'bdd8aeab-1610-449e-8401-cd0414749d52', 'WALLET', 'SUCCESS', NULL, NULL, '2026-10-03 03:55:12.426', '2026-10-03 03:55:12.426'),
('b4dd949a-9f48-4227-9e5c-fc43d8aa38db', '42f7e2db-3e2f-417d-b7b4-e2d78498cb84', 'WALLET', 'SUCCESS', NULL, NULL, '2026-10-01 09:34:05.972', '2026-10-01 09:34:05.972');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(12,0) NOT NULL,
  `category` varchar(191) DEFAULT NULL,
  `imageUrl` varchar(191) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category`, `imageUrl`, `stock`, `isActive`, `createdAt`, `updatedAt`) VALUES
('5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'Canva Pro 1 tháng', 'Tài khoản Canva Pro dùng riêng, đầy đủ tính năng premium', 49000, 'Canva Pro', 'https://kelasjuara.id/wp-content/uploads/2025/12/Screenshot-2025-04-18-232844.png', 18, 1, '2026-09-11 17:20:06.063', '2026-10-03 03:55:12.556'),
('5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'Canva Pro 1 năm', 'Tài khoản Canva Pro dùng riêng, hiệu lực 12 tháng', 399000, 'Canva Pro', NULL, 10, 1, '2026-09-11 17:20:06.063', '2026-09-11 17:20:06.000'),
('5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'ChatGPT Plus 1 tháng', 'Tài khoản ChatGPT Plus, không giới hạn GPT-4', 250000, 'Tài khoản', NULL, 15, 1, '2026-09-11 17:20:06.063', '2026-09-11 17:20:06.000'),
('5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'CapCut Pro 1 tháng', 'Tài khoản CapCut Pro chỉnh video không watermark', 79000, 'Tool', NULL, 30, 1, '2026-09-11 17:20:06.063', '2026-09-11 17:20:06.000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_accounts`
--

CREATE TABLE `product_accounts` (
  `id` varchar(191) NOT NULL,
  `productId` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `note` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_accounts`
--

INSERT INTO `product_accounts` (`id`, `productId`, `username`, `password`, `note`, `createdAt`) VALUES
('99fad2c8-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.003@demo.local', 'Demo@003Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad2d2-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.004@demo.local', 'Demo@004Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad2db-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.005@demo.local', 'Demo@005Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad2e4-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.006@demo.local', 'Demo@006Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad306-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.007@demo.local', 'Demo@007Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad310-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.008@demo.local', 'Demo@008Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad319-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.009@demo.local', 'Demo@009Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad321-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.010@demo.local', 'Demo@010Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad32c-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.011@demo.local', 'Demo@011Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad335-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.012@demo.local', 'Demo@012Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad33e-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.013@demo.local', 'Demo@013Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad348-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.014@demo.local', 'Demo@014Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad351-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.015@demo.local', 'Demo@015Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad35a-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.016@demo.local', 'Demo@016Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad363-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.017@demo.local', 'Demo@017Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad36c-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.018@demo.local', 'Demo@018Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad376-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.019@demo.local', 'Demo@019Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('99fad37e-bd7a-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.020@demo.local', 'Demo@020Cv1m', 'Tài khoản demo', '2026-10-01 09:29:29.216'),
('9a002365-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.001@demo.local', 'Demo@001Cv1y', 'Tài khoản demo', '2026-10-01 09:29:29.255'),
('9a002399-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.002@demo.local', 'Demo@002Cv1y', 'Tài khoản demo', '2026-10-01 09:29:29.255'),
('9a0023a5-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.003@demo.local', 'Demo@003Cv1y', 'Tài khoản demo', '2026-10-01 09:29:29.255'),
('9a0023af-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.004@demo.local', 'Demo@004Cv1y', 'Tài khoản demo', '2026-10-01 09:29:29.255'),
('9a0023b8-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.005@demo.local', 'Demo@005Cv1y', 'Tài khoản demo', '2026-10-01 09:29:29.255'),
('9a0023c2-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.006@demo.local', 'Demo@006Cv1y', 'Tài khoản demo', '2026-10-01 09:29:29.255'),
('9a0023e5-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.007@demo.local', 'Demo@007Cv1y', 'Tài khoản demo', '2026-10-01 09:29:29.255'),
('9a0023ef-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.008@demo.local', 'Demo@008Cv1y', 'Tài khoản demo', '2026-10-01 09:29:29.255'),
('9a0023f8-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.009@demo.local', 'Demo@009Cv1y', 'Tài khoản demo', '2026-10-01 09:29:29.255'),
('9a002401-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.010@demo.local', 'Demo@010Cv1y', 'Tài khoản demo', '2026-10-01 09:29:29.255'),
('9a0673f6-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.001@demo.local', 'Demo@001Gpt', 'Tài khoản demo', '2026-10-01 09:29:29.296'),
('9a067448-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.002@demo.local', 'Demo@002Gpt', 'Tài khoản demo', '2026-10-01 09:29:29.296'),
('9a067464-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.003@demo.local', 'Demo@003Gpt', 'Tài khoản demo', '2026-10-01 09:29:29.296'),
('9a06747e-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.004@demo.local', 'Demo@004Gpt', 'Tài khoản demo', '2026-10-01 09:29:29.296'),
('9a067497-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.005@demo.local', 'Demo@005Gpt', 'Tài khoản demo', '2026-10-01 09:29:29.296'),
('9a0674af-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.006@demo.local', 'Demo@006Gpt', 'Tài khoản demo', '2026-10-01 09:29:29.296'),
('9a0674eb-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.007@demo.local', 'Demo@007Gpt', 'Tài khoản demo', '2026-10-01 09:29:29.296'),
('9a067505-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.008@demo.local', 'Demo@008Gpt', 'Tài khoản demo', '2026-10-01 09:29:29.296'),
('9a06751e-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.009@demo.local', 'Demo@009Gpt', 'Tài khoản demo', '2026-10-01 09:29:29.296'),
('9a067535-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.010@demo.local', 'Demo@010Gpt', 'Tài khoản demo', '2026-10-01 09:29:29.296'),
('9a06754f-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.011@demo.local', 'Demo@011Gpt', 'Tài khoản demo', '2026-10-01 09:29:29.296'),
('9a067567-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.012@demo.local', 'Demo@012Gpt', 'Tài khoản demo', '2026-10-01 09:29:29.296'),
('9a067580-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.013@demo.local', 'Demo@013Gpt', 'Tài khoản demo', '2026-10-01 09:29:29.296'),
('9a06759a-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.014@demo.local', 'Demo@014Gpt', 'Tài khoản demo', '2026-10-01 09:29:29.296'),
('9a0675b2-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.015@demo.local', 'Demo@015Gpt', 'Tài khoản demo', '2026-10-01 09:29:29.296'),
('9a0dff04-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.001@demo.local', 'Demo@001Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0dff55-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.002@demo.local', 'Demo@002Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0dff71-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.003@demo.local', 'Demo@003Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0dff8c-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.004@demo.local', 'Demo@004Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0dffa3-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.005@demo.local', 'Demo@005Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0dffbd-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.006@demo.local', 'Demo@006Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0dfffd-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.007@demo.local', 'Demo@007Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e0016-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.008@demo.local', 'Demo@008Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e0030-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.009@demo.local', 'Demo@009Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e0049-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.010@demo.local', 'Demo@010Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e0066-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.011@demo.local', 'Demo@011Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e007f-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.012@demo.local', 'Demo@012Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e0097-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.013@demo.local', 'Demo@013Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e00b1-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.014@demo.local', 'Demo@014Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e00ca-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.015@demo.local', 'Demo@015Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e00e3-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.016@demo.local', 'Demo@016Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e00fc-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.017@demo.local', 'Demo@017Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e0116-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.018@demo.local', 'Demo@018Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e012f-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.019@demo.local', 'Demo@019Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e014a-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.020@demo.local', 'Demo@020Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e0164-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.021@demo.local', 'Demo@021Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e017e-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.022@demo.local', 'Demo@022Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e01ba-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.023@demo.local', 'Demo@023Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e01d4-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.024@demo.local', 'Demo@024Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e01ee-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.025@demo.local', 'Demo@025Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e0206-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.026@demo.local', 'Demo@026Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e021e-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.027@demo.local', 'Demo@027Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e0237-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.028@demo.local', 'Demo@028Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e0250-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.029@demo.local', 'Demo@029Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345'),
('9a0e026a-bd7a-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.030@demo.local', 'Demo@030Cc', 'Tài khoản demo', '2026-10-01 09:29:29.345');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `purchase_history`
--

CREATE TABLE `purchase_history` (
  `id` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `orderId` varchar(191) DEFAULT NULL,
  `productId` varchar(191) NOT NULL,
  `productName` varchar(191) NOT NULL,
  `accountUsername` varchar(191) NOT NULL,
  `accountPassword` varchar(191) NOT NULL,
  `accountNote` varchar(191) DEFAULT NULL,
  `unitPrice` decimal(12,0) NOT NULL,
  `purchasedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `expiresAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` varchar(191) NOT NULL,
  `fullName` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `passwordHash` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
  `walletBalance` decimal(12,0) NOT NULL DEFAULT 0,
  `address` text DEFAULT NULL,
  `role` enum('ADMIN','BUYER') NOT NULL DEFAULT 'BUYER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `fullName`, `email`, `passwordHash`, `createdAt`, `updatedAt`, `walletBalance`, `address`, `role`) VALUES
('626482d4-e3e6-4844-bf8a-d0161b1992c9', 'Trần Anh Tuấn', 'trananhtuan222@gmail.com', '$2a$10$wSkx9IRSvmXzODwWM17tZOBQVNBuDi0HB8yS0XKYqIhdFao0fnvwS', '2026-09-13 05:12:29.823', '2026-10-20 09:09:24.128', 152000, NULL, 'BUYER'),
('73d54169-9161-45f1-8479-18f280f856f1', 'Em Thanh', 'thanhtrick2k5@gmail.com', '$2a$10$WzWgvkgJK5bS3mcHvrz75erWOPaLtJwzeyK9ffbmx2e4xVhql1F4W', '2026-09-11 11:42:02.521', '2026-09-14 14:53:25.535', 0, NULL, 'ADMIN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `type` enum('TOPUP','PURCHASE','REFUND') NOT NULL,
  `status` enum('PENDING','SUCCESS','FAILED') NOT NULL DEFAULT 'PENDING',
  `amount` decimal(12,0) NOT NULL,
  `balanceAfter` decimal(12,0) DEFAULT NULL,
  `orderId` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `transactionId` varchar(191) DEFAULT NULL,
  `rawResponse` longtext DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `wallet_transactions`
--

INSERT INTO `wallet_transactions` (`id`, `userId`, `type`, `status`, `amount`, `balanceAfter`, `orderId`, `description`, `transactionId`, `rawResponse`, `createdAt`, `updatedAt`) VALUES
('184f3ab5-6cfb-48a2-a047-fcc5ba373fae', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 'PURCHASE', 'SUCCESS', 49000, 51000, '42f7e2db-3e2f-417d-b7b4-e2d78498cb84', 'Thanh toán đơn hàng #42f7e2db', NULL, NULL, '2026-10-01 09:34:05.990', '2026-10-01 09:34:05.990'),
('2489317c-23d5-40cd-8857-71500f70f1f3', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 'TOPUP', 'FAILED', 50000, NULL, NULL, 'Nạp tiền vào ví qua VNPAY', NULL, NULL, '2026-10-20 08:43:49.462', '2026-10-20 09:03:53.705'),
('418750d1-c359-4117-8125-84c43fa269df', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 'TOPUP', 'FAILED', 100000, NULL, NULL, 'Nạp tiền vào ví qua MoMo', NULL, NULL, '2026-10-04 10:05:25.435', '2026-10-20 08:40:49.812'),
('55b6d9eb-6ff8-46c4-9883-4eacb2c4339c', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 'TOPUP', 'FAILED', 50000, NULL, NULL, 'Nạp tiền vào ví qua VNPAY', NULL, NULL, '2026-10-20 08:48:01.569', '2026-10-20 09:08:03.975'),
('80b1849d-863c-4ecd-a06d-515297e91af0', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 'TOPUP', 'FAILED', 100000, NULL, NULL, 'Nạp tiền vào ví qua VNPAY', NULL, NULL, '2026-10-20 08:43:41.352', '2026-10-20 09:03:43.723'),
('8d54abb0-b877-4bc6-853a-0f21c2ee15a7', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 'TOPUP', 'SUCCESS', 50000, 152000, NULL, 'Nạp tiền vào ví qua VNPAY', '15709598', '{\"vnp_Amount\":\"5000000\",\"vnp_BankCode\":\"NCB\",\"vnp_BankTranNo\":\"VNP15709598\",\"vnp_CardType\":\"ATM\",\"vnp_OrderInfo\":\"Nap vi 8d54abb0b8774bc6853a0f21c2ee15a7\",\"vnp_PayDate\":\"20261020160917\",\"vnp_ResponseCode\":\"00\",\"vnp_TmnCode\":\"OABI8X2Q\",\"vnp_TransactionNo\":\"15709598\",\"vnp_TransactionStatus\":\"00\",\"vnp_TxnRef\":\"8d54abb0b8774bc6853a0f21c2ee15a7\",\"vnp_SecureHash\":\"538c981add33bcba970c6ae74adce624dc12fcd715233aaf8f48b08aa24e70729c192c025a57cd9265206db424f480263fff733f4f1c2dc9f09745e9a48e5b30\"}', '2026-10-20 09:05:39.994', '2026-10-20 09:09:24.171'),
('9893b6fe-a7bc-4e83-bf61-8bed8307f83a', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 'TOPUP', 'SUCCESS', 100000, 102000, NULL, 'Nạp tiền vào ví qua MoMo', 'DEV-1791108343264', '{\"dev\":true}', '2026-10-04 10:05:43.065', '2026-10-04 10:05:43.307'),
('c70131ad-a9e5-470a-ba2f-75a7cea43f08', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 'TOPUP', 'SUCCESS', 100000, 100000, NULL, 'Nạp tiền vào ví qua MoMo', 'DEV-1790847233133', '{\"dev\":true}', '2026-10-01 09:33:53.106', '2026-10-01 09:33:53.152'),
('e6ac48fc-da39-477b-b4fa-03bbe9126321', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 'TOPUP', 'FAILED', 50000, NULL, NULL, 'Nạp tiền vào ví qua VNPAY', NULL, NULL, '2026-10-20 08:46:36.850', '2026-10-20 09:06:38.955'),
('e99f89d2-d2be-40bc-b59a-4b172357c35e', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 'PURCHASE', 'SUCCESS', 49000, 2000, 'bdd8aeab-1610-449e-8401-cd0414749d52', 'Thanh toán đơn hàng #bdd8aeab', NULL, NULL, '2026-10-03 03:55:12.530', '2026-10-03 03:55:12.530'),
('ea723b3d-aa12-4842-9d66-cf1cdf1fecc4', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 'TOPUP', 'FAILED', 50000, NULL, NULL, 'Nạp tiền vào ví qua VNPAY', NULL, NULL, '2026-10-20 08:46:49.768', '2026-10-20 09:06:53.928');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversations_userId_idx` (`userId`),
  ADD KEY `conversations_productId_idx` (`productId`),
  ADD KEY `conversations_orderId_idx` (`orderId`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_conversationId_idx` (`conversationId`),
  ADD KEY `messages_senderUserId_idx` (`senderUserId`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_userId_idx` (`userId`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_orderId_idx` (`orderId`),
  ADD KEY `order_items_productId_idx` (`productId`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_orderId_key` (`orderId`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_accounts`
--
ALTER TABLE `product_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_accounts_productId_idx` (`productId`);

--
-- Chỉ mục cho bảng `purchase_history`
--
ALTER TABLE `purchase_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_history_userId_idx` (`userId`),
  ADD KEY `purchase_history_orderId_idx` (`orderId`),
  ADD KEY `purchase_history_expiresAt_idx` (`expiresAt`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_key` (`email`);

--
-- Chỉ mục cho bảng `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_transactions_userId_idx` (`userId`),
  ADD KEY `wallet_transactions_orderId_idx` (`orderId`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `product_accounts`
--
ALTER TABLE `product_accounts`
  ADD CONSTRAINT `product_accounts_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `purchase_history`
--
ALTER TABLE `purchase_history`
  ADD CONSTRAINT `purchase_history_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `purchase_history_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD CONSTRAINT `wallet_transactions_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `wallet_transactions_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);
--
-- Cơ sở dữ liệu: `nhom8_ltdnt`
--
CREATE DATABASE IF NOT EXISTS `nhom8_ltdnt` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `nhom8_ltdnt`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` varchar(191) NOT NULL,
  `fullName` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `passwordHash` varchar(191) NOT NULL,
  `role` enum('ADMIN','BUYER') NOT NULL DEFAULT 'BUYER',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `fullName`, `email`, `passwordHash`, `role`, `createdAt`, `updatedAt`) VALUES
('33520f81-045b-4e3b-bca1-a698030bf7a2', 'Nguyễn C', '123@123.com', '$2a$10$HhF0Z1J5FAU8Fr9xUmhMu.DPNFsmprokYWtZIakrVZP68OOHs5Cy.', 'BUYER', '2026-09-29 08:21:55.552', '2026-09-29 08:21:55.552'),
('4a0b2d3c-e7c2-47da-8932-d94cafbbf055', 'Em Thanh', 'dacthanh0605@gmail.com', '$2a$10$p4HdMQnA.55h8CbwbIQrsOmam3QZNJWfAqyACiEyoH6eJ1POHrVyi', 'BUYER', '2026-09-29 07:41:17.863', '2026-09-29 07:41:17.863');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_key` (`email`);
--
-- Cơ sở dữ liệu: `nvdhd`
--
CREATE DATABASE IF NOT EXISTS `nvdhd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `nvdhd`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cau_hoi`
--

CREATE TABLE `cau_hoi` (
  `id` int(11) NOT NULL,
  `id_tieu_chi` int(11) NOT NULL,
  `noi_dung` text NOT NULL,
  `thu_tu` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cau_hoi`
--

INSERT INTO `cau_hoi` (`id`, `id_tieu_chi`, `noi_dung`, `thu_tu`) VALUES
(13, 1, 'Bạn có thể tìm kiếm tài liệu học tập hoặc nghiên cứu bằng các từ khóa phù hợp trên Internet.', 1),
(14, 1, 'Bạn biết cách đánh giá độ tin cậy của nguồn thông tin trước khi sử dụng.', 2),
(15, 1, 'Bạn có khả năng phân loại và lưu trữ tài liệu số một cách khoa học để dễ dàng tìm lại.', 3),
(16, 1, 'Bạn biết cách sử dụng các công cụ tìm kiếm học thuật (Google Scholar, IEEE, ScienceDirect,...).', 4),
(17, 1, 'Bạn biết cách trích dẫn và sử dụng thông tin đúng quy định, tránh đạo văn.', 5),
(18, 2, 'Bạn thường xuyên sử dụng email, LMS hoặc các nền tảng trực tuyến để trao đổi học tập.', 1),
(19, 2, 'Bạn có thể làm việc nhóm hiệu quả bằng các công cụ như Google Drive, Microsoft Teams hoặc các nền tảng tương tự.', 2),
(20, 2, 'Bạn tuân thủ các quy tắc ứng xử văn minh khi giao tiếp trên môi trường số.', 3),
(21, 2, 'Bạn có thể chia sẻ tài liệu số cho người khác một cách thuận tiện và đúng quyền truy cập.', 4),
(22, 2, 'Bạn chủ động sử dụng các công cụ số để phối hợp và hoàn thành công việc nhóm.', 5),
(23, 3, 'Bạn có thể tạo các tài liệu số (Word, PowerPoint, Excel...) phục vụ học tập.', 1),
(24, 3, 'Bạn có khả năng thiết kế hoặc chỉnh sửa hình ảnh, video hoặc infographic cơ bản.', 2),
(25, 3, 'Bạn biết sử dụng các công cụ AI hoặc phần mềm hỗ trợ để nâng cao chất lượng sản phẩm học tập.', 3),
(26, 3, 'Bạn tôn trọng bản quyền khi sử dụng hình ảnh, tài liệu hoặc phần mềm trên Internet.', 4),
(27, 3, 'Bạn có thể tạo ra sản phẩm số phục vụ học tập hoặc nghiên cứu theo yêu cầu.', 5),
(28, 4, 'Bạn sử dụng mật khẩu mạnh và thay đổi mật khẩu khi cần thiết.', 1),
(29, 4, 'Bạn biết cách bảo vệ thông tin cá nhân trên môi trường số.', 2),
(30, 4, 'Bạn có thể nhận biết các nguy cơ như lừa đảo trực tuyến, email giả mạo hoặc phần mềm độc hại.', 3),
(31, 4, 'Bạn sử dụng công nghệ và trí tuệ nhân tạo (AI) một cách trung thực và có trách nhiệm.', 4),
(32, 4, 'Bạn hiểu và tuân thủ các quy định về quyền riêng tư và bảo mật dữ liệu.', 5),
(33, 5, 'Bạn có thể lựa chọn công cụ số phù hợp để giải quyết nhiệm vụ học tập.', 1),
(34, 5, 'Khi gặp sự cố kỹ thuật đơn giản, bạn có thể tự tìm cách khắc phục.', 2),
(35, 5, 'Bạn sẵn sàng học và sử dụng các công nghệ mới khi cần thiết.', 3),
(36, 5, 'Bạn biết cách kết hợp nhiều công cụ số để nâng cao hiệu quả công việc.', 4),
(37, 5, 'Bạn có thể ứng dụng công nghệ để giải quyết các bài toán thực tế trong học tập hoặc nghiên cứu.', 5),
(38, 6, 'Bạn thường xuyên sử dụng công nghệ số để hỗ trợ học tập.', 1),
(39, 6, 'Bạn biết sử dụng các công cụ AI (ChatGPT, Copilot, Gemini...) để hỗ trợ học tập và nghiên cứu một cách phù hợp.', 2),
(40, 6, 'Bạn sử dụng các phần mềm chuyên ngành phục vụ lĩnh vực học tập của mình.', 3),
(41, 6, 'Bạn chủ động cập nhật các công nghệ mới nhằm nâng cao năng lực nghề nghiệp.', 4),
(42, 6, 'Bạn tin rằng năng lực số hiện tại đáp ứng tương đối tốt yêu cầu học tập và công việc trong tương lai.', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `conversations`
--

CREATE TABLE `conversations` (
  `id` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `productId` varchar(191) DEFAULT NULL,
  `orderId` varchar(191) DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `conversations`
--

INSERT INTO `conversations` (`id`, `userId`, `productId`, `orderId`, `subject`, `createdAt`, `updatedAt`) VALUES
('ef21a20e-e95a-4d25-b2ee-63427a35a12a', '626482d4-e3e6-4844-bf8a-d0161b1992c9', NULL, NULL, 'Tài khoản GPT', '2026-09-14 07:57:39.626', '2026-09-14 07:57:39.626');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ket_qua_tieu_chi`
--

CREATE TABLE `ket_qua_tieu_chi` (
  `id` int(11) NOT NULL,
  `id_nguoi_khao_sat` int(11) NOT NULL,
  `id_tieu_chi` int(11) NOT NULL,
  `diem_tieu_chi` decimal(5,2) NOT NULL DEFAULT 0.00,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ket_qua_tieu_chi`
--

INSERT INTO `ket_qua_tieu_chi` (`id`, `id_nguoi_khao_sat`, `id_tieu_chi`, `diem_tieu_chi`, `created_at`) VALUES
(36, 12, 1, 5.00, '2026-08-05 21:00:31'),
(37, 12, 2, 4.20, '2026-08-05 21:00:37'),
(38, 12, 3, 4.20, '2026-08-05 21:00:42'),
(39, 12, 4, 5.00, '2026-08-05 21:00:48'),
(40, 12, 5, 3.60, '2026-08-05 21:00:53'),
(41, 12, 6, 3.40, '2026-08-05 21:00:59'),
(42, 14, 1, 4.40, '2026-08-05 21:56:19'),
(43, 14, 2, 4.80, '2026-08-05 21:56:24'),
(44, 14, 3, 3.60, '2026-08-05 21:56:29'),
(45, 14, 4, 3.40, '2026-08-05 21:56:34'),
(46, 14, 5, 3.80, '2026-08-05 21:56:39'),
(47, 14, 6, 3.80, '2026-08-05 21:56:50'),
(48, 13, 1, 4.60, '2026-08-05 21:58:56'),
(49, 13, 2, 3.40, '2026-08-05 21:59:02'),
(50, 13, 3, 5.00, '2026-08-05 21:59:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoa`
--

CREATE TABLE `khoa` (
  `id` int(11) NOT NULL,
  `ten_khoa` varchar(100) NOT NULL,
  `thu_tu` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khoa`
--

INSERT INTO `khoa` (`id`, `ten_khoa`, `thu_tu`) VALUES
(1, 'K20 Trở về trước', 1),
(2, 'K21', 2),
(3, 'K22', 3),
(4, 'K23', 4),
(5, 'K24', 5),
(6, 'K25', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` varchar(191) NOT NULL,
  `conversationId` varchar(191) NOT NULL,
  `senderRole` enum('USER','ADMIN') NOT NULL,
  `senderUserId` varchar(191) DEFAULT NULL,
  `content` text NOT NULL,
  `isRead` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `conversationId`, `senderRole`, `senderUserId`, `content`, `isRead`, `createdAt`) VALUES
('e647c23f-9482-496e-9850-a0d6794ba686', 'ef21a20e-e95a-4d25-b2ee-63427a35a12a', 'USER', '626482d4-e3e6-4844-bf8a-d0161b1992c9', 'có tài khoản GPT plus ko shop', 0, '2026-09-14 07:57:39.626');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_khao_sat`
--

CREATE TABLE `nguoi_khao_sat` (
  `id` int(11) NOT NULL,
  `ho_ten` varchar(150) NOT NULL,
  `email_sdt` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `id_khoa` int(11) DEFAULT NULL,
  `lop` varchar(150) NOT NULL,
  `da_hoan_thanh` tinyint(1) NOT NULL DEFAULT 0,
  `diem_tong_dms` decimal(5,2) DEFAULT 0.00,
  `created_at` datetime DEFAULT current_timestamp(),
  `completed_at` datetime DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoi_khao_sat`
--

INSERT INTO `nguoi_khao_sat` (`id`, `ho_ten`, `email_sdt`, `password`, `role`, `id_khoa`, `lop`, `da_hoan_thanh`, `diem_tong_dms`, `created_at`, `completed_at`, `password_hash`) VALUES
(11, 'Administrator', 'admin@ttn.edu.vn', 'admin123', 'admin', 1, 'Khoa CNTT', 0, 0.00, '2026-08-05 20:16:07', NULL, NULL),
(12, 'Phạm Đắc Thanh', '23103115@sv.ttn.edu.vn', '$2y$10$wA8tZepRrRQ0WXHGnyTATeQfeqkwgcsAsklGHpvp4Iv1Y59seQMny', 'user', 4, 'CNTT K23', 1, 4.23, '2026-08-05 20:58:23', '2026-08-05 21:00:59', NULL),
(13, 'Trần Văn A', 'dacthanh0605@gmail.com', '$2y$10$xH7NAiH9i.KwFbytK3kRFuU3/34xw3QpNPbIMPclvEQ1hOFPdeOp6', 'user', 1, 'Thú Y', 0, 0.00, '2026-08-05 21:32:19', NULL, NULL),
(14, 'Trần Văn B', 'tester01@gmail.com', '$2y$10$SunNY8jf5oVTTT/4roWv.uOM8jE2sSZXD.ng44B8LOJjs3.0D88GG', 'user', 1, 'Thú Y', 1, 3.97, '2026-08-05 21:56:10', '2026-08-05 21:56:50', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `totalAmount` decimal(12,0) NOT NULL,
  `status` enum('PENDING','PAID','DELIVERED','CANCELLED') NOT NULL DEFAULT 'PENDING',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` varchar(191) NOT NULL,
  `orderId` varchar(191) NOT NULL,
  `productId` varchar(191) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitPrice` decimal(12,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` varchar(191) NOT NULL,
  `orderId` varchar(191) NOT NULL,
  `method` enum('MOMO') NOT NULL,
  `status` enum('PENDING','SUCCESS','FAILED') NOT NULL DEFAULT 'PENDING',
  `transactionId` varchar(191) DEFAULT NULL,
  `rawResponse` longtext DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(12,0) NOT NULL,
  `category` varchar(191) DEFAULT NULL,
  `imageUrl` varchar(191) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category`, `imageUrl`, `stock`, `isActive`, `createdAt`, `updatedAt`) VALUES
('5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'Canva Pro 1 tháng', 'Tài khoản Canva Pro dùng riêng, đầy đủ tính năng premium', 49000, 'Canva Pro', 'https://kelasjuara.id/wp-content/uploads/2025/12/Screenshot-2025-04-18-232844.png', 20, 1, '2026-09-11 17:20:06.063', '2026-09-12 15:55:25.505'),
('5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'Canva Pro 1 năm', 'Tài khoản Canva Pro dùng riêng, hiệu lực 12 tháng', 399000, 'Canva Pro', NULL, 10, 1, '2026-09-11 17:20:06.063', '2026-09-11 17:20:06.000'),
('5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'ChatGPT Plus 1 tháng', 'Tài khoản ChatGPT Plus, không giới hạn GPT-4', 250000, 'Tài khoản', NULL, 15, 1, '2026-09-11 17:20:06.063', '2026-09-11 17:20:06.000'),
('5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'CapCut Pro 1 tháng', 'Tài khoản CapCut Pro chỉnh video không watermark', 79000, 'Tool', NULL, 30, 1, '2026-09-11 17:20:06.063', '2026-09-11 17:20:06.000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_accounts`
--

CREATE TABLE `product_accounts` (
  `id` varchar(191) NOT NULL,
  `productId` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `note` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_accounts`
--

INSERT INTO `product_accounts` (`id`, `productId`, `username`, `password`, `note`, `createdAt`) VALUES
('0adaa478-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.001@demo.local', 'Demo@001Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa4ef-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.002@demo.local', 'Demo@002Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa4fd-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.003@demo.local', 'Demo@003Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa507-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.004@demo.local', 'Demo@004Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa6e6-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.005@demo.local', 'Demo@005Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa6f1-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.006@demo.local', 'Demo@006Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa6fa-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.007@demo.local', 'Demo@007Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa704-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.008@demo.local', 'Demo@008Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa70d-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.009@demo.local', 'Demo@009Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa716-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.010@demo.local', 'Demo@010Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa721-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.011@demo.local', 'Demo@011Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa72b-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.012@demo.local', 'Demo@012Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa734-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.013@demo.local', 'Demo@013Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa73d-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.014@demo.local', 'Demo@014Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa747-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.015@demo.local', 'Demo@015Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa750-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.016@demo.local', 'Demo@016Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa759-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.017@demo.local', 'Demo@017Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa762-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.018@demo.local', 'Demo@018Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa76b-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.019@demo.local', 'Demo@019Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adaa775-bd75-11f1-8d70-2c4d54c30ca8', '5bd29faf-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1m.020@demo.local', 'Demo@020Cv1m', 'Tài khoản demo', '2026-10-01 08:49:41.607'),
('0adf9eba-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.001@demo.local', 'Demo@001Cv1y', 'Tài khoản demo', '2026-10-01 08:49:41.643'),
('0adfa04d-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.002@demo.local', 'Demo@002Cv1y', 'Tài khoản demo', '2026-10-01 08:49:41.643'),
('0adfa146-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.003@demo.local', 'Demo@003Cv1y', 'Tài khoản demo', '2026-10-01 08:49:41.643'),
('0adfa16a-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.004@demo.local', 'Demo@004Cv1y', 'Tài khoản demo', '2026-10-01 08:49:41.643'),
('0adfa1bc-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.005@demo.local', 'Demo@005Cv1y', 'Tài khoản demo', '2026-10-01 08:49:41.643'),
('0adfa1da-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.006@demo.local', 'Demo@006Cv1y', 'Tài khoản demo', '2026-10-01 08:49:41.643'),
('0adfa1ff-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.007@demo.local', 'Demo@007Cv1y', 'Tài khoản demo', '2026-10-01 08:49:41.643'),
('0adfa21f-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.008@demo.local', 'Demo@008Cv1y', 'Tài khoản demo', '2026-10-01 08:49:41.643'),
('0adfa245-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.009@demo.local', 'Demo@009Cv1y', 'Tài khoản demo', '2026-10-01 08:49:41.643'),
('0adfa260-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b1ed-adca-11f1-9aef-2c4d54c30ca8', 'canvapro1y.010@demo.local', 'Demo@010Cv1y', 'Tài khoản demo', '2026-10-01 08:49:41.643'),
('0ae4d958-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.001@demo.local', 'Demo@001Gpt', 'Tài khoản demo', '2026-10-01 08:49:41.678'),
('0ae4d990-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.002@demo.local', 'Demo@002Gpt', 'Tài khoản demo', '2026-10-01 08:49:41.678'),
('0ae4d9a1-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.003@demo.local', 'Demo@003Gpt', 'Tài khoản demo', '2026-10-01 08:49:41.678'),
('0ae4d9b0-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.004@demo.local', 'Demo@004Gpt', 'Tài khoản demo', '2026-10-01 08:49:41.678'),
('0ae4d9be-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.005@demo.local', 'Demo@005Gpt', 'Tài khoản demo', '2026-10-01 08:49:41.678'),
('0ae4d9e7-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.006@demo.local', 'Demo@006Gpt', 'Tài khoản demo', '2026-10-01 08:49:41.678'),
('0ae4d9f6-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.007@demo.local', 'Demo@007Gpt', 'Tài khoản demo', '2026-10-01 08:49:41.678'),
('0ae4da04-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.008@demo.local', 'Demo@008Gpt', 'Tài khoản demo', '2026-10-01 08:49:41.678'),
('0ae4da12-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.009@demo.local', 'Demo@009Gpt', 'Tài khoản demo', '2026-10-01 08:49:41.678'),
('0ae4da1f-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.010@demo.local', 'Demo@010Gpt', 'Tài khoản demo', '2026-10-01 08:49:41.678'),
('0ae4da2e-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.011@demo.local', 'Demo@011Gpt', 'Tài khoản demo', '2026-10-01 08:49:41.678'),
('0ae4da3c-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.012@demo.local', 'Demo@012Gpt', 'Tài khoản demo', '2026-10-01 08:49:41.678'),
('0ae4da4b-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.013@demo.local', 'Demo@013Gpt', 'Tài khoản demo', '2026-10-01 08:49:41.678'),
('0ae4da59-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.014@demo.local', 'Demo@014Gpt', 'Tài khoản demo', '2026-10-01 08:49:41.678'),
('0ae4da67-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b320-adca-11f1-9aef-2c4d54c30ca8', 'gptplus.015@demo.local', 'Demo@015Gpt', 'Tài khoản demo', '2026-10-01 08:49:41.678'),
('0ae8b4c9-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.001@demo.local', 'Demo@001Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b500-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.002@demo.local', 'Demo@002Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b510-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.003@demo.local', 'Demo@003Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b51f-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.004@demo.local', 'Demo@004Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b52e-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.005@demo.local', 'Demo@005Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b557-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.006@demo.local', 'Demo@006Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b567-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.007@demo.local', 'Demo@007Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b575-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.008@demo.local', 'Demo@008Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b583-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.009@demo.local', 'Demo@009Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b592-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.010@demo.local', 'Demo@010Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b5a1-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.011@demo.local', 'Demo@011Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b5af-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.012@demo.local', 'Demo@012Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b5be-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.013@demo.local', 'Demo@013Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b5cc-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.014@demo.local', 'Demo@014Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b5dc-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.015@demo.local', 'Demo@015Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b5ea-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.016@demo.local', 'Demo@016Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b5f8-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.017@demo.local', 'Demo@017Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b607-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.018@demo.local', 'Demo@018Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b615-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.019@demo.local', 'Demo@019Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b623-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.020@demo.local', 'Demo@020Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b631-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.021@demo.local', 'Demo@021Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b65b-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.022@demo.local', 'Demo@022Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b66a-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.023@demo.local', 'Demo@023Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b679-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.024@demo.local', 'Demo@024Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b687-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.025@demo.local', 'Demo@025Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b695-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.026@demo.local', 'Demo@026Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b6a4-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.027@demo.local', 'Demo@027Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b6b2-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.028@demo.local', 'Demo@028Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b6c0-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.029@demo.local', 'Demo@029Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703'),
('0ae8b6cf-bd75-11f1-8d70-2c4d54c30ca8', '5bd2b3ac-adca-11f1-9aef-2c4d54c30ca8', 'capcutpro.030@demo.local', 'Demo@030Cc', 'Tài khoản demo', '2026-10-01 08:49:41.703');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `purchase_history`
--

CREATE TABLE `purchase_history` (
  `id` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `orderId` varchar(191) DEFAULT NULL,
  `productId` varchar(191) NOT NULL,
  `productName` varchar(191) NOT NULL,
  `accountUsername` varchar(191) NOT NULL,
  `accountPassword` varchar(191) NOT NULL,
  `accountNote` varchar(191) DEFAULT NULL,
  `unitPrice` decimal(12,0) NOT NULL,
  `purchasedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `expiresAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tieu_chi`
--

CREATE TABLE `tieu_chi` (
  `id` int(11) NOT NULL,
  `ten_tieu_chi` varchar(200) NOT NULL,
  `icon` varchar(50) DEFAULT 'fa-circle-exclamation',
  `thu_tu` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tieu_chi`
--

INSERT INTO `tieu_chi` (`id`, `ten_tieu_chi`, `icon`, `thu_tu`) VALUES
(1, 'Trụ cột 1 - THÔNG TIN VÀ DỮ LIỆU SỐ', 'fa-circle-exclamation', 1),
(2, 'Trụ cột 2 - GIAO TIẾP VÀ HỢP TÁC SỐ', 'fa-circle-exclamation', 2),
(3, 'Trụ cột 3 - SÁNG TẠO NỘI DUNG SỐ', 'fa-circle-exclamation', 3),
(4, 'Trụ cột 4 - AN TOÀN VÀ ĐẠO ĐỨC SỐ', 'fa-circle-exclamation', 4),
(5, 'Trụ cột 5 - GIẢI QUYẾT VẤN ĐỀ BẰNG CÔNG NGHỆ', 'fa-circle-exclamation', 5),
(6, 'Trụ cột 6 - CÔNG NGHỆ SỐ TRONG HỌC TẬP, NGHIÊN CỨU VÀ NGHỀ NGHIỆP', 'fa-circle-exclamation', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` varchar(191) NOT NULL,
  `fullName` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `passwordHash` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
  `walletBalance` decimal(12,0) NOT NULL DEFAULT 0,
  `address` text DEFAULT NULL,
  `role` enum('ADMIN','BUYER') NOT NULL DEFAULT 'BUYER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `fullName`, `email`, `passwordHash`, `createdAt`, `updatedAt`, `walletBalance`, `address`, `role`) VALUES
('626482d4-e3e6-4844-bf8a-d0161b1992c9', 'Trần Anh Tuấn', 'trananhtuan222@gmail.com', '$2a$10$wSkx9IRSvmXzODwWM17tZOBQVNBuDi0HB8yS0XKYqIhdFao0fnvwS', '2026-09-13 05:12:29.823', '2026-09-13 05:12:29.823', 0, NULL, 'BUYER'),
('73d54169-9161-45f1-8479-18f280f856f1', 'Em Thanh', 'thanhtrick2k5@gmail.com', '$2a$10$WzWgvkgJK5bS3mcHvrz75erWOPaLtJwzeyK9ffbmx2e4xVhql1F4W', '2026-09-11 11:42:02.521', '2026-09-14 14:53:25.535', 0, NULL, 'ADMIN');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cau_hoi`
--
ALTER TABLE `cau_hoi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tieu_chi` (`id_tieu_chi`);

--
-- Chỉ mục cho bảng `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversations_userId_idx` (`userId`),
  ADD KEY `conversations_productId_idx` (`productId`),
  ADD KEY `conversations_orderId_idx` (`orderId`);

--
-- Chỉ mục cho bảng `ket_qua_tieu_chi`
--
ALTER TABLE `ket_qua_tieu_chi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_nguoi_tieuchi` (`id_nguoi_khao_sat`,`id_tieu_chi`),
  ADD KEY `fk_kq_tieuchi` (`id_tieu_chi`);

--
-- Chỉ mục cho bảng `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_conversationId_idx` (`conversationId`),
  ADD KEY `messages_senderUserId_idx` (`senderUserId`);

--
-- Chỉ mục cho bảng `nguoi_khao_sat`
--
ALTER TABLE `nguoi_khao_sat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_sdt` (`email_sdt`),
  ADD KEY `id_khoa` (`id_khoa`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_userId_idx` (`userId`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_orderId_idx` (`orderId`),
  ADD KEY `order_items_productId_idx` (`productId`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_orderId_key` (`orderId`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_accounts`
--
ALTER TABLE `product_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_accounts_productId_idx` (`productId`);

--
-- Chỉ mục cho bảng `purchase_history`
--
ALTER TABLE `purchase_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_history_userId_idx` (`userId`),
  ADD KEY `purchase_history_orderId_idx` (`orderId`),
  ADD KEY `purchase_history_expiresAt_idx` (`expiresAt`);

--
-- Chỉ mục cho bảng `tieu_chi`
--
ALTER TABLE `tieu_chi`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_key` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cau_hoi`
--
ALTER TABLE `cau_hoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `ket_qua_tieu_chi`
--
ALTER TABLE `ket_qua_tieu_chi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `khoa`
--
ALTER TABLE `khoa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `nguoi_khao_sat`
--
ALTER TABLE `nguoi_khao_sat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `tieu_chi`
--
ALTER TABLE `tieu_chi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cau_hoi`
--
ALTER TABLE `cau_hoi`
  ADD CONSTRAINT `cau_hoi_ibfk_1` FOREIGN KEY (`id_tieu_chi`) REFERENCES `tieu_chi` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `ket_qua_tieu_chi`
--
ALTER TABLE `ket_qua_tieu_chi`
  ADD CONSTRAINT `fk_kq_nguoi` FOREIGN KEY (`id_nguoi_khao_sat`) REFERENCES `nguoi_khao_sat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_kq_tieuchi` FOREIGN KEY (`id_tieu_chi`) REFERENCES `tieu_chi` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `nguoi_khao_sat`
--
ALTER TABLE `nguoi_khao_sat`
  ADD CONSTRAINT `nguoi_khao_sat_ibfk_1` FOREIGN KEY (`id_khoa`) REFERENCES `khoa` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `product_accounts`
--
ALTER TABLE `product_accounts`
  ADD CONSTRAINT `product_accounts_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `purchase_history`
--
ALTER TABLE `purchase_history`
  ADD CONSTRAINT `purchase_history_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `purchase_history_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);
--
-- Cơ sở dữ liệu: `oto_website`
--
CREATE DATABASE IF NOT EXISTS `oto_website` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `oto_website`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_logs`
--

CREATE TABLE `admin_logs` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `mileage` int(11) DEFAULT NULL,
  `fuel_type` varchar(20) DEFAULT NULL,
  `transmission` varchar(20) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT 0,
  `is_popular` tinyint(1) DEFAULT 0,
  `status` enum('new','used') DEFAULT 'new',
  `seller_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cars`
--

INSERT INTO `cars` (`id`, `name`, `brand`, `model`, `year`, `price`, `mileage`, `fuel_type`, `transmission`, `color`, `description`, `images`, `is_hot`, `is_popular`, `status`, `seller_id`, `created_at`) VALUES
(1, 'Mazda 3 2023', 'Mazda', '3', 2023, 789000000.00, 0, 'Xăng', 'Tự động', 'Đỏ', 'Mazda 3 thế hệ mới với thiết kế KODO sang trọng, động cơ SkyActiv tiết kiệm nhiên liệu. Xe mới 100%, bảo hành 5 năm hoặc 100.000km.', 'mazda3_1.jpg,mazda3_2.jpg,mazda3_3.jpg', 1, 1, 'new', NULL, '2026-03-26 05:24:19'),
(2, 'Toyota Vios 2023', 'Toyota', 'Vios', 2023, 550000000.00, 0, 'Xăng', 'Tự động', 'Trắng', 'Toyota Vios 2023 phiên bản mới nhất, trang bị động cơ 1.5L, tiết kiệm nhiên liệu, nội thất rộng rãi. Xe mới 100%, bảo hành 3 năm.', 'vios_1.jpg,vios_2.jpg', 1, 1, 'new', NULL, '2026-03-26 05:24:19'),
(3, 'Honda City 2023', 'Honda', 'City', 2023, 599000000.00, 0, 'Xăng', 'CVT', 'Xám', 'Honda City 2023 với thiết kế thể thao, động cơ 1.5L i-VTEC mạnh mẽ, tiết kiệm xăng. Xe mới 100%, bảo hành chính hãng.', 'city_1.jpg,city_2.jpg', 0, 1, 'new', NULL, '2026-03-26 05:24:19'),
(4, 'Hyundai Accent 2023', 'Hyundai', 'Accent', 2023, 520000000.00, 0, 'Xăng', 'Tự động', 'Đen', 'Hyundai Accent 2023 sedan hạng B bán chạy nhất, động cơ 1.4L, nhiều tính năng an toàn. Xe mới 100%.', 'accent_1.jpg,accent_2.jpg', 0, 1, 'new', NULL, '2026-03-26 05:24:19'),
(5, 'Kia Cerato 2023', 'Kia', 'Cerato', 2023, 720000000.00, 0, 'Xăng', 'Tự động', 'Trắng', 'Kia Cerato 2023 thiết kế sang trọng, không gian rộng rãi, nhiều trang bị hiện đại. Xe mới 100%, bảo hành 5 năm.', 'cerato_1.jpg,cerato_2.jpg', 0, 0, 'new', NULL, '2026-03-26 05:24:19'),
(6, 'Ford Ranger 2023', 'Ford', 'Ranger', 2023, 899000000.00, 0, 'Diesel', 'Tự động', 'Cam', 'Ford Ranger 2023 bán tải mạnh mẽ, động cơ 2.0L Bi-Turbo, khả năng off-road vượt trội. Xe mới 100%.', 'ranger_1.jpg,ranger_2.jpg', 1, 0, 'new', NULL, '2026-03-26 05:24:19'),
(7, 'Mitsubishi Xpander 2023', 'Mitsubishi', 'Xpander', 2023, 680000000.00, 0, 'Xăng', 'Tự động', 'Xanh', 'Mitsubishi Xpander 2023 MPV 7 chỗ, thiết kế thời trang, phù hợp gia đình. Xe mới 100%, bảo hành 5 năm.', 'xpander_1.jpg,xpander_2.jpg', 0, 1, 'new', NULL, '2026-03-26 05:24:19'),
(8, 'VinFast VF 8', 'VinFast', 'VF 8', 2023, 1050000000.00, 0, 'Điện', 'Tự động', 'Đen', 'VinFast VF 8 SUV điện, công nghệ hiện đại, vận hành êm ái, không phát thải. Xe mới 100%.', 'vf8_1.jpg,vf8_2.jpg', 1, 0, 'new', NULL, '2026-03-26 05:24:19'),
(9, 'BMW 320i 2023', 'BMW', '320i', 2023, 1690000000.00, 0, 'Xăng', 'Tự động', 'Trắng', 'BMW 320i 2023 sedan hạng sang, động cơ 2.0L TwinPower Turbo, sang trọng và đẳng cấp. Xe mới 100%.', 'bmw_1.jpg,bmw_2.jpg', 0, 0, 'new', NULL, '2026-03-26 05:24:19'),
(10, 'Mercedes-Benz C200', 'Mercedes', 'C200', 2023, 1850000000.00, 0, 'Xăng', 'Tự động', 'Xám', 'Mercedes-Benz C200 2023 với thiết kế đẳng cấp, nội thất sang trọng, động cơ mạnh mẽ. Xe mới 100%.', 'mercedes_1.jpg,mercedes_2.jpg', 0, 0, 'new', NULL, '2026-03-26 05:24:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `community_cars`
--

CREATE TABLE `community_cars` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `mileage` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `status` enum('pending','approved','sold') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `community_cars`
--

INSERT INTO `community_cars` (`id`, `user_id`, `title`, `brand`, `model`, `year`, `price`, `mileage`, `description`, `images`, `status`, `created_at`) VALUES
(3, 7, 'x', '1', '1', 1990, 12000.00, 111111, 'xe đồ chơi ', '1774500572_1.png', 'sold', '2026-03-26 04:49:32'),
(4, 7, 'abcxyz', 'Toyota', '1', 1981, 12000.00, 0, 'xe đồ chời', '1774506752_166c0e12bd180f465609.jpg', 'sold', '2026-03-26 06:32:32'),
(5, 7, 'VF8', 'VinFast', '1', 2020, 1200.00, 0, 'Xe đồ chơi', '', 'sold', '2026-03-27 01:35:39'),
(6, 7, 'vf8', 'VinFast', '1', 2020, 2000000.00, 0, 'Xe đồ chơi', '1774575589_vf8_1.jpg', 'approved', '2026-03-27 01:39:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `user1_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `last_message` text DEFAULT NULL,
  `last_message_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `conversations`
--

INSERT INTO `conversations` (`id`, `user1_id`, `user2_id`, `car_id`, `last_message`, `last_message_time`, `updated_at`) VALUES
(1, 7, 8, 6, 'alo', '2026-03-27 03:00:32', '2026-03-27 03:00:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `car_id`, `message`, `is_read`, `created_at`) VALUES
(15, 8, 7, 6, 'alo', 1, '2026-03-27 02:52:46'),
(16, 7, 8, 6, 'hi', 1, '2026-03-27 02:53:24'),
(17, 8, 7, 6, '1', 1, '2026-03-27 02:59:59'),
(18, 8, 7, 6, 'alo', 1, '2026-03-27 03:00:06'),
(19, 8, 7, 6, 'alo', 1, '2026-03-27 03:00:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','banned') DEFAULT 'active',
  `ban_reason` text DEFAULT NULL,
  `banned_at` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `fullname`, `phone`, `address`, `role`, `created_at`, `status`, `ban_reason`, `banned_at`, `avatar`) VALUES
(4, 'admin', 'admin@oto.com', '$2y$10$P3CX9.S2KnGJh6gTgMGgA.D4RkzPDPxk5vhUNOaqjedMvEwAbrRfa', 'Administrator', NULL, NULL, 'admin', '2026-03-26 03:27:23', 'active', NULL, NULL, NULL),
(7, 'emthanhdaide1', 'dacthanhtik06@gmail.com', '$2y$10$pmYkKGGB7oYPwfXDTaRVVO5.QNsUyQNLfVR8tOM1UbEjiX6rlWSCa', 'Em Thanh Đại Đế', '01222449817', NULL, 'user', '2026-03-26 03:56:30', 'active', NULL, NULL, 'avatar_7_1774505474.jpg'),
(8, 'emthanhdaide', 'dacthanhtik05@gmail.com', '$2y$10$sqP3A8SSe9Id6xULoWHpwetpdu4GmjvpFuavXW50S79qclxuo2NaK', 'Em Thanh Đại Đế', '0348975461', NULL, 'user', '2026-03-27 01:49:14', 'active', NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Chỉ mục cho bảng `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Chỉ mục cho bảng `community_cars`
--
ALTER TABLE `community_cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_conversation` (`user1_id`,`user2_id`,`car_id`),
  ADD KEY `user2_id` (`user2_id`),
  ADD KEY `car_id` (`car_id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `idx_conversation` (`sender_id`,`receiver_id`,`car_id`),
  ADD KEY `idx_unread` (`receiver_id`,`is_read`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `community_cars`
--
ALTER TABLE `community_cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD CONSTRAINT `admin_logs_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `community_cars`
--
ALTER TABLE `community_cars`
  ADD CONSTRAINT `community_cars_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_ibfk_1` FOREIGN KEY (`user1_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `conversations_ibfk_2` FOREIGN KEY (`user2_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `conversations_ibfk_3` FOREIGN KEY (`car_id`) REFERENCES `community_cars` (`id`);

--
-- Các ràng buộc cho bảng `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`car_id`) REFERENCES `community_cars` (`id`);
--
-- Cơ sở dữ liệu: `petshop_db`
--
CREATE DATABASE IF NOT EXISTS `petshop_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `petshop_db`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dogs`
--

CREATE TABLE `dogs` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `breed` varchar(100) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `image_url` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dogs`
--

INSERT INTO `dogs` (`id`, `name`, `breed`, `price`, `category`, `image_url`, `created_at`) VALUES
(7, 'Mông To', 'Corgi', 12000000.00, 'Chó cảnh', 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?q=80&w=400', '2026-04-14 08:42:32'),
(9, 'Vàng', 'Golden Retriever', 9000000.00, 'Chó cảnh', 'https://images.unsplash.com/photo-1552053831-71594a27632d?q=80&w=400', '2026-04-14 08:42:32'),
(10, 'Rex', 'German Shepherd', 10000000.00, 'Chó nghiệp vụ', 'https://images.unsplash.com/photo-1589941013453-ec89f33b5e95?q=80&w=400', '2026-04-14 08:42:32'),
(12, 'Đại Ca', 'Rottweiler', 12500000.00, 'Chó nghiệp vụ', 'https://images.unsplash.com/photo-1567752881298-894bb81f9379?q=80&w=400', '2026-04-14 08:42:32'),
(18, 'Na', 'Beagle', 7500000.00, 'Chó cảnh', 'https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?q=80&w=400', '2026-04-14 08:42:32');
INSERT INTO `dogs` (`id`, `name`, `breed`, `price`, `category`, `image_url`, `created_at`) VALUES
(24, 'Đầu Khấc', 'Chi Hua Hua', 5000000.00, 'Chó cảnh', 'data:image/jpeg;base64,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', '2026-04-16 04:38:15');
INSERT INTO `dogs` (`id`, `name`, `breed`, `price`, `category`, `image_url`, `created_at`) VALUES
(25, 'Coca', 'Husky', 3000000.00, 'Chó cảnh', 'https://upload.wikimedia.org/wikipedia/commons/c/ca/Siberian-husky.jpg', '2026-04-16 04:41:38'),
(26, 'Mr. Gold', 'Chó Sục Bò', 50000000.00, 'Chó cảnh', 'https://cdn.tgdd.vn/Files/2023/01/19/1504110/cho-suc-bo-nguon-goc-dac-diem-cach-nuoi-gia-ban-202301190702005838.jpg', '2026-04-16 04:48:14'),
(27, 'Milu', 'Poodle', 8000000.00, 'Chó cảnh', 'data:image/jpeg;base64,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', '2026-05-26 07:17:42'),
(28, 'Shiro', 'Dingo', 15000000.00, 'Chó cảnh', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2nWPE2EcgzY3ddkd0I_2b65li3QcL5mlJsw&s', '2026-05-26 07:17:42'),
(29, 'Khoai Tây', 'Phốc Sóc', 8500000.00, 'Chó cảnh', 'data:image/jpeg;base64,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', '2026-05-26 07:17:42'),
(30, 'Đậu Đậu', 'Samoyed', 1100000.00, 'Chó cảnh', 'data:image/jpeg;base64,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', '2026-05-26 07:17:42'),
(31, 'Xúc Xích', 'Lạp Xưởng', 5500000.00, 'Chó cảnh', 'data:image/jpeg;base64,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', '2026-05-26 07:17:42'),
(32, 'Chiko', 'Akita Inu', 16000000.00, 'Chó cảnh', 'data:image/jpeg;base64,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', '2026-05-26 07:17:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(100) NOT NULL,
  `sender_type` enum('customer','admin') NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `customer_id`, `sender_type`, `message`, `is_read`, `created_at`) VALUES
(20, 'guest_tm790mfbr', 'customer', 'á lồ', 0, '2026-04-17 08:53:42'),
(21, 'guest_tm790mfbr', 'admin', 'gì mày', 0, '2026-04-17 08:53:51'),
(22, 'guest_tm790mfbr', 'customer', 'bạn ơi', 0, '2026-04-17 09:06:13'),
(23, 'guest_tm790mfbr', 'admin', 'alo', 0, '2026-04-17 09:10:16'),
(24, 'guest_tm790mfbr', 'admin', 'alo', 0, '2026-04-17 09:10:25'),
(25, 'guest_tm790mfbr', 'admin', 'alo', 0, '2026-04-17 09:41:51'),
(26, 'guest_tm790mfbr', 'admin', 'alo', 0, '2026-04-17 09:42:24'),
(27, 'guest_46jsx6fvy', 'customer', 'alo', 0, '2026-04-17 09:42:28'),
(28, 'guest_46jsx6fvy', 'admin', 'đây', 0, '2026-04-17 09:42:35'),
(29, 'guest_46jsx6fvy', 'customer', 'ok', 0, '2026-04-17 09:42:40'),
(30, 'guest_46jsx6fvy', 'customer', 'alo', 0, '2026-04-17 09:44:13'),
(31, 'guest_46jsx6fvy', 'customer', 'chào người bán', 0, '2026-04-17 09:48:50'),
(32, 'guest_e5qj9d90p', 'customer', 'chào người bán', 0, '2026-04-17 09:49:09'),
(33, 'guest_a21r3zqjx', 'customer', 'xin chào', 0, '2026-05-26 08:29:16'),
(34, 'guest_a21r3zqjx', 'admin', '.', 0, '2026-05-26 08:29:26'),
(35, 'guest_a21r3zqjx', 'admin', 'fjjdjd', 0, '2026-05-26 08:29:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages`
--

CREATE TABLE `pages` (
  `slug` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `pages`
--

INSERT INTO `pages` (`slug`, `title`, `content`, `updated_at`) VALUES
('gioi-thieu', 'Về PetLove', '<style>\r\n.warranty-section {\r\n    margin-top: 60px;\r\n}\r\n\r\n.warranty-title {\r\n    text-align: center;\r\n    color: #ff5c7a;\r\n    margin-bottom: 15px;\r\n}\r\n\r\n.warranty-desc {\r\n    text-align: center;\r\n    max-width: 700px;\r\n    margin: 0 auto 40px;\r\n    color: #555;\r\n    line-height: 1.7;\r\n}\r\n\r\n.warranty-grid {\r\n    display: grid;\r\n    grid-template-columns: repeat(3, 1fr);\r\n    gap: 20px;\r\n}\r\n\r\n.warranty-card {\r\n    background: #fff;\r\n    padding: 25px;\r\n    border-radius: 15px;\r\n    box-shadow: 0 10px 25px rgba(0,0,0,0.08);\r\n    transition: 0.3s;\r\n}\r\n\r\n.warranty-card:hover {\r\n    transform: translateY(-5px);\r\n}\r\n\r\n.warranty-card h4 {\r\n    color: #ff5c7a;\r\n    margin-bottom: 10px;\r\n}\r\n\r\n.warranty-card p {\r\n    line-height: 1.6;\r\n}\r\n\r\n/* EXTRA BOX */\r\n.warranty-extra {\r\n    margin-top: 40px;\r\n    background: #fff0f2;\r\n    padding: 25px;\r\n    border-radius: 15px;\r\n}\r\n\r\n.warranty-extra h3 {\r\n    color: #ff5c7a;\r\n    margin-bottom: 15px;\r\n}\r\n\r\n.warranty-extra ul {\r\n    padding-left: 18px;\r\n}\r\n\r\n.warranty-extra li {\r\n    margin-bottom: 10px;\r\n}\r\n\r\n/* NOTE */\r\n.warranty-note {\r\n    margin-top: 30px;\r\n    background: #ffe3e8;\r\n    padding: 20px;\r\n    border-left: 5px solid #ff5c7a;\r\n    border-radius: 10px;\r\n    line-height: 1.6;\r\n}\r\n\r\n/* RESPONSIVE */\r\n@media (max-width: 768px) {\r\n    .warranty-grid {\r\n        grid-template-columns: 1fr;\r\n    }\r\n}\r\n</style>\r\n\r\n<div class=\"warranty-section\">\r\n\r\n    <h2 class=\"warranty-title\">Chính sách bảo hành & cam kết</h2>\r\n\r\n    <p class=\"warranty-desc\">\r\n        Tại <b>PetLove</b>, chúng mình không chỉ đơn thuần là nơi cung cấp thú cưng, \r\n        mà còn là người đồng hành cùng bạn trong suốt hành trình nuôi dưỡng và chăm sóc.  \r\n        Chính vì vậy, mọi chú cún trước khi đến tay khách hàng đều được kiểm tra kỹ lưỡng, \r\n        đảm bảo sức khỏe và nguồn gốc rõ ràng.  \r\n        Chính sách bảo hành được xây dựng nhằm mang lại sự an tâm tuyệt đối cho bạn.\r\n    </p>\r\n\r\n    <!-- GRID -->\r\n    <div class=\"warranty-grid\">\r\n\r\n        <div class=\"warranty-card\">\r\n            <h4>Cam kết sức khỏe toàn diện</h4>\r\n            <p>\r\n                Tất cả thú cưng tại PetLove đều được tiêm phòng đầy đủ, \r\n                kiểm tra sức khỏe định kỳ và đảm bảo không mắc các bệnh truyền nhiễm nguy hiểm trước khi giao.\r\n            </p>\r\n        </div>\r\n\r\n        <div class=\"warranty-card\">\r\n            <h4>1 đổi 1 trong 7 ngày</h4>\r\n            <p>\r\n                Trong trường hợp phát sinh các bệnh nghiêm trọng như Care hoặc Parvo trong vòng 7 ngày,\r\n                PetLove sẽ hỗ trợ đổi thú cưng hoàn toàn miễn phí.\r\n            </p>\r\n        </div>\r\n\r\n        <div class=\"warranty-card\">\r\n            <h4>Hỗ trợ & tư vấn trọn đời</h4>\r\n            <p>\r\n                Đội ngũ của PetLove luôn sẵn sàng hỗ trợ bạn về dinh dưỡng, chăm sóc, huấn luyện \r\n                và sức khỏe thú cưng trong suốt quá trình nuôi.\r\n            </p>\r\n        </div>\r\n\r\n    </div>\r\n\r\n    <!-- EXTRA -->\r\n    <div class=\"warranty-extra\">\r\n        <h3>Điều kiện áp dụng bảo hành</h3>\r\n        <ul>\r\n            <li>Thú cưng được chăm sóc đúng theo hướng dẫn từ PetLove.</li>\r\n            <li>Không có tác động bên ngoài gây ảnh hưởng đến sức khỏe.</li>\r\n            <li>Khách hàng cung cấp đầy đủ thông tin khi yêu cầu hỗ trợ.</li>\r\n        </ul>\r\n\r\n        <h3 style=\"margin-top:20px;\">Trường hợp không áp dụng</h3>\r\n        <ul>\r\n            <li>Tự ý sử dụng thuốc hoặc điều trị không đúng cách.</li>\r\n            <li>Thay đổi môi trường sống đột ngột gây sốc cho thú cưng.</li>\r\n            <li>Không liên hệ kịp thời khi phát hiện dấu hiệu bất thường.</li>\r\n        </ul>\r\n    </div>\r\n\r\n    <!-- NOTE -->\r\n    <div class=\"warranty-note\">\r\n        <b>Lưu ý quan trọng:</b>  \r\n        PetLove luôn đặt sức khỏe và sự an toàn của thú cưng lên hàng đầu.  \r\n        Chính sách bảo hành không chỉ là cam kết, mà còn là trách nhiệm của chúng mình \r\n        trong việc mang lại trải nghiệm tốt nhất cho khách hàng.\r\n    </div>\r\n\r\n</div>', '2026-04-14 07:52:19'),
('lien-he', 'Thông tin liên hệ', '<style>\r\n.contact-container {\r\n    display: grid;\r\n    grid-template-columns: 1fr 1fr;\r\n    gap: 30px;\r\n    margin: 40px 0;\r\n    font-family: \'Segoe UI\', sans-serif;\r\n}\r\n\r\n/* CARD */\r\n.contact-card {\r\n    background: linear-gradient(135deg, #fff, #ffeef2);\r\n    padding: 25px;\r\n    border-radius: 20px;\r\n    box-shadow: 0 10px 25px rgba(0,0,0,0.1);\r\n    transition: 0.3s;\r\n}\r\n\r\n.contact-card:hover {\r\n    transform: translateY(-5px);\r\n    box-shadow: 0 15px 35px rgba(0,0,0,0.15);\r\n}\r\n\r\n.contact-card h3 {\r\n    margin-bottom: 20px;\r\n    color: #ff5c7a;\r\n}\r\n\r\n/* ITEM */\r\n.contact-item {\r\n    display: flex;\r\n    align-items: center;\r\n    margin-bottom: 15px;\r\n}\r\n\r\n.contact-item i {\r\n    font-size: 18px;\r\n    color: #fff;\r\n    background: #ff8a9e;\r\n    padding: 10px;\r\n    border-radius: 50%;\r\n    margin-right: 12px;\r\n    transition: 0.3s;\r\n}\r\n\r\n.contact-item:hover i {\r\n    background: #ff5c7a;\r\n    transform: scale(1.1);\r\n}\r\n\r\n.contact-item span {\r\n    font-size: 15px;\r\n}\r\n\r\n/* MAP */\r\n.map-box {\r\n    border-radius: 20px;\r\n    overflow: hidden;\r\n    box-shadow: 0 10px 25px rgba(0,0,0,0.1);\r\n}\r\n\r\n.map-box iframe {\r\n    width: 100%;\r\n    height: 100%;\r\n    min-height: 300px;\r\n    border: none;\r\n}\r\n\r\n/* RESPONSIVE */\r\n@media (max-width: 768px) {\r\n    .contact-container {\r\n        grid-template-columns: 1fr;\r\n    }\r\n}\r\n</style>\r\n\r\n<div class=\"contact-container\">\r\n\r\n    <!-- LEFT -->\r\n    <div class=\"contact-card\">\r\n        <h3>Liên hệ với chúng tôi</h3>\r\n\r\n        <div class=\"contact-item\">\r\n            <i class=\"fa fa-map-marker-alt\"></i>\r\n            <span><b>Địa chỉ:</b> Trường Đại học Tây Nguyên, Buôn Ma Thuột</span>\r\n        </div>\r\n\r\n        <div class=\"contact-item\">\r\n            <i class=\"fa fa-phone\"></i>\r\n            <span><b>Hotline:</b> 09xx.xxx.xxx</span>\r\n        </div>\r\n\r\n        <div class=\"contact-item\">\r\n            <i class=\"fa fa-envelope\"></i>\r\n            <span><b>Email:</b> dacthanh0605@gmail.com</span>\r\n        </div>\r\n\r\n        <div class=\"contact-item\">\r\n            <i class=\"fa fa-clock\"></i>\r\n            <span><b>Giờ làm việc:</b> 08:00 - 21:00</span>\r\n        </div>\r\n\r\n    </div>\r\n\r\n    <!-- RIGHT MAP -->\r\n    <div class=\"map-box\">\r\n        <iframe \r\n            src=\"https://www.google.com/maps?q=Đại học Tây Nguyên&output=embed\">\r\n        </iframe>\r\n    </div>\r\n\r\n</div>', '2026-04-14 07:22:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `role` enum('admin','user') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`, `role`) VALUES
(1, 'admin_thanh', '123', 'Thanh Admin', 'admin'),
(2, 'user_demo', '123', 'Khách hàng', 'user'),
(3, 'thanh123', '123', 'Phạm Đắc Thanh', 'user');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `dogs`
--
ALTER TABLE `dogs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`slug`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `dogs`
--
ALTER TABLE `dogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Cơ sở dữ liệu: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Đang đổ dữ liệu cho bảng `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"relation_lines\":\"true\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Đang đổ dữ liệu cho bảng `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"stem-oto\",\"table\":\"contacts\"},{\"db\":\"auth_demo\",\"table\":\"users\"},{\"db\":\"auth_demo\",\"table\":\"my_courses\"},{\"db\":\"auth_demo\",\"table\":\"user_courses\"},{\"db\":\"information_schema\",\"table\":\"INNODB_SYS_FOREIGN_COLS\"},{\"db\":\"auth_demo\",\"table\":\"courses\"},{\"db\":\"quiz_db\",\"table\":\"questions\"},{\"db\":\"quiz_db\",\"table\":\"answers\"},{\"db\":\"quiz_db\",\"table\":\"users\"}]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Đang đổ dữ liệu cho bảng `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-12-10 07:23:11', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"vi\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Chỉ mục cho bảng `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Chỉ mục cho bảng `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Chỉ mục cho bảng `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Chỉ mục cho bảng `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Chỉ mục cho bảng `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Chỉ mục cho bảng `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Chỉ mục cho bảng `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Chỉ mục cho bảng `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Chỉ mục cho bảng `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Chỉ mục cho bảng `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Cơ sở dữ liệu: `qr_scanner_db`
--
CREATE DATABASE IF NOT EXISTS `qr_scanner_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `qr_scanner_db`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blacklist`
--

CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL,
  `url` varchar(2048) NOT NULL,
  `reported_by` int(11) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `reported_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `blacklist`
--

INSERT INTO `blacklist` (`id`, `url`, `reported_by`, `reason`, `reported_at`) VALUES
(1, 'https://www.canvaqr.com/RGWDMjD7Gu', 2, 'Người dùng báo cáo từ màn hình kết quả', '2026-10-26 05:29:19'),
(2, 'http://127.0.0.1/qr_api/index.php?step=1', 2, 'Người dùng báo cáo từ màn hình kết quả', '2026-10-26 05:47:35'),
(3, 'http://localhost/qr_api/index.php', 3, 'Người dùng báo cáo từ màn hình kết quả', '2026-11-10 01:16:35'),
(4, 'http://127.0.0.1/qr_api/index.php?step=1&test=1', 3, 'Người dùng báo cáo từ màn hình kết quả', '2026-11-10 01:17:04'),
(5, 'https://q.me-qr.com/zyph27dn', 3, 'Người dùng báo cáo từ màn hình kết quả', '2026-11-13 08:33:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `scan_history`
--

CREATE TABLE `scan_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `original_url` varchar(2048) NOT NULL,
  `final_url` varchar(2048) DEFAULT NULL,
  `risk_score` int(11) DEFAULT 0,
  `risk_level` varchar(20) DEFAULT NULL,
  `layers_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`layers_json`)),
  `scanned_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `redirect_chain_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`redirect_chain_json`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `scan_history`
--

INSERT INTO `scan_history` (`id`, `user_id`, `original_url`, `final_url`, `risk_score`, `risk_level`, `layers_json`, `scanned_at`, `redirect_chain_json`) VALUES
(1, 2, 'https://www.canvaqr.com/RGWDMjD7Gu', 'http://127.0.0.1:8080/qr_api/chuoi.php?buoc=1', 50, 'warning', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Kiểm tra uy tín\",\"isPassed\":false,\"details\":[\"Không có trong whitelist.\"]},{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File nguy hiểm\",\"isPassed\":false,\"details\":[\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect (Bot)\",\"isPassed\":true,\"details\":[\"Phát hiện 1 bước chuyển hướng.\",\"Đích đến thực sự: http:\\/\\/127.0.0.1:8080\\/qr_api\\/chuoi.php?buoc=1\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Toàn bộ các link trong lộ trình đều an toàn với Google.\"]}]', '2026-10-26 05:29:11', NULL),
(2, 2, 'https://www.canvaqr.com/RGWDMjD7Gu', 'https://www.canvaqr.com/RGWDMjD7Gu', 100, 'danger', '[{\"layerName\":\"Cảnh báo từ Cộng đồng\",\"description\":\"Hệ thống nhận diện link đã bị báo cáo\",\"isPassed\":false,\"details\":[\"Mã QR\\/Liên kết này đã bị người dùng khác báo cáo là độc hại.\",\"Lý do: Người dùng báo cáo từ màn hình kết quả\",\"Hành động: Chặn truy cập ngay lập tức.\"]}]', '2026-10-26 05:29:36', NULL),
(3, 2, 'https://www.youtube.com', 'https://www.youtube.com', 0, 'safe', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Kiểm tra uy tín\",\"isPassed\":false,\"details\":[\"Không có trong whitelist.\"]},{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File nguy hiểm\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường trên toàn bộ lộ trình.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect (Bot)\",\"isPassed\":true,\"details\":[\"Không có chuyển hướng ẩn.\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Toàn bộ các link trong lộ trình đều an toàn với Google.\"]}]', '2026-10-26 05:31:48', NULL),
(4, 2, 'http://localhost/qr_api/index.php', 'http://localhost/qr_api/index.php', 20, 'safe', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Kiểm tra uy tín\",\"isPassed\":false,\"details\":[\"Không có trong whitelist.\"]},{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File nguy hiểm\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect (Bot)\",\"isPassed\":true,\"details\":[\"Không có chuyển hướng ẩn.\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Toàn bộ các link trong lộ trình đều an toàn với Google.\"]}]', '2026-10-26 05:41:03', NULL),
(5, 2, 'http://127.0.0.1/qr_api/index.php?step=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Kiểm tra uy tín\",\"isPassed\":false,\"details\":[\"Không có trong whitelist.\"]},{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File nguy hiểm\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect (Bot)\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến thực sự: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":false,\"details\":[\"CẢNH BÁO: Link #6 (http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/) bị Google đánh dấu là MALWARE!\"]}]', '2026-10-26 05:43:26', NULL),
(6, 2, 'http://127.0.0.1/qr_api/index.php?step=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Kiểm tra uy tín\",\"isPassed\":false,\"details\":[\"Không có trong whitelist.\"]},{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File nguy hiểm\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect (Bot)\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến thực sự: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":false,\"details\":[\"CẢNH BÁO: Link #6 (http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/) bị Google đánh dấu là MALWARE!\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng\",\"isPassed\":false,\"details\":[\"Link này đã bị 1 người dùng báo cáo!\",\"User thanh9966 báo cáo: Người dùng báo cáo từ màn hình kết quả\"]}]', '2026-10-26 06:01:09', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1\"]'),
(7, 2, 'http://localhost/qr_api/index.php', 'http://localhost/qr_api/index.php', 20, 'safe', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Kiểm tra uy tín\",\"isPassed\":false,\"details\":[\"Không có trong whitelist.\"]},{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File nguy hiểm\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect (Bot)\",\"isPassed\":true,\"details\":[\"Không có chuyển hướng ẩn.\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Toàn bộ các link trong lộ trình đều an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng\",\"isPassed\":true,\"details\":[\"Chưa có báo cáo nào.\"]}]', '2026-10-26 06:01:32', '[\"http:\\/\\/localhost\\/qr_api\\/index.php\"]'),
(8, 2, 'http://127.0.0.1/qr_api/index.php?step=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Kiểm tra uy tín\",\"isPassed\":false,\"details\":[\"Không có trong whitelist.\"]},{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File nguy hiểm\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect (Bot)\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến thực sự: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":false,\"details\":[\"CẢNH BÁO: Link #6 (http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/) bị Google đánh dấu là MALWARE!\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng\",\"isPassed\":false,\"details\":[\"Link này đã bị 1 người dùng báo cáo!\",\"User thanh9966 báo cáo: Người dùng báo cáo từ màn hình kết quả\"]}]', '2026-10-26 06:03:58', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1\"]'),
(9, 2, 'http://127.0.0.1/qr_api/index.php?step=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Kiểm tra uy tín\",\"isPassed\":false,\"details\":[\"Không có trong whitelist.\"]},{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File nguy hiểm\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect (Bot)\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến thực sự: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":false,\"details\":[\"CẢNH BÁO: Link #6 (http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/) bị Google đánh dấu là MALWARE!\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":false,\"details\":[\"Link này đã bị 1 người dùng báo cáo là có nguy cơ!\",\"User thanh9966 báo cáo: Người dùng báo cáo từ màn hình kết quả\"]}]', '2026-10-26 06:10:33', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1\"]'),
(10, 2, 'http://127.0.0.1/qr_api/index.php?step=1&test=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":false,\"details\":[\"CẢNH BÁO: Link #6 bị Google đánh dấu là MALWARE!\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-10-26 06:13:06', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1&test=1\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=2\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=3\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=4\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=5\",\"http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]'),
(11, 3, 'http://127.0.0.1/qr_api/index.php?step=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":false,\"details\":[\"Link này đã bị 1 người dùng báo cáo là có nguy cơ!\",\"User thanh9966 báo cáo: Người dùng báo cáo từ màn hình kết quả\"]}]', '2026-11-10 01:14:48', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=2\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=3\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=4\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=5\",\"http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]'),
(12, 3, 'http://localhost/qr_api/index.php', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-10 01:16:17', '[\"http:\\/\\/localhost\\/qr_api\\/index.php\",\"http:\\/\\/localhost\\/qr_api\\/index.php?step=2\",\"http:\\/\\/localhost\\/qr_api\\/index.php?step=3\",\"http:\\/\\/localhost\\/qr_api\\/index.php?step=4\",\"http:\\/\\/localhost\\/qr_api\\/index.php?step=5\",\"http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]'),
(13, 3, 'http://127.0.0.1/qr_api/index.php?step=1&test=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-10 01:16:55', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1&test=1\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=2\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=3\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=4\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=5\",\"http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]'),
(14, 3, 'https://www.canvaqr.com/RGWDMjD7Gu', 'https://www.facebook.com/', 40, 'warning', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 2 bước chuyển hướng.\",\"Đích đến: https:\\/\\/www.facebook.com\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":false,\"details\":[\"Link này đã bị 1 người dùng báo cáo là có nguy cơ!\",\"User thanh9966 báo cáo: Người dùng báo cáo từ màn hình kết quả\"]}]', '2026-11-10 01:34:52', '[\"https:\\/\\/www.canvaqr.com\\/RGWDMjD7Gu\",\"https:\\/\\/facebook.com\\/\",\"https:\\/\\/www.facebook.com\\/\"]'),
(15, 3, 'https://www.canvaqr.com/RGXPsKMkbi', 'https://www.facebook.com/', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 1 bước chuyển hướng.\",\"Đích đến: https:\\/\\/www.facebook.com\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-10 01:36:03', '[\"https:\\/\\/www.canvaqr.com\\/RGXPsKMkbi\",\"https:\\/\\/www.facebook.com\\/\"]'),
(16, 3, 'https://facebook.com', 'https://facebook.com', 0, 'safe', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Tên miền uy tín\",\"isPassed\":true,\"details\":[\"facebook.com nằm trong danh sách an toàn.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-10 01:37:22', '[\"https:\\/\\/facebook.com\"]'),
(17, 4, 'http://127.0.0.1/qr_api/index.php?step=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":false,\"details\":[\"Link này đã bị 1 người dùng báo cáo là có nguy cơ!\",\"User thanh9966 báo cáo: Người dùng báo cáo từ màn hình kết quả\"]}]', '2026-11-10 01:40:31', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=2\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=3\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=4\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=5\",\"http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]'),
(18, 4, 'https://facebook.com', 'https://facebook.com', 0, 'safe', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Tên miền uy tín\",\"isPassed\":true,\"details\":[\"facebook.com nằm trong danh sách an toàn.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-10 01:41:05', '[\"https:\\/\\/facebook.com\"]'),
(19, 3, 'https://www.facebook.com', 'https://www.facebook.com', 0, 'safe', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Tên miền uy tín\",\"isPassed\":true,\"details\":[\"facebook.com nằm trong danh sách an toàn.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-12 09:21:54', '[\"https:\\/\\/www.facebook.com\"]'),
(20, 6, 'http://127.0.0.1/qr_api/index.php?step=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":false,\"details\":[\"CẢNH BÁO: Link #6 bị Google đánh dấu là MALWARE!\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":false,\"details\":[\"Link này đã bị 1 người dùng báo cáo là có nguy cơ!\",\"User thanh9966 báo cáo: Người dùng báo cáo từ màn hình kết quả\"]}]', '2026-11-12 09:36:40', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=2\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=3\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=4\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=5\",\"http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]'),
(21, 6, 'https://facebook.com', 'https://facebook.com', 0, 'safe', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Tên miền uy tín\",\"isPassed\":true,\"details\":[\"facebook.com nằm trong danh sách an toàn.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-12 09:37:13', '[\"https:\\/\\/facebook.com\"]'),
(22, 7, 'http://127.0.0.1/qr_api/index.php?step=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":false,\"details\":[\"CẢNH BÁO: Link #6 bị Google đánh dấu là MALWARE!\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":false,\"details\":[\"Link này đã bị 1 người dùng báo cáo là có nguy cơ!\",\"User thanh9966 báo cáo: Người dùng báo cáo từ màn hình kết quả\"]}]', '2026-11-12 09:45:33', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=2\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=3\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=4\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=5\",\"http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]'),
(23, 7, 'https://facebook.com', 'https://facebook.com', 0, 'safe', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Tên miền uy tín\",\"isPassed\":true,\"details\":[\"facebook.com nằm trong danh sách an toàn.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-12 09:46:08', '[\"https:\\/\\/facebook.com\"]'),
(24, 7, 'https://www.youtube.com', 'https://www.youtube.com', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Không có chuyển hướng ẩn.\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-12 09:46:39', '[\"https:\\/\\/www.youtube.com\"]'),
(25, 7, 'https://www.youtube.com', 'https://www.youtube.com', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Không có chuyển hướng ẩn.\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-12 09:47:36', '[\"https:\\/\\/www.youtube.com\"]'),
(26, 7, 'http://127.0.0.1/qr_api/index.php?step=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":false,\"details\":[\"CẢNH BÁO: Link #6 bị Google đánh dấu là MALWARE!\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":false,\"details\":[\"Link này đã bị 1 người dùng báo cáo là có nguy cơ!\",\"User thanh9966 báo cáo: Người dùng báo cáo từ màn hình kết quả\"]}]', '2026-11-12 09:47:39', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=2\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=3\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=4\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=5\",\"http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]'),
(27, 7, 'https://instagram.com', 'https://www.instagram.com/', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 1 bước chuyển hướng.\",\"Đích đến: https:\\/\\/www.instagram.com\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-12 09:48:17', '[\"https:\\/\\/instagram.com\",\"https:\\/\\/www.instagram.com\\/\"]'),
(28, 8, 'http://127.0.0.1/qr_api/index.php?step=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":false,\"details\":[\"CẢNH BÁO: Link #6 bị Google đánh dấu là MALWARE!\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":false,\"details\":[\"Link này đã bị 1 người dùng báo cáo là có nguy cơ!\",\"User thanh9966 báo cáo: Người dùng báo cáo từ màn hình kết quả\"]}]', '2026-11-12 10:03:51', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=2\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=3\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=4\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=5\",\"http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]'),
(29, 8, 'https://facebook.com', 'https://facebook.com', 0, 'safe', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Tên miền uy tín\",\"isPassed\":true,\"details\":[\"facebook.com nằm trong danh sách an toàn.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-12 10:04:29', '[\"https:\\/\\/facebook.com\"]'),
(30, 8, 'https://www.youtube.com', 'https://www.youtube.com', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Không có chuyển hướng ẩn.\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-12 10:04:48', '[\"https:\\/\\/www.youtube.com\"]'),
(31, 8, 'insstagram.com', 'https://www.instagram.com/', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 1 bước chuyển hướng.\",\"Đích đến: https:\\/\\/www.instagram.com\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-12 10:05:05', '[\"insstagram.com\",\"https:\\/\\/www.instagram.com\\/\"]'),
(32, 8, 'https://www.youtube.com', 'https://www.youtube.com', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Không có chuyển hướng ẩn.\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-12 10:05:26', '[\"https:\\/\\/www.youtube.com\"]'),
(33, 6, 'https://www.youtube.com', 'https://www.youtube.com', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Không có chuyển hướng ẩn.\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-12 10:53:29', '[\"https:\\/\\/www.youtube.com\"]'),
(34, 3, 'http://127.0.0.1/qr_api/index.php?step=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":false,\"details\":[\"CẢNH BÁO: Link #6 bị Google đánh dấu là MALWARE!\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":false,\"details\":[\"Link này đã bị 1 người dùng báo cáo là có nguy cơ!\",\"User thanh9966 báo cáo: Người dùng báo cáo từ màn hình kết quả\"]}]', '2026-11-13 04:00:15', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=2\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=3\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=4\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=5\",\"http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]'),
(35, 3, 'http://127.0.0.1/qr_api/index.php?step=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":false,\"details\":[\"CẢNH BÁO: Link #6 bị Google đánh dấu là MALWARE!\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":false,\"details\":[\"Link này đã bị 1 người dùng báo cáo là có nguy cơ!\",\"User thanh9966 báo cáo: Người dùng báo cáo từ màn hình kết quả\"]}]', '2026-11-13 04:06:16', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=2\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=3\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=4\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=5\",\"http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]'),
(36, 3, 'https://facebook.com', 'https://facebook.com', 0, 'safe', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Tên miền uy tín\",\"isPassed\":true,\"details\":[\"facebook.com nằm trong danh sách an toàn.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-13 04:06:37', '[\"https:\\/\\/facebook.com\"]'),
(37, 3, 'https://www.youtube.com', 'https://www.youtube.com', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Không có chuyển hướng ẩn.\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-13 04:06:55', '[\"https:\\/\\/www.youtube.com\"]'),
(38, 3, 'instagram.com', 'instagram.com', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Không có chuyển hướng ẩn.\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-13 04:07:19', '[\"instagram.com\"]'),
(39, 3, 'https://daklaktoday.vn/game/dhtn', 'https://daklaktoday.vn/game/dhtn', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Không có chuyển hướng ẩn.\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-13 08:11:48', '[\"https:\\/\\/daklaktoday.vn\\/game\\/dhtn\"]'),
(40, 3, 'https://www.canvaqr.com/RGXPsKMkbi', 'https://www.facebook.com/', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 1 bước chuyển hướng.\",\"Đích đến: https:\\/\\/www.facebook.com\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-13 08:21:23', '[\"https:\\/\\/www.canvaqr.com\\/RGXPsKMkbi\",\"https:\\/\\/www.facebook.com\\/\"]'),
(41, 3, 'https://facebook.com', 'https://facebook.com', 0, 'safe', '[{\"layerName\":\"Lớp 4: Whitelist\",\"description\":\"Tên miền uy tín\",\"isPassed\":true,\"details\":[\"facebook.com nằm trong danh sách an toàn.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-13 08:21:46', '[\"https:\\/\\/facebook.com\"]'),
(42, 3, 'https://www.youtube.com', 'https://www.youtube.com', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Không có chuyển hướng ẩn.\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-13 08:21:53', '[\"https:\\/\\/www.youtube.com\"]'),
(43, 3, 'https://www.youtube.com', 'https://www.youtube.com', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Không có chuyển hướng ẩn.\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-13 08:22:22', '[\"https:\\/\\/www.youtube.com\"]'),
(44, 3, 'http://127.0.0.1/qr_api/index.php?step=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":false,\"details\":[\"CẢNH BÁO: Link #6 bị Google đánh dấu là MALWARE!\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":false,\"details\":[\"Link này đã bị 1 người dùng báo cáo là có nguy cơ!\",\"User thanh9966 báo cáo: Người dùng báo cáo từ màn hình kết quả\"]}]', '2026-11-13 08:28:17', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=2\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=3\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=4\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=5\",\"http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]'),
(45, 3, 'https://q.me-qr.com/zyph27dn', 'https://dhtn.itcctv-soft.com/login', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 2 bước chuyển hướng.\",\"Đích đến: https:\\/\\/dhtn.itcctv-soft.com\\/login\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-13 08:29:45', '[\"https:\\/\\/q.me-qr.com\\/zyph27dn\",\"https:\\/\\/dhtn.itcctv-soft.com\\/lms\\/teacher\\/spaces\\/2\\/grading\",\"https:\\/\\/dhtn.itcctv-soft.com\\/login\"]'),
(46, 3, 'http://127.0.0.1/qr_api/index.php?step=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":false,\"details\":[\"CẢNH BÁO: Link #6 bị Google đánh dấu là MALWARE!\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":false,\"details\":[\"Link này đã bị 1 người dùng báo cáo là có nguy cơ!\",\"User thanh9966 báo cáo: Người dùng báo cáo từ màn hình kết quả\"]}]', '2026-11-13 08:31:03', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=2\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=3\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=4\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=5\",\"http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]'),
(47, 3, 'https://q.me-qr.com/zyph27dn', 'https://dhtn.itcctv-soft.com/login', 0, 'safe', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":true,\"details\":[\"Không phát hiện dấu hiệu bất thường.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 2 bước chuyển hướng.\",\"Đích đến: https:\\/\\/dhtn.itcctv-soft.com\\/login\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":true,\"details\":[\"Các link an toàn với Google.\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":true,\"details\":[\"Chưa có người dùng nào báo cáo link này.\"]}]', '2026-11-13 08:33:01', '[\"https:\\/\\/q.me-qr.com\\/zyph27dn\",\"https:\\/\\/dhtn.itcctv-soft.com\\/lms\\/teacher\\/spaces\\/2\\/grading\",\"https:\\/\\/dhtn.itcctv-soft.com\\/login\"]');
INSERT INTO `scan_history` (`id`, `user_id`, `original_url`, `final_url`, `risk_score`, `risk_level`, `layers_json`, `scanned_at`, `redirect_chain_json`) VALUES
(48, 3, 'http://127.0.0.1/qr_api/index.php?step=1', 'http://testsafebrowsing.appspot.com/apiv4/ANY_PLATFORM/MALWARE/URL/', 100, 'danger', '[{\"layerName\":\"Lớp 1: Phân tích tĩnh\",\"description\":\"Check HTTP, IP, File\",\"isPassed\":false,\"details\":[\"Link #1 sử dụng HTTP không bảo mật.\",\"Link #1 sử dụng địa chỉ IP.\",\"Link #2 sử dụng HTTP không bảo mật.\",\"Link #2 sử dụng địa chỉ IP.\",\"Link #3 sử dụng HTTP không bảo mật.\",\"Link #3 sử dụng địa chỉ IP.\",\"Link #4 sử dụng HTTP không bảo mật.\",\"Link #4 sử dụng địa chỉ IP.\",\"Link #5 sử dụng HTTP không bảo mật.\",\"Link #5 sử dụng địa chỉ IP.\",\"Link #6 sử dụng HTTP không bảo mật.\"]},{\"layerName\":\"Lớp 2: Phân tích động\",\"description\":\"Truy vết Redirect\",\"isPassed\":true,\"details\":[\"Phát hiện 5 bước chuyển hướng.\",\"Đích đến: http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]},{\"layerName\":\"Lớp 3: Danh sách đen\",\"description\":\"Google Safe Browsing\",\"isPassed\":false,\"details\":[\"CẢNH BÁO: Link #6 bị Google đánh dấu là MALWARE!\"]},{\"layerName\":\"Cảnh báo Cộng đồng\",\"description\":\"Ghi chú từ người dùng khác\",\"isPassed\":false,\"details\":[\"Link này đã bị 1 người dùng báo cáo là có nguy cơ!\",\"User thanh9966 báo cáo: Người dùng báo cáo từ màn hình kết quả\"]}]', '2026-11-13 08:33:22', '[\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=1\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=2\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=3\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=4\",\"http:\\/\\/127.0.0.1\\/qr_api\\/index.php?step=5\",\"http:\\/\\/testsafebrowsing.appspot.com\\/apiv4\\/ANY_PLATFORM\\/MALWARE\\/URL\\/\"]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'emthanhdaide', 'dacthanh0605@gmail.com', '$2y$10$h9cld0fuF9ovoWvgdIUB4O5t/LpbQGwScFP4FAmNIK48/c1tl8LWS', '2026-10-25 01:49:28'),
(2, 'thanh9966', 'thanh@gmail.com', '$2y$10$G7iBJ4nKoKBB.uDKrvljcOsnqoXV4IkUQTkER06AMtBXQ4MSdfgT.', '2026-10-26 03:54:39'),
(3, 'thanh1122', 'thanh1122@gmail.com', '$2y$10$zoyxoJ1fwMttjw1EJKmKtevbW3jYgAA.u5PlpP06AlVsqMun.awI6', '2026-11-10 01:13:49'),
(4, 'thanh06055', 'thanh0605@gmail.com', '$2y$10$DMfpJAmGTFe3uVydbZmYNek3vuRajj1ng/43RHq2elMWN7gFh6Keu', '2026-11-10 01:39:29'),
(5, 'thanh111222', 'thanh111222@gmail.com', '$2y$10$sNxkMqafCth51XkQ2b7TZOTtqHdk2LxCTIkBdw/W1sOgGFWFxdN8e', '2026-11-12 09:33:38'),
(6, 'thanh112233', 'thanh112233@gmail.com', '$2y$10$thUHow9De8ItTPfmTMAng.YJthjD9HBaC7otxj4jqhKM1SZlCsVFi', '2026-11-12 09:35:42'),
(7, 'thanh11998', 'thanh119998@gmail.com', '$2y$10$dt5cmMBuTim70x.4oImVuOG.D6yUqPhc4vuId/fQozp0VXOJjfbUO', '2026-11-12 09:44:53'),
(8, 'thanh123', 'thanh123456@gmail.com', '$2y$10$Nhj2djjbPZuSZPuIs/wMAuz2lyZoTDIwQ6LoJnOv8t3Q7VETJvil2', '2026-11-12 10:03:22');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`) USING HASH;

--
-- Chỉ mục cho bảng `scan_history`
--
ALTER TABLE `scan_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `scan_history`
--
ALTER TABLE `scan_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `scan_history`
--
ALTER TABLE `scan_history`
  ADD CONSTRAINT `scan_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
