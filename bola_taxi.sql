-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2019 at 06:18 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bola_taxi`
--

-- --------------------------------------------------------

--
-- Table structure for table `accepted_requests`
--

CREATE TABLE `accepted_requests` (
  `driver_id` int(11) DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `completed_request`
--

CREATE TABLE `completed_request` (
  `completed_request_id` int(10) NOT NULL,
  `t_id` int(10) DEFAULT NULL,
  `u_id` int(10) DEFAULT NULL,
  `origin` varchar(30) DEFAULT NULL,
  `destination` varchar(30) DEFAULT NULL,
  `completed_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `completed_request`
--

INSERT INTO `completed_request` (`completed_request_id`, `t_id`, `u_id`, `origin`, `destination`, `completed_time`) VALUES
(1, 5, 3, 'Kathmandu', 'Bhaktapur', '2019-06-21 00:00:00'),
(2, 5, 3, 'Bhaktapur', 'Kathmandu', '2019-06-19 00:00:00'),
(3, 5, 3, 'Bhaktapur', 'Kathmandu', '2019-06-19 00:00:00'),
(4, 5, 3, 'Bhaktapur', 'Kathmandu', '2019-06-19 00:00:00'),
(5, 5, 3, 'Bhaktapur', 'Kathmandu', '2019-06-19 00:00:00'),
(6, 5, 3, 'Bhaktapur', 'Kathmandu', '2019-06-19 00:00:00'),
(7, 5, 3, 'Bhaktapur', 'Kathmandu', '2019-06-19 00:00:00'),
(8, 5, 3, 'Bhaktapur', 'Kathmandu', '2019-06-19 00:00:00'),
(9, 5, 3, 'Bhaktapur', 'Kathmandu', '2019-06-19 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `d_id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `current_loc` int(20) DEFAULT NULL,
  `taxi_id` int(10) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `review_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`d_id`, `name`, `phone`, `password`, `current_loc`, `taxi_id`, `gender`, `review_id`) VALUES
(5, 'Roshan', '9843418330', 'asdf', NULL, NULL, 'Male', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `l_id` int(20) NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(10) NOT NULL,
  `u_id` int(10) DEFAULT NULL,
  `origin` varchar(30) DEFAULT NULL,
  `destination` varchar(30) DEFAULT NULL,
  `request_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(10) NOT NULL,
  `review_date` datetime DEFAULT NULL,
  `review_star` int(1) DEFAULT NULL,
  `review_comment` varchar(8000) DEFAULT NULL,
  `reviewer_id` int(5) DEFAULT NULL,
  `reviewer_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ride`
--

CREATE TABLE `ride` (
  `r_id` int(10) NOT NULL,
  `started_time` datetime DEFAULT NULL,
  `d_id` int(10) DEFAULT NULL,
  `t_id` int(10) DEFAULT NULL,
  `origin` varchar(30) DEFAULT NULL,
  `destination` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `taxi_info`
--

CREATE TABLE `taxi_info` (
  `t_id` int(5) NOT NULL,
  `taxi_no` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `taxi_info`
--

INSERT INTO `taxi_info` (`t_id`, `taxi_no`, `status`) VALUES
(5, '2312', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `current_loc` int(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `review_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `name`, `phone`, `password`, `current_loc`, `gender`, `review_id`) VALUES
(3, 'asd', 'asd', 'asd', NULL, 'asd', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accepted_requests`
--
ALTER TABLE `accepted_requests`
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `completed_request`
--
ALTER TABLE `completed_request`
  ADD PRIMARY KEY (`completed_request_id`),
  ADD KEY `t_id` (`t_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`d_id`),
  ADD KEY `taxi_id` (`taxi_id`),
  ADD KEY `review_id` (`review_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`l_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `reviewer_id` (`reviewer_id`);

--
-- Indexes for table `ride`
--
ALTER TABLE `ride`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `d_id` (`d_id`),
  ADD KEY `t_id` (`t_id`);

--
-- Indexes for table `taxi_info`
--
ALTER TABLE `taxi_info`
  ADD PRIMARY KEY (`t_id`),
  ADD UNIQUE KEY `taxi_no` (`taxi_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`),
  ADD KEY `review_id` (`review_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `completed_request`
--
ALTER TABLE `completed_request`
  MODIFY `completed_request_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `d_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ride`
--
ALTER TABLE `ride`
  MODIFY `r_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxi_info`
--
ALTER TABLE `taxi_info`
  MODIFY `t_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accepted_requests`
--
ALTER TABLE `accepted_requests`
  ADD CONSTRAINT `accepted_requests_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`d_id`),
  ADD CONSTRAINT `accepted_requests_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`);

--
-- Constraints for table `completed_request`
--
ALTER TABLE `completed_request`
  ADD CONSTRAINT `completed_request_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `taxi_info` (`t_id`),
  ADD CONSTRAINT `completed_request_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`);

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`taxi_id`) REFERENCES `taxi_info` (`t_id`),
  ADD CONSTRAINT `drivers_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`u_id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`reviewer_id`) REFERENCES `drivers` (`d_id`);

--
-- Constraints for table `ride`
--
ALTER TABLE `ride`
  ADD CONSTRAINT `ride_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `drivers` (`d_id`),
  ADD CONSTRAINT `ride_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `taxi_info` (`t_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
