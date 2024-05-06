-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2024 at 01:37 AM
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
-- Database: `localhost`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `service_provider_username` varchar(255) DEFAULT NULL,
  `custname` varchar(255) NOT NULL,
  `workername` varchar(255) NOT NULL,
  `number` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL,
  `time` time(6) NOT NULL,
  `address` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `service_provider_username`, `custname`, `workername`, `number`, `email`, `date`, `time`, `address`, `user_id`) VALUES
(1, 'amulya', 'Deepak Mishra', 'Akhil', 2147483647, '121deepak2104@sjcem.edu.in', '0000-00-00 00:00:00.000000', '00:00:00.000000', '', NULL),
(2, 'avnish', 'Avnish Alves', '08087189088', 2147483647, 'avnishalves@gmail.com', '2024-04-29 00:00:00.000000', '21:45:00.000000', 'ALVES COMPOUND,VADKUN ROAD,COLLEGE ROAD', NULL),
(8, NULL, 'Avnish Alves', '08087189088', 2147483647, 'avnishalves@gmail.com', '2024-05-08 00:00:00.000000', '05:55:00.000000', 'ALVES COMPOUND,VADKUN ROAD,COLLEGE ROAD', NULL),
(9, NULL, 'Avnish Alves', '08087189088', 2147483647, 'avnishalves@gmail.com', '2024-05-21 00:00:00.000000', '02:01:00.000000', 'ALVES COMPOUND,VADKUN ROAD,COLLEGE ROAD', NULL),
(10, NULL, 'Avnish Alves', '08087189088', 2147483647, 'avnishalves@gmail.com', '2024-05-21 00:00:00.000000', '02:01:00.000000', 'ALVES COMPOUND,VADKUN ROAD,COLLEGE ROAD', NULL),
(11, 'avnish', 'Avnish Alves', 'Akhil', 2147483647, 'avnishalves@gmail.com', '2024-05-16 00:00:00.000000', '14:19:00.000000', 'ALVES COMPOUND,VADKUN ROAD,COLLEGE ROAD', NULL),
(12, 'avnish', 'Avnish Alves', 'Akhil', 2147483647, 'avnishalves@gmail.com', '2024-05-30 00:00:00.000000', '15:21:00.000000', 'ALVES COMPOUND,VADKUN ROAD,COLLEGE ROAD', NULL),
(13, 'Avnish', 'deepakmishra', 'pushpek', 2147483647, 'pushpek@gmail.com', '2024-05-02 00:00:00.000000', '15:00:00.000000', 'ALVES COMPOUND,VADKUN ROAD,COLLEGE ROAD', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_providers`
--

CREATE TABLE `service_providers` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `number` int(50) NOT NULL,
  `gst` varchar(255) NOT NULL,
  `shop` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_providers`
--

INSERT INTO `service_providers` (`id`, `fname`, `lname`, `username`, `email`, `password_hash`, `number`, `gst`, `shop`, `area`) VALUES
(1, 'Avnish', 'Alvish', 'avnish', 'avnish@gmail.com', 'Avnish', 2147483647, '8329023187', 'pipe installation and repairs', 'ALVES COMPOUND,VADKUN ROAD,COLLEGE ROAD'),
(2, 'Amulya', 'Amulya', 'amulya', 'avnishalves@gmail.com', 'amulya', 2147483647, '8087189088', 'Fixture Installation and Repair', 'palghar'),
(9, 'Amulya', 'alves', 'AA', 'amulyaalves@gmail.com', 'AA', 2147483647, '2020202020', 'plumber', 'ALVES COMPOUND,VADKUN ROAD,COLLEGE ROAD'),
(11, 'Albert', 'D\'souza', 'Albbert', 'albert@gmail.com', 'sjcem', 2147483647, '8484844949', '76876786', '87676'),
(12, 'Rutika', 'holambe', 'rutika', 'rutika@gmail.com', 'rutika', 2147483647, '1877398173', 'Water Heater Installation and Repair', 'Palghar'),
(13, 'Deeksha', 'Kharvi', 'deeksha', 'deeksha@gmail.com', 'deeksha', 2147483647, '4641616664', 'Cabinet Installation and Repair', 'palghar'),
(14, 'Haamid', 'Kazi', 'haamid', 'haamid@gmail.com', 'haamid', 2147483647, '4461616116', 'Drain Cleaning', 'Boisar'),
(15, 'Chaitanya', 'Sharma', 'chaitanya', 'Chaitanya@gmail.com', 'chaitanya', 2147483647, '4161616161', 'Diagnostic Services', 'Bhaiya Pada Boisar'),
(16, 'Deepak', 'Mishra', 'deepak', 'deepak@gmail.com', 'deepak', 2147483647, '8087189088', 'Electrical Wiring', 'ALVES COMPOUND,VADKUN ROAD,COLLEGE ROAD'),
(17, 'Sharma', 'Sharma', 'sharma', 'sharma@gmail.com', 'sharma', 2147483647, '8087189088', 'Interior Painting and external painting', 'ALVES COMPOUND,VADKUN ROAD,COLLEGE ROAD'),
(18, 'Consultech ', 'India', 'consultech', 'consultech@gmail.com', 'consultech', 2147483647, '4555165161', 'Trim and Molding', 'Palghar'),
(19, 'Manira', 'as', 'manira', 'manira@gmail.com', 'manira', 2147483647, '8087189088', 'Door and Window Repair/Installation', 'ALVES COMPOUND,VADKUN ROAD,COLLEGE ROAD'),
(20, 'Decor', 'decor', 'decor', 'decor@gmail.com', 'decor', 2147483647, '6161616161', 'Furniture Assembly', 'Dahanu'),
(21, 'Jai', 'mestri', 'jai', 'jai@gmail.com', 'jai', 2147483647, '5153435434', 'Outlet Installation and Repair', 'dahanu'),
(22, 'nayan', 'mistry', 'nayan', 'nayan@gmail.com', 'nayan', 2147483647, '2911919499', 'Circuit Breaker Services', 'dahanu'),
(23, 'vedant', 'shetty', 'vedant', 'vedant@gmail.com', 'vedant', 2147483647, '4165161615', 'Lighting Installation and Repair', 'dahanu/palghar'),
(24, 'sohan', 'mistry', 'sohan', 'sohan@gmail.com', 'sohan', 2147483647, '5165161616', 'Cabinet Painting/Refinishing', 'palghar'),
(25, 'shamita', 'alves', 'shamita', 'shamita@gmail.com', 'shamita', 2147483647, '4465116516', 'Routine Maintenance', 'ALVES COMPOUND,VADKUN ROAD,COLLEGE ROAD'),
(26, 'Design', 'ergo', 'ergo', 'ergo@gmail.com', 'ergo', 2147483647, '6461616516', 'Deck and Fence Staining/Painting', 'palghar'),
(27, 'son', 'son', 'son', 'son@gmail.com', 'son', 2147483647, '4646464446', 'Repairs', 'dahanu/boisar'),
(28, 'michelin', 'michelin', 'mich', 'michelin@gmail.com', 'mich', 2147483647, '4684646464', 'Tire Services', 'palghar');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `city`, `address`, `email`, `username`, `password`) VALUES
(1, 'Amulya', 'Amulya', 'Amulya', 'amulya@gmail.com', 'amulya', 'Amulya'),
(2, 'Deepak', 'Boisar', 'Boisar', 'deepak@gmail.com', 'deepak', 'Deepak'),
(3, 'Ash Ketchup', 'Somewhere', 'somewhere', 'pikachu@gmail.com', 'pokemonmaster', 'pikachu'),
(4, 'Deeksha', 'di', 'di', 'deeksha@gmail.com', 'deeksha', 'deeksha'),
(5, 'Chaitanya Sharma', 'Mumbai', 'Mumbai', 'avnishalves@gmail.com', 'cs', 'cs');

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

