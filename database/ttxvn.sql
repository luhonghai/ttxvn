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
-- Database: `ttxvn`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `description`) VALUES
(4, 'Thời Sự', 'Thời Sự'),
(5, 'Thể thao', 'Thể thao');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
`id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `date_time` datetime NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `image` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `author` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `source` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `location` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cat_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `uuid` text
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

CREATE TABLE IF NOT EXISTS `imagenews` (
`id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `caption` text CHARACTER SET utf8 COLLATE utf8_bin,
  `date_create` datetime NOT NULL,
  `imageLink` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `author` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `infoSource` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `location` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cat_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `uuid` text
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `date_time`, `content`, `image`, `author`, `source`, `location`, `cat_id`, `status`, `uuid`) VALUES
(2, 'Chủ tịch Đường sắt bị xem xét kỷ luật vì chủ trương mua tàu cũ', 'Bộ Giao thông Vận tải cho biết sẽ xem xét việc kỷ luật Chủ tịch Hội đồng thành viên Tổng công ty Đường sắt Việt Nam trong việc chỉ đạo khảo sát, nghiên cứu đầu tư mua toa tàu chở hàng cũ của Trung Quốc. ', '2016-02-25 00:00:00', ' Đây là một trong những nội dung đáng chú ý được lãnh đạo Bộ Giao thông đưa ra sau cuộc họp ngày 25/2 về vụ việc tại Tổng công ty Đường sắt Việt Nam, sau khi cơ quan này thành lập đoàn kiểm tra và làm việc tại doanh nghiệp.\r\n\r\nCụ thể, lãnh đạo Bộ, thời gian qua, Thủ tướng đã phê duyệt kế hoạch phát triển Tổng công ty Đường sắt giai đoạn 2012-2015. Theo đó, đơn vị này đã tập trung nguồn lực để triển khai thực hiện các dự án đóng mới, nâng cấp các toa xe đạt được kết quả, đã đưa vào khai thác phục vụ nhu cầu của hành khách, khách hàng.\r\nchu-tich-duong-sat-bi-xem-xet-ky-luat-vi-chu-truong-mua-tau-cu\r\n\r\nQua đánh giá của đoàn kiểm tra của Bộ Giao thông Vận tải, tại danh mục các dự án phát triển phương tiện đường sắt giai đoạn 2012-2015, mục dự án đầu tư toa xe chỉ được đầu tư đóng mới, không có danh mục đầu tư toa xe đã qua sử dụng. Tuy nhiên, Tổng công ty Đường sắt, Công ty Vận tải đường sắt Hà Nội và các đơn vị có liên quan vẫn có chủ trương thực hiện việc khảo sát, nghiên cứu mua toa xe đã qua sử dụng khi chưa có sự chấp thuận của Thủ tướng và Bộ Giao thông Vận tải. Đồng thời, đơn vị này cũng được kết luận là cung cấp thông tin cho cơ quan ngôn luận không đầy đủ, thiếu chính xác nên, gây dư luận hiểu lầm, ảnh hưởng đến uy tín của ngành. \r\n\r\nDo đó, lãnh đạo Bộ Giao thông Vận tải đã thống nhất sẽ thực hiện các quy trình thủ tục xem xét việc kỷ luật Chủ tịch Hội đồng thành viên Tổng công ty Đường sắt trong việc chỉ đạo khảo sát, nghiên cứu đầu tư chưa đúng chủ trương của Thủ tướng. Ngoài ra, yêu cầu cơ quan quản lý cũng yêu cầu Hội đồng thành viên Tổng công ty Đường sắt nghiêm túc tổ chức kiểm điểm, làm rõ trách nhiệm của Hội đồng thành viên, Ban lãnh đạo Tổng công ty và các cán bộ có liên quan theo đúng chỉ đạo của Bộ Giao thông Vận tải. \r\n\r\nTrước đó, từ năm 2014, Tổng công ty Đường sắt Việt Nam đã có chủ trương mua 164 toa tàu cũ của Cục Đường sắt Côn Minh (Trung Quốc). Trên một số văn bản đã có bút phê của lãnh đạo Tổng công ty là “nhất trí thực hiện nhanh chủ trương đầu tư toa xe hàng đã qua sử dụng của Trung Quốc. Đề nghị tổ chức triển khai”. Lãnh đạo Tổng công ty này cũng đã có một số cuộc họp bàn với Cục Đường sắt Côn Minh về kế hoạch mua tàu cũ.\r\n\r\nTuy nhiên, thông tin với báo chí, Tổng công ty Đường sắt Việt Nam khẳng định không có bất cứ văn bản nào cho phép đầu tư cũng như chấp thuận chủ trương đầu tư dự án nhập khẩu toa xe hàng của Trung Quốc đã qua sử dụng. Bản thân Chủ tịch Tổng công ty - ông Trần Ngọc Thành cũng từng trả lời với báo chí rằng không có chủ trương này mà đề xuất xuất phát từ cấp dưới. Tuy  nhiên, trao đổi với VnExpress sau này, ông Thành đã thừa nhận đây là chủ trương “của tập thể” và sẵn sàng nhận lỗi nếu Tổng công ty có lỗi.\r\n\r\nĐến nay, Hội đồng thành viên Tổng công ty Đường sắt đã miễn nhiệm và cách chức Tổng giám đốc Công ty Vận tải đường sắt Hà Nội với tư cách là người đại diện phần vốn Nhà nước tại công ty này.\r\n\r\nNgày 18/2/2016, Bộ Giao thông Vận tải đã thành lập tổ công tác do ông Vũ Anh Minh - Vụ trưởng Vụ Quản lý doanh nghiệp là tổ trưởng và 5 thành viên để kiểm tra tại Tổng công ty Đường sắt Việt Nam các vấn đề mua, nhập khẩu toa xe đã qua sử dụng thời gian qua; xác định rõ trách nhiệm của các tổ chức, cá nhân có liên quan thuộc Tổng công ty này. sau khi có kết quả kiểm tra, Bộ Giao thông Vận tải sẽ có hình thức xử lý nghiêm đối với các tập thể, cá nhân liên quan trong vụ việc này.', 'http://img.f29.vnecdn.net/2016/02/26/tau-hang-4170-1456457454.jpg', 'Đoàn Loan - Chí Hiếu', 'VnExpress', 'Đoàn Loan - Chí Hiếu', 4, 0, NULL),
(3, 'Jerome Boateng viết báo, dạy cách làm trung vệ', 'Hậu vệ tuyển Đức và Bayern Munich vừa khoe kỹ năng viết lách khi viết về điều mà anh giỏi nhất - cách phòng ngự của một trung vệ. VnExpress gửi đến bạn đọc bản dịch bài viết của Boateng cho trang The players'' tribune. ', '2016-02-26 00:00:00', ' "Một hậu vệ thì phải làm gì? Bạn muốn biết không? Dễ ẹc. Có hai bước.\r\n\r\nBước đầu tiên là... làm một tiền đạo.\r\n\r\nThật đấy, chí ít đấy là phương pháp đã giúp tôi thành công. Nói cách khác, đấy là một cơ duyên thú vị.\r\n\r\nKhi 14 tuổi, tôi chơi bên cánh trái cho một đội trẻ của Berlin. Và tôi đã chẳng rời xa vị trí ấy cho đến một hôm bọn tôi đá một trận ở Thụy Điển mà không có còn một hậu vệ nào. Cả bọn rủ nhau... chấn thương sạch.\r\n\r\n"Này, Jerome, trận này xuống đá hậu vệ nhé", HLV của tôi nói.\r\n\r\nChơi luôn. Tại sao không? Tôi đã chơi trên hàng công suốt từ năm 6 tuổi đến giờ, giống như đang theo đuổi một nhiệm vụ tuyệt mật vậy. Nếu các cầu thủ tấn công là máy chủ, tôi chính là virus, tôi thâm nhập được vào họ, đoán được họ muốn làm gì, dốc bóng đi đâu và sẽ thực hiện theo cách nào, vì tôi từng là một trong số họ. Kinh nghiệm chơi trên hàng công suốt những năm tháng đầu đời cho đến nay vẫn là vốn liếng để giúp tôi thi đấu tốt ở vị trí trung vệ.\r\n\r\nNhưng nếu bạn chưa từng có thời gian làm tiền đạo, không sao, để tôi chia sẻ với bạn những gì mà tôi học được trên sân cỏ.\r\njerome-boateng-viet-bao-day-cach-lam-trung-ve\r\n\r\nBoateng, trong khiều năm thi đấu ở cấp CLB và đội tuyển quốc gia, từng đối mặt với những chân sút giỏi nhất thế giới.\r\n\r\nLàm hậu vệ thì phải làm gì? Câu trả lời quả thực đơn giản: tất nhiên là phải ngăn không cho đối phương ghi bàn rồi. Nhưng rốt cục ngăn không cho đối phương ghi bàn là làm gì? Không đơn giản là cùng các đồng đội dựng lên một bức tường để đối phương không thể sút qua (dù việc này vẫn xảy ra đấy, nhưng chúng ta sẽ quay lại sau) mà còn phải chú tâm vào từng pha di chuyển, tường đường chuyền, từng pha xoạc bóng, từng cú phá bóng, từng giây phút kèm người. Bởi vì mọi thứ tôi làm trên sân, mọi quyết định của tôi đều là một phần nhỏ trong toàn bộ một đại kế hoạch để ngăn không cho đối thủ ghi bàn.\r\n\r\nNó khởi đầu từ việc trao đổi với những đồng đội quanh mình. Giao tiếp - vâng, chẳng có gì ngạc nhiên cả - là yếu tố sống còn của hàng thủ. Ở Bayern, thường thì hàng thủ sẽ gồm ba hoặc bốn người, và dù sơ đồ có là gì đi nữa, tôi vẫn là trung vệ. Nghĩa là tôi vừa phải trao đổi với những hậu vệ đá cạnh mình lẫn những tiền vệ đá trên mình, để xem chúng tôi sẽ đưa bóng đến hướng nào.\r\n\r\nMọi thứ khác đi một chút khi tôi lên tuyển. Ở đó, tôi chỉ gặp các đồng đội có vài lần, rồi có khi mấy tháng sau mới gặp lại, thế nên càng phải nói nhiều hơn để hiểu nhau. Tôi tập hàng ngày với các đồng đội ở Bayern, tôi hiểu rõ họ sẽ làm gì, họ không làm gì, họ thích xử lý theo hướng nào, cách họ di chuyển lên công về thủ, tôi nên chuyền sang chân trái hay chân phải cho họ dễ chặn. Về mặt kỹ thuật, chúng tôi hòa nhịp hoàn toàn nên không cần phải nói nhiều như trên tuyển.\r\n\r\nNhiệm vụ ngăn không cho đối phương ghi bàn không bao giờ kết thúc cho đến khi trọng tài thổi còi dứt trận. Ngay khi vừa chặn được đợt tấn công này, có khi một đợt khác lại xuất hiện ngay sau đó. Tôi thường là người đầu tiên nhận bóng sau thủ môn, nhiệm vụ của tôi là chuyền bóng để kéo giãn cự ly đội hình của đối phương, mở rộng không gian sân bóng. Một phần quan trọng của hậu vệ là tìm cách mở ra một đợt phản công. Khi có bóng, dù là tự mình đoạt được hay do đồng đội chuyền cho, việc đầu tiên tôi làm là tìm xem tiền đạo của mình đang ở đâu. Đấy là người đứng cao nhất đội hình và nếu như có thể đưa bóng lập tức đến anh ta, tôi sẽ làm ngay để khởi đầu cho một pha phản kích. Nói thì dễ, làm mới khó, bởi vì đa số các đội Bundesliga đều phòng ngự rất kỹ. Nhiều lần tôi có bóng, nhìn lên đã thấy tám, chín cầu thủ đối phương lùi về giữ vị trí bên phần sân nhà rồi. Bởi vậy tôi phải lựa chọn một thời điểm hoàn hảo để đưa ra một đường chuyền hoàn hảo xuyên qua bãi mìn kia. Nghe đơn giản chưa?\r\n\r\nNếu đã tung ra đường chuyền vượt tuyến, tôi vẫn chưa thể nghỉ ngơi, bởi vì bóng chưa đến tiền đạo phe ta, tôi đã nghĩ ngay về khả năng bị đối phương phản công. Ở trình độ bóng đá hiện nay, có rất nhiều pha chạm bóng và cuộc tranh giành quyền sở hữu bóng diễn ra rất quyết liệt. Thế nên tiền đạo đội nhà mới phút trước đang sút ầm ầm bên kia, phút sau đã thấy tiền đạo đối phương có bóng và chuẩn bị... sút ầm ầm bên phần sân của mình. Cỡ như Real Madrid hay Barcelona thì việc ấy diễn ra còn nhanh hơn nữa. Đội nào cũng dùng đến ba tiền đạo, ai cũng chạy nhanh và hiểu ý nhau kinh khủng.\r\n\r\nVậy ta phải làm gì khi trước mặt là Lionel Messi, Ronaldo hay Neymar đang lao xuống với tốc độ cực đại?\r\n\r\nBạn phải đánh giá được tình hình chiến thuật lúc ấy, thật nhanh!\r\n\r\nMình đã được bọc lót chưa nhỉ? Có rồi chứ gì, OK, vậy thì có thể thử vận may bằng cách đẩy đối phương vào tình huống tranh chấp 50-50, có thể là một quả xoạc. Nhưng nếu sau lưng "ta chẳng còn ai", không thể mạo hiểm được. Nhiệm vụ lúc ấy là hoãn binh, làm sao cho bóng lăn càng chậm lúc nào càng tốt chừng ấy, đợi viện binh về hỗ trợ.\r\n\r\nVới Ronaldo hay Messi thì dù là xoạc bóng, giữ vị trí hay hoãn binh đều khó cả, nhất là khi họ có không gian trước mặt. Họ nhanh kinh khủng, Neymar và Messi thì trọng tâm thấp, chuyển hướng di chuyển dễ như trở bánh tráng, quả là nỗi kinh hoàng cho các trung vệ cao như tôi. Ronaldo thì cao, trọng tâm không thấp như hai gã Nam Mỹ, nhưng bù lại có tốc độ bứt phá và sức càn lướt cực tốt, đã vậy còn đánh đầu rất hay nữa. Đương đầu với những "ông thần này", chỉ một giây phút chểnh mảng là đã thấy Manuel Neuer chửi rủa ỏm tỏi phía sau, bóng đã vào lưới.\r\n\r\nNgoài tốc độ và kỹ thuật, thứ có thể tập luyện được, bạn còn cần phải có sự tự tin nữa. Ronaldo, Messi, Suárez, Neymar là những kẻ có thể nghe được mùi sợ hãi. Bạn chỉ cần khiếp nhược một chút, họ "ngửi" ra ngay và bạn chết chắc. Thế nên quẳng nỗi sợ hãi đi mà sống, lấy hết dũng khí ra mà đương đầu với họ.\r\n\r\nTự tin vẫn luôn là hành trang quan trọng của tôi trong sự nghiệp.\r\njerome-boateng-viet-bao-day-cach-lam-trung-ve-1\r\n\r\nÓc phán đoán và sự chính xác về mặt thời điểm giúp Boateng rất nhiều khi anh đối mặt với các tiền đạo đối phương.\r\n\r\nThời gian qua đi, tôi càng đá thì lại càng tự tin hơn. Tôi biết khi nào mình cần phải xoạc, khi nào cần tranh chấp và lúc nào thì nên làm chậm pha phản công của đối phương lai. Thuở còn trẻ trâu, nếu đội nhà mất bóng, tôi chỉ muốn làm mọi cách đoạt bóng lại thật nhanh, và thường xuyên phạm những sai lầm ấu trĩ. Mà sai lầm ra Champions League thì không có cách nào sửa chữa. Tốc độ ở đó rất nhanh, một sai lầm sẽ trả giá ngay bởi một bàn thua.\r\n\r\nVà nếu như đã trót thua một bàn, hãy làm theo nguyên tắc tối thương của tôi: chớ hoảng. Càng thua thì phải càng tỉnh táo. Vì sau một bàn thua, trong lòng chỉ muốn gỡ cho nhanh thì lại càng thua thêm. Một trận đấu có 90 phút, nếu phút thứ 80 vẫn còn bị dẫn bàn thì hãy nhớ: ta vẫn còn 10 phút, cộng thêm thời gian bù giờ để đòi lại.\r\n\r\nGiờ thì hãy nói về việc mà tôi thích nhất khi làm trung vệ nhé: xoạc bóng.\r\n\r\nXoạc bóng là vấn đề của thời điểm. Trước khi thực hiện động tác xoạc bóng, tôi phải đảm bảo 100% là mình đoạt được quả bóng đó. Còn nếu chưa chắc, cứ giữ vị trí với tiền đạo, tại sao phải mạo hiểm để lấy một chiếc thẻ đỏ, đẩy đội nhà vào thế bất lợi?\r\n\r\nTất nhiên, điều khó khăn nhất là bạn chỉ có vỏn vẹn 2 giây để ra quyết định. Bạn vừa phải chạy nước rút và vừa trả lời câu hỏi: "Xoạc hay không xoạc? Chắc chưa?". Nhưng khi đã xoạc được một cú thành công, chặn đứng một pha tấn công của đối phương, xua tan đi nỗi âu lo của cả đội, cảm giác ấy sướng không bút nào tả được.\r\n\r\nTrong các trận đấu tại World Cup 2014 với Pháp và Brazil, tôi có vài cú xoạc bóng tốt, đến chung kết với Argentina tôi cũng có thêm vài pha xoạc bóng thành công nữa. Đấy là một bước tiến rất dài so với thuở lần đầu khoác áo đội tuyển khi 20 tuổi. Hôm ấy, tôi làm trọn bộ thẻ vàng lẫn thẻ đỏ. Tôi hồi hộp quá, muốn thể hiện quả và thế là phạm sai lầm.\r\n\r\nĐiều này dẫn tôi đi đến một quan điểm khác: để làm một hậu vệ giỏi thì những gì diễn ra trong đầu bạn - nói nôm na là tâm lý - mới là điều quan trọng, mà điều này thì "mỗi nhà mỗi cảnh". Một số hậu vệ bị đau nhẹ, hoặc chưa đạt 100% thể lực vẫn có thể vào sân thi đấu ngon lành. Tôi thì không được thế. Tôi phải hoàn toàn khỏe mạnh, hoàn toàn tập trung. Đầu gối đau, hay một thứ gì đó trong cuộc sống riêng tư làm tôi phân tâm là tôi không thể chơi tốt.\r\n\r\nTất cả những gì tôi nói ở phía trên đều diễn ra khi bóng đang lăn. Giờ là chuyện bóng chết.\r\n\r\nCác bạn xem bóng đá, trận nào mà chả thấy một nhóm hậu vệ làm hàng rào trước một quả phạt. Mặt cả đám khi ấy nghiêm túc vãi ra, giống như sắp bị gã tiền đạo kia sút vào mặt tới nơi. Tôi nghĩ gì lúc ấy? Lỡ bóng trúng mặt thì cũng tốt, đội mình đỡ bàn thua.\r\n\r\nViệc quay mặt đi là một phản xạ đương nhiên. Một trận đấu nọ, quả bóng bay thẳng vào mặt tôi, tôi nghiêng đi một chút để quả bóng tìm đến vai và bị trọng tài thổi phạt lỗi chạm tay (tất nhiên là không chạm nhé). Nhưng bạn phải học cách đứng đó, dũng cảm đối mặt với quả phạt. Tất nhiên là chả vui vẻ gì khi phải đứng trong hàng rào, nhưng nào, bên cạnh ta còn có đồng đội cơ mà.\r\n\r\nĐặc biệt là thủ môn. Nếu là một hậu vệ, trên đời không có ai quan trọng hơn cái gã sau lưng ấy. Khi có đá phạt, anh ta là sếp, anh ta chỉ cách lập hàng rào, nhích sang trái hay sang phải. Xem TV, bạn phải thấy anh ta hét om xòm trong những tình huống đá phạt như thế, và cả phạt góc nữa. Anh ta sẽ gào lên:\r\n\r\n"Phải!"\r\n\r\n"Trái!"\r\n\r\n"Nhảy!"\r\n\r\n"Cấm nhảy!"\r\n\r\nAnh ta mà yêu cầu làm gì, tốt nhất bạn nên làm theo.\r\n\r\nVới hàng phòng ngự ba người, chồng tình huống cố định đòi hỏi nhiều hàm lượng tư duy chiến thuật nhất. Chúng tôi phải di chuyển liên tục để điều chỉnh hàng rào, giữa chúng tôi không được có khoảng trống. Bóng bay về hướng anh nào, anh đó phải nhảy lên để cản lại.\r\n\r\nVới Real hay Barca, để phá quả bóng cho ngon lành cũng khó. Họ nhanh và hiệu quả kinh khủng. Nếu đang ở trong vòng cấm, tôi chỉ có thể phá quả bóng mạnh lên trên, nhưng rồi họ cũng lấy quả bóng ấy rồi quay trở lại gây áp lực tiếp.\r\n\r\nĐấy là lý do vì sao phá bóng giải vây, những như hầu hết mọi thứ khác trong kỹ thuật phòng ngự, là điều mà bạn phải quyết thật nhanh và hợp với tình huống trên sân. Bạn xem TV, thấy hậu vệ cứ phá bóng ra để chịu phạt góc, bạn hỏi sao lại để cho đối phương cơ hội thế kia? Câu trả lời là giữa hai lựa chọn tồi, phải đưa ra một lựa chọn đỡ tồi hơn.\r\n\r\nRõ ràng, điều đầu tiên tôi hy vọng là phá quả bóng đến chân người của mình. Nhưng thỉnh thoảng bóng rơi vào vòng cấm, lúc ấy bạn phải đưa ra xử lý an toàn nhất, không để bóng chạm tay, không được chần chừ khi khung thành đã ngay trước mặt. Tôi thà là chịu một quả phạt góc còn hơn là cho những gã như Messi hay Neymar thêm một vài giây trong vòng cấm của mình.\r\njerome-boateng-viet-bao-day-cach-lam-trung-ve-2\r\n\r\nBoateng xem bóng đá như một ván bài poker, mà ở đó, đòi hỏi không chỉ sức vóc, mà còn cả nhiều phẩm chất khác.\r\n\r\nĐã đứng trên sân mới hiểu được vài giây cũng quý giá đến thế nào. Nếu theo kèm một tiền đạo, tôi phải cảm giác được anh ta đang ở đâu, phải cố đoán xem anh ta sẽ làm gì, tôi cố đến quả bóng trước anh ta một giây. Chỉ một giây ấy thôi là đủ quyết định thành bại. Một giây là vũ khí lợi hai nhất của tôi.\r\n\r\nCuối cùng, tôi yêu quý thời gian mình còn làm tiền đạo, vì nó giúp tôi đưa ra phán đoán chính xác họ đang nghĩ gì. Nếu có sự nghiên cứu kỹ lưỡng về tiền đạo mà mình chuẩn bị đối mặt, bạn cũng sẽ biết thói quen xử lý của anh ta là gì.\r\n\r\nĐấy thật sư là một màn poker trên sân cỏ. Mọi tiền đạo trên đời đều có những pha xử lý yêu thích, nhưng với những tiền đạo thật sự xịn, không có bất kỳ một kế hoạch nào để ngăn họ cả. Ronaldo nguy hiểm như thế vì anh ta sút tốt được hai chân. Bạn không bao giờ biết anh ta sẽ sút chân nào hay làm gì cả.\r\n\r\nĐấy là lý do vì sao dù tôi đã ngày một giỏi lên, xoạc bóng ngon hơn, điềm tĩnh hơn, tôi vẫn biết ơn vô cùng cái gã luôn đứng sau tôi: Thủ môn!".', 'http://img.f1.thethao.vnecdn.net/2016/02/26/Boateng-7626-1456476462.jpg', 'admin@ttxvn.com', 'VnExpress', 'HN', 5, 0, NULL),
(4, 'Leicester thăng hoa nhờ dị biệt ở tốc độ tấn công', 'Ngôi đầu Ngoại hạng Anh hiện tại là thành tích phi thường với một CLB cỡ như Leicester City. Họ gây sốc bằng những chiến thắng theo cách khác hẳn so với phần còn lại của giải đấu. ', '2016-02-26 00:00:00', ' Đội bóng của HLV Ranieri đã cho thấy có nhiều hơn một cách để chơi thứ bóng đá hấp dẫn và hiệu quả.\r\n\r\nỞ La Liga, CLB đầu bảng Barca giành quyền kiểm soát bóng lên tới 62% tại mùa giải này. Họ còn là đội thực hiện thành công được nhiều nhất số đường ban chuyền ngắn, phản ánh độ chính xác khi phối hợp. Các đội trong top ba giải vô địch Tây Ban Nha mùa này, Barca, Atletico Madrid và Real Madrid, đều là những đội đã thực hiện ít nhất số đường chuyền dài so với phần còn lại.\r\n\r\nBayern Munich dẫn đầu Bundesliga với tỷ lệ sở hữu bóng trung bình lên tới 67%. Và cũng như Barca, CLB xứ Bavaria là đội thực hiện nhiều đường ban chuyền ngắn hơn bất cứ đội nào của giải đấu, và là đội ít chuyền dài nhất.\r\n\r\nThống kê của hãng phân tích dữ liệu bóng đá uy tín Opta Sports cho thấy Leicester rõ ràng đã đi ngược xu hướng so với những CLB khác hiện đứng đầu bảng ở các giải vô địch quốc gia lớn của châu Âu. Sự khác biệt mà họ tạo ra trong lối chơi thậm chí được Sky Sports đánh giá là tới mức dị thường.\r\nleicester-thang-hoa-nho-di-biet-o-toc-do-tan-cong\r\n\r\nLeicester (áo đen) là một dị biệt, chơi thành công mà không cần phải sở hữu nhiều bóng và giỏi đan lát - mô-típ quen thuộc của các đội bóng hàng đầu châu Âu hiện tại. Ảnh: Reuters.\r\n\r\nLeicester chỉ có tỷ lệ sở hữu bóng trung bình 43% ở mùa giải này, đứng tận thứ 18 tính theo chỉ số thống kê này ở Ngoại hạng Anh. Họ còn là đội chuyền bóng ngắn kém chính xác thứ 19 tại giải đấu, chỉ tốt hơn West Brom.\r\n\r\nNhưng “Những chú cáo” lại chính là CLB giành số điểm cao nhất Ngoại hạng Anh sau 27 vòng, với hiệu số bàn thắng thua cũng cao hơn Arsenal.\r\n\r\nHai chỉ số thống kê về kiểm soát bóng và tỷ lệ ban chuyền bóng ngắn thành công thực ra chỉ cho chúng ta biết rằng cách triển khai thế trận của Leicester tương phản ra sao so với những đội bóng dẫn đầu ở những giải khác. Ở Ngoại hạng Anh hiện nay, chính Arsenal mới cho thấy họ là “phiên bản” của Barca hay Bayern, trong khi Leicester về mặt con số thống kê lại tương tự Sunderland - đội hiện chỉ đứng áp chót bảng điểm.\r\n\r\nDavid Sumpter, một giáo sư về toán học ứng dụng, đã giải thích trên Sky Sports rằng chính tốc độ trong việc tạo ra các cơ hội ghi bàn đã giúp Leicester thành công theo kiểu khác biệt.\r\n\r\nVị giáo sư này còn chỉ ra một “khu vực nguy  hiểm”, nơi các cầu thủ Leicester thực hiện nhiều cú sút nhất để từ đó có được những cơ hội ghi bàn rõ ràng.\r\n\r\nSự khác biệt còn nằm ở chỗ “bóng ở đâu trên sân khoảng 30 giây trước khi các cú sút về phía cầu môn đối phương được thực hiện”. Với kiểu đá của Arsenal, bóng lúc đó thường đã xuất hiện sẵn ở khoảng 1/3 cuối sân đối phương, và trong chân của những cầu thủ kiến tạo như Mesut Ozil hay Santi Cazorla.\r\n\r\nTrong trường hợp của Leicester, đó thường là một câu chuyện rất khác. Chất xúc tác cho các cơ hội ghi bàn tốt nhất của Leicester đa số là một đường chuyền dài từ phần sân của họ sang thẳng phía sân đối phương.\r\nleicester-thang-hoa-nho-di-biet-o-toc-do-tan-cong-1\r\n\r\nCách chơi của Leicester cho phép những cầu thủ ở phía trên như Vardy nhận được bóng nhanh nhất có thể, để uy hiếp hàng phòng ngự đối phương. Ảnh: Reuters.\r\n\r\nTrung bình, sau ít hơn chỉ bốn đường chuyền, Leicester đã có thể thực hiện các cú sút ở khu vực nguy hiểm. Không có đội nào khác của Ngoại hạng Anh mùa này thiết lập các cơ hội ghi bàn theo kiểu trực tiếp tới mức độ như Leicester đã làm.\r\n\r\nTrung bình, mỗi đường ban chuyền của Leicester đưa bóng hướng tới gần hơn khung thành đối phương thêm khoảng chín mét. Chỉ số  này gần như gấp đôi so với mức bình quân của Arsenal, và nhiều hơn hai mét so với bất kỳ CLB nào khác ở giải Ngoại hạng Anh.\r\n\r\nLeicester đã tạo ra cách biệt về điểm số, giành những chiến thắng, ghi nhiều bàn thắng theo một cách gần như trái ngược hoàn toàn so với các đội bóng mạnh hiện nay.\r\n\r\nSo sánh các CLB dẫn đầu các giải lớn của châu Âu\r\n\r\nĐội\r\n	\r\n\r\nGiải đấu\r\n	\r\n\r\nVị trí theo tỷ lệ\r\nsở hữu bóng\r\n	\r\n\r\nVị trí theo số lượng\r\nđường chuyền ngắn\r\n\r\nBarcelona\r\n	\r\n\r\nLa Liga\r\n	\r\n\r\n1\r\n	\r\n\r\n1\r\n\r\nBayern\r\n	\r\n\r\nBundesliga\r\n	\r\n\r\n1\r\n	\r\n\r\n1\r\n\r\nJuventus\r\n	\r\n\r\nSerie A\r\n	\r\n\r\n4\r\n	\r\n\r\n3\r\n\r\nLeicester\r\n	\r\n\r\nNgoại hạng Anh\r\n	\r\n\r\n18\r\n	\r\n\r\n19\r\n\r\nPSG\r\n	\r\n\r\nLigue 1\r\n	\r\n\r\n1\r\n	\r\n\r\n1', 'http://img.f1.thethao.vnecdn.net/2016/02/26/Man-ICty-2-3359-1456443781.jpg', 'Nguyễn Phát', 'VnExpress', 'HN', 5, 0, NULL),
(5, 'Biển lửa bao trùm kho lốp ôtô ở Bình Dương', NULL, '2016-02-27 20:06:37', 'Khoảng 12h30, lửa bất ngờ bùng lên ở kho phế liệu lốp ôtô rộng khoảng 1.000 m2 ở phường Bình Thắng, thị xã Dĩ An, Bình Dương. \r\n\r\n"Lúc đầu ngọn lửa bùng lên nhỏ nhưng do không có người dập nên hơn chục phút sau, đám cháy bao trùm cả kho. Tôi cuống cuồng kêu mấy đứa con dậy chạy ra ngoài hô hoán nhờ hàng xóm di dời đồ đạc ra giúp", chị Thái, nhà sát kho phế liệu, kể.\r\n\r\nDo trong kho chứa nhiều lốp ôtô nên lửa bùng cháy dữ dội. Đứng xa hàng km vẫn nhìn thấy cuộn khói đen cuồn cuộn bốc lên.\r\n\r\nĐến 14h, trong thời tiết nắng nóng 32 độ kèm với sức nóng của đám cháy, cảnh sát cứu hỏa đang nỗ lực cô lập ngọn lửa.', '', 'Phước Tuấn', 'Vnexpress', 'Bình Dương', 0, 0, '00d50e854f7257f70695608892de445e'),
(6, 'Nút phản hồi trên Facebook - cuộc chơi mới cho các nhãn hàng', NULL, '2016-02-27 20:06:37', '<p class="Normal">Sau nhiều th&aacute;ng thử nghiệm tại một số quốc gia, từ 25/2, Facebook ch&iacute;nh thức đưa v&agrave;o sử dụng t&iacute;nh năng Reactions (phản ứng) mới thay cho n&uacute;t Like đơn thuần trước đ&acirc;y. Theo đ&oacute;, người d&ugrave;ng sẽ c&oacute; 5 c&aacute;ch biểu lộ trạng th&aacute;i với một chia sẻ n&agrave;o đ&oacute; bao gồm Love (y&ecirc;u), Haha, Wow (ngạc nhi&ecirc;n, trầm trồ), Sad (buồn) v&agrave; Angry (giận dữ). Đ&acirc;y được coi l&agrave; một trong những đợt n&acirc;ng cấp lớn nhất của Facebook kể từ khi ra mắt.</p>\n<p class="Normal">Facebook l&agrave; một k&ecirc;nh marketing trực tuyến phổ biến nhất hiện nay.&nbsp;C&aacute;c thương hiệu sản phẩm, dịch vụ (gọi chung l&agrave; c&aacute;c nh&atilde;n h&agrave;ng) của doanh nghiệp cũng đứng trước một cuộc chơi mới sau thay đổi n&agrave;y của Mark Zuckerberg v&agrave; c&aacute;c đồng sự.</p>\n<p class="Normal"><span style="color: #696969;"><strong>Cơ hội đi liền th&aacute;ch thức</strong></span></p>\n<p class="Normal">Dễ thấy trước hết đ&acirc;y l&agrave; cơ hội để tăng được tương t&aacute;c của c&ocirc;ng ch&uacute;ng với sản phẩm, dịch vụ.&nbsp;Trước kia, nếu kh&ocirc;ng th&iacute;ch sản phẩm, người d&ugrave;ng thường chọn việc bỏ qua, hiếm khi c&oacute; ai v&igrave; gh&eacute;t m&agrave; dừng lại b&igrave;nh luận hay chia sẻ v&agrave; viết th&ecirc;m mấy d&ograve;ng dẫn chuyện, trừ khi cảm x&uacute;c của họ bị đẩy l&ecirc;n rất cao. Nay họ c&oacute; thể phản ứng rất nhanh, rất tức thời nếu th&iacute;ch hay kh&ocirc;ng th&iacute;ch nội dung đ&oacute;.</p>\n<p class="Normal">Lựa chọn đa dạng hơn để b&agrave;y tỏ th&aacute;i độ, cảm x&uacute;c cũng sẽ l&agrave;m c&ocirc;ng ch&uacute;ng h&agrave;o hứng hơn trong việc phản hồi với sản phẩm, với nội dung marketing.&nbsp;C&oacute; thể xảy ra cơn b&atilde;o phản ứng nếu người d&ugrave;ng kh&ocirc;ng th&iacute;ch một sản phẩm, dịch vụ n&agrave;o đ&oacute; v&agrave; doanh nghiệp rất &ldquo;kh&oacute; đỡ&rdquo; khi họ chỉ cần nhấn n&uacute;t Tức giận.</p>\n<p class="Normal">Lợi &iacute;ch c&oacute; thể nh&igrave;n thấy rất nhanh l&agrave; doanh nghiệp dễ d&agrave;ng đo được phản ứng của c&ocirc;ng ch&uacute;ng với sản phẩm, dịch vụ của m&igrave;nh v&agrave; thước đo cũng s&acirc;u hơn trước.</p>\n<p class="Normal">Nhưng đi c&ugrave;ng đ&oacute;, việc l&agrave;m marketing mạng x&atilde; hội; social media n&oacute;i chung nay cũng kh&oacute; hơn, sức &eacute;p lớn hơn. Trong nội bộ, c&aacute;c nh&oacute;m chuy&ecirc;n marketing mạng x&atilde; hội v&agrave; ngo&agrave;i l&agrave; c&aacute;c c&ocirc;ng ty dịch vụ marketing truyền th&ocirc;ng đều phải &ldquo;căng m&igrave;nh&rdquo; hơn trước những phản hồi của c&ocirc;ng ch&uacute;ng.</p>\n<p class="Normal">Thử nghĩ nếu nh&atilde;n h&agrave;ng n&agrave;o chọn c&aacute;ch ti&ecirc;u cực l&agrave; xo&aacute; comment hay cấm c&aacute;c nick b&igrave;nh luận xấu, nay l&agrave;m sao c&oacute; thể soi v&agrave; xo&aacute; được nếu đối tượng chỉ "thả" ra một n&uacute;t Tức giận rồi bỏ đi?</p>', '', 'admin@ttxvn.com', 'VNEXpress', 'net', 0, 0, '4aa68df38afc8d7b181db1dacbdb67ab'),
(7, 'Nút phản hồi trên Facebook - cuộc chơi mới cho các nhãn hàng', NULL, '2016-02-27 20:09:17', '', '', 'admin@ttxvn.com', 'VNEXpress', 'net', 0, 0, NULL);

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
-- Indexes for table `news`
--
ALTER TABLE `news`
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
