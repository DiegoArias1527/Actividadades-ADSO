-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2023 a las 19:07:16
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `producto_bodega`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribuidor`
--

CREATE TABLE `distribuidor` (
  `id_Distribuidor` varchar(20) NOT NULL,
  `nom_Distribuidor` varchar(30) NOT NULL,
  `tel_Distribuidor` varchar(20) NOT NULL,
  `direccion_Distribuidor` varchar(40) NOT NULL,
  `nit_Distribuidor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `distribuidor`
--

INSERT INTO `distribuidor` (`id_Distribuidor`, `nom_Distribuidor`, `tel_Distribuidor`, `direccion_Distribuidor`, `nit_Distribuidor`) VALUES
('A01', 'Bavaria SA', '3130000000', 'Cra. 53a # 127 - 35, Bogotá', '903580893-1'),
('A02', 'Postobon SA', '3210000000', 'Cl. 17a #75 · 01-800-0515959', '930039012-1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_Producto` varchar(20) NOT NULL,
  `nom_Producto` varchar(30) NOT NULL,
  `precio_Producto` varchar(30) NOT NULL,
  `cantidad_Producto` int(11) NOT NULL,
  `fecha_Vencimiento` date NOT NULL,
  `id_Distribuidor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_Producto`, `nom_Producto`, `precio_Producto`, `cantidad_Producto`, `fecha_Vencimiento`, `id_Distribuidor`) VALUES
('C001', 'Cerveza Poker', '1200', 2000, '2024-02-12', 'A01'),
('C002', 'Cerveza Aguila', '2500', 1000, '0000-00-00', 'A01'),
('F001', 'Botella de Agua 150ml', '1500', 450, '2024-06-10', 'A02'),
('F002', 'Gaseosa de Manzana', '3000', 100, '2024-03-10', 'A02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `distribuidor`
--
ALTER TABLE `distribuidor`
  ADD PRIMARY KEY (`id_Distribuidor`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_Producto`),
  ADD KEY `FK_id_Distribuidor` (`id_Distribuidor`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_id_Distribuidor` FOREIGN KEY (`id_Distribuidor`) REFERENCES `distribuidor` (`id_Distribuidor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
