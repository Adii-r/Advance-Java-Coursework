-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2026 at 05:07 AM
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
-- Database: `cinosphere`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `booking_status` varchar(20) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `booking_channel` varchar(30) NOT NULL,
  `loyalty_points_earned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `hash_password` varchar(255) NOT NULL,
  `registration_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `customer_role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `username`, `email`, `date_of_birth`, `gender`, `hash_password`, `registration_date`, `is_active`, `customer_role`) VALUES
(7, 'Raunit', 'Giri', 'RAWunit', 'raunit06@gmail.com', '2026-05-02', 'male', '$2a$10$fIaKRolhPHQMKyEbq1Y5P.DHzTd.41Fb6JtPTsNRX8SEhulHGrHUm', '2026-05-02', 1, 'CUSTOMER'),
(8, 'Admin', 'Admin', 'Admin', 'Admin@gmail.com', '2026-05-02', 'other', '$2a$10$nOk/9qchdS9FSWxGm.m0relnFoArZVF8xytfTlaZOg0TULZp6FDO2', '2026-05-02', 1, 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `description` text NOT NULL,
  `feedback_date` date NOT NULL,
  `feedback_time` time NOT NULL,
  `feedback_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `membership_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `membership_type` varchar(30) NOT NULL,
  `membership_status` varchar(20) NOT NULL,
  `total_loyalty_points` int(11) NOT NULL,
  `discount_percentage` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`membership_id`, `customer_id`, `membership_type`, `membership_status`, `total_loyalty_points`, `discount_percentage`) VALUES
(1, 7, 'Normal person', 'Active', 0, 0.00),
(2, 8, 'Normal person', 'Active', 0, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL,
  `movie_name` varchar(100) NOT NULL,
  `duration` int(11) NOT NULL,
  `director` varchar(100) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `movie_language` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `release_date` date NOT NULL,
  `movie_status` varchar(20) NOT NULL,
  `age_rating` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `payment_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `screen`
--

CREATE TABLE `screen` (
  `screen_id` int(11) NOT NULL,
  `theatre_id` int(11) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `screen_type` varchar(30) NOT NULL,
  `screen_status` varchar(20) NOT NULL,
  `total_capacity` int(11) NOT NULL,
  `base_price` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `seat_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `seat_number` varchar(10) NOT NULL,
  `row_number` varchar(10) NOT NULL,
  `seat_type` varchar(20) NOT NULL,
  `seat_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `showtime`
--

CREATE TABLE `showtime` (
  `showtime_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `show_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `show_status` varchar(20) NOT NULL,
  `show_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theatre`
--

CREATE TABLE `theatre` (
  `theatre_id` int(11) NOT NULL,
  `theatre_name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `total_screens` int(11) NOT NULL,
  `theatre_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `showtime_id` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL,
  `ticket_type` varchar(30) NOT NULL,
  `ticket_status` varchar(20) NOT NULL,
  `issue_date` date NOT NULL,
  `ticket_price` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_booking_user` (`customer_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `fk_feedback_user` (`customer_id`),
  ADD KEY `fk_feedback_movie` (`movie_id`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`membership_id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `booking_id` (`booking_id`);

--
-- Indexes for table `screen`
--
ALTER TABLE `screen`
  ADD PRIMARY KEY (`screen_id`),
  ADD KEY `fk_screen_theatre` (`theatre_id`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `fk_seat_screen` (`screen_id`);

--
-- Indexes for table `showtime`
--
ALTER TABLE `showtime`
  ADD PRIMARY KEY (`showtime_id`),
  ADD KEY `fk_showtime_screen` (`screen_id`),
  ADD KEY `fk_showtime_movie` (`movie_id`);

--
-- Indexes for table `theatre`
--
ALTER TABLE `theatre`
  ADD PRIMARY KEY (`theatre_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD UNIQUE KEY `uq_showtime_seat` (`showtime_id`,`seat_id`),
  ADD KEY `fk_ticket_booking` (`booking_id`),
  ADD KEY `fk_ticket_seat` (`seat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `membership_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `screen`
--
ALTER TABLE `screen`
  MODIFY `screen_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seat`
--
ALTER TABLE `seat`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `showtime`
--
ALTER TABLE `showtime`
  MODIFY `showtime_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theatre`
--
ALTER TABLE `theatre`
  MODIFY `theatre_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_booking_user` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `fk_feedback_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_feedback_user` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `fk_membership_user` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `screen`
--
ALTER TABLE `screen`
  ADD CONSTRAINT `fk_screen_theatre` FOREIGN KEY (`theatre_id`) REFERENCES `theatre` (`theatre_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `fk_seat_screen` FOREIGN KEY (`screen_id`) REFERENCES `screen` (`screen_id`) ON DELETE CASCADE;

--
-- Constraints for table `showtime`
--
ALTER TABLE `showtime`
  ADD CONSTRAINT `fk_showtime_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_showtime_screen` FOREIGN KEY (`screen_id`) REFERENCES `screen` (`screen_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ticket_seat` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ticket_showtime` FOREIGN KEY (`showtime_id`) REFERENCES `showtime` (`showtime_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
