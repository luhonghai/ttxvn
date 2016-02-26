-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 21, 2016 at 09:24 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ttxvn`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `description`) VALUES
(4, 'Thời Sự', 'Thời Sự');


CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `role` int, -- 0 is staff, 1 is customer
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` VARCHAR(100)  NOT NULL ,
  `password` VARCHAR(100)  NOT NULL ,
  `gender` BIT DEFAULT 1,
  `dob` DATETIME,
  `phone` VARCHAR(20) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `news_request` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `status` int, -- 0 is staff, 1 is customer
  `email` varchar(100) DEFAULT NULL,
  `request_date` DATETIME,
  `message` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date_time` date NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `image` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `author` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `source` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `location` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `date_time`, `content`, `image`, `author`, `source`, `location`, `cat_id`) VALUES
(1, 'Biển lửa bao trùm kho lốp ôtô ở Bình Dương', '2016-02-21', 'Khoảng 12h30, lửa bất ngờ bùng lên ở kho phế liệu lốp ôtô rộng khoảng 1.000 m2 ở phường Bình Thắng, thị xã Dĩ An, Bình Dương. \r\n\r\n"Lúc đầu ngọn lửa bùng lên nhỏ nhưng do không có người dập nên hơn chục phút sau, đám cháy bao trùm cả kho. Tôi cuống cuồng kêu mấy đứa con dậy chạy ra ngoài hô hoán nhờ hàng xóm di dời đồ đạc ra giúp", chị Thái, nhà sát kho phế liệu, kể.\r\n\r\nDo trong kho chứa nhiều lốp ôtô nên lửa bùng cháy dữ dội. Đứng xa hàng km vẫn nhìn thấy cuộn khói đen cuồn cuộn bốc lên.\r\n\r\nĐến 14h, trong thời tiết nắng nóng 32 độ kèm với sức nóng của đám cháy, cảnh sát cứu hỏa đang nỗ lực cô lập ngọn lửa.', 'http://img.f29.vnecdn.net/2016/02/21/chay-2-9562-1456037901.jpg', 'Phước Tuấn', 'Vnexpress', 'Bình Dương', 4);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;