-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2024 at 08:42 PM
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
-- Database: `practica2`
--

-- --------------------------------------------------------

--
-- Table structure for table `instancia_bucket`
--

CREATE TABLE `instancia_bucket` (
  `nomBucket` varchar(64) NOT NULL,
  `periodeBloqueig` int(11) DEFAULT NULL,
  `idBucket` int(11) NOT NULL,
  `nomReg` varchar(64) DEFAULT NULL,
  `idServei` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `instancia_bucket`
--
ALTER TABLE `instancia_bucket`
  ADD PRIMARY KEY (`idBucket`),
  ADD KEY `fk_regio_bucket` (`nomReg`),
  ADD KEY `fk_servei_bucket` (`idServei`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `instancia_bucket`
--
ALTER TABLE `instancia_bucket`
  ADD CONSTRAINT `fk_bucket_servei` FOREIGN KEY (`idBucket`) REFERENCES `servei` (`idServei`),
  ADD CONSTRAINT `fk_regio_bucket` FOREIGN KEY (`nomReg`) REFERENCES `regio` (`nomReg`),
  ADD CONSTRAINT `fk_servei_bucket` FOREIGN KEY (`idServei`) REFERENCES `servei` (`idServei`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
