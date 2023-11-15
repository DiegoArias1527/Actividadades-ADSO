-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2023 a las 17:54:16
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
-- Base de datos: `escoart`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritocompras`
--

CREATE TABLE `carritocompras` (
  `Id_Carrito` int(11) NOT NULL COMMENT 'Es el valor unico que tiene el carrito de compra de un usuario',
  `Id_Productos` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada producto',
  `Id_Usuarios` int(11) NOT NULL COMMENT 'Es el valor unico que representa cada usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `Id_Categoria` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada categoría de productos ',
  `Nom_Categoria` varchar(30) NOT NULL COMMENT 'Es el nombre que tiene cada categoría de productos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`Id_Categoria`, `Nom_Categoria`) VALUES
(1, 'Oficina'),
(2, 'Escolar'),
(3, 'Arte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `Id_Envio` int(11) NOT NULL COMMENT 'Es el valor unico de cada envió',
  `Estado_Envio` varchar(30) NOT NULL COMMENT 'Muestra el estado en el cual se encuentra el envio',
  `Fecha_Envio` date NOT NULL COMMENT 'Es la fecha en la cual se realizo el envio',
  `Fecha_Entrega` date NOT NULL COMMENT 'Es la fecha estimada en la cual se entregara el envio',
  `Id_Pedido` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada pedido',
  `Id_Usuario` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada usuairo',
  `Id_Estados` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id_Estados` int(11) NOT NULL,
  `Estados` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id_Estados`, `Estados`) VALUES
(1, 'Pendiente'),
(2, 'Enviado'),
(3, 'Recibido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `Id_Pedido` int(11) NOT NULL COMMENT 'Es el valor unico de cada pedido',
  `Fecha_Pedido` date NOT NULL COMMENT 'Es la fecha en la cual se realizo el pedido',
  `Estado_Pedido` varchar(30) NOT NULL COMMENT 'Es el estado actual en el cual se encuentra el pedido',
  `Id_Usuario` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_Producto` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada producto',
  `Nom_Producto` varchar(30) NOT NULL COMMENT 'Es el nombre que tiene cada producto',
  `Precio_Producto` decimal(10,0) NOT NULL COMMENT 'Es el precio que cuesta cada producto',
  `Desc_Producto` varchar(100) NOT NULL COMMENT 'Es la descripción de cada producto',
  `Id_Categoria` int(11) NOT NULL COMMENT 'Es el valor unico de cada categoria',
  `Id_Proveedor` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada proveedor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Id_Producto`, `Nom_Producto`, `Precio_Producto`, `Desc_Producto`, `Id_Categoria`, `Id_Proveedor`) VALUES
(1, '1', 1, '', 3, 101),
(11001, 'Tijeras', 4500, '', 1, 101),
(11002, 'Marcadores', 1000, '', 1, 101),
(11003, 'Caja lapiceros Rojos', 7000, '', 1, 102),
(11004, 'Carpeta plastica de colores', 2500, '', 1, 101),
(11005, 'Paquete X8 marcadores de color', 15000, '', 1, 102),
(11006, 'Cuaderno 100 hojas 1', 2500, '', 2, 103),
(11007, 'Cartuchera', 15000, '', 2, 103),
(11008, 'Cuaderno 100 hojas 2', 2500, '', 2, 103),
(11009, 'Tajalapices', 3000, '', 2, 103),
(11010, 'Bloc hojas cuadriculadas', 5000, '', 2, 103),
(11011, 'Borrador miga de pan', 1000, '', 2, 103),
(11012, 'Caja de colores', 12500, '', 2, 103),
(11013, 'Compas ', 4600, '', 2, 103),
(11014, 'Paquete pinceles', 10000, '', 3, 104),
(11015, 'Pinturas Oleo', 25000, '', 3, 104),
(11016, 'Cuaderno de dibujo Norma', 17000, '', 3, 104),
(11017, 'Lapices de Grafito', 4000, '', 3, 104),
(11018, 'Paquete de reglas flexibles', 6500, '', 2, 101),
(11019, 'Maleta', 60000, '', 2, 104);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Id_Proveedor` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada proveedor',
  `Nom_Proveedor` varchar(30) NOT NULL COMMENT 'Nombre de el proveedor',
  `Tel_Proveedor` varchar(30) NOT NULL COMMENT 'Numero de teléfono del proveedor ',
  `id_tipoProveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`Id_Proveedor`, `Nom_Proveedor`, `Tel_Proveedor`, `id_tipoProveedor`) VALUES
(101, 'Proveedor 1', '3130000000', 1002),
(102, 'Proveedor 2', '3130000000', 1002),
(103, 'Proveedor 3', '3210000000', 1001),
(104, 'Proveedor 4', '3150000000', 1002);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo proveedor`
--

