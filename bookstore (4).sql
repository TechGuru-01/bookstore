-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2026 at 12:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_tools`
--

CREATE TABLE `academic_tools` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `size` varchar(20) DEFAULT 'N/A',
  `status` enum('Available','Out of Stock') DEFAULT 'Available',
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `product_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `academic_tools`
--

INSERT INTO `academic_tools` (`product_id`, `category_id`, `product_name`, `description`, `size`, `status`, `price`, `stock_quantity`, `product_image`, `created_at`) VALUES
(1, 11, '1', '1', 'N/A', 'Available', 1.00, 1, 'placeholder.jpg', '2026-05-04 10:01:57');

-- --------------------------------------------------------

--
-- Table structure for table `apparel`
--

CREATE TABLE `apparel` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `stock_m` int(11) DEFAULT 0,
  `stock_l` int(11) DEFAULT 0,
  `stock_xl` int(11) DEFAULT 0,
  `product_image` varchar(255) DEFAULT 'placeholder.jpg',
  `status` enum('Available','Out of Stock') NOT NULL DEFAULT 'Available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apparel`
--

INSERT INTO `apparel` (`product_id`, `category_id`, `product_name`, `description`, `size`, `price`, `stock_quantity`, `stock_m`, `stock_l`, `stock_xl`, `product_image`, `status`, `created_at`) VALUES
(1, 2, 'asdfa', '1', 'XS', 1.00, 1, 0, 0, 0, 'placeholder.jpg', 'Available', '2026-04-20 14:11:04'),
(2, 2, 'asdfa', '1', 'XS', 1.00, 1, 0, 0, 0, 'placeholder.jpg', 'Available', '2026-04-20 14:31:49'),
(3, 2, 'asdfa', '1', 'S', 99999999.99, 1, 0, 0, 1111, 'placeholder.jpg', 'Available', '2026-04-20 14:32:58'),
(4, 8, '1', '1', 'S', 1.00, 1, 333, 0, 0, 'placeholder.jpg', 'Available', '2026-04-20 14:40:28'),
(5, 11, '11', '1', 'XS', 1.00, 1, 0, 0, 0, 'placeholder.jpg', 'Available', '2026-04-21 10:09:25'),
(6, 11, '1', '1', 'N/A', 1.00, 1, 0, 0, 0, 'placeholder.jpg', 'Available', '2026-04-30 15:18:20'),
(7, 2, '1', '1', 'N/A', 1.00, 1, 0, 0, 0, 'placeholder.jpg', 'Available', '2026-04-30 15:29:52'),
(8, 11, '1', '1', 'N/A', 1.00, 1, 0, 0, 0, '1777566531_1.png', 'Available', '2026-04-30 16:28:51'),
(9, 11, '1', '1', 'L', 1.00, 1, 0, 0, 0, 'placeholder.jpg', 'Available', '2026-05-02 09:30:11'),
(10, 11, '1', '1', 'S', 1.00, 1, 0, 0, 0, '1777714254_1.png', 'Available', '2026-05-02 09:30:54'),
(11, 11, '1', '1', 'M', 1.00, 1, 0, 0, 0, 'placeholder.jpg', 'Available', '2026-05-02 10:43:23'),
(12, 2, 'asdfa', '1111', 'S', 1.00, 1, 0, 0, 0, '1777782440_asdfa.jpg', 'Available', '2026-05-03 04:27:20'),
(13, 11, '1', '1', NULL, 1.00, 1, 0, 0, 0, 'placeholder.jpg', 'Available', '2026-05-03 16:31:07'),
(14, 11, '1', '', 'N/A', 111.00, 1111, 111, 11, 1111, 'placeholder.jpg', 'Available', '2026-05-03 16:41:10');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `product_image` varchar(255) DEFAULT 'placeholder.jpg',
  `status` varchar(50) DEFAULT 'Available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`product_id`, `category_id`, `product_name`, `description`, `price`, `stock_quantity`, `product_image`, `status`, `created_at`) VALUES
