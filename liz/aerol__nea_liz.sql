-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-11-2019 a las 17:39:00
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
-- Base de datos: `aerolìnea_liz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aerolìneas`
--

DROP TABLE IF EXISTS `aerolìneas`;
CREATE TABLE IF NOT EXISTS `aerolìneas` (
  `id_aerolinea` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_aerolinea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aerolìneas`
--

INSERT INTO `aerolìneas` (`id_aerolinea`, `nombre`) VALUES
('AE1', 'KLM'),
('AE2', 'AVIANCA'),
('AE3', 'LATAM'),
('AE4', 'COPA'),
('AE5', 'AA'),
('AE6', 'TAME');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aviones`
--

DROP TABLE IF EXISTS `aviones`;
CREATE TABLE IF NOT EXISTS `aviones` (
  `id_avion` int(30) NOT NULL AUTO_INCREMENT,
  `id_aerolinea` varchar(30) NOT NULL,
  `nombre_aerolinea` varchar(30) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `capacidad` int(30) NOT NULL,
  PRIMARY KEY (`id_avion`),
  KEY `id_aerolinea` (`id_aerolinea`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aviones`
--

INSERT INTO `aviones` (`id_avion`, `id_aerolinea`, `nombre_aerolinea`, `modelo`, `capacidad`) VALUES
(1, 'AE1', 'KLM', 'BOEING 747', 450),
(2, 'AE1', 'KLM', 'BOEING 777', 320),
(3, 'AE1', 'KLM', 'AIRBUS A330', 150),
(4, 'AE2', 'AVIANCA', 'AIRBUS A330', 150),
(5, 'AE2', 'AVIANCA', 'BOEING 747', 450),
(6, 'AE2', 'AVIANCA', 'AIRBUS A340', 120),
(7, 'AE2', 'AVIANCA', 'AIRBUS A330', 150),
(8, 'AE3', 'LATAM', 'AIRBUS A330', 150),
(9, 'AE3', 'LATAM', 'BOEING 747', 450),
(10, 'AE3', 'LATAM', 'BOEING 737', 320),
(11, 'AE4', 'COPA', 'BOEGIN 737', 320),
(12, 'AE4', 'COPA', 'AIRBUS A340', 120),
(13, 'AE5', 'AA', 'BOEING 737', 320),
(14, 'AE6', 'TAME', 'AIRBUS A340', 120);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_1`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_1`;
CREATE TABLE IF NOT EXISTS `consulta_1` (
`aerolin` varchar(30)
,`nombre` varchar(30)
,`fecha` date
,`id_vuelos` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_2`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_2`;
CREATE TABLE IF NOT EXISTS `consulta_2` (
`nombre_aerolinea` varchar(30)
,`modelo` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_3`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_3`;
CREATE TABLE IF NOT EXISTS `consulta_3` (
`nombre_apellido` varchar(30)
,`numero_asiento` int(30)
,`vuelo` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_4`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_4`;
CREATE TABLE IF NOT EXISTS `consulta_4` (
`nombre_apellido` varchar(30)
,`cargo` varchar(30)
,`id_vuelo` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_5`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_5`;
CREATE TABLE IF NOT EXISTS `consulta_5` (
`destino` varchar(30)
,`aerolin` varchar(30)
,`nombre` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_6`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_6`;
CREATE TABLE IF NOT EXISTS `consulta_6` (
`nombre_apellido` varchar(30)
,`equipaje` int(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_7`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_7`;
CREATE TABLE IF NOT EXISTS `consulta_7` (
`vuelo` varchar(30)
,`numero_piezas` decimal(51,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_8`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_8`;
CREATE TABLE IF NOT EXISTS `consulta_8` (
`promedio` decimal(33,4)
,`destino` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_9`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_9`;
CREATE TABLE IF NOT EXISTS `consulta_9` (
`numero_aviones` bigint(21)
,`nombre_aerolinea` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_10`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `consulta_10`;
CREATE TABLE IF NOT EXISTS `consulta_10` (
`total_piezas` decimal(51,0)
,`vuelo` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajero`
--

DROP TABLE IF EXISTS `pasajero`;
CREATE TABLE IF NOT EXISTS `pasajero` (
  `id_pasajero` int(30) NOT NULL,
  `nombre_apellido` varchar(30) NOT NULL,
  `vuelo` varchar(30) NOT NULL,
  `equipaje` int(30) NOT NULL,
  `peso` int(30) NOT NULL,
  `numero_asiento` int(30) NOT NULL,
  PRIMARY KEY (`id_pasajero`),
  KEY `vuelo` (`vuelo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pasajero`
--

INSERT INTO `pasajero` (`id_pasajero`, `nombre_apellido`, `vuelo`, `equipaje`, `peso`, `numero_asiento`) VALUES
(121, 'JUAN PEREZ', 'VUE111', 0, 0, 1),
(122, 'MARIA RICAURTE', 'VUE112', 1, 50, 2),
(123, 'RENE RIVAS', 'VUE113', 2, 50, 3),
(124, 'RICARDO LEON', 'VUE114', 1, 50, 4),
(125, 'PEDRO CIFUENTES', 'VUE115', 3, 50, 5),
(126, 'JUAN ARBOLEDA', 'VUE116', 0, 0, 6),
(127, 'LUISA HERRERA', 'VUE117', 2, 50, 7),
(128, 'PATRICIO SOSA', 'VUE117', 0, 0, 8),
(129, 'EDUARDO MALO', 'VUE114', 0, 0, 9),
(130, 'ROCIO LARREA', 'VUE113', 1, 50, 10),
(131, 'CATALINA GUERRA', 'VUE118', 3, 50, 11),
(132, 'FERNANDO ORTIZ', 'VUE112', 3, 50, 12),
(133, 'MARIO GUERRON', 'VUE117', 1, 50, 13),
(134, 'ANA LLERENA', 'VUE116', 2, 50, 14),
(135, 'PABLO PITARQUE ', 'VUE116', 3, 50, 20),
(136, 'DOLORES RIBADENEIRA', 'VUE111', 2, 50, 21),
(137, 'PETER VILLEGAS', 'VUE113', 3, 50, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tripulacion`
--

DROP TABLE IF EXISTS `tripulacion`;
CREATE TABLE IF NOT EXISTS `tripulacion` (
  `id_tripulante` int(30) NOT NULL,
  `id_vuelo` varchar(30) NOT NULL,
  `nombre_apellido` varchar(30) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tripulante`),
  KEY `id_vuelo` (`id_vuelo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tripulacion`
--

INSERT INTO `tripulacion` (`id_tripulante`, `id_vuelo`, `nombre_apellido`, `cargo`) VALUES
(201, 'VUE111', 'CARLOS LOPEZ', 'PILOTO'),
(202, 'VUE112', 'ANITA PEREZ', 'ASAFATA'),
(203, 'VUE112', 'PILOTO', 'MARIA ROSERO'),
(204, 'VUE114', 'LIZETH MORENO', 'PILOTO'),
(205, 'VUE114', 'EVELIN CHILE', 'AZAFATA'),
(206, 'VUE115', 'PEDRO  QUIÑONEZ', 'PILOTO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelos`
--

DROP TABLE IF EXISTS `vuelos`;
CREATE TABLE IF NOT EXISTS `vuelos` (
  `id_vuelos` varchar(30) NOT NULL,
  `aerolin` varchar(30) NOT NULL,
  `avion` int(30) NOT NULL,
  `origen` varchar(30) NOT NULL,
  `destino` varchar(30) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_vuelos`),
  KEY `avion` (`avion`),
  KEY `aerolineas` (`aerolin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vuelos`
--

INSERT INTO `vuelos` (`id_vuelos`, `aerolin`, `avion`, `origen`, `destino`, `fecha`) VALUES
('VUE111', 'AE1', 1, 'QUITO', 'SANTIAGO', '2019-11-12'),
('VUE112', 'AE2', 4, 'QUITO', 'LOJA', '2019-11-11'),
('VUE113', 'AE3', 9, 'QUITO', 'LIMA', '2019-11-13'),
('VUE114', 'AE4', 11, 'QUITO', 'CUENCA', '2019-11-14'),
('VUE115', 'AE5', 13, 'QUITO', 'MIAMI', '2019-11-12'),
('VUE116', 'AE6', 14, 'QUITO', 'AMSTERDAM', '2019-11-12'),
('VUE117', 'AE1', 2, 'QUITO', 'MADRID', '2019-11-11'),
('VUE118', 'AE2', 6, 'QUITO', 'BOGOTA', '2019-11-13');

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_1`
--
DROP TABLE IF EXISTS `consulta_1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_1`  AS  select `vuelos`.`aerolin` AS `aerolin`,`aerolìneas`.`nombre` AS `nombre`,`vuelos`.`fecha` AS `fecha`,`vuelos`.`id_vuelos` AS `id_vuelos` from (`vuelos` join `aerolìneas` on((`vuelos`.`aerolin` = `aerolìneas`.`id_aerolinea`))) where (`vuelos`.`fecha` = '2019-11-12') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_2`
--
DROP TABLE IF EXISTS `consulta_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_2`  AS  select `aviones`.`nombre_aerolinea` AS `nombre_aerolinea`,`aviones`.`modelo` AS `modelo` from `aviones` where (`aviones`.`nombre_aerolinea` = 'AVIANCA') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_3`
--
DROP TABLE IF EXISTS `consulta_3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_3`  AS  select `pasajero`.`nombre_apellido` AS `nombre_apellido`,`pasajero`.`numero_asiento` AS `numero_asiento`,`pasajero`.`vuelo` AS `vuelo` from `pasajero` where (`pasajero`.`vuelo` = 'VUE117') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_4`
--
DROP TABLE IF EXISTS `consulta_4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_4`  AS  select `tripulacion`.`nombre_apellido` AS `nombre_apellido`,`tripulacion`.`cargo` AS `cargo`,`tripulacion`.`id_vuelo` AS `id_vuelo` from `tripulacion` where (`tripulacion`.`id_vuelo` = 'VUE114') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_5`
--
DROP TABLE IF EXISTS `consulta_5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_5`  AS  select `vuelos`.`destino` AS `destino`,`vuelos`.`aerolin` AS `aerolin`,`aerolìneas`.`nombre` AS `nombre` from (`vuelos` join `aerolìneas` on((`vuelos`.`aerolin` = `aerolìneas`.`id_aerolinea`))) where (`aerolìneas`.`nombre` = 'AVIANCA') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_6`
--
DROP TABLE IF EXISTS `consulta_6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_6`  AS  select `pasajero`.`nombre_apellido` AS `nombre_apellido`,`pasajero`.`equipaje` AS `equipaje` from `pasajero` where (`pasajero`.`id_pasajero` = '126') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_7`
--
DROP TABLE IF EXISTS `consulta_7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_7`  AS  select `pasajero`.`vuelo` AS `vuelo`,sum(`pasajero`.`equipaje`) AS `numero_piezas` from `pasajero` where (`pasajero`.`vuelo` = 'VUE115') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_8`
--
DROP TABLE IF EXISTS `consulta_8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_8`  AS  select avg(`pasajero`.`equipaje`) AS `promedio`,`vuelos`.`destino` AS `destino` from (`pasajero` join `vuelos` on((`pasajero`.`vuelo` = `vuelos`.`id_vuelos`))) group by `vuelos`.`destino` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_9`
--
DROP TABLE IF EXISTS `consulta_9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_9`  AS  select count(`aviones`.`id_avion`) AS `numero_aviones`,`aviones`.`nombre_aerolinea` AS `nombre_aerolinea` from `aviones` group by `aviones`.`nombre_aerolinea` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_10`
--
DROP TABLE IF EXISTS `consulta_10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_10`  AS  select sum(`pasajero`.`equipaje`) AS `total_piezas`,`pasajero`.`vuelo` AS `vuelo` from `pasajero` group by `pasajero`.`vuelo` ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aviones`
--
ALTER TABLE `aviones`
  ADD CONSTRAINT `aviones_ibfk_1` FOREIGN KEY (`id_aerolinea`) REFERENCES `aerolìneas` (`id_aerolinea`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pasajero`
--
ALTER TABLE `pasajero`
  ADD CONSTRAINT `pasajero_ibfk_1` FOREIGN KEY (`vuelo`) REFERENCES `vuelos` (`id_vuelos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tripulacion`
--
ALTER TABLE `tripulacion`
  ADD CONSTRAINT `tripulacion_ibfk_1` FOREIGN KEY (`id_vuelo`) REFERENCES `vuelos` (`id_vuelos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD CONSTRAINT `vuelos_ibfk_1` FOREIGN KEY (`avion`) REFERENCES `aviones` (`id_avion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vuelos_ibfk_2` FOREIGN KEY (`aerolin`) REFERENCES `aerolìneas` (`id_aerolinea`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
