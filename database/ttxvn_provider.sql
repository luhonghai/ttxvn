-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 27, 2016 at 03:37 PM
-- Server version: 5.5.41-log
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ttxvn_provider`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `description`) VALUES
(4, 'Thời Sự', 'Thời Sự');

-- --------------------------------------------------------

--
-- Table structure for table `first_page`
--

CREATE TABLE IF NOT EXISTS `first_page` (
`id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `timeUp` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `first_page`
--

INSERT INTO `first_page` (`id`, `news_id`, `timeUp`) VALUES
(1, 1, '2016-02-27 16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
`id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `date_time` date NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `author` text COLLATE utf8_unicode_ci NOT NULL,
  `source` text COLLATE utf8_unicode_ci NOT NULL,
  `location` text COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `date_time`, `content`, `image`, `author`, `source`, `location`, `cat_id`) VALUES
(1, 'Biển lửa bao trùm kho lốp ôtô ở Bình Dương', '2016-02-21', 'Khoảng 12h30, lửa bất ngờ bùng lên ở kho phế liệu lốp ôtô rộng khoảng 1.000 m2 ở phường Bình Thắng, thị xã Dĩ An, Bình Dương. \r\n\r\n"Lúc đầu ngọn lửa bùng lên nhỏ nhưng do không có người dập nên hơn chục phút sau, đám cháy bao trùm cả kho. Tôi cuống cuồng kêu mấy đứa con dậy chạy ra ngoài hô hoán nhờ hàng xóm di dời đồ đạc ra giúp", chị Thái, nhà sát kho phế liệu, kể.\r\n\r\nDo trong kho chứa nhiều lốp ôtô nên lửa bùng cháy dữ dội. Đứng xa hàng km vẫn nhìn thấy cuộn khói đen cuồn cuộn bốc lên.\r\n\r\nĐến 14h, trong thời tiết nắng nóng 32 độ kèm với sức nóng của đám cháy, cảnh sát cứu hỏa đang nỗ lực cô lập ngọn lửa.', 'http://img.f29.vnecdn.net/2016/02/21/chay-2-9562-1456037901.jpg', 'Phước Tuấn', 'Vnexpress', 'Bình Dương', 4),
(7, 'Nút phản hồi trên Facebook - cuộc chơi mới cho các nhãn hàng', '2016-02-27', '<p class="Normal">Sau nhiều th&aacute;ng thử nghiệm tại một số quốc gia, từ 25/2, Facebook ch&iacute;nh thức đưa v&agrave;o sử dụng t&iacute;nh năng Reactions (phản ứng) mới thay cho n&uacute;t Like đơn thuần trước đ&acirc;y. Theo đ&oacute;, người d&ugrave;ng sẽ c&oacute; 5 c&aacute;ch biểu lộ trạng th&aacute;i với một chia sẻ n&agrave;o đ&oacute; bao gồm Love (y&ecirc;u), Haha, Wow (ngạc nhi&ecirc;n, trầm trồ), Sad (buồn) v&agrave; Angry (giận dữ). Đ&acirc;y được coi l&agrave; một trong những đợt n&acirc;ng cấp lớn nhất của Facebook kể từ khi ra mắt.</p>\n<p class="Normal">Facebook l&agrave; một k&ecirc;nh marketing trực tuyến phổ biến nhất hiện nay.&nbsp;C&aacute;c thương hiệu sản phẩm, dịch vụ (gọi chung l&agrave; c&aacute;c nh&atilde;n h&agrave;ng) của doanh nghiệp cũng đứng trước một cuộc chơi mới sau thay đổi n&agrave;y của Mark Zuckerberg v&agrave; c&aacute;c đồng sự.</p>\n<p class="Normal"><span style="color: #696969;"><strong>Cơ hội đi liền th&aacute;ch thức</strong></span></p>\n<p class="Normal">Dễ thấy trước hết đ&acirc;y l&agrave; cơ hội để tăng được tương t&aacute;c của c&ocirc;ng ch&uacute;ng với sản phẩm, dịch vụ.&nbsp;Trước kia, nếu kh&ocirc;ng th&iacute;ch sản phẩm, người d&ugrave;ng thường chọn việc bỏ qua, hiếm khi c&oacute; ai v&igrave; gh&eacute;t m&agrave; dừng lại b&igrave;nh luận hay chia sẻ v&agrave; viết th&ecirc;m mấy d&ograve;ng dẫn chuyện, trừ khi cảm x&uacute;c của họ bị đẩy l&ecirc;n rất cao. Nay họ c&oacute; thể phản ứng rất nhanh, rất tức thời nếu th&iacute;ch hay kh&ocirc;ng th&iacute;ch nội dung đ&oacute;.</p>\n<p class="Normal">Lựa chọn đa dạng hơn để b&agrave;y tỏ th&aacute;i độ, cảm x&uacute;c cũng sẽ l&agrave;m c&ocirc;ng ch&uacute;ng h&agrave;o hứng hơn trong việc phản hồi với sản phẩm, với nội dung marketing.&nbsp;C&oacute; thể xảy ra cơn b&atilde;o phản ứng nếu người d&ugrave;ng kh&ocirc;ng th&iacute;ch một sản phẩm, dịch vụ n&agrave;o đ&oacute; v&agrave; doanh nghiệp rất &ldquo;kh&oacute; đỡ&rdquo; khi họ chỉ cần nhấn n&uacute;t Tức giận.</p>\n<p class="Normal">Lợi &iacute;ch c&oacute; thể nh&igrave;n thấy rất nhanh l&agrave; doanh nghiệp dễ d&agrave;ng đo được phản ứng của c&ocirc;ng ch&uacute;ng với sản phẩm, dịch vụ của m&igrave;nh v&agrave; thước đo cũng s&acirc;u hơn trước.</p>\n<p class="Normal">Nhưng đi c&ugrave;ng đ&oacute;, việc l&agrave;m marketing mạng x&atilde; hội; social media n&oacute;i chung nay cũng kh&oacute; hơn, sức &eacute;p lớn hơn. Trong nội bộ, c&aacute;c nh&oacute;m chuy&ecirc;n marketing mạng x&atilde; hội v&agrave; ngo&agrave;i l&agrave; c&aacute;c c&ocirc;ng ty dịch vụ marketing truyền th&ocirc;ng đều phải &ldquo;căng m&igrave;nh&rdquo; hơn trước những phản hồi của c&ocirc;ng ch&uacute;ng.</p>\n<p class="Normal">Thử nghĩ nếu nh&atilde;n h&agrave;ng n&agrave;o chọn c&aacute;ch ti&ecirc;u cực l&agrave; xo&aacute; comment hay cấm c&aacute;c nick b&igrave;nh luận xấu, nay l&agrave;m sao c&oacute; thể soi v&agrave; xo&aacute; được nếu đối tượng chỉ "thả" ra một n&uacute;t Tức giận rồi bỏ đi?</p>', '', 'admin@ttxvn.com', 'VNEXpress', 'net', 4);

-- --------------------------------------------------------

--
-- Table structure for table `news_request`
--

CREATE TABLE IF NOT EXISTS `news_request` (
`id` bigint(20) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `news_request`
--

INSERT INTO `news_request` (`id`, `status`, `email`, `request_date`, `message`) VALUES
(1, 0, 'luhonghai@gmail.com', '2016-02-27 15:20:18', 'Please add new post about Hanoi'),
(2, 0, 'thinhpham38@gmail.com', '2016-02-27 00:00:00', 'tin thời sự'),
(3, 0, 'luhonghai@gmail.com', '2016-02-27 20:07:06', 'Please add new news about Hanoi');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` bigint(20) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` bit(1) DEFAULT b'1',
  `dob` datetime DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role`, `first_name`, `last_name`, `email`, `password`, `gender`, `dob`, `phone`, `address`) VALUES
(1, 0, 'Admin', 'TTXVN', 'admin@ttxvn.com', 'e10adc3949ba59abbe56e057f20f883e', b'1', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `first_page`
--
ALTER TABLE `first_page`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_request`
--
ALTER TABLE `news_request`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `first_page`
--
ALTER TABLE `first_page`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `news_request`
--
ALTER TABLE `news_request`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
