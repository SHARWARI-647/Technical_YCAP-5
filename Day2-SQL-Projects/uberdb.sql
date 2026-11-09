-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2026 at 08:07 AM
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
-- Database: `uberdb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `PopulateUberDB` ()   BEGIN
    DECLARE i INT DEFAULT 1;

    SET FOREIGN_KEY_CHECKS = 0;

    TRUNCATE TABLE Rides;
    TRUNCATE TABLE Drivers;
    TRUNCATE TABLE Users;

    SET FOREIGN_KEY_CHECKS = 1;

    -- Insert 100 Users
    SET i = 1;

    WHILE i <= 100 DO
        INSERT INTO Users
            (first_name, last_name, email, phone, rating, city)
        VALUES
            (
                CONCAT('UserFirst', i),
                CONCAT('UserLast', i),
                CONCAT('user', i, '@example.com'),
                CONCAT('+9198765', LPAD(i, 5, '0')),
                ROUND(3.5 + RAND() * 1.5, 2),
                ELT(
                    1 + FLOOR(RAND() * 5),
                    'Mumbai', 'Delhi', 'Bangalore', 'Pune', 'Hyderabad'
                )
            );

        SET i = i + 1;
    END WHILE;

    -- Insert 100 Drivers
    SET i = 1;

    WHILE i <= 100 DO
        INSERT INTO Drivers
            (first_name, last_name, email, phone, vehicle_type,
             license_plate, rating, status)
        VALUES
            (
                CONCAT('DriverFirst', i),
                CONCAT('DriverLast', i),
                CONCAT('driver', i, '@partner.com'),
                CONCAT('+9191234', LPAD(i, 5, '0')),
                ELT(
                    1 + FLOOR(RAND() * 4),
                    'UberGo', 'UberXL', 'UberPremier', 'UberAuto'
                ),
                CONCAT(
                    'MH',
                    LPAD(1 + FLOOR(RAND() * 49), 2, '0'),
                    'AB',
                    LPAD(i, 4, '0')
                ),
                ROUND(3.8 + RAND() * 1.2, 2),
                ELT(
                    1 + FLOOR(RAND() * 3),
                    'Active', 'Inactive', 'OnRide'
                )
            );

        SET i = i + 1;
    END WHILE;

    -- Insert 100 Rides
    SET i = 1;

    WHILE i <= 100 DO
        INSERT INTO Rides
            (user_id, driver_id, pickup_location, dropoff_location,
             fare_amount, distance_km, ride_status, payment_method,
             ride_time)
        VALUES
            (
                1 + FLOOR(RAND() * 100),
                1 + FLOOR(RAND() * 100),
                CONCAT('Pickup Area ', 1 + FLOOR(RAND() * 20)),
                CONCAT('Drop Area ', 1 + FLOOR(RAND() * 20)),
                ROUND(50 + RAND() * 950, 2),
                ROUND(1 + RAND() * 30, 2),
                ELT(
                    1 + FLOOR(RAND() * 4),
                    'Completed', 'Cancelled', 'Ongoing', 'Requested'
                ),
                ELT(
                    1 + FLOOR(RAND() * 4),
                    'Cash', 'UPI', 'Card', 'Wallet'
                ),
                DATE_SUB(
                    NOW(),
                    INTERVAL FLOOR(RAND() * 365) DAY
                )
            );

        SET i = i + 1;
    END WHILE;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `vehicle_type` enum('UberGo','UberXL','UberPremier','UberAuto') NOT NULL,
  `license_plate` varchar(20) NOT NULL,
  `rating` decimal(3,2) DEFAULT 5.00,
  `status` enum('Active','Inactive','OnRide') DEFAULT 'Active',
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driver_id`, `first_name`, `last_name`, `email`, `phone`, `vehicle_type`, `license_plate`, `rating`, `status`, `joined_at`) VALUES
(1, 'DriverFirst1', 'DriverLast1', 'driver1@partner.com', '+919123400001', 'UberAuto', 'MH14AB0001', 4.32, 'Inactive', '2026-10-09 09:31:29'),
(2, 'DriverFirst2', 'DriverLast2', 'driver2@partner.com', '+919123400002', 'UberXL', 'MH03AB0002', 3.80, 'OnRide', '2026-10-09 09:31:29'),
(3, 'DriverFirst3', 'DriverLast3', 'driver3@partner.com', '+919123400003', 'UberXL', 'MH45AB0003', 4.57, 'Inactive', '2026-10-09 09:31:29'),
(4, 'DriverFirst4', 'DriverLast4', 'driver4@partner.com', '+919123400004', 'UberPremier', 'MH10AB0004', 4.28, 'Inactive', '2026-10-09 09:31:29'),
(5, 'DriverFirst5', 'DriverLast5', 'driver5@partner.com', '+919123400005', 'UberPremier', 'MH19AB0005', 4.69, 'Inactive', '2026-10-09 09:31:29'),
(6, 'DriverFirst6', 'DriverLast6', 'driver6@partner.com', '+919123400006', 'UberAuto', 'MH11AB0006', 4.59, 'Inactive', '2026-10-09 09:31:29'),
(7, 'DriverFirst7', 'DriverLast7', 'driver7@partner.com', '+919123400007', 'UberGo', 'MH11AB0007', 4.24, 'Active', '2026-10-09 09:31:29'),
(8, 'DriverFirst8', 'DriverLast8', 'driver8@partner.com', '+919123400008', 'UberGo', 'MH19AB0008', 4.80, 'Active', '2026-10-09 09:31:29'),
(9, 'DriverFirst9', 'DriverLast9', 'driver9@partner.com', '+919123400009', 'UberPremier', 'MH16AB0009', 4.41, 'Inactive', '2026-10-09 09:31:29'),
(10, 'DriverFirst10', 'DriverLast10', 'driver10@partner.com', '+919123400010', 'UberPremier', 'MH34AB0010', 4.92, 'Inactive', '2026-10-09 09:31:29'),
(11, 'DriverFirst11', 'DriverLast11', 'driver11@partner.com', '+919123400011', 'UberGo', 'MH15AB0011', 4.78, 'Active', '2026-10-09 09:31:29'),
(12, 'DriverFirst12', 'DriverLast12', 'driver12@partner.com', '+919123400012', 'UberPremier', 'MH01AB0012', 4.42, 'Inactive', '2026-10-09 09:31:29'),
(13, 'DriverFirst13', 'DriverLast13', 'driver13@partner.com', '+919123400013', 'UberGo', 'MH45AB0013', 4.14, 'OnRide', '2026-10-09 09:31:29'),
(14, 'DriverFirst14', 'DriverLast14', 'driver14@partner.com', '+919123400014', 'UberPremier', 'MH27AB0014', 4.02, 'Active', '2026-10-09 09:31:29'),
(15, 'DriverFirst15', 'DriverLast15', 'driver15@partner.com', '+919123400015', 'UberAuto', 'MH08AB0015', 4.31, 'Inactive', '2026-10-09 09:31:29'),
(16, 'DriverFirst16', 'DriverLast16', 'driver16@partner.com', '+919123400016', 'UberAuto', 'MH34AB0016', 4.62, 'Inactive', '2026-10-09 09:31:29'),
(17, 'DriverFirst17', 'DriverLast17', 'driver17@partner.com', '+919123400017', 'UberPremier', 'MH26AB0017', 4.31, 'Inactive', '2026-10-09 09:31:29'),
(18, 'DriverFirst18', 'DriverLast18', 'driver18@partner.com', '+919123400018', 'UberPremier', 'MH27AB0018', 4.64, 'OnRide', '2026-10-09 09:31:29'),
(19, 'DriverFirst19', 'DriverLast19', 'driver19@partner.com', '+919123400019', 'UberXL', 'MH47AB0019', 4.72, 'OnRide', '2026-10-09 09:31:29'),
(20, 'DriverFirst20', 'DriverLast20', 'driver20@partner.com', '+919123400020', 'UberPremier', 'MH11AB0020', 4.05, 'Inactive', '2026-10-09 09:31:29'),
(21, 'DriverFirst21', 'DriverLast21', 'driver21@partner.com', '+919123400021', 'UberGo', 'MH06AB0021', 4.75, 'Inactive', '2026-10-09 09:31:29'),
(22, 'DriverFirst22', 'DriverLast22', 'driver22@partner.com', '+919123400022', 'UberAuto', 'MH07AB0022', 4.12, 'OnRide', '2026-10-09 09:31:29'),
(23, 'DriverFirst23', 'DriverLast23', 'driver23@partner.com', '+919123400023', 'UberAuto', 'MH16AB0023', 3.92, 'Inactive', '2026-10-09 09:31:29'),
(24, 'DriverFirst24', 'DriverLast24', 'driver24@partner.com', '+919123400024', 'UberPremier', 'MH45AB0024', 4.96, 'Active', '2026-10-09 09:31:29'),
(25, 'DriverFirst25', 'DriverLast25', 'driver25@partner.com', '+919123400025', 'UberPremier', 'MH16AB0025', 4.27, 'OnRide', '2026-10-09 09:31:29'),
(26, 'DriverFirst26', 'DriverLast26', 'driver26@partner.com', '+919123400026', 'UberPremier', 'MH32AB0026', 3.83, 'Active', '2026-10-09 09:31:29'),
(27, 'DriverFirst27', 'DriverLast27', 'driver27@partner.com', '+919123400027', 'UberGo', 'MH45AB0027', 3.95, 'OnRide', '2026-10-09 09:31:29'),
(28, 'DriverFirst28', 'DriverLast28', 'driver28@partner.com', '+919123400028', 'UberXL', 'MH27AB0028', 4.84, 'OnRide', '2026-10-09 09:31:29'),
(29, 'DriverFirst29', 'DriverLast29', 'driver29@partner.com', '+919123400029', 'UberGo', 'MH10AB0029', 4.65, 'OnRide', '2026-10-09 09:31:29'),
(30, 'DriverFirst30', 'DriverLast30', 'driver30@partner.com', '+919123400030', 'UberPremier', 'MH39AB0030', 4.67, 'Active', '2026-10-09 09:31:29'),
(31, 'DriverFirst31', 'DriverLast31', 'driver31@partner.com', '+919123400031', 'UberGo', 'MH21AB0031', 3.85, 'OnRide', '2026-10-09 09:31:29'),
(32, 'DriverFirst32', 'DriverLast32', 'driver32@partner.com', '+919123400032', 'UberXL', 'MH31AB0032', 4.60, 'Inactive', '2026-10-09 09:31:29'),
(33, 'DriverFirst33', 'DriverLast33', 'driver33@partner.com', '+919123400033', 'UberXL', 'MH27AB0033', 4.46, 'Active', '2026-10-09 09:31:29'),
(34, 'DriverFirst34', 'DriverLast34', 'driver34@partner.com', '+919123400034', 'UberAuto', 'MH42AB0034', 4.72, 'Active', '2026-10-09 09:31:29'),
(35, 'DriverFirst35', 'DriverLast35', 'driver35@partner.com', '+919123400035', 'UberGo', 'MH30AB0035', 4.74, 'Active', '2026-10-09 09:31:29'),
(36, 'DriverFirst36', 'DriverLast36', 'driver36@partner.com', '+919123400036', 'UberGo', 'MH26AB0036', 3.89, 'OnRide', '2026-10-09 09:31:29'),
(37, 'DriverFirst37', 'DriverLast37', 'driver37@partner.com', '+919123400037', 'UberAuto', 'MH10AB0037', 3.98, 'Active', '2026-10-09 09:31:29'),
(38, 'DriverFirst38', 'DriverLast38', 'driver38@partner.com', '+919123400038', 'UberXL', 'MH12AB0038', 3.98, 'Active', '2026-10-09 09:31:29'),
(39, 'DriverFirst39', 'DriverLast39', 'driver39@partner.com', '+919123400039', 'UberAuto', 'MH46AB0039', 3.98, 'OnRide', '2026-10-09 09:31:29'),
(40, 'DriverFirst40', 'DriverLast40', 'driver40@partner.com', '+919123400040', 'UberXL', 'MH16AB0040', 4.13, 'Inactive', '2026-10-09 09:31:29'),
(41, 'DriverFirst41', 'DriverLast41', 'driver41@partner.com', '+919123400041', 'UberGo', 'MH13AB0041', 3.82, 'Inactive', '2026-10-09 09:31:29'),
(42, 'DriverFirst42', 'DriverLast42', 'driver42@partner.com', '+919123400042', 'UberPremier', 'MH21AB0042', 4.98, 'OnRide', '2026-10-09 09:31:29'),
(43, 'DriverFirst43', 'DriverLast43', 'driver43@partner.com', '+919123400043', 'UberXL', 'MH48AB0043', 4.59, 'Inactive', '2026-10-09 09:31:29'),
(44, 'DriverFirst44', 'DriverLast44', 'driver44@partner.com', '+919123400044', 'UberGo', 'MH44AB0044', 4.29, 'Inactive', '2026-10-09 09:31:29'),
(45, 'DriverFirst45', 'DriverLast45', 'driver45@partner.com', '+919123400045', 'UberPremier', 'MH07AB0045', 4.67, 'Active', '2026-10-09 09:31:29'),
(46, 'DriverFirst46', 'DriverLast46', 'driver46@partner.com', '+919123400046', 'UberAuto', 'MH36AB0046', 3.83, 'OnRide', '2026-10-09 09:31:29'),
(47, 'DriverFirst47', 'DriverLast47', 'driver47@partner.com', '+919123400047', 'UberPremier', 'MH06AB0047', 4.75, 'Inactive', '2026-10-09 09:31:29'),
(48, 'DriverFirst48', 'DriverLast48', 'driver48@partner.com', '+919123400048', 'UberAuto', 'MH12AB0048', 4.61, 'OnRide', '2026-10-09 09:31:29'),
(49, 'DriverFirst49', 'DriverLast49', 'driver49@partner.com', '+919123400049', 'UberXL', 'MH48AB0049', 4.57, 'Active', '2026-10-09 09:31:29'),
(50, 'DriverFirst50', 'DriverLast50', 'driver50@partner.com', '+919123400050', 'UberXL', 'MH23AB0050', 4.92, 'Active', '2026-10-09 09:31:29'),
(51, 'DriverFirst51', 'DriverLast51', 'driver51@partner.com', '+919123400051', 'UberPremier', 'MH05AB0051', 4.69, 'Inactive', '2026-10-09 09:31:29'),
(52, 'DriverFirst52', 'DriverLast52', 'driver52@partner.com', '+919123400052', 'UberPremier', 'MH28AB0052', 4.48, 'Active', '2026-10-09 09:31:29'),
(53, 'DriverFirst53', 'DriverLast53', 'driver53@partner.com', '+919123400053', 'UberGo', 'MH04AB0053', 4.97, 'OnRide', '2026-10-09 09:31:29'),
(54, 'DriverFirst54', 'DriverLast54', 'driver54@partner.com', '+919123400054', 'UberPremier', 'MH40AB0054', 4.17, 'Active', '2026-10-09 09:31:29'),
(55, 'DriverFirst55', 'DriverLast55', 'driver55@partner.com', '+919123400055', 'UberPremier', 'MH33AB0055', 4.43, 'Inactive', '2026-10-09 09:31:29'),
(56, 'DriverFirst56', 'DriverLast56', 'driver56@partner.com', '+919123400056', 'UberPremier', 'MH26AB0056', 4.38, 'OnRide', '2026-10-09 09:31:29'),
(57, 'DriverFirst57', 'DriverLast57', 'driver57@partner.com', '+919123400057', 'UberAuto', 'MH12AB0057', 4.08, 'Inactive', '2026-10-09 09:31:29'),
(58, 'DriverFirst58', 'DriverLast58', 'driver58@partner.com', '+919123400058', 'UberPremier', 'MH24AB0058', 4.64, 'Active', '2026-10-09 09:31:29'),
(59, 'DriverFirst59', 'DriverLast59', 'driver59@partner.com', '+919123400059', 'UberGo', 'MH26AB0059', 4.08, 'Inactive', '2026-10-09 09:31:29'),
(60, 'DriverFirst60', 'DriverLast60', 'driver60@partner.com', '+919123400060', 'UberXL', 'MH24AB0060', 4.59, 'OnRide', '2026-10-09 09:31:29'),
(61, 'DriverFirst61', 'DriverLast61', 'driver61@partner.com', '+919123400061', 'UberGo', 'MH32AB0061', 4.39, 'Inactive', '2026-10-09 09:31:29'),
(62, 'DriverFirst62', 'DriverLast62', 'driver62@partner.com', '+919123400062', 'UberGo', 'MH16AB0062', 3.86, 'Active', '2026-10-09 09:31:29'),
(63, 'DriverFirst63', 'DriverLast63', 'driver63@partner.com', '+919123400063', 'UberXL', 'MH25AB0063', 4.61, 'OnRide', '2026-10-09 09:31:29'),
(64, 'DriverFirst64', 'DriverLast64', 'driver64@partner.com', '+919123400064', 'UberXL', 'MH09AB0064', 4.75, 'Inactive', '2026-10-09 09:31:29'),
(65, 'DriverFirst65', 'DriverLast65', 'driver65@partner.com', '+919123400065', 'UberAuto', 'MH30AB0065', 4.60, 'Inactive', '2026-10-09 09:31:29'),
(66, 'DriverFirst66', 'DriverLast66', 'driver66@partner.com', '+919123400066', 'UberPremier', 'MH24AB0066', 4.53, 'Inactive', '2026-10-09 09:31:29'),
(67, 'DriverFirst67', 'DriverLast67', 'driver67@partner.com', '+919123400067', 'UberAuto', 'MH16AB0067', 4.44, 'OnRide', '2026-10-09 09:31:29'),
(68, 'DriverFirst68', 'DriverLast68', 'driver68@partner.com', '+919123400068', 'UberGo', 'MH31AB0068', 4.47, 'OnRide', '2026-10-09 09:31:29'),
(69, 'DriverFirst69', 'DriverLast69', 'driver69@partner.com', '+919123400069', 'UberAuto', 'MH47AB0069', 4.87, 'Inactive', '2026-10-09 09:31:29'),
(70, 'DriverFirst70', 'DriverLast70', 'driver70@partner.com', '+919123400070', 'UberPremier', 'MH37AB0070', 3.94, 'Inactive', '2026-10-09 09:31:29'),
(71, 'DriverFirst71', 'DriverLast71', 'driver71@partner.com', '+919123400071', 'UberXL', 'MH11AB0071', 4.59, 'OnRide', '2026-10-09 09:31:29'),
(72, 'DriverFirst72', 'DriverLast72', 'driver72@partner.com', '+919123400072', 'UberXL', 'MH06AB0072', 4.11, 'OnRide', '2026-10-09 09:31:29'),
(73, 'DriverFirst73', 'DriverLast73', 'driver73@partner.com', '+919123400073', 'UberGo', 'MH09AB0073', 4.82, 'OnRide', '2026-10-09 09:31:29'),
(74, 'DriverFirst74', 'DriverLast74', 'driver74@partner.com', '+919123400074', 'UberGo', 'MH01AB0074', 4.95, 'OnRide', '2026-10-09 09:31:29'),
(75, 'DriverFirst75', 'DriverLast75', 'driver75@partner.com', '+919123400075', 'UberAuto', 'MH04AB0075', 4.78, 'OnRide', '2026-10-09 09:31:29'),
(76, 'DriverFirst76', 'DriverLast76', 'driver76@partner.com', '+919123400076', 'UberPremier', 'MH47AB0076', 4.63, 'Inactive', '2026-10-09 09:31:29'),
(77, 'DriverFirst77', 'DriverLast77', 'driver77@partner.com', '+919123400077', 'UberGo', 'MH08AB0077', 4.76, 'Inactive', '2026-10-09 09:31:29'),
(78, 'DriverFirst78', 'DriverLast78', 'driver78@partner.com', '+919123400078', 'UberGo', 'MH14AB0078', 4.83, 'Inactive', '2026-10-09 09:31:29'),
(79, 'DriverFirst79', 'DriverLast79', 'driver79@partner.com', '+919123400079', 'UberAuto', 'MH34AB0079', 4.92, 'Inactive', '2026-10-09 09:31:29'),
(80, 'DriverFirst80', 'DriverLast80', 'driver80@partner.com', '+919123400080', 'UberGo', 'MH21AB0080', 4.24, 'Inactive', '2026-10-09 09:31:29'),
(81, 'DriverFirst81', 'DriverLast81', 'driver81@partner.com', '+919123400081', 'UberAuto', 'MH13AB0081', 4.84, 'Inactive', '2026-10-09 09:31:29'),
(82, 'DriverFirst82', 'DriverLast82', 'driver82@partner.com', '+919123400082', 'UberGo', 'MH14AB0082', 4.81, 'Inactive', '2026-10-09 09:31:29'),
(83, 'DriverFirst83', 'DriverLast83', 'driver83@partner.com', '+919123400083', 'UberXL', 'MH17AB0083', 4.83, 'Active', '2026-10-09 09:31:29'),
(84, 'DriverFirst84', 'DriverLast84', 'driver84@partner.com', '+919123400084', 'UberAuto', 'MH10AB0084', 4.46, 'Active', '2026-10-09 09:31:29'),
(85, 'DriverFirst85', 'DriverLast85', 'driver85@partner.com', '+919123400085', 'UberGo', 'MH11AB0085', 4.64, 'OnRide', '2026-10-09 09:31:29'),
(86, 'DriverFirst86', 'DriverLast86', 'driver86@partner.com', '+919123400086', 'UberGo', 'MH49AB0086', 4.54, 'Active', '2026-10-09 09:31:29'),
(87, 'DriverFirst87', 'DriverLast87', 'driver87@partner.com', '+919123400087', 'UberAuto', 'MH28AB0087', 4.33, 'Inactive', '2026-10-09 09:31:29'),
(88, 'DriverFirst88', 'DriverLast88', 'driver88@partner.com', '+919123400088', 'UberXL', 'MH49AB0088', 3.82, 'Active', '2026-10-09 09:31:29'),
(89, 'DriverFirst89', 'DriverLast89', 'driver89@partner.com', '+919123400089', 'UberPremier', 'MH18AB0089', 4.00, 'OnRide', '2026-10-09 09:31:29'),
(90, 'DriverFirst90', 'DriverLast90', 'driver90@partner.com', '+919123400090', 'UberXL', 'MH19AB0090', 4.83, 'Active', '2026-10-09 09:31:29'),
(91, 'DriverFirst91', 'DriverLast91', 'driver91@partner.com', '+919123400091', 'UberXL', 'MH04AB0091', 4.32, 'OnRide', '2026-10-09 09:31:29'),
(92, 'DriverFirst92', 'DriverLast92', 'driver92@partner.com', '+919123400092', 'UberXL', 'MH31AB0092', 4.18, 'OnRide', '2026-10-09 09:31:29'),
(93, 'DriverFirst93', 'DriverLast93', 'driver93@partner.com', '+919123400093', 'UberPremier', 'MH38AB0093', 3.91, 'Active', '2026-10-09 09:31:29'),
(94, 'DriverFirst94', 'DriverLast94', 'driver94@partner.com', '+919123400094', 'UberPremier', 'MH11AB0094', 4.33, 'Inactive', '2026-10-09 09:31:29'),
(95, 'DriverFirst95', 'DriverLast95', 'driver95@partner.com', '+919123400095', 'UberXL', 'MH36AB0095', 3.96, 'Inactive', '2026-10-09 09:31:29'),
(96, 'DriverFirst96', 'DriverLast96', 'driver96@partner.com', '+919123400096', 'UberXL', 'MH45AB0096', 4.52, 'Active', '2026-10-09 09:31:29'),
(97, 'DriverFirst97', 'DriverLast97', 'driver97@partner.com', '+919123400097', 'UberPremier', 'MH14AB0097', 4.40, 'Inactive', '2026-10-09 09:31:29'),
(98, 'DriverFirst98', 'DriverLast98', 'driver98@partner.com', '+919123400098', 'UberAuto', 'MH02AB0098', 4.67, 'Inactive', '2026-10-09 09:31:29'),
(99, 'DriverFirst99', 'DriverLast99', 'driver99@partner.com', '+919123400099', 'UberPremier', 'MH06AB0099', 4.93, 'Inactive', '2026-10-09 09:31:29'),
(100, 'DriverFirst100', 'DriverLast100', 'driver100@partner.com', '+919123400100', 'UberGo', 'MH45AB0100', 4.46, 'Active', '2026-10-09 09:31:29');

