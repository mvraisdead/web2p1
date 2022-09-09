-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-08-2022 a las 18:43:00
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `facturas_177301`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `cantidad`, `nombre`, `precio`) VALUES
(1, 1, 'Cerveza Corona', 25.49),
(2, 10, 'Doritos', 50.26),
(3, 5, 'Coca Cola', 48.56),
(4, 15, 'Cornetto', 45.65),
(5, 15, 'Agua Ciel 20L', 34.89);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos_factura`
--

CREATE TABLE `articulos_factura` (
  `folio_factura` int(11) NOT NULL,
  `id_articulo` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `costo_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `rfc` varchar(15) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`rfc`, `correo`, `nombre`) VALUES
('LESZ030427420', '177301@upslp.edu.mx', 'Leonardo Serrano'),
('LOCG890326069', 'lorenzo@correo.net', 'Lorenzo Cordoba'),
('NACS980322123', 'correo@ejemplo.net', 'Nataly Carson'),
('VECJ880326456', 'ejemplo@correo.com', 'Verónica Cortez'),
('VICH780326741', 'victor@correo.com', 'Victor Chavez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `folio` int(11) NOT NULL,
  `rfc_cliente` varchar(15) NOT NULL,
  `fecha_emision` varchar(12) NOT NULL DEFAULT current_timestamp(),
  `monto_total` float NOT NULL,
  `iva` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`folio`, `rfc_cliente`, `fecha_emision`, `monto_total`, `iva`) VALUES
(1, 'LESZ030427420', '24/08/22', 1500, 200),
(2, 'VECJ880326456', '29/07/22', 100, 15),
(3, 'NACS980322123', '27/04/21', 2000, 250),
(4, 'LOCG890326069', '15/07/22', 4510, 350),
(5, 'VECJ880326456', '04/08/22', 1452, 51);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `articulos_factura`
--
ALTER TABLE `articulos_factura`
  ADD KEY `folio_factura` (`folio_factura`,`id_articulo`),
  ADD KEY `id_articulo` (`id_articulo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`rfc`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`folio`),
  ADD KEY `rfc_cliente` (`rfc_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `folio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos_factura`
--
ALTER TABLE `articulos_factura`
  ADD CONSTRAINT `articulos_factura_ibfk_1` FOREIGN KEY (`folio_factura`) REFERENCES `factura` (`folio`),
  ADD CONSTRAINT `articulos_factura_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`rfc_cliente`) REFERENCES `cliente` (`rfc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