CREATE TABLE `tipo proveedor` (
  `id_tipoProveedor` int(11) NOT NULL,
  `tipo_Proveedor` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo proveedor`
--

INSERT INTO `tipo proveedor` (`id_tipoProveedor`, `tipo_Proveedor`) VALUES
(1001, 'Local'),
(1002, 'Empresa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_Usuario` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada usuario',
  `Nom_Usuario` varchar(30) NOT NULL COMMENT 'Nombre del usuario\r\n',
  `Primer_Apellido` varchar(30) NOT NULL COMMENT 'Apellido del usuario',
  `Segundo_Apellido` varchar(30) NOT NULL COMMENT 'segundo apellido del usuario',
  `Correo_Usuario` varchar(30) NOT NULL COMMENT 'Correo electrónico del usuario',
  `Contraseña` varchar(30) NOT NULL COMMENT 'Contraseña del usuario',
  `Tel_Usuario` varchar(20) NOT NULL COMMENT 'Numero de telefono del usuario',
  `Dirreccion_Usuario` varchar(40) NOT NULL COMMENT 'Dirección de recidencia del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id_Usuario`, `Nom_Usuario`, `Primer_Apellido`, `Segundo_Apellido`, `Correo_Usuario`, `Contraseña`, `Tel_Usuario`, `Dirreccion_Usuario`) VALUES
(21, 'Leidy', 'Torres', 'Ramirez', 'paola@gmail.com', '$2y$10$6jgzBNVMCvbCU/8tp83tSe5', '', ''),
(22, 'Diego', 'Arias', 'Torres', 'diego@gmail.com', '$2y$10$gQf5nrk/IfsEVYKvKGYMDue', '', ''),
(23, 'Miguel', 'Arias', 'Sanabria', 'luismi@gmail.com', '$2y$10$lx.3sYUfgzdwfMTSLxfrle2', '', ''),
(29, 'Yonatan', 'Bonilla', 'Triana', 'correo@gmail.com', '$2y$10$hLNr/vrA2yi33NgC.CMZHuy', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carritocompras`
--
ALTER TABLE `carritocompras`
  ADD PRIMARY KEY (`Id_Carrito`),
  ADD KEY `carritocompras_Id_Usuarios` (`Id_Usuarios`),
  ADD KEY `Id_Productos` (`Id_Productos`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id_Categoria`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`Id_Envio`),
  ADD UNIQUE KEY `Id_Estados` (`Id_Estados`),
  ADD KEY `envio_Id_Pedido` (`Id_Pedido`),
  ADD KEY `envio_Id_Usuario` (`Id_Usuario`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_Estados`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`Id_Pedido`),
  ADD KEY `pedidos_Id_Usuarios` (`Id_Usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_Producto`),
  ADD KEY `Id_Categoria` (`Id_Categoria`),
  ADD KEY `Id_Proveedor` (`Id_Proveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Id_Proveedor`),
  ADD KEY `id_tipoProveedor` (`id_tipoProveedor`);

--
-- Indices de la tabla `tipo proveedor`
--
ALTER TABLE `tipo proveedor`
  ADD PRIMARY KEY (`id_tipoProveedor`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_Estados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo proveedor`
--
ALTER TABLE `tipo proveedor`
  MODIFY `id_tipoProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es el valor unico que tiene cada usuario', AUTO_INCREMENT=31;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carritocompras`
--
ALTER TABLE `carritocompras`
  ADD CONSTRAINT `carritocompras_ibfk_1` FOREIGN KEY (`Id_Productos`) REFERENCES `productos` (`Id_Producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `carritocompras_ibfk_2` FOREIGN KEY (`Id_Usuarios`) REFERENCES `usuario` (`Id_Usuario`);

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `envio_Id_Pedido` FOREIGN KEY (`Id_Pedido`) REFERENCES `pedidos` (`Id_Pedido`) ON UPDATE CASCADE,
  ADD CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`Id_Estados`) REFERENCES `estados` (`id_Estados`),
  ADD CONSTRAINT `envio_ibfk_2` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Id_Categoria`) REFERENCES `categoria` (`Id_Categoria`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedor` (`Id_Proveedor`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`id_tipoProveedor`) REFERENCES `tipo proveedor` (`id_tipoProveedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
