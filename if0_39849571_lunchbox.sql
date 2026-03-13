-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql100.byetcluster.com
-- Generation Time: Mar 13, 2026 at 12:22 AM
-- Server version: 11.4.10-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_39849571_lunchbox`
--

-- --------------------------------------------------------

--
-- Table structure for table `accepted_lunches`
--

CREATE TABLE `accepted_lunches` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lunch_id` int(11) NOT NULL,
  `accepted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `to_user` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `lunch_id` int(11) NOT NULL,
  `sharer_roll` varchar(50) NOT NULL,
  `accepter_roll` varchar(50) NOT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shared_lunch`
--

CREATE TABLE `shared_lunch` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `roll_number` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `food_items` text NOT NULL,
  `location` varchar(100) NOT NULL,
  `status` enum('available','accepted','completed') DEFAULT 'available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shared_lunches`
--

CREATE TABLE `shared_lunches` (
  `id` int(11) NOT NULL,
  `roll_number` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `food_items` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `status` enum('available','accepted','cancelled') DEFAULT 'available',
  `accepted_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `shared_lunches`
--

INSERT INTO `shared_lunches` (`id`, `roll_number`, `name`, `phone`, `food_items`, `location`, `status`, `accepted_by`, `created_at`) VALUES
(0, '22221111', 'Test0hhsha', '1234567890', 'Fride rice', 'Block 1', 'available', NULL, '2026-01-05 09:30:24'),
(0, '1111', 'KALYAN', '7815833882', 'rice', 'canteen', 'available', NULL, '2026-01-14 02:50:33'),
(0, '1111', 'KALYAN', '7815833882', 'Rice with sambar curry', 'canteen', 'accepted', '22221111', '2026-01-05 09:23:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `roll_number` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `roll_number`, `phone`, `password`, `created_at`) VALUES
(0, 'KALYAN', '1111', '7815833882', '$2y$10$WUmKNTewXNSG0riQpDn6a..7p/8/UVt11Zb40ZzBeIg./RPFdrwZO', '2025-10-17 07:12:53'),
(0, 'akshitha', '2112', '7815833882', '$2y$10$xKzlc9bs10G13rhxVwmA1OTJPDHqFHoD8/uYFIuWKdjMnp2QBsZXa', '2025-10-17 07:28:23'),
(0, 'bhavani', '23455666', '1234567890', '$2y$10$DDnPUNzdUXflTxFFDDbdsOIF42GSJ9avjrnAvaKEgbLnduUIDjJ6G', '2025-10-22 04:55:03'),
(0, 'kalyan', '11111', '1111', '$2y$10$J5zD0i6q04DL2i/vK7VtLOV2ZiNghCcTpyxyLI8SwK2imLKMe5Nv.', '2025-10-22 04:55:56'),
(0, 'Kalyan Janjirala', '2222', '2222', '$2y$10$jTqTgvZN0gYWRn5yNlrpQ.8Xo.HMrd7HCkCYb/RZrkVZsts9cwA3e', '2025-10-22 05:32:39'),
(0, 'Ganesh', '25H55A0544', '8074398893', '$2y$10$Ic5SLiHaSuEGpwlZMYrfHO.y2UmOwX1jRsU5KdWYoYJR1jprk25L6', '2025-10-23 07:18:14'),
(0, 'JANJIRALA KALYAN', '24H51A05T4', '7815833882', '$2y$10$MREvUqxd3/4J0dVF9/qYW.UiaFp.05CTwfZZ0K1EBvVpYzGNSuuwm', '2025-10-23 09:12:01'),
(0, 'KALYAN', '05t4', '7815833882', '$2y$10$3/n6rJf4G4Fjxuk601COYuwsCd4nALaoI5Ty8flpQm1idnm3hsJbe', '2025-11-01 08:59:19'),
(0, 'Sri Charan', '05r2', '7993123235', '$2y$10$4Xh7U9VwRwIPYwGoAdrZ.OA6OCJND7OtpyMAjNSdQpxmFYl0FPaRq', '2025-11-01 09:01:34'),
(0, 'mohammad', '111', '123456789', '$2y$10$UQ/K4vDyxs1MLUN.c/VlmOH0XiGvWoOwDKO9.zVfOhsMWl1nEDrV6', '2025-12-04 14:10:07'),
(0, 'Test0hhsha', '22221111', '1234567890', '$2y$10$ZqDrSQagHMkqDK4Rx2UokOGTcb2sMveZmNosONVKb8LESUL1A8M5K', '2026-01-05 09:28:42'),
(0, 'tenny charan', '0000', '0000', '$2y$10$1XNm1QhWQr15t4sKNiC1MuCLDE0W82TNpAWNgarIPUG6PZDPqwDR.', '2026-01-14 02:52:31'),
(0, 'tenny charan', '9999', '9999', '$2y$10$u0.spkVkCv3egYyigWfMt.uTD2ZTTPMu5I8paTNC0HF7EqJ/RNlRi', '2026-01-14 02:55:11'),
(0, 'tenny charan', '5555', '5555', '$2y$10$XqxcIoypCJGpc41rjeCymus5P9zLwhEkHN4kUKUolga1m4UdiePOq', '2026-01-14 02:55:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `roll_number` (`roll_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
