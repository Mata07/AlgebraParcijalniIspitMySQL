-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2022 at 03:54 PM
-- Server version: 8.0.31-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parcijalniIspitMySQL`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProsjekPlacaZaposlenika` ()  BEGIN
SELECT 
AVG(placa) `Prosjek plaća svih zaposlenika`
FROM place;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `odjeli`
--

CREATE TABLE `odjeli` (
  `odjelID` int UNSIGNED NOT NULL,
  `imeOdjela` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `odjeli`
--

INSERT INTO `odjeli` (`odjelID`, `imeOdjela`) VALUES
(1, 'Računovodstvo'),
(2, 'Prodaja'),
(3, 'Marketing');

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `placa` int UNSIGNED NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`zaposlenikID`, `placa`, `odDatuma`, `doDatuma`) VALUES
(1, 8000, '2020-01-01', '2022-11-11'),
(2, 9000, '2019-10-01', '2022-11-11'),
(3, 800, '2018-08-08', '2022-11-11'),
(4, 5800, '2020-06-06', '2022-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `radnoMjesto`
--

CREATE TABLE `radnoMjesto` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `radnoMjesto` varchar(255) NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `radnoMjesto`
--

INSERT INTO `radnoMjesto` (`zaposlenikID`, `radnoMjesto`, `odDatuma`, `doDatuma`) VALUES
(1, 'tajnica', '2020-02-01', '2022-11-01'),
(2, 'direktor', '2018-03-03', '2022-11-01'),
(3, 'knjigovođa', '2019-06-03', '2022-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `voditeljOdjela`
--

CREATE TABLE `voditeljOdjela` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `odjelID` int UNSIGNED NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `voditeljOdjela`
--

INSERT INTO `voditeljOdjela` (`zaposlenikID`, `odjelID`, `odDatuma`, `doDatuma`) VALUES
(1, 3, '2012-12-12', '2022-11-30'),
(2, 2, '2012-12-12', '2022-11-30'),
(3, 1, '2012-12-12', '2022-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `zaposlenici`
--

CREATE TABLE `zaposlenici` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `datumRodjenja` date NOT NULL,
  `spol` varchar(255) NOT NULL,
  `datumZaposlenja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `zaposlenici`
--

INSERT INTO `zaposlenici` (`zaposlenikID`, `ime`, `prezime`, `datumRodjenja`, `spol`, `datumZaposlenja`) VALUES
(1, 'Iva', 'Ivić', '2000-11-14', 'ženski', '2020-12-10'),
(2, 'Karlo', 'Lalić', '1985-10-07', 'muški', '2007-12-10'),
(3, 'Marko', 'Marković', '1990-03-03', 'muški', '2014-02-10'),
(4, 'Ana', 'Marić', '1998-01-14', 'ženski', '2019-05-10');

-- --------------------------------------------------------

--
-- Table structure for table `zaposleniciOdjeli`
--

CREATE TABLE `zaposleniciOdjeli` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `odjelID` int UNSIGNED NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `zaposleniciOdjeli`
--

INSERT INTO `zaposleniciOdjeli` (`zaposlenikID`, `odjelID`, `odDatuma`, `doDatuma`) VALUES
(1, 3, '2020-10-10', '2022-11-30'),
(2, 2, '2018-10-10', '2022-11-30'),
(3, 1, '2019-10-10', '2022-11-30'),
(4, 1, '2020-10-10', '2022-11-30'),
(4, 3, '2021-10-10', '2022-11-30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `odjeli`
--
ALTER TABLE `odjeli`
  ADD PRIMARY KEY (`odjelID`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`zaposlenikID`,`odDatuma`);

--
-- Indexes for table `radnoMjesto`
--
ALTER TABLE `radnoMjesto`
  ADD PRIMARY KEY (`zaposlenikID`,`radnoMjesto`,`odDatuma`);

--
-- Indexes for table `voditeljOdjela`
--
ALTER TABLE `voditeljOdjela`
  ADD PRIMARY KEY (`zaposlenikID`,`odjelID`),
  ADD KEY `odjelID` (`odjelID`);

--
-- Indexes for table `zaposlenici`
--
ALTER TABLE `zaposlenici`
  ADD PRIMARY KEY (`zaposlenikID`);

--
-- Indexes for table `zaposleniciOdjeli`
--
ALTER TABLE `zaposleniciOdjeli`
  ADD PRIMARY KEY (`zaposlenikID`,`odjelID`),
  ADD KEY `odjelID` (`odjelID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `place_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE;

--
-- Constraints for table `radnoMjesto`
--
ALTER TABLE `radnoMjesto`
  ADD CONSTRAINT `radnoMjesto_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE;

--
-- Constraints for table `voditeljOdjela`
--
ALTER TABLE `voditeljOdjela`
  ADD CONSTRAINT `voditeljOdjela_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE,
  ADD CONSTRAINT `voditeljOdjela_ibfk_2` FOREIGN KEY (`odjelID`) REFERENCES `odjeli` (`odjelID`) ON DELETE CASCADE;

--
-- Constraints for table `zaposleniciOdjeli`
--
ALTER TABLE `zaposleniciOdjeli`
  ADD CONSTRAINT `zaposleniciOdjeli_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE,
  ADD CONSTRAINT `zaposleniciOdjeli_ibfk_2` FOREIGN KEY (`odjelID`) REFERENCES `odjeli` (`odjelID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
