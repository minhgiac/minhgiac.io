-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 17, 2022 lúc 06:23 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `product_manage`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `adminaccount`
--

CREATE TABLE `adminaccount` (
  `admin_username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_fullname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `adminaccount`
--

INSERT INTO `adminaccount` (`admin_username`, `admin_password`, `admin_fullname`) VALUES
('admin1', '14e1b600b1fd579f47433b88e8d85291', 'Administrator 1'),
('admin2', '14e1b600b1fd579f47433b88e8d85291', 'Administrator 2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `contact_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_message` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_time` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`contact_id`, `contact_name`, `contact_email`, `contact_title`, `contact_message`, `contact_time`) VALUES
(13, 'User 01', 'user1@gmail.com', 'Help me', 'I don not know how to purchase, please guide me. Thank you.', '2022-12-03'),
(14, 'User 02', 'user02@yahoo.com', 'User 02 feedback', 'Please guide me how to change password.\r\nThanks.', '2022-12-03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `create_date` date NOT NULL DEFAULT current_timestamp(),
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `invoice`
--

INSERT INTO `invoice` (`id`, `user_id`, `total_price`, `create_date`, `address`) VALUES
(4, 15, 50000, '2022-12-03', '41 CMT8, Q.Ninh Kiều, TP.Cần Thơ'),
(5, 16, 210000, '2022-12-03', '66 Võ Văn Tần, quận Thanh Khê, Đà Nẵng'),
(6, 15, 45000, '2022-12-09', '41 CMT8, Q.Ninh Kiều, TP.Cần Thơ'),
(7, 17, 50000, '2022-12-17', 'Q.NinhKieu TP.CanTho');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `invoice_detail`
--

INSERT INTO `invoice_detail` (`id`, `product_id`, `quantity`, `invoice_id`) VALUES
(8, 78, 3, 4),
(9, 82, 2, 4),
(10, 88, 2, 5),
(11, 82, 3, 5),
(12, 80, 5, 5),
(13, 80, 1, 6),
(14, 78, 1, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `product_id` int(10) NOT NULL,
  `product_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_description` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_price`, `product_description`, `product_image`) VALUES
(78, 'Camo tee', 45000, 'Tee', 'Images/1670569429-ao1.jpg'),
(80, 'BAPE Snake By Bathing Ape Tee', 45000, 'Tee', 'Images/1670569575-ao6.jpg'),
(81, 'X OVO Ape Head Tee', 55000, 'Tee', 'Images/1670569804-ao8.jpg'),
(82, 'ABC Camo Side Big Ape Head Tee', 65000, 'Tee', 'Images/1670569926-ao9.jpg'),
(83, 'STA Patched Flight Jacket', 90000, 'Jacket', 'Images/1670569956-ao7.jpg'),
(84, 'BAPE Stencil Loose Fit MA-1', 85000, 'Jacket', 'Images/1670570083-ao3.jpg'),
(85, 'BAPE Chino Work Pants', 70000, 'Trousers', 'Images/1670570130-ao5.jpg'),
(86, 'BAPE Loose Fit Chino', 75000, 'Trousers', 'Images/1670570209-ao4.jpg'),
(88, 'College hoodie', 90000, 'Hoodie', 'Images/1670570348-ao2.jpg'),
(92, 'Tee', 20000, '100% cotton shirt', 'Images/1671223404-z3965828558680_48515f7426c71efcaf2e69ec554eb97b.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_ID` int(9) NOT NULL,
  `user_fullname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_phonenumber` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_ID`, `user_fullname`, `user_email`, `user_phonenumber`, `user_password`, `user_address`, `user_status`) VALUES
(16, 'User 02', 'user2@yahoo.com', '0911223344', 'e10adc3949ba59abbe56e057f20f883e', '66 Võ Văn Tần, quận Thanh Khê, Đà Nẵng', 1),
(17, 'leminhgiac', 'GiacLMBC00033@fpt.edu.vn', '0767963755', 'e10adc3949ba59abbe56e057f20f883e', 'Q.NinhKieu TP.CanTho', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `adminaccount`
--
ALTER TABLE `adminaccount`
  ADD PRIMARY KEY (`admin_username`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Chỉ mục cho bảng `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD CONSTRAINT `invoice_detail_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  ADD CONSTRAINT `invoice_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
