-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 01, 2017 at 04:49 PM
-- Server version: 5.1.53
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `qw`
--

-- --------------------------------------------------------

--
-- Table structure for table `breakfast`
--

CREATE TABLE IF NOT EXISTS `breakfast` (
  `BType` varchar(20) NOT NULL,
  `HotelID` int(11) NOT NULL,
  `Description` varchar(30) NOT NULL,
  `BPrice` decimal(10,0) NOT NULL,
  PRIMARY KEY (`BType`,`HotelID`),
  KEY `HotelID` (`HotelID`),
  KEY `BType` (`BType`),
  KEY `HotelID_2` (`HotelID`),
  KEY `BType_2` (`BType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `breakfast`
--

INSERT INTO `breakfast` (`BType`, `HotelID`, `Description`, `BPrice`) VALUES
('American', 4, 'Fast Food ', '5'),
('American', 8, 'Fast Food ', '5'),
('Continental', 1, 'cuisine ', '40'),
('Continental', 3, 'cuisine ', '40'),
('Continental', 5, 'cuisine ', '40'),
('Continental', 6, 'cuisine ', '40'),
('Continental', 7, 'cuisine ', '40'),
('Continental', 9, 'cuisine ', '40'),
('Indian', 1, 'Spicy Indian Special', '35'),
('Indian', 6, 'Spicy Indian Special', '35'),
('Italian', 3, 'Pizza', '15'),
('Italian', 7, 'Pizza', '15'),
('Thai', 2, 'Special Thai Food', '35'),
('Thai', 5, 'Special Thai Food', '35'),
('Thai', 7, 'Special Thai Food', '35'),
('Thai', 10, 'Special Thai Food', '35');

-- --------------------------------------------------------

--
-- Table structure for table `breakfast_review`
--

CREATE TABLE IF NOT EXISTS `breakfast_review` (
  `RID` int(11) NOT NULL,
  `HotelID` int(11) NOT NULL,
  `BType` varchar(15) NOT NULL,
  `CID` varchar(10) NOT NULL,
  `Text` varchar(100) NOT NULL,
  `Rating` decimal(10,0) NOT NULL,
  PRIMARY KEY (`RID`),
  UNIQUE KEY `RID` (`RID`),
  UNIQUE KEY `HotelID_2` (`HotelID`),
  UNIQUE KEY `CID_3` (`CID`),
  KEY `HotelID` (`HotelID`),
  KEY `BType` (`BType`),
  KEY `CID` (`CID`),
  KEY `CID_2` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `breakfast_review`
--


-- --------------------------------------------------------

--
-- Table structure for table `credit_card`
--

CREATE TABLE IF NOT EXISTS `credit_card` (
  `CNumber` int(20) NOT NULL,
  `CType` varchar(15) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Baddress` varchar(30) NOT NULL,
  `Code` int(11) NOT NULL,
  `ExpDate` date NOT NULL,
  PRIMARY KEY (`CNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credit_card`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `CID` varchar(10) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `CName` varchar(25) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Phone_No` varchar(10) NOT NULL,
  `Email` varchar(20) NOT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--


-- --------------------------------------------------------

--
-- Table structure for table `discounted_room`
--

CREATE TABLE IF NOT EXISTS `discounted_room` (
  `HotelID` int(11) NOT NULL,
  `RoomNo` varchar(10) NOT NULL,
  `Discount` decimal(10,0) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  PRIMARY KEY (`HotelID`,`RoomNo`),
  KEY `HotelID` (`HotelID`),
  KEY `RoomNo` (`RoomNo`),
  KEY `RoomNo_2` (`RoomNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discounted_room`
--

INSERT INTO `discounted_room` (`HotelID`, `RoomNo`, `Discount`, `StartDate`, `EndDate`) VALUES
(1, '101', '5', '2017-01-01', '2017-02-01'),
(2, '102', '7', '2017-02-01', '2017-03-01'),
(3, '103', '9', '2017-03-01', '2017-04-01'),
(4, '101', '5', '2017-04-01', '2017-05-01'),
(5, '102', '7', '2017-05-01', '2017-06-01'),
(6, '103', '9', '2017-06-01', '2017-07-01'),
(7, '101', '5', '2017-07-01', '2017-08-01'),
(8, '102', '7', '2017-08-01', '2017-09-01'),
(9, '103', '9', '2017-09-01', '2017-10-01'),
(10, '101', '5', '2017-10-01', '2017-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE IF NOT EXISTS `hotel` (
  `HotelID` int(11) NOT NULL,
  `Street` varchar(30) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Zip` varchar(10) NOT NULL,
  `Country` varchar(20) NOT NULL,
  PRIMARY KEY (`HotelID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`HotelID`, `Street`, `State`, `Zip`, `Country`) VALUES
(1, '175 Beacon Ave', 'New Jersey', '7306', 'USA'),
(2, '100 Hepburn RD', 'Portland', '97214', 'USA'),
(3, '837 Hamilton Street', 'New York', '07032', 'USA'),
(4, '978 Stamford Ave', 'Florida', '07022', 'USA'),
(5, '8372 Harrison Ave', 'New Mexico', '06684', 'USA'),
(6, '77 bergen ave', 'West Virginia', '04729', 'USA'),
(7, '277 cress ave', 'Virginia', '07099', 'USA'),
(8, '173 Rodgers Street', 'Texas', '39474', 'USA'),
(9, '1923 Roger Street', 'Connecticut', '33474', 'USA'),
(10, '439 Davis Street', 'Washington', '43839', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `InvoiceNo` varchar(10) NOT NULL,
  `CID` varchar(10) NOT NULL,
  `CNumber` int(20) NOT NULL,
  `RDate` date NOT NULL,
  PRIMARY KEY (`InvoiceNo`),
  KEY `CID` (`CID`),
  KEY `Card_Number` (`CNumber`),
  KEY `CNumber` (`CNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--


-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `RoomNo` varchar(10) NOT NULL,
  `HotelID` int(11) NOT NULL,
  `Rtype` varchar(25) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `Description` varchar(30) NOT NULL,
  `Floor` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL,
  PRIMARY KEY (`RoomNo`,`HotelID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`RoomNo`, `HotelID`, `Rtype`, `Price`, `Description`, `Floor`, `Capacity`) VALUES
('101', 1, 'Single', '100', 'Single room for 1 person', 1, 1),
('101', 2, 'Single', '130', 'Single room for 1 person', 1, 1),
('101', 3, 'Single', '100', 'Single room for 1 person', 1, 1),
('101', 4, 'Single', '70', 'Single room for 1 person', 1, 1),
('101', 5, 'Single', '100', 'Single room for 1 person', 1, 1),
('101', 6, 'Single', '170', 'Single room for 1 person', 1, 1),
('101', 7, 'Single', '90', 'Single room for 1 person', 1, 1),
('101', 8, 'Single', '100', 'Single room for 1 person', 1, 1),
('101', 9, 'Single', '100', 'Single room for 1 person', 1, 1),
('101', 10, 'Single', '100', 'Single room for 1 person', 1, 1),
('102', 1, 'Single', '100', 'Single room for 1 person', 1, 1),
('102', 2, 'Single', '130', 'Single room for 1 person', 1, 1),
('102', 3, 'Single', '170', 'Single room for 1 person', 1, 1),
('102', 4, 'Single', '70', 'Single room for 1 person', 1, 1),
('102', 5, 'Single', '100', 'Single room for 1 person', 1, 1),
('102', 6, 'Single', '170', 'Single room for 1 person', 1, 1),
('102', 7, 'Single', '90', 'Single room for 1 person', 1, 1),
('102', 8, 'Single', '100', 'Single room for 1 person', 1, 1),
('102', 9, 'Single', '100', 'Single room for 1 person', 1, 1),
('102', 10, 'Single', '100', 'Single room for 1 person', 1, 1),
('103', 1, 'Single', '100', 'Single room for 1 person', 1, 1),
('103', 2, 'Single', '130', 'Single room for 1 person', 1, 1),
('103', 3, 'Single', '170', 'Single room for 1 person', 1, 1),
('103', 4, 'Single', '70', 'Single room for 1 person', 1, 1),
('103', 5, 'Single', '100', 'Single room for 1 person', 1, 1),
('103', 6, 'Single', '170', 'Single room for 1 person', 1, 1),
('103', 7, 'Single', '90', 'Single room for 1 person', 1, 1),
('103', 8, 'Single', '100', 'Single room for 1 person', 1, 1),
('103', 9, 'Single', '100', 'Single room for 1 person', 1, 1),
('103', 10, 'Single', '100', 'Single room for 1 person', 1, 1),
('104', 1, 'Single', '100', 'Single room for 1 person', 1, 1),
('104', 2, 'Single', '130', 'Single room for 1 person', 1, 1),
('104', 3, 'Single', '170', 'Single room for 1 person', 1, 1),
('104', 4, 'Single', '70', 'Single room for 1 person', 1, 1),
('104', 5, 'Single', '100', 'Single room for 1 person', 1, 1),
('104', 6, 'Single', '170', 'Single room for 1 person', 1, 1),
('104', 7, 'Single', '90', 'Single room for 1 person', 1, 1),
('104', 8, 'Single', '100', 'Single room for 1 person', 1, 1),
('104', 9, 'Single', '100', 'Single room for 1 person', 1, 1),
('104', 10, 'Single', '100', 'Single room for 1 person', 1, 1),
('105', 1, 'Single', '100', 'Single room for 1 person', 1, 1),
('105', 2, 'Single', '130', 'Single room for 1 person', 1, 1),
('105', 3, 'Single', '170', 'Single room for 1 person', 1, 1),
('105', 4, 'Single', '70', 'Single room for 1 person', 1, 1),
('105', 5, 'Single', '100', 'Single room for 1 person', 1, 1),
('105', 6, 'Single', '170', 'Single room for 1 person', 1, 1),
('105', 7, 'Single', '90', 'Single room for 1 person', 1, 1),
('105', 8, 'Single', '100', 'Single room for 1 person', 1, 1),
('105', 9, 'Single', '100', 'Single room for 1 person', 1, 1),
('105', 10, 'Single', '100', 'Single room for 1 person', 1, 1),
('201', 1, 'Double', '150', 'A room for 2 people', 2, 2),
('201', 2, 'Double', '200', 'A room for 2 people', 2, 2),
('201', 3, 'Double', '220', 'A room for 2 people', 2, 2),
('201', 4, 'Double', '120', 'A room for 2 people', 2, 2),
('201', 5, 'Double', '150', 'A room for 2 people', 2, 2),
('201', 6, 'Double', '200', 'A room for 2 people', 2, 2),
('201', 7, 'Double', '120', 'A room for 2 people', 2, 2),
('201', 8, 'Double', '150', 'A room for 2 people', 2, 2),
('201', 9, 'Double', '150', 'A room for 2 people', 2, 2),
('201', 10, 'Double', '150', 'A room for 2 people', 2, 2),
('202', 1, 'Double', '150', 'A room for 2 people', 2, 2),
('202', 2, 'Double', '200', 'A room for 2 people', 2, 2),
('202', 3, 'Double', '220', 'A room for 2 people', 2, 2),
('202', 4, 'Double', '120', 'A room for 2 people', 2, 2),
('202', 5, 'Double', '150', 'A room for 2 people', 2, 2),
('202', 6, 'Double', '200', 'A room for 2 people', 2, 2),
('202', 7, 'Double', '120', 'A room for 2 people', 2, 2),
('202', 8, 'Double', '150', 'A room for 2 people', 2, 2),
('202', 9, 'Double', '150', 'A room for 2 people', 2, 2),
('202', 10, 'Double', '150', 'A room for 2 people', 2, 2),
('203', 1, 'Double', '150', 'A room for 2 people', 2, 2),
('203', 2, 'Double', '200', 'A room for 2 people', 2, 2),
('203', 3, 'Double', '220', 'A room for 2 people', 2, 2),
('203', 4, 'Double', '120', 'A room for 2 people', 2, 2),
('203', 5, 'Double', '150', 'A room for 2 people', 2, 2),
('203', 6, 'Double', '200', 'A room for 2 people', 2, 2),
('203', 7, 'Double', '120', 'A room for 2 people', 2, 2),
('203', 8, 'Double', '150', 'A room for 2 people', 2, 2),
('203', 9, 'Double', '150', 'A room for 2 people', 2, 2),
('203', 10, 'Double', '150', 'A room for 2 people', 2, 2),
('301', 1, 'Deluxe', '250', 'Deluxe Room having all facilit', 3, 2),
('301', 2, 'Deluxe', '250', 'Deluxe Room having all facilit', 3, 2),
('301', 3, 'Deluxe', '360', 'Deluxe Room having all facilit', 3, 2),
('301', 4, 'Deluxe', '210', 'Deluxe Room having all facilit', 3, 2),
('301', 5, 'Deluxe', '250', 'Deluxe Room having all facilit', 3, 2),
('301', 6, 'Deluxe', '450', 'Deluxe Room having all facilit', 3, 2),
('301', 7, 'Deluxe', '250', 'Deluxe Room having all facilit', 3, 2),
('301', 8, 'Deluxe', '250', 'Deluxe Room having all facilit', 3, 2),
('301', 9, 'Deluxe', '250', 'Deluxe Room having all facilit', 3, 2),
('301', 10, 'Deluxe', '250', 'Deluxe Room having all facilit', 3, 2),
('302', 1, 'Deluxe', '250', 'Deluxe Room having all facilit', 3, 2),
('302', 2, 'Deluxe', '250', 'Deluxe Room having all facilit', 3, 2),
('302', 3, 'Deluxe', '360', 'Deluxe Room having all facilit', 3, 2),
('302', 4, 'Deluxe', '210', 'Deluxe Room having all facilit', 3, 2),
('302', 5, 'Deluxe', '250', 'Deluxe Room having all facilit', 3, 2),
('302', 6, 'Deluxe', '450', 'Deluxe Room having all facilit', 3, 2),
('302', 7, 'Deluxe', '250', 'Deluxe Room having all facilit', 3, 2),
('302', 8, 'Deluxe', '250', 'Deluxe Room having all facilit', 3, 2),
('302', 9, 'Deluxe', '250', 'Deluxe Room having all facilit', 3, 2),
('302', 10, 'Deluxe', '250', 'Deluxe Room having all facilit', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `room_reservation`
--

CREATE TABLE IF NOT EXISTS `room_reservation` (
  `CheckInDate` date NOT NULL,
  `HotelID` int(11) NOT NULL,
  `InvoiceNo` varchar(10) NOT NULL,
  `RoomNo` varchar(10) NOT NULL,
  `CheckoutDate` date NOT NULL,
  PRIMARY KEY (`CheckInDate`,`HotelID`,`RoomNo`),
  KEY `HotelID` (`HotelID`),
  KEY `InvoiceNo` (`InvoiceNo`),
  KEY `RoomNo` (`RoomNo`),
  KEY `InvoiceNo_2` (`InvoiceNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_reservation`
--


-- --------------------------------------------------------

--
-- Table structure for table `room_review`
--

CREATE TABLE IF NOT EXISTS `room_review` (
  `RID` int(11) NOT NULL,
  `HotelID` int(11) NOT NULL,
  `RoomNo` varchar(10) NOT NULL,
  `CID` varchar(10) NOT NULL,
  `Rating` decimal(10,0) NOT NULL,
  `Text` varchar(100) NOT NULL,
  PRIMARY KEY (`RID`),
  UNIQUE KEY `RID` (`RID`),
  UNIQUE KEY `HotelID` (`HotelID`),
  UNIQUE KEY `CID` (`CID`),
  KEY `HotelID_2` (`HotelID`),
  KEY `RoomNo` (`RoomNo`),
  KEY `CID_2` (`CID`),
  KEY `RoomNo_2` (`RoomNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_review`
--


-- --------------------------------------------------------

--
-- Table structure for table `rresv_breakfast`
--

CREATE TABLE IF NOT EXISTS `rresv_breakfast` (
  `BType` varchar(20) NOT NULL,
  `HotelID` int(11) NOT NULL,
  `RoomNo` varchar(10) NOT NULL,
  `CheckInDate` date NOT NULL,
  `NoofOrders` int(11) NOT NULL,
  KEY `BType` (`BType`),
  KEY `HotelID` (`HotelID`),
  KEY `RoomNo` (`RoomNo`),
  KEY `CheckInDate` (`CheckInDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rresv_breakfast`
--


-- --------------------------------------------------------

--
-- Table structure for table `rresv_service`
--

CREATE TABLE IF NOT EXISTS `rresv_service` (
  `SType` varchar(20) NOT NULL,
  `HotelID` int(11) NOT NULL,
  `RoomNo` varchar(10) NOT NULL,
  `CheckInDate` date NOT NULL,
  KEY `SType` (`SType`),
  KEY `HotelID` (`HotelID`),
  KEY `RoomNo` (`RoomNo`),
  KEY `CheckInDate` (`CheckInDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rresv_service`
--


-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `SType` varchar(20) NOT NULL,
  `HotelID` int(11) NOT NULL,
  `SPrice` decimal(10,0) NOT NULL,
  PRIMARY KEY (`SType`,`HotelID`),
  KEY `HotelID` (`HotelID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`SType`, `HotelID`, `SPrice`) VALUES
('Airport Drop-off', 1, '35'),
('Airport Drop-off', 2, '25'),
('Airport Drop-off', 3, '50'),
('Airport Drop-off', 4, '50'),
('Airport Drop-off', 6, '25'),
('Airport Drop-off', 9, '35'),
('Airport Pick-up', 1, '35'),
('Airport Pick-up', 2, '25'),
('Airport Pick-up', 3, '50'),
('Airport Pick-up', 4, '50'),
('Airport Pick-up', 6, '25'),
('Airport Pick-up', 9, '35'),
('Game-Room', 7, '150'),
('Laundry', 3, '10'),
('Laundry', 5, '50'),
('Laundry', 8, '20'),
('Laundry', 10, '25'),
('Swimming Pool', 8, '180'),
('Taxi-Service', 4, '100'),
('Taxi-Service', 10, '120');

-- --------------------------------------------------------

--
-- Table structure for table `service_review`
--

CREATE TABLE IF NOT EXISTS `service_review` (
  `RID` int(11) NOT NULL,
  `HotelID` int(11) NOT NULL,
  `SType` varchar(20) NOT NULL,
  `CID` varchar(10) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Text` varchar(100) NOT NULL,
  PRIMARY KEY (`RID`),
  UNIQUE KEY `HotelID_2` (`HotelID`),
  UNIQUE KEY `RID` (`RID`),
  UNIQUE KEY `CID_2` (`CID`),
  KEY `HotelID` (`HotelID`,`SType`,`CID`),
  KEY `SType` (`SType`),
  KEY `CID` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_review`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `breakfast`
--
ALTER TABLE `breakfast`
  ADD CONSTRAINT `Breakfast_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `breakfast_review`
--
ALTER TABLE `breakfast_review`
  ADD CONSTRAINT `Breakfast_Review_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `breakfast` (`HotelID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Breakfast_Review_ibfk_2` FOREIGN KEY (`BType`) REFERENCES `breakfast` (`BType`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Breakfast_Review_ibfk_3` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`) ON UPDATE CASCADE;

--
-- Constraints for table `discounted_room`
--
ALTER TABLE `discounted_room`
  ADD CONSTRAINT `Discounted_Room_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Discounted_Room_ibfk_2` FOREIGN KEY (`RoomNo`) REFERENCES `room` (`RoomNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`CNumber`) REFERENCES `credit_card` (`CNumber`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room_reservation`
--
ALTER TABLE `room_reservation`
  ADD CONSTRAINT `Room_Reservation_ibfk_2` FOREIGN KEY (`InvoiceNo`) REFERENCES `reservation` (`InvoiceNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Room_Reservation_ibfk_3` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Room_Reservation_ibfk_4` FOREIGN KEY (`RoomNo`) REFERENCES `room` (`RoomNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room_review`
--
ALTER TABLE `room_review`
  ADD CONSTRAINT `Room_Review_ibfk_1` FOREIGN KEY (`RoomNo`) REFERENCES `room` (`RoomNo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Room_Review_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Room_Review_ibfk_3` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`);

--
-- Constraints for table `rresv_breakfast`
--
ALTER TABLE `rresv_breakfast`
  ADD CONSTRAINT `RResv_Breakfast_ibfk_1` FOREIGN KEY (`BType`) REFERENCES `breakfast` (`BType`) ON UPDATE CASCADE,
  ADD CONSTRAINT `RResv_Breakfast_ibfk_2` FOREIGN KEY (`HotelID`) REFERENCES `room_reservation` (`HotelID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `RResv_Breakfast_ibfk_3` FOREIGN KEY (`RoomNo`) REFERENCES `room_reservation` (`RoomNo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `RResv_Breakfast_ibfk_4` FOREIGN KEY (`CheckInDate`) REFERENCES `room_reservation` (`CheckInDate`) ON UPDATE CASCADE;

--
-- Constraints for table `rresv_service`
--
ALTER TABLE `rresv_service`
  ADD CONSTRAINT `RResv_Service_ibfk_1` FOREIGN KEY (`SType`) REFERENCES `service` (`SType`) ON UPDATE CASCADE,
  ADD CONSTRAINT `RResv_Service_ibfk_2` FOREIGN KEY (`HotelID`) REFERENCES `room_reservation` (`HotelID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `RResv_Service_ibfk_3` FOREIGN KEY (`RoomNo`) REFERENCES `room_reservation` (`RoomNo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `RResv_Service_ibfk_4` FOREIGN KEY (`CheckInDate`) REFERENCES `room_reservation` (`CheckInDate`) ON UPDATE CASCADE;

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `Service_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service_review`
--
ALTER TABLE `service_review`
  ADD CONSTRAINT `Service_Review_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `service` (`HotelID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Service_Review_ibfk_2` FOREIGN KEY (`SType`) REFERENCES `service` (`SType`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Service_Review_ibfk_3` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`) ON UPDATE CASCADE;
