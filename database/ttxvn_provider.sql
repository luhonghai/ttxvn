-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 06, 2016 at 03:34 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `description`) VALUES
(4, 'Thời Sự', 'Thời Sự'),
(5, 'Giải trí', 'Giải trí'),
(6, 'Thể thao', 'Thể thao');

-- --------------------------------------------------------

--
-- Table structure for table `imagenews`
--

CREATE TABLE IF NOT EXISTS `imagenews` (
`id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `author` text COLLATE utf8_unicode_ci,
  `caption` text COLLATE utf8_unicode_ci,
  `title` text COLLATE utf8_unicode_ci,
  `infoSource` text COLLATE utf8_unicode_ci,
  `date_create` datetime DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci,
  `imageLink` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `imagenews`
--

INSERT INTO `imagenews` (`id`, `cat_id`, `author`, `caption`, `title`, `infoSource`, `date_create`, `location`, `imageLink`, `status`) VALUES
(1, 4, 'Thinh Pham', 'Thinh pham choi voi con', 'Thinh pham choi voi con', 'Thinh pham choi voi con', '2016-03-06 07:22:29', 'HN', 'Thinh pham choi voi con', 3),
(2, 5, 'Thinh Pham', 'Thinh pham choi voi con', 'Thinh pham choi voi con', 'Thinh pham choi voi con', '2016-03-06 07:22:29', 'HN', 'Thinh pham choi voi con', 3);

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
  `cat_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `date_time`, `content`, `image`, `author`, `source`, `location`, `cat_id`, `status`) VALUES
