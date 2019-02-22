-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主機: localhost:8889
-- 產生時間： 2019 年 02 月 23 日 00:34
-- 伺服器版本: 5.7.23
-- PHP 版本： 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- 資料庫： `aaaaa`
--
CREATE DATABASE IF NOT EXISTS `aaaaa` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `aaaaa`;

-- --------------------------------------------------------

--
-- 資料表結構 `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `name`) VALUES
(1, 'AAAAA');

-- --------------------------------------------------------

--
-- 資料表結構 `coupon_code`
--

CREATE TABLE `coupon_code` (
  `coupon_code_id` int(11) UNSIGNED NOT NULL,
  `coupon_id` int(11) UNSIGNED NOT NULL,
  `coupon_code` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `coupon_code`
--

INSERT INTO `coupon_code` (`coupon_code_id`, `coupon_id`, `coupon_code`) VALUES
(1, 1, 'ABCDEF');

-- --------------------------------------------------------

--
-- 資料表結構 `coupon_relation_product`
--

CREATE TABLE `coupon_relation_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `coupon_relation_product`
--

INSERT INTO `coupon_relation_product` (`id`, `coupon_id`, `product_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `coupon_used`
--

CREATE TABLE `coupon_used` (
  `coupon_used_id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `coupon_used`
--

INSERT INTO `coupon_used` (`coupon_used_id`, `coupon_id`, `create_date`) VALUES
(1, 1, '2019-02-22 12:49:14'),
(2, 1, '2019-02-22 12:49:19'),
(3, 1, '2019-02-22 12:49:23');

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `product`
--

INSERT INTO `product` (`product_id`, `name`) VALUES
(1, '11111'),
(2, '22222');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- 資料表索引 `coupon_code`
--
ALTER TABLE `coupon_code`
  ADD PRIMARY KEY (`coupon_code_id`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- 資料表索引 `coupon_relation_product`
--
ALTER TABLE `coupon_relation_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `product_id` (`product_id`);

--
-- 資料表索引 `coupon_used`
--
ALTER TABLE `coupon_used`
  ADD PRIMARY KEY (`coupon_used_id`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表 AUTO_INCREMENT `coupon_code`
--
ALTER TABLE `coupon_code`
  MODIFY `coupon_code_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表 AUTO_INCREMENT `coupon_relation_product`
--
ALTER TABLE `coupon_relation_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表 AUTO_INCREMENT `coupon_used`
--
ALTER TABLE `coupon_used`
  MODIFY `coupon_used_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表 AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `coupon_code`
--
ALTER TABLE `coupon_code`
  ADD CONSTRAINT `coupon_code_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`coupon_id`);

--
-- 資料表的 Constraints `coupon_relation_product`
--
ALTER TABLE `coupon_relation_product`
  ADD CONSTRAINT `coupon_relation_product_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`coupon_id`),
  ADD CONSTRAINT `coupon_relation_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- 資料表的 Constraints `coupon_used`
--
ALTER TABLE `coupon_used`
  ADD CONSTRAINT `coupon_used_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`coupon_id`);
