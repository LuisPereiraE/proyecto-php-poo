-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-11-2026 a las 08:23:15
-- Versión del servidor: 8.4.7
-- Versión de PHP: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET FOREIGN_KEY_CHECKS = 0;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_master`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Manga corta'),
(2, 'Tirantes'),
(3, 'Manga larga'),
(4, 'Sudaderas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas_pedidos`
--

DROP TABLE IF EXISTS `lineas_pedidos`;
CREATE TABLE IF NOT EXISTS `lineas_pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `unidades` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_linea_pedido` (`pedido_id`),
  KEY `fk_linea_producto` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `lineas_pedidos`
--

INSERT INTO `lineas_pedidos` (`id`, `pedido_id`, `producto_id`, `unidades`) VALUES
(1, 1, 1, 2),
(2, 2, 3, 1),
(3, 3, 25, 1),
(4, 3, 20, 1),
(5, 3, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `provincia` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `localidad` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coste` float(200,2) NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `usuario_id`, `provincia`, `localidad`, `direccion`, `coste`, `estado`, `fecha`, `hora`) VALUES
(1, 2, 'Alajuela', 'Alajuela', 'Alajuela', 17000.00, 'confirm', '2026-11-14', '12:46:03'),
(2, 2, 'alajuela', 'alajuela', 'alajuela', 9000.00, 'confirm', '2026-11-14', '14:06:18'),
(3, 2, 'Alajuela', 'Alajuela', 'Alajuela', 16400.00, 'confirm', '2026-11-18', '02:06:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria_id` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `precio` float(100,2) NOT NULL,
  `stock` int NOT NULL,
  `oferta` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` date NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producto_categoria` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria_id`, `nombre`, `descripcion`, `precio`, `stock`, `oferta`, `fecha`, `imagen`) VALUES
(1, 1, 'Camisa de rayas', 'Camisa de rayas', 8500.00, 5, NULL, '2026-11-14', 'camisa-rayas.jpg'),
(2, 1, 'Camisa de rayas roja', 'Camisa de Rayas roja', 7000.00, 5, NULL, '2026-11-14', 'camisa-rayas-roja.jpg'),
(3, 1, 'Camisa - Metallica', 'Camisa de Metallica', 9000.00, 10, NULL, '2026-11-14', 'camisa-metallica.jpg'),
(4, 1, 'Camisa roja', 'Camisa Roja', 6000.00, 3, NULL, '2026-11-14', 'camisa-roja.jpg'),
(5, 1, 'Camisa verde menta', 'Camisa color verde menta', 5500.00, 2, NULL, '2026-11-14', 'camisa-verde-menta.jpg'),
(6, 1, 'Camisa morado claro', 'Camisa color morado claro', 4500.00, 6, NULL, '2026-11-14', 'camisa-morada-claro.jpg'),
(8, 3, 'Manga larga blanca', 'Camisa de manga larga blanca', 8500.00, 6, NULL, '2026-11-18', 'manga-larga-blanco.webp'),
(9, 3, 'Manga larga roja', 'Manga larga de color rojo', 9000.00, 5, NULL, '2026-11-18', 'manga-larga-roja.webp'),
(10, 3, 'Manga larga azul oscuro', 'Camisa de manga larga azul oscuro', 6500.00, 5, NULL, '2026-11-18', 'marga-larga-azul-oscuro.webp'),
(11, 3, 'Manga larga celeste', 'Camisa de manga larga color celeste', 6000.00, 3, NULL, '2026-11-18', 'marga-larga-celeste.webp'),
(12, 3, 'Manga larga morada', 'Camisa manga larga de color morado', 7900.00, 2, NULL, '2026-11-18', 'marga-larga-morada.webp'),
(13, 3, 'Manga larga negra', 'Camisa manga larga de color negro', 8900.00, 8, NULL, '2026-11-18', 'marga-larga-negra.webp'),
(14, 4, 'Sudadera azul', 'Sudadera de color azul', 5000.00, 2, NULL, '2026-11-18', 'sudadera-azul.webp'),
(15, 4, 'Sudadera blanca', 'Sudadera de color blanco', 6900.00, 3, NULL, '2026-11-18', 'sudadera-blanca.webp'),
(16, 4, 'Sudadera morada', 'Sudadera de color morado', 5000.00, 4, NULL, '2026-11-18', 'sudadera-morada.webp'),
(17, 4, 'Sudadera negra', 'Sudadera de color negro', 7000.00, 6, NULL, '2026-11-18', 'sudadera-negra.webp'),
(18, 4, 'Sudadera roja', 'Sudadera de color rojo', 5100.00, 4, NULL, '2026-11-18', 'sudadera-roja.webp'),
(19, 4, 'Sudadera rosa', 'Sudadera de color rosa', 6000.00, 3, NULL, '2026-11-18', 'sudadera-rosa.webp'),
(20, 2, 'Tirantes blanca', 'Camisa de tirantes de color blanco', 6200.00, 4, NULL, '2026-11-18', 'tirantes-blanca.webp'),
(21, 2, 'Tirantes celeste', 'Camisa de tirantes de color celeste', 5500.00, 4, NULL, '2026-11-18', 'tirantes-celeste.webp'),
(22, 2, 'Tirantes gris', 'Camisa de tirantes de color gris', 6200.00, 5, NULL, '2026-11-18', 'tirantes-gris.webp'),
(23, 2, 'Tirantes negra', 'Camisa de tirantes de color negro', 7100.00, 5, NULL, '2026-11-18', 'tirantes-negra.webp'),
(24, 2, 'Tirantes rosa', 'Camisa de tirantes de color rosa', 5900.00, 6, NULL, '2026-11-18', 'tirantes-rosa.webp'),
(25, 2, 'Tirantes verde olivo', 'Camisa de tirantes de color verde olivo', 5700.00, 9, NULL, '2026-11-18', 'tirantes-verde-oliva.webp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `email`, `password`, `rol`, `imagen`) VALUES
(1, 'Admin', 'Admin', 'admin@admin.com', '$2y$04$TA4XkZLWpAL.RQL2W5Uty.x3d/ABslKbKka977PEfZkpJTFsRGjfK', 'admin', NULL),
(2, 'Luis', 'Espinoza', 'luis@luis.com', '$2y$04$yqiFOTouTRG3u0klPpstaOq/qyKOSuiGywu1BmVP/GGLE6M8q.rSO', 'user', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lineas_pedidos`
--
ALTER TABLE `lineas_pedidos`
  ADD CONSTRAINT `fk_linea_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `fk_linea_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;
SET FOREIGN_KEY_CHECKS = 1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
