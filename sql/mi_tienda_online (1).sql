-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2024 a las 19:36:56
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
-- Base de datos: `mi_tienda_online`
--

create database mi_tienda_online;
use mi_tienda_online;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `id_producto`, `id_usuario`, `cantidad`) VALUES
(3, 4, 1, 1),
(4, 3, 1, 1),
(5, 2, 1, 1),
(8, 6, 1, 14),
(9, 7, 1, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categorias` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categorias`) VALUES
(1, 'Madera'),
(2, 'Herramientas'),
(3, 'Ferretería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineapedidos`
--

CREATE TABLE `lineapedidos` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `apellidos` varchar(256) NOT NULL,
  `dni` varchar(9) NOT NULL,
  `direccion` varchar(256) NOT NULL,
  `precioTotal` float NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procat`
--

CREATE TABLE `procat` (
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `procat`
--

INSERT INTO `procat` (`id_producto`, `id_categoria`) VALUES
(1, 2),
(2, 2),
(3, 3),
(4, 1),
(5, 2),
(6, 1),
(7, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `precioUnitario` float NOT NULL,
  `imagen` varbinary(8000) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precioUnitario`, `imagen`, `stock`) VALUES
(1, 'Martillo 005 C', 2.98, 0x68747470733a2f2f6d656469612e6164656f2e636f6d2f6d61726b6574706c6163652f4d4b502f38363631313639302f30363334646364636134303132663231383038303234333534333137396163302e6a7065673f77696474683d363530266865696768743d36353026666f726d61743d6a7067267175616c6974793d3830266669743d626f756e6473, 26),
(2, 'Taladro', 54.99, 0x68747470733a2f2f6d656469612e6164656f2e636f6d2f6d656469612f313931323632382f6d656469612e6a70673f77696474683d363530266865696768743d36353026666f726d61743d6a7067267175616c6974793d3830266669743d626f756e6473, 56),
(3, 'Caja DIY de 100 tornillos bicromatados (3,5x16 mm)', 7.52, 0x68747470733a2f2f6d656469612e6164656f2e636f6d2f6d6b702f35383934656363376536333861393263393333373665393533336634643366322f6d656469612e6a70673f77696474683d363530266865696768743d36353026666f726d61743d6a7067267175616c6974793d3830266669743d626f756e6473, 42),
(4, 'Tabla de Roble', 4.93, 0x68747470733a2f2f6c6976652e737461746963666c69636b722e636f6d2f323234362f313439353234353033325f333361633365356565375f632e6a7067, 100),
(5, 'Pala punta 5501-4 MA.CL', 11.15, 0x68747470733a2f2f62656c6c6f74612e622d63646e2e6e65742f434d50343530362f312f464d33343433424931373130345f53415f3135353830345f535a362e706e67, 10),
(6, 'Tocones pequeños de Encina', 1, 0x68747470733a2f2f776f6f64776f726c6462617263656c6f6e612e636f6d2f6d6f64756c65732f70685f73696d706c65626c6f672f636f766572732f332e6a7067, 87),
(7, 'Clavo Albañil con Cabeza 3\" x 30 kg.', 55.93, 0x68747470733a2f2f696d61676564656c69766572792e6e65742f346659755179792d72385f727042706359376c485f412f736f64696d616350452f3132303135345f30312f773d3830302c683d3830302c6669743d706164, 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `apellidos` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `rol` varchar(256) NOT NULL DEFAULT 'Usuario',
  `dni` varchar(9) NOT NULL,
  `direccion` varchar(256) NOT NULL,
  `telefono` int(9) NOT NULL,
  `contrasena` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `email`, `rol`, `dni`, `direccion`, `telefono`, `contrasena`) VALUES
(1, 'Jorge', 'Fabro García', 'jorge@fabro.com', 'Admin', '12345678A', 'Calle Falsa 123', 123456789, 'admin1'),
(2, 'Admin', '', 'admin@admin.com', 'Admin', '98765432B', '', 987654321, 'admin'),
(3, 'Juan', 'Pérez López', 'juan@perez.com', 'Usuario', '87654321B', 'Calle Falsa 324', 987654321, '1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lineapedidos`
--
ALTER TABLE `lineapedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `procat`
--
ALTER TABLE `procat`
  ADD PRIMARY KEY (`id_producto`,`id_categoria`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `lineapedidos`
--
ALTER TABLE `lineapedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `procat`
--
ALTER TABLE `procat`
  ADD CONSTRAINT `procat_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `procat_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
