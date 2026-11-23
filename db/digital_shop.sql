-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 23, 2026 lúc 11:10 AM
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
-- Cơ sở dữ liệu: `digital_shop`
--

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
(14, 1, 'Đơn hàng mới', 'Khách hàng vừa thanh toán đơn hàng #7', 1, '2026-11-23 17:08:12');

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
(1, 1, 749000, 'completed', 'wallet', NULL, '2026-11-20 10:30:00', 0),
(2, 1, 250000, 'completed', 'wallet', NULL, '2026-11-22 15:45:00', 1),
(3, 1, 100000, 'completed', 'wallet', NULL, '2026-11-23 13:06:29', 0),
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
(1, 'Em Thanh', 'dacthanh123@gmail.com', '$2y$10$iu3c35dayrKzFBi7Kau.NOvVqJNdNb0KEVA.v/yWPJ/1RIl1CLeTu', 4655900, 'active', '2026-11-22 15:28:54');

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