-- --------------------------------------------------------

--
-- Table structure for table `rides`
--

CREATE TABLE `rides` (
  `ride_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `pickup_location` varchar(100) NOT NULL,
  `dropoff_location` varchar(100) NOT NULL,
  `fare_amount` decimal(10,2) NOT NULL,
  `distance_km` decimal(5,2) NOT NULL,
  `ride_status` enum('Completed','Cancelled','InTransit') NOT NULL,
  `payment_method` enum('Card','Cash','UPI','Wallet') NOT NULL,
  `ride_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rides`
--

INSERT INTO `rides` (`ride_id`, `user_id`, `driver_id`, `pickup_location`, `dropoff_location`, `fare_amount`, `distance_km`, `ride_status`, `payment_method`, `ride_time`) VALUES
(1, 45, 18, 'Pickup Area 11', 'Drop Area 4', 355.57, 2.04, 'Completed', 'Wallet', '2026-09-17 15:01:29'),
(2, 50, 29, 'Pickup Area 20', 'Drop Area 18', 632.31, 12.59, 'Completed', 'UPI', '2026-07-15 15:01:29'),
(3, 28, 67, 'Pickup Area 11', 'Drop Area 12', 317.36, 22.40, '', 'UPI', '2026-07-29 15:01:29'),
(4, 57, 25, 'Pickup Area 11', 'Drop Area 19', 946.40, 30.98, 'Completed', 'Wallet', '2026-02-10 15:01:29'),
(5, 81, 6, 'Pickup Area 18', 'Drop Area 4', 225.88, 14.67, '', 'Cash', '2026-09-19 15:01:29'),
(6, 55, 57, 'Pickup Area 4', 'Drop Area 6', 782.36, 2.26, '', 'UPI', '2026-09-02 15:01:29'),
(7, 44, 88, 'Pickup Area 2', 'Drop Area 15', 357.16, 16.12, '', 'Cash', '2026-03-25 15:01:29'),
(8, 100, 37, 'Pickup Area 17', 'Drop Area 3', 997.92, 21.26, 'Cancelled', 'Wallet', '2026-06-26 15:01:29'),
(9, 79, 5, 'Pickup Area 18', 'Drop Area 7', 60.63, 1.99, 'Completed', 'Card', '2026-05-23 15:01:29'),
(10, 26, 11, 'Pickup Area 16', 'Drop Area 12', 490.62, 20.38, '', 'UPI', '2026-01-10 15:01:29'),
(11, 98, 65, 'Pickup Area 7', 'Drop Area 13', 130.32, 19.43, '', 'UPI', '2025-12-23 15:01:29'),
(12, 23, 75, 'Pickup Area 1', 'Drop Area 20', 730.75, 21.46, 'Cancelled', 'UPI', '2026-04-14 15:01:29'),
(13, 69, 95, 'Pickup Area 14', 'Drop Area 11', 679.92, 22.15, '', 'Card', '2026-07-29 15:01:29'),
(14, 31, 96, 'Pickup Area 17', 'Drop Area 6', 944.50, 26.60, 'Cancelled', 'Card', '2025-11-07 15:01:29'),
(15, 67, 54, 'Pickup Area 15', 'Drop Area 19', 487.92, 17.75, 'Cancelled', 'UPI', '2026-03-03 15:01:29'),
(16, 93, 80, 'Pickup Area 5', 'Drop Area 15', 93.91, 30.75, '', 'Cash', '2026-08-09 15:01:29'),
(17, 47, 84, 'Pickup Area 16', 'Drop Area 8', 542.66, 15.56, '', 'Wallet', '2025-11-19 15:01:29'),
(18, 75, 8, 'Pickup Area 3', 'Drop Area 7', 387.45, 23.95, '', 'UPI', '2026-07-20 15:01:29'),
(19, 62, 40, 'Pickup Area 3', 'Drop Area 9', 760.54, 15.33, 'Completed', 'UPI', '2026-10-02 15:01:29'),
(20, 24, 11, 'Pickup Area 17', 'Drop Area 17', 574.57, 11.39, 'Completed', 'UPI', '2026-04-30 15:01:29'),
(21, 23, 81, 'Pickup Area 7', 'Drop Area 6', 313.09, 19.56, 'Cancelled', 'UPI', '2026-04-12 15:01:29'),
(22, 10, 2, 'Pickup Area 16', 'Drop Area 19', 219.27, 5.67, 'Completed', 'Card', '2026-10-03 15:01:29'),
(23, 84, 14, 'Pickup Area 3', 'Drop Area 7', 326.42, 13.40, 'Completed', 'Card', '2026-09-21 15:01:29'),
(24, 8, 25, 'Pickup Area 20', 'Drop Area 4', 964.74, 9.00, 'Cancelled', 'UPI', '2025-12-25 15:01:29'),
(25, 69, 4, 'Pickup Area 3', 'Drop Area 12', 496.62, 19.63, '', 'Card', '2025-10-18 15:01:29'),
(26, 5, 31, 'Pickup Area 8', 'Drop Area 20', 665.25, 12.40, '', 'Card', '2026-05-28 15:01:29'),
(27, 90, 39, 'Pickup Area 5', 'Drop Area 19', 55.57, 8.17, 'Completed', 'Cash', '2026-06-13 15:01:29'),
(28, 11, 58, 'Pickup Area 11', 'Drop Area 20', 234.55, 3.71, '', 'Cash', '2026-01-04 15:01:29'),
(29, 60, 68, 'Pickup Area 12', 'Drop Area 20', 106.84, 12.51, '', 'Card', '2026-04-12 15:01:29'),
(30, 85, 77, 'Pickup Area 6', 'Drop Area 20', 213.62, 28.05, '', 'UPI', '2026-06-23 15:01:29'),
(31, 73, 72, 'Pickup Area 9', 'Drop Area 20', 546.64, 23.22, 'Completed', 'UPI', '2025-12-03 15:01:29'),
(32, 90, 94, 'Pickup Area 20', 'Drop Area 4', 794.50, 14.85, '', 'UPI', '2026-08-26 15:01:29'),
(33, 42, 72, 'Pickup Area 7', 'Drop Area 10', 485.38, 25.86, '', 'UPI', '2026-04-24 15:01:29'),
(34, 25, 86, 'Pickup Area 11', 'Drop Area 4', 238.61, 15.54, '', 'Card', '2025-10-27 15:01:29'),
(35, 70, 64, 'Pickup Area 2', 'Drop Area 10', 140.02, 3.60, 'Completed', 'UPI', '2025-10-19 15:01:29'),
(36, 43, 19, 'Pickup Area 13', 'Drop Area 14', 420.44, 29.86, '', 'UPI', '2026-02-15 15:01:29'),
(37, 30, 54, 'Pickup Area 17', 'Drop Area 9', 723.13, 8.83, 'Completed', 'Cash', '2026-09-26 15:01:29'),
(38, 85, 10, 'Pickup Area 19', 'Drop Area 10', 491.40, 29.07, 'Cancelled', 'Card', '2026-07-24 15:01:29'),
(39, 23, 49, 'Pickup Area 16', 'Drop Area 8', 568.03, 19.56, 'Cancelled', 'UPI', '2025-12-31 15:01:29'),
(40, 59, 61, 'Pickup Area 6', 'Drop Area 12', 154.14, 24.15, '', 'UPI', '2026-09-09 15:01:29'),
(41, 41, 80, 'Pickup Area 15', 'Drop Area 7', 394.31, 26.96, 'Completed', 'Card', '2026-06-28 15:01:29'),
(42, 62, 22, 'Pickup Area 6', 'Drop Area 13', 367.97, 25.38, 'Completed', 'Wallet', '2026-08-30 15:01:29'),
(43, 99, 58, 'Pickup Area 19', 'Drop Area 19', 787.03, 5.36, 'Cancelled', 'Card', '2026-02-26 15:01:29'),
(44, 40, 12, 'Pickup Area 8', 'Drop Area 13', 917.71, 22.40, '', 'Wallet', '2026-04-18 15:01:29'),
(45, 43, 67, 'Pickup Area 2', 'Drop Area 9', 788.43, 21.14, 'Completed', 'Cash', '2026-04-19 15:01:29'),
(46, 6, 84, 'Pickup Area 20', 'Drop Area 11', 544.66, 3.76, '', 'Cash', '2026-05-27 15:01:29'),
(47, 23, 99, 'Pickup Area 6', 'Drop Area 8', 121.40, 8.55, 'Completed', 'UPI', '2025-10-30 15:01:29'),
(48, 50, 63, 'Pickup Area 14', 'Drop Area 9', 255.11, 23.58, 'Completed', 'UPI', '2026-07-14 15:01:29'),
(49, 26, 55, 'Pickup Area 19', 'Drop Area 3', 706.09, 5.11, '', 'Card', '2026-05-08 15:01:29'),
(50, 16, 51, 'Pickup Area 2', 'Drop Area 16', 769.46, 13.72, '', 'Wallet', '2026-06-28 15:01:29'),
(51, 52, 74, 'Pickup Area 3', 'Drop Area 11', 170.51, 3.83, 'Completed', 'Cash', '2026-03-04 15:01:29'),
(52, 49, 63, 'Pickup Area 14', 'Drop Area 9', 180.83, 13.61, '', 'Cash', '2025-12-04 15:01:29'),
(53, 70, 92, 'Pickup Area 10', 'Drop Area 15', 245.75, 25.39, 'Cancelled', 'Wallet', '2026-02-16 15:01:29'),
(54, 84, 25, 'Pickup Area 15', 'Drop Area 18', 320.67, 23.33, '', 'Cash', '2025-11-09 15:01:29'),
(55, 28, 63, 'Pickup Area 7', 'Drop Area 13', 309.21, 14.66, 'Cancelled', 'Wallet', '2026-07-09 15:01:29'),
(56, 49, 69, 'Pickup Area 20', 'Drop Area 17', 213.99, 12.97, 'Cancelled', 'Cash', '2026-04-03 15:01:29'),
(57, 3, 59, 'Pickup Area 17', 'Drop Area 9', 580.25, 17.72, 'Completed', 'Wallet', '2026-08-29 15:01:29'),
(58, 90, 16, 'Pickup Area 2', 'Drop Area 18', 170.84, 2.33, '', 'Cash', '2025-12-10 15:01:29'),
(59, 95, 23, 'Pickup Area 6', 'Drop Area 15', 897.96, 7.53, 'Cancelled', 'UPI', '2026-01-04 15:01:29'),
(60, 63, 82, 'Pickup Area 4', 'Drop Area 12', 243.87, 11.17, 'Completed', 'UPI', '2026-01-13 15:01:29'),
(61, 50, 27, 'Pickup Area 18', 'Drop Area 9', 709.13, 4.66, '', 'UPI', '2025-12-22 15:01:29'),
(62, 17, 41, 'Pickup Area 12', 'Drop Area 12', 310.62, 18.74, 'Completed', 'Wallet', '2026-09-14 15:01:29'),
(63, 68, 15, 'Pickup Area 15', 'Drop Area 3', 577.04, 11.57, 'Completed', 'UPI', '2025-11-27 15:01:29'),
(64, 4, 59, 'Pickup Area 17', 'Drop Area 6', 991.23, 4.24, '', 'Card', '2025-11-25 15:01:29'),
(65, 82, 48, 'Pickup Area 19', 'Drop Area 4', 214.28, 9.96, '', 'Wallet', '2025-10-19 15:01:29'),
(66, 93, 72, 'Pickup Area 16', 'Drop Area 16', 480.25, 30.75, '', 'Cash', '2026-06-12 15:01:29'),
(67, 57, 84, 'Pickup Area 10', 'Drop Area 20', 385.58, 26.81, 'Completed', 'Card', '2026-05-09 15:01:29'),
(68, 22, 82, 'Pickup Area 9', 'Drop Area 14', 221.64, 25.77, '', 'UPI', '2026-03-31 15:01:29'),
(69, 26, 72, 'Pickup Area 17', 'Drop Area 18', 886.97, 26.07, '', 'Cash', '2026-07-19 15:01:29'),
(70, 64, 49, 'Pickup Area 11', 'Drop Area 4', 399.57, 8.97, 'Completed', 'UPI', '2025-10-25 15:01:29'),
(71, 81, 15, 'Pickup Area 7', 'Drop Area 5', 112.63, 21.81, 'Cancelled', 'UPI', '2026-03-29 15:01:29'),
(72, 86, 69, 'Pickup Area 18', 'Drop Area 5', 654.46, 14.53, 'Cancelled', 'UPI', '2025-11-30 15:01:29'),
(73, 16, 21, 'Pickup Area 12', 'Drop Area 4', 170.00, 5.73, 'Cancelled', 'Card', '2026-02-13 15:01:29'),
(74, 55, 75, 'Pickup Area 2', 'Drop Area 5', 944.82, 30.17, 'Completed', 'UPI', '2026-07-22 15:01:29'),
(75, 30, 82, 'Pickup Area 4', 'Drop Area 11', 948.87, 7.70, 'Cancelled', 'Card', '2026-01-07 15:01:29'),
(76, 63, 86, 'Pickup Area 8', 'Drop Area 8', 817.97, 26.62, '', 'Card', '2026-01-02 15:01:29'),
(77, 86, 99, 'Pickup Area 8', 'Drop Area 18', 306.01, 22.69, '', 'Wallet', '2025-11-15 15:01:29'),
(78, 92, 87, 'Pickup Area 12', 'Drop Area 6', 597.21, 4.36, '', 'Wallet', '2026-02-24 15:01:29'),
(79, 65, 34, 'Pickup Area 16', 'Drop Area 17', 747.28, 8.67, 'Completed', 'Card', '2025-12-04 15:01:29'),
(80, 40, 42, 'Pickup Area 18', 'Drop Area 4', 285.71, 22.11, '', 'Wallet', '2026-04-21 15:01:29'),
(81, 8, 97, 'Pickup Area 12', 'Drop Area 1', 498.75, 7.69, '', 'Wallet', '2026-10-06 15:01:29'),
(82, 59, 91, 'Pickup Area 16', 'Drop Area 2', 228.30, 20.65, '', 'Card', '2025-12-04 15:01:29'),
(83, 46, 73, 'Pickup Area 5', 'Drop Area 1', 524.52, 11.91, 'Cancelled', 'Card', '2026-03-08 15:01:29'),
(84, 43, 35, 'Pickup Area 9', 'Drop Area 5', 740.33, 30.66, '', 'Wallet', '2025-10-25 15:01:29'),
(85, 25, 35, 'Pickup Area 20', 'Drop Area 18', 499.65, 22.43, 'Completed', 'Card', '2026-02-26 15:01:29'),
(86, 25, 36, 'Pickup Area 2', 'Drop Area 5', 867.63, 21.68, '', 'UPI', '2026-02-06 15:01:29'),
(87, 61, 2, 'Pickup Area 5', 'Drop Area 4', 230.58, 12.88, 'Cancelled', 'Wallet', '2026-09-13 15:01:29'),
(88, 79, 72, 'Pickup Area 5', 'Drop Area 18', 736.52, 1.58, '', 'Card', '2026-08-14 15:01:29'),
(89, 2, 60, 'Pickup Area 19', 'Drop Area 17', 376.64, 8.80, 'Cancelled', 'Card', '2026-10-06 15:01:29'),
(90, 36, 77, 'Pickup Area 15', 'Drop Area 8', 797.10, 22.99, 'Cancelled', 'UPI', '2026-01-15 15:01:29'),
(91, 68, 17, 'Pickup Area 17', 'Drop Area 12', 521.69, 22.33, 'Completed', 'Cash', '2025-12-28 15:01:29'),
(92, 33, 30, 'Pickup Area 10', 'Drop Area 11', 201.49, 8.13, '', 'Wallet', '2026-09-15 15:01:29'),
(93, 82, 89, 'Pickup Area 20', 'Drop Area 4', 993.90, 14.01, 'Completed', 'Card', '2026-02-27 15:01:29'),
(94, 18, 2, 'Pickup Area 12', 'Drop Area 15', 910.98, 12.92, 'Cancelled', 'Cash', '2025-11-07 15:01:29'),
(95, 18, 10, 'Pickup Area 20', 'Drop Area 11', 731.00, 1.72, '', 'Wallet', '2025-10-20 15:01:29'),
(96, 53, 73, 'Pickup Area 1', 'Drop Area 20', 836.54, 6.66, 'Cancelled', 'Card', '2026-06-25 15:01:29'),
(97, 26, 42, 'Pickup Area 7', 'Drop Area 7', 642.47, 6.39, 'Completed', 'Card', '2025-11-10 15:01:29'),
(98, 78, 14, 'Pickup Area 7', 'Drop Area 6', 411.06, 3.10, 'Completed', 'Wallet', '2026-03-19 15:01:29'),
(99, 29, 76, 'Pickup Area 19', 'Drop Area 6', 635.84, 9.53, '', 'Cash', '2026-06-18 15:01:29'),
(100, 54, 75, 'Pickup Area 3', 'Drop Area 9', 746.19, 12.47, '', 'UPI', '2025-10-22 15:01:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `rating` decimal(3,2) DEFAULT 5.00,
  `city` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `phone`, `rating`, `city`, `created_at`) VALUES
(1, 'UserFirst1', 'UserLast1', 'user1@example.com', '+919876500001', 4.09, 'Bangalore', '2026-10-09 09:31:28'),
(2, 'UserFirst2', 'UserLast2', 'user2@example.com', '+919876500002', 4.90, 'Bangalore', '2026-10-09 09:31:28'),
(3, 'UserFirst3', 'UserLast3', 'user3@example.com', '+919876500003', 3.88, 'Mumbai', '2026-10-09 09:31:28'),
(4, 'UserFirst4', 'UserLast4', 'user4@example.com', '+919876500004', 4.15, 'Mumbai', '2026-10-09 09:31:28'),
(5, 'UserFirst5', 'UserLast5', 'user5@example.com', '+919876500005', 4.90, 'Bangalore', '2026-10-09 09:31:28'),
(6, 'UserFirst6', 'UserLast6', 'user6@example.com', '+919876500006', 4.75, 'Bangalore', '2026-10-09 09:31:28'),
(7, 'UserFirst7', 'UserLast7', 'user7@example.com', '+919876500007', 4.18, 'Bangalore', '2026-10-09 09:31:28'),
(8, 'UserFirst8', 'UserLast8', 'user8@example.com', '+919876500008', 3.60, 'Hyderabad', '2026-10-09 09:31:28'),
(9, 'UserFirst9', 'UserLast9', 'user9@example.com', '+919876500009', 3.76, 'Delhi', '2026-10-09 09:31:28'),
(10, 'UserFirst10', 'UserLast10', 'user10@example.com', '+919876500010', 4.55, 'Pune', '2026-10-09 09:31:28'),
(11, 'UserFirst11', 'UserLast11', 'user11@example.com', '+919876500011', 4.70, 'Pune', '2026-10-09 09:31:28'),
(12, 'UserFirst12', 'UserLast12', 'user12@example.com', '+919876500012', 4.85, 'Bangalore', '2026-10-09 09:31:28'),
(13, 'UserFirst13', 'UserLast13', 'user13@example.com', '+919876500013', 4.83, 'Hyderabad', '2026-10-09 09:31:28'),
(14, 'UserFirst14', 'UserLast14', 'user14@example.com', '+919876500014', 4.60, 'Mumbai', '2026-10-09 09:31:28'),
(15, 'UserFirst15', 'UserLast15', 'user15@example.com', '+919876500015', 4.85, 'Bangalore', '2026-10-09 09:31:28'),
(16, 'UserFirst16', 'UserLast16', 'user16@example.com', '+919876500016', 4.25, 'Mumbai', '2026-10-09 09:31:28'),
(17, 'UserFirst17', 'UserLast17', 'user17@example.com', '+919876500017', 4.18, 'Pune', '2026-10-09 09:31:28'),
(18, 'UserFirst18', 'UserLast18', 'user18@example.com', '+919876500018', 3.58, 'Delhi', '2026-10-09 09:31:28'),
(19, 'UserFirst19', 'UserLast19', 'user19@example.com', '+919876500019', 4.97, 'Delhi', '2026-10-09 09:31:28'),
(20, 'UserFirst20', 'UserLast20', 'user20@example.com', '+919876500020', 3.75, 'Mumbai', '2026-10-09 09:31:28'),
(21, 'UserFirst21', 'UserLast21', 'user21@example.com', '+919876500021', 4.01, 'Mumbai', '2026-10-09 09:31:28'),
(22, 'UserFirst22', 'UserLast22', 'user22@example.com', '+919876500022', 4.85, 'Hyderabad', '2026-10-09 09:31:28'),
(23, 'UserFirst23', 'UserLast23', 'user23@example.com', '+919876500023', 3.65, 'Pune', '2026-10-09 09:31:28'),
(24, 'UserFirst24', 'UserLast24', 'user24@example.com', '+919876500024', 4.69, 'Mumbai', '2026-10-09 09:31:28'),
(25, 'UserFirst25', 'UserLast25', 'user25@example.com', '+919876500025', 3.69, 'Delhi', '2026-10-09 09:31:28'),
(26, 'UserFirst26', 'UserLast26', 'user26@example.com', '+919876500026', 3.99, 'Bangalore', '2026-10-09 09:31:28'),
(27, 'UserFirst27', 'UserLast27', 'user27@example.com', '+919876500027', 4.98, 'Mumbai', '2026-10-09 09:31:28'),
(28, 'UserFirst28', 'UserLast28', 'user28@example.com', '+919876500028', 4.78, 'Pune', '2026-10-09 09:31:28'),
(29, 'UserFirst29', 'UserLast29', 'user29@example.com', '+919876500029', 4.08, 'Bangalore', '2026-10-09 09:31:28'),
(30, 'UserFirst30', 'UserLast30', 'user30@example.com', '+919876500030', 4.40, 'Delhi', '2026-10-09 09:31:28'),
(31, 'UserFirst31', 'UserLast31', 'user31@example.com', '+919876500031', 4.86, 'Bangalore', '2026-10-09 09:31:28'),
(32, 'UserFirst32', 'UserLast32', 'user32@example.com', '+919876500032', 4.78, 'Pune', '2026-10-09 09:31:28'),
(33, 'UserFirst33', 'UserLast33', 'user33@example.com', '+919876500033', 3.62, 'Delhi', '2026-10-09 09:31:28'),
(34, 'UserFirst34', 'UserLast34', 'user34@example.com', '+919876500034', 4.76, 'Bangalore', '2026-10-09 09:31:28'),
(35, 'UserFirst35', 'UserLast35', 'user35@example.com', '+919876500035', 3.86, 'Bangalore', '2026-10-09 09:31:28'),
(36, 'UserFirst36', 'UserLast36', 'user36@example.com', '+919876500036', 4.94, 'Mumbai', '2026-10-09 09:31:28'),
(37, 'UserFirst37', 'UserLast37', 'user37@example.com', '+919876500037', 3.60, 'Pune', '2026-10-09 09:31:28'),
(38, 'UserFirst38', 'UserLast38', 'user38@example.com', '+919876500038', 4.53, 'Mumbai', '2026-10-09 09:31:28'),
(39, 'UserFirst39', 'UserLast39', 'user39@example.com', '+919876500039', 4.06, 'Pune', '2026-10-09 09:31:28'),
(40, 'UserFirst40', 'UserLast40', 'user40@example.com', '+919876500040', 4.88, 'Pune', '2026-10-09 09:31:28'),
(41, 'UserFirst41', 'UserLast41', 'user41@example.com', '+919876500041', 3.78, 'Bangalore', '2026-10-09 09:31:28'),
(42, 'UserFirst42', 'UserLast42', 'user42@example.com', '+919876500042', 3.78, 'Delhi', '2026-10-09 09:31:28'),
(43, 'UserFirst43', 'UserLast43', 'user43@example.com', '+919876500043', 4.77, 'Bangalore', '2026-10-09 09:31:28'),
(44, 'UserFirst44', 'UserLast44', 'user44@example.com', '+919876500044', 4.21, 'Mumbai', '2026-10-09 09:31:28'),
(45, 'UserFirst45', 'UserLast45', 'user45@example.com', '+919876500045', 4.07, 'Bangalore', '2026-10-09 09:31:28'),
(46, 'UserFirst46', 'UserLast46', 'user46@example.com', '+919876500046', 3.50, 'Pune', '2026-10-09 09:31:28'),
(47, 'UserFirst47', 'UserLast47', 'user47@example.com', '+919876500047', 4.38, 'Pune', '2026-10-09 09:31:28'),
(48, 'UserFirst48', 'UserLast48', 'user48@example.com', '+919876500048', 3.70, 'Delhi', '2026-10-09 09:31:28'),
(49, 'UserFirst49', 'UserLast49', 'user49@example.com', '+919876500049', 3.84, 'Mumbai', '2026-10-09 09:31:28'),
(50, 'UserFirst50', 'UserLast50', 'user50@example.com', '+919876500050', 3.65, 'Mumbai', '2026-10-09 09:31:28'),
(51, 'UserFirst51', 'UserLast51', 'user51@example.com', '+919876500051', 4.86, 'Bangalore', '2026-10-09 09:31:29'),
(52, 'UserFirst52', 'UserLast52', 'user52@example.com', '+919876500052', 4.02, 'Bangalore', '2026-10-09 09:31:29'),
(53, 'UserFirst53', 'UserLast53', 'user53@example.com', '+919876500053', 4.05, 'Bangalore', '2026-10-09 09:31:29'),
(54, 'UserFirst54', 'UserLast54', 'user54@example.com', '+919876500054', 4.88, 'Delhi', '2026-10-09 09:31:29'),
(55, 'UserFirst55', 'UserLast55', 'user55@example.com', '+919876500055', 3.66, 'Bangalore', '2026-10-09 09:31:29'),
(56, 'UserFirst56', 'UserLast56', 'user56@example.com', '+919876500056', 4.57, 'Delhi', '2026-10-09 09:31:29'),
(57, 'UserFirst57', 'UserLast57', 'user57@example.com', '+919876500057', 4.39, 'Hyderabad', '2026-10-09 09:31:29'),
(58, 'UserFirst58', 'UserLast58', 'user58@example.com', '+919876500058', 4.71, 'Delhi', '2026-10-09 09:31:29'),
(59, 'UserFirst59', 'UserLast59', 'user59@example.com', '+919876500059', 3.50, 'Mumbai', '2026-10-09 09:31:29'),
(60, 'UserFirst60', 'UserLast60', 'user60@example.com', '+919876500060', 4.70, 'Bangalore', '2026-10-09 09:31:29'),
(61, 'UserFirst61', 'UserLast61', 'user61@example.com', '+919876500061', 3.81, 'Bangalore', '2026-10-09 09:31:29'),
(62, 'UserFirst62', 'UserLast62', 'user62@example.com', '+919876500062', 4.50, 'Hyderabad', '2026-10-09 09:31:29'),
(63, 'UserFirst63', 'UserLast63', 'user63@example.com', '+919876500063', 4.66, 'Mumbai', '2026-10-09 09:31:29'),
(64, 'UserFirst64', 'UserLast64', 'user64@example.com', '+919876500064', 4.54, 'Bangalore', '2026-10-09 09:31:29'),
(65, 'UserFirst65', 'UserLast65', 'user65@example.com', '+919876500065', 3.76, 'Bangalore', '2026-10-09 09:31:29'),
(66, 'UserFirst66', 'UserLast66', 'user66@example.com', '+919876500066', 3.64, 'Hyderabad', '2026-10-09 09:31:29'),
(67, 'UserFirst67', 'UserLast67', 'user67@example.com', '+919876500067', 3.88, 'Bangalore', '2026-10-09 09:31:29'),
(68, 'UserFirst68', 'UserLast68', 'user68@example.com', '+919876500068', 4.85, 'Hyderabad', '2026-10-09 09:31:29'),
(69, 'UserFirst69', 'UserLast69', 'user69@example.com', '+919876500069', 4.77, 'Bangalore', '2026-10-09 09:31:29'),
(70, 'UserFirst70', 'UserLast70', 'user70@example.com', '+919876500070', 4.99, 'Bangalore', '2026-10-09 09:31:29'),
(71, 'UserFirst71', 'UserLast71', 'user71@example.com', '+919876500071', 3.94, 'Mumbai', '2026-10-09 09:31:29'),
(72, 'UserFirst72', 'UserLast72', 'user72@example.com', '+919876500072', 4.36, 'Bangalore', '2026-10-09 09:31:29'),
(73, 'UserFirst73', 'UserLast73', 'user73@example.com', '+919876500073', 3.88, 'Bangalore', '2026-10-09 09:31:29'),
(74, 'UserFirst74', 'UserLast74', 'user74@example.com', '+919876500074', 4.44, 'Pune', '2026-10-09 09:31:29'),
(75, 'UserFirst75', 'UserLast75', 'user75@example.com', '+919876500075', 4.55, 'Delhi', '2026-10-09 09:31:29'),
(76, 'UserFirst76', 'UserLast76', 'user76@example.com', '+919876500076', 4.44, 'Mumbai', '2026-10-09 09:31:29'),
(77, 'UserFirst77', 'UserLast77', 'user77@example.com', '+919876500077', 4.35, 'Bangalore', '2026-10-09 09:31:29'),
(78, 'UserFirst78', 'UserLast78', 'user78@example.com', '+919876500078', 3.80, 'Delhi', '2026-10-09 09:31:29'),
(79, 'UserFirst79', 'UserLast79', 'user79@example.com', '+919876500079', 4.59, 'Hyderabad', '2026-10-09 09:31:29'),
(80, 'UserFirst80', 'UserLast80', 'user80@example.com', '+919876500080', 4.99, 'Bangalore', '2026-10-09 09:31:29'),
(81, 'UserFirst81', 'UserLast81', 'user81@example.com', '+919876500081', 4.05, 'Bangalore', '2026-10-09 09:31:29'),
(82, 'UserFirst82', 'UserLast82', 'user82@example.com', '+919876500082', 3.52, 'Hyderabad', '2026-10-09 09:31:29'),
(83, 'UserFirst83', 'UserLast83', 'user83@example.com', '+919876500083', 4.97, 'Bangalore', '2026-10-09 09:31:29'),
(84, 'UserFirst84', 'UserLast84', 'user84@example.com', '+919876500084', 4.27, 'Mumbai', '2026-10-09 09:31:29'),
(85, 'UserFirst85', 'UserLast85', 'user85@example.com', '+919876500085', 4.89, 'Delhi', '2026-10-09 09:31:29'),
(86, 'UserFirst86', 'UserLast86', 'user86@example.com', '+919876500086', 4.92, 'Pune', '2026-10-09 09:31:29'),
(87, 'UserFirst87', 'UserLast87', 'user87@example.com', '+919876500087', 4.42, 'Hyderabad', '2026-10-09 09:31:29'),
(88, 'UserFirst88', 'UserLast88', 'user88@example.com', '+919876500088', 3.69, 'Pune', '2026-10-09 09:31:29'),
(89, 'UserFirst89', 'UserLast89', 'user89@example.com', '+919876500089', 4.84, 'Bangalore', '2026-10-09 09:31:29'),
(90, 'UserFirst90', 'UserLast90', 'user90@example.com', '+919876500090', 4.75, 'Pune', '2026-10-09 09:31:29'),
(91, 'UserFirst91', 'UserLast91', 'user91@example.com', '+919876500091', 4.72, 'Mumbai', '2026-10-09 09:31:29'),
(92, 'UserFirst92', 'UserLast92', 'user92@example.com', '+919876500092', 3.50, 'Pune', '2026-10-09 09:31:29'),
(93, 'UserFirst93', 'UserLast93', 'user93@example.com', '+919876500093', 4.52, 'Mumbai', '2026-10-09 09:31:29'),
(94, 'UserFirst94', 'UserLast94', 'user94@example.com', '+919876500094', 4.80, 'Hyderabad', '2026-10-09 09:31:29'),
(95, 'UserFirst95', 'UserLast95', 'user95@example.com', '+919876500095', 4.13, 'Pune', '2026-10-09 09:31:29'),
(96, 'UserFirst96', 'UserLast96', 'user96@example.com', '+919876500096', 3.65, 'Bangalore', '2026-10-09 09:31:29'),
(97, 'UserFirst97', 'UserLast97', 'user97@example.com', '+919876500097', 3.66, 'Mumbai', '2026-10-09 09:31:29'),
(98, 'UserFirst98', 'UserLast98', 'user98@example.com', '+919876500098', 3.81, 'Pune', '2026-10-09 09:31:29'),
(99, 'UserFirst99', 'UserLast99', 'user99@example.com', '+919876500099', 4.92, 'Bangalore', '2026-10-09 09:31:29'),
(100, 'UserFirst100', 'UserLast100', 'user100@example.com', '+919876500100', 3.70, 'Hyderabad', '2026-10-09 09:31:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `license_plate` (`license_plate`);

--
-- Indexes for table `rides`
--
ALTER TABLE `rides`
  ADD PRIMARY KEY (`ride_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `rides`
--
ALTER TABLE `rides`
  MODIFY `ride_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rides`
--
ALTER TABLE `rides`
  ADD CONSTRAINT `rides_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `rides_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
