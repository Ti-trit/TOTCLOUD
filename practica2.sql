-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2024 at 02:26 PM
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
(5, 'INSTANCIA_BUCKET', '{\"nomBucket\": \"First_Corrected_Bucket\", \"periodeBloqueig\": \"NULL\", \"idBucket\": \"1\", \"nomReg\": \"eu-west-3\", \"idServei\": \"2\"}', NULL, 'DELETE', '2024-12-11 14:21:43', '2024-12-11 14:21:43');

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
('meuFileProva2', 7, 'RSA', 'clauProva2');

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
  `IP` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `configuracio`
--

INSERT INTO `configuracio` (`idConfig`, `numCPU`, `RAM`, `xarxa`, `preuPerHora`, `nom`, `IP`) VALUES
(1, 2, 4, '2.054', NULL, 'DB.t3.micro', 0x3131392e3231372e37362e3134320000),
(2, 3, 1, '2.054', NULL, 'DB.t2.micro', 0x33342e3138302e3130342e3233330000),
(3, 2, 4, '2.054', NULL, 'DB.t3.micro', 0x36352e3137362e3132322e3431000000);

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
('io1', 30, 4);

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
('PingGroup', 'Allows ICMP ping traffic', 'Instance diagnostics', 4, 'S1', 'P3', 'ICMP');

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
(1, 1, 'admin1', 'Database1', 'optimized', 30, 'MariaDB', 1, 2, 1, 1),
(2, 1, 'admin2', 'Database2', 'optimized', 7, 'MySQL', 1, 3, 2, 2),
(3, 1, 'admin3', 'Database3', 'high-performance', NULL, 'PostgreSQL', 3, 2, 3, 3),
(4, 1, 'admin4', 'Database4', 'secure', 14, 'SQLite', 1, 2, 4, 4),
(5, 1, 'admin5', 'Database5', 'balanced', NULL, 'MariaDB', 2, 2, 2, 1);

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
('MariaDB'),
('MySQL'),
('PostgreSQL'),
('SQLite');

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
('Subxarxa1', NULL, 'vpc-0a1b2c3d4e5f67890', 1, 'eu-west-1'),
('subxarxa2', NULL, 'vpc-0f1e2d3c4b5a67890', 2, 'eu-west-2'),
('subxarxa3', NULL, 'vpc-67890abcdef12345g', 3, 'eu-west-2');

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
('3.39.4', 7, 'SQLite'),
('3.38.5', 8, 'SQLite'),
('3.37.2', 9, 'SQLite'),
('15.4.1', 10, 'PostgreSQL'),
('14.9.2', 11, 'PostgreSQL'),
('13.12.8', 12, 'PostgreSQL');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `audit_table_user_copy`
--
ALTER TABLE `audit_table_user_copy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `idClauSessio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12352;

--
-- AUTO_INCREMENT for table `configuracio`
--
ALTER TABLE `configuracio`
  MODIFY `idConfig` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `emmagatzamatge`
--
ALTER TABLE `emmagatzamatge`
  MODIFY `idEmmg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `idGS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `historial_contrasenya`
--
ALTER TABLE `historial_contrasenya`
  MODIFY `idHistorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `instancia_bd`
--
ALTER TABLE `instancia_bd`
  MODIFY `idInstanciaBD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `instancia_bucket`
--
ALTER TABLE `instancia_bucket`
  MODIFY `idBucket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `instancia_servidor`
--
ALTER TABLE `instancia_servidor`
  MODIFY `idInstancia_servidor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organitzacio`
--
ALTER TABLE `organitzacio`
  MODIFY `idOrg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `persona`
--
ALTER TABLE `persona`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `servei`
--
ALTER TABLE `servei`
  MODIFY `idServei` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subxarxa`
--
ALTER TABLE `subxarxa`
  MODIFY `idSubXar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `versio`
--
ALTER TABLE `versio`
  MODIFY `idVersio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
CREATE DEFINER=`root`@`localhost` EVENT `copy_audit_incremental` ON SCHEDULE EVERY 1 DAY STARTS '2024-12-11 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    -- Copiar registros nuevos desde la tabla de auditoría a la tabla de copias
    INSERT INTO audit_table_user_copy (taula_modificada, fila_antiga, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp, fecha_copia)
    SELECT taula_modificada, fila_antiga, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp, CURRENT_DATE
    FROM audit_table_user AS audit
    WHERE NOT EXISTS (
        SELECT 1 
        FROM audit_table_user_copy AS copia
        WHERE copia.taula_modificada = audit.taula_modificada
          AND copia.data_modificacio = audit.data_modificacio
          AND copia.tipus_modificacio = audit.tipus_modificacio
    );

END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
