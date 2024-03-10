-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2024 at 06:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cargo`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_level`
--

CREATE TABLE `access_level` (
  `level_id` int(2) NOT NULL,
  `level` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `access_level`
--

INSERT INTO `access_level` (`level_id`, `level`) VALUES
(1, 'Admin'),
(2, 'Agent'),
(3, 'Warehouse Manager'),
(4, 'Driver');

-- --------------------------------------------------------

--
-- Table structure for table `container`
--

CREATE TABLE `container` (
  `container_id` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `warehouse` varchar(255) NOT NULL,
  `status` varchar(62) NOT NULL DEFAULT 'Active',
  `location` varchar(255) NOT NULL DEFAULT 'Warehouse Loading'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `container`
--

INSERT INTO `container` (`container_id`, `company_name`, `destination`, `warehouse`, `status`, `location`) VALUES
('CRTWW1258974', 'TRICO CARGO', 'ETHIOPIA', 'GALLE', 'Active', 'Warehouse Loading'),
('CSD145896510258', 'ABC COMPANY', 'SRI LANKA', 'KURUNEGALA', 'Active', 'Warehouse Loading'),
('DFGRT1785DFR', 'TRI BULL CARGO', 'PHILIPINES', 'KURUNEGALA', 'Active', 'Warehouse Loading'),
('NMDFE125896', 'ABC COMPANY', 'SRI LANKA', 'GALLE', 'Active', 'Warehouse Loading'),
('PSRTY12589', 'CARGO LANKA PVT LTD', 'SRI LANKA', 'KURUNEGALA', 'Active', 'Arrived');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `gender_id` int(2) NOT NULL,
  `gender` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`gender_id`, `gender`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_number` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `recievedate` varchar(255) DEFAULT NULL,
  `shippingcompany` varchar(255) DEFAULT NULL,
  `shippingdate` varchar(255) DEFAULT NULL,
  `totalpackages` int(11) DEFAULT NULL,
  `totalvolume` float DEFAULT NULL,
  `totalweight` float DEFAULT NULL,
  `totalvalue` float DEFAULT NULL,
  `freightcharges` float DEFAULT NULL,
  `handlingcharges` float DEFAULT NULL,
  `d2dcharges` float DEFAULT NULL,
  `domesticcharges` float DEFAULT NULL,
  `insurancecharges` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `cname` varchar(255) DEFAULT NULL,
  `caddress` varchar(255) DEFAULT NULL,
  `cnum` varchar(255) DEFAULT NULL,
  `cpass` varchar(255) DEFAULT NULL,
  `pmethod` varchar(255) DEFAULT NULL,
  `rname` varchar(255) DEFAULT NULL,
  `raddress` varchar(255) DEFAULT NULL,
  `rnum` varchar(255) DEFAULT NULL,
  `rmethod` varchar(255) DEFAULT NULL,
  `tot` float DEFAULT NULL,
  `ewdlarge` int(11) DEFAULT NULL,
  `ewdxlarge` int(11) DEFAULT NULL,
  `ewd1m` int(11) DEFAULT NULL,
  `ewd15m` int(11) DEFAULT NULL,
  `ewd2m` int(11) DEFAULT NULL,
  `ewd25m` int(11) DEFAULT NULL,
  `ewd35m` int(11) DEFAULT NULL,
  `ecsmall` int(11) DEFAULT NULL,
  `ecmedium` int(11) DEFAULT NULL,
  `eclarge` int(11) DEFAULT NULL,
  `ecjumbo` int(11) DEFAULT NULL,
  `ecxl` int(11) DEFAULT NULL,
  `etsmall` int(11) DEFAULT NULL,
  `etmedium` int(11) DEFAULT NULL,
  `etlarge` int(11) DEFAULT NULL,
  `etxl` int(11) DEFAULT NULL,
  `etxxl` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT 'Waiting For the shipment',
  `status` varchar(255) DEFAULT 'Order Placed',
  `id` int(11) NOT NULL,
  `container_id` varchar(255) DEFAULT NULL,
  `doortodriver` varchar(62) DEFAULT 'NOT'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_number`, `order_id`, `recievedate`, `shippingcompany`, `shippingdate`, `totalpackages`, `totalvolume`, `totalweight`, `totalvalue`, `freightcharges`, `handlingcharges`, `d2dcharges`, `domesticcharges`, `insurancecharges`, `tax`, `cname`, `caddress`, `cnum`, `cpass`, `pmethod`, `rname`, `raddress`, `rnum`, `rmethod`, `tot`, `ewdlarge`, `ewdxlarge`, `ewd1m`, `ewd15m`, `ewd2m`, `ewd25m`, `ewd35m`, `ecsmall`, `ecmedium`, `eclarge`, `ecjumbo`, `ecxl`, `etsmall`, `etmedium`, `etlarge`, `etxl`, `etxxl`, `location`, `status`, `id`, `container_id`, `doortodriver`) VALUES
('fsg', 19, '2024-02-26', 'ggm', '2024-02-27', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 's', 'ddff', '0763602594', '123456ABC', 'Full Payment', 'd', 'df', '0767510613', 'Door to Door', 2500.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Arrived', 'Container Added', 4, 'PSRTY12589', 'nimesh123'),
('IN20', 20, '2024-02-27', 'Trico Cargo', '2024-02-29', 1, 0, 0, 0, 0, 2500, 0, 0, 0, 0, 'Wimala Boralugoda', 'No 22, TL road Kuwait', '0763602527', '123456ABC', 'Full Payment', 'Kasun Anjana', 'No 522/B, II Stage Anuradhapura', '0767510458', 'Door to Door', 30000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arrived', 'Container Added', 5, 'PSRTY12589', 'isuru123');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_Id` int(11) NOT NULL,
  `customer_Name` varchar(150) DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `customer_contactNo` varchar(50) DEFAULT NULL,
  `box_type` varchar(50) DEFAULT NULL,
  `box_qty` int(3) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `pickup_date` date DEFAULT NULL,
  `delivery_driver` varchar(62) DEFAULT NULL,
  `pickup_driver` varchar(62) DEFAULT NULL,
  `payment_method` varchar(60) DEFAULT NULL,
  `receiver_name` varchar(150) DEFAULT NULL,
  `receiver_address` text DEFAULT NULL,
  `receiver_contactNo` varchar(25) DEFAULT NULL,
  `receiving_method` varchar(62) DEFAULT NULL,
  `total_payment` int(10) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `method` varchar(62) DEFAULT NULL,
  `customer_pay` int(11) DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `ordered_time` time DEFAULT NULL,
  `ordered_date` date DEFAULT NULL,
  `pickup_status` varchar(60) DEFAULT NULL,
  `delivery_status` varchar(60) DEFAULT NULL,
  `ewdlarge` int(5) DEFAULT 0,
  `ewdxlarge` int(5) DEFAULT 0,
  `ewd1m` int(5) DEFAULT 0,
  `ewd15m` int(5) DEFAULT 0,
  `ewd2m` int(5) DEFAULT 0,
  `ewd25m` int(5) DEFAULT 0,
  `ewd35m` int(5) DEFAULT 0,
  `ecsmall` int(5) DEFAULT 0,
  `ecmedium` int(5) DEFAULT 0,
  `eclarge` int(5) DEFAULT 0,
  `ecjumbo` int(5) DEFAULT 0,
  `ecxl` int(5) DEFAULT 0,
  `etsmall` int(5) DEFAULT 0,
  `etmedium` int(5) DEFAULT 0,
  `etlarge` int(5) DEFAULT 0,
  `etxl` int(5) DEFAULT 0,
  `etxxl` int(5) DEFAULT 0,
  `passport` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_Id`, `customer_Name`, `customer_address`, `customer_contactNo`, `box_type`, `box_qty`, `delivery_date`, `pickup_date`, `delivery_driver`, `pickup_driver`, `payment_method`, `receiver_name`, `receiver_address`, `receiver_contactNo`, `receiving_method`, `total_payment`, `status`, `method`, `customer_pay`, `remarks`, `ordered_time`, `ordered_date`, `pickup_status`, `delivery_status`, `ewdlarge`, `ewdxlarge`, `ewd1m`, `ewd15m`, `ewd2m`, `ewd25m`, `ewd35m`, `ecsmall`, `ecmedium`, `eclarge`, `ecjumbo`, `ecxl`, `etsmall`, `etmedium`, `etlarge`, `etxl`, `etxxl`, `passport`) VALUES
(19, 'Ishara Wijesinghe', 'Test address 04', '767510458', 'XXL/Trunk', 2, '2023-11-20', '2023-11-21', '10', '10', 'Full Payement', 'Kasun Ratnayaka', 'Test address 05', '0763602524', 'Door To Door', 30000, 'Order Placed', 'Delivery and Pickup', 15250, 'test remarks 01 Test remarks 02 Test remarks 03 Test remarks Test Remarks 02 Test remrks 04', '22:40:29', '2023-11-20', 'Completed', 'Completed', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `superuserrr`
--

CREATE TABLE `superuserrr` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `superuserrr`
--

INSERT INTO `superuserrr` (`id`, `username`, `password`, `created_at`, `name`) VALUES
(3, 'maleesha123', '$2y$10$eJXEuBO8HEkOYy1jv73epu3tYxMQ4NFxojfNKExzJGMZK7bwLurOG', '2024-02-15 01:10:13', 'Maleesha');

-- --------------------------------------------------------

--
-- Table structure for table `systemstat`
--

CREATE TABLE `systemstat` (
  `status` varchar(60) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `systemstat`
--

INSERT INTO `systemstat` (`status`) VALUES
('Active');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(7) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(62) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `tele` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `gender_id` int(2) DEFAULT NULL,
  `level_id` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `fname`, `lname`, `tele`, `address`, `gender_id`, `level_id`) VALUES
(5, 'asiri456', '$2y$10$4s2/30hfxyptxr2M31.TQe42xlYYqMMbW.b3uCKrnLOPfyYgPnWJK', 'ASIRI', 'PEREA', '0767510613', 'TEST ADDRESS 05', 1, 4),
(4, 'kasun456', '$2y$10$TldeU1jKP2bziOXr8d6.U.gKFxL4pf5XstyROAtJ2pWn9xd3mZKwi', 'KASUN ', 'ERANGA', '0763052529', 'TEST ADDRESS', 1, 4),
(12, 'admin123', '$2y$10$4zoxcbF6xM.vYb7vWa8kSetudGFfs4Nw2Quo7BzWNMW8blapU6SGC', 'NEW ', 'ADMIN', '0767510489', 'TEST  ADDRESS ADMIN', 1, 1),
(7, 'whm', '$2y$10$PwLtg8BtYJdgHSamfZ9Jv.i9l42i8/DMneS/9l/arMV3t1Y07RuES', 'KASUN ', 'NILANGA', '0767510613', 'TEST ADDRESS', 1, 3),
(14, 'shakila456', '$2y$10$drt80FzVuLmKCJdGmdcRIeltUFaRag.4YZZFm0mHx.gLj3NYJDhlu', 'SHAKILA ', 'PATHUM', '0763602528', '3RD STAGE,ANURADHAPURA', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `warehousedriver`
--

CREATE TABLE `warehousedriver` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  `warehouse` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehousedriver`
--

INSERT INTO `warehousedriver` (`id`, `fname`, `lname`, `username`, `password`, `warehouse`, `mobile`, `address`) VALUES
(4, 'ISURU', 'KURUPPU', 'isuru123', '$2y$10$nOE7UalAZ9yp.NtW6TuS4OJn9C3l5nv/39DtN07YuJ188luKYCIiG', 'KURUPPU', '0767510489', '2ND AVENEU, GAMPAHA'),
(5, 'NIMESH', 'LAKSHAN', 'nimesh123', '$2y$10$Xms5eFwAE5Z4w718ZeiJTe0us4Gn3nL.Mj3x8j95okaS.ZTbaQRsi', 'LAKSHAN', '0767510458', 'TEST ADDRESS 01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_level`
--
ALTER TABLE `access_level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `container`
--
ALTER TABLE `container`
  ADD PRIMARY KEY (`container_id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_Id`);

--
-- Indexes for table `superuserrr`
--
ALTER TABLE `superuserrr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `gender_id` (`gender_id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indexes for table `warehousedriver`
--
ALTER TABLE `warehousedriver`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `superuserrr`
--
ALTER TABLE `superuserrr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `warehousedriver`
--
ALTER TABLE `warehousedriver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