CREATE TABLE `workers` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `worker_id` varchar(50) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `services` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `addhar` varchar(16) DEFAULT NULL,
  `serviceprovider_username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workers`
--

INSERT INTO `workers` (`id`, `provider_id`, `name`, `email`, `worker_id`, `experience`, `services`, `photo`, `number`, `addhar`, `serviceprovider_username`) VALUES
(8, 9, 'Avnish Alves', 'avnishalves@gmail.com', '003', 4, 'Pipe Installation and Repair', 'WhatsApp_Image_2024-02-03_at_10.54.37_AM_2.jpeg', NULL, NULL, 'AA'),
(29, 1, 'pushpek', 'avnishalves@gmail.com', '003', 3, 'Pipe Installation and Repair', 'pushpek.jpeg', '7894561332', '1236547896587458', 'Avnish');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_service_provider_username` (`service_provider_username`);

--
-- Indexes for table `service_providers`
--
ALTER TABLE `service_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_id` (`provider_id`),
  ADD KEY `fk_serviceprovider_username` (`serviceprovider_username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `service_providers`
--
ALTER TABLE `service_providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `workers`
--
ALTER TABLE `workers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_service_provider_username` FOREIGN KEY (`service_provider_username`) REFERENCES `service_providers` (`username`) ON DELETE CASCADE;

--
-- Constraints for table `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `fk_serviceprovider_username` FOREIGN KEY (`serviceprovider_username`) REFERENCES `service_providers` (`username`),
  ADD CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `service_providers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
