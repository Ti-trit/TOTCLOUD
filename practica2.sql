-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2024 a las 22:23:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `practica2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ami`
--

CREATE TABLE `ami` (
  `nomAmi` varchar(128) NOT NULL,
  `descripcioAMI` text DEFAULT NULL,
  `arquitectura` varchar(16) NOT NULL,
  `idAMI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ami`
--

INSERT INTO `ami` (`nomAmi`, `descripcioAMI`, `arquitectura`, `idAMI`) VALUES
('ami-12345abcd', 'Amazon Linux 2 AMI - 64-bit', 'x86_64', 1),
('ami-98765efgh', 'Ubuntu 20.04 LTS - 64-bit', 'x86_64', 2),
('ami-abc1234xyz', 'Windows Server 2019 - 64-bit', 'x86_64', 3),
('ami-xyz456789', 'Amazon Linux 2 ARM - 64-bit', 'arm64', 4),
('ami-56789ijkl', 'Ubuntu 18.04 LTS AMI for AWS with custom configurations for web servers and security updates.', 'x86_64', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arxiu`
--

CREATE TABLE `arxiu` (
  `nom` varchar(64) NOT NULL,
  `block_public_access` bit(1) NOT NULL,
  `tipusPermis` varchar(64) NOT NULL,
  `idArxiu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carpeta`
--

CREATE TABLE `carpeta` (
  `nom` varchar(64) NOT NULL,
  `encriptat` bit(1) NOT NULL,
  `idCarpeta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cataleg`
--

CREATE TABLE `cataleg` (
  `descripcio` text DEFAULT NULL,
  `idCataleg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cataleg`
--

INSERT INTO `cataleg` (`descripcio`, `idCataleg`) VALUES
(NULL, 1),
(NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clau_sessio`
--

CREATE TABLE `clau_sessio` (
  `nomFitxer` varchar(64) NOT NULL,
  `idClauSessio` int(11) NOT NULL,
  `tipusClau` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clau_sessio`
--

INSERT INTO `clau_sessio` (`nomFitxer`, `idClauSessio`, `tipusClau`) VALUES
('file1.txt', 12345, 'RSA-3072'),
('file2.txt', 12346, 'AES-128'),
('file3.txt', 12347, 'ECDSA-P256'),
('file4.txt', 12348, 'RSA-2048'),
('file5.txt', 12349, 'AES-256');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracio`
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
-- Volcado de datos para la tabla `configuracio`
--

INSERT INTO `configuracio` (`idConfig`, `numCPU`, `RAM`, `xarxa`, `preuPerHora`, `nom`, `IP`) VALUES
(1, 2, 4, '2.054', NULL, 'DB.t3.micro', 0x3131392e3231372e37362e3134320000),
(2, 3, 1, '2.054', NULL, 'DB.t2.micro', 0x33342e3138302e3130342e3233330000),
(3, 2, 4, '2.054', NULL, 'DB.t3.micro', 0x36352e3137362e3132322e3431000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracio_usuaris`
--

CREATE TABLE `configuracio_usuaris` (
  `idCataleg` int(11) NOT NULL,
  `idUsuari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emmagatzamatge`
--

CREATE TABLE `emmagatzamatge` (
  `tipus` varchar(3) NOT NULL,
  `emgAssignat` int(11) NOT NULL,
  `idEmmg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `emmagatzamatge`
--

INSERT INTO `emmagatzamatge` (`tipus`, `emgAssignat`, `idEmmg`) VALUES
('gp2', 20, 1),
('gp1', 10, 2),
('gp3', 15, 3),
('io1', 30, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grup_admin`
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
-- Estructura de tabla para la tabla `grup_no_admin`
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
-- Estructura de tabla para la tabla `grup_seguretat`
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
-- Volcado de datos para la tabla `grup_seguretat`
--

INSERT INTO `grup_seguretat` (`nom`, `descripcio`, `descrpicioSource`, `idGS`, `tipusSource`, `tipus`, `Protocol`) VALUES
('WebServerGroup', 'Allows HTTP and HTTPS traffic', 'Load Balancer access', 1, 'S2', 'P1', 'TCP'),
('DBGroup', 'Allows MySQL traffic', 'Instance communication', 2, 'S1', 'P1', 'TCP'),
('DNSGroup', 'Allows DNS traffic', 'Elastic IP access', 3, 'S3', 'P2', 'UDP'),
('PingGroup', 'Allows ICMP ping traffic', 'Instance diagnostics', 4, 'S1', 'P3', 'ICMP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_contrasenya`
--

CREATE TABLE `historial_contrasenya` (
  `constrasenyaHash` varchar(255) NOT NULL,
  `dataCreacio` date NOT NULL,
  `idHistorial` int(11) NOT NULL,
  `idInstanciaBD` int(11) DEFAULT NULL,
  `IdPersona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_contrasenya`
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
-- Estructura de tabla para la tabla `infraestructura`
--

CREATE TABLE `infraestructura` (
  `nomInfr` varchar(32) DEFAULT NULL,
  `idInfr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instancia_bd`
--

CREATE TABLE `instancia_bd` (
  `idInstanciaBD` int(11) NOT NULL,
  `idBDServei` int(11) NOT NULL,
  `nomMaster` varchar(64) NOT NULL,
  `nomBD` varchar(64) NOT NULL,
  `grupParametresBD` varchar(64) NOT NULL,
  `CopiaSeguretat` bit(1) NOT NULL,
  `periodeRetencioCS` int(11) DEFAULT NULL,
  `tipusMotor` varchar(32) NOT NULL,
  `idSubXar` int(11) NOT NULL,
  `idConfig` int(11) NOT NULL,
  `idGS` int(11) NOT NULL,
  `idEmmg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `instancia_bd`
--

INSERT INTO `instancia_bd` (`idInstanciaBD`, `idBDServei`, `nomMaster`, `nomBD`, `grupParametresBD`, `CopiaSeguretat`, `periodeRetencioCS`, `tipusMotor`, `idSubXar`, `idConfig`, `idGS`, `idEmmg`) VALUES
(1, 1, 'admin1', 'Database1', 'default', b'0', 30, 'MariaDB', 1, 2, 1, 1),
(2, 1, 'admin2', 'Database2', 'optimized', b'0', 7, 'MySQL', 1, 3, 2, 2),
(3, 1, 'admin3', 'Database3', 'high-performance', b'0', NULL, 'PostgreSQL', 3, 2, 3, 3),
(4, 1, 'admin4', 'Database4', 'secure', b'0', 14, 'SQLite', 1, 2, 4, 4),
(5, 1, 'admin5', 'Database5', 'balanced', b'0', NULL, 'MariaDB', 2, 2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instancia_bucket`
--

CREATE TABLE `instancia_bucket` (
  `nomBucket` varchar(64) NOT NULL,
  `periodeBloqueig` int(11) DEFAULT NULL,
  `idBucket` int(11) NOT NULL,
  `nomReg` varchar(64) DEFAULT NULL,
  `idServei` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instancia_servidor`
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mateniment_personal`
--

CREATE TABLE `mateniment_personal` (
  `idCataleg` int(11) NOT NULL,
  `idPersonalCloud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motor_bd`
--

CREATE TABLE `motor_bd` (
  `tipusMotor` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `motor_bd`
--

INSERT INTO `motor_bd` (`tipusMotor`) VALUES
('MariaDB'),
('MySQL'),
('PostgreSQL'),
('SQLite');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organitzacio`
--

CREATE TABLE `organitzacio` (
  `nomOrg` varchar(64) NOT NULL,
  `dataInvolucrament` date NOT NULL,
  `idOrg` int(11) NOT NULL,
  `tipusOrg` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_grup_administrador`
--

CREATE TABLE `permisos_grup_administrador` (
  `nom` varchar(64) NOT NULL,
  `idGrupNA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_grup_no_administrador`
--

CREATE TABLE `permisos_grup_no_administrador` (
  `nom` varchar(64) NOT NULL,
  `idGrupA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
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
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`nom`, `llinatges`, `correuPersonal`, `dataNaixement`, `identificador`, `correuAcces`, `idPersona`) VALUES
('claudia', 'martinez', 'KIKsomthing@gmail.com', '0000-00-00', 'Y6839853E', 'claudiamTotCloud@.es.tc', 1),
('iman', 'fernandez', 'imanf@gmail.com', '0000-00-00', 'h1234567y', 'imanFTotCloud@.es.tc', 2),
('luis', 'gonzales', 'luisG@gmail.com', '0000-00-00', 'h1234765y', 'LuisTTotCloud.es.tc', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `adreca` varchar(256) DEFAULT NULL,
  `telefon` varchar(9) NOT NULL,
  `dataAlta` date NOT NULL,
  `idPersonalCloud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`adreca`, `telefon`, `dataAlta`, `idPersonalCloud`) VALUES
(NULL, '123456789', '0000-00-00', 1),
(NULL, '234567891', '0000-00-00', 2),
(NULL, '345678912', '0000-00-00', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegi`
--

CREATE TABLE `privilegi` (
  `nom` varchar(64) NOT NULL,
  `descripción` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `protocol`
--

CREATE TABLE `protocol` (
  `tipus` varchar(16) NOT NULL,
  `Protocol` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `protocol`
--

INSERT INTO `protocol` (`tipus`, `Protocol`) VALUES
('P3', 'ICMP'),
('P1', 'TCP'),
('P2', 'UDP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `protocol_range_port`
--

CREATE TABLE `protocol_range_port` (
  `Protocol` varchar(8) NOT NULL,
  `PortRange` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `protocol_range_port`
--

INSERT INTO `protocol_range_port` (`Protocol`, `PortRange`) VALUES
('ICMP', 0),
('TCP', 22),
('TCP', 80),
('TCP', 443),
('UDP', 53);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regio`
--

CREATE TABLE `regio` (
  `nomReg` varchar(64) NOT NULL,
  `disponible` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `regio`
--

INSERT INTO `regio` (`nomReg`, `disponible`) VALUES
('eu-central-1', b'0'),
('eu-south-1', b'0'),
('eu-west-1', b'1'),
('eu-west-2', b'1'),
('eu-west-3', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servei`
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
-- Volcado de datos para la tabla `servei`
--

INSERT INTO `servei` (`categoria`, `nom`, `disponible`, `block_public_access`, `preuMensual`, `idServei`) VALUES
('DATABASE', 'instancias_bd', b'1', b'0', 50.00, 1),
('CLOUD STORAGE', 'instancias_bucket', b'1', b'1', 20.00, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `source`
--

CREATE TABLE `source` (
  `tipusSource` varchar(32) NOT NULL,
  `source` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `source`
--

INSERT INTO `source` (`tipusSource`, `source`) VALUES
('S1', 'Instance'),
('S2', 'Load Balancer'),
('S3', 'Elastic IP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subxarxa`
--

CREATE TABLE `subxarxa` (
  `nomSubXarxa` varchar(64) NOT NULL,
  `descripcio` text DEFAULT NULL,
  `idVPC` varchar(128) NOT NULL,
  `idSubXar` int(11) NOT NULL,
  `nomReg` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subxarxa`
--

INSERT INTO `subxarxa` (`nomSubXarxa`, `descripcio`, `idVPC`, `idSubXar`, `nomReg`) VALUES
('Subxarxa1', NULL, 'vpc-0a1b2c3d4e5f67890', 1, 'eu-west-1'),
('subxarxa2', NULL, 'vpc-0f1e2d3c4b5a67890', 2, 'eu-west-2'),
('subxarxa3', NULL, 'vpc-67890abcdef12345g', 3, 'eu-west-2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipus_clau`
--

CREATE TABLE `tipus_clau` (
  `tipus` varchar(16) NOT NULL,
  `formatFitxet` varchar(4) NOT NULL,
  `nomClau` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipus_clau`
--

INSERT INTO `tipus_clau` (`tipus`, `formatFitxet`, `nomClau`) VALUES
('AES-128', 'CSV', 'aes_key_128'),
('AES-256', 'TXT', 'aes_key_256'),
('ECDSA-P256', 'XML', 'ecdsa_key_p256'),
('RSA-2048', 'PDF', 'rsa_key_2048'),
('RSA-3072', 'JSON', 'rsa_key_3072');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipus_organitzacio`
--

CREATE TABLE `tipus_organitzacio` (
  `tipusOrg` varchar(16) NOT NULL,
  `descripcio` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuari`
--

CREATE TABLE `usuari` (
  `dataSubscripcio` date NOT NULL,
  `idUsuari` int(11) NOT NULL,
  `idGenerador` int(11) DEFAULT NULL,
  `idGrupA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuari_no_admin`
--

CREATE TABLE `usuari_no_admin` (
  `idUsuari` int(11) NOT NULL,
  `idGrupNA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `versio`
--

CREATE TABLE `versio` (
  `nomVersio` varchar(16) NOT NULL,
  `idVersio` int(11) NOT NULL,
  `tipusMotor` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `versio`
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
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ami`
--
ALTER TABLE `ami`
  ADD PRIMARY KEY (`idAMI`);

--
-- Indices de la tabla `arxiu`
--
ALTER TABLE `arxiu`
  ADD PRIMARY KEY (`idArxiu`);

--
-- Indices de la tabla `carpeta`
--
ALTER TABLE `carpeta`
  ADD PRIMARY KEY (`idCarpeta`);

--
-- Indices de la tabla `cataleg`
--
ALTER TABLE `cataleg`
  ADD PRIMARY KEY (`idCataleg`);

--
-- Indices de la tabla `clau_sessio`
--
ALTER TABLE `clau_sessio`
  ADD PRIMARY KEY (`idClauSessio`),
  ADD KEY `fk_tipus_clau` (`tipusClau`);

--
-- Indices de la tabla `configuracio`
--
ALTER TABLE `configuracio`
  ADD PRIMARY KEY (`idConfig`);

--
-- Indices de la tabla `configuracio_usuaris`
--
ALTER TABLE `configuracio_usuaris`
  ADD PRIMARY KEY (`idCataleg`,`idUsuari`),
  ADD KEY `FK_Usuari` (`idUsuari`);

--
-- Indices de la tabla `emmagatzamatge`
--
ALTER TABLE `emmagatzamatge`
  ADD PRIMARY KEY (`idEmmg`);

--
-- Indices de la tabla `grup_admin`
--
ALTER TABLE `grup_admin`
  ADD PRIMARY KEY (`idGrupA`),
  ADD KEY `fk_ORG_GA` (`idOrg`);

--
-- Indices de la tabla `grup_no_admin`
--
ALTER TABLE `grup_no_admin`
  ADD PRIMARY KEY (`idGrupNA`),
  ADD KEY `fk_ORG_GNA` (`idOrg`),
  ADD KEY `fk_GNA_creador` (`idUsuariCreador`);

--
-- Indices de la tabla `grup_seguretat`
--
ALTER TABLE `grup_seguretat`
  ADD PRIMARY KEY (`idGS`),
  ADD KEY `fk_GS_SOURCE` (`tipusSource`),
  ADD KEY `fk_GS_tipusGS` (`tipus`),
  ADD KEY `fk_GS_ProtocolRange` (`Protocol`);

--
-- Indices de la tabla `historial_contrasenya`
--
ALTER TABLE `historial_contrasenya`
  ADD PRIMARY KEY (`idHistorial`),
  ADD KEY `fk_const_BD` (`idInstanciaBD`),
  ADD KEY `fk_PERSONA_CONTR` (`IdPersona`);

--
-- Indices de la tabla `infraestructura`
--
ALTER TABLE `infraestructura`
  ADD PRIMARY KEY (`idInfr`);

--
-- Indices de la tabla `instancia_bd`
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
-- Indices de la tabla `instancia_bucket`
--
ALTER TABLE `instancia_bucket`
  ADD PRIMARY KEY (`idBucket`),
  ADD KEY `fk_regio_bucket` (`nomReg`),
  ADD KEY `fk_servei_bucket` (`idServei`);

--
-- Indices de la tabla `instancia_servidor`
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
-- Indices de la tabla `mateniment_personal`
--
ALTER TABLE `mateniment_personal`
  ADD PRIMARY KEY (`idPersonalCloud`,`idCataleg`),
  ADD KEY `fk_cat_man` (`idCataleg`);

--
-- Indices de la tabla `motor_bd`
--
ALTER TABLE `motor_bd`
  ADD PRIMARY KEY (`tipusMotor`);

--
-- Indices de la tabla `organitzacio`
--
ALTER TABLE `organitzacio`
  ADD PRIMARY KEY (`idOrg`),
  ADD KEY `fk_ORG_tipusORG` (`tipusOrg`);

--
-- Indices de la tabla `permisos_grup_administrador`
--
ALTER TABLE `permisos_grup_administrador`
  ADD PRIMARY KEY (`idGrupNA`,`nom`),
  ADD KEY `fk_previ` (`nom`);

--
-- Indices de la tabla `permisos_grup_no_administrador`
--
ALTER TABLE `permisos_grup_no_administrador`
  ADD PRIMARY KEY (`idGrupA`,`nom`),
  ADD KEY `fk_previlegi` (`nom`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idPersona`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`idPersonalCloud`);

--
-- Indices de la tabla `privilegi`
--
ALTER TABLE `privilegi`
  ADD PRIMARY KEY (`nom`);

--
-- Indices de la tabla `protocol`
--
ALTER TABLE `protocol`
  ADD PRIMARY KEY (`tipus`),
  ADD UNIQUE KEY `Protocol` (`Protocol`);

--
-- Indices de la tabla `protocol_range_port`
--
ALTER TABLE `protocol_range_port`
  ADD PRIMARY KEY (`Protocol`,`PortRange`);

--
-- Indices de la tabla `regio`
--
ALTER TABLE `regio`
  ADD PRIMARY KEY (`nomReg`);

--
-- Indices de la tabla `servei`
--
ALTER TABLE `servei`
  ADD PRIMARY KEY (`idServei`);

--
-- Indices de la tabla `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`tipusSource`);

--
-- Indices de la tabla `subxarxa`
--
ALTER TABLE `subxarxa`
  ADD PRIMARY KEY (`idSubXar`),
  ADD KEY `fk_regio_subxarxa` (`nomReg`);

--
-- Indices de la tabla `tipus_clau`
--
ALTER TABLE `tipus_clau`
  ADD PRIMARY KEY (`tipus`);

--
-- Indices de la tabla `tipus_organitzacio`
--
ALTER TABLE `tipus_organitzacio`
  ADD PRIMARY KEY (`tipusOrg`);

--
-- Indices de la tabla `usuari`
--
ALTER TABLE `usuari`
  ADD PRIMARY KEY (`idUsuari`),
  ADD KEY `fk_USUARI_USUARI` (`idGenerador`),
  ADD KEY `fk_USUARI_GRupA` (`idGrupA`);

--
-- Indices de la tabla `usuari_no_admin`
--
ALTER TABLE `usuari_no_admin`
  ADD PRIMARY KEY (`idUsuari`,`idGrupNA`),
  ADD KEY `fk_GrupNA` (`idGrupNA`);

--
-- Indices de la tabla `versio`
--
ALTER TABLE `versio`
  ADD PRIMARY KEY (`idVersio`),
  ADD KEY `fk_tipus_motor` (`tipusMotor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ami`
--
ALTER TABLE `ami`
  MODIFY `idAMI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `arxiu`
--
ALTER TABLE `arxiu`
  MODIFY `idArxiu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carpeta`
--
ALTER TABLE `carpeta`
  MODIFY `idCarpeta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cataleg`
--
ALTER TABLE `cataleg`
  MODIFY `idCataleg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clau_sessio`
--
ALTER TABLE `clau_sessio`
  MODIFY `idClauSessio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12350;

--
-- AUTO_INCREMENT de la tabla `configuracio`
--
ALTER TABLE `configuracio`
  MODIFY `idConfig` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `emmagatzamatge`
--
ALTER TABLE `emmagatzamatge`
  MODIFY `idEmmg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `grup_admin`
--
ALTER TABLE `grup_admin`
  MODIFY `idGrupA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grup_no_admin`
--
ALTER TABLE `grup_no_admin`
  MODIFY `idGrupNA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grup_seguretat`
--
ALTER TABLE `grup_seguretat`
  MODIFY `idGS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `historial_contrasenya`
--
ALTER TABLE `historial_contrasenya`
  MODIFY `idHistorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `instancia_bd`
--
ALTER TABLE `instancia_bd`
  MODIFY `idInstanciaBD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `instancia_bucket`
--
ALTER TABLE `instancia_bucket`
  MODIFY `idBucket` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `instancia_servidor`
--
ALTER TABLE `instancia_servidor`
  MODIFY `idInstancia_servidor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `organitzacio`
--
ALTER TABLE `organitzacio`
  MODIFY `idOrg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servei`
--
ALTER TABLE `servei`
  MODIFY `idServei` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `subxarxa`
--
ALTER TABLE `subxarxa`
  MODIFY `idSubXar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `versio`
--
ALTER TABLE `versio`
  MODIFY `idVersio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clau_sessio`
--
ALTER TABLE `clau_sessio`
  ADD CONSTRAINT `fk_tipus_clau` FOREIGN KEY (`tipusClau`) REFERENCES `tipus_clau` (`tipus`);

--
-- Filtros para la tabla `configuracio_usuaris`
--
ALTER TABLE `configuracio_usuaris`
  ADD CONSTRAINT `FK_Usuari` FOREIGN KEY (`idUsuari`) REFERENCES `usuari` (`idUsuari`),
  ADD CONSTRAINT `fk_cataleg` FOREIGN KEY (`idCataleg`) REFERENCES `cataleg` (`idCataleg`);

--
-- Filtros para la tabla `grup_admin`
--
ALTER TABLE `grup_admin`
  ADD CONSTRAINT `fk_ORG_GA` FOREIGN KEY (`idOrg`) REFERENCES `organitzacio` (`idOrg`);

--
-- Filtros para la tabla `grup_no_admin`
--
ALTER TABLE `grup_no_admin`
  ADD CONSTRAINT `fk_GNA_creador` FOREIGN KEY (`idUsuariCreador`) REFERENCES `usuari` (`idUsuari`),
  ADD CONSTRAINT `fk_ORG_GNA` FOREIGN KEY (`idOrg`) REFERENCES `organitzacio` (`idOrg`);

--
-- Filtros para la tabla `grup_seguretat`
--
ALTER TABLE `grup_seguretat`
  ADD CONSTRAINT `fk_GS_ProtocolRange` FOREIGN KEY (`Protocol`) REFERENCES `protocol_range_port` (`Protocol`),
  ADD CONSTRAINT `fk_GS_SOURCE` FOREIGN KEY (`tipusSource`) REFERENCES `source` (`tipusSource`),
  ADD CONSTRAINT `fk_GS_tipusGS` FOREIGN KEY (`tipus`) REFERENCES `protocol` (`tipus`);

--
-- Filtros para la tabla `historial_contrasenya`
--
ALTER TABLE `historial_contrasenya`
  ADD CONSTRAINT `fk_PERSONA_CONTR` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`idPersona`),
  ADD CONSTRAINT `fk_const_BD` FOREIGN KEY (`idInstanciaBD`) REFERENCES `instancia_bd` (`idInstanciaBD`);

--
-- Filtros para la tabla `infraestructura`
--
ALTER TABLE `infraestructura`
  ADD CONSTRAINT `FK_INFRA_CATALEG` FOREIGN KEY (`idInfr`) REFERENCES `cataleg` (`idCataleg`);

--
-- Filtros para la tabla `instancia_bd`
--
ALTER TABLE `instancia_bd`
  ADD CONSTRAINT `fk_BD_CONFIG` FOREIGN KEY (`idConfig`) REFERENCES `configuracio` (`idConfig`),
  ADD CONSTRAINT `fk_BD_EMMG` FOREIGN KEY (`idEmmg`) REFERENCES `emmagatzamatge` (`idEmmg`),
  ADD CONSTRAINT `fk_BD_GS` FOREIGN KEY (`idGS`) REFERENCES `grup_seguretat` (`idGS`),
  ADD CONSTRAINT `fk_BD_motor` FOREIGN KEY (`tipusMotor`) REFERENCES `motor_bd` (`tipusMotor`),
  ADD CONSTRAINT `fk_BD_subx` FOREIGN KEY (`idSubXar`) REFERENCES `subxarxa` (`idSubXar`),
  ADD CONSTRAINT `fk_servei_BD` FOREIGN KEY (`idBDServei`) REFERENCES `servei` (`idServei`);

--
-- Filtros para la tabla `instancia_bucket`
--
ALTER TABLE `instancia_bucket`
  ADD CONSTRAINT `fk_regio_bucket` FOREIGN KEY (`nomReg`) REFERENCES `regio` (`nomReg`),
  ADD CONSTRAINT `fk_servei_bucket` FOREIGN KEY (`idServei`) REFERENCES `servei` (`idServei`);

--
-- Filtros para la tabla `instancia_servidor`
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
-- Filtros para la tabla `mateniment_personal`
--
ALTER TABLE `mateniment_personal`
  ADD CONSTRAINT `fk_cat_man` FOREIGN KEY (`idCataleg`) REFERENCES `cataleg` (`idCataleg`),
  ADD CONSTRAINT `fk_pers_manten` FOREIGN KEY (`idPersonalCloud`) REFERENCES `personal` (`idPersonalCloud`);

--
-- Filtros para la tabla `organitzacio`
--
ALTER TABLE `organitzacio`
  ADD CONSTRAINT `fk_ORG_tipusORG` FOREIGN KEY (`tipusOrg`) REFERENCES `tipus_organitzacio` (`tipusOrg`);

--
-- Filtros para la tabla `permisos_grup_administrador`
--
ALTER TABLE `permisos_grup_administrador`
  ADD CONSTRAINT `FK_grupNAPermisos` FOREIGN KEY (`idGrupNA`) REFERENCES `grup_no_admin` (`idGrupNA`),
  ADD CONSTRAINT `fk_previ` FOREIGN KEY (`nom`) REFERENCES `privilegi` (`nom`);

--
-- Filtros para la tabla `permisos_grup_no_administrador`
--
ALTER TABLE `permisos_grup_no_administrador`
  ADD CONSTRAINT `FK_grupA` FOREIGN KEY (`idGrupA`) REFERENCES `grup_admin` (`idGrupA`),
  ADD CONSTRAINT `fk_previlegi` FOREIGN KEY (`nom`) REFERENCES `privilegi` (`nom`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `fk_personal_persona` FOREIGN KEY (`idPersonalCloud`) REFERENCES `persona` (`idPersona`);

--
-- Filtros para la tabla `protocol_range_port`
--
ALTER TABLE `protocol_range_port`
  ADD CONSTRAINT `fk_protocol_tipus` FOREIGN KEY (`Protocol`) REFERENCES `protocol` (`Protocol`);

--
-- Filtros para la tabla `servei`
--
ALTER TABLE `servei`
  ADD CONSTRAINT `FK_SERVRI_CATALEG` FOREIGN KEY (`idServei`) REFERENCES `cataleg` (`idCataleg`);

--
-- Filtros para la tabla `subxarxa`
--
ALTER TABLE `subxarxa`
  ADD CONSTRAINT `fk_regio_subxarxa` FOREIGN KEY (`nomReg`) REFERENCES `regio` (`nomReg`);

--
-- Filtros para la tabla `usuari`
--
ALTER TABLE `usuari`
  ADD CONSTRAINT `fk_USUARI_GRupA` FOREIGN KEY (`idGrupA`) REFERENCES `grup_admin` (`idGrupA`),
  ADD CONSTRAINT `fk_USUARI_USUARI` FOREIGN KEY (`idGenerador`) REFERENCES `usuari` (`idUsuari`),
  ADD CONSTRAINT `fk_usuari_personla` FOREIGN KEY (`idUsuari`) REFERENCES `persona` (`idPersona`);

--
-- Filtros para la tabla `usuari_no_admin`
--
ALTER TABLE `usuari_no_admin`
  ADD CONSTRAINT `fk_GrupNA` FOREIGN KEY (`idGrupNA`) REFERENCES `grup_no_admin` (`idGrupNA`),
  ADD CONSTRAINT `fk_UsuariNoAdmin` FOREIGN KEY (`idUsuari`) REFERENCES `usuari` (`idUsuari`);

--
-- Filtros para la tabla `versio`
--
ALTER TABLE `versio`
  ADD CONSTRAINT `fk_tipus_motor` FOREIGN KEY (`tipusMotor`) REFERENCES `motor_bd` (`tipusMotor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;