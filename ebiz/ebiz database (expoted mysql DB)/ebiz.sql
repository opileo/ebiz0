-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2022 at 10:51 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ebiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `location` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_like`
--

CREATE TABLE `customer_like` (
  `id` int(10) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='this table takes customer likes';

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `id` int(10) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='table for storing customer purchase details';

-- --------------------------------------------------------

--
-- Table structure for table `days_lt_produce`
--

CREATE TABLE `days_lt_produce` (
  `id` int(10) NOT NULL,
  `quantity` int(100) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='table stores data about the quantity of long term products the manager expects to produce in a day. which is used to calculate other mesurements';

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL COMMENT 'should be unique, to be used for signin',
  `email` varchar(100) NOT NULL,
  `role` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='table for employee details';

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `workers_allocation`
--

CREATE TABLE `workers_allocation` (
  `id` int(100) NOT NULL,
  `work_period_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `employee_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='table describes employee allocation when the generate button';

-- --------------------------------------------------------

--
-- Table structure for table `work_period`
--

CREATE TABLE `work_period` (
  `id` int(100) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_like`
--
ALTER TABLE `customer_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_order_ibfk_1` (`customer_id`),
  ADD KEY `customer_order_ibfk_2` (`product_id`);

--
-- Indexes for table `days_lt_produce`
--
ALTER TABLE `days_lt_produce`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workers_allocation`
--
ALTER TABLE `workers_allocation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workers_allocation_ibfk_1` (`work_period_id`),
  ADD KEY `workers_allocation_ibfk_2` (`employee_id`),
  ADD KEY `workers_allocation_ibfk_3` (`product_id`);

--
-- Indexes for table `work_period`
--
ALTER TABLE `work_period`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_like`
--
ALTER TABLE `customer_like`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `days_lt_produce`
--
ALTER TABLE `days_lt_produce`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workers_allocation`
--
ALTER TABLE `workers_allocation`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_period`
--
ALTER TABLE `work_period`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_like`
--
ALTER TABLE `customer_like`
  ADD CONSTRAINT `customer_like_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_like_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD CONSTRAINT `customer_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_order_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `workers_allocation`
--
ALTER TABLE `workers_allocation`
  ADD CONSTRAINT `workers_allocation_ibfk_1` FOREIGN KEY (`work_period_id`) REFERENCES `work_period` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `workers_allocation_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `workers_allocation_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
