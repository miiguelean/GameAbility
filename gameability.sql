-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2024 a las 23:06:23
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
-- Base de datos: `gameability`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Mouse'),
(2, 'Teclado Mecanico'),
(3, 'Teclado Membrana'),
(4, 'Audifonos'),
(5, 'Controles Personalizados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`) VALUES
(1, 'Logitech'),
(2, 'Razer'),
(3, 'PlayStation'),
(4, 'Xbox'),
(5, 'HyperX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `imagen`, `precio`, `marca_id`, `categoria_id`) VALUES
(17, 'Control Access PS5', 'Personalizable para mayor comodidad, diseñado para jugadores con diversidad funcional.', 'Control-Access-PS5.png', 1999.00, 3, 5),
(21, 'Logitech G435', 'Con micrófono, Bluetooth y LIGHTSPEED para PC, celular y más dispositivos.\r\n\r\n\r\n\r\n\r\n\r\n', 'logitech-g435.png', 1472.00, 1, 4),
(22, 'Logitech G733', 'Audífonos con sonido envolvente, filtros de voz y luz avanzada para lucir, sonar y jugar con estilo.', 'logitech-g733.png', 2210.00, 1, 4),
(23, 'G502 Hero', 'Mouse óptico para gaming con sensor Hero de 16,000 DPI.', 'Logitech-G502-Hero.png', 59.99, 1, 1),
(24, 'G Pro X', 'Teclado mecánico para gaming con interruptores intercambiables.', 'Logitech-G-Pro-X.png', 129.99, 1, 2),
(25, 'K120', 'Teclado de membrana estándar con diseño resistente a salpicaduras.', 'Logitech-K120.png', 19.99, 1, 3),
(26, 'G Pro X', 'Audífonos con micrófono desmontable y sonido envolvente DTS.', 'Logitech-G-Pro-X-Audifonos.png', 129.99, 1, 4),
(27, 'Logitech G Adaptive Gaming Kit', 'Kit de adaptación para controles de Xbox Adaptive Controller.', 'Logitech-G-Adaptive-Gaming-Kit.png', 99.99, 1, 5),
(28, 'DeathAdder Elite', 'Mouse ergonómico con sensor óptico de 16,000 DPI.', 'Razer-DeathAdder-Elite.png', 69.99, 2, 1),
(29, 'BlackWidow Elite', 'Teclado mecánico con switches Razer Green y retroiluminación Chroma.', 'Razer-BlackWidow-Elite.png', 169.99, 2, 2),
(30, 'Cynosa Chroma', 'Teclado de membrana con retroiluminación RGB personalizable.', 'Razer-Cynosa-Chroma.png', 59.99, 2, 3),
(31, 'Kraken X', 'Audífonos ligeros con sonido envolvente 7.1.', 'Razer-Kraken-X.png', 49.99, 2, 4),
(32, 'Razer Raiju Ultimate', 'Controlador inalámbrico para PS4 con botones intercambiables y panel de control.', 'Razer-Raiju-Ultimate.png', 199.99, 2, 5),
(33, 'PlayStation Move', 'Control de movimiento para PS4 con seguimiento preciso.', 'PlayStation-Move.png', 79.99, 3, 1),
(34, 'Sony PlayStation 4 Back Button Attachment', 'Accesorio para control de PS4 con botones traseros programables.', 'PlayStation-4-Back-Button-Attachment.png', 29.99, 3, 2),
(35, 'Hori Tactical Assault Commander Pro (TAC Pro)', 'Teclado y mouse diseñados para PS4 con teclas programables y mouse con sensor óptico.', 'Hori-TAC-Pro.png', 129.99, 3, 3),
(36, 'Sony PlayStation Gold Wireless Headset', 'Audífonos inalámbricos con sonido envolvente virtual 7.1.', 'Sony-PlayStation-Gold-Wireless-Headset.png', 99.99, 3, 4),
(38, 'Razer Naga Hex V2', 'Mouse para gaming con sensor láser de 16,000 DPI.', 'Razer-Naga-Hex-V2.png', 79.99, 4, 1),
(39, 'Razer BlackWidow Tournament Edition Chroma V2', 'Teclado mecánico compacto con interruptores Razer Green y retroiluminación Chroma.', 'Razer-BlackWidow-Tournament-Edition-Chroma-V2.png', 139.99, 4, 2),
(40, 'Microsoft Xbox Chatpad', 'Teclado de membrana para control de Xbox One con conector de audio de 3.5 mm.', 'Microsoft-Xbox-Chatpad.png', 29.99, 4, 3),
(41, 'SteelSeries Arctis 9X', 'Audífonos inalámbricos con sonido envolvente y micrófono ClearCast.', 'SteelSeries-Arctis-9X.png', 199.99, 4, 4),
(42, 'Xbox Elite Wireless Controller Series 2', 'Controlador inalámbrico de alta gama con opciones de personalización y tecnología Bluetooth.', 'Xbox-Elite-Wireless-Controller-Series-2.png', 179.99, 4, 5),
(43, 'HyperX Pulsefire Surge RGB', 'Mouse para gaming con sensor Pixart 3389 y retroiluminación RGB.', 'HyperX-Pulsefire-Surge-RGB.png', 54.99, 5, 1),
(44, 'HyperX Alloy Elite RGB', 'Teclado mecánico con switches Cherry MX RGB y retroiluminación personalizable.', 'HyperX-Alloy-Elite-RGB.png', 169.99, 5, 2),
(45, 'HyperX Alloy Core RGB', 'Teclado de membrana con retroiluminación RGB y efectos de iluminación.', 'HyperX-Alloy-Core-RGB.png', 49.99, 5, 3),
(46, 'HyperX Cloud Alpha', 'Audífonos con controladores de cámara doble y marco de aluminio.', 'HyperX-Cloud-Alpha.png', 99.99, 5, 4),
(47, 'HyperX ChargePlay Duo', 'Estación de carga para controles de Xbox con indicadores LED y diseño compacto.', 'HyperX-ChargePlay-Duo.png', 29.99, 5, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marca_id` (`marca_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