(1, 11, '1', '1', 1.00, 1, 'placeholder.jpg', 'Available', '2026-05-02 15:58:07'),
(2, 2, 'asdfa', '1', 1.00, 1, 'placeholder.jpg', 'Available', '2026-05-03 02:50:55'),
(3, 2, 'asdfa', '11', 11.00, 2147483647, '1777800522_asdfa.jpg', 'Available', '2026-05-03 09:28:42'),
(4, 5, '331111', '331111', 11110.00, 331111, 'placeholder.jpg', 'Available', '2026-05-04 04:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'SHS Books'),
(2, 'College Books'),
(3, 'SHS Uniform - Male'),
(4, 'SHS Uniform - Female'),
(5, 'JHS Uniform - Male'),
(6, 'JHS Uniform - Female'),
(7, 'College Uniform - Male'),
(8, 'College Uniform - Female'),
(9, 'PE Uniform'),
(10, 'School Accessories'),
(11, 'Academic Tool');

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

CREATE TABLE `product_types` (
  `type_id` int(11) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `table_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`type_id`, `display_name`, `table_name`) VALUES
(1, 'Books', 'books'),
(2, 'Apparel', 'apparel'),
(3, 'Uniform', 'uniforms'),
(4, 'Academic Tools', 'academic_tools');

-- --------------------------------------------------------

--
-- Table structure for table `uniforms`
--

CREATE TABLE `uniforms` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('Available','Out of Stock') DEFAULT 'Available',
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `stock_m` int(11) DEFAULT 0,
  `stock_l` int(11) DEFAULT 0,
  `stock_xl` int(11) DEFAULT 0,
  `size` varchar(20) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uniforms`
--

INSERT INTO `uniforms` (`product_id`, `category_id`, `product_name`, `description`, `status`, `price`, `stock_quantity`, `stock_m`, `stock_l`, `stock_xl`, `size`, `product_image`, `created_at`) VALUES
(1, 11, 'asdfa', '1', 'Available', 1.00, 16, 15, 2, 17, 'N/A', 'placeholder.jpg', '2026-05-03 15:43:18'),
(2, 11, '1', '1', 'Out of Stock', 11.00, 0, 0, 0, 0, 'N/A', 'placeholder.jpg', '2026-05-03 16:35:26'),
(3, 11, '11', '1', 'Available', 1.00, 11, 11, 11, 1, 'N/A', 'placeholder.jpg', '2026-05-03 16:39:17'),
(4, 11, '22', 'ghkuuiui', 'Available', 22.00, 22, 22, 22, 2, 'N/A', '1777831328_22.jpg', '2026-05-03 18:02:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `student_number` int(9) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'active',
  `last_seen` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `profile_pic`, `course`, `student_number`, `password`, `created_at`, `status`, `last_seen`) VALUES
(2, 'Admin', NULL, 'admin', 202040032, '$2y$10$ra5fEoRTa.1.84mTe0og5.09tQosEh3g4wRuo7xvOg8i7uUTbyoYq', '2026-04-20 15:00:52', 'active', '2026-05-04 18:12:09'),
(4, 'Boon Elijah', NULL, 'BSCPE', 202060032, '$2y$10$0ApV4YnK2YzVPElickxW7OVBTPjt0yXBzlUDMNSUOrlHyT7nn1h.a', '2026-05-04 08:37:15', 'active', '2026-05-04 16:37:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_tools`
--
ALTER TABLE `academic_tools`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `apparel`
--
ALTER TABLE `apparel`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `table_name` (`table_name`);

--
-- Indexes for table `uniforms`
--
ALTER TABLE `uniforms`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_tools`
--
ALTER TABLE `academic_tools`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `apparel`
--
ALTER TABLE `apparel`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_types`
--
ALTER TABLE `product_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uniforms`
--
ALTER TABLE `uniforms`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `uniforms`
--
ALTER TABLE `uniforms`
  ADD CONSTRAINT `uniforms_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
