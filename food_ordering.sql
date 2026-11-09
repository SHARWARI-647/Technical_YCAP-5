-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2026 at 08:13 AM
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
-- Database: `food_ordering`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `itemname` varchar(255) NOT NULL,
  `foodchoice` varchar(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `location` varchar(255) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMode` varchar(30) NOT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `hotelname` varchar(255) NOT NULL
) ;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`orderId`, `userId`, `itemname`, `foodchoice`, `qty`, `amount`, `status`, `location`, `orderDate`, `paymentMode`, `rating`, `hotelname`) VALUES
(1, 1, 'Chicken Biryani', 'Non-Veg', 2, 500.00, 'Delivered', 'Andheri', '2026-10-08 13:57:42', 'UPI', 5.0, 'Food Palace'),
(2, 2, 'Paneer Butter Masala', 'Veg', 1, 220.00, 'Delivered', 'Bandra', '2026-10-08 13:57:42', 'Credit Card', 4.5, 'Spice Garden'),
(3, 2, 'Masala Dosa', 'Veg', 2, 240.00, 'Delivered', 'Dadar', '2026-10-08 13:57:42', 'Cash', 4.0, 'Pizza Hub'),
(4, 4, 'Veg Biryani', 'Veg', 1, 180.00, 'Delivered', 'Powai', '2026-10-08 13:57:42', 'UPI', 4.5, 'Tasty Treats'),
(5, 4, 'Chicken Burger', 'Non-Veg', 2, 360.00, 'Delivered', 'Thane', '2026-10-08 13:57:42', 'Debit Card', 5.0, 'Royal Restaurant'),
(6, 4, 'Margherita Pizza', 'Veg', 1, 299.00, 'Delivered', 'Kurla', '2026-10-08 13:57:42', 'UPI', 4.0, 'Food Palace'),
(7, 7, 'Paneer Pizza', 'Veg', 2, 598.00, 'Preparing', 'Ghatkopar', '2026-10-08 13:57:42', 'UPI', NULL, 'Spice Garden'),
(8, 8, 'Veg Noodles', 'Veg', 1, 180.00, 'Delivered', 'Vikhroli', '2026-10-08 13:57:42', 'Cash', 4.5, 'Pizza Hub'),
(9, 2, 'Chicken Fried Rice', 'Non-Veg', 2, 420.00, 'Delivered', 'Mulund', '2026-10-08 13:57:42', 'Credit Card', 5.0, 'Tasty Treats'),
(10, 10, 'Pav Bhaji', 'Veg', 2, 240.00, 'Cancelled', 'Sion', '2026-10-08 13:57:42', 'UPI', NULL, 'Royal Restaurant'),
(11, 11, 'Chole Bhature', 'Veg', 1, 160.00, 'Delivered', 'Andheri', '2026-10-08 13:57:42', 'UPI', 4.0, 'Food Palace'),
(12, 12, 'Butter Chicken', 'Non-Veg', 2, 560.00, 'Delivered', 'Bandra', '2026-10-08 13:57:42', 'Credit Card', 5.0, 'Spice Garden'),
(13, 13, 'Paneer Tikka', 'Veg', 1, 240.00, 'Delivered', 'Powai', '2026-10-08 13:57:42', 'Cash', 4.5, 'Pizza Hub'),
(14, 14, 'Veg Thali', 'Veg', 2, 700.00, 'Delivered', 'Dadar', '2026-10-08 13:57:42', 'UPI', 4.0, 'Tasty Treats'),
(15, 15, 'Chicken Roll', 'Non-Veg', 2, 300.00, 'Cancelled', 'Kurla', '2026-10-08 13:57:42', 'Debit Card', NULL, 'Royal Restaurant'),
(16, 16, 'Masala Dosa', 'Veg', 1, 120.00, 'Delivered', 'Thane', '2026-10-08 13:57:42', 'UPI', 4.5, 'Food Palace'),
(17, 17, 'Samosa', 'Veg', 5, 100.00, 'Delivered', 'Ghatkopar', '2026-10-08 13:57:42', 'Cash', 4.0, 'Spice Garden'),
(18, 18, 'Pani Puri', 'Veg', 3, 150.00, 'Preparing', 'Andheri', '2026-10-08 13:57:42', 'UPI', NULL, 'Pizza Hub'),
(19, 19, 'Chicken Biryani', 'Non-Veg', 1, 240.00, 'Delivered', 'Bandra', '2026-10-08 13:57:42', 'Credit Card', 5.0, 'Tasty Treats'),
(20, 20, 'Veg Burger', 'Veg', 2, 320.00, 'Delivered', 'Borivali', '2026-10-08 13:57:42', 'UPI', 4.0, 'Royal Restaurant'),
(21, 21, 'Cheese Pizza', 'Veg', 1, 349.00, 'Delivered', 'Malad', '2026-10-08 13:57:42', 'Credit Card', 4.5, 'Food Palace'),
(22, 22, 'Paneer Biryani', 'Veg', 2, 440.00, 'Delivered', 'Goregaon', '2026-10-08 13:57:42', 'UPI', 5.0, 'Spice Garden'),
(23, 23, 'Chicken Burger', 'Non-Veg', 1, 180.00, 'Cancelled', 'Kandivali', '2026-10-08 13:57:42', 'Cash', NULL, 'Pizza Hub'),
(24, 24, 'Dal Tadka', 'Veg', 2, 300.00, 'Delivered', 'Thane', '2026-10-08 13:57:42', 'UPI', 4.0, 'Tasty Treats'),
(25, 25, 'Garlic Naan', 'Veg', 4, 600.00, 'Delivered', 'Mulund', '2026-10-08 13:57:42', 'Debit Card', 4.5, 'Royal Restaurant'),
(26, 26, 'Chicken Tikka', 'Non-Veg', 1, 280.00, 'Preparing', 'Powai', '2026-10-08 13:57:42', 'UPI', NULL, 'Food Palace'),
(27, 27, 'Veg Fried Rice', 'Veg', 2, 360.00, 'Delivered', 'Vikhroli', '2026-10-08 13:57:42', 'Credit Card', 4.0, 'Spice Garden'),
(28, 28, 'Hakka Noodles', 'Veg', 1, 180.00, 'Delivered', 'Ghatkopar', '2026-10-08 13:57:42', 'UPI', 4.5, 'Pizza Hub'),
(29, 29, 'Paneer Chilli', 'Veg', 2, 400.00, 'Delivered', 'Chembur', '2026-10-08 13:57:42', 'Cash', 5.0, 'Tasty Treats'),
(30, 30, 'Pav Bhaji', 'Veg', 1, 120.00, 'Cancelled', 'Dadar', '2026-10-08 13:57:42', 'UPI', NULL, 'Royal Restaurant'),
(31, 31, 'Chicken Biryani', 'Non-Veg', 1, 240.00, 'Delivered', 'Andheri', '2026-10-08 13:57:42', 'Credit Card', 5.0, 'Food Palace'),
(32, 32, 'Veg Pizza', 'Veg', 2, 598.00, 'Delivered', 'Bandra', '2026-10-08 13:57:42', 'UPI', 4.5, 'Spice Garden'),
(33, 33, 'Paneer Roll', 'Veg', 2, 280.00, 'Delivered', 'Powai', '2026-10-08 13:57:42', 'Cash', 4.0, 'Pizza Hub'),
(34, 34, 'Chicken Noodles', 'Non-Veg', 1, 220.00, 'Delivered', 'Thane', '2026-10-08 13:57:42', 'UPI', 4.5, 'Tasty Treats'),
(35, 35, 'Veg Manchurian', 'Veg', 2, 360.00, 'Cancelled', 'Kurla', '2026-10-08 13:57:42', 'Debit Card', NULL, 'Royal Restaurant'),
(36, 36, 'Butter Naan', 'Veg', 4, 240.00, 'Delivered', 'Dadar', '2026-10-08 13:57:42', 'UPI', 5.0, 'Food Palace'),
(37, 37, 'Rajma Chawal', 'Veg', 1, 180.00, 'Preparing', 'Sion', '2026-10-08 13:57:42', 'Cash', NULL, 'Spice Garden'),
(38, 38, 'Chole Bhature', 'Veg', 2, 320.00, 'Delivered', 'Ghatkopar', '2026-10-08 13:57:42', 'UPI', 4.0, 'Pizza Hub'),
(39, 39, 'Chicken Shawarma', 'Non-Veg', 1, 220.00, 'Delivered', 'Andheri', '2026-10-08 13:57:42', 'Credit Card', 4.5, 'Tasty Treats'),
(40, 40, 'Veg Sandwich', 'Veg', 2, 260.00, 'Cancelled', 'Bandra', '2026-10-08 13:57:42', 'UPI', NULL, 'Royal Restaurant'),
(41, 41, 'Chicken Pizza', 'Non-Veg', 1, 399.00, 'Delivered', 'Powai', '2026-10-08 13:57:42', 'UPI', 5.0, 'Food Palace'),
(42, 42, 'Paneer Pizza', 'Veg', 2, 598.00, 'Delivered', 'Thane', '2026-10-08 13:57:42', 'Cash', 4.0, 'Spice Garden'),
(43, 43, 'Veg Biryani', 'Veg', 1, 180.00, 'Delivered', 'Mulund', '2026-10-08 13:57:42', 'Credit Card', 4.5, 'Pizza Hub'),
(44, 44, 'Chicken Biryani', 'Non-Veg', 2, 480.00, 'Preparing', 'BKC', '2026-10-08 13:57:42', 'UPI', NULL, 'Tasty Treats'),
(45, 45, 'Paneer Tikka', 'Veg', 2, 480.00, 'Delivered', 'Bandra', '2026-10-08 13:57:42', 'Debit Card', 5.0, 'Royal Restaurant'),
(46, 46, 'Masala Dosa', 'Veg', 1, 120.00, 'Delivered', 'Dadar', '2026-10-08 13:57:42', 'Cash', 4.0, 'Food Palace'),
(47, 47, 'Idli Sambar', 'Veg', 3, 210.00, 'Cancelled', 'Matunga', '2026-10-08 13:57:42', 'UPI', NULL, 'Spice Garden'),
(48, 48, 'Vada Pav', 'Veg', 5, 100.00, 'Delivered', 'Andheri', '2026-10-08 13:57:42', 'Credit Card', 4.5, 'Pizza Hub'),
(49, 49, 'Chicken Burger', 'Non-Veg', 2, 360.00, 'Delivered', 'Juhu', '2026-10-08 13:57:42', 'UPI', 5.0, 'Tasty Treats'),
(50, 50, 'Veg Burger', 'Veg', 1, 160.00, 'Delivered', 'Santacruz', '2026-10-08 13:57:42', 'Cash', 4.0, 'Royal Restaurant'),
(51, 51, 'Cheese Sandwich', 'Veg', 2, 260.00, 'Delivered', 'Bandra', '2026-10-08 13:57:42', 'UPI', 4.5, 'Food Palace'),
(52, 52, 'Chicken Roll', 'Non-Veg', 2, 300.00, 'Delivered', 'Andheri', '2026-10-08 13:57:42', 'Credit Card', 5.0, 'Spice Garden'),
(53, 53, 'Veg Roll', 'Veg', 1, 140.00, 'Cancelled', 'Dadar', '2026-10-08 13:57:42', 'Cash', NULL, 'Pizza Hub'),
(54, 54, 'Paneer Butter Masala', 'Veg', 2, 440.00, 'Delivered', 'Powai', '2026-10-08 13:57:42', 'UPI', 4.5, 'Tasty Treats'),
(55, 55, 'Chicken Curry', 'Non-Veg', 1, 300.00, 'Preparing', 'Thane', '2026-10-08 13:57:42', 'Debit Card', NULL, 'Royal Restaurant'),
(56, 56, 'Dal Makhani', 'Veg', 2, 320.00, 'Delivered', 'BKC', '2026-10-08 13:57:42', 'UPI', 4.0, 'Food Palace'),
(57, 57, 'Palak Paneer', 'Veg', 1, 220.00, 'Delivered', 'Ghatkopar', '2026-10-08 13:57:42', 'Cash', 4.5, 'Spice Garden'),
(58, 58, 'Chilli Paneer', 'Veg', 2, 400.00, 'Delivered', 'Vikhroli', '2026-10-08 13:57:42', 'Credit Card', 5.0, 'Pizza Hub'),
(59, 59, 'Chicken Fried Rice', 'Non-Veg', 1, 210.00, 'Delivered', 'Kurla', '2026-10-08 13:57:42', 'UPI', 4.0, 'Tasty Treats'),
(60, 60, 'Veg Fried Rice', 'Veg', 2, 360.00, 'Cancelled', 'Chembur', '2026-10-08 13:57:42', 'Cash', NULL, 'Royal Restaurant'),
(61, 61, 'Chicken Biryani', 'Non-Veg', 1, 240.00, 'Delivered', 'Andheri', '2026-10-08 13:57:42', 'UPI', 5.0, 'Food Palace'),
(62, 62, 'Paneer Biryani', 'Veg', 2, 440.00, 'Delivered', 'Bandra', '2026-10-08 13:57:42', 'Credit Card', 4.5, 'Spice Garden'),
(63, 63, 'Veg Thali', 'Veg', 1, 180.00, 'Preparing', 'Dadar', '2026-10-08 13:57:42', 'Cash', NULL, 'Pizza Hub'),
(64, 64, 'Chicken Thali', 'Non-Veg', 1, 280.00, 'Delivered', 'Thane', '2026-10-08 13:57:42', 'UPI', 5.0, 'Tasty Treats'),
(65, 65, 'Paneer Tikka Masala', 'Veg', 2, 460.00, 'Delivered', 'Powai', '2026-10-08 13:57:42', 'Debit Card', 4.0, 'Royal Restaurant'),
(66, 66, 'Butter Chicken', 'Non-Veg', 1, 280.00, 'Cancelled', 'Goregaon', '2026-10-08 13:57:42', 'UPI', NULL, 'Food Palace'),
(67, 67, 'Tandoori Chicken', 'Non-Veg', 1, 320.00, 'Delivered', 'Malad', '2026-10-08 13:57:42', 'Credit Card', 4.5, 'Spice Garden'),
(68, 68, 'Chicken Kebab', 'Non-Veg', 2, 420.00, 'Delivered', 'Borivali', '2026-10-08 13:57:42', 'Cash', 5.0, 'Pizza Hub'),
(69, 69, 'Veg Kebab', 'Veg', 2, 360.00, 'Delivered', 'Kandivali', '2026-10-08 13:57:42', 'UPI', 4.0, 'Tasty Treats'),
(70, 70, 'Paneer Roll', 'Veg', 1, 140.00, 'Preparing', 'Ghatkopar', '2026-10-08 13:57:42', 'Cash', NULL, 'Royal Restaurant'),
(71, 71, 'Margherita Pizza', 'Veg', 2, 598.00, 'Delivered', 'Andheri', '2026-10-08 13:57:42', 'UPI', 4.5, 'Food Palace'),
(72, 72, 'Farmhouse Pizza', 'Veg', 1, 399.00, 'Delivered', 'Bandra', '2026-10-08 13:57:42', 'Credit Card', 5.0, 'Spice Garden'),
(73, 73, 'Chicken Pizza', 'Non-Veg', 2, 798.00, 'Delivered', 'Powai', '2026-10-08 13:57:42', 'Cash', 4.0, 'Pizza Hub'),
(74, 74, 'Paneer Pizza', 'Veg', 1, 299.00, 'Cancelled', 'Thane', '2026-10-08 13:57:42', 'UPI', NULL, 'Tasty Treats'),
(75, 75, 'Garlic Bread', 'Veg', 2, 300.00, 'Delivered', 'Dadar', '2026-10-08 13:57:42', 'Debit Card', 4.5, 'Royal Restaurant'),
(76, 76, 'Pasta Alfredo', 'Veg', 1, 280.00, 'Preparing', 'BKC', '2026-10-08 13:57:42', 'UPI', NULL, 'Food Palace'),
(77, 77, 'White Sauce Pasta', 'Veg', 2, 560.00, 'Delivered', 'Kurla', '2026-10-08 13:57:42', 'Cash', 5.0, 'Spice Garden'),
(78, 78, 'Red Sauce Pasta', 'Veg', 1, 240.00, 'Delivered', 'Andheri', '2026-10-08 13:57:42', 'Credit Card', 4.0, 'Pizza Hub'),
(79, 79, 'Chicken Pasta', 'Non-Veg', 2, 640.00, 'Delivered', 'Bandra', '2026-10-08 13:57:42', 'UPI', 4.5, 'Tasty Treats'),
(80, 80, 'Veg Pasta', 'Veg', 1, 240.00, 'Cancelled', 'Powai', '2026-10-08 13:57:42', 'Cash', NULL, 'Royal Restaurant'),
(81, 81, 'Chicken Burger', 'Non-Veg', 2, 360.00, 'Delivered', 'Thane', '2026-10-08 13:57:42', 'UPI', 5.0, 'Food Palace'),
(82, 82, 'Cheese Burger', 'Veg', 1, 190.00, 'Delivered', 'Mulund', '2026-10-08 13:57:42', 'Credit Card', 4.5, 'Spice Garden'),
(83, 83, 'Veg Burger', 'Veg', 2, 320.00, 'Preparing', 'Ghatkopar', '2026-10-08 13:57:42', 'Cash', NULL, 'Pizza Hub'),
(84, 84, 'Chicken Wrap', 'Non-Veg', 1, 220.00, 'Delivered', 'Vikhroli', '2026-10-08 13:57:42', 'UPI', 4.0, 'Tasty Treats'),
(85, 85, 'Paneer Wrap', 'Veg', 2, 360.00, 'Delivered', 'Kurla', '2026-10-08 13:57:42', 'Debit Card', 4.5, 'Royal Restaurant'),
(86, 86, 'Chicken Shawarma', 'Non-Veg', 1, 220.00, 'Cancelled', 'Chembur', '2026-10-08 13:57:42', 'UPI', NULL, 'Food Palace'),
(87, 87, 'Falafel Wrap', 'Veg', 2, 360.00, 'Delivered', 'Bandra', '2026-10-08 13:57:42', 'Credit Card', 5.0, 'Spice Garden'),
(88, 88, 'French Fries', 'Veg', 3, 270.00, 'Delivered', 'Andheri', '2026-10-08 13:57:42', 'Cash', 4.0, 'Pizza Hub'),
(89, 89, 'Peri Peri Fries', 'Veg', 2, 260.00, 'Delivered', 'Powai', '2026-10-08 13:57:42', 'UPI', 4.5, 'Tasty Treats'),
(90, 90, 'Chicken Wings', 'Non-Veg', 1, 320.00, 'Preparing', 'Thane', '2026-10-08 13:57:42', 'Credit Card', NULL, 'Royal Restaurant'),
(91, 91, 'Chicken Biryani', 'Non-Veg', 2, 480.00, 'Delivered', 'Andheri', '2026-10-08 13:57:42', 'UPI', 5.0, 'Food Palace'),
(92, 92, 'Veg Biryani', 'Veg', 1, 180.00, 'Delivered', 'Bandra', '2026-10-08 13:57:42', 'Credit Card', 4.5, 'Spice Garden'),
(93, 93, 'Paneer Biryani', 'Veg', 2, 440.00, 'Delivered', 'Dadar', '2026-10-08 13:57:42', 'Cash', 4.0, 'Pizza Hub'),
(94, 94, 'Chicken Curry', 'Non-Veg', 1, 300.00, 'Cancelled', 'Powai', '2026-10-08 13:57:42', 'UPI', NULL, 'Tasty Treats'),
(95, 95, 'Paneer Curry', 'Veg', 2, 440.00, 'Delivered', 'Thane', '2026-10-08 13:57:42', 'Debit Card', 4.5, 'Royal Restaurant'),
(96, 96, 'Dal Tadka', 'Veg', 1, 150.00, 'Preparing', 'Kurla', '2026-10-08 13:57:42', 'UPI', NULL, 'Food Palace'),
(97, 97, 'Butter Naan', 'Veg', 4, 240.00, 'Delivered', 'Ghatkopar', '2026-10-08 13:57:42', 'Cash', 5.0, 'Spice Garden'),
(98, 98, 'Chicken Tikka', 'Non-Veg', 2, 560.00, 'Delivered', 'Andheri', '2026-10-08 13:57:42', 'Credit Card', 4.0, 'Pizza Hub'),
(99, 99, 'Paneer Tikka', 'Veg', 1, 240.00, 'Delivered', 'Bandra', '2026-10-08 13:57:42', 'UPI', 4.5, 'Tasty Treats'),
(100, 100, 'Gulab Jamun', 'Veg', 4, 240.00, 'Delivered', 'Dadar', '2026-10-08 13:57:42', 'Cash', 5.0, 'Royal Restaurant');

-- --------------------------------------------------------

--
-- Table structure for table `usercredentials`
--

CREATE TABLE `usercredentials` (
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usercredentials`
--

INSERT INTO `usercredentials` (`name`, `email`, `password`, `location`, `userId`) VALUES
('Rani', 'rani@gmail.com', '123', 'Yavatmal', 101),
('Om', 'om@gmail.com', '123', 'Yavatmal', 102),
('Shiv', 'shiv@gmail.com', '123', 'Yavatmal', 103);

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `userId` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`userId`, `email`, `password`, `phone`, `address`, `createdAt`) VALUES
(1, 'fooduser01@gmail.com', 'food123', '9876500001', 'Andheri, Mumbai', '2026-10-08 13:57:29'),
(2, 'fooduser02@gmail.com', 'food123', '9876500002', 'Bandra, Mumbai', '2026-10-08 13:57:29'),
(3, 'fooduser03@gmail.com', 'food123', '9876500003', 'Dadar, Mumbai', '2026-10-08 13:57:29'),
(4, 'fooduser04@gmail.com', 'food123', '9876500004', 'Powai, Mumbai', '2026-10-08 13:57:29'),
(5, 'fooduser05@gmail.com', 'food123', '9876500005', 'Thane, Mumbai', '2026-10-08 13:57:29'),
(6, 'fooduser06@gmail.com', 'food123', '9876500006', 'Kurla, Mumbai', '2026-10-08 13:57:29'),
(7, 'fooduser07@gmail.com', 'food123', '9876500007', 'Ghatkopar, Mumbai', '2026-10-08 13:57:29'),
(8, 'fooduser08@gmail.com', 'food123', '9876500008', 'Vikhroli, Mumbai', '2026-10-08 13:57:29'),
(9, 'fooduser09@gmail.com', 'food123', '9876500009', 'Mulund, Mumbai', '2026-10-08 13:57:29'),
(10, 'fooduser10@gmail.com', 'food123', '9876500010', 'Sion, Mumbai', '2026-10-08 13:57:29'),
(11, 'fooduser11@gmail.com', 'food123', '9876500011', 'Andheri, Mumbai', '2026-10-08 13:57:29'),
(12, 'fooduser12@gmail.com', 'food123', '9876500012', 'Bandra, Mumbai', '2026-10-08 13:57:29'),
(13, 'fooduser13@gmail.com', 'food123', '9876500013', 'Powai, Mumbai', '2026-10-08 13:57:29'),
(14, 'fooduser14@gmail.com', 'food123', '9876500014', 'Dadar, Mumbai', '2026-10-08 13:57:29'),
(15, 'fooduser15@gmail.com', 'food123', '9876500015', 'Kurla, Mumbai', '2026-10-08 13:57:29'),
(16, 'fooduser16@gmail.com', 'food123', '9876500016', 'Thane, Mumbai', '2026-10-08 13:57:29'),
(17, 'fooduser17@gmail.com', 'food123', '9876500017', 'Ghatkopar, Mumbai', '2026-10-08 13:57:29'),
(18, 'fooduser18@gmail.com', 'food123', '9876500018', 'Andheri, Mumbai', '2026-10-08 13:57:29'),
(19, 'fooduser19@gmail.com', 'food123', '9876500019', 'Bandra, Mumbai', '2026-10-08 13:57:29'),
(20, 'fooduser20@gmail.com', 'food123', '9876500020', 'Borivali, Mumbai', '2026-10-08 13:57:29'),
(21, 'fooduser21@gmail.com', 'food123', '9876500021', 'Malad, Mumbai', '2026-10-08 13:57:29'),
(22, 'fooduser22@gmail.com', 'food123', '9876500022', 'Goregaon, Mumbai', '2026-10-08 13:57:29'),
(23, 'fooduser23@gmail.com', 'food123', '9876500023', 'Kandivali, Mumbai', '2026-10-08 13:57:29'),
(24, 'fooduser24@gmail.com', 'food123', '9876500024', 'Thane, Mumbai', '2026-10-08 13:57:29'),
(25, 'fooduser25@gmail.com', 'food123', '9876500025', 'Mulund, Mumbai', '2026-10-08 13:57:29'),
(26, 'fooduser26@gmail.com', 'food123', '9876500026', 'Powai, Mumbai', '2026-10-08 13:57:29'),
(27, 'fooduser27@gmail.com', 'food123', '9876500027', 'Vikhroli, Mumbai', '2026-10-08 13:57:29'),
(28, 'fooduser28@gmail.com', 'food123', '9876500028', 'Ghatkopar, Mumbai', '2026-10-08 13:57:29'),
(29, 'fooduser29@gmail.com', 'food123', '9876500029', 'Chembur, Mumbai', '2026-10-08 13:57:29'),
(30, 'fooduser30@gmail.com', 'food123', '9876500030', 'Dadar, Mumbai', '2026-10-08 13:57:29'),
(31, 'fooduser31@gmail.com', 'food123', '9876500031', 'Andheri, Mumbai', '2026-10-08 13:57:29'),
(32, 'fooduser32@gmail.com', 'food123', '9876500032', 'Bandra, Mumbai', '2026-10-08 13:57:29'),
(33, 'fooduser33@gmail.com', 'food123', '9876500033', 'Powai, Mumbai', '2026-10-08 13:57:29'),
(34, 'fooduser34@gmail.com', 'food123', '9876500034', 'Thane, Mumbai', '2026-10-08 13:57:29'),
(35, 'fooduser35@gmail.com', 'food123', '9876500035', 'Kurla, Mumbai', '2026-10-08 13:57:29'),
(36, 'fooduser36@gmail.com', 'food123', '9876500036', 'Dadar, Mumbai', '2026-10-08 13:57:29'),
(37, 'fooduser37@gmail.com', 'food123', '9876500037', 'Sion, Mumbai', '2026-10-08 13:57:29'),
(38, 'fooduser38@gmail.com', 'food123', '9876500038', 'Ghatkopar, Mumbai', '2026-10-08 13:57:29'),
(39, 'fooduser39@gmail.com', 'food123', '9876500039', 'Andheri, Mumbai', '2026-10-08 13:57:29'),
(40, 'fooduser40@gmail.com', 'food123', '9876500040', 'Bandra, Mumbai', '2026-10-08 13:57:29'),
(41, 'fooduser41@gmail.com', 'food123', '9876500041', 'Powai, Mumbai', '2026-10-08 13:57:29'),
(42, 'fooduser42@gmail.com', 'food123', '9876500042', 'Thane, Mumbai', '2026-10-08 13:57:29'),
(43, 'fooduser43@gmail.com', 'food123', '9876500043', 'Mulund, Mumbai', '2026-10-08 13:57:29'),
(44, 'fooduser44@gmail.com', 'food123', '9876500044', 'BKC, Mumbai', '2026-10-08 13:57:29'),
(45, 'fooduser45@gmail.com', 'food123', '9876500045', 'Bandra, Mumbai', '2026-10-08 13:57:29'),
(46, 'fooduser46@gmail.com', 'food123', '9876500046', 'Dadar, Mumbai', '2026-10-08 13:57:29'),
(47, 'fooduser47@gmail.com', 'food123', '9876500047', 'Matunga, Mumbai', '2026-10-08 13:57:29'),
(48, 'fooduser48@gmail.com', 'food123', '9876500048', 'Andheri, Mumbai', '2026-10-08 13:57:29'),
(49, 'fooduser49@gmail.com', 'food123', '9876500049', 'Juhu, Mumbai', '2026-10-08 13:57:29'),
(50, 'fooduser50@gmail.com', 'food123', '9876500050', 'Santacruz, Mumbai', '2026-10-08 13:57:29'),
(51, 'fooduser51@gmail.com', 'food123', '9876500051', 'Bandra, Mumbai', '2026-10-08 13:57:29'),
(52, 'fooduser52@gmail.com', 'food123', '9876500052', 'Andheri, Mumbai', '2026-10-08 13:57:29'),
(53, 'fooduser53@gmail.com', 'food123', '9876500053', 'Dadar, Mumbai', '2026-10-08 13:57:29'),
(54, 'fooduser54@gmail.com', 'food123', '9876500054', 'Powai, Mumbai', '2026-10-08 13:57:29'),
(55, 'fooduser55@gmail.com', 'food123', '9876500055', 'Thane, Mumbai', '2026-10-08 13:57:29'),
(56, 'fooduser56@gmail.com', 'food123', '9876500056', 'BKC, Mumbai', '2026-10-08 13:57:29'),
(57, 'fooduser57@gmail.com', 'food123', '9876500057', 'Ghatkopar, Mumbai', '2026-10-08 13:57:29'),
(58, 'fooduser58@gmail.com', 'food123', '9876500058', 'Vikhroli, Mumbai', '2026-10-08 13:57:29'),
(59, 'fooduser59@gmail.com', 'food123', '9876500059', 'Kurla, Mumbai', '2026-10-08 13:57:29'),
(60, 'fooduser60@gmail.com', 'food123', '9876500060', 'Chembur, Mumbai', '2026-10-08 13:57:29'),
(61, 'fooduser61@gmail.com', 'food123', '9876500061', 'Andheri, Mumbai', '2026-10-08 13:57:29'),
(62, 'fooduser62@gmail.com', 'food123', '9876500062', 'Bandra, Mumbai', '2026-10-08 13:57:29'),
(63, 'fooduser63@gmail.com', 'food123', '9876500063', 'Dadar, Mumbai', '2026-10-08 13:57:29'),
(64, 'fooduser64@gmail.com', 'food123', '9876500064', 'Thane, Mumbai', '2026-10-08 13:57:29'),
(65, 'fooduser65@gmail.com', 'food123', '9876500065', 'Powai, Mumbai', '2026-10-08 13:57:29'),
(66, 'fooduser66@gmail.com', 'food123', '9876500066', 'Goregaon, Mumbai', '2026-10-08 13:57:29'),
(67, 'fooduser67@gmail.com', 'food123', '9876500067', 'Malad, Mumbai', '2026-10-08 13:57:29'),
(68, 'fooduser68@gmail.com', 'food123', '9876500068', 'Borivali, Mumbai', '2026-10-08 13:57:29'),
(69, 'fooduser69@gmail.com', 'food123', '9876500069', 'Kandivali, Mumbai', '2026-10-08 13:57:29'),
(70, 'fooduser70@gmail.com', 'food123', '9876500070', 'Ghatkopar, Mumbai', '2026-10-08 13:57:29'),
(71, 'fooduser71@gmail.com', 'food123', '9876500071', 'Andheri, Mumbai', '2026-10-08 13:57:29'),
(72, 'fooduser72@gmail.com', 'food123', '9876500072', 'Bandra, Mumbai', '2026-10-08 13:57:29'),
(73, 'fooduser73@gmail.com', 'food123', '9876500073', 'Powai, Mumbai', '2026-10-08 13:57:29'),
(74, 'fooduser74@gmail.com', 'food123', '9876500074', 'Thane, Mumbai', '2026-10-08 13:57:29'),
(75, 'fooduser75@gmail.com', 'food123', '9876500075', 'Dadar, Mumbai', '2026-10-08 13:57:29'),
(76, 'fooduser76@gmail.com', 'food123', '9876500076', 'BKC, Mumbai', '2026-10-08 13:57:29'),
(77, 'fooduser77@gmail.com', 'food123', '9876500077', 'Kurla, Mumbai', '2026-10-08 13:57:29'),
(78, 'fooduser78@gmail.com', 'food123', '9876500078', 'Andheri, Mumbai', '2026-10-08 13:57:29'),
(79, 'fooduser79@gmail.com', 'food123', '9876500079', 'Bandra, Mumbai', '2026-10-08 13:57:29'),
(80, 'fooduser80@gmail.com', 'food123', '9876500080', 'Powai, Mumbai', '2026-10-08 13:57:29'),
(81, 'fooduser81@gmail.com', 'food123', '9876500081', 'Thane, Mumbai', '2026-10-08 13:57:29'),
(82, 'fooduser82@gmail.com', 'food123', '9876500082', 'Mulund, Mumbai', '2026-10-08 13:57:29'),
(83, 'fooduser83@gmail.com', 'food123', '9876500083', 'Ghatkopar, Mumbai', '2026-10-08 13:57:29'),
(84, 'fooduser84@gmail.com', 'food123', '9876500084', 'Vikhroli, Mumbai', '2026-10-08 13:57:29'),
(85, 'fooduser85@gmail.com', 'food123', '9876500085', 'Kurla, Mumbai', '2026-10-08 13:57:29'),
(86, 'fooduser86@gmail.com', 'food123', '9876500086', 'Chembur, Mumbai', '2026-10-08 13:57:29'),
(87, 'fooduser87@gmail.com', 'food123', '9876500087', 'Bandra, Mumbai', '2026-10-08 13:57:29'),
(88, 'fooduser88@gmail.com', 'food123', '9876500088', 'Andheri, Mumbai', '2026-10-08 13:57:29'),
(89, 'fooduser89@gmail.com', 'food123', '9876500089', 'Powai, Mumbai', '2026-10-08 13:57:29'),
(90, 'fooduser90@gmail.com', 'food123', '9876500090', 'Thane, Mumbai', '2026-10-08 13:57:29'),
(91, 'fooduser91@gmail.com', 'food123', '9876500091', 'Andheri, Mumbai', '2026-10-08 13:57:29'),
(92, 'fooduser92@gmail.com', 'food123', '9876500092', 'Bandra, Mumbai', '2026-10-08 13:57:29'),
(93, 'fooduser93@gmail.com', 'food123', '9876500093', 'Dadar, Mumbai', '2026-10-08 13:57:29'),
(94, 'fooduser94@gmail.com', 'food123', '9876500094', 'Powai, Mumbai', '2026-10-08 13:57:29'),
(95, 'fooduser95@gmail.com', 'food123', '9876500095', 'Thane, Mumbai', '2026-10-08 13:57:29'),
(96, 'fooduser96@gmail.com', 'food123', '9876500096', 'Kurla, Mumbai', '2026-10-08 13:57:29'),
(97, 'fooduser97@gmail.com', 'food123', '9876500097', 'Ghatkopar, Mumbai', '2026-10-08 13:57:29'),
(98, 'fooduser98@gmail.com', 'food123', '9876500098', 'Andheri, Mumbai', '2026-10-08 13:57:29'),
(99, 'fooduser99@gmail.com', 'food123', '9876500099', 'Bandra, Mumbai', '2026-10-08 13:57:29'),
(100, 'fooduser100@gmail.com', 'food123', '9876500100', 'Dadar, Mumbai', '2026-10-08 13:57:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderId` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userdetails`
--
ALTER TABLE `userdetails`
  MODIFY `userId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `userdetails` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
