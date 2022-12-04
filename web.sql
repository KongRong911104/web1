-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- 主機： localhost:3306
-- 產生時間： 2022 年 12 月 04 日 22:34
-- 伺服器版本： 10.3.37-MariaDB-0ubuntu0.20.04.1
-- PHP 版本： 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `test`
--

-- --------------------------------------------------------

--
-- 資料表結構 `allpermission`
--

CREATE TABLE `allpermission` (
  `permissionlevel` bigint(20) UNSIGNED NOT NULL,
  `permissionname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `allrolepermission`
--

CREATE TABLE `allrolepermission` (
  `permissionlevel` bigint(20) UNSIGNED NOT NULL,
  `permissionname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `groupcolor`
--

CREATE TABLE `groupcolor` (
  `groupid` int(11) NOT NULL,
  `color` text NOT NULL,
  `id` int(11) NOT NULL,
  `sn` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `groupcontent`
--

CREATE TABLE `groupcontent` (
  `groupid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `sn` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `groupid`
--

CREATE TABLE `groupid` (
  `groupid` bigint(20) UNSIGNED NOT NULL,
  `groupname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `grouppermission`
--

CREATE TABLE `grouppermission` (
  `groupid` int(11) NOT NULL,
  `permissionlevel` int(11) NOT NULL,
  `sn` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `manage`
--

CREATE TABLE `manage` (
  `sn` bigint(20) UNSIGNED NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `permission`
--

CREATE TABLE `permission` (
  `sn` bigint(20) UNSIGNED NOT NULL,
  `id` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `permissionlevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `rolecolor`
--

CREATE TABLE `rolecolor` (
  `groupid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `color` text NOT NULL,
  `id` int(11) NOT NULL,
  `sn` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `rolepermission`
--

CREATE TABLE `rolepermission` (
  `sn` bigint(20) UNSIGNED NOT NULL,
  `groupid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `permissionlevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `stu`
--

CREATE TABLE `stu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `password` text NOT NULL DEFAULT '1234',
  `account` text NOT NULL,
  `userimg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `allpermission`
--
ALTER TABLE `allpermission`
  ADD UNIQUE KEY `permissionlevel` (`permissionlevel`);

--
-- 資料表索引 `allrolepermission`
--
ALTER TABLE `allrolepermission`
  ADD UNIQUE KEY `permissionlevel` (`permissionlevel`);

--
-- 資料表索引 `groupcolor`
--
ALTER TABLE `groupcolor`
  ADD UNIQUE KEY `sn` (`sn`);

--
-- 資料表索引 `groupcontent`
--
ALTER TABLE `groupcontent`
  ADD UNIQUE KEY `sn` (`sn`);

--
-- 資料表索引 `groupid`
--
ALTER TABLE `groupid`
  ADD UNIQUE KEY `groupid` (`groupid`);

--
-- 資料表索引 `grouppermission`
--
ALTER TABLE `grouppermission`
  ADD PRIMARY KEY (`sn`),
  ADD UNIQUE KEY `sn` (`sn`);

--
-- 資料表索引 `manage`
--
ALTER TABLE `manage`
  ADD UNIQUE KEY `sn` (`sn`);

--
-- 資料表索引 `permission`
--
ALTER TABLE `permission`
  ADD UNIQUE KEY `sn` (`sn`);

--
-- 資料表索引 `rolecolor`
--
ALTER TABLE `rolecolor`
  ADD UNIQUE KEY `sn` (`sn`);

--
-- 資料表索引 `rolepermission`
--
ALTER TABLE `rolepermission`
  ADD UNIQUE KEY `sn` (`sn`);

--
-- 資料表索引 `stu`
--
ALTER TABLE `stu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `allpermission`
--
ALTER TABLE `allpermission`
  MODIFY `permissionlevel` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `allrolepermission`
--
ALTER TABLE `allrolepermission`
  MODIFY `permissionlevel` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `groupcolor`
--
ALTER TABLE `groupcolor`
  MODIFY `sn` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `groupcontent`
--
ALTER TABLE `groupcontent`
  MODIFY `sn` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `groupid`
--
ALTER TABLE `groupid`
  MODIFY `groupid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `grouppermission`
--
ALTER TABLE `grouppermission`
  MODIFY `sn` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `manage`
--
ALTER TABLE `manage`
  MODIFY `sn` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `permission`
--
ALTER TABLE `permission`
  MODIFY `sn` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `rolecolor`
--
ALTER TABLE `rolecolor`
  MODIFY `sn` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `rolepermission`
--
ALTER TABLE `rolepermission`
  MODIFY `sn` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `stu`
--
ALTER TABLE `stu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
