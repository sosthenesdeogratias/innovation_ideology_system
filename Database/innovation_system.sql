-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2024 at 10:28 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `innovation_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `innovations`
--

CREATE TABLE `innovations` (
  `InnovationID` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `innovations`
--

INSERT INTO `innovations` (`InnovationID`, `Title`, `Description`, `ProjectID`, `CreatedBy`, `CreatedAt`) VALUES
(1, 'Smart Home Automation System.', 'This project involves creating a Smart Home Automation System using Internet of Things (IoT) technology. Students will explore the components and sensors involved in smart homes and learn how to integrate machine learning for personalized automation. The aim is to enhance home efficiency and user comfort through intelligent and interconnected devices.', 7, 1, '2024-02-03 10:47:22'),
(3, 'Intelligent Waste Management System', 'An Intelligent Waste Management System is definitely one of the important unique project ideas that utilizes advanced technologies and data analytics to optimize the collection, processing, and disposal of waste in a smarter and more efficient manner.\r\nIt integrates various components such as sensors, data management platforms, and decision-making algorithms to improve waste management processes.', 3, 2, '2024-02-22 04:21:29'),
(4, 'Augmented Reality Educational Tools', 'Augmented Reality (AR) educational tools in this unique project ideas list use the power of AR technology to enhance the learning experience by overlaying virtual objects, information, or interactive elements onto the real-world environment. These tools provide students with immersive and interactive educational experiences.', 13, 3, '2024-02-25 07:20:59');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `ProjectID` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`ProjectID`, `Title`, `Description`, `StartDate`, `EndDate`, `CreatedBy`, `CreatedAt`) VALUES
(3, 'Intelligent Waste Management System', 'An Intelligent Waste Management System is definitely one of the important unique project ideas that utilizes advanced technologies and data analytics to optimize the collection, processing, and disposal of waste in a smarter and more efficient manner.', '2024-02-18', '2024-02-16', NULL, '2024-02-03 21:14:55'),
(7, 'Smart Home Automation System', 'The Internet of Things (IoT) refers to the network of interconnected devices and objects that can communicate and exchange data. In a Smart Home Automation System, IoT plays a crucial role in connecting various devices to enhance automation and control.', '2024-02-06', '2024-02-13', 1, '2024-02-03 08:30:55'),
(13, 'Augmented Reality (AR) Navigation App', 'Augmented Reality (AR) overlays digital information onto the real world, enhancing the user’s perception and interaction with their environment. AR technology integrates computer-generated images or information with the user’s view of the real world in real time.', '2024-02-04', '2024-02-16', 2, '2024-02-03 21:09:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FirstName`, `LastName`, `Email`, `Password`, `CreatedAt`) VALUES
(1, 'Sosthenes', 'Doe', 'sosthenesdoe@gmail.com', 'password123', '2024-02-03 08:22:42'),
(2, 'owen', 'emanuel', 'owenemanuel@gmail.com', 'securepass', '2024-02-03 08:22:42'),
(3, 'Alice', 'Johnson', 'alicejohnson@gmail.com', 'userpass', '2024-02-03 08:22:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `innovations`
--
ALTER TABLE `innovations`
  ADD PRIMARY KEY (`InnovationID`),
  ADD KEY `ProjectID` (`ProjectID`),
  ADD KEY `CreatedBy` (`CreatedBy`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`ProjectID`),
  ADD KEY `CreatedBy` (`CreatedBy`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `innovations`
--
ALTER TABLE `innovations`
  MODIFY `InnovationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `ProjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `innovations`
--
ALTER TABLE `innovations`
  ADD CONSTRAINT `innovations_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`),
  ADD CONSTRAINT `innovations_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
