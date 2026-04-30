-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2026 at 01:38 PM
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
  `product_image` varchar(255) DEFAULT 'placeholder.jpg',
  `status` enum('Available','Out of Stock') NOT NULL DEFAULT 'Available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apparel`
--

INSERT INTO `apparel` (`product_id`, `category_id`, `product_name`, `description`, `size`, `price`, `stock_quantity`, `product_image`, `status`, `created_at`) VALUES
(1, 2, 'asdfa', '1', 'XS', 1.00, 1, 'placeholder.jpg', 'Available', '2026-04-20 14:11:04'),
(2, 2, 'asdfa', '1', 'XS', 1.00, 1, 'placeholder.jpg', 'Available', '2026-04-20 14:31:49'),
(3, 2, 'asdfa', '1', 'S', 1.00, 1, 'placeholder.jpg', 'Available', '2026-04-20 14:32:58'),
(4, 8, '1', '1', 'S', 1.00, 1, 'placeholder.jpg', 'Available', '2026-04-20 14:40:28'),
(5, 11, '11', '1', 'XS', 1.00, 1, 'placeholder.jpg', 'Available', '2026-04-21 10:09:25');

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
-- Table structure for table `others`
--

CREATE TABLE `others` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `product_image` varchar(255) DEFAULT '../../src/placeholder.jpg',
  `status` enum('Available','Out of Stock') NOT NULL DEFAULT 'Available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `others`
--

INSERT INTO `others` (`product_id`, `category_id`, `product_name`, `description`, `price`, `stock_quantity`, `product_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, '1', '1', 1.00, 1, '../../src/placeholder.jpg', 'Available', '2026-04-20 15:43:50', '2026-04-20 15:43:50');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `product_image` varchar(255) DEFAULT 'placeholder.jpg',
  `status` enum('Available','Out of Stock') DEFAULT 'Available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `description`, `price`, `stock_quantity`, `product_image`, `status`, `created_at`) VALUES
(49, 2, 'asdfa', '1', 1.00, 1, '../../src/placeholder.jpg', 'Available', '2026-04-20 10:50:40'),
(50, 2, '1', '1', 1.00, 1, '../../src/placeholder.jpg', 'Available', '2026-04-20 14:40:17');

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
  `size` varchar(20) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uniforms`
--

INSERT INTO `uniforms` (`product_id`, `category_id`, `product_name`, `description`, `status`, `price`, `stock_quantity`, `size`, `product_image`, `created_at`) VALUES
(3, 2, '1', '1', 'Available', 1.00, 1, 'S', '../../src/placeholder.jpg', '2026-04-20 10:25:36'),
(4, 8, '1', '1', 'Available', 1.00, 1, 'S', '../../src/placeholder.jpg', '2026-04-20 10:50:59'),
(5, 2, '1', '1', 'Available', 1.00, 1, 'XS', '../../src/placeholder.jpg', '2026-04-20 14:30:41'),
(6, 2, '1', '1', 'Available', 1.00, 1, 'XS', '../../src/placeholder.jpg', '2026-04-20 14:31:09'),
(7, 2, '1', '1', 'Available', 1.00, 1, 'XS', '../../src/placeholder.jpg', '2026-04-20 14:32:04'),
(8, 2, '`', '1', 'Available', 1.00, 1, 'XS', '../../src/placeholder.jpg', '2026-04-20 14:32:42'),
(9, 2, '1', '1', 'Available', 1.00, 1, 'S', '../../src/placeholder.jpg', '2026-04-20 14:33:06'),
(10, 2, 'asdfa', '1', 'Available', 1.00, 1, 'XS', '../../src/placeholder.jpg', '2026-04-20 14:35:49'),
(11, 2, '1', '1', 'Available', 1.00, 1, 'XS', '../../src/placeholder.jpg', '2026-04-20 14:39:47'),
(12, 2, 'a', '1', 'Available', 1.00, 1, 'XS', '../../src/placeholder.jpg', '2026-04-20 14:44:05');

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `profile_pic`, `course`, `student_number`, `password`, `created_at`) VALUES
(0, 'Boon Elijah', NULL, 'BSCPE', 202090032, '$2y$10$1D2GS15FLMnrZbUSZzrIRO6T9fJDvkKF2EEjsRgzuvTmmqd5eE.Fu', '2026-04-18 16:50:46'),
(0, 'Admin', NULL, 'admin', 202040032, '$2y$10$ra5fEoRTa.1.84mTe0og5.09tQosEh3g4wRuo7xvOg8i7uUTbyoYq', '2026-04-20 15:00:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apparel`
--
ALTER TABLE `apparel`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `others`
--
ALTER TABLE `others`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `uniforms`
--
ALTER TABLE `uniforms`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apparel`
--
ALTER TABLE `apparel`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `others`
--
ALTER TABLE `others`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `uniforms`
--
ALTER TABLE `uniforms`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `uniforms`
--
ALTER TABLE `uniforms`
  ADD CONSTRAINT `uniforms_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