(1, 'Biển lửa bao trùm kho lốp ôtô ở Bình Dương', '2016-02-21', 'Khoảng 12h30, lửa bất ngờ bùng lên ở kho phế liệu lốp ôtô rộng khoảng 1.000 m2 ở phường Bình Thắng, thị xã Dĩ An, Bình Dương. \r\n\r\n"Lúc đầu ngọn lửa bùng lên nhỏ nhưng do không có người dập nên hơn chục phút sau, đám cháy bao trùm cả kho. Tôi cuống cuồng kêu mấy đứa con dậy chạy ra ngoài hô hoán nhờ hàng xóm di dời đồ đạc ra giúp", chị Thái, nhà sát kho phế liệu, kể.\r\n\r\nDo trong kho chứa nhiều lốp ôtô nên lửa bùng cháy dữ dội. Đứng xa hàng km vẫn nhìn thấy cuộn khói đen cuồn cuộn bốc lên.\r\n\r\nĐến 14h, trong thời tiết nắng nóng 32 độ kèm với sức nóng của đám cháy, cảnh sát cứu hỏa đang nỗ lực cô lập ngọn lửa.', 'http://img.f29.vnecdn.net/2016/02/21/chay-2-9562-1456037901.jpg', 'Phước Tuấn', 'Vnexpress', 'Bình Dương', 4, 2),
(7, 'Nút phản hồi trên Facebook - cuộc chơi mới cho các nhãn hàng', '2016-02-27', '<p class="Normal">Sau nhiều th&aacute;ng thử nghiệm tại một số quốc gia, từ 25/2, Facebook ch&iacute;nh thức đưa v&agrave;o sử dụng t&iacute;nh năng Reactions (phản ứng) mới thay cho n&uacute;t Like đơn thuần trước đ&acirc;y. Theo đ&oacute;, người d&ugrave;ng sẽ c&oacute; 5 c&aacute;ch biểu lộ trạng th&aacute;i với một chia sẻ n&agrave;o đ&oacute; bao gồm Love (y&ecirc;u), Haha, Wow (ngạc nhi&ecirc;n, trầm trồ), Sad (buồn) v&agrave; Angry (giận dữ). Đ&acirc;y được coi l&agrave; một trong những đợt n&acirc;ng cấp lớn nhất của Facebook kể từ khi ra mắt.</p>\n<p class="Normal">Facebook l&agrave; một k&ecirc;nh marketing trực tuyến phổ biến nhất hiện nay.&nbsp;C&aacute;c thương hiệu sản phẩm, dịch vụ (gọi chung l&agrave; c&aacute;c nh&atilde;n h&agrave;ng) của doanh nghiệp cũng đứng trước một cuộc chơi mới sau thay đổi n&agrave;y của Mark Zuckerberg v&agrave; c&aacute;c đồng sự.</p>\n<p class="Normal"><span style="color: #696969;"><strong>Cơ hội đi liền th&aacute;ch thức</strong></span></p>\n<p class="Normal">Dễ thấy trước hết đ&acirc;y l&agrave; cơ hội để tăng được tương t&aacute;c của c&ocirc;ng ch&uacute;ng với sản phẩm, dịch vụ.&nbsp;Trước kia, nếu kh&ocirc;ng th&iacute;ch sản phẩm, người d&ugrave;ng thường chọn việc bỏ qua, hiếm khi c&oacute; ai v&igrave; gh&eacute;t m&agrave; dừng lại b&igrave;nh luận hay chia sẻ v&agrave; viết th&ecirc;m mấy d&ograve;ng dẫn chuyện, trừ khi cảm x&uacute;c của họ bị đẩy l&ecirc;n rất cao. Nay họ c&oacute; thể phản ứng rất nhanh, rất tức thời nếu th&iacute;ch hay kh&ocirc;ng th&iacute;ch nội dung đ&oacute;.</p>\n<p class="Normal">Lựa chọn đa dạng hơn để b&agrave;y tỏ th&aacute;i độ, cảm x&uacute;c cũng sẽ l&agrave;m c&ocirc;ng ch&uacute;ng h&agrave;o hứng hơn trong việc phản hồi với sản phẩm, với nội dung marketing.&nbsp;C&oacute; thể xảy ra cơn b&atilde;o phản ứng nếu người d&ugrave;ng kh&ocirc;ng th&iacute;ch một sản phẩm, dịch vụ n&agrave;o đ&oacute; v&agrave; doanh nghiệp rất &ldquo;kh&oacute; đỡ&rdquo; khi họ chỉ cần nhấn n&uacute;t Tức giận.</p>\n<p class="Normal">Lợi &iacute;ch c&oacute; thể nh&igrave;n thấy rất nhanh l&agrave; doanh nghiệp dễ d&agrave;ng đo được phản ứng của c&ocirc;ng ch&uacute;ng với sản phẩm, dịch vụ của m&igrave;nh v&agrave; thước đo cũng s&acirc;u hơn trước.</p>\n<p class="Normal">Nhưng đi c&ugrave;ng đ&oacute;, việc l&agrave;m marketing mạng x&atilde; hội; social media n&oacute;i chung nay cũng kh&oacute; hơn, sức &eacute;p lớn hơn. Trong nội bộ, c&aacute;c nh&oacute;m chuy&ecirc;n marketing mạng x&atilde; hội v&agrave; ngo&agrave;i l&agrave; c&aacute;c c&ocirc;ng ty dịch vụ marketing truyền th&ocirc;ng đều phải &ldquo;căng m&igrave;nh&rdquo; hơn trước những phản hồi của c&ocirc;ng ch&uacute;ng.</p>\n<p class="Normal">Thử nghĩ nếu nh&atilde;n h&agrave;ng n&agrave;o chọn c&aacute;ch ti&ecirc;u cực l&agrave; xo&aacute; comment hay cấm c&aacute;c nick b&igrave;nh luận xấu, nay l&agrave;m sao c&oacute; thể soi v&agrave; xo&aacute; được nếu đối tượng chỉ "thả" ra một n&uacute;t Tức giận rồi bỏ đi?</p>', '', 'admin@ttxvn.com', 'VNEXpress', 'net', 4, 2),
(8, '''Ronaldo đá đồng đội vào thùng rác''', '2016-02-29', '<p>Sau ph&aacute;t biểu g&acirc;y tranh c&atilde;i của CR7, họa sĩ Omar Momani kh&ocirc;ng ngần ngại v&iacute; von cầu thủ n&agrave;y như đang vứt đồng đội tại Real v&agrave;o th&ugrave;ng r&aacute;c theo kiểu vắt chanh bỏ vỏ.</p>\n<div class="item_slide_show" style="width: 100%;">\n<div class="desc_cation">\n<p>Ronaldo đ&atilde; c&oacute; &iacute;t nhất một Quả b&oacute;ng v&agrave;ng nhờ sự trợ gi&uacute;p từ c&aacute;c đồng đội tại Real, nhưng chỉ sau trận thua 0-1 trước Atletico tối 27/2, cầu thủ n&agrave;y tuy&ecirc;n bố thẳng: "Nếu đồng đội chơi tốt như t&ocirc;i, Real đ&atilde; dẫn đầu". Theo họa sĩ Momani, ph&aacute;t biểu n&agrave;y chẳng kh&aacute;c n&agrave;o n&oacute;i Real n&ecirc;n bỏ c&aacute;c cầu thủ c&ograve;n lại v&agrave;o th&ugrave;ng r&aacute;c v&agrave; cải tổ đội h&igrave;nh.&nbsp;</p>\n</div>\n<div class="clear">&nbsp;</div>\n</div>\n<div class="item_slide_show" style="width: 100%;">\n<div class="block_thumb_slide_show"><img id="vne_slide_image_1" class="left" style="cursor: url(''http://st.f1.vnecdn.net/responsive/js/utils/slideshow/css/slideshow/images/icons/zoom_cursor.png''), auto;" src="http://img.f1.thethao.vnecdn.net/2016/02/29/2-1456713904_660x0.jpg" alt="''Ronaldo đ&aacute; đồng đội v&agrave;o th&ugrave;ng r&aacute;c'' - ảnh thể thao" data-reference-id="23471966" data-component-caption="&lt;p&gt;\n	Sau khi d&ugrave;ng những tấm khi&ecirc;n mang t&ecirc;n Ancelotti, Benitez để chống lại những cơn mưa c&agrave; chua, Chủ tịch Real, Florentino Perez gặp thất bại với khi&ecirc;n mới Zidane. Những người phản đối kh&ocirc;n ngoan hơn khi chọn hướng kh&aacute;c để n&eacute;m. Trong trận Real thua Atletico, nhiều CĐV đ&atilde; k&ecirc;u gọi Perez từ chức.&lt;/p&gt;" /> <a class="btn_icon_show_slide_show">&nbsp;</a></div>\n<div class="desc_cation">\n<p>Sau khi d&ugrave;ng những tấm khi&ecirc;n mang t&ecirc;n Ancelotti, Benitez để chống lại những cơn mưa c&agrave; chua, Chủ tịch Real, Florentino Perez gặp thất bại với khi&ecirc;n mới Zidane. Những người phản đối kh&ocirc;n ngoan hơn khi chọn hướng kh&aacute;c để n&eacute;m. Trong trận Real thua Atletico, nhiều CĐV đ&atilde; k&ecirc;u gọi Perez từ chức.</p>\n</div>\n<div class="clear">&nbsp;</div>\n</div>\n<div class="item_slide_show" style="width: 100%;">\n<div class="block_thumb_slide_show"><img id="vne_slide_image_2" class="left" style="cursor: url(''http://st.f1.vnecdn.net/responsive/js/utils/slideshow/css/slideshow/images/icons/zoom_cursor.png''), auto;" src="http://img.f2.thethao.vnecdn.net/2016/02/29/3-1456713904_660x0.jpg" alt="''Ronaldo đ&aacute; đồng đội v&agrave;o th&ugrave;ng r&aacute;c'' - ảnh thể thao" data-reference-id="23471967" data-component-caption="&lt;p&gt;\n	Giữa tuần trước, Flamini chẳng những kh&ocirc;ng gi&uacute;p được g&igrave; cho Arsenal như Wenger kỳ vọng, m&agrave; c&ograve;n bồi cho &ocirc;ng thầy một đ&ograve;n khi phạm lỗi với Messi trong v&ograve;ng cấm. Barca nhờ đ&oacute; gi&agrave;nh chiến thắng 2-0 trong trận lượt đi v&ograve;ng 16 đội Champions League.&lt;/p&gt;" /> <a class="btn_icon_show_slide_show">&nbsp;</a></div>\n<div class="desc_cation">\n<p>Giữa tuần trước, Flamini chẳng những kh&ocirc;ng gi&uacute;p được g&igrave; cho Arsenal như Wenger kỳ vọng, m&agrave; c&ograve;n bồi cho &ocirc;ng thầy một đ&ograve;n khi phạm lỗi với Messi trong v&ograve;ng cấm. Barca nhờ đ&oacute; gi&agrave;nh chiến thắng 2-0 trong trận lượt đi v&ograve;ng 16 đội Champions League.</p>\n</div>\n<div class="clear">&nbsp;</div>\n</div>\n<div class="item_slide_show" style="width: 100%;">\n<div class="block_thumb_slide_show"><img id="vne_slide_image_3" class="left" style="cursor: url(''http://st.f1.vnecdn.net/responsive/js/utils/slideshow/css/slideshow/images/icons/zoom_cursor.png''), auto;" src="http://img.f1.thethao.vnecdn.net/2016/02/29/4-1456713905_660x0.jpg" alt="''Ronaldo đ&aacute; đồng đội v&agrave;o th&ugrave;ng r&aacute;c'' - ảnh thể thao" data-reference-id="23471968" data-component-caption="&lt;p&gt;\n	Khẩu thần c&ocirc;ng Arsenal v&agrave; thủ m&ocirc;n Petr Cech kh&ocirc;ng thể cản nổi Messi. Wenger chỉ c&ograve;n biết kh&oacute;c r&ograve;ng khi chứng kiến hy vọng v&agrave;o tứ kết Champions League đang mất dần.&lt;/p&gt;" /> <a class="btn_icon_show_slide_show">&nbsp;</a></div>\n<div class="desc_cation">\n<p>Khẩu thần c&ocirc;ng Arsenal v&agrave; thủ m&ocirc;n Petr Cech kh&ocirc;ng thể cản nổi Messi. Wenger chỉ c&ograve;n biết kh&oacute;c r&ograve;ng khi chứng kiến hy vọng v&agrave;o tứ kết Champions League đang mất dần.</p>\n</div>\n<div class="clear">&nbsp;</div>\n</div>\n<div class="item_slide_show" style="width: 100%;">\n<div class="block_thumb_slide_show"><img id="vne_slide_image_4" class="left" style="cursor: url(''http://st.f1.vnecdn.net/responsive/js/utils/slideshow/css/slideshow/images/icons/zoom_cursor.png''), auto;" src="http://img.f2.thethao.vnecdn.net/2016/02/29/5-1456713906_660x0.jpg" alt="''Ronaldo đ&aacute; đồng đội v&agrave;o th&ugrave;ng r&aacute;c'' - ảnh thể thao" data-reference-id="23471969" data-component-caption="&lt;p&gt;\n	Đang nằm trong nh&oacute;m những cầu thủ ghi b&agrave;n nhiều nhất Serie A v&agrave; ch&acirc;u &Acirc;u, Higuain bỗng trở n&ecirc;n tầm thường khi gặp Zapata của AC Milan. Thất bại trước AC Milan khiến Napoli hụt hơi trong cuộc đua tới chức v&ocirc; địch Serie A với Juventus.&lt;/p&gt;" /> <a class="btn_icon_show_slide_show">&nbsp;</a></div>\n<div class="desc_cation">\n<p>Đang nằm trong nh&oacute;m những cầu thủ ghi b&agrave;n nhiều nhất Serie A v&agrave; ch&acirc;u &Acirc;u, Higuain bỗng trở n&ecirc;n tầm thường khi gặp Zapata của AC Milan. Thất bại trước AC Milan khiến Napoli hụt hơi trong cuộc đua tới chức v&ocirc; địch Serie A với Juventus.</p>\n</div>\n<div class="clear">&nbsp;</div>\n</div>\n<div class="item_slide_show" style="width: 100%;">\n<div class="block_thumb_slide_show"><img id="vne_slide_image_5" class="left" style="cursor: url(''http://st.f1.vnecdn.net/responsive/js/utils/slideshow/css/slideshow/images/icons/zoom_cursor.png''), auto;" src="http://img.f4.thethao.vnecdn.net/2016/02/29/6-1456713906_660x0.jpg" alt="''Ronaldo đ&aacute; đồng đội v&agrave;o th&ugrave;ng r&aacute;c'' - ảnh thể thao" data-reference-id="23471970" data-component-caption="&lt;p&gt;\n	Ở v&ograve;ng 25 Liga, Barca c&oacute; dịp bứt đi do hai đối thủ cạnh tranh đều mất điểm. Real bị Malaga cầm ch&acirc;n, c&ograve;n Atletico cũng chỉ c&oacute; một điểm trước đội kh&aacute;ch Villarreal.&lt;/p&gt;" /> <a class="btn_icon_show_slide_show">&nbsp;</a></div>\n<div class="desc_cation">\n<p>Ở v&ograve;ng 25 Liga, Barca c&oacute; dịp bứt đi do hai đối thủ cạnh tranh đều mất điểm. Real bị Malaga cầm ch&acirc;n, c&ograve;n Atletico cũng chỉ c&oacute; một điểm trước đội kh&aacute;ch Villarreal.</p>\n</div>\n<div class="clear">&nbsp;</div>\n</div>\n<div class="item_slide_show" style="width: 100%;">\n<div class="block_thumb_slide_show"><img id="vne_slide_image_6" class="left" style="cursor: url(''http://st.f1.vnecdn.net/responsive/js/utils/slideshow/css/slideshow/images/icons/zoom_cursor.png''), auto;" src="http://img.f3.thethao.vnecdn.net/2016/02/29/7-1456713907_660x0.jpg" alt="''Ronaldo đ&aacute; đồng đội v&agrave;o th&ugrave;ng r&aacute;c'' - ảnh thể thao" data-reference-id="23471971" data-component-caption="&lt;p&gt;\n	Với mục ti&ecirc;u dồn sức cho Champions League, chung kết Cup Li&ecirc;n đo&agrave;n v&agrave; Ngoại hạng Anh, Man City chấp nhận bỏ FA Cup, Trong trận gặp Chelsea, HLV Pellegrini chỉ tung đội h&igrave;nh dự bị v&agrave;o s&acirc;n v&agrave; nhận thất bại 1-5. Chiến thắng n&agrave;y của Chelsea chỉ được v&iacute; như ch&uacute; sư tử vồ chim.&lt;/p&gt;" /> <a class="btn_icon_show_slide_show">&nbsp;</a></div>\n<div class="desc_cation">\n<p>Với mục ti&ecirc;u dồn sức cho Champions League, chung kết Cup Li&ecirc;n đo&agrave;n v&agrave; Ngoại hạng Anh, Man City chấp nhận bỏ FA Cup, Trong trận gặp Chelsea, HLV Pellegrini chỉ tung đội h&igrave;nh dự bị v&agrave;o s&acirc;n v&agrave; nhận thất bại 1-5. Chiến thắng n&agrave;y của Chelsea chỉ được v&iacute; như ch&uacute; sư tử vồ chim.</p>\n</div>\n</div>', '', 'admin@ttxvn.com', 'Vnexpress', 'Châu Âu', 6, 2),
(9, ' Nhìn lại những phòng học mang tên Dân trí', '2016-03-01', '<p>Khởi c&ocirc;ng từ th&aacute;ng 10/2015, đến ng&agrave;y 26/2/2016, c&ocirc;ng tr&igrave;nh 5 ph&ograve;ng học D&acirc;n tr&iacute; tại trường THCS Chiềng Sơ (x&atilde; Chiềng Sơ, huyện S&ocirc;ng M&atilde;, tỉnh Sơn La) c&oacute; gi&aacute; trị l&ecirc;n đến 1,6 tỷ đồng đ&atilde; được kh&aacute;nh th&agrave;nh. Đ&acirc;y l&agrave; c&ocirc;ng tr&igrave;nh do b&aacute;o D&acirc;n tr&iacute; huy động từ nguồn hỗ trợ tại giải chạy Edurun 2015 do Hệ thống gi&aacute;o dục Vinschool tổ chức c&ugrave;ng với nguồn đối ứng từ ng&acirc;n s&aacute;ch địa phương. Số tiền gần 1,6 tỷ đồng để x&acirc;y dựng 5 ph&ograve;ng học tại x&atilde; miền n&uacute;i Chiềng Sơ c&oacute; thể kh&ocirc;ng lớn (mỗi ph&ograve;ng hơn 300 triệu đồng), nhưng đ&acirc;y thực sự l&agrave; một c&ocirc;ng tr&igrave;nh đặc biệt c&oacute; gi&aacute; trị v&agrave; &yacute; nghĩa đối với thầy c&ocirc; v&agrave; học sinh của trường.</p>\n<div class="VCSortableInPreviewMode">\n<div><img id="img_258614" style="max-width: 100%;" src="https://dantri4.vcmedia.vn/k:thumb_w/640/2016/chieng-so-3-1456805152867/nhin-lai-nhung-phong-hoc-mang-ten-dan-tri.jpg" alt="\nMột d&atilde;y ph&ograve;ng học tranh tre nứa l&aacute; của Trường THCS Chiềng Sơ (x&atilde; Chiềng Sơ, huyện S&ocirc;ng M&atilde;, tỉnh Sơn La) khi chưa được đầu tư x&acirc;y dựng mới\n" /></div>\n<div class="PhotoCMS_Caption">\n<p style="text-align: center; margin: 0px;">Một d&atilde;y ph&ograve;ng học tranh tre nứa l&aacute; của Trường THCS Chiềng Sơ (x&atilde; Chiềng Sơ, huyện S&ocirc;ng M&atilde;, tỉnh Sơn La) khi chưa được đầu tư x&acirc;y dựng mới</p>\n</div>\n</div>\n<div class="VCSortableInPreviewMode">\n<div><img id="img_258622" style="max-width: 100%;" src="https://dantri4.vcmedia.vn/k:thumb_w/640/2016/chieng-so-1-1456805152864/nhin-lai-nhung-phong-hoc-mang-ten-dan-tri.jpg" alt="\nTại đ&acirc;y, thầy v&agrave; tr&ograve; phải ngồi học trong cảnh thiếu &aacute;nh s&aacute;ng v&igrave; kh&ocirc;ng c&oacute; điện, m&ugrave;a mưa th&igrave; dột tứ bề, m&ugrave;a nắng th&igrave; bỏng r&aacute;t, hanh kh&ocirc;\n" /></div>\n<div class="PhotoCMS_Caption">\n<p style="text-align: center; margin: 0px;">Tại đ&acirc;y, thầy v&agrave; tr&ograve; phải ngồi học trong cảnh thiếu &aacute;nh s&aacute;ng v&igrave; kh&ocirc;ng c&oacute; điện, m&ugrave;a mưa th&igrave; dột tứ bề, m&ugrave;a nắng th&igrave; bỏng r&aacute;t, hanh kh&ocirc;</p>\n</div>\n</div>\n<div class="VCSortableInPreviewMode">\n<div><img id="img_258623" style="max-width: 100%;" src="https://dantri4.vcmedia.vn/k:thumb_w/640/2016/chieng-so-2-1456805152866/nhin-lai-nhung-phong-hoc-mang-ten-dan-tri.jpg" alt="\n30 năm qua, trường vẫn trong cảnh tranh tre nứa l&aacute;, tạm bợ, nhếch nh&aacute;c\n" /></div>\n<div class="PhotoCMS_Caption">\n<p style="text-align: center; margin: 0px;">30 năm qua, trường vẫn trong cảnh tranh tre nứa l&aacute;, tạm bợ, nhếch nh&aacute;c</p>\n</div>\n</div>\n<p>N&oacute;i gi&aacute; trị, l&agrave; v&igrave; đ&atilde; hơn 30 năm nay, một ng&ocirc;i trường với hơn 500 em học sinh vẫn phải học trong những ph&ograve;ng học tranh tre nứa l&aacute;, tồi t&agrave;n đến mức kh&oacute; tin. Ở những ph&ograve;ng học đ&oacute;, m&ugrave;a mưa th&igrave; dột, m&ugrave;a nắng th&igrave; bỏng r&aacute;t, quanh năm lại kh&ocirc;ng c&oacute; điện n&ecirc;n &aacute;nh s&aacute;ng trong lớp cứ t&ugrave; m&ugrave;. Nh&agrave; trường c&oacute; 15 ph&ograve;ng học m&agrave; c&oacute; đến 5 ph&ograve;ng học tranh tre nứa l&aacute;, 6 ph&ograve;ng học cấp 4 đ&atilde; xuống cấp trầm trọng. Đ&atilde; nhiều lần nh&agrave; trường đề xuất với ch&iacute;nh quyền cấp huyện cũng như cấp x&atilde;, đề xuất l&ecirc;n cả ph&ograve;ng gi&aacute;o dục về việc hỗ trợ x&acirc;y dựng ph&ograve;ng học cho nh&agrave; trường, nhưng rồi năm n&agrave;y qua năm kh&aacute;c, thầy v&agrave; tr&ograve; của trường Chiềng Sơ vẫn phải chịu cảnh dạy v&agrave; học một c&aacute;ch tạm bợ, kh&oacute; khăn.</p>', '', 'reporter@ttxvn.com', 'Dantri', 'Hanoi', 4, 0),
(10, '“Không cần ông là Bí thư hay Chủ tịch, miễn làm lợi cho dân là được trân trọng”', '2016-03-01', '<h2 class="fon33 mt1 sapo">&ldquo;Người d&acirc;n kh&ocirc;ng cần &ocirc;ng l&agrave; B&iacute; thư hay Chủ tịch, Tổng Gi&aacute;m đốc, miễn &ocirc;ng l&agrave;m c&oacute; lợi cho họ th&igrave; họ tr&acirc;n trọng&rdquo;, B&iacute; thư Th&agrave;nh ủy TPHCM Đinh La Thăng nhấn mạnh.<br /><a title="B&iacute; thư Thăng: &ldquo;Muốn TPHCM l&agrave; đầu t&agrave;u th&igrave; phải c&oacute; cơ chế đặc biệt cho đầu t&agrave;u&rdquo;" href="http://dantri.com.vn/xa-hoi/bi-thu-thang-muon-tphcm-la-dau-tau-thi-phai-co-co-che-dac-biet-cho-dau-tau-20160227162952729.htm"><strong>&nbsp;&gt;&gt;&nbsp;B&iacute; thư Thăng: &ldquo;Muốn TPHCM l&agrave; đầu t&agrave;u th&igrave; phải c&oacute; cơ chế đặc biệt cho đầu t&agrave;u&rdquo;</strong></a><br /><a title="Th&ugrave;ng r&aacute;c để sai chỗ, d&acirc;n cũng phản &aacute;nh tới B&iacute; thư th&agrave;nh phố!" href="http://dantri.com.vn/xa-hoi/thung-rac-de-sai-cho-dan-cung-phan-anh-toi-bi-thu-thanh-pho-20160227082536651.htm"><strong>&nbsp;&gt;&gt;&nbsp;Th&ugrave;ng r&aacute;c để sai chỗ, d&acirc;n cũng phản &aacute;nh tới B&iacute; thư th&agrave;nh phố!</strong></a><br /><a title="B&iacute; thư H&agrave; Nội: &ldquo;Th&agrave; sống ngh&egrave;o b&igrave;nh y&ecirc;n c&ograve;n hơn gi&agrave;u bon chen&rdquo;" href="http://dantri.com.vn/chinh-tri/bi-thu-ha-noi-tha-song-ngheo-binh-yen-con-hon-giau-bon-chen-20160223202034586.htm"><strong>&nbsp;&gt;&gt;&nbsp;B&iacute; thư H&agrave; Nội: &ldquo;Th&agrave; sống ngh&egrave;o b&igrave;nh y&ecirc;n c&ograve;n hơn gi&agrave;u bon chen&rdquo;</strong></a></h2>\n<div id="divNewsContent" class="fon34 mt3 mr2 fon43 detail-content">\n<p>Đ&oacute; l&agrave; một trong h&agrave;ng loạt c&aacute;c chỉ đạo của Ủy vi&ecirc;n Bộ Ch&iacute;nh trị, B&iacute; thư Th&agrave;nh ủy TPHCM <strong><a title="Đinh La Thăng" draggable="false" href="http://dantri.com.vn/van-hoa/anh-dinh-la-thang-lam-nghe-sy-thi-chi-trung-khong-co-dat-song-20160225101240946.htm" target="_blank">Đinh La Thăng</a></strong> trong buổi kiểm tra việc tổ chức học tập, qu&aacute;n triệt v&agrave; triển khai thực hiện Nghị quyết Đại hội Đảng bộ TP lần thứ X nhiệm kỳ 2015-2020 tại Đảng ủy khối Doanh nghiệp c&ocirc;ng nghiệp Trung ương tại TPHCM diễn ra v&agrave;o chiều nay, 1/3.</p>\n<p>Tại buổi kiểm tra, vấn đề được đặt ra chủ yếu l&agrave; nh&igrave;n nhận, đ&aacute;nh gi&aacute; đ&uacute;ng vai tr&ograve;, vị tr&iacute;, nhiệm vụ của Đảng ủy trong doanh nghiệp.</p>\n<div class="VCSortableInPreviewMode" style="display: inline-block; width: 100%; text-align: center; -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;">\n<div><img id="img_259083" style="max-width: 100%;" src="https://dantri4.vcmedia.vn/k:33f85ba0cc/2016/03/01/img-4471-1456833342831/khong-can-ong-la-bi-thu-hay-chu-tich-mien-lam-loi-cho-dan-la-duoc-tran-trong.jpg" alt="B&iacute; thư Đinh La Thăng: &ldquo;Người d&acirc;n kh&ocirc;ng cần &ocirc;ng l&agrave; B&iacute; thư hay Chủ tịch, Tổng Gi&aacute;m đốc, miễn &ocirc;ng l&agrave;m c&oacute; lợi cho họ th&igrave; họ tr&acirc;n trọng&rdquo;" /></div>\n<div class="PhotoCMS_Caption">B&iacute; thư Đinh La Thăng: &ldquo;Người d&acirc;n kh&ocirc;ng cần &ocirc;ng l&agrave; B&iacute; thư hay Chủ tịch, Tổng Gi&aacute;m đốc, miễn &ocirc;ng l&agrave;m c&oacute; lợi cho họ th&igrave; họ tr&acirc;n trọng&rdquo;</div>\n</div>\n<p><strong>Con người l&agrave; quan trọng</strong></p>\n<p>B&aacute;o c&aacute;o trước B&iacute; thư Đinh La Thăng v&agrave; Đo&agrave;n kiểm tra của Ban thường vụ Th&agrave;nh ủy, &ocirc;ng L&ecirc; Văn Quang, B&iacute; thư Đảng ủy khối doanh nghiệp c&ocirc;ng nghiệp trung ương tại TPHCM đ&aacute;nh gi&aacute; cao vai tr&ograve; của Đảng ủy trong doanh nghiệp. Đặc biệt, trong thời hội nhập kinh tế, Đảng ủy khối đ&atilde; chủ động tuy&ecirc;n truyền để doanh nghiệp kh&ocirc;ng hụt hẫng, kh&ocirc;ng thua ngay tr&ecirc;n s&acirc;n nh&agrave;&hellip;</p>\n<p>B&iacute; thư Đinh La Thăng đặt vấn đề, nếu kh&ocirc;ng c&oacute; Đảng ủy khối th&igrave; doanh nghiệp c&oacute; hoạt động được kh&ocirc;ng? Vai tr&ograve; vị tr&iacute; của Đảng ủy khối Doanh nghiệp đối với hoạt động của doanh nghiệp như thế n&agrave;o?</p>\n<p>&Ocirc;ng L&ecirc; Văn Quang khẳng định, vai tr&ograve; l&atilde;nh đạo của Đảng được x&aacute;c định l&agrave; quan trọng. Kh&ocirc;ng thể một doanh nghiệp m&agrave; kh&ocirc;ng c&oacute; tổ chức Đảng, nhất l&agrave; doanh nghiệp c&oacute; số đ&ocirc;ng c&ocirc;ng nh&acirc;n. T&aacute;c động của Đảng đối với doanh nghiệp l&agrave; vấn đề ổn định ch&iacute;nh trị.</p>\n<p>B&iacute; thư Đinh La Thăng tiếp tục đặt c&acirc;u hỏi: Liệu kh&ocirc;ng c&ograve;n chức Chủ tịch HĐQT, Tổng Gi&aacute;m đốc th&igrave; c&oacute; c&ograve;n chức B&iacute; thư Đảng bộ của doanh nghiệp kh&ocirc;ng? &Ocirc;ng Thăng cho rằng, tồn tại của Đảng l&agrave; kh&aacute;ch quan chứ kh&ocirc;ng bắt buộc doanh nghiệp phải c&oacute; tổ chức Đảng. Vai tr&ograve;, vị thế kh&ocirc;ng phải từ một quyết định m&agrave; l&agrave; xuất ph&aacute;t từ c&aacute; nh&acirc;n đ&oacute;. Yếu tố con người l&agrave; quan trọng hơn cả.</p>\n<p>Quay sang b&agrave; Nguyễn Thị T&iacute;m, Ph&oacute; B&iacute; thư Thường trực Đảng ủy khối, B&iacute; thư Thăng hỏi: &ldquo;Nếu kh&ocirc;ng c&oacute; Đảng ủy khối th&igrave; doanh nghiệp c&oacute; ph&aacute;t triển kh&ocirc;ng hay kh&ocirc;ng c&oacute; Đảng ủy khối th&igrave; tụt lu&ocirc;n?&rdquo;.</p>\n<p>B&agrave; T&iacute;m cho biết, vừa qua, một c&ocirc;ng ty nước giải kh&aacute;t tại TPHCM gặp nhiều kh&oacute; khăn. Nhờ Bộ C&ocirc;ng thương đưa người kh&aacute;c về thay n&ecirc;n nay c&oacute; khởi sắc. Nhiều doanh nghiệp kh&ocirc;ng c&ograve;n vốn nh&agrave; nước v&agrave; người nước ngo&agrave;i điều h&agrave;nh nhưng tổ chức Đảng hoạt động tốt. Nhiều B&iacute; thư Đảng ủy l&agrave; c&aacute;n bộ tổ chức chứ kh&ocirc;ng nhất thiết l&agrave; Chủ tịch HĐQT hay Tổng Gi&aacute;m đốc.</p>\n<p>&Ocirc;ng Trần Thanh V&acirc;n, Ph&oacute; B&iacute; thư đảng ủy khối doanh nghiệp c&ocirc;ng nghiệp cho biết, khi Trung Quốc hạ đặt gi&agrave;n khoan Hải Dương 981 tr&aacute;i ph&eacute;p trong v&ugrave;ng đặc quyền kinh tế Việt Nam, nhiều c&ocirc;ng nh&acirc;n biểu t&igrave;nh, đập ph&aacute; một c&aacute;ch qu&aacute; kh&iacute;ch. Tuy nhi&ecirc;n, c&aacute;c doanh nghiệp trong Đảng ủy khối kh&ocirc;ng c&oacute; t&igrave;nh trạng n&agrave;y nhờ v&agrave;o những chỉ đạo, giải th&iacute;ch một c&aacute;ch đầy đủ, s&acirc;u s&aacute;t. &ldquo;Điều đ&oacute;, cho thấy trong hoạt động của doanh nghiệp c&oacute; 2 mảng lớn l&agrave; con người v&agrave; sản xuất kinh doanh. Nếu kh&ocirc;ng c&oacute; vai tr&ograve; của Đảng ủy khối th&igrave; số doanh nghiệp n&agrave;y sẽ l&agrave; g&aacute;nh nặng đối với Đảng ủy về con người&rdquo;, &ocirc;ng V&acirc;n n&oacute;i.</p>\n<p>B&agrave; Mai Kiều Li&ecirc;n, Tổng Gi&aacute;m đốc C&ocirc;ng ty Cổ phần sữa Việt Nam &ndash; Vinamilk n&oacute;i rằng, vai tr&ograve; của Đảng trong doanh nghiệp l&agrave; rất cần thiết. Vinamilk c&oacute; tr&ecirc;n 5.000 c&aacute;n bộ nh&acirc;n vi&ecirc;n v&agrave; hơn 400 Đảng vi&ecirc;n, vốn Nh&agrave; nước c&ograve;n 45%, nước ngo&agrave;i 49% v&agrave; tư nh&acirc;n tr&ecirc;n 5% nhưng kh&ocirc;ng v&igrave; thế m&agrave; mất đi vai tr&ograve; của Đảng bộ c&ocirc;ng ty. &ldquo;Đảng l&atilde;nh đạo to&agrave;n diện nhưng quan trọng nhất l&agrave; con người. Người đ&oacute; ưu t&uacute;, phải đi trước, phải giải quyết c&ocirc;ng việc, tạo cuộc sống cho c&aacute;n bộ nh&acirc;n vi&ecirc;n v&agrave; tăng trưởng c&ocirc;ng ty. Ch&uacute;ng t&ocirc;i &aacute;p dụng một c&aacute;ch s&aacute;ng tạo những đường lối của Đảng. C&ugrave;ng đường lối m&agrave; kh&ocirc;ng s&aacute;ng tạo th&igrave; rất kh&oacute; cạnh tranh&rdquo;, b&agrave; Li&ecirc;n n&oacute;i.</p>\n<p><strong>L&agrave;m lợi cho d&acirc;n th&igrave; được tr&acirc;n trọng</strong></p>\n<p>B&iacute; thư Th&agrave;nh ủy Đinh La Thăng n&oacute;i rằng, Đảng bộ hoạt động tốt m&agrave; sản xuất kinh doanh thua lỗ th&igrave; cũng kh&ocirc;ng ổn. Phải b&aacute;m s&aacute;t, phối hợp c&ugrave;ng với l&atilde;nh đạo, chủ doanh nghiệp d&ugrave; l&agrave; doanh nghiệp Nh&agrave; nước hay cổ phần. Phải x&acirc;y dựng đội ngũ c&aacute;n bộ c&oacute; phẩm chất, năng lực v&agrave; đặc biệt c&oacute; tấm l&ograve;ng tận tụy phục vụ người d&acirc;n. Đảng kh&ocirc;ng chỉ thuần t&uacute;y l&agrave; tuy&ecirc;n truyền m&agrave; phải b&aacute;m s&aacute;t sản xuất, kinh doanh.</p>\n<p>&Ocirc;ng Thăng y&ecirc;u cầu &ocirc;ng L&ecirc; Văn Quang, B&iacute; thư Đảng ủy khối doanh nghiệp c&ocirc;ng nghiệp trung ương tại TPHCM, ph&aacute;t động phong tr&agrave;o to&agrave;n thể c&ocirc;ng nh&acirc;n vi&ecirc;n kh&ocirc;ng vứt r&aacute;c ra đường để g&oacute;p phần chỉnh trang đ&ocirc; thị. "Chỉ cần họ kh&ocirc;ng vứt r&aacute;c l&agrave; tốt lắm rồi. H&agrave;ng ngh&igrave;n người vứt r&aacute;c m&agrave; c&oacute; v&agrave;i chị lao c&ocirc;ng đi qu&eacute;t r&aacute;c th&igrave; l&agrave;m sao c&oacute; mỹ quan đ&ocirc; thị được", &ocirc;ng Thăng n&oacute;i.</p>\n<p>B&iacute; thư Thăng cho biết, vừa qua Trường Đại học T&ocirc;n Đức Thắng được Bộ Thương mại Hoa Kỳ cấp 3 bằng s&aacute;ng chế: Giường y tế, Thiết bị n&acirc;ng vận chuyển bệnh nh&acirc;n, thiết bị hỗ trợ n&acirc;ng chuyển bệnh nh&acirc;n giữa giường bệnh v&agrave; bồn tắm. Từ đ&acirc;y, &ocirc;ng Thăng cho rằng, Đảng ủy khối cần gi&uacute;p thương mại h&oacute;a c&aacute;c s&aacute;ng chế n&agrave;y. C&oacute; như thế mới biến s&aacute;ng chế khoa học th&agrave;nh sản phẩm thương mại, từ đ&oacute; tạo c&ocirc;ng ăn việc l&agrave;m cho c&ocirc;ng nh&acirc;n, tăng doanh thu doanh nghiệp.</p>\n<p>&ldquo;Người d&acirc;n kh&ocirc;ng cần &ocirc;ng l&agrave; B&iacute; thư hay Chủ tịch, Tổng Gi&aacute;m đốc, miễn &ocirc;ng l&agrave;m c&oacute; lợi cho họ th&igrave; họ tr&acirc;n trọng&rdquo;, &ocirc;ng Thăng nhấn mạnh.</p>\n<p>&ldquo;Trong 7 nhiệm vụ đột ph&aacute; m&agrave; Đại hội Đảng bộ TPHCM lần thứ 10 đề ra, trong đ&oacute; c&oacute; mục ti&ecirc;u đẩy mạnh ph&aacute;t triển c&ocirc;ng nghệ cao. T&ocirc;i cho rằng kh&ocirc;ng phải x&acirc;y dựng 1, 2 khu c&ocirc;ng nghệ cao l&agrave; xong m&agrave; cần phải đặt mục ti&ecirc;u biến TPHCM l&agrave; th&agrave;nh phố c&ocirc;ng nghệ. C&oacute; vậy mới xứng danh th&agrave;nh phố đ&aacute;ng sống, văn minh, hiện đại, nghĩa t&igrave;nh&rdquo;, B&iacute; thư Đinh La Thăng nhấn mạnh.</p>\n</div>', '', 'reporter@ttxvn.com', 'dantri', 'HCM', 4, 2);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `news_request`
--

