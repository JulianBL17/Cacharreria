-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2021 a las 20:27:06
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cacharreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id_articulo` int(11) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `codigo` int(11) NOT NULL,
  `articulo` varchar(250) NOT NULL,
  `marca` varchar(250) NOT NULL,
  `proveedor` varchar(250) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valor` double NOT NULL,
  `total` double NOT NULL,
  `descripcion` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id_articulo`, `fecha`, `codigo`, `articulo`, `marca`, `proveedor`, `cantidad`, `valor`, `total`, `descripcion`) VALUES
(1, '2021-06-02 15:57:53', 20012, 'Escoba Plastica', 'Aseo Plus', 'Distribuidora-Medina', 10, 8000, 80000, 'Escobas com mango de madera.'),
(2, '2021-06-08 13:13:38', 50213, 'Guantes de aseo', 'Aseo Plus', 'Sandra Andrade Muños', 19, 10000, 200000, 'Guantes de plastico para el aseo, color amarillo.'),
(3, '2021-06-08 13:25:39', 50134, 'Cortina', 'Max Plasticos', 'Distribuidora-Medina', 8, 12000, 120000, 'Cortinas plasticas para baño.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `identificacion` int(11) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `telefono` varchar(250) NOT NULL,
  `num_documento` int(7) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `identificacion`, `direccion`, `telefono`, `num_documento`) VALUES
(2, 'Adriana Tao', 1061226802, 'Inzá-Cauca', '3449801122', 0000001);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `id_cotizacion` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `empleado` varchar(250) NOT NULL,
  `cliente` varchar(250) NOT NULL,
  `documento` int(7) UNSIGNED ZEROFILL NOT NULL,
  `valor_cotizacion` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cotizaciones`
--

INSERT INTO `cotizaciones` (`id_cotizacion`, `fecha`, `empleado`, `cliente`, `documento`, `valor_cotizacion`) VALUES
(2, '2021-06-09 03:50:47', 'Yeison Neyid Ramiréz Salazar', 'Adriana Tao', 0000001, 26000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id_documento` int(11) NOT NULL,
  `articulo` varchar(250) NOT NULL,
  `codigo` int(11) NOT NULL,
  `marca` varchar(250) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valor` double NOT NULL,
  `total` double NOT NULL,
  `num_documento` int(7) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id_documento`, `articulo`, `codigo`, `marca`, `cantidad`, `valor`, `total`, `num_documento`) VALUES
(3, 'Escoba Plastica', 20012, 'Aseo Plus', 2, 8000, 16000, 0000001),
(4, 'Guantes de aseo', 50213, 'Aseo Plus', 1, 10000, 10000, 0000001);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `articulo` varchar(250) NOT NULL,
  `codigo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valor` double NOT NULL,
  `total` double NOT NULL,
  `factura` int(7) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `fecha`, `articulo`, `codigo`, `cantidad`, `valor`, `total`, `factura`) VALUES
(1, '2021-06-08 18:26:35', 'Cortina', 50134, 2, 12000, 24000, 0000001),
(2, '2021-06-08 18:26:35', 'Guantes de aseo', 50213, 1, 10000, 10000, 0000001);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `ruc` bigint(20) NOT NULL,
  `empresa` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `apellido` varchar(250) NOT NULL,
  `identificacion` int(11) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `correo` varchar(250) NOT NULL,
  `telefono` varchar(250) NOT NULL,
  `actividad` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `ruc`, `empresa`, `nombre`, `apellido`, `identificacion`, `direccion`, `correo`, `telefono`, `actividad`) VALUES
(1, 500235, 'Distribuidora-Medina', 'Carlos Andres', 'Medina', 78394206, 'carrera 26 N 16-05', 'distribuidora@medina.gov.co', '8-213456', 'Distrubuye, utencilios de plastico.'),
(2, 501345, 'Sandra Andrade Muños', 'Sandra', 'Andrade Muños', 78987456, 'Popayán Cr8 N-28', 'andradesandra@hotmail.com', '8-569872', 'Venta de articulos de tela, como fundas, limpiones de cocina y manteles.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `apellido` varchar(250) NOT NULL,
  `identificacion` int(11) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(250) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `usuario` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `fecha`, `nombre`, `apellido`, `identificacion`, `telefono`, `correo`, `cargo`, `usuario`, `password`) VALUES
(1, '2021-06-01', '', '', 0, '', '', 'Administrador', 'Admin', 'admin'),
(2, '2021-06-05', 'Yeison Neyid', 'Ramiréz Salazar', 1061226802, '3105751887', 'yramirezgmail.com', 'Administrador', 'yeison2021', '1234567'),
(3, '2021-06-07', 'Julian Enrrique', 'Bolañoz Lopez', 1061226812, '3245670987', 'julibolañoz@hotmail.com', 'Vendedor', 'lopez', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `vendedor` varchar(150) NOT NULL,
  `monto` double NOT NULL,
  `factura` int(7) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `fecha`, `vendedor`, `monto`, `factura`) VALUES
(1, '2021-06-08 18:26:35', 'Yeison Neyid Ramiréz Salazar', 34000, 0000001);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id_articulo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`id_cotizacion`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id_articulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  MODIFY `id_cotizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
