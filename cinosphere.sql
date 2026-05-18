-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2026 at 08:31 AM
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
  `user_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `booking_status` varchar(20) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `booking_channel` varchar(30) NOT NULL,
  `loyalty_points_earned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `user_id`, `booking_date`, `booking_time`, `booking_status`, `total_amount`, `booking_channel`, `loyalty_points_earned`) VALUES
(1, 2, '2025-01-10', '10:30:00', 'confirmed', 850.00, 'online', 85),
(2, 2, '2025-01-18', '14:15:00', 'pending', 1200.00, 'online', 120),
(3, 2, '2025-02-05', '09:00:00', 'archive', 500.00, 'counter', 0),
(4, 2, '2025-02-20', '19:45:00', 'confirmed', 650.00, 'online', 65),
(5, 2, '2025-03-03', '11:00:00', 'confirmed', 1500.00, 'online', 150),
(6, 3, '2025-01-12', '16:00:00', 'confirmed', 700.00, 'counter', 70),
(7, 3, '2025-01-25', '20:30:00', 'confirmed', 950.00, 'online', 95),
(8, 3, '2025-02-14', '13:00:00', 'pending', 600.00, 'online', 0),
(9, 3, '2025-03-01', '18:00:00', 'confirmed', 1100.00, 'counter', 110),
(10, 3, '2025-03-10', '21:00:00', 'cancelled', 800.00, 'online', 0);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `description` text NOT NULL,
  `feedback_date` date NOT NULL,
  `feedback_time` time NOT NULL,
  `feedback_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `user_id`, `movie_id`, `rating`, `description`, `feedback_date`, `feedback_time`, `feedback_status`) VALUES
(1, 2, 1, 4, 'A fantastic sequel that lives up to the original! Great performances and witty dialogue.', '2025-01-11', '12:00:00', 'approved'),
(2, 2, 2, 5, 'A masterfully crafted biography. Truly inspiring and emotionally powerful.', '2025-01-19', '15:00:00', 'approved'),
(3, 2, 3, 3, 'Decent horror experience but the story felt a bit predictable. The atmosphere was great though.', '2025-02-06', '10:30:00', 'approved'),
(4, 2, 4, 5, 'Absolutely mind-blowing! Best sci-fi film in years. Kept me on the edge of my seat the entire time.', '2025-03-04', '09:00:00', 'approved'),
(5, 3, 1, 4, 'Loved the fashion, drama, and humor. A worthy follow-up to the first film.', '2025-01-13', '17:30:00', 'approved'),
(6, 3, 4, 5, 'Stunning visuals and a gripping storyline. A must-watch for sci-fi fans.', '2025-03-02', '19:00:00', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `membership_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `membership_type` varchar(30) NOT NULL,
  `membership_status` varchar(20) NOT NULL,
  `total_loyalty_points` int(11) NOT NULL,
  `discount_percentage` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`membership_id`, `user_id`, `membership_type`, `membership_status`, `total_loyalty_points`, `discount_percentage`) VALUES