INSERT INTO `news_request` (`id`, `status`, `email`, `request_date`, `message`) VALUES
(1, 0, 'luhonghai@gmail.com', '2016-02-27 15:20:18', 'Please add new post about Hanoi'),
(2, 0, 'thinhpham38@gmail.com', '2016-02-27 00:00:00', 'tin thời sự'),
(3, 0, 'luhonghai@gmail.com', '2016-02-27 20:07:06', 'Please add new news about Hanoi'),
(4, 0, 'thinhpham38@gmail.com', '2016-02-29 22:58:07', 'ád'),
(5, 0, 'thinhpham38@gmail.com', '2016-03-01 13:26:34', 'a'),
(6, 0, 'thinhpham38@gmail.com', '2016-03-01 23:17:56', 'cần tin về giá xăng dầu'),
(7, 0, 'luhonghai@gmail.com', '2016-03-06 18:01:37', '12345');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role`, `first_name`, `last_name`, `email`, `password`, `gender`, `dob`, `phone`, `address`) VALUES
(1, 0, 'Admin', 'TTXVN', 'admin@ttxvn.com', 'e10adc3949ba59abbe56e057f20f883e', b'1', NULL, NULL, NULL),
(2, 1, 'Editor', 'TTXVN', 'editor@ttxvn.com', 'e10adc3949ba59abbe56e057f20f883e', b'1', NULL, '', ''),
(3, 2, 'Reporter', 'TTXVN', 'reporter@ttxvn.com', 'e10adc3949ba59abbe56e057f20f883e', b'1', NULL, '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imagenews`
--
ALTER TABLE `imagenews`
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `imagenews`
--
ALTER TABLE `imagenews`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `news_request`
--
ALTER TABLE `news_request`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
