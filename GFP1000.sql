-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 11, 2018 at 08:33 PM
-- Server version: 10.1.23-MariaDB-9+deb9u1
-- PHP Version: 7.0.19-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `GFP1000`
--

-- --------------------------------------------------------

--
-- Table structure for table `fiscal_data`
--

CREATE TABLE `fiscal_data` (
  `id` int(11) NOT NULL,
  `receipt_no` varchar(25) DEFAULT NULL,
  `option_begin` varchar(50) DEFAULT NULL,
  `option_value` varchar(25) NOT NULL,
  `content` varchar(5000) NOT NULL,
  `option_end` varchar(50) DEFAULT NULL,
  `is_printed` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fiscal_data`
--

INSERT INTO `fiscal_data` (`id`, `receipt_no`, `option_begin`, `option_value`, `content`, `option_end`, `is_printed`, `created_at`, `updated_at`) VALUES
(1, 'LTM0001', 'inverseOn', '0', 'Inverse On', 'inverseOff', 1, '2017-10-29 08:45:54', '2018-04-11 14:57:15'),
(3, 'LTM0001', 'doubleHeightOn', '0', 'Double Height', 'doubleHeightOff', 1, '2017-10-29 08:46:39', '2018-04-11 14:57:07'),
(4, 'LTM0001', 'boldOn', '0', 'Printer Test Bold', 'boldOff', 1, '2017-10-29 08:46:39', '2018-04-11 14:56:59'),
(5, 'LTM0001', 'setLineHeight', '50', 'Line Height is 50', 'setDefault', 1, '2017-10-29 08:46:39', '2017-10-29 14:43:49'),
(6, 'LTM0001', 'justifyC', '0', 'Centered Text', 'justifyL', 1, '2017-10-29 08:46:39', '2018-04-11 14:57:38'),
(8, 'LTM0001', 'justifyR', '0', 'Right', 'justifyL', 1, '2017-10-29 08:46:39', '2018-04-11 14:58:04'),
(9, 'LTM0001', 'CODE39', 'Lahiru', '', '', 1, '2017-10-29 08:46:39', '2018-04-11 15:01:18'),
(10, 'LTM0001', 'UPC_A', '123456789012', '', '', 1, '2017-10-29 08:46:39', '2018-04-11 15:02:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fiscal_data`
--
ALTER TABLE `fiscal_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fiscal_data`
--
ALTER TABLE `fiscal_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
