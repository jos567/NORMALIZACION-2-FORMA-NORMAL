-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2021 a las 03:32:04
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl-direcciones`
--

CREATE TABLE `tbl-direcciones` (
  `ID DIRECCION` int(11) NOT NULL,
  `DIRECCION` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl-direcciones`
--

INSERT INTO `tbl-direcciones` (`ID DIRECCION`, `DIRECCION`) VALUES
(1, 'BARRIO ARRIBA '),
(2, 'BARRIO LOURDES'),
(3, 'BARRIO LA INDEPENDENCIA'),
(4, 'BARRIO SANTA LUCIA'),
(5, 'BARRIO ARRIBA ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl-envio`
--

CREATE TABLE `tbl-envio` (
  `ID-ENVIO` int(10) NOT NULL,
  `DESCRIPCION-ENVIO` varchar(3000) NOT NULL,
  `FECHA` date NOT NULL,
  `ID_DIRECCION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl-envio`
--

INSERT INTO `tbl-envio` (`ID-ENVIO`, `DESCRIPCION-ENVIO`, `FECHA`, `ID_DIRECCION`) VALUES
(1, '2 PIZZAS DE PEPERONI', '2021-05-04', 4),
(2, '3 HAMBURGUESASS DE POLLO', '2021-05-12', 2),
(3, '2 TACOS YULI', '2021-05-20', 3),
(4, '2 BANDEJAS DE TACOS AL PASTOR', '2021-05-29', 1),
(5, '2 PORCIONES DE POLLO', '2021-05-26', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl-facturas`
--

CREATE TABLE `tbl-facturas` (
  `ID FACTURA` int(11) NOT NULL,
  `DESCRIPCION DE LA FACTURA` varchar(200) NOT NULL,
  `FECHA` date NOT NULL,
  `ID_DIRECCION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl-facturas`
--

INSERT INTO `tbl-facturas` (`ID FACTURA`, `DESCRIPCION DE LA FACTURA`, `FECHA`, `ID_DIRECCION`) VALUES
(1, 'TACOS MEXICANO', '2021-05-28', 1),
(2, '3 ORDENES DE BALEADAS ', '2021-05-28', 4),
(3, '5 ORDENES DE PUPUSAS', '2021-05-30', 2),
(4, '3 ORDENES DE YUCA CON CHICHARRON ', '2021-05-22', 3),
(5, '1 ORDEN DE ALITAS DE POLLO', '2021-05-23', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl-inventario`
--

CREATE TABLE `tbl-inventario` (
  `ID PRODUCTO` int(10) NOT NULL,
  `PRODUCTO` text NOT NULL,
  `PRECIO` int(50) NOT NULL,
  `ID_DIRECCION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl-inventario`
--

INSERT INTO `tbl-inventario` (`ID PRODUCTO`, `PRODUCTO`, `PRECIO`, `ID_DIRECCION`) VALUES
(1, 'SILLAS', 1000, 3),
(2, 'ventilador', 400, 1),
(3, 'camara de video', 3000, 5),
(4, 'platos', 20, 4),
(5, 'aire acondiciondo', 3000, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl-pedidos`
--

CREATE TABLE `tbl-pedidos` (
  `ID PEDIDO` int(11) NOT NULL,
  `DESCRIPCION DEL PEDIDO` varchar(200) NOT NULL,
  `FECHA` date NOT NULL,
  `ID_DIRECCION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl-pedidos`
--

INSERT INTO `tbl-pedidos` (`ID PEDIDO`, `DESCRIPCION DEL PEDIDO`, `FECHA`, `ID_DIRECCION`) VALUES
(1, '2 ordenes de papas con tocino', '2021-05-12', 4),
(2, '2 sandwiche', '2021-05-25', 3),
(3, '2 enchiles', '2021-05-26', 5),
(4, '4 bandejas de arroz chino', '2021-05-26', 2),
(5, '2 ordenes de tamales de ceniza', '2021-05-26', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl-direcciones`
--
ALTER TABLE `tbl-direcciones`
  ADD PRIMARY KEY (`ID DIRECCION`);

--
-- Indices de la tabla `tbl-envio`
--
ALTER TABLE `tbl-envio`
  ADD PRIMARY KEY (`ID-ENVIO`),
  ADD KEY `FK_DIRECCIONES_ENVIO` (`ID_DIRECCION`);

--
-- Indices de la tabla `tbl-facturas`
--
ALTER TABLE `tbl-facturas`
  ADD PRIMARY KEY (`ID FACTURA`),
  ADD KEY `FK_DIRECCIONES_FACTURAS` (`ID_DIRECCION`);

--
-- Indices de la tabla `tbl-inventario`
--
ALTER TABLE `tbl-inventario`
  ADD PRIMARY KEY (`ID PRODUCTO`),
  ADD KEY `FK_DIRECCIONES_INVENTARIO` (`ID_DIRECCION`);

--
-- Indices de la tabla `tbl-pedidos`
--
ALTER TABLE `tbl-pedidos`
  ADD PRIMARY KEY (`ID PEDIDO`),
  ADD KEY `FK_DIRECCIONES_PEDIDOS` (`ID_DIRECCION`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl-direcciones`
--
ALTER TABLE `tbl-direcciones`
  MODIFY `ID DIRECCION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl-envio`
--
ALTER TABLE `tbl-envio`
  MODIFY `ID-ENVIO` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl-facturas`
--
ALTER TABLE `tbl-facturas`
  MODIFY `ID FACTURA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl-inventario`
--
ALTER TABLE `tbl-inventario`
  MODIFY `ID PRODUCTO` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl-pedidos`
--
ALTER TABLE `tbl-pedidos`
  MODIFY `ID PEDIDO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl-envio`
--
ALTER TABLE `tbl-envio`
  ADD CONSTRAINT `FK_DIRECCIONES_ENVIO` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `tbl-direcciones` (`ID DIRECCION`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl-facturas`
--
ALTER TABLE `tbl-facturas`
  ADD CONSTRAINT `FK_DIRECCIONES_FACTURAS` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `tbl-direcciones` (`ID DIRECCION`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl-inventario`
--
ALTER TABLE `tbl-inventario`
  ADD CONSTRAINT `FK_DIRECCIONES_INVENTARIO` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `tbl-direcciones` (`ID DIRECCION`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl-pedidos`
--
ALTER TABLE `tbl-pedidos`
  ADD CONSTRAINT `FK_DIRECCIONES_PEDIDOS` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `tbl-direcciones` (`ID DIRECCION`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
