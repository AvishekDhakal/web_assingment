-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 17, 2023 at 01:39 PM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `The_Gaming_Club`
--

-- --------------------------------------------------------

--
-- Table structure for table `Bookings`
--

CREATE TABLE `Bookings` (
  `BookingID` int(11) NOT NULL,
  `SessionID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Member` varchar(15) NOT NULL,
  `Fee` int(11) DEFAULT NULL,
  `Pre_paid` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Bookings`
--

INSERT INTO `Bookings` (`BookingID`, `SessionID`, `CustomerID`, `Date`, `Member`, `Fee`, `Pre_paid`) VALUES
(1, 1, 1, '2021-05-14', 'Standard', NULL, NULL),
(2, 1, 2, '2021-05-14', 'Standard', 100, 'N'),
(3, 1, 3, '2021-05-14', 'Premium', 90, 'Y'),
(4, 1, 4, '2021-05-21', 'Standard', 100, 'N'),
(5, 2, 3, '2021-05-14', 'Premium', 45, 'N'),
(6, 4, 2, '2021-05-06', 'Premium', 45, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `Consoles`
--

CREATE TABLE `Consoles` (
  `ConsoleID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `PEGI` varchar(5) NOT NULL,
  `Console` varchar(20) NOT NULL,
  `ConsoleQty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Consoles`
--

INSERT INTO `Consoles` (`ConsoleID`, `Name`, `PEGI`, `Console`, `ConsoleQty`) VALUES
(1, 'PS1', 'PG', 'PS1', 3),
(2, 'PS2', 'PG', 'PS2', 2),
(3, 'PS4', 'PG', 'PS4', 3),
(4, 'PS2', 'PG', 'PS2', 2),
(5, 'Nintendo Switch', 'PG', 'Nintendo Switch', 2),
(6, 'X Box 360', '15', 'X Box 360', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `MemberType` varchar(20) NOT NULL,
  `MembershipFee` int(11) NOT NULL,
  `JoinDate` date NOT NULL,
  `DateOfBirth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`CustomerID`, `FirstName`, `LastName`, `Address`, `MemberType`, `MembershipFee`, `JoinDate`, `DateOfBirth`) VALUES
(1, 'Manoj', 'Tamang', 'Dillibazar, Kathamandu', 'Standard', 100, '2021-02-01', '1999-03-01'),
(2, 'Sony', 'Gurung', 'Putalisadak, Kathamandu', 'Premium', 1650, '2021-03-25', '2002-02-14'),
(3, 'Hemant', 'Puri', 'Maitedevi, Kathamndu', 'Premium', 1650, '2021-01-30', '1999-04-25'),
(4, 'Hitesh', 'Magar', 'Gyaneshwor, Kathamndu', 'Standard', 100, '2021-02-05', '1970-02-14');

-- --------------------------------------------------------

--
-- Table structure for table `Floor`
--

CREATE TABLE `Floor` (
  `FloorID` int(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Floor`
--

INSERT INTO `Floor` (`FloorID`, `Price`) VALUES
(1, 100),
(2, 50);

-- --------------------------------------------------------

--
-- Table structure for table `Game`
--

CREATE TABLE `Game` (
  `GameID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `PEGI` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Game`
--

INSERT INTO `Game` (`GameID`, `Name`, `PEGI`) VALUES
(1, 'Spiro', 'PG'),
(2, 'Spiro', 'PG'),
(3, 'Crash Bandicoot', 'PG'),
(4, 'Crash Bandicoot', 'PG'),
(5, 'Legend of Zelda', 'PG'),
(6, 'Halo 3', '15');

-- --------------------------------------------------------

--
-- Table structure for table `Machines`
--

CREATE TABLE `Machines` (
  `MachineNumber` int(11) NOT NULL,
  `Game` varchar(20) NOT NULL,
  `Year` int(11) NOT NULL,
  `Floor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Machines`
--

INSERT INTO `Machines` (`MachineNumber`, `Game`, `Year`, `Floor`) VALUES
(13, 'Poker', 2002, 2),
(23, 'Space Invader', 2001, 1),
(45, 'Mario', 2004, 2),
(75, 'Phoenix', 2000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `MembershipType`
--

CREATE TABLE `MembershipType` (
  `MembershipTypeID` int(11) NOT NULL,
  `MembershipType` varchar(20) NOT NULL,
  `Fee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MembershipType`
--

INSERT INTO `MembershipType` (`MembershipTypeID`, `MembershipType`, `Fee`) VALUES
(1, 'Standard', 100),
(2, 'Premium', 1650);

-- --------------------------------------------------------

--
-- Table structure for table `Pivot`
--

CREATE TABLE `Pivot` (
  `PivotID` int(11) NOT NULL,
  `GameID` int(11) NOT NULL,
  `ConsoleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pivot`
--

INSERT INTO `Pivot` (`PivotID`, `GameID`, `ConsoleID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `SessionConsoles`
--

CREATE TABLE `SessionConsoles` (
  `SessionConsolesID` int(11) NOT NULL,
  `SessionID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `ConsoleID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SessionConsoles`
--

INSERT INTO `SessionConsoles` (`SessionConsolesID`, `SessionID`, `Date`, `ConsoleID`, `Qty`) VALUES
(1, 1, '2021-05-14', 1, 2),
(2, 2, '2021-05-14', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Sessions`
--

CREATE TABLE `Sessions` (
  `SessionID` int(11) NOT NULL,
  `SessionDay` varchar(20) NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `SessionType` varchar(20) NOT NULL,
  `Floor` int(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Sessions`
--

INSERT INTO `Sessions` (`SessionID`, `SessionDay`, `StartTime`, `EndTime`, `SessionType`, `Floor`, `Price`) VALUES
(1, 'Sunday', '11:00:00', '18:00:00', 'Freeplay', 1, 50),
(2, 'Sunday', '11:00:00', '18:00:00', 'Freeplay', 2, 50),
(3, 'Saturday', '11:00:00', '18:00:00', 'Freeplay', 1, 50),
(4, 'Monday', '18:00:00', '21:00:00', 'Special', 2, 75);

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE `Staff` (
  `StaffID` int(11) NOT NULL,
  `StaffName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`StaffID`, `StaffName`) VALUES
(1, 'Kiran Rana'),
(2, 'Sudeep Koirala'),
(3, 'Ramesh Maharajan'),
(4, 'Pooja Mishra'),
(5, 'Jabbed Merza');

-- --------------------------------------------------------

--
-- Table structure for table `StaffDuty`
--

CREATE TABLE `StaffDuty` (
  `StaffDutyID` int(11) NOT NULL,
  `StaffID` int(11) NOT NULL,
  `SessionID` int(11) NOT NULL,
  `Role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `StaffDuty`
--

INSERT INTO `StaffDuty` (`StaffDutyID`, `StaffID`, `SessionID`, `Role`) VALUES
(1, 1, 1, 'Cafe'),
(2, 2, 1, 'Maintenance'),
(3, 3, 1, 'Counter'),
(4, 4, 2, 'Counter'),
(5, 5, 2, 'Maintenance');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Bookings`
--
ALTER TABLE `Bookings`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `SessionID` (`SessionID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `Consoles`
--
ALTER TABLE `Consoles`
  ADD PRIMARY KEY (`ConsoleID`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `Floor`
--
ALTER TABLE `Floor`
  ADD PRIMARY KEY (`FloorID`);

--
-- Indexes for table `Game`
--
ALTER TABLE `Game`
  ADD PRIMARY KEY (`GameID`);

--
-- Indexes for table `Machines`
--
ALTER TABLE `Machines`
  ADD PRIMARY KEY (`MachineNumber`);

--
-- Indexes for table `MembershipType`
--
ALTER TABLE `MembershipType`
  ADD PRIMARY KEY (`MembershipTypeID`);

--
-- Indexes for table `Pivot`
--
ALTER TABLE `Pivot`
  ADD PRIMARY KEY (`PivotID`),
  ADD KEY `GameID` (`GameID`),
  ADD KEY `ConsoleID` (`ConsoleID`);

--
-- Indexes for table `SessionConsoles`
--
ALTER TABLE `SessionConsoles`
  ADD PRIMARY KEY (`SessionConsolesID`),
  ADD KEY `SessionID` (`SessionID`),
  ADD KEY `ConsoleID` (`ConsoleID`);

--
-- Indexes for table `Sessions`
--
ALTER TABLE `Sessions`
  ADD PRIMARY KEY (`SessionID`);

--
-- Indexes for table `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indexes for table `StaffDuty`
--
ALTER TABLE `StaffDuty`
  ADD PRIMARY KEY (`StaffDutyID`),
  ADD KEY `StaffID` (`StaffID`),
  ADD KEY `SessionID` (`SessionID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Bookings`
--
ALTER TABLE `Bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `Sessions` (`SessionID`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`);

--
-- Constraints for table `Pivot`
--
ALTER TABLE `Pivot`
  ADD CONSTRAINT `pivot_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `Game` (`GameID`),
  ADD CONSTRAINT `pivot_ibfk_2` FOREIGN KEY (`ConsoleID`) REFERENCES `Consoles` (`ConsoleID`);

--
-- Constraints for table `SessionConsoles`
--
ALTER TABLE `SessionConsoles`
  ADD CONSTRAINT `sessionconsoles_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `Sessions` (`SessionID`),
  ADD CONSTRAINT `sessionconsoles_ibfk_2` FOREIGN KEY (`ConsoleID`) REFERENCES `Consoles` (`ConsoleID`);

--
-- Constraints for table `StaffDuty`
--
ALTER TABLE `StaffDuty`
  ADD CONSTRAINT `staffduty_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`),
  ADD CONSTRAINT `staffduty_ibfk_2` FOREIGN KEY (`SessionID`) REFERENCES `Sessions` (`SessionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
