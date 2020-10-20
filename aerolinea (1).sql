-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 08-11-2019 a las 03:31:38
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aerolinea`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aerolineas`
--

DROP TABLE IF EXISTS `aerolineas`;
CREATE TABLE IF NOT EXISTS `aerolineas` (
  `id_aerolinea` varchar(3) NOT NULL,
  `nombre_aerolinea` varchar(20) NOT NULL,
  PRIMARY KEY (`id_aerolinea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aerolineas`
--

INSERT INTO `aerolineas` (`id_aerolinea`, `nombre_aerolinea`) VALUES
('AE1', 'KLM'),
('AE2', 'Avianca'),
('AE3', 'Latam'),
('AE4', 'Copa'),
('AE5', 'AA'),
('AE6', 'Tame');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aviones`
--

DROP TABLE IF EXISTS `aviones`;
CREATE TABLE IF NOT EXISTS `aviones` (
  `id_avion` int(11) NOT NULL AUTO_INCREMENT,
  `aerolinea` varchar(3) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `capacidad` int(11) NOT NULL,
  PRIMARY KEY (`id_avion`),
  KEY `aerolínea` (`aerolinea`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aviones`
--

INSERT INTO `aviones` (`id_avion`, `aerolinea`, `modelo`, `capacidad`) VALUES
(1, 'AE1', 'Boeing 747', 450),
(2, 'AE1', 'Boeing 777', 320),
(3, 'AE1', 'Airbus A330', 150),
(4, 'AE2', 'Airbus A330', 150),
(5, 'AE2', 'Boeing 747', 450),
(6, 'AE2', 'Airbus A340', 120),
(7, 'AE2', 'Airbus A330', 150),
(8, 'AE3', 'Airbus A330', 150),
(9, 'AE3', 'Boeing 747', 450),
(10, 'AE3', 'Boeing 737', 320),
(11, 'AE4', 'Boeing 737', 320),
(12, 'AE4', 'Airbus A340', 120),
(13, 'AE5', 'Boeing 737', 320),
(14, 'AE6', 'Airbus A340', 120);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_1`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_1`;
CREATE TABLE IF NOT EXISTS `consulta_1` (
`nombre_aerolinea` varchar(20)
,`fecha` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_2`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_2`;
CREATE TABLE IF NOT EXISTS `consulta_2` (
`nombre_aerolinea` varchar(20)
,`modelo` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_3`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_3`;
CREATE TABLE IF NOT EXISTS `consulta_3` (
`id_vuelo` varchar(6)
,`nombre` varchar(50)
,`asiento` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_4`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_4`;
CREATE TABLE IF NOT EXISTS `consulta_4` (
`id_vuelo` varchar(6)
,`Nombre` varchar(50)
,`cargo` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_5`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_5`;
CREATE TABLE IF NOT EXISTS `consulta_5` (
`nombre_aerolinea` varchar(20)
,`destino` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_6`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_6`;
CREATE TABLE IF NOT EXISTS `consulta_6` (
`id_vuelo` varchar(6)
,`nombre` varchar(50)
,`equipaje` int(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_7`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_7`;
CREATE TABLE IF NOT EXISTS `consulta_7` (
`nombre_aerolinea` varchar(20)
,`numero_aviones` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_8`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_8`;
CREATE TABLE IF NOT EXISTS `consulta_8` (
`id_vuelo` varchar(6)
,`total_equipaje` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_9`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_9`;
CREATE TABLE IF NOT EXISTS `consulta_9` (
`destino` varchar(20)
,`promedio` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajero`
--

DROP TABLE IF EXISTS `pasajero`;
CREATE TABLE IF NOT EXISTS `pasajero` (
  `id_pasajero` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_vuelo` varchar(6) NOT NULL,
  `asiento` int(11) NOT NULL,
  `equipaje` int(1) NOT NULL,
  `peso` double DEFAULT '0',
  PRIMARY KEY (`id_pasajero`),
  KEY `id_vuelo` (`id_vuelo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pasajero`
--

INSERT INTO `pasajero` (`id_pasajero`, `nombre`, `id_vuelo`, `asiento`, `equipaje`, `peso`) VALUES
(123, 'Catalina Guerra', 'VUE118', 50, 1, 100),
(124, 'Rene Rivas', 'VUE113', 8, 1, 50),
(125, 'Pedro Cifuentes', 'VUE115', 9, 1, 70),
(126, 'Luisa Herrera', 'VUE117', 10, 1, 40),
(127, 'Eduardo Malo', 'VUE114', 15, 0, 0),
(128, 'Mario Guerron', 'VUE117', 56, 1, 145),
(129, 'Pablo Pitarque', 'VUE116', 68, 0, 0),
(130, 'Peter Villegas', 'VUE119', 47, 1, 150),
(131, 'Ana Llerena', 'VUE116', 40, 1, 256),
(132, 'Juan Arboleda', 'VUE116', 12, 0, 0),
(133, 'Juan Perez', 'VUE111', 1, 0, 50),
(134, 'Maria Ricaurte', 'VUE112', 2, 1, 80),
(135, 'Ricardo Leon', 'VUE114', 2, 1, 59),
(136, 'Rocio Larrea', 'VUE113', 4, 0, 0),
(137, 'Fernando Ortiz', 'VUE112', 70, 1, 151),
(138, 'Patricio Sosa', 'VUE117', 6, 0, 0),
(139, 'Dolores Ribadeneira', 'VUE111', 52, 1, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tripulacion`
--

DROP TABLE IF EXISTS `tripulacion`;
CREATE TABLE IF NOT EXISTS `tripulacion` (
  `id_tripulacion` int(10) NOT NULL,
  `id_vuelo` varchar(6) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `cargo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tripulacion`),
  KEY `id_vuelo` (`id_vuelo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tripulacion`
--

INSERT INTO `tripulacion` (`id_tripulacion`, `id_vuelo`, `Nombre`, `cargo`) VALUES
(1414141411, 'VUE114', 'Pedro', 'azafata'),
(1515151515, 'VUE111', 'Juan ', 'piloto'),
(1616161616, 'VUE118', 'Maria', 'piloto'),
(2020202020, 'VUE111', 'Susana', 'azafata');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelos`
--

DROP TABLE IF EXISTS `vuelos`;
CREATE TABLE IF NOT EXISTS `vuelos` (
  `id_vuelo` varchar(6) NOT NULL,
  `id_avion` int(11) NOT NULL,
  `Origen` varchar(30) NOT NULL,
  `destino` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_vuelo`),
  KEY `id_avión` (`id_avion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vuelos`
--

INSERT INTO `vuelos` (`id_vuelo`, `id_avion`, `Origen`, `destino`, `fecha`) VALUES
('VUE111', 1, 'Quito', 'Santiago', '2019-10-31'),
('VUE112', 2, 'Quito', 'Loja', '2019-11-08'),
('VUE113', 3, 'Quito', 'Lima', '2019-11-07'),
('VUE114', 14, 'Quito', 'Cuenca', '2019-11-05'),
('VUE115', 7, 'Quito', 'Miami', '2019-11-09'),
('VUE116', 12, 'Quito', 'Amsterdam', '2019-11-07'),
('VUE117', 6, 'Quito', 'Madrid', '2019-11-08'),
('VUE118', 4, 'Quito', 'Bogota', '2019-11-09'),
('VUE119', 11, 'Quito', 'Loja', '2019-11-10');

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_1`
--
DROP TABLE IF EXISTS `consulta_1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_1`  AS  select `aerolineas`.`nombre_aerolinea` AS `nombre_aerolinea`,`vuelos`.`fecha` AS `fecha` from ((`vuelos` join `aviones` on((`aviones`.`id_avion` = `vuelos`.`id_avion`))) join `aerolineas` on((`aerolineas`.`id_aerolinea` = `aviones`.`aerolinea`))) where (`vuelos`.`fecha` = '2019-11-07') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_2`
--
DROP TABLE IF EXISTS `consulta_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_2`  AS  select `aerolineas`.`nombre_aerolinea` AS `nombre_aerolinea`,`aviones`.`modelo` AS `modelo` from (`aviones` join `aerolineas` on((`aviones`.`aerolinea` = `aerolineas`.`id_aerolinea`))) where (`aerolineas`.`nombre_aerolinea` = 'Avianca') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_3`
--
DROP TABLE IF EXISTS `consulta_3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_3`  AS  select `pasajero`.`id_vuelo` AS `id_vuelo`,`pasajero`.`nombre` AS `nombre`,`pasajero`.`asiento` AS `asiento` from `pasajero` where (`pasajero`.`id_vuelo` = 'VUE118') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_4`
--
DROP TABLE IF EXISTS `consulta_4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_4`  AS  select `tripulacion`.`id_vuelo` AS `id_vuelo`,`tripulacion`.`Nombre` AS `Nombre`,`tripulacion`.`cargo` AS `cargo` from `tripulacion` where (`tripulacion`.`id_vuelo` = 'VUE111') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_5`
--
DROP TABLE IF EXISTS `consulta_5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_5`  AS  select `aerolineas`.`nombre_aerolinea` AS `nombre_aerolinea`,`vuelos`.`destino` AS `destino` from ((`vuelos` join `aviones` on((`vuelos`.`id_avion` = `aviones`.`id_avion`))) join `aerolineas` on((`aviones`.`aerolinea` = `aerolineas`.`id_aerolinea`))) where (`aerolineas`.`nombre_aerolinea` = 'Avianca') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_6`
--
DROP TABLE IF EXISTS `consulta_6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_6`  AS  select `pasajero`.`id_vuelo` AS `id_vuelo`,`pasajero`.`nombre` AS `nombre`,`pasajero`.`equipaje` AS `equipaje` from `pasajero` where (`pasajero`.`id_vuelo` = 'VUE116') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_7`
--
DROP TABLE IF EXISTS `consulta_7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_7`  AS  select `aerolineas`.`nombre_aerolinea` AS `nombre_aerolinea`,count(`aviones`.`aerolinea`) AS `numero_aviones` from (`aviones` join `aerolineas` on((`aviones`.`aerolinea` = `aerolineas`.`id_aerolinea`))) group by `aerolineas`.`nombre_aerolinea` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_8`
--
DROP TABLE IF EXISTS `consulta_8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_8`  AS  select `pasajero`.`id_vuelo` AS `id_vuelo`,count(`pasajero`.`equipaje`) AS `total_equipaje` from (`pasajero` join `vuelos` on((`pasajero`.`id_vuelo` = `vuelos`.`id_vuelo`))) group by `pasajero`.`id_vuelo` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_9`
--
DROP TABLE IF EXISTS `consulta_9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_9`  AS  select `vuelos`.`destino` AS `destino`,avg(`pasajero`.`equipaje`) AS `promedio` from (`vuelos` join `pasajero` on((`vuelos`.`id_vuelo` = `pasajero`.`id_vuelo`))) group by `vuelos`.`destino` ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aviones`
--
ALTER TABLE `aviones`
  ADD CONSTRAINT `aviones_ibfk_2` FOREIGN KEY (`aerolinea`) REFERENCES `aerolineas` (`id_aerolinea`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pasajero`
--
ALTER TABLE `pasajero`
  ADD CONSTRAINT `pasajero_ibfk_3` FOREIGN KEY (`id_vuelo`) REFERENCES `vuelos` (`id_vuelo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tripulacion`
--
ALTER TABLE `tripulacion`
  ADD CONSTRAINT `tripulacion_ibfk_1` FOREIGN KEY (`id_vuelo`) REFERENCES `vuelos` (`id_vuelo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD CONSTRAINT `vuelos_ibfk_2` FOREIGN KEY (`id_avion`) REFERENCES `aviones` (`id_avion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
