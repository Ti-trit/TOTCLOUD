-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2024 at 01:00 AM
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
-- Table structure for table `historial_contrasenya`
--

CREATE TABLE `historial_contrasenya` (
  `constrasenyaHash` varchar(255) NOT NULL,
  `dataCreacio` date NOT NULL,
  `idHistorial` int(11) NOT NULL,
  `idInstanciaBD` int(11) DEFAULT NULL,
  `IdPersona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `historial_contrasenya`
--

INSERT INTO `historial_contrasenya` (`constrasenyaHash`, `dataCreacio`, `idHistorial`, `idInstanciaBD`, `IdPersona`) VALUES
('$2a$12$KqOhCNjnJlHf6We5Kzf1/.7ijqUUf7ImXHd38UYZAbBz6ARQXxqAq', '2024-11-25', 1, NULL, 1),
('$2a$12$gYRJy83EAK6Og3pJy323I.oX3nQycD.SobAdiJjDwl9nTBDUaFfTy', '2023-04-20', 2, NULL, 1),
('$2a$12$6.JIv7NijR1AOxOTVxf3E.74oTnR.4I6sNOPWxRnh4VG.VsPlCM8i', '2022-10-20', 3, NULL, 2),
('$2a$12$HeX73a16lJpkQiIgyFnS6OXl1TPEonsr6F7fzEcb9TOQno5xWu4Yi', '2020-01-01', 4, NULL, 2),
('$2a$12$RadDMrl7/GE3Ky5Cm6bb3e8JBfTj04onhFtljQa7uUefswb8.bn7C', '2023-04-03', 5, NULL, 3),
('$2a$12$X2DoGOLkuxBs3h1.m7APLeWxazHjwIgYb4naDuFnyXBkPs6R8vnfy', '2019-04-06', 6, NULL, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `historial_contrasenya`
--
ALTER TABLE `historial_contrasenya`
  ADD PRIMARY KEY (`idHistorial`),
  ADD KEY `fk_const_BD` (`idInstanciaBD`),
  ADD KEY `fk_PERSONA_CONTR` (`IdPersona`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `historial_contrasenya`
--
ALTER TABLE `historial_contrasenya`
  MODIFY `idHistorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `historial_contrasenya`
--
ALTER TABLE `historial_contrasenya`
  ADD CONSTRAINT `fk_PERSONA_CONTR` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`idPersona`),
  ADD CONSTRAINT `fk_const_BD` FOREIGN KEY (`idInstanciaBD`) REFERENCES `instancia_bd` (`idInstanciaBD`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
