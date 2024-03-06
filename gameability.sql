-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-03-2024 a las 23:01:19
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
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `contenido` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `id_usuario`, `titulo`, `contenido`, `fecha`) VALUES
(1, 1, 'Ayuda para configurar un control Access de PS5', 'Estoy buscando ayuda para configurar un control para jugar en mi PS5. Tengo un control Access de PS5 y estoy teniendo dificultades para configurarlo correctamente en Fall Guys. He intentado seguir algunos tutoriales en línea, pero no he tenido éxito.\r\n\r\n¿Alguien podría darme instrucciones paso a paso sobre cómo configurar este control en mi PS5? Aprecio cualquier ayuda que puedan brindarme. ¡Gracias de antemano!', '2024-03-04 19:34:00'),
(2, 1, '¿Hay alguna configuración especial que deba hacer en Windows para que mi control [nombre del control] funcione correctamente en todos los juegos?', 'Necesito ayuda para configurar mi control [nombre del control] en Windows para que funcione correctamente en todos los juegos. ¿Alguien sabe si hay alguna configuración especial que deba hacer en Windows para lograr esto?', '2024-03-04 19:44:07'),
(3, 3, '¿Existe algún software de terceros recomendado para configurar controles en PC?', 'Estoy buscando un software de terceros recomendado para configurar mi control [nombre del control] en mi PC. ¿Alguien puede recomendarme alguno y darme instrucciones sobre cómo usarlo?', '2024-03-04 19:44:48'),
(4, 1, 'Ayuda para superar el nivel de jefes en [Nombre del juego]', 'fgdj vgdgfisgaifiugewjhfgsdj ', '2024-03-04 20:44:15'),
(5, 1, '¿Cuál es tu opinión sobre el equilibrio en [Nombre del juego]?', 'Hablemos sobre el equilibrio en [Nombre del juego]. ¿Crees que los personajes/vehículos/armas están equilibrados o hay alguno que destaque demasiado? ¿Qué cambios o ajustes sugerirías para mejorar el equilibrio en el juego? ¡Comparte tu opinión y discute con la comunidad!', '2024-03-04 20:47:17'),
(6, 4, '¿Qué opinas de las actualizaciones recientes de [Nombre del juego]?', '[Nombre del juego] ha lanzado recientemente algunas actualizaciones importantes. ¿Qué te parecen? ¿Crees que han mejorado la experiencia de juego o han introducido problemas nuevos? Comparte tus impresiones y discute cómo afectan estas actualizaciones al juego.', '2024-03-04 20:57:06');

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
(17, 'Control Access PS5', 'Personalizable para mayor comodidad, diseñado para jugadores con diversidad funcional.', 'Control-Access-PS5.png', 119.00, 3, 5),
(21, 'Logitech G435', 'Con micrófono, Bluetooth y LIGHTSPEED para PC, celular y más dispositivos.\r\n\r\n\r\n\r\n\r\n\r\n', 'logitech-g435.png', 80.00, 1, 4),
(22, 'Logitech G733', 'Audífonos con sonido envolvente, filtros de voz y luz avanzada para lucir, sonar y jugar con estilo.', 'logitech-g733.png', 150.00, 1, 4),
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `contenido` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`id`, `id_pregunta`, `id_usuario`, `contenido`, `fecha`) VALUES
(1, 3, 1, 'Sí, existen varios programas de terceros recomendados para configurar controles en PC. Uno de los más populares es JoyToKey, que te permite asignar teclas del teclado y clics del ratón a los botones y ejes de tu control. Para usarlo, simplemente descarga e instala JoyToKey, luego sigue las instrucciones para asignar las funciones que desees a tu control. Otro software recomendado es Xpadder, que ofrece funcionalidades similares. Ambos programas son fáciles de usar y pueden ayudarte a configurar tu control [nombre del control] en tu PC según tus preferencias.\r\n\r\n', '2024-03-04 19:46:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `username`, `email`, `pwd`, `fecha_nacimiento`) VALUES
(1, 'Miguel Tienda', 'TJ_in_SickoMode', 'miguel@gmail.com', '123', '2000-05-01'),
(2, '', 'joelinjr04', 'joel@gmail.com', '1234', '2003-06-04'),
(3, '', 'Elvis_Tek', 'Elvis_Tek@gmail.com', '123', '2000-07-14'),
(4, '', 'debanhisiuu', 'debanhi@gmail.com', '123', '1995-11-10');

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
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marca_id` (`marca_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pregunta` (`id_pregunta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `respuestas_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `respuestas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
