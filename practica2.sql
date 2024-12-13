-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2024 at 09:49 PM
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
-- Table structure for table `ami`
--

CREATE TABLE `ami` (
  `nomAmi` varchar(128) NOT NULL,
  `descripcioAMI` text DEFAULT NULL,
  `arquitectura` varchar(16) NOT NULL,
  `idAMI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ami`
--

INSERT INTO `ami` (`nomAmi`, `descripcioAMI`, `arquitectura`, `idAMI`) VALUES
('ami-12345abcd', 'Amazon Linux 2 AMI - 64-bit', 'x86_64', 1),
('ami-98765efgh', 'Ubuntu 20.04 LTS - 64-bit', 'x86_64', 2),
('ami-abc1234xyz', 'Windows Server 2019 - 64-bit', 'x86_64', 3),
('ami-xyz456789', 'Amazon Linux 2 ARM - 64-bit', 'arm64', 4),
('ami-56789ijkl', 'Ubuntu 18.04 LTS AMI for AWS with custom configurations for web servers and security updates.', 'x86_64', 5);

-- --------------------------------------------------------

--
-- Table structure for table `arxiu`
--

CREATE TABLE `arxiu` (
  `nom` varchar(64) NOT NULL,
  `block_public_access` bit(1) NOT NULL,
  `tipusPermis` varchar(64) NOT NULL,
  `idArxiu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_table_user`
--

CREATE TABLE `audit_table_user` (
  `id` int(11) NOT NULL,
  `taula_modificada` varchar(255) DEFAULT NULL,
  `fila_antigua` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`fila_antigua`)),
  `fila_nova` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`fila_nova`)),
  `tipus_modificacio` varchar(16) DEFAULT NULL,
  `data_modificacio` datetime DEFAULT NULL,
  `trx_timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_table_user`
--