(1, 2, 'Elite', 'Active', 10000, 0.00),
(2, 3, 'Elite', 'Active', 100, 0.00),
(3, 4, 'STARTER', 'Active', 0, 0.00);

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

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_id`, `movie_name`, `duration`, `director`, `genre`, `movie_language`, `description`, `release_date`, `movie_status`, `age_rating`) VALUES
(1, 'The Devil Wears Prada 2', 135, 'TBD', 'Comedy', 'English', 'Sequel to the iconic fashion drama.', '2026-05-01', 'NOW_SHOWING', 'PG'),
(2, 'Michael', 125, 'TBD', 'Biography', 'English', 'A biographical film based on a legendary figure.', '2026-05-01', 'NOW_SHOWING', 'PG'),
(3, 'Bhoot Bangla', 160, 'TBD', 'Horror', 'Hindi', 'A horror story set in a haunted mansion.', '2026-05-18', 'NOW_SHOWING', 'PG'),
(4, 'Project Hail Mary', 150, 'TBD', 'Sci-Fi', 'English', 'A lone astronaut attempts to save humanity.', '2026-05-17', 'NOW_SHOWING', 'PG'),
(5, 'The Odyssey', 180, 'TBD', 'Action', 'English', 'An epic journey inspired by the Greek classic.', '2026-07-17', 'COMING_SOON', 'PG'),
(6, 'Spider Man: Brand New Day', 190, 'TBD', 'Action', 'English', 'A new chapter in Spider-Man’s story.', '2026-07-31', 'COMING_SOON', 'PG'),
(7, 'Insidious: Out of the Further', 155, 'TBD', 'Horror', 'English', 'A terrifying return to the Further.', '2026-08-21', 'COMING_SOON', 'ADULT'),
(8, 'Drishyam 3', 175, 'TBD', 'Thriller', 'Hindi', 'Continuation of the gripping Drishyam saga.', '2026-10-02', 'COMING_SOON', 'PG');

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

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `booking_id`, `payment_method`, `payment_amount`, `payment_date`, `payment_time`, `payment_status`) VALUES
(1, 1, 'Credit Card', 850.00, '2025-01-10', '10:25:00', 'completed'),
(2, 2, 'UPI', 1200.00, '2025-01-18', '14:10:00', 'pending'),
(3, 3, 'Cash', 500.00, '2025-02-05', '08:55:00', 'completed'),
(4, 4, 'Debit Card', 650.00, '2025-02-20', '19:40:00', 'completed'),
(5, 5, 'UPI', 1500.00, '2025-03-03', '10:55:00', 'completed'),
(6, 6, 'Credit Card', 700.00, '2025-01-12', '15:55:00', 'completed'),
(7, 7, 'Net Banking', 950.00, '2025-01-25', '20:25:00', 'completed'),
(8, 8, 'UPI', 600.00, '2025-02-14', '12:55:00', 'pending'),
(9, 9, 'Credit Card', 1100.00, '2025-03-01', '17:55:00', 'completed'),
(10, 10, 'UPI', 800.00, '2025-03-10', '20:55:00', 'refunded');

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

--
-- Dumping data for table `screen`
--

INSERT INTO `screen` (`screen_id`, `theatre_id`, `screen_name`, `screen_type`, `screen_status`, `total_capacity`, `base_price`) VALUES
(1, 1, 'Screen 1', 'IMAX', 'active', 150, 500.00),
(2, 1, 'Screen 2', '4DX', 'active', 100, 450.00),
(3, 1, 'Screen 3', 'Standard', 'active', 200, 250.00),
(4, 2, 'Screen 1', 'IMAX', 'active', 120, 480.00),
(5, 2, 'Screen 2', 'Standard', 'active', 180, 230.00);

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

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`seat_id`, `screen_id`, `seat_number`, `row_number`, `seat_type`, `seat_status`) VALUES
(1, 1, 'A1', 'A', 'VIP', 'available'),
(2, 1, 'A2', 'A', 'VIP', 'available'),
(3, 1, 'A3', 'A', 'Premium', 'available'),
(4, 1, 'A4', 'A', 'Premium', 'available'),
(5, 1, 'B1', 'B', 'Standard', 'available'),
(6, 2, 'A1', 'A', 'VIP', 'available'),
(7, 2, 'A2', 'A', 'VIP', 'available'),
(8, 2, 'A3', 'A', 'Premium', 'available'),
(9, 2, 'B1', 'B', 'Standard', 'available'),
(10, 2, 'B2', 'B', 'Standard', 'available'),
(11, 3, 'A1', 'A', 'Standard', 'available'),
(12, 3, 'A2', 'A', 'Standard', 'available'),
(13, 3, 'A3', 'A', 'Premium', 'available'),
(14, 3, 'B1', 'B', 'Standard', 'available'),
(15, 3, 'B2', 'B', 'Standard', 'available'),
(16, 4, 'A1', 'A', 'VIP', 'available'),
(17, 4, 'A2', 'A', 'VIP', 'available'),
(18, 4, 'A3', 'A', 'Premium', 'available'),
(19, 4, 'B1', 'B', 'Standard', 'available'),
(20, 4, 'B2', 'B', 'Standard', 'available'),
(21, 5, 'A1', 'A', 'Standard', 'available'),
(22, 5, 'A2', 'A', 'Standard', 'available'),
(23, 5, 'A3', 'A', 'Premium', 'available'),
(24, 5, 'B1', 'B', 'Standard', 'available'),
(25, 5, 'B2', 'B', 'Standard', 'available');

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

--
-- Dumping data for table `showtime`
--

INSERT INTO `showtime` (`showtime_id`, `screen_id`, `movie_id`, `show_date`, `start_time`, `end_time`, `show_status`, `show_type`) VALUES
(1, 1, 1, '2026-05-16', '10:00:00', '12:15:00', 'ACTIVE', 'IMAX'),
(2, 1, 2, '2026-05-16', '13:30:00', '15:35:00', 'ACTIVE', 'IMAX'),
(3, 2, 3, '2026-05-16', '11:00:00', '13:40:00', 'ACTIVE', '4DX'),
(4, 3, 4, '2026-05-16', '14:00:00', '16:30:00', 'ACTIVE', 'Standard'),
(5, 4, 1, '2026-05-17', '10:30:00', '12:45:00', 'ACTIVE', 'IMAX'),
(6, 5, 2, '2026-05-17', '15:00:00', '17:05:00', 'ACTIVE', 'Standard'),
(7, 5, 2, '2026-05-18', '13:00:00', '15:05:00', 'ACTIVE', 'Standard'),
(8, 4, 2, '2026-05-18', '12:00:00', '16:05:00', 'ACTIVE', 'IMAX');

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

--
-- Dumping data for table `theatre`
--

INSERT INTO `theatre` (`theatre_id`, `theatre_name`, `city`, `email`, `contact_number`, `total_screens`, `theatre_status`) VALUES
(1, 'Cinosphere Prime', 'Kathmandu', 'prime@cinosphere.com', '9849832584', 3, 'active'),
(2, 'Cinosphere Central', 'Pokhara', 'central@cinosphere.com', '9849832584', 2, 'active');

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
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `booking_id`, `showtime_id`, `seat_id`, `ticket_type`, `ticket_status`, `issue_date`, `ticket_price`) VALUES
(1, 1, 1, 1, 'VIP', 'confirmed', '2025-01-10', 425.00),
(2, 1, 1, 2, 'VIP', 'confirmed', '2025-01-10', 425.00),
(3, 2, 2, 3, 'PREMIUM', 'pending', '2025-01-18', 400.00),
(4, 2, 2, 4, 'PREMIUM', 'pending', '2025-01-18', 400.00),
(5, 2, 2, 5, 'REGULAR', 'pending', '2025-01-18', 400.00),
(6, 3, 3, 6, 'VIP', 'archive', '2025-02-05', 500.00),
(7, 4, 4, 11, 'REGULAR', 'confirmed', '2025-02-20', 325.00),
(8, 4, 4, 12, 'REGULAR', 'confirmed', '2025-02-20', 325.00),
(9, 5, 5, 16, 'VIP', 'confirmed', '2025-03-03', 500.00),
(10, 5, 5, 17, 'VIP', 'confirmed', '2025-03-03', 500.00),
(11, 5, 5, 18, 'PREMIUM', 'confirmed', '2025-03-03', 500.00),
(12, 6, 1, 3, 'PREMIUM', 'confirmed', '2025-01-12', 350.00),
(13, 6, 1, 4, 'PREMIUM', 'confirmed', '2025-01-12', 350.00),
(14, 7, 2, 1, 'VIP', 'confirmed', '2025-01-25', 475.00),
(15, 7, 2, 2, 'VIP', 'confirmed', '2025-01-25', 475.00),
(16, 8, 3, 7, 'VIP', 'pending', '2025-02-14', 600.00),
(17, 9, 4, 13, 'PREMIUM', 'confirmed', '2025-03-01', 550.00),
(18, 9, 4, 14, 'PREMIUM', 'confirmed', '2025-03-01', 550.00),
(19, 10, 6, 21, 'REGULAR', 'cancelled', '2025-03-10', 400.00),
(20, 10, 6, 22, 'REGULAR', 'cancelled', '2025-03-10', 400.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `hash_password` varchar(255) NOT NULL,
  `registration_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `user_role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `username`, `email`, `date_of_birth`, `gender`, `hash_password`, `registration_date`, `is_active`, `user_role`) VALUES
(2, 'Aditya', 'Raut', 'user', 'user@gmail.com', '2026-05-02', 'other', '$2a$10$FN0uBcB3jJpeDOoMKPjrsOu9G/0qsQb4pDyjvtUTx5ldJRNRV7Km2', '2026-05-03', 0, 'CUSTOMER'),
(3, 'Raunit', 'Giri', 'admin', 'admin@gmail.com', '2026-05-02', 'other', '$2a$10$jQL7T18UfniO7u.ww89tveroj6aErLvP.6Gd.lYIQe5C7Enye8hN6', '2026-05-03', 1, 'ADMIN'),
(4, 'Raunit', 'Giri', 'RAWunit', 'raunit06@gmail.com', '2026-04-27', 'male', '$2a$10$0o00Bpdaq9L5o4xn49MpaeNSnXgLgNWrhqgs0fpVFexHSsTKzW5Ea', '2026-05-04', 1, 'CUSTOMER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_booking_user` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `fk_feedback_user` (`user_id`),
  ADD KEY `fk_feedback_movie` (`movie_id`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`membership_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `membership_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `screen`
--
ALTER TABLE `screen`
  MODIFY `screen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `seat`
--
ALTER TABLE `seat`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `showtime`
--
ALTER TABLE `showtime`
  MODIFY `showtime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `theatre`
--
ALTER TABLE `theatre`
  MODIFY `theatre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_booking_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `fk_feedback_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_feedback_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `fk_membership_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
