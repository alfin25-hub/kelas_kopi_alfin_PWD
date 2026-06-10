-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2026 at 04:20 AM
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
-- Database: `kelas_kopi_alfin`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `price`) VALUES
(1, 'Basic Class', 'Belajar mengenal kopi dan menyeduh secara aesthetic', 150000),
(2, 'Coffee Art Pemula', 'Belajar membuat art di atas kopi', 250000),
(3, 'Advanced Class', 'Kelas advanced untuk seni di atas kopi selama 3 jam', 450000),
(4, 'Anime Coffee', 'Membuat seni anime di atas kopi', 500000);

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `course_id` int(11) NOT NULL,
  `participant_count` int(11) NOT NULL,
  `unit_price` double NOT NULL,
  `is_followed_up` tinyint(1) NOT NULL DEFAULT 0,
  `followed_up_by` int(11) DEFAULT NULL,
  `followed_up_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `full_name`, `email`, `phone_number`, `course_id`, `participant_count`, `unit_price`, `is_followed_up`, `followed_up_by`, `followed_up_at`, `created_at`) VALUES
(1, 'Alfin', 'alfin25@itbss.ac.id', '08123456789', 1, 2, 0, 0, NULL, NULL, '2026-06-05 15:49:57'),
(2, 'Doni', 'Doni@gmail.com', '081122344554', 4, 2, 0, 0, NULL, NULL, '2026-06-07 12:46:57'),
(3, 'Alfin', 'alfin25@itbss.ac.id', '08123456789', 3, 2, 0, 0, NULL, NULL, '2026-06-09 02:06:15');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'admin2', '0192023a7bbd73250516f069df18b500');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `followed_up_by` (`followed_up_by`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `registrations_ibfk_2` FOREIGN KEY (`followed_up_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `registrations_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `registrations_ibfk_4` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `registrations_ibfk_5` FOREIGN KEY (`followed_up_by`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