INSERT INTO `audit_table_user` (`id`, `taula_modificada`, `fila_antigua`, `fila_nova`, `tipus_modificacio`, `data_modificacio`, `trx_timestamp`) VALUES
(1, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"meuFileProva3\", \"idClauSessio\": \"8\", \"tipusClau\": \"RSA\", \"nomClau\": \"clauProva3\"}', 'INSERT', '2024-12-11 14:11:13', '2024-12-11 14:11:13'),
(2, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"admin1\", \"nomBD\": \"Database1\", \"grupParametresBD\": \"default\", \"periodeRetencioCS\": \"30\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"admin1\", \"nomBD\": \"Database1\", \"grupParametresBD\": \"optimized\", \"periodeRetencioCS\": \"30\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-11 14:14:14', '2024-12-11 14:14:14'),
(3, 'INSTANCIA_BUCKET', NULL, '{\"nomBucket\": \"first_bucket\", \"periodeBloqueig\": \"NULL\", \"idBucket\": \"1\", \"nomReg\": \"eu-west-3\", \"idServei\": \"2\"}', 'INSERT', '2024-12-11 14:18:59', '2024-12-11 14:18:59'),
(4, 'INSTANCIA_BUCKET', '{\"nomBucket\": \"first_bucket\", \"periodeBloqueig\": \"NULL\", \"idBucket\": \"1\", \"nomReg\": \"eu-west-3\", \"idServei\": \"2\"}', '{\"nomBucket\": \"First_Corrected_Bucket\", \"periodeBloqueig\": \"NULL\", \"idBucket\": \"1\", \"nomReg\": \"eu-west-3\", \"idServei\": \"2\"}', 'UPDATE', '2024-12-11 14:21:00', '2024-12-11 14:21:00'),
(5, 'INSTANCIA_BUCKET', '{\"nomBucket\": \"First_Corrected_Bucket\", \"periodeBloqueig\": \"NULL\", \"idBucket\": \"1\", \"nomReg\": \"eu-west-3\", \"idServei\": \"2\"}', NULL, 'DELETE', '2024-12-11 14:21:43', '2024-12-11 14:21:43'),
(8, 'INSTANCIA_BUCKET', NULL, '{\"nomBucket\": \"asdf\", \"periodeBloqueig\": \"0\", \"idBucket\": \"2\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', 'INSERT', '2024-12-12 21:54:38', '2024-12-12 21:54:38'),
(9, 'INSTANCIA_BUCKET', NULL, '{\"nomBucket\": \"asdfasdf\", \"periodeBloqueig\": \"30\", \"idBucket\": \"3\", \"nomReg\": \"eu-west-2\", \"idServei\": \"2\"}', 'INSERT', '2024-12-12 22:06:31', '2024-12-12 22:06:31'),
(10, 'INSTANCIA_BUCKET', NULL, '{\"nomBucket\": \"werpreubaBucket\", \"periodeBloqueig\": \"30\", \"idBucket\": \"4\", \"nomReg\": \"eu-west-2\", \"idServei\": \"2\"}', 'INSERT', '2024-12-12 22:06:58', '2024-12-12 22:06:58'),
(11, 'INSTANCIA_BUCKET', NULL, '{\"nomBucket\": \"khuiyu\", \"periodeBloqueig\": \"30\", \"idBucket\": \"5\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', 'INSERT', '2024-12-12 22:07:34', '2024-12-12 22:07:34'),
(12, 'INSTANCIA_BUCKET', NULL, '{\"nomBucket\": \"miBucket8\", \"periodeBloqueig\": \"90\", \"idBucket\": \"6\", \"nomReg\": \"eu-west-3\", \"idServei\": \"2\"}', 'INSERT', '2024-12-12 22:08:42', '2024-12-12 22:08:42'),
(13, 'INSTANCIA_BUCKET', NULL, '{\"nomBucket\": \"b2\", \"periodeBloqueig\": \"0\", \"idBucket\": \"7\", \"nomReg\": \"eu-west-3\", \"idServei\": \"2\"}', 'INSERT', '2024-12-12 22:09:07', '2024-12-12 22:09:07'),
(14, 'INSTANCIA_BUCKET', NULL, '{\"nomBucket\": \"otroBucket\", \"periodeBloqueig\": \"365\", \"idBucket\": \"8\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', 'INSERT', '2024-12-12 22:18:04', '2024-12-12 22:18:04'),
(15, 'INSTANCIA_BUCKET', '{\"nomBucket\": \"asdf\", \"periodeBloqueig\": \"0\", \"idBucket\": \"2\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', '{\"nomBucket\": \"PrimerBucket\", \"periodeBloqueig\": \"0\", \"idBucket\": \"2\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', 'UPDATE', '2024-12-12 22:27:38', '2024-12-12 22:27:38'),
(16, 'INSTANCIA_BUCKET', '{\"nomBucket\": \"PrimerBucket\", \"periodeBloqueig\": \"0\", \"idBucket\": \"2\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', NULL, 'DELETE', '2024-12-12 22:27:48', '2024-12-12 22:27:48'),
(17, 'INSTANCIA_BUCKET', NULL, '{\"nomBucket\": \"b3\", \"periodeBloqueig\": \"0\", \"idBucket\": \"9\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', 'INSERT', '2024-12-12 22:35:47', '2024-12-12 22:35:47'),
(18, 'INSTANCIA_BUCKET', '{\"nomBucket\": \"b3\", \"periodeBloqueig\": \"0\", \"idBucket\": \"9\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', NULL, 'DELETE', '2024-12-12 22:35:57', '2024-12-12 22:35:57'),
(19, 'INSTANCIA_BUCKET', NULL, '{\"nomBucket\": \"Ibucket\", \"periodeBloqueig\": \"90\", \"idBucket\": \"10\", \"nomReg\": \"eu-west-3\", \"idServei\": \"2\"}', 'INSERT', '2024-12-12 22:41:50', '2024-12-12 22:41:50'),
(20, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"4\", \"idBDServei\": \"1\", \"nomMaster\": \"admin4\", \"nomBD\": \"Database4\", \"grupParametresBD\": \"secure\", \"periodeRetencioCS\": \"14\", \"tipusMotor\": \"SQLite\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"4\", \"idEmmg\": \"4\"}', '{\"idInstanciaBD\": \"4\", \"idBDServei\": \"1\", \"nomMaster\": \"admin4\", \"nomBD\": \"Database4\", \"grupParametresBD\": \"secure\", \"periodeRetencioCS\": \"14\", \"tipusMotor\": \"Oracle\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"4\", \"idEmmg\": \"4\"}', 'UPDATE', '2024-12-12 22:57:19', '2024-12-12 22:57:19'),
(21, 'INSTANCIA_BUCKET', NULL, '{\"nomBucket\": \"miBucket\", \"periodeBloqueig\": \"0\", \"idBucket\": \"11\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', 'INSERT', '2024-12-13 11:23:18', '2024-12-13 11:23:18'),
(22, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"bfdgf\", \"descripcio\": \"gdf\", \"descrpicioSource\": \"NULL\", \"idGS\": \"25\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 13:15:24', '2024-12-13 13:15:24'),
(23, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"bfdgf\", \"descripcio\": \"gdf\", \"descrpicioSource\": \"NULL\", \"idGS\": \"26\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 13:15:35', '2024-12-13 13:15:35'),
(24, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"fdsdjh\", \"descripcio\": \"desprico opcionla prova\", \"descrpicioSource\": \"NULL\", \"idGS\": \"27\", \"tipusSource\": \"S2\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 13:16:59', '2024-12-13 13:16:59'),
(25, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"fdsdjh\", \"descripcio\": \"desprico opcionla prova\", \"descrpicioSource\": \"NULL\", \"idGS\": \"28\", \"tipusSource\": \"S2\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 13:20:17', '2024-12-13 13:20:17'),
(26, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"dfhgfhfghfg\", \"descripcio\": \"hfg\", \"descrpicioSource\": \"NULL\", \"idGS\": \"29\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 13:26:47', '2024-12-13 13:26:47'),
(27, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"dfhgfhfghfg\", \"descripcio\": \"hfg\", \"descrpicioSource\": \"NULL\", \"idGS\": \"30\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 13:28:06', '2024-12-13 13:28:06'),
(28, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"dfhgfhfghfg\", \"descripcio\": \"hfg\", \"descrpicioSource\": \"NULL\", \"idGS\": \"31\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 13:28:07', '2024-12-13 13:28:07'),
(29, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"dfhgfhfghfg\", \"descripcio\": \"hfg\", \"descrpicioSource\": \"NULL\", \"idGS\": \"32\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 13:28:14', '2024-12-13 13:28:14'),
(30, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"dfhgfhfghfg\", \"descripcio\": \"hfg\", \"descrpicioSource\": \"NULL\", \"idGS\": \"33\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 13:29:16', '2024-12-13 13:29:16'),
(31, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"miGrupoSeguretat\", \"descripcio\": \"un grup nou\", \"descrpicioSource\": \"NULL\", \"idGS\": \"34\", \"tipusSource\": \"S3\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 13:43:01', '2024-12-13 13:43:01'),
(32, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"miGrupoSeguretat\", \"descripcio\": \"un grup nou\", \"descrpicioSource\": \"NULL\", \"idGS\": \"35\", \"tipusSource\": \"S3\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 13:43:24', '2024-12-13 13:43:24'),
(33, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"miGrupoSeguretat\", \"descripcio\": \"un grup nou\", \"descrpicioSource\": \"NULL\", \"idGS\": \"36\", \"tipusSource\": \"S3\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 13:43:32', '2024-12-13 13:43:32'),
(34, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"miGrupoSeguretat\", \"descripcio\": \"un grup nou\", \"descrpicioSource\": \"NULL\", \"idGS\": \"37\", \"tipusSource\": \"S3\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 13:44:45', '2024-12-13 13:44:45'),
(35, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"miGrupoSeguretat\", \"descripcio\": \"un grup nou\", \"descrpicioSource\": \"NULL\", \"idGS\": \"38\", \"tipusSource\": \"S3\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 13:44:55', '2024-12-13 13:44:55'),
(36, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"miGrupoSeguretat\", \"descripcio\": \"un grup nou\", \"descrpicioSource\": \"NULL\", \"idGS\": \"39\", \"tipusSource\": \"S3\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 13:47:22', '2024-12-13 13:47:22'),
(37, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"miGrupoSeguretat\", \"descripcio\": \"un grup nou\", \"descrpicioSource\": \"NULL\", \"idGS\": \"40\", \"tipusSource\": \"S3\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 13:48:48', '2024-12-13 13:48:48'),
(38, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subxarxa10\", \"descripcio\": \"no se que posar aqui\", \"idVPC\": \"fskfhskj7fsdkfjsd-fsd\", \"idSubXar\": \"4\", \"nomReg\": \"eu-west-2\"}', 'INSERT', '2024-12-13 13:48:48', '2024-12-13 13:48:48'),
(39, 'INSTANCIA_BD', NULL, '{\"idInstanciaBD\": \"7\", \"idBDServei\": \"1\", \"nomMaster\": \"matserKIB\", \"nomBD\": \"preuba100\", \"grupParametresBD\": \"default.postgres13\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"4\", \"idConfig\": \"24\", \"idGS\": \"40\", \"idEmmg\": \"34\"}', 'INSERT', '2024-12-13 13:48:48', '2024-12-13 13:48:48'),
(40, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"MiGrupoSeguretat\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"41\", \"tipusSource\": \"S2\", \"tipus\": \"P2\", \"Protocol\": \"UDP\"}', 'INSERT', '2024-12-13 13:50:27', '2024-12-13 13:50:27'),
(41, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"red-totcloud\", \"descripcio\": \"camp obligatori no important\", \"idVPC\": \"98.3299854-343\", \"idSubXar\": \"5\", \"nomReg\": \"eu-west-3\"}', 'INSERT', '2024-12-13 13:50:27', '2024-12-13 13:50:27'),
(42, 'INSTANCIA_BD', NULL, '{\"idInstanciaBD\": \"8\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"20242025Practica\", \"grupParametresBD\": \"default.mysql8.0\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MySQL\", \"idSubXar\": \"5\", \"idConfig\": \"25\", \"idGS\": \"41\", \"idEmmg\": \"36\"}', 'INSERT', '2024-12-13 13:50:27', '2024-12-13 13:50:27'),
(43, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"7\", \"idBDServei\": \"1\", \"nomMaster\": \"matserKIB\", \"nomBD\": \"preuba100\", \"grupParametresBD\": \"default.postgres13\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"4\", \"idConfig\": \"24\", \"idGS\": \"40\", \"idEmmg\": \"34\"}', NULL, 'DELETE', '2024-12-13 13:53:54', '2024-12-13 13:53:54'),
(44, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"8\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"20242025Practica\", \"grupParametresBD\": \"default.mysql8.0\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MySQL\", \"idSubXar\": \"5\", \"idConfig\": \"25\", \"idGS\": \"41\", \"idEmmg\": \"36\"}', NULL, 'DELETE', '2024-12-13 14:19:31', '2024-12-13 14:19:31'),
(45, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"admin1\", \"nomBD\": \"Database1\", \"grupParametresBD\": \"optimized\", \"periodeRetencioCS\": \"30\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"Database1\", \"grupParametresBD\": \"khaoula\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 14:59:30', '2024-12-13 14:59:30'),
(46, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"Database1\", \"grupParametresBD\": \"khaoula\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"Database1\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 15:00:09', '2024-12-13 15:00:09'),
(47, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"2\", \"idBDServei\": \"1\", \"nomMaster\": \"admin2\", \"nomBD\": \"Database2\", \"grupParametresBD\": \"optimized\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"MySQL\", \"idSubXar\": \"1\", \"idConfig\": \"3\", \"idGS\": \"2\", \"idEmmg\": \"2\"}', '{\"idInstanciaBD\": \"2\", \"idBDServei\": \"1\", \"nomMaster\": \"admin2\", \"nomBD\": \"Database2\", \"grupParametresBD\": \"default.postgres14\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"MySQL\", \"idSubXar\": \"1\", \"idConfig\": \"3\", \"idGS\": \"2\", \"idEmmg\": \"2\"}', 'UPDATE', '2024-12-13 15:00:18', '2024-12-13 15:00:18'),
(48, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"Database1\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"Database1\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 15:10:03', '2024-12-13 15:10:03'),
(49, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"5\", \"idBDServei\": \"1\", \"nomMaster\": \"admin5\", \"nomBD\": \"Database5\", \"grupParametresBD\": \"balanced\", \"periodeRetencioCS\": \"NULL\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"2\", \"idConfig\": \"2\", \"idGS\": \"2\", \"idEmmg\": \"1\"}', NULL, 'DELETE', '2024-12-13 15:35:05', '2024-12-13 15:35:05'),
(50, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"4\", \"idBDServei\": \"1\", \"nomMaster\": \"admin4\", \"nomBD\": \"Database4\", \"grupParametresBD\": \"secure\", \"periodeRetencioCS\": \"14\", \"tipusMotor\": \"Oracle\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"4\", \"idEmmg\": \"4\"}', '{\"idInstanciaBD\": \"4\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"practica5\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"Oracle\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"4\", \"idEmmg\": \"4\"}', 'UPDATE', '2024-12-13 15:35:19', '2024-12-13 15:35:19'),
(51, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"3\", \"idBDServei\": \"1\", \"nomMaster\": \"admin3\", \"nomBD\": \"Database3\", \"grupParametresBD\": \"high-performance\", \"periodeRetencioCS\": \"NULL\", \"tipusMotor\": \"PostgreSQL\", \"idSubXar\": \"3\", \"idConfig\": \"2\", \"idGS\": \"3\", \"idEmmg\": \"3\"}', '{\"idInstanciaBD\": \"3\", \"idBDServei\": \"1\", \"nomMaster\": \"admin3\", \"nomBD\": \"Database3\", \"grupParametresBD\": \"default.postgres13\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"PostgreSQL\", \"idSubXar\": \"3\", \"idConfig\": \"2\", \"idGS\": \"3\", \"idEmmg\": \"3\"}', 'UPDATE', '2024-12-13 15:35:53', '2024-12-13 15:35:53'),
(52, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"4\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"practica5\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"Oracle\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"4\", \"idEmmg\": \"4\"}', '{\"idInstanciaBD\": \"4\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"practica5\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"Oracle\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"4\", \"idEmmg\": \"4\"}', 'UPDATE', '2024-12-13 15:36:05', '2024-12-13 15:36:05'),
(53, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"Database1\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"Database1\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 15:37:59', '2024-12-13 15:37:59'),
(54, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gp90dsjh\", \"descripcio\": \"fs\", \"descrpicioSource\": \"NULL\", \"idGS\": \"42\", \"tipusSource\": \"S2\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 15:49:47', '2024-12-13 15:49:47'),
(55, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"miXarxa\", \"descripcio\": \"gdfhgfjkd\", \"idVPC\": \"09-897nvneruyiujbfdsmn\", \"idSubXar\": \"6\", \"nomReg\": \"eu-west-2\"}', 'INSERT', '2024-12-13 15:49:47', '2024-12-13 15:49:47'),
(56, 'INSTANCIA_BD', NULL, '{\"idInstanciaBD\": \"9\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"preubaFinal\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"6\", \"idConfig\": \"27\", \"idGS\": \"42\", \"idEmmg\": \"38\"}', 'INSERT', '2024-12-13 15:49:47', '2024-12-13 15:49:47'),
(57, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"9\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"preubaFinal\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"6\", \"idConfig\": \"27\", \"idGS\": \"42\", \"idEmmg\": \"38\"}', '{\"idInstanciaBD\": \"9\", \"idBDServei\": \"1\", \"nomMaster\": \"ikkene\", \"nomBD\": \"preubaFinalOK\", \"grupParametresBD\": \"default.postgres14\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"6\", \"idConfig\": \"27\", \"idGS\": \"42\", \"idEmmg\": \"38\"}', 'UPDATE', '2024-12-13 15:50:50', '2024-12-13 15:50:50'),
(58, 'INSTANCIA_BUCKET', NULL, '{\"nomBucket\": \"bucketFinal\", \"periodeBloqueig\": \"30\", \"idBucket\": \"12\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', 'INSERT', '2024-12-13 15:54:56', '2024-12-13 15:54:56'),
(59, 'INSTANCIA_BUCKET', '{\"nomBucket\": \"bucketFinal\", \"periodeBloqueig\": \"30\", \"idBucket\": \"12\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', '{\"nomBucket\": \"bucketFinalOK\", \"periodeBloqueig\": \"90\", \"idBucket\": \"12\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', 'UPDATE', '2024-12-13 15:55:05', '2024-12-13 15:55:05'),
(60, 'INSTANCIA_BUCKET', '{\"nomBucket\": \"b2\", \"periodeBloqueig\": \"0\", \"idBucket\": \"7\", \"nomReg\": \"eu-west-3\", \"idServei\": \"2\"}', NULL, 'DELETE', '2024-12-13 15:55:10', '2024-12-13 15:55:10'),
(61, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"vsfdgf\", \"descripcio\": \"gfd\", \"descrpicioSource\": \"NULL\", \"idGS\": \"43\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 16:05:46', '2024-12-13 16:05:46'),
(62, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"trg\", \"idClauSessio\": \"12352\", \"tipusClau\": \"ED25519\", \"nomClau\": \"123\"}', 'INSERT', '2024-12-13 16:05:46', '2024-12-13 16:05:46'),
(63, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"rer\", \"idClauSessio\": \"12353\", \"tipusClau\": \"ED25519\", \"nomClau\": \"fdfd\"}', 'INSERT', '2024-12-13 16:06:42', '2024-12-13 16:06:42'),
(64, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"dfds\", \"descripcio\": \"fsds\", \"descrpicioSource\": \"NULL\", \"idGS\": \"44\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 16:08:42', '2024-12-13 16:08:42'),
(65, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fdfds\", \"idClauSessio\": \"12354\", \"tipusClau\": \"ED25519\", \"nomClau\": \"fdsf\"}', 'INSERT', '2024-12-13 16:08:42', '2024-12-13 16:08:42'),
(66, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"fdgg\", \"descripcio\": \"gd\", \"descrpicioSource\": \"NULL\", \"idGS\": \"45\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 16:14:14', '2024-12-13 16:14:14'),
(67, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"etrt\", \"idClauSessio\": \"12355\", \"tipusClau\": \"ED25519\", \"nomClau\": \"nhgf\"}', 'INSERT', '2024-12-13 16:14:14', '2024-12-13 16:14:14'),
(68, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"fdgg\", \"descripcio\": \"gd\", \"descrpicioSource\": \"NULL\", \"idGS\": \"46\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 16:15:44', '2024-12-13 16:15:44'),
(69, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"etrt\", \"idClauSessio\": \"12356\", \"tipusClau\": \"ED25519\", \"nomClau\": \"nhgf\"}', 'INSERT', '2024-12-13 16:15:44', '2024-12-13 16:15:44'),
(70, 'INSTANCIA_SERVIDOR', NULL, '{\"nomServ\": \"Servidor3\", \"dataCreacio\": \"2024-12-12\", \"idInstancia_servidor\": \"1\", \"idServidorInfra\": \"1\", \"idSubXar\": \"1\", \"idConfig\": \"1\", \"idGS\": \"45\", \"idEmmg\": \"37\", \"idClauSessio\": \"12355\", \"idAMI\": \"1\"}', 'INSERT', '2024-12-13 16:15:44', '2024-12-13 16:15:44'),
(71, 'INSTANCIA_SERVIDOR', '{\"nomServ\": \"Servidor3\", \"dataCreacio\": \"2024-12-12\", \"idInstancia_servidor\": \"1\", \"idServidorInfra\": \"1\", \"idSubXar\": \"1\", \"idConfig\": \"1\", \"idGS\": \"45\", \"idEmmg\": \"37\", \"idClauSessio\": \"12355\", \"idAMI\": \"1\"}', '{\"nomServ\": \"Servidor4\", \"dataCreacio\": \"2024-12-12\", \"idInstancia_servidor\": \"1\", \"idServidorInfra\": \"1\", \"idSubXar\": \"1\", \"idConfig\": \"1\", \"idGS\": \"45\", \"idEmmg\": \"37\", \"idClauSessio\": \"12355\", \"idAMI\": \"1\"}', 'UPDATE', '2024-12-13 16:17:33', '2024-12-13 16:17:33'),
(72, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gs404\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"47\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 17:06:19', '2024-12-13 17:06:19'),
(73, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subdred5\", \"descripcio\": \"obligaotiro pero no seque\", \"idVPC\": \"vpc-543tfe\", \"idSubXar\": \"7\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 17:06:19', '2024-12-13 17:06:19'),
(74, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fileclau.ppk\", \"idClauSessio\": \"12357\", \"tipusClau\": \"ED25519\", \"nomClau\": \"4534\"}', 'INSERT', '2024-12-13 17:06:19', '2024-12-13 17:06:19'),
(75, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gs404\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"48\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 17:07:04', '2024-12-13 17:07:04'),
(76, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subdred5\", \"descripcio\": \"obligaotiro pero no seque\", \"idVPC\": \"vpc-543tfe\", \"idSubXar\": \"8\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 17:07:04', '2024-12-13 17:07:04'),
(77, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fileclau.ppk\", \"idClauSessio\": \"12358\", \"tipusClau\": \"ED25519\", \"nomClau\": \"4534\"}', 'INSERT', '2024-12-13 17:07:04', '2024-12-13 17:07:04'),
(78, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gs404\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"49\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 17:08:53', '2024-12-13 17:08:53'),
(79, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subdred5\", \"descripcio\": \"obligaotiro pero no seque\", \"idVPC\": \"vpc-543tfe\", \"idSubXar\": \"9\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 17:08:53', '2024-12-13 17:08:53'),
(80, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fileclau.ppk\", \"idClauSessio\": \"12359\", \"tipusClau\": \"ED25519\", \"nomClau\": \"4534\"}', 'INSERT', '2024-12-13 17:08:53', '2024-12-13 17:08:53'),
(81, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gs404\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"50\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 17:09:10', '2024-12-13 17:09:10'),
(82, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subdred5\", \"descripcio\": \"obligaotiro pero no seque\", \"idVPC\": \"vpc-543tfe\", \"idSubXar\": \"10\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 17:09:10', '2024-12-13 17:09:10'),
(83, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fileclau.ppk\", \"idClauSessio\": \"12360\", \"tipusClau\": \"ED25519\", \"nomClau\": \"4534\"}', 'INSERT', '2024-12-13 17:09:10', '2024-12-13 17:09:10'),
(84, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gs404\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"51\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 17:09:57', '2024-12-13 17:09:57'),
(85, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subdred5\", \"descripcio\": \"obligaotiro pero no seque\", \"idVPC\": \"vpc-543tfe\", \"idSubXar\": \"11\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 17:09:57', '2024-12-13 17:09:57'),
(86, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fileclau.ppk\", \"idClauSessio\": \"12361\", \"tipusClau\": \"ED25519\", \"nomClau\": \"4534\"}', 'INSERT', '2024-12-13 17:09:57', '2024-12-13 17:09:57'),
(87, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gs404\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"52\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 17:10:21', '2024-12-13 17:10:21'),
(88, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subdred5\", \"descripcio\": \"obligaotiro pero no seque\", \"idVPC\": \"vpc-543tfe\", \"idSubXar\": \"12\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 17:10:21', '2024-12-13 17:10:21'),
(89, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fileclau.ppk\", \"idClauSessio\": \"12362\", \"tipusClau\": \"ED25519\", \"nomClau\": \"4534\"}', 'INSERT', '2024-12-13 17:10:21', '2024-12-13 17:10:21'),
(90, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gs404\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"53\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 17:10:49', '2024-12-13 17:10:49'),
(91, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subdred5\", \"descripcio\": \"obligaotiro pero no seque\", \"idVPC\": \"vpc-543tfe\", \"idSubXar\": \"13\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 17:10:49', '2024-12-13 17:10:49'),
(92, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fileclau.ppk\", \"idClauSessio\": \"12363\", \"tipusClau\": \"ED25519\", \"nomClau\": \"4534\"}', 'INSERT', '2024-12-13 17:10:49', '2024-12-13 17:10:49'),
(93, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gs404\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"54\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 17:11:58', '2024-12-13 17:11:58'),
(94, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subdred5\", \"descripcio\": \"obligaotiro pero no seque\", \"idVPC\": \"vpc-543tfe\", \"idSubXar\": \"14\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 17:11:58', '2024-12-13 17:11:58'),
(95, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fileclau.ppk\", \"idClauSessio\": \"12364\", \"tipusClau\": \"ED25519\", \"nomClau\": \"4534\"}', 'INSERT', '2024-12-13 17:11:58', '2024-12-13 17:11:58'),
(96, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gs404\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"55\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 17:12:06', '2024-12-13 17:12:06'),
(97, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subdred5\", \"descripcio\": \"obligaotiro pero no seque\", \"idVPC\": \"vpc-543tfe\", \"idSubXar\": \"15\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 17:12:06', '2024-12-13 17:12:06'),
(98, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fileclau.ppk\", \"idClauSessio\": \"12365\", \"tipusClau\": \"ED25519\", \"nomClau\": \"4534\"}', 'INSERT', '2024-12-13 17:12:06', '2024-12-13 17:12:06'),
(99, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gs404\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"56\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 17:13:09', '2024-12-13 17:13:09'),
(100, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subdred5\", \"descripcio\": \"obligaotiro pero no seque\", \"idVPC\": \"vpc-543tfe\", \"idSubXar\": \"16\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 17:13:09', '2024-12-13 17:13:09'),
(101, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fileclau.ppk\", \"idClauSessio\": \"12366\", \"tipusClau\": \"ED25519\", \"nomClau\": \"4534\"}', 'INSERT', '2024-12-13 17:13:09', '2024-12-13 17:13:09'),
(102, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gs404\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"57\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 17:13:39', '2024-12-13 17:13:39'),
(103, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subdred5\", \"descripcio\": \"obligaotiro pero no seque\", \"idVPC\": \"vpc-543tfe\", \"idSubXar\": \"17\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 17:13:39', '2024-12-13 17:13:39'),
(104, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fileclau.ppk\", \"idClauSessio\": \"12367\", \"tipusClau\": \"ED25519\", \"nomClau\": \"4534\"}', 'INSERT', '2024-12-13 17:13:39', '2024-12-13 17:13:39'),
(105, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gs404\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"58\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 17:14:29', '2024-12-13 17:14:29'),
(106, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subdred5\", \"descripcio\": \"obligaotiro pero no seque\", \"idVPC\": \"vpc-543tfe\", \"idSubXar\": \"18\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 17:14:29', '2024-12-13 17:14:29'),
(107, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fileclau.ppk\", \"idClauSessio\": \"12368\", \"tipusClau\": \"ED25519\", \"nomClau\": \"4534\"}', 'INSERT', '2024-12-13 17:14:29', '2024-12-13 17:14:29'),
(108, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gs404\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"59\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 17:14:31', '2024-12-13 17:14:31'),
(109, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subdred5\", \"descripcio\": \"obligaotiro pero no seque\", \"idVPC\": \"vpc-543tfe\", \"idSubXar\": \"19\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 17:14:31', '2024-12-13 17:14:31'),
(110, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fileclau.ppk\", \"idClauSessio\": \"12369\", \"tipusClau\": \"ED25519\", \"nomClau\": \"4534\"}', 'INSERT', '2024-12-13 17:14:31', '2024-12-13 17:14:31'),
(111, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"kfjdhkj\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"60\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 17:15:21', '2024-12-13 17:15:21'),
(112, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subred5\", \"descripcio\": \"ffdsfj\", \"idVPC\": \"vpc-94rejfkenj\", \"idSubXar\": \"20\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 17:15:21', '2024-12-13 17:15:21'),
(113, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fitxer.ppk\", \"idClauSessio\": \"12370\", \"tipusClau\": \"ED25519\", \"nomClau\": \"fkjdj\"}', 'INSERT', '2024-12-13 17:15:21', '2024-12-13 17:15:21'),
(114, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"kfjdhkj\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"61\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 17:15:56', '2024-12-13 17:15:56'),
(115, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subred5\", \"descripcio\": \"ffdsfj\", \"idVPC\": \"vpc-94rejfkenj\", \"idSubXar\": \"21\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 17:15:56', '2024-12-13 17:15:56'),
(116, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fitxer.ppk\", \"idClauSessio\": \"12371\", \"tipusClau\": \"ED25519\", \"nomClau\": \"fkjdj\"}', 'INSERT', '2024-12-13 17:15:56', '2024-12-13 17:15:56'),
(117, 'INSTANCIA_SERVIDOR', NULL, '{\"nomServ\": \"servidorFinal\", \"dataCreacio\": \"2024-12-13\", \"idInstancia_servidor\": \"4\", \"idServidorInfra\": \"1\", \"idSubXar\": \"21\", \"idConfig\": \"47\", \"idGS\": \"61\", \"idEmmg\": \"73\", \"idClauSessio\": \"12371\", \"idAMI\": \"1\"}', 'INSERT', '2024-12-13 17:15:56', '2024-12-13 17:15:56'),
(118, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"4\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"practica5\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"Oracle\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"4\", \"idEmmg\": \"4\"}', '{\"idInstanciaBD\": \"4\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"practica5\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"Oracle\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"4\", \"idEmmg\": \"4\"}', 'UPDATE', '2024-12-13 17:17:38', '2024-12-13 17:17:38'),
(119, 'INSTANCIA_SERVIDOR', '{\"nomServ\": \"Servidor4\", \"dataCreacio\": \"2024-12-12\", \"idInstancia_servidor\": \"1\", \"idServidorInfra\": \"1\", \"idSubXar\": \"1\", \"idConfig\": \"1\", \"idGS\": \"45\", \"idEmmg\": \"37\", \"idClauSessio\": \"12355\", \"idAMI\": \"1\"}', '{\"nomServ\": \"Servidor4\", \"dataCreacio\": \"2024-12-12\", \"idInstancia_servidor\": \"1\", \"idServidorInfra\": \"1\", \"idSubXar\": \"1\", \"idConfig\": \"1\", \"idGS\": \"45\", \"idEmmg\": \"37\", \"idClauSessio\": \"12355\", \"idAMI\": \"1\"}', 'UPDATE', '2024-12-13 17:20:55', '2024-12-13 17:20:55'),
(120, 'INSTANCIA_BUCKET', NULL, '{\"nomBucket\": \"finalbucket\", \"periodeBloqueig\": \"0\", \"idBucket\": \"13\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', 'INSERT', '2024-12-13 17:52:49', '2024-12-13 17:52:49'),
(121, 'INSTANCIA_BUCKET', NULL, '{\"nomBucket\": \"finalbucket3\", \"periodeBloqueig\": \"30\", \"idBucket\": \"14\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', 'INSERT', '2024-12-13 17:55:08', '2024-12-13 17:55:08'),
(122, 'INSTANCIA_BUCKET', '{\"nomBucket\": \"finalbucket3\", \"periodeBloqueig\": \"30\", \"idBucket\": \"14\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', '{\"nomBucket\": \"finalnoOK\", \"periodeBloqueig\": \"30\", \"idBucket\": \"14\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', 'UPDATE', '2024-12-13 18:02:43', '2024-12-13 18:02:43'),
(123, 'INSTANCIA_BUCKET', '{\"nomBucket\": \"finalnoOK\", \"periodeBloqueig\": \"30\", \"idBucket\": \"14\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', NULL, 'DELETE', '2024-12-13 18:02:45', '2024-12-13 18:02:45'),
(124, 'INSTANCIA_BUCKET', '{\"nomBucket\": \"finalbucket\", \"periodeBloqueig\": \"0\", \"idBucket\": \"13\", \"nomReg\": \"eu-west-1\", \"idServei\": \"2\"}', NULL, 'DELETE', '2024-12-13 18:03:14', '2024-12-13 18:03:14'),
(125, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"3\", \"idBDServei\": \"1\", \"nomMaster\": \"admin3\", \"nomBD\": \"Database3\", \"grupParametresBD\": \"default.postgres13\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"PostgreSQL\", \"idSubXar\": \"3\", \"idConfig\": \"2\", \"idGS\": \"3\", \"idEmmg\": \"3\"}', '{\"idInstanciaBD\": \"3\", \"idBDServei\": \"1\", \"nomMaster\": \"admin3\", \"nomBD\": \"Database2\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"PostgreSQL\", \"idSubXar\": \"3\", \"idConfig\": \"2\", \"idGS\": \"3\", \"idEmmg\": \"3\"}', 'UPDATE', '2024-12-13 18:05:34', '2024-12-13 18:05:34'),
(126, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"Database1\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula1\", \"nomBD\": \"Database1\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 18:29:39', '2024-12-13 18:29:39'),
(127, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula1\", \"nomBD\": \"Database1\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"fado\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 18:30:22', '2024-12-13 18:30:22'),
(128, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"2\", \"idBDServei\": \"1\", \"nomMaster\": \"admin2\", \"nomBD\": \"Database2\", \"grupParametresBD\": \"default.postgres14\", \"periodeRetencioCS\": \"7\", \"tipusMotor\": \"MySQL\", \"idSubXar\": \"1\", \"idConfig\": \"3\", \"idGS\": \"2\", \"idEmmg\": \"2\"}', '{\"idInstanciaBD\": \"2\", \"idBDServei\": \"1\", \"nomMaster\": \"adminFadi2\", \"nomBD\": \"Database2fadi\", \"grupParametresBD\": \"default.GETgres13\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MySQL\", \"idSubXar\": \"1\", \"idConfig\": \"3\", \"idGS\": \"2\", \"idEmmg\": \"2\"}', 'UPDATE', '2024-12-13 18:30:57', '2024-12-13 18:30:57'),
(129, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"9\", \"idBDServei\": \"1\", \"nomMaster\": \"ikkene\", \"nomBD\": \"preubaFinalOK\", \"grupParametresBD\": \"default.postgres14\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"6\", \"idConfig\": \"27\", \"idGS\": \"42\", \"idEmmg\": \"38\"}', '{\"idInstanciaBD\": \"9\", \"idBDServei\": \"1\", \"nomMaster\": \"ikkeneFadi\", \"nomBD\": \"preubaFinalOKlkasdj\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"6\", \"idConfig\": \"27\", \"idGS\": \"42\", \"idEmmg\": \"38\"}', 'UPDATE', '2024-12-13 18:33:59', '2024-12-13 18:33:59'),
(130, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gfd\", \"descripcio\": \"gsfd\", \"descrpicioSource\": \"NULL\", \"idGS\": \"62\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 18:52:05', '2024-12-13 18:52:05'),
(131, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"fsdfd\", \"descripcio\": \"rere\", \"idVPC\": \"vpc-fskfhdsj\", \"idSubXar\": \"22\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 18:52:05', '2024-12-13 18:52:05'),
(132, 'INSTANCIA_BD', NULL, '{\"idInstanciaBD\": \"10\", \"idBDServei\": \"1\", \"nomMaster\": \"masterfinal\", \"nomBD\": \"fsdf\", \"grupParametresBD\": \" default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"22\", \"idConfig\": \"48\", \"idGS\": \"62\", \"idEmmg\": \"75\"}', 'INSERT', '2024-12-13 18:52:05', '2024-12-13 18:52:05'),
(133, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gfd\", \"descripcio\": \"gsfd\", \"descrpicioSource\": \"NULL\", \"idGS\": \"63\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 18:52:12', '2024-12-13 18:52:12'),
(134, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"fsdfd\", \"descripcio\": \"rere\", \"idVPC\": \"vpc-fskfhdsj\", \"idSubXar\": \"23\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 18:52:12', '2024-12-13 18:52:12'),
(135, 'INSTANCIA_BD', NULL, '{\"idInstanciaBD\": \"11\", \"idBDServei\": \"1\", \"nomMaster\": \"masterfinal\", \"nomBD\": \"fsdf\", \"grupParametresBD\": \" default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"23\", \"idConfig\": \"49\", \"idGS\": \"63\", \"idEmmg\": \"77\"}', 'INSERT', '2024-12-13 18:52:12', '2024-12-13 18:52:12'),
(136, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gfd\", \"descripcio\": \"gsfd\", \"descrpicioSource\": \"NULL\", \"idGS\": \"64\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 18:53:21', '2024-12-13 18:53:21'),
(137, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"fsdfd\", \"descripcio\": \"rere\", \"idVPC\": \"vpc-fskfhdsj\", \"idSubXar\": \"24\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 18:53:21', '2024-12-13 18:53:21'),
(138, 'INSTANCIA_BD', NULL, '{\"idInstanciaBD\": \"12\", \"idBDServei\": \"1\", \"nomMaster\": \"masterfinal\", \"nomBD\": \"fsdf\", \"grupParametresBD\": \" default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"24\", \"idConfig\": \"50\", \"idGS\": \"64\", \"idEmmg\": \"79\"}', 'INSERT', '2024-12-13 18:53:21', '2024-12-13 18:53:21'),
(139, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gfd\", \"descripcio\": \"gsd\", \"descrpicioSource\": \"NULL\", \"idGS\": \"65\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 18:53:41', '2024-12-13 18:53:41'),
(140, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"gfd\", \"descripcio\": \"gfd\", \"idVPC\": \"gfds45\", \"idSubXar\": \"25\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 18:53:41', '2024-12-13 18:53:41'),
(141, 'INSTANCIA_BD', NULL, '{\"idInstanciaBD\": \"13\", \"idBDServei\": \"1\", \"nomMaster\": \"final3\", \"nomBD\": \"fsdfds\", \"grupParametresBD\": \" default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"25\", \"idConfig\": \"51\", \"idGS\": \"65\", \"idEmmg\": \"81\"}', 'INSERT', '2024-12-13 18:53:41', '2024-12-13 18:53:41'),
(142, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"er\", \"descripcio\": \"jhjk\", \"descrpicioSource\": \"NULL\", \"idGS\": \"66\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 18:58:30', '2024-12-13 18:58:30'),
(143, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"gd\", \"descripcio\": \"gdre\", \"idVPC\": \"vpir2389i\", \"idSubXar\": \"26\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 18:58:30', '2024-12-13 18:58:30'),
(144, 'INSTANCIA_BD', NULL, '{\"idInstanciaBD\": \"14\", \"idBDServei\": \"1\", \"nomMaster\": \"gdf\", \"nomBD\": \"gdsgdf\", \"grupParametresBD\": \" default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"26\", \"idConfig\": \"52\", \"idGS\": \"66\", \"idEmmg\": \"83\"}', 'INSERT', '2024-12-13 18:58:30', '2024-12-13 18:58:30'),
(145, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"14\", \"idBDServei\": \"1\", \"nomMaster\": \"gdf\", \"nomBD\": \"gdsgdf\", \"grupParametresBD\": \" default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"26\", \"idConfig\": \"52\", \"idGS\": \"66\", \"idEmmg\": \"83\"}', NULL, 'DELETE', '2024-12-13 19:00:43', '2024-12-13 19:00:43'),
(146, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"13\", \"idBDServei\": \"1\", \"nomMaster\": \"final3\", \"nomBD\": \"fsdfds\", \"grupParametresBD\": \" default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"25\", \"idConfig\": \"51\", \"idGS\": \"65\", \"idEmmg\": \"81\"}', NULL, 'DELETE', '2024-12-13 19:02:46', '2024-12-13 19:02:46'),
(147, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"12\", \"idBDServei\": \"1\", \"nomMaster\": \"masterfinal\", \"nomBD\": \"fsdf\", \"grupParametresBD\": \" default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"24\", \"idConfig\": \"50\", \"idGS\": \"64\", \"idEmmg\": \"79\"}', NULL, 'DELETE', '2024-12-13 19:02:50', '2024-12-13 19:02:50'),
(148, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"11\", \"idBDServei\": \"1\", \"nomMaster\": \"masterfinal\", \"nomBD\": \"fsdf\", \"grupParametresBD\": \" default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"23\", \"idConfig\": \"49\", \"idGS\": \"63\", \"idEmmg\": \"77\"}', NULL, 'DELETE', '2024-12-13 19:02:52', '2024-12-13 19:02:52'),
(149, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"10\", \"idBDServei\": \"1\", \"nomMaster\": \"masterfinal\", \"nomBD\": \"fsdf\", \"grupParametresBD\": \" default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"22\", \"idConfig\": \"48\", \"idGS\": \"62\", \"idEmmg\": \"75\"}', NULL, 'DELETE', '2024-12-13 19:02:55', '2024-12-13 19:02:55'),
(150, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gs\", \"descripcio\": \"gsd\", \"descrpicioSource\": \"NULL\", \"idGS\": \"67\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 19:06:54', '2024-12-13 19:06:54'),
(151, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subredFinal\", \"descripcio\": \"descrpioc onligatoria\", \"idVPC\": \"vpc-1dfa3564551834fe5\", \"idSubXar\": \"27\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 19:06:54', '2024-12-13 19:06:54'),
(152, 'INSTANCIA_BD', NULL, '{\"idInstanciaBD\": \"15\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"databse4\", \"grupParametresBD\": \" default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"27\", \"idConfig\": \"53\", \"idGS\": \"67\", \"idEmmg\": \"85\"}', 'INSERT', '2024-12-13 19:06:54', '2024-12-13 19:06:54'),
(153, 'INSTANCIA_SERVIDOR', '{\"nomServ\": \"servidorFinal\", \"dataCreacio\": \"2024-12-13\", \"idInstancia_servidor\": \"4\", \"idServidorInfra\": \"1\", \"idSubXar\": \"21\", \"idConfig\": \"47\", \"idGS\": \"61\", \"idEmmg\": \"73\", \"idClauSessio\": \"12371\", \"idAMI\": \"1\"}', '{\"nomServ\": \"servidorFinal\", \"dataCreacio\": \"2024-12-13\", \"idInstancia_servidor\": \"4\", \"idServidorInfra\": \"1\", \"idSubXar\": \"21\", \"idConfig\": \"47\", \"idGS\": \"61\", \"idEmmg\": \"73\", \"idClauSessio\": \"12371\", \"idAMI\": \"1\"}', 'UPDATE', '2024-12-13 19:38:44', '2024-12-13 19:38:44'),
(154, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"15\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"databse4\", \"grupParametresBD\": \" default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"27\", \"idConfig\": \"53\", \"idGS\": \"67\", \"idEmmg\": \"85\"}', '{\"idInstanciaBD\": \"15\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"databse4\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"27\", \"idConfig\": \"53\", \"idGS\": \"67\", \"idEmmg\": \"85\"}', 'UPDATE', '2024-12-13 19:43:05', '2024-12-13 19:43:05'),
(155, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"15\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"databse4\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"27\", \"idConfig\": \"53\", \"idGS\": \"67\", \"idEmmg\": \"85\"}', '{\"idInstanciaBD\": \"15\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"databse4\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"27\", \"idConfig\": \"53\", \"idGS\": \"67\", \"idEmmg\": \"85\"}', 'UPDATE', '2024-12-13 19:43:21', '2024-12-13 19:43:21'),
(156, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"15\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"databse4\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"27\", \"idConfig\": \"53\", \"idGS\": \"67\", \"idEmmg\": \"85\"}', '{\"idInstanciaBD\": \"15\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"databse4\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"27\", \"idConfig\": \"53\", \"idGS\": \"67\", \"idEmmg\": \"85\"}', 'UPDATE', '2024-12-13 19:43:30', '2024-12-13 19:43:30'),
(157, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"15\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"databse4\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"27\", \"idConfig\": \"53\", \"idGS\": \"67\", \"idEmmg\": \"85\"}', '{\"idInstanciaBD\": \"15\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"databse4\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"27\", \"idConfig\": \"53\", \"idGS\": \"67\", \"idEmmg\": \"85\"}', 'UPDATE', '2024-12-13 19:46:00', '2024-12-13 19:46:00');
INSERT INTO `audit_table_user` (`id`, `taula_modificada`, `fila_antigua`, `fila_nova`, `tipus_modificacio`, `data_modificacio`, `trx_timestamp`) VALUES
(158, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"15\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"databse4\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"27\", \"idConfig\": \"53\", \"idGS\": \"67\", \"idEmmg\": \"85\"}', '{\"idInstanciaBD\": \"15\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"databse4\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"27\", \"idConfig\": \"53\", \"idGS\": \"67\", \"idEmmg\": \"85\"}', 'UPDATE', '2024-12-13 19:46:55', '2024-12-13 19:46:55'),
(159, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"15\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"databse4\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"27\", \"idConfig\": \"53\", \"idGS\": \"67\", \"idEmmg\": \"85\"}', '{\"idInstanciaBD\": \"15\", \"idBDServei\": \"1\", \"nomMaster\": \"khaoula\", \"nomBD\": \"databse4\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"27\", \"idConfig\": \"53\", \"idGS\": \"67\", \"idEmmg\": \"85\"}', 'UPDATE', '2024-12-13 19:48:59', '2024-12-13 19:48:59'),
(160, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"9\", \"idBDServei\": \"1\", \"nomMaster\": \"ikkeneFadi\", \"nomBD\": \"preubaFinalOKlkasdj\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"6\", \"idConfig\": \"27\", \"idGS\": \"42\", \"idEmmg\": \"38\"}', '{\"idInstanciaBD\": \"9\", \"idBDServei\": \"1\", \"nomMaster\": \"ikkeneFadi\", \"nomBD\": \"preubaFinalOKlkasdj\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"6\", \"idConfig\": \"27\", \"idGS\": \"42\", \"idEmmg\": \"38\"}', 'UPDATE', '2024-12-13 19:49:48', '2024-12-13 19:49:48'),
(161, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"fado\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 19:49:56', '2024-12-13 19:49:56'),
(162, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"9\", \"idBDServei\": \"1\", \"nomMaster\": \"ikkeneFadi\", \"nomBD\": \"preubaFinalOKlkasdj\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"6\", \"idConfig\": \"27\", \"idGS\": \"42\", \"idEmmg\": \"38\"}', '{\"idInstanciaBD\": \"9\", \"idBDServei\": \"1\", \"nomMaster\": \"ikkeneFadi\", \"nomBD\": \"preubaFinalOKlkasdj\", \"grupParametresBD\": \"default.oracle-ee-19\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"Amazon Aurora\", \"idSubXar\": \"6\", \"idConfig\": \"27\", \"idGS\": \"42\", \"idEmmg\": \"38\"}', 'UPDATE', '2024-12-13 19:50:03', '2024-12-13 19:50:03'),
(163, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"jiji\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"68\", \"tipusSource\": \"S2\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 19:58:52', '2024-12-13 19:58:52'),
(164, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"jiji\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"69\", \"tipusSource\": \"S2\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 20:00:21', '2024-12-13 20:00:21'),
(165, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"jiji\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"70\", \"tipusSource\": \"S2\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 20:01:15', '2024-12-13 20:01:15'),
(166, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"jiji\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"71\", \"tipusSource\": \"S2\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 20:01:57', '2024-12-13 20:01:57'),
(167, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"jiji\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"72\", \"tipusSource\": \"S2\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 20:02:05', '2024-12-13 20:02:05'),
(168, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"jiji\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"73\", \"tipusSource\": \"S2\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 20:03:47', '2024-12-13 20:03:47'),
(169, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"jiji\", \"descripcio\": \"\", \"descrpicioSource\": \"NULL\", \"idGS\": \"74\", \"tipusSource\": \"S2\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 20:03:57', '2024-12-13 20:03:57'),
(170, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"red-eust\", \"descripcio\": \"obligatoria\", \"idVPC\": \"vpc-a3c48b39e98f23a34\", \"idSubXar\": \"28\", \"nomReg\": \"eu-west-2\"}', 'INSERT', '2024-12-13 20:03:57', '2024-12-13 20:03:57'),
(171, 'INSTANCIA_BD', NULL, '{\"idInstanciaBD\": \"16\", \"idBDServei\": \"1\", \"nomMaster\": \"ikkene\", \"nomBD\": \"parquing\", \"grupParametresBD\": \"default.mariadb10.5\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"28\", \"idConfig\": \"60\", \"idGS\": \"74\", \"idEmmg\": \"99\"}', 'INSERT', '2024-12-13 20:03:57', '2024-12-13 20:03:57'),
(172, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 20:09:03', '2024-12-13 20:09:03'),
(173, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 20:10:58', '2024-12-13 20:10:58'),
(174, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 20:11:05', '2024-12-13 20:11:05'),
(175, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 20:11:51', '2024-12-13 20:11:51'),
(176, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 20:15:49', '2024-12-13 20:15:49'),
(177, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"3\", \"idBDServei\": \"1\", \"nomMaster\": \"admin3\", \"nomBD\": \"Database2\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"PostgreSQL\", \"idSubXar\": \"3\", \"idConfig\": \"2\", \"idGS\": \"3\", \"idEmmg\": \"3\"}', '{\"idInstanciaBD\": \"3\", \"idBDServei\": \"1\", \"nomMaster\": \"admin3\", \"nomBD\": \"Databasep\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"PostgreSQL\", \"idSubXar\": \"3\", \"idConfig\": \"2\", \"idGS\": \"3\", \"idEmmg\": \"3\"}', 'UPDATE', '2024-12-13 20:16:05', '2024-12-13 20:16:05'),
(178, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib01\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 20:17:33', '2024-12-13 20:17:33'),
(179, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib01\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib01\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 20:17:42', '2024-12-13 20:17:42'),
(180, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib01\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib01\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 20:18:09', '2024-12-13 20:18:09'),
(181, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib01\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.sqlserver-se-15\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"kib01\", \"nomBD\": \"Database11\", \"grupParametresBD\": \"default.mysql8.0\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-13 20:18:40', '2024-12-13 20:18:40'),
(182, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"16\", \"idBDServei\": \"1\", \"nomMaster\": \"ikkene\", \"nomBD\": \"parquing\", \"grupParametresBD\": \"default.mariadb10.5\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"28\", \"idConfig\": \"60\", \"idGS\": \"74\", \"idEmmg\": \"99\"}', '{\"idInstanciaBD\": \"16\", \"idBDServei\": \"1\", \"nomMaster\": \"ikkene\", \"nomBD\": \"parquing\", \"grupParametresBD\": \"default.mariadb10.5\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"28\", \"idConfig\": \"60\", \"idGS\": \"74\", \"idEmmg\": \"99\"}', 'UPDATE', '2024-12-13 20:23:35', '2024-12-13 20:23:35'),
(183, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"16\", \"idBDServei\": \"1\", \"nomMaster\": \"ikkene\", \"nomBD\": \"parquing\", \"grupParametresBD\": \"default.mariadb10.5\", \"periodeRetencioCS\": \"0\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"28\", \"idConfig\": \"60\", \"idGS\": \"74\", \"idEmmg\": \"99\"}', NULL, 'DELETE', '2024-12-13 20:37:44', '2024-12-13 20:37:44'),
(184, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"fds\", \"descripcio\": \"gfd\", \"descrpicioSource\": \"NULL\", \"idGS\": \"75\", \"tipusSource\": \"S2\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 20:55:52', '2024-12-13 20:55:52'),
(185, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"subred5\", \"descripcio\": \"fsdjkh\", \"idVPC\": \"vpc-1a2b234ac5e7f123f\", \"idSubXar\": \"29\", \"nomReg\": \"eu-west-2\"}', 'INSERT', '2024-12-13 20:55:52', '2024-12-13 20:55:52'),
(186, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fitxer.ppk\", \"idClauSessio\": \"12372\", \"tipusClau\": \"RSA\", \"nomClau\": \"fsdf\"}', 'INSERT', '2024-12-13 20:55:52', '2024-12-13 20:55:52'),
(187, 'INSTANCIA_SERVIDOR', NULL, '{\"nomServ\": \"server\", \"dataCreacio\": \"2024-12-13\", \"idInstancia_servidor\": \"5\", \"idServidorInfra\": \"1\", \"idSubXar\": \"29\", \"idConfig\": \"61\", \"idGS\": \"75\", \"idEmmg\": \"101\", \"idClauSessio\": \"12372\", \"idAMI\": \"1\"}', 'INSERT', '2024-12-13 20:55:52', '2024-12-13 20:55:52'),
(188, 'INSTANCIA_SERVIDOR', '{\"nomServ\": \"server\", \"dataCreacio\": \"2024-12-13\", \"idInstancia_servidor\": \"5\", \"idServidorInfra\": \"1\", \"idSubXar\": \"29\", \"idConfig\": \"61\", \"idGS\": \"75\", \"idEmmg\": \"101\", \"idClauSessio\": \"12372\", \"idAMI\": \"1\"}', NULL, 'DELETE', '2024-12-13 20:55:55', '2024-12-13 20:55:55'),
(189, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gfd\", \"descripcio\": \"gdf\", \"descrpicioSource\": \"NULL\", \"idGS\": \"76\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 20:57:45', '2024-12-13 20:57:45'),
(190, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gfd\", \"descripcio\": \"gdf\", \"descrpicioSource\": \"NULL\", \"idGS\": \"77\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 20:58:12', '2024-12-13 20:58:12'),
(191, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"gfd\", \"descripcio\": \"gdf\", \"descrpicioSource\": \"NULL\", \"idGS\": \"78\", \"tipusSource\": \"S1\", \"tipus\": \"P3\", \"Protocol\": \"ICMP\"}', 'INSERT', '2024-12-13 20:58:20', '2024-12-13 20:58:20'),
(192, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"gfdg\", \"descripcio\": \"gd\", \"idVPC\": \"vpc-1a2b234ac5e7f123f\", \"idSubXar\": \"30\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 20:58:20', '2024-12-13 20:58:20'),
(193, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"fd\", \"idClauSessio\": \"12373\", \"tipusClau\": \"ED25519\", \"nomClau\": \"gdf\"}', 'INSERT', '2024-12-13 20:58:20', '2024-12-13 20:58:20'),
(194, 'INSTANCIA_SERVIDOR', NULL, '{\"nomServ\": \"server\", \"dataCreacio\": \"2024-12-13\", \"idInstancia_servidor\": \"6\", \"idServidorInfra\": \"1\", \"idSubXar\": \"30\", \"idConfig\": \"64\", \"idGS\": \"78\", \"idEmmg\": \"107\", \"idClauSessio\": \"12373\", \"idAMI\": \"1\"}', 'INSERT', '2024-12-13 20:58:20', '2024-12-13 20:58:20'),
(195, 'INSTANCIA_SERVIDOR', '{\"nomServ\": \"Servidor4\", \"dataCreacio\": \"2024-12-12\", \"idInstancia_servidor\": \"1\", \"idServidorInfra\": \"1\", \"idSubXar\": \"1\", \"idConfig\": \"1\", \"idGS\": \"45\", \"idEmmg\": \"37\", \"idClauSessio\": \"12355\", \"idAMI\": \"1\"}', NULL, 'DELETE', '2024-12-13 21:35:34', '2024-12-13 21:35:34'),
(196, 'INSTANCIA_SERVIDOR', '{\"nomServ\": \"servidorFinal\", \"dataCreacio\": \"2024-12-13\", \"idInstancia_servidor\": \"4\", \"idServidorInfra\": \"1\", \"idSubXar\": \"21\", \"idConfig\": \"47\", \"idGS\": \"61\", \"idEmmg\": \"73\", \"idClauSessio\": \"12371\", \"idAMI\": \"1\"}', NULL, 'DELETE', '2024-12-13 21:35:34', '2024-12-13 21:35:34'),
(197, 'INSTANCIA_SERVIDOR', '{\"nomServ\": \"server\", \"dataCreacio\": \"2024-12-13\", \"idInstancia_servidor\": \"6\", \"idServidorInfra\": \"1\", \"idSubXar\": \"30\", \"idConfig\": \"64\", \"idGS\": \"78\", \"idEmmg\": \"107\", \"idClauSessio\": \"12373\", \"idAMI\": \"1\"}', NULL, 'DELETE', '2024-12-13 21:35:36', '2024-12-13 21:35:36'),
(198, 'GRUP_SEGURETAT', NULL, '{\"nom\": \"fsd\", \"descripcio\": \"fs\", \"descrpicioSource\": \"NULL\", \"idGS\": \"79\", \"tipusSource\": \"S2\", \"tipus\": \"P1\", \"Protocol\": \"TCP\"}', 'INSERT', '2024-12-13 21:37:24', '2024-12-13 21:37:24'),
(199, 'SUBXARXA', NULL, '{\"nomSubXarxa\": \"dgf\", \"descripcio\": \"gfd\", \"idVPC\": \"vpc-1a2b234ac5e7f123f\", \"idSubXar\": \"31\", \"nomReg\": \"eu-west-1\"}', 'INSERT', '2024-12-13 21:37:24', '2024-12-13 21:37:24'),
(200, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"dgfd\", \"idClauSessio\": \"12374\", \"tipusClau\": \"RSA\", \"nomClau\": \"gd\"}', 'INSERT', '2024-12-13 21:37:24', '2024-12-13 21:37:24'),
(201, 'INSTANCIA_SERVIDOR', NULL, '{\"nomServ\": \"serveidor\", \"dataCreacio\": \"2024-12-13\", \"idInstancia_servidor\": \"7\", \"idServidorInfra\": \"1\", \"idSubXar\": \"31\", \"idConfig\": \"65\", \"idGS\": \"79\", \"idEmmg\": \"109\", \"idClauSessio\": \"12374\", \"idAMI\": \"1\"}', 'INSERT', '2024-12-13 21:37:24', '2024-12-13 21:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `audit_table_user_copy`
--

CREATE TABLE `audit_table_user_copy` (
  `id` int(11) NOT NULL,
  `taula_modificada` varchar(255) DEFAULT NULL,
  `fila_antigua` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`fila_antigua`)),
  `fila_nova` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`fila_nova`)),
  `tipus_modificacio` varchar(16) DEFAULT NULL,
  `data_modificacio` datetime DEFAULT NULL,
  `trx_timestamp` datetime DEFAULT NULL,
  `fecha_copia` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_table_user_copy`
--

INSERT INTO `audit_table_user_copy` (`id`, `taula_modificada`, `fila_antigua`, `fila_nova`, `tipus_modificacio`, `data_modificacio`, `trx_timestamp`, `fecha_copia`) VALUES
(1, 'CLAU_SESSIO', NULL, '{\"nomFitxer\": \"meuFileProva3\", \"idClauSessio\": \"8\", \"tipusClau\": \"RSA\", \"nomClau\": \"clauProva3\"}', 'INSERT', '2024-12-11 14:11:13', '2024-12-11 14:11:13', '2024-12-11'),
(2, 'INSTANCIA_BD', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"admin1\", \"nomBD\": \"Database1\", \"grupParametresBD\": \"default\", \"periodeRetencioCS\": \"30\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', '{\"idInstanciaBD\": \"1\", \"idBDServei\": \"1\", \"nomMaster\": \"admin1\", \"nomBD\": \"Database1\", \"grupParametresBD\": \"optimized\", \"periodeRetencioCS\": \"30\", \"tipusMotor\": \"MariaDB\", \"idSubXar\": \"1\", \"idConfig\": \"2\", \"idGS\": \"1\", \"idEmmg\": \"1\"}', 'UPDATE', '2024-12-11 14:14:14', '2024-12-11 14:14:14', '2024-12-11'),
(3, 'INSTANCIA_BUCKET', NULL, '{\"nomBucket\": \"first_bucket\", \"periodeBloqueig\": \"NULL\", \"idBucket\": \"1\", \"nomReg\": \"eu-west-3\", \"idServei\": \"2\"}', 'INSERT', '2024-12-11 14:18:59', '2024-12-11 14:18:59', '2024-12-11'),
(4, 'INSTANCIA_BUCKET', '{\"nomBucket\": \"first_bucket\", \"periodeBloqueig\": \"NULL\", \"idBucket\": \"1\", \"nomReg\": \"eu-west-3\", \"idServei\": \"2\"}', '{\"nomBucket\": \"First_Corrected_Bucket\", \"periodeBloqueig\": \"NULL\", \"idBucket\": \"1\", \"nomReg\": \"eu-west-3\", \"idServei\": \"2\"}', 'UPDATE', '2024-12-11 14:21:00', '2024-12-11 14:21:00', '2024-12-11'),
(5, 'INSTANCIA_BUCKET', '{\"nomBucket\": \"First_Corrected_Bucket\", \"periodeBloqueig\": \"NULL\", \"idBucket\": \"1\", \"nomReg\": \"eu-west-3\", \"idServei\": \"2\"}', NULL, 'DELETE', '2024-12-11 14:21:43', '2024-12-11 14:21:43', '2024-12-11');

-- --------------------------------------------------------

--
-- Table structure for table `carpeta`
--

CREATE TABLE `carpeta` (
  `nom` varchar(64) NOT NULL,
  `encriptat` bit(1) NOT NULL,
  `idCarpeta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cataleg`
--

CREATE TABLE `cataleg` (
  `descripcio` text DEFAULT NULL,
  `idCataleg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cataleg`
--

INSERT INTO `cataleg` (`descripcio`, `idCataleg`) VALUES
(NULL, 1),
(NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `clau_sessio`
--

CREATE TABLE `clau_sessio` (
  `nomFitxer` varchar(64) NOT NULL,
  `idClauSessio` int(11) NOT NULL,
  `tipusClau` varchar(16) DEFAULT NULL,
  `nomClau` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clau_sessio`
--

INSERT INTO `clau_sessio` (`nomFitxer`, `idClauSessio`, `tipusClau`, `nomClau`) VALUES
('fichero_clave', 1, 'RSA', 'miclave'),
('fichero2', 2, 'RSA', 'clave_servidor_1'),
('fichero2', 3, 'ED25519', 'clave_servidor_ED'),
('fichero_clave', 4, 'ED25519', 'claveEC2'),
('key_login', 5, 'ED25519', 'MiclaveEC2'),
('meuFileProva', 6, 'RSA', 'clauProva'),
('meuFileProva2', 7, 'RSA', 'clauProva2'),
('trg', 12352, 'ED25519', '123'),
('rer', 12353, 'ED25519', 'fdfd'),
('fdfds', 12354, 'ED25519', 'fdsf'),
('fichero.ppk', 12355, 'ED25519', 'clave3'),
('etrt', 12356, 'ED25519', 'nhgf'),
('fileclau.ppk', 12357, 'ED25519', '4534'),
('fileclau.ppk', 12358, 'ED25519', '4534'),
('fileclau.ppk', 12359, 'ED25519', '4534'),
('fileclau.ppk', 12360, 'ED25519', '4534'),
('fileclau.ppk', 12361, 'ED25519', '4534'),
('fileclau.ppk', 12362, 'ED25519', '4534'),
('fileclau.ppk', 12363, 'ED25519', '4534'),
('fileclau.ppk', 12364, 'ED25519', '4534'),
('fileclau.ppk', 12365, 'ED25519', '4534'),
('fileclau.ppk', 12366, 'ED25519', '4534'),
('fileclau.ppk', 12367, 'ED25519', '4534'),
('fileclau.ppk', 12368, 'ED25519', '4534'),
('fileclau.ppk', 12369, 'ED25519', '4534'),
('fitxer.ppk', 12370, 'ED25519', 'fkjdj'),
('fichero.ppk', 12371, 'ED25519', 'clave3'),
('fitxer.ppk', 12372, 'RSA', 'fsdf'),
('fd', 12373, 'ED25519', 'gdf'),
('dgfd', 12374, 'RSA', 'gd');

--
-- Triggers `clau_sessio`
--
DELIMITER $$
CREATE TRIGGER `tr_CLAU_SESSIO_after_insert` AFTER INSERT ON `clau_sessio` FOR EACH ROW BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('CLAU_SESSIO', NULL, JSON_OBJECT('nomFitxer', IFNULL(NEW.`nomFitxer`, 'NULL'), 'idClauSessio', IFNULL(NEW.`idClauSessio`, 'NULL'), 'tipusClau', IFNULL(NEW.`tipusClau`, 'NULL'), 'nomClau', IFNULL(NEW.`nomClau`, 'NULL')), 'INSERT', NOW(), CURRENT_TIMESTAMP);
        END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `configuracio`
--

CREATE TABLE `configuracio` (
  `idConfig` int(11) NOT NULL,
  `numCPU` int(11) NOT NULL,
  `RAM` int(11) NOT NULL,
  `xarxa` varchar(32) DEFAULT NULL,
  `preuPerHora` decimal(5,2) DEFAULT NULL,
  `nom` varchar(64) NOT NULL,
  `IP` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `configuracio`
--

INSERT INTO `configuracio` (`idConfig`, `numCPU`, `RAM`, `xarxa`, `preuPerHora`, `nom`, `IP`) VALUES
(1, 2, 4, '2.054', NULL, 'DB.t3.micro', 0x3131392e3231372e37362e3134320000),
(2, 2, 1, '2,085', NULL, 'db.t3.micro', 0x33342e3138302e3130342e3233330000),
(3, 2, 4, '2.054', NULL, 'DB.t3.micro', 0x36352e3137362e3132322e3431000000),
(4, 0, 0, '', NULL, '7', 0x00000000000000000000000000000000),
(5, 2, 1, '2,085', NULL, 'db.t3.micro', 0x00000000000000000000000000000000),
(6, 2, 1, '2,085', NULL, 'db.t3.micro', 0x00000000000000000000000000000000),
(7, 2, 1, '2,085', NULL, 'db.t3.micro', NULL),
(8, 2, 1, '2,085', NULL, 'db.t3.micro', NULL),
(9, 2, 1, '2,085', NULL, 'db.t3.micro', NULL),
(10, 2, 1, '2,085', NULL, 'db.t3.micro', NULL),
(11, 2, 1, '2,085', NULL, 'db.t3.micro', NULL),
(12, 2, 1, '2,085', NULL, 'db.t3.micro', NULL),
(13, 2, 1, '2,085', NULL, 'db.t3.micro', NULL),
(14, 2, 1, '2,085', NULL, 'db.t3.micro', NULL),
(15, 2, 8, '10', NULL, 'db.m5.large', NULL),
(16, 2, 8, '10', NULL, 'db.m5.large', NULL),
(17, 2, 8, '10', NULL, 'db.m5.large', NULL),
(18, 2, 8, '10', NULL, 'db.m5.large', NULL),
(19, 2, 8, '10', NULL, 'db.m5.large', NULL),
(20, 2, 8, '10', NULL, 'db.m5.large', NULL),
(21, 2, 8, '10', NULL, 'db.m5.large', NULL),
(22, 2, 8, '10', NULL, 'db.m5.large', NULL),
(23, 2, 8, '10', NULL, 'db.m5.large', NULL),
(24, 2, 8, '10', NULL, 'db.m5.large', NULL),
(25, 3, 2, '5,00', NULL, 'db.t3.small', NULL),
(26, 2, 1, '2,085', NULL, 'db.t3.micro', NULL),
(27, 2, 8, '10', NULL, 'db.m5.large', NULL),
(28, 2, 4, '2.054', NULL, 'DB.t3.micro', 0x3132332e3534362e3735340000000000),
(29, 2, 4, '2.054', NULL, 'DB.t3.micro', 0x3132332e3435362e3737000000000000),
(30, 2, 4, '2.054', NULL, 'DB.t3.micro', 0x3132332e34352e362e37000000000000),
(31, 2, 4, '2.054', NULL, 'DB.t3.micro', 0x3132332e3435362e37382e3900000000),
(32, 2, 4, '2.054', NULL, 'DB.t3.micro', 0x3132332e3435362e37382e3900000000),
(33, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(34, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(35, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(36, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(37, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(38, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(39, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(40, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(41, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(42, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(43, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(44, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(45, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(46, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e3435352e36362e0000000000),
(47, 2, 1, '3,00$', 3.00, 'db.t3.micro', 0x3132332e3435352e36362e0000000000),
(48, 2, 1, '2,085', NULL, 'db.t3.micro', NULL),
(49, 2, 1, '2,085', NULL, 'db.t3.micro', NULL),
(50, 2, 1, '2,085', NULL, 'db.t3.micro', NULL),
(51, 2, 1, '2,085', NULL, 'db.t3.micro', NULL),
(52, 2, 1, '2,085', NULL, 'db.t3.micro', NULL),
(53, 4, 4, '5,000', NULL, 'db.t3.medium', NULL),
(54, 3, 2, '5,00', NULL, 'db.t3.small', NULL),
(55, 3, 2, '5,00', NULL, 'db.t3.small', NULL),
(56, 3, 2, '5,00', NULL, 'db.t3.small', NULL),
(57, 3, 2, '5,00', NULL, 'db.t3.small', 0x00000000000000000000000000000000),
(58, 3, 2, '5,00', NULL, 'db.t3.small', 0x3132332e31302e32332e393800000000),
(59, 3, 2, '5,00', NULL, 'db.t3.small', 0x3132332e31302e32332e393800000000),
(60, 2, 8, '10', NULL, 'db.m5.large', 0x3132332e31302e32332e393800000000),
(61, 4, 4, NULL, 5.00, 'db.t3.medium', 0x3132332e34352e36362e370000000000),
(62, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(63, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(64, 2, 1, NULL, 3.00, 'db.t3.micro', 0x3132332e34352e36362e370000000000),
(65, 4, 4, NULL, 5.00, 'db.t3.medium', 0x3132332e34352e36362e370000000000);

-- --------------------------------------------------------

--
-- Table structure for table `configuracio_usuaris`
--

CREATE TABLE `configuracio_usuaris` (
  `idCataleg` int(11) NOT NULL,
  `idUsuari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emmagatzamatge`
--

CREATE TABLE `emmagatzamatge` (
  `tipus` varchar(3) NOT NULL,
  `emgAssignat` int(11) NOT NULL,
  `idEmmg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emmagatzamatge`
--

INSERT INTO `emmagatzamatge` (`tipus`, `emgAssignat`, `idEmmg`) VALUES
('gp2', 20, 1),
('gp1', 10, 2),
('gp3', 15, 3),
('io1', 30, 4),
('gp1', 20, 5),
('2', 10, 6),
('2', 10, 7),
('2', 12, 8),
('2', 12, 9),
('2', 12, 10),
('2', 12, 11),
('2', 12, 12),
('2', 12, 13),
('2', 12, 14),
('2', 12, 15),
('2', 12, 16),
('2', 12, 17),
('1', 12, 18),
('1', 12, 19),
('1', 12, 20),
('1', 12, 21),
('1', 12, 22),
('1', 12, 23),
('1', 12, 24),
('1', 12, 25),
('1', 12, 26),
('1', 12, 27),
('1', 12, 28),
('1', 12, 29),
('1', 12, 30),
('1', 12, 31),
('1', 12, 32),
('1', 12, 33),
('1', 12, 34),
('2', 40, 35),
('2', 40, 36),
('GP2', 20, 37),
('GP2', 12, 38),
('gp2', 12, 39),
('gp2', 12, 40),
('gp2', 12, 41),
('gp2', 12, 42),
('gp2', 12, 43),
('GP1', 12, 44),
('GP1', 12, 45),
('GP1', 12, 46),
('GP1', 12, 47),
('GP1', 12, 48),
('GP1', 12, 49),
('GP1', 12, 50),
('GP1', 12, 51),
('GP1', 12, 52),
('GP1', 12, 53),
('GP1', 12, 54),
('GP1', 12, 55),
('GP1', 12, 56),
('GP1', 12, 57),
('GP1', 12, 58),
('GP1', 12, 59),
('GP1', 12, 60),
('GP1', 12, 61),
('GP1', 12, 62),
('GP1', 12, 63),
('GP1', 12, 64),
('GP1', 12, 65),
('GP1', 12, 66),
('GP1', 12, 67),
('GP1', 12, 68),
('GP1', 12, 69),
('GP1', 15, 70),
('GP1', 15, 71),
('GP1', 15, 72),
('GP1', 23, 73),
('GP1', 12, 74),
('GP1', 12, 75),
('GP1', 12, 76),
('GP1', 12, 77),
('GP1', 12, 78),
('GP1', 12, 79),
('GP1', 12, 80),
('GP1', 12, 81),
('GP1', 12, 82),
('GP1', 12, 83),
('GP1', 1, 84),
('GP1', 1, 85),
('GP2', 12, 86),
('GP2', 12, 87),
('GP2', 12, 88),
('GP2', 12, 89),
('GP2', 12, 90),
('GP2', 12, 91),
('GP2', 12, 92),
('GP2', 12, 93),
('GP2', 12, 94),
('GP2', 12, 95),
('GP2', 12, 96),
('GP2', 12, 97),
('GP2', 12, 98),
('GP2', 12, 99),
('GP2', 12, 100),
('GP2', 12, 101),
('GP1', 12, 102),
('GP1', 12, 103),
('GP1', 12, 104),
('GP1', 12, 105),
('GP1', 12, 106),
('GP1', 12, 107),
('GP1', 12, 108),
('GP1', 12, 109);

-- --------------------------------------------------------

--
-- Table structure for table `grup_admin`
--

CREATE TABLE `grup_admin` (
  `nivellPrivilegi` int(11) NOT NULL,
  `dataCreacio` date NOT NULL,
  `nomGrup` varchar(64) NOT NULL,
  `idGrupA` int(11) NOT NULL,
  `idOrg` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grup_no_admin`
--

CREATE TABLE `grup_no_admin` (
  `dataCreacio` date NOT NULL,
  `nomGrup` varchar(64) NOT NULL,
  `idGrupNA` int(11) NOT NULL,
  `idUsuariCreador` int(11) DEFAULT NULL,
  `idOrg` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grup_seguretat`
--

CREATE TABLE `grup_seguretat` (
  `nom` varchar(64) NOT NULL,
  `descripcio` text NOT NULL,
  `descrpicioSource` text DEFAULT NULL,
  `idGS` int(11) NOT NULL,
  `tipusSource` varchar(32) DEFAULT NULL,
  `tipus` varchar(16) NOT NULL,
  `Protocol` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grup_seguretat`
--

INSERT INTO `grup_seguretat` (`nom`, `descripcio`, `descrpicioSource`, `idGS`, `tipusSource`, `tipus`, `Protocol`) VALUES
('WebServerGroup', 'Allows HTTP and HTTPS traffic', 'Load Balancer access', 1, 'S2', 'P1', 'TCP'),
('DBGroup', 'Allows MySQL traffic', 'Instance communication', 2, 'S1', 'P1', 'TCP'),
('DNSGroup', 'Allows DNS traffic', 'Elastic IP access', 3, 'S3', 'P2', 'UDP'),
('PingGroup', 'Allows ICMP ping traffic', 'Instance diagnostics', 4, 'S1', 'P3', 'ICMP'),
('bfdgf', 'gdf', NULL, 25, 'S1', 'P3', 'ICMP'),
('bfdgf', 'gdf', NULL, 26, 'S1', 'P3', 'ICMP'),
('fdsdjh', 'desprico opcionla prova', NULL, 27, 'S2', 'P3', 'ICMP'),
('fdsdjh', 'desprico opcionla prova', NULL, 28, 'S2', 'P3', 'ICMP'),
('dfhgfhfghfg', 'hfg', NULL, 29, 'S1', 'P3', 'ICMP'),
('dfhgfhfghfg', 'hfg', NULL, 30, 'S1', 'P3', 'ICMP'),
('dfhgfhfghfg', 'hfg', NULL, 31, 'S1', 'P3', 'ICMP'),
('dfhgfhfghfg', 'hfg', NULL, 32, 'S1', 'P3', 'ICMP'),
('dfhgfhfghfg', 'hfg', NULL, 33, 'S1', 'P3', 'ICMP'),
('miGrupoSeguretat', 'un grup nou', NULL, 34, 'S3', 'P1', 'TCP'),
('miGrupoSeguretat', 'un grup nou', NULL, 35, 'S3', 'P1', 'TCP'),
('miGrupoSeguretat', 'un grup nou', NULL, 36, 'S3', 'P1', 'TCP'),
('miGrupoSeguretat', 'un grup nou', NULL, 37, 'S3', 'P1', 'TCP'),
('miGrupoSeguretat', 'un grup nou', NULL, 38, 'S3', 'P1', 'TCP'),
('miGrupoSeguretat', 'un grup nou', NULL, 39, 'S3', 'P1', 'TCP'),
('miGrupoSeguretat', 'un grup nou', NULL, 40, 'S3', 'P1', 'TCP'),
('MiGrupoSeguretat', '', NULL, 41, 'S2', 'P2', 'UDP'),
('gp90dsjh', 'fs', NULL, 42, 'S2', 'P1', 'TCP'),
('vsfdgf', 'gfd', NULL, 43, 'S1', 'P3', 'ICMP'),
('dfds', 'fsds', NULL, 44, 'S1', 'P3', 'ICMP'),
('nomNou', 'camp descriptiu del grup de seguetat', NULL, 45, 'S2', 'P1', 'TCP'),
('fdgg', 'gd', NULL, 46, 'S1', 'P3', 'ICMP'),
('gs404', '', NULL, 47, 'S1', 'P3', 'ICMP'),
('gs404', '', NULL, 48, 'S1', 'P3', 'ICMP'),
('gs404', '', NULL, 49, 'S1', 'P3', 'ICMP'),
('gs404', '', NULL, 50, 'S1', 'P3', 'ICMP'),
('gs404', '', NULL, 51, 'S1', 'P3', 'ICMP'),
('gs404', '', NULL, 52, 'S1', 'P3', 'ICMP'),
('gs404', '', NULL, 53, 'S1', 'P3', 'ICMP'),
('gs404', '', NULL, 54, 'S1', 'P3', 'ICMP'),
('gs404', '', NULL, 55, 'S1', 'P3', 'ICMP'),
('gs404', '', NULL, 56, 'S1', 'P3', 'ICMP'),
('gs404', '', NULL, 57, 'S1', 'P3', 'ICMP'),
('gs404', '', NULL, 58, 'S1', 'P3', 'ICMP'),
('gs404', '', NULL, 59, 'S1', 'P3', 'ICMP'),
('kfjdhkj', '', NULL, 60, 'S1', 'P3', 'ICMP'),
('nomNou', 'camp descriptiu del grup de seguetat', NULL, 61, 'S1', 'P3', 'ICMP'),
('gfd', 'gsfd', NULL, 62, 'S1', 'P3', 'ICMP'),
('gfd', 'gsfd', NULL, 63, 'S1', 'P3', 'ICMP'),
('gfd', 'gsfd', NULL, 64, 'S1', 'P3', 'ICMP'),
('gfd', 'gsd', NULL, 65, 'S1', 'P3', 'ICMP'),
('er', 'jhjk', NULL, 66, 'S1', 'P3', 'ICMP'),
('gs', 'gsd', NULL, 67, 'S1', 'P3', 'ICMP'),
('jiji', '', NULL, 68, 'S2', 'P1', 'TCP'),
('jiji', '', NULL, 69, 'S2', 'P1', 'TCP'),
('jiji', '', NULL, 70, 'S2', 'P1', 'TCP'),
('jiji', '', NULL, 71, 'S2', 'P1', 'TCP'),
('jiji', '', NULL, 72, 'S2', 'P1', 'TCP'),
('jiji', '', NULL, 73, 'S2', 'P1', 'TCP'),
('jiji', '', NULL, 74, 'S2', 'P1', 'TCP'),
('fds', 'gfd', NULL, 75, 'S2', 'P1', 'TCP'),
('gfd', 'gdf', NULL, 76, 'S1', 'P3', 'ICMP'),
('gfd', 'gdf', NULL, 77, 'S1', 'P3', 'ICMP'),
('gfd', 'gdf', NULL, 78, 'S1', 'P3', 'ICMP'),
('fsd', 'fs', NULL, 79, 'S2', 'P1', 'TCP');

--
-- Triggers `grup_seguretat`
--
DELIMITER $$
CREATE TRIGGER `tr_GRUP_SEGURETAT_after_insert` AFTER INSERT ON `grup_seguretat` FOR EACH ROW BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('GRUP_SEGURETAT', NULL, JSON_OBJECT('nom', IFNULL(NEW.`nom`, 'NULL'), 'descripcio', IFNULL(NEW.`descripcio`, 'NULL'), 'descrpicioSource', IFNULL(NEW.`descrpicioSource`, 'NULL'), 'idGS', IFNULL(NEW.`idGS`, 'NULL'), 'tipusSource', IFNULL(NEW.`tipusSource`, 'NULL'), 'tipus', IFNULL(NEW.`tipus`, 'NULL'), 'Protocol', IFNULL(NEW.`Protocol`, 'NULL')), 'INSERT', NOW(), CURRENT_TIMESTAMP);
        END
$$
DELIMITER ;

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

-- --------------------------------------------------------

--
-- Table structure for table `infraestructura`
--

CREATE TABLE `infraestructura` (
  `nomInfr` varchar(32) DEFAULT NULL,
  `idInfr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `infraestructura`
--

INSERT INTO `infraestructura` (`nomInfr`, `idInfr`) VALUES
('servidors', 1);

-- --------------------------------------------------------

--
-- Table structure for table `instancia_bd`
--

CREATE TABLE `instancia_bd` (
  `idInstanciaBD` int(11) NOT NULL,
  `idBDServei` int(11) NOT NULL,
  `nomMaster` varchar(64) NOT NULL,
  `nomBD` varchar(64) NOT NULL,
  `grupParametresBD` varchar(64) NOT NULL,
  `periodeRetencioCS` int(11) DEFAULT NULL,
  `tipusMotor` varchar(32) NOT NULL,
  `idSubXar` int(11) NOT NULL,
  `idConfig` int(11) NOT NULL,
  `idGS` int(11) NOT NULL,
  `idEmmg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instancia_bd`
--

INSERT INTO `instancia_bd` (`idInstanciaBD`, `idBDServei`, `nomMaster`, `nomBD`, `grupParametresBD`, `periodeRetencioCS`, `tipusMotor`, `idSubXar`, `idConfig`, `idGS`, `idEmmg`) VALUES
(1, 1, 'kib01', 'Database11', 'default.mysql8.0', 0, 'MariaDB', 1, 2, 1, 1),
(2, 1, 'adminFadi2', 'Database2fadi', 'default.GETgres13', 0, 'MySQL', 1, 3, 2, 2),
(3, 1, 'admin3', 'Databasep', 'default.sqlserver-se-15', 0, 'PostgreSQL', 3, 2, 3, 3),
(4, 1, 'kib', 'practica5', 'default.sqlserver-se-15', 7, 'Oracle', 1, 2, 4, 4),
(9, 1, 'ikkeneFadi', 'preubaFinalOKlkasdj', 'default.oracle-ee-19', 0, 'Amazon Aurora', 6, 27, 42, 38),
(15, 1, 'khaoula', 'databse4', 'default.oracle-ee-19', 0, 'Amazon Aurora', 27, 53, 67, 85);

--
-- Triggers `instancia_bd`
--
DELIMITER $$
CREATE TRIGGER `tr_INSTANCIA_BD_after_delete` AFTER DELETE ON `instancia_bd` FOR EACH ROW BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('INSTANCIA_BD', JSON_OBJECT('idInstanciaBD', IFNULL(OLD.`idInstanciaBD`, 'NULL'), 'idBDServei', IFNULL(OLD.`idBDServei`, 'NULL'), 'nomMaster', IFNULL(OLD.`nomMaster`, 'NULL'), 'nomBD', IFNULL(OLD.`nomBD`, 'NULL'), 'grupParametresBD', IFNULL(OLD.`grupParametresBD`, 'NULL'), 'periodeRetencioCS', IFNULL(OLD.`periodeRetencioCS`, 'NULL'), 'tipusMotor', IFNULL(OLD.`tipusMotor`, 'NULL'), 'idSubXar', IFNULL(OLD.`idSubXar`, 'NULL'), 'idConfig', IFNULL(OLD.`idConfig`, 'NULL'), 'idGS', IFNULL(OLD.`idGS`, 'NULL'), 'idEmmg', IFNULL(OLD.`idEmmg`, 'NULL')), NULL, 'DELETE', NOW(), CURRENT_TIMESTAMP);
        END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_INSTANCIA_BD_after_insert` AFTER INSERT ON `instancia_bd` FOR EACH ROW BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('INSTANCIA_BD', NULL, JSON_OBJECT('idInstanciaBD', IFNULL(NEW.`idInstanciaBD`, 'NULL'), 'idBDServei', IFNULL(NEW.`idBDServei`, 'NULL'), 'nomMaster', IFNULL(NEW.`nomMaster`, 'NULL'), 'nomBD', IFNULL(NEW.`nomBD`, 'NULL'), 'grupParametresBD', IFNULL(NEW.`grupParametresBD`, 'NULL'), 'periodeRetencioCS', IFNULL(NEW.`periodeRetencioCS`, 'NULL'), 'tipusMotor', IFNULL(NEW.`tipusMotor`, 'NULL'), 'idSubXar', IFNULL(NEW.`idSubXar`, 'NULL'), 'idConfig', IFNULL(NEW.`idConfig`, 'NULL'), 'idGS', IFNULL(NEW.`idGS`, 'NULL'), 'idEmmg', IFNULL(NEW.`idEmmg`, 'NULL')), 'INSERT', NOW(), CURRENT_TIMESTAMP);
        END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_INSTANCIA_BD_after_update` AFTER UPDATE ON `instancia_bd` FOR EACH ROW BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('INSTANCIA_BD', JSON_OBJECT('idInstanciaBD', IFNULL(OLD.`idInstanciaBD`, 'NULL'), 'idBDServei', IFNULL(OLD.`idBDServei`, 'NULL'), 'nomMaster', IFNULL(OLD.`nomMaster`, 'NULL'), 'nomBD', IFNULL(OLD.`nomBD`, 'NULL'), 'grupParametresBD', IFNULL(OLD.`grupParametresBD`, 'NULL'), 'periodeRetencioCS', IFNULL(OLD.`periodeRetencioCS`, 'NULL'), 'tipusMotor', IFNULL(OLD.`tipusMotor`, 'NULL'), 'idSubXar', IFNULL(OLD.`idSubXar`, 'NULL'), 'idConfig', IFNULL(OLD.`idConfig`, 'NULL'), 'idGS', IFNULL(OLD.`idGS`, 'NULL'), 'idEmmg', IFNULL(OLD.`idEmmg`, 'NULL')), JSON_OBJECT('idInstanciaBD', IFNULL(NEW.`idInstanciaBD`, 'NULL'), 'idBDServei', IFNULL(NEW.`idBDServei`, 'NULL'), 'nomMaster', IFNULL(NEW.`nomMaster`, 'NULL'), 'nomBD', IFNULL(NEW.`nomBD`, 'NULL'), 'grupParametresBD', IFNULL(NEW.`grupParametresBD`, 'NULL'), 'periodeRetencioCS', IFNULL(NEW.`periodeRetencioCS`, 'NULL'), 'tipusMotor', IFNULL(NEW.`tipusMotor`, 'NULL'), 'idSubXar', IFNULL(NEW.`idSubXar`, 'NULL'), 'idConfig', IFNULL(NEW.`idConfig`, 'NULL'), 'idGS', IFNULL(NEW.`idGS`, 'NULL'), 'idEmmg', IFNULL(NEW.`idEmmg`, 'NULL')), 'UPDATE', NOW(), CURRENT_TIMESTAMP);
        END
$$
DELIMITER ;

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
-- Dumping data for table `instancia_bucket`
--

INSERT INTO `instancia_bucket` (`nomBucket`, `periodeBloqueig`, `idBucket`, `nomReg`, `idServei`) VALUES
('asdfasdf', 30, 3, 'eu-west-2', 2),
('werpreubaBucket', 30, 4, 'eu-west-2', 2),
('khuiyu', 30, 5, 'eu-west-1', 2),
('miBucket8', 90, 6, 'eu-west-3', 2),
('otroBucket', 365, 8, 'eu-west-1', 2),
('Ibucket', 90, 10, 'eu-west-3', 2),
('miBucket', 0, 11, 'eu-west-1', 2),
('bucketFinalOK', 90, 12, 'eu-west-1', 2);

--
-- Triggers `instancia_bucket`
--
DELIMITER $$
CREATE TRIGGER `tr_INSTANCIA_BUCKET_after_delete` AFTER DELETE ON `instancia_bucket` FOR EACH ROW BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('INSTANCIA_BUCKET', JSON_OBJECT('nomBucket', IFNULL(OLD.`nomBucket`, 'NULL'), 'periodeBloqueig', IFNULL(OLD.`periodeBloqueig`, 'NULL'), 'idBucket', IFNULL(OLD.`idBucket`, 'NULL'), 'nomReg', IFNULL(OLD.`nomReg`, 'NULL'), 'idServei', IFNULL(OLD.`idServei`, 'NULL')), NULL, 'DELETE', NOW(), CURRENT_TIMESTAMP);
        END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_INSTANCIA_BUCKET_after_insert` AFTER INSERT ON `instancia_bucket` FOR EACH ROW BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('INSTANCIA_BUCKET', NULL, JSON_OBJECT('nomBucket', IFNULL(NEW.`nomBucket`, 'NULL'), 'periodeBloqueig', IFNULL(NEW.`periodeBloqueig`, 'NULL'), 'idBucket', IFNULL(NEW.`idBucket`, 'NULL'), 'nomReg', IFNULL(NEW.`nomReg`, 'NULL'), 'idServei', IFNULL(NEW.`idServei`, 'NULL')), 'INSERT', NOW(), CURRENT_TIMESTAMP);
        END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_INSTANCIA_BUCKET_after_update` AFTER UPDATE ON `instancia_bucket` FOR EACH ROW BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('INSTANCIA_BUCKET', JSON_OBJECT('nomBucket', IFNULL(OLD.`nomBucket`, 'NULL'), 'periodeBloqueig', IFNULL(OLD.`periodeBloqueig`, 'NULL'), 'idBucket', IFNULL(OLD.`idBucket`, 'NULL'), 'nomReg', IFNULL(OLD.`nomReg`, 'NULL'), 'idServei', IFNULL(OLD.`idServei`, 'NULL')), JSON_OBJECT('nomBucket', IFNULL(NEW.`nomBucket`, 'NULL'), 'periodeBloqueig', IFNULL(NEW.`periodeBloqueig`, 'NULL'), 'idBucket', IFNULL(NEW.`idBucket`, 'NULL'), 'nomReg', IFNULL(NEW.`nomReg`, 'NULL'), 'idServei', IFNULL(NEW.`idServei`, 'NULL')), 'UPDATE', NOW(), CURRENT_TIMESTAMP);
        END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `instancia_servidor`
--

CREATE TABLE `instancia_servidor` (
  `nomServ` varchar(64) NOT NULL,
  `dataCreacio` date NOT NULL,
  `idInstancia_servidor` int(11) NOT NULL,
  `idServidorInfra` int(11) NOT NULL,
  `idSubXar` int(11) NOT NULL,
  `idConfig` int(11) NOT NULL,
  `idGS` int(11) NOT NULL,
  `idEmmg` int(11) NOT NULL,
  `idClauSessio` int(11) NOT NULL,
  `idAMI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instancia_servidor`
--

INSERT INTO `instancia_servidor` (`nomServ`, `dataCreacio`, `idInstancia_servidor`, `idServidorInfra`, `idSubXar`, `idConfig`, `idGS`, `idEmmg`, `idClauSessio`, `idAMI`) VALUES
('serveidor', '2024-12-13', 7, 1, 31, 65, 79, 109, 12374, 1);

--
-- Triggers `instancia_servidor`
--
DELIMITER $$
CREATE TRIGGER `tr_INSTANCIA_SERVIDOR_after_delete` AFTER DELETE ON `instancia_servidor` FOR EACH ROW BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('INSTANCIA_SERVIDOR', JSON_OBJECT('nomServ', IFNULL(OLD.`nomServ`, 'NULL'), 'dataCreacio', IFNULL(OLD.`dataCreacio`, 'NULL'), 'idInstancia_servidor', IFNULL(OLD.`idInstancia_servidor`, 'NULL'), 'idServidorInfra', IFNULL(OLD.`idServidorInfra`, 'NULL'), 'idSubXar', IFNULL(OLD.`idSubXar`, 'NULL'), 'idConfig', IFNULL(OLD.`idConfig`, 'NULL'), 'idGS', IFNULL(OLD.`idGS`, 'NULL'), 'idEmmg', IFNULL(OLD.`idEmmg`, 'NULL'), 'idClauSessio', IFNULL(OLD.`idClauSessio`, 'NULL'), 'idAMI', IFNULL(OLD.`idAMI`, 'NULL')), NULL, 'DELETE', NOW(), CURRENT_TIMESTAMP);
        END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_INSTANCIA_SERVIDOR_after_insert` AFTER INSERT ON `instancia_servidor` FOR EACH ROW BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('INSTANCIA_SERVIDOR', NULL, JSON_OBJECT('nomServ', IFNULL(NEW.`nomServ`, 'NULL'), 'dataCreacio', IFNULL(NEW.`dataCreacio`, 'NULL'), 'idInstancia_servidor', IFNULL(NEW.`idInstancia_servidor`, 'NULL'), 'idServidorInfra', IFNULL(NEW.`idServidorInfra`, 'NULL'), 'idSubXar', IFNULL(NEW.`idSubXar`, 'NULL'), 'idConfig', IFNULL(NEW.`idConfig`, 'NULL'), 'idGS', IFNULL(NEW.`idGS`, 'NULL'), 'idEmmg', IFNULL(NEW.`idEmmg`, 'NULL'), 'idClauSessio', IFNULL(NEW.`idClauSessio`, 'NULL'), 'idAMI', IFNULL(NEW.`idAMI`, 'NULL')), 'INSERT', NOW(), CURRENT_TIMESTAMP);
        END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_INSTANCIA_SERVIDOR_after_update` AFTER UPDATE ON `instancia_servidor` FOR EACH ROW BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('INSTANCIA_SERVIDOR', JSON_OBJECT('nomServ', IFNULL(OLD.`nomServ`, 'NULL'), 'dataCreacio', IFNULL(OLD.`dataCreacio`, 'NULL'), 'idInstancia_servidor', IFNULL(OLD.`idInstancia_servidor`, 'NULL'), 'idServidorInfra', IFNULL(OLD.`idServidorInfra`, 'NULL'), 'idSubXar', IFNULL(OLD.`idSubXar`, 'NULL'), 'idConfig', IFNULL(OLD.`idConfig`, 'NULL'), 'idGS', IFNULL(OLD.`idGS`, 'NULL'), 'idEmmg', IFNULL(OLD.`idEmmg`, 'NULL'), 'idClauSessio', IFNULL(OLD.`idClauSessio`, 'NULL'), 'idAMI', IFNULL(OLD.`idAMI`, 'NULL')), JSON_OBJECT('nomServ', IFNULL(NEW.`nomServ`, 'NULL'), 'dataCreacio', IFNULL(NEW.`dataCreacio`, 'NULL'), 'idInstancia_servidor', IFNULL(NEW.`idInstancia_servidor`, 'NULL'), 'idServidorInfra', IFNULL(NEW.`idServidorInfra`, 'NULL'), 'idSubXar', IFNULL(NEW.`idSubXar`, 'NULL'), 'idConfig', IFNULL(NEW.`idConfig`, 'NULL'), 'idGS', IFNULL(NEW.`idGS`, 'NULL'), 'idEmmg', IFNULL(NEW.`idEmmg`, 'NULL'), 'idClauSessio', IFNULL(NEW.`idClauSessio`, 'NULL'), 'idAMI', IFNULL(NEW.`idAMI`, 'NULL')), 'UPDATE', NOW(), CURRENT_TIMESTAMP);
        END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manteniment_personal`
--

CREATE TABLE `manteniment_personal` (
  `idCataleg` int(11) NOT NULL,
  `idPersonalCloud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `motor_bd`
--

CREATE TABLE `motor_bd` (
  `tipusMotor` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `motor_bd`
--

INSERT INTO `motor_bd` (`tipusMotor`) VALUES
('Amazon Aurora'),
('MariaDB'),
('Microsoft SQL Server'),
('MySQL'),
('Oracle'),
('PostgreSQL');

-- --------------------------------------------------------

--
-- Table structure for table `organitzacio`
--

CREATE TABLE `organitzacio` (
  `nomOrg` varchar(64) NOT NULL,
  `dataInvolucrament` date NOT NULL,
  `idOrg` int(11) NOT NULL,
  `tipusOrg` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permisos_grup_administrador`
--

CREATE TABLE `permisos_grup_administrador` (
  `nom` varchar(64) NOT NULL,
  `idGrupA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permisos_grup_no_administrador`
--

CREATE TABLE `permisos_grup_no_administrador` (
  `nom` varchar(64) NOT NULL,
  `idGrupNA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `nom` varchar(32) NOT NULL,
  `llinatges` varchar(128) NOT NULL,
  `correuPersonal` varchar(128) NOT NULL,
  `dataNaixement` date NOT NULL,
  `identificador` varchar(10) NOT NULL,
  `correuAcces` varchar(128) NOT NULL,
  `idPersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`nom`, `llinatges`, `correuPersonal`, `dataNaixement`, `identificador`, `correuAcces`, `idPersona`) VALUES
('claudia', 'martinez', 'KIKsomthing@gmail.com', '1998-12-23', 'Y6839853E', 'claudiamTotCloud@.es.tc', 1),
('iman', 'fernandez', 'imanf@gmail.com', '2000-01-27', 'h1234567y', 'imanFTotCloud@.es.tc', 2),
('luis', 'gonzales', 'luisG@gmail.com', '1975-09-15', 'h1234765y', 'LuisTTotCloud.es.tc', 3);

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE `personal` (
  `adreca` varchar(256) DEFAULT NULL,
  `telefon` varchar(9) NOT NULL,
  `dataAlta` date NOT NULL,
  `idPersonalCloud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personal`
--

INSERT INTO `personal` (`adreca`, `telefon`, `dataAlta`, `idPersonalCloud`) VALUES
(NULL, '123456789', '2023-10-01', 1),
(NULL, '234567891', '2020-09-17', 2),
(NULL, '345678912', '2024-12-01', 3);

-- --------------------------------------------------------

--
-- Table structure for table `privilegi`
--

CREATE TABLE `privilegi` (
  `nom` varchar(64) NOT NULL,
  `descripción` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `protocol`
--

CREATE TABLE `protocol` (
  `tipus` varchar(16) NOT NULL,
  `Protocol` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `protocol`
--

INSERT INTO `protocol` (`tipus`, `Protocol`) VALUES
('P3', 'ICMP'),
('P1', 'TCP'),
('P2', 'UDP');

-- --------------------------------------------------------

--
-- Table structure for table `protocol_range_port`
--

CREATE TABLE `protocol_range_port` (
  `Protocol` varchar(8) NOT NULL,
  `PortRange` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `protocol_range_port`
--

INSERT INTO `protocol_range_port` (`Protocol`, `PortRange`) VALUES
('ICMP', 0),
('TCP', 22),
('TCP', 80),
('TCP', 443),
('UDP', 53);

-- --------------------------------------------------------

--
-- Table structure for table `regio`
--

CREATE TABLE `regio` (
  `nomReg` varchar(64) NOT NULL,
  `disponible` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `regio`
--

INSERT INTO `regio` (`nomReg`, `disponible`) VALUES
('eu-central-1', b'0'),
('eu-south-1', b'0'),
('eu-west-1', b'1'),
('eu-west-2', b'1'),
('eu-west-3', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `servei`
--

CREATE TABLE `servei` (
  `categoria` varchar(16) NOT NULL,
  `nom` varchar(64) NOT NULL,
  `disponible` bit(1) NOT NULL,
  `block_public_access` bit(1) DEFAULT NULL,
  `preuMensual` decimal(5,2) NOT NULL,
  `idServei` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `servei`
--

INSERT INTO `servei` (`categoria`, `nom`, `disponible`, `block_public_access`, `preuMensual`, `idServei`) VALUES
('DATABASE', 'instancias_bd', b'1', b'0', 50.00, 1),
('CLOUD STORAGE', 'instancias_bucket', b'1', b'1', 20.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `tipusSource` varchar(32) NOT NULL,
  `source` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `source`
--

INSERT INTO `source` (`tipusSource`, `source`) VALUES
('S1', 'Instance'),
('S2', 'Load Balancer'),
('S3', 'Elastic IP');

-- --------------------------------------------------------

--
-- Table structure for table `subxarxa`
--

CREATE TABLE `subxarxa` (
  `nomSubXarxa` varchar(64) NOT NULL,
  `descripcio` text DEFAULT NULL,
  `idVPC` varchar(128) NOT NULL,
  `idSubXar` int(11) NOT NULL,
  `nomReg` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subxarxa`
--

INSERT INTO `subxarxa` (`nomSubXarxa`, `descripcio`, `idVPC`, `idSubXar`, `nomReg`) VALUES
('Subxarxa1', 'Subxarxa ubicada a la regió eu-west-1', 'vpc-0a1b2c3d4e5f67890', 1, 'eu-west-1'),
('subxarxa2', NULL, 'vpc-0f1e2d3c4b5a67890', 2, 'eu-west-2'),
('subxarxa3', NULL, 'vpc-67890abcdef12345g', 3, 'eu-west-2'),
('subxarxa10', 'no se que posar aqui', 'fskfhskj7fsdkfjsd-fsd', 4, 'eu-west-2'),
('red-totcloud', 'camp obligatori no important', '98.3299854-343', 5, 'eu-west-3'),
('miXarxa', 'gdfhgfjkd', '09-897nvneruyiujbfdsmn', 6, 'eu-west-2'),
('subdred5', 'obligaotiro pero no seque', 'vpc-543tfe', 7, 'eu-west-1'),
('subdred5', 'obligaotiro pero no seque', 'vpc-543tfe', 8, 'eu-west-1'),
('subdred5', 'obligaotiro pero no seque', 'vpc-543tfe', 9, 'eu-west-1'),
('subdred5', 'obligaotiro pero no seque', 'vpc-543tfe', 10, 'eu-west-1'),
('subdred5', 'obligaotiro pero no seque', 'vpc-543tfe', 11, 'eu-west-1'),
('subdred5', 'obligaotiro pero no seque', 'vpc-543tfe', 12, 'eu-west-1'),
('subdred5', 'obligaotiro pero no seque', 'vpc-543tfe', 13, 'eu-west-1'),
('subdred5', 'obligaotiro pero no seque', 'vpc-543tfe', 14, 'eu-west-1'),
('subdred5', 'obligaotiro pero no seque', 'vpc-543tfe', 15, 'eu-west-1'),
('subdred5', 'obligaotiro pero no seque', 'vpc-543tfe', 16, 'eu-west-1'),
('subdred5', 'obligaotiro pero no seque', 'vpc-543tfe', 17, 'eu-west-1'),
('subdred5', 'obligaotiro pero no seque', 'vpc-543tfe', 18, 'eu-west-1'),
('subdred5', 'obligaotiro pero no seque', 'vpc-543tfe', 19, 'eu-west-1'),
('subred5', 'ffdsfj', 'vpc-94rejfkenj', 20, 'eu-west-1'),
('subred5', 'ffdsfj', 'vpc-94rejfkenj', 21, 'eu-west-1'),
('fsdfd', 'rere', 'vpc-fskfhdsj', 22, 'eu-west-1'),
('fsdfd', 'rere', 'vpc-fskfhdsj', 23, 'eu-west-1'),
('fsdfd', 'rere', 'vpc-fskfhdsj', 24, 'eu-west-1'),
('gfd', 'gfd', 'gfds45', 25, 'eu-west-1'),
('gd', 'gdre', 'vpir2389i', 26, 'eu-west-1'),
('subredFinal', 'descrpioc onligatoria', 'vpc-1dfa3564551834fe5', 27, 'eu-west-1'),
('red-eust', 'obligatoria', 'vpc-a3c48b39e98f23a34', 28, 'eu-west-2'),
('subred5', 'fsdjkh', 'vpc-1a2b234ac5e7f123f', 29, 'eu-west-2'),
('gfdg', 'gd', 'vpc-1a2b234ac5e7f123f', 30, 'eu-west-1'),
('dgf', 'gfd', 'vpc-1a2b234ac5e7f123f', 31, 'eu-west-1');

--
-- Triggers `subxarxa`
--
DELIMITER $$
CREATE TRIGGER `tr_SUBXARXA_after_insert` AFTER INSERT ON `subxarxa` FOR EACH ROW BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('SUBXARXA', NULL, JSON_OBJECT('nomSubXarxa', IFNULL(NEW.`nomSubXarxa`, 'NULL'), 'descripcio', IFNULL(NEW.`descripcio`, 'NULL'), 'idVPC', IFNULL(NEW.`idVPC`, 'NULL'), 'idSubXar', IFNULL(NEW.`idSubXar`, 'NULL'), 'nomReg', IFNULL(NEW.`nomReg`, 'NULL')), 'INSERT', NOW(), CURRENT_TIMESTAMP);
        END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tipus_clau`
--

CREATE TABLE `tipus_clau` (
  `tipus` varchar(16) NOT NULL,
  `formatFitxet` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipus_clau`
--

INSERT INTO `tipus_clau` (`tipus`, `formatFitxet`) VALUES
('ED25519', 'ppk'),
('RSA', 'pem');

-- --------------------------------------------------------

--
-- Table structure for table `tipus_organitzacio`
--

CREATE TABLE `tipus_organitzacio` (
  `tipusOrg` varchar(16) NOT NULL,
  `descripcio` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuari`
--

CREATE TABLE `usuari` (
  `dataSubscripcio` date NOT NULL,
  `idUsuari` int(11) NOT NULL,
  `idGenerador` int(11) DEFAULT NULL,
  `idGrupA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuari_no_admin`
--

CREATE TABLE `usuari_no_admin` (
  `idUsuari` int(11) NOT NULL,
  `idGrupNA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `versio`
--

CREATE TABLE `versio` (
  `nomVersio` varchar(16) NOT NULL,
  `idVersio` int(11) NOT NULL,
  `tipusMotor` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `versio`
--

INSERT INTO `versio` (`nomVersio`, `idVersio`, `tipusMotor`) VALUES
('10.6.14', 1, 'MariaDB'),
('10.7.8', 2, 'MariaDB'),
('10.8.6', 3, 'MariaDB'),
('8.0.34', 4, 'MySQL'),
('5.7.42', 5, 'MySQL'),
('5.6.51', 6, 'MySQL'),
('15.4.1', 10, 'PostgreSQL'),
('14.9.2', 11, 'PostgreSQL'),
('13.12.8', 12, 'PostgreSQL'),
('5.6', 13, 'Amazon Aurora'),
('21.3', 14, 'Oracle'),
('19.3', 15, 'Oracle'),
('13.12.8', 16, 'Amazon Aurora'),
('14.9.2', 17, 'Amazon Aurora'),
('15.4.1', 18, 'Amazon Aurora');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ami`
--
ALTER TABLE `ami`
  ADD PRIMARY KEY (`idAMI`);

--
-- Indexes for table `arxiu`
--
ALTER TABLE `arxiu`
  ADD PRIMARY KEY (`idArxiu`);

--
-- Indexes for table `audit_table_user`
--
ALTER TABLE `audit_table_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_table_user_copy`
--
ALTER TABLE `audit_table_user_copy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carpeta`
--
ALTER TABLE `carpeta`
  ADD PRIMARY KEY (`idCarpeta`);

--
-- Indexes for table `cataleg`
--
ALTER TABLE `cataleg`
  ADD PRIMARY KEY (`idCataleg`);

--
-- Indexes for table `clau_sessio`
--
ALTER TABLE `clau_sessio`
  ADD PRIMARY KEY (`idClauSessio`),
  ADD KEY `fk_tipus_clau` (`tipusClau`);

--
-- Indexes for table `configuracio`
--
ALTER TABLE `configuracio`
  ADD PRIMARY KEY (`idConfig`);

--
-- Indexes for table `configuracio_usuaris`
--
ALTER TABLE `configuracio_usuaris`
  ADD PRIMARY KEY (`idCataleg`,`idUsuari`),
  ADD KEY `FK_Usuari` (`idUsuari`);

--
-- Indexes for table `emmagatzamatge`
--
ALTER TABLE `emmagatzamatge`
  ADD PRIMARY KEY (`idEmmg`);

--
-- Indexes for table `grup_admin`
--
ALTER TABLE `grup_admin`
  ADD PRIMARY KEY (`idGrupA`),
  ADD KEY `fk_ORG_GA` (`idOrg`);

--
-- Indexes for table `grup_no_admin`
--
ALTER TABLE `grup_no_admin`
  ADD PRIMARY KEY (`idGrupNA`),
  ADD KEY `fk_ORG_GNA` (`idOrg`),
  ADD KEY `fk_GNA_creador` (`idUsuariCreador`);

--
-- Indexes for table `grup_seguretat`
--
ALTER TABLE `grup_seguretat`
  ADD PRIMARY KEY (`idGS`),
  ADD KEY `fk_GS_SOURCE` (`tipusSource`),
  ADD KEY `fk_GS_tipusGS` (`tipus`),
  ADD KEY `fk_GS_ProtocolRange` (`Protocol`);

--
-- Indexes for table `historial_contrasenya`
--
ALTER TABLE `historial_contrasenya`
  ADD PRIMARY KEY (`idHistorial`),
  ADD KEY `fk_const_BD` (`idInstanciaBD`),
  ADD KEY `fk_PERSONA_CONTR` (`IdPersona`);

--
-- Indexes for table `infraestructura`
--
ALTER TABLE `infraestructura`
  ADD PRIMARY KEY (`idInfr`);

--
-- Indexes for table `instancia_bd`
--
ALTER TABLE `instancia_bd`
  ADD PRIMARY KEY (`idInstanciaBD`),
  ADD KEY `fk_servei_BD` (`idBDServei`),
  ADD KEY `fk_BD_subx` (`idSubXar`),
  ADD KEY `fk_BD_CONFIG` (`idConfig`),
  ADD KEY `fk_BD_GS` (`idGS`),
  ADD KEY `fk_BD_EMMG` (`idEmmg`),
  ADD KEY `fk_BD_motor` (`tipusMotor`);

--
-- Indexes for table `instancia_bucket`
--
ALTER TABLE `instancia_bucket`
  ADD PRIMARY KEY (`idBucket`),
  ADD KEY `fk_regio_bucket` (`nomReg`),
  ADD KEY `fk_servei_bucket` (`idServei`);

--
-- Indexes for table `instancia_servidor`
--
ALTER TABLE `instancia_servidor`
  ADD PRIMARY KEY (`idInstancia_servidor`),
  ADD KEY `fk_servidor_infra` (`idServidorInfra`),
  ADD KEY `fk_servidor_AMI` (`idAMI`),
  ADD KEY `fk_servidor_subx` (`idSubXar`),
  ADD KEY `fk_servidor_config` (`idConfig`),
  ADD KEY `fk_servidor_GS` (`idGS`),
  ADD KEY `fk_servidor_EMMG` (`idEmmg`),
  ADD KEY `fk_servidor_CS` (`idClauSessio`);

--
-- Indexes for table `manteniment_personal`
--
ALTER TABLE `manteniment_personal`
  ADD PRIMARY KEY (`idPersonalCloud`,`idCataleg`),
  ADD KEY `fk_cat_man` (`idCataleg`);

--
-- Indexes for table `motor_bd`
--
ALTER TABLE `motor_bd`
  ADD PRIMARY KEY (`tipusMotor`);

--
-- Indexes for table `organitzacio`
--
ALTER TABLE `organitzacio`
  ADD PRIMARY KEY (`idOrg`),
  ADD KEY `fk_ORG_tipusORG` (`tipusOrg`);

--
-- Indexes for table `permisos_grup_administrador`
--
ALTER TABLE `permisos_grup_administrador`
  ADD PRIMARY KEY (`idGrupA`,`nom`),
  ADD KEY `fk_previlegi` (`nom`);

--
-- Indexes for table `permisos_grup_no_administrador`
--
ALTER TABLE `permisos_grup_no_administrador`
  ADD PRIMARY KEY (`idGrupNA`,`nom`),
  ADD KEY `fk_previ` (`nom`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idPersona`);

--
-- Indexes for table `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`idPersonalCloud`);

--
-- Indexes for table `privilegi`
--
ALTER TABLE `privilegi`
  ADD PRIMARY KEY (`nom`);

--
-- Indexes for table `protocol`
--
ALTER TABLE `protocol`
  ADD PRIMARY KEY (`tipus`),
  ADD UNIQUE KEY `Protocol` (`Protocol`);

--
-- Indexes for table `protocol_range_port`
--
ALTER TABLE `protocol_range_port`
  ADD PRIMARY KEY (`Protocol`,`PortRange`);

--
-- Indexes for table `regio`
--
ALTER TABLE `regio`
  ADD PRIMARY KEY (`nomReg`);

--
-- Indexes for table `servei`
--
ALTER TABLE `servei`
  ADD PRIMARY KEY (`idServei`);

--
-- Indexes for table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`tipusSource`);

--
-- Indexes for table `subxarxa`
--
ALTER TABLE `subxarxa`
  ADD PRIMARY KEY (`idSubXar`),
  ADD KEY `fk_regio_subxarxa` (`nomReg`);

--
-- Indexes for table `tipus_clau`
--
ALTER TABLE `tipus_clau`
  ADD PRIMARY KEY (`tipus`);

--
-- Indexes for table `tipus_organitzacio`
--
ALTER TABLE `tipus_organitzacio`
  ADD PRIMARY KEY (`tipusOrg`);

--
-- Indexes for table `usuari`
--
ALTER TABLE `usuari`
  ADD PRIMARY KEY (`idUsuari`),
  ADD KEY `fk_USUARI_USUARI` (`idGenerador`),
  ADD KEY `fk_USUARI_GRupA` (`idGrupA`);

--
-- Indexes for table `usuari_no_admin`
--
ALTER TABLE `usuari_no_admin`
  ADD PRIMARY KEY (`idUsuari`,`idGrupNA`),
  ADD KEY `fk_GrupNA` (`idGrupNA`);

--
-- Indexes for table `versio`
--
ALTER TABLE `versio`
  ADD PRIMARY KEY (`idVersio`),
  ADD KEY `fk_tipus_motor` (`tipusMotor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ami`
--
ALTER TABLE `ami`
  MODIFY `idAMI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `arxiu`
--
ALTER TABLE `arxiu`
  MODIFY `idArxiu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_table_user`
--
ALTER TABLE `audit_table_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `audit_table_user_copy`
--
ALTER TABLE `audit_table_user_copy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carpeta`
--
ALTER TABLE `carpeta`
  MODIFY `idCarpeta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cataleg`
--
ALTER TABLE `cataleg`
  MODIFY `idCataleg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clau_sessio`
--
ALTER TABLE `clau_sessio`
  MODIFY `idClauSessio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12375;

--
-- AUTO_INCREMENT for table `configuracio`
--
ALTER TABLE `configuracio`
  MODIFY `idConfig` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `emmagatzamatge`
--
ALTER TABLE `emmagatzamatge`
  MODIFY `idEmmg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `grup_admin`
--
ALTER TABLE `grup_admin`
  MODIFY `idGrupA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grup_no_admin`
--
ALTER TABLE `grup_no_admin`
  MODIFY `idGrupNA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grup_seguretat`
--
ALTER TABLE `grup_seguretat`
  MODIFY `idGS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `historial_contrasenya`
--
ALTER TABLE `historial_contrasenya`
  MODIFY `idHistorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `instancia_bd`
--
ALTER TABLE `instancia_bd`
  MODIFY `idInstanciaBD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `instancia_bucket`
--
ALTER TABLE `instancia_bucket`
  MODIFY `idBucket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `instancia_servidor`
--
ALTER TABLE `instancia_servidor`
  MODIFY `idInstancia_servidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `organitzacio`
--
ALTER TABLE `organitzacio`
  MODIFY `idOrg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `persona`
--
ALTER TABLE `persona`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `servei`
--
ALTER TABLE `servei`
  MODIFY `idServei` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subxarxa`
--
ALTER TABLE `subxarxa`
  MODIFY `idSubXar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `versio`
--
ALTER TABLE `versio`
  MODIFY `idVersio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clau_sessio`
--
ALTER TABLE `clau_sessio`
  ADD CONSTRAINT `fk_tipus_clau` FOREIGN KEY (`tipusClau`) REFERENCES `tipus_clau` (`tipus`);

--
-- Constraints for table `configuracio_usuaris`
--
ALTER TABLE `configuracio_usuaris`
  ADD CONSTRAINT `FK_Usuari` FOREIGN KEY (`idUsuari`) REFERENCES `usuari` (`idUsuari`),
  ADD CONSTRAINT `fk_cataleg` FOREIGN KEY (`idCataleg`) REFERENCES `cataleg` (`idCataleg`);

--
-- Constraints for table `grup_admin`
--
ALTER TABLE `grup_admin`
  ADD CONSTRAINT `fk_ORG_GA` FOREIGN KEY (`idOrg`) REFERENCES `organitzacio` (`idOrg`);

--
-- Constraints for table `grup_no_admin`
--
ALTER TABLE `grup_no_admin`
  ADD CONSTRAINT `fk_GNA_creador` FOREIGN KEY (`idUsuariCreador`) REFERENCES `usuari` (`idUsuari`),
  ADD CONSTRAINT `fk_ORG_GNA` FOREIGN KEY (`idOrg`) REFERENCES `organitzacio` (`idOrg`);

--
-- Constraints for table `grup_seguretat`
--
ALTER TABLE `grup_seguretat`
  ADD CONSTRAINT `fk_GS_ProtocolRange` FOREIGN KEY (`Protocol`) REFERENCES `protocol_range_port` (`Protocol`),
  ADD CONSTRAINT `fk_GS_SOURCE` FOREIGN KEY (`tipusSource`) REFERENCES `source` (`tipusSource`),
  ADD CONSTRAINT `fk_GS_tipusGS` FOREIGN KEY (`tipus`) REFERENCES `protocol` (`tipus`);

--
-- Constraints for table `historial_contrasenya`
--
ALTER TABLE `historial_contrasenya`
  ADD CONSTRAINT `fk_PERSONA_CONTR` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`idPersona`),
  ADD CONSTRAINT `fk_const_BD` FOREIGN KEY (`idInstanciaBD`) REFERENCES `instancia_bd` (`idInstanciaBD`);

--
-- Constraints for table `infraestructura`
--
ALTER TABLE `infraestructura`
  ADD CONSTRAINT `FK_INFRA_CATALEG` FOREIGN KEY (`idInfr`) REFERENCES `cataleg` (`idCataleg`);

--
-- Constraints for table `instancia_bd`
--
ALTER TABLE `instancia_bd`
  ADD CONSTRAINT `fk_BD_CONFIG` FOREIGN KEY (`idConfig`) REFERENCES `configuracio` (`idConfig`),
  ADD CONSTRAINT `fk_BD_EMMG` FOREIGN KEY (`idEmmg`) REFERENCES `emmagatzamatge` (`idEmmg`),
  ADD CONSTRAINT `fk_BD_GS` FOREIGN KEY (`idGS`) REFERENCES `grup_seguretat` (`idGS`),
  ADD CONSTRAINT `fk_BD_motor` FOREIGN KEY (`tipusMotor`) REFERENCES `motor_bd` (`tipusMotor`),
  ADD CONSTRAINT `fk_BD_subx` FOREIGN KEY (`idSubXar`) REFERENCES `subxarxa` (`idSubXar`),
  ADD CONSTRAINT `fk_servei_BD` FOREIGN KEY (`idBDServei`) REFERENCES `servei` (`idServei`);

--
-- Constraints for table `instancia_bucket`
--
ALTER TABLE `instancia_bucket`
  ADD CONSTRAINT `fk_regio_bucket` FOREIGN KEY (`nomReg`) REFERENCES `regio` (`nomReg`),
  ADD CONSTRAINT `fk_servei_bucket` FOREIGN KEY (`idServei`) REFERENCES `servei` (`idServei`);

--
-- Constraints for table `instancia_servidor`
--
ALTER TABLE `instancia_servidor`
  ADD CONSTRAINT `fk_servidor_AMI` FOREIGN KEY (`idAMI`) REFERENCES `ami` (`idAMI`),
  ADD CONSTRAINT `fk_servidor_CS` FOREIGN KEY (`idClauSessio`) REFERENCES `clau_sessio` (`idClauSessio`),
  ADD CONSTRAINT `fk_servidor_EMMG` FOREIGN KEY (`idEmmg`) REFERENCES `emmagatzamatge` (`idEmmg`),
  ADD CONSTRAINT `fk_servidor_GS` FOREIGN KEY (`idGS`) REFERENCES `grup_seguretat` (`idGS`),
  ADD CONSTRAINT `fk_servidor_config` FOREIGN KEY (`idConfig`) REFERENCES `configuracio` (`idConfig`),
  ADD CONSTRAINT `fk_servidor_infra` FOREIGN KEY (`idServidorInfra`) REFERENCES `infraestructura` (`idInfr`),
  ADD CONSTRAINT `fk_servidor_subx` FOREIGN KEY (`idSubXar`) REFERENCES `subxarxa` (`idSubXar`);

--
-- Constraints for table `manteniment_personal`
--
ALTER TABLE `manteniment_personal`
  ADD CONSTRAINT `fk_cat_man` FOREIGN KEY (`idCataleg`) REFERENCES `cataleg` (`idCataleg`),
  ADD CONSTRAINT `fk_pers_manten` FOREIGN KEY (`idPersonalCloud`) REFERENCES `personal` (`idPersonalCloud`);

--
-- Constraints for table `organitzacio`
--
ALTER TABLE `organitzacio`
  ADD CONSTRAINT `fk_ORG_tipusORG` FOREIGN KEY (`tipusOrg`) REFERENCES `tipus_organitzacio` (`tipusOrg`);

--
-- Constraints for table `permisos_grup_administrador`
--
ALTER TABLE `permisos_grup_administrador`
  ADD CONSTRAINT `FK_grupA` FOREIGN KEY (`idGrupA`) REFERENCES `grup_admin` (`idGrupA`),
  ADD CONSTRAINT `fk_previlegi` FOREIGN KEY (`nom`) REFERENCES `privilegi` (`nom`);

--
-- Constraints for table `permisos_grup_no_administrador`
--
ALTER TABLE `permisos_grup_no_administrador`
  ADD CONSTRAINT `FK_grupNAPermisos` FOREIGN KEY (`idGrupNA`) REFERENCES `grup_no_admin` (`idGrupNA`),
  ADD CONSTRAINT `fk_previ` FOREIGN KEY (`nom`) REFERENCES `privilegi` (`nom`);

--
-- Constraints for table `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `fk_personal_persona` FOREIGN KEY (`idPersonalCloud`) REFERENCES `persona` (`idPersona`);

--
-- Constraints for table `protocol_range_port`
--
ALTER TABLE `protocol_range_port`
  ADD CONSTRAINT `fk_protocol_tipus` FOREIGN KEY (`Protocol`) REFERENCES `protocol` (`Protocol`);

--
-- Constraints for table `servei`
--
ALTER TABLE `servei`
  ADD CONSTRAINT `FK_SERVRI_CATALEG` FOREIGN KEY (`idServei`) REFERENCES `cataleg` (`idCataleg`);

--
-- Constraints for table `subxarxa`
--
ALTER TABLE `subxarxa`
  ADD CONSTRAINT `fk_regio_subxarxa` FOREIGN KEY (`nomReg`) REFERENCES `regio` (`nomReg`);

--
-- Constraints for table `usuari`
--
ALTER TABLE `usuari`
  ADD CONSTRAINT `fk_USUARI_GRupA` FOREIGN KEY (`idGrupA`) REFERENCES `grup_admin` (`idGrupA`),
  ADD CONSTRAINT `fk_USUARI_USUARI` FOREIGN KEY (`idGenerador`) REFERENCES `usuari` (`idUsuari`),
  ADD CONSTRAINT `fk_usuari_personla` FOREIGN KEY (`idUsuari`) REFERENCES `persona` (`idPersona`);

--
-- Constraints for table `usuari_no_admin`
--
ALTER TABLE `usuari_no_admin`
  ADD CONSTRAINT `fk_GrupNA` FOREIGN KEY (`idGrupNA`) REFERENCES `grup_no_admin` (`idGrupNA`),
  ADD CONSTRAINT `fk_UsuariNoAdmin` FOREIGN KEY (`idUsuari`) REFERENCES `usuari` (`idUsuari`);

--
-- Constraints for table `versio`
--
ALTER TABLE `versio`
  ADD CONSTRAINT `fk_tipus_motor` FOREIGN KEY (`tipusMotor`) REFERENCES `motor_bd` (`tipusMotor`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `backup_incremental_user_audit` ON SCHEDULE EVERY 1 DAY STARTS '2024-12-11 22:53:13' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    -- Borra los registros anteriores en la tabla de backup (audit_table_user_copy)
    DELETE FROM audit_table_user_copy;

    -- Inserta los registros cambiados en los últimos 5 minutos desde la tabla de auditoría original (audit_table_user)
    INSERT INTO audit_table_user_copy (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp, fecha_copia)
    SELECT taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp, CURRENT_TIMESTAMP
    FROM audit_table_user
    WHERE data_modificacio >= NOW() - INTERVAL 1 DAY;  -- Filtra por los últimos 5 minutos 
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
