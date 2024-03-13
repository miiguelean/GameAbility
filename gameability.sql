-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2024 a las 21:11:42
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
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `titulo`, `fecha`, `descripcion`) VALUES
(1, 'Conferencia de Desarrollo de Videojuegos', '2024-05-15', 'Únete a nuestra conferencia sobre el desarrollo de videojuegos y aprende de expertos de la industria.'),
(2, 'Charla sobre Accesibilidad en los Videojuegos', '2024-06-20', 'Participa en nuestra charla sobre accesibilidad en los videojuegos y descubre cómo hacerlos más inclusivos.'),
(3, 'Evento de LAN Party', '2024-07-10', 'Ven a nuestra LAN Party y disfruta de una noche llena de juegos en red con otros entusiastas.'),
(4, 'Feria de Videojuegos Indie', '2024-08-05', 'Explora la creatividad de los desarrolladores independientes en nuestra feria de videojuegos indie.'),
(5, 'Presentación de Nuevos Juegos', '2024-09-12', 'Descubre los próximos lanzamientos en nuestra presentación de nuevos juegos.'),
(6, 'Taller de Creación de Mods', '2024-10-18', 'Aprende a crear mods para tus juegos favoritos en nuestro taller especializado.'),
(7, 'Evento de Presentación de Cyberpunk 2077', '2024-05-15', 'Ven y disfruta del evento de presentación de Cyberpunk 2077 con demostraciones exclusivas y sorpresas.'),
(8, 'Torneo de League of Legends en línea', '2024-07-20', 'Participa en nuestro torneo en línea de League of Legends y demuestra tu habilidad en este popular juego.');

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
(1, 3, 1, 'Sí, existen varios programas de terceros recomendados para configurar controles en PC. Uno de los más populares es JoyToKey, que te permite asignar teclas del teclado y clics del ratón a los botones y ejes de tu control. Para usarlo, simplemente descarga e instala JoyToKey, luego sigue las instrucciones para asignar las funciones que desees a tu control. Otro software recomendado es Xpadder, que ofrece funcionalidades similares. Ambos programas son fáciles de usar y pueden ayudarte a configurar tu control [nombre del control] en tu PC según tus preferencias.\r\n\r\n', '2024-03-04 19:46:09'),
(3, 6, 4, 'me parecen bien pero pudieron estar mejor', '2024-03-12 19:43:11'),
(4, 4, 4, 'JSJAJSJASJ no sabes como??\r\nes el jefe mas facil', '2024-03-12 19:46:10'),
(5, 4, 4, 'Solo lanza un hacha', '2024-03-12 19:48:38'),
(6, 4, 4, 'nose', '2024-03-12 19:49:09'),
(7, 4, 4, 'Lanza un hacha al ojo izquierdo', '2024-03-12 19:49:44'),
(8, 4, 4, 'Lanza el hacha', '2024-03-12 19:50:33'),
(9, 6, 4, 'algo fea la actualizacion', '2024-03-12 19:50:57'),
(10, 6, 4, 'muy buenaaaa', '2024-03-12 19:51:35'),
(11, 6, 4, 'muy mala', '2024-03-12 19:51:47'),
(12, 6, 4, 'mala', '2024-03-12 19:52:23'),
(13, 1, 1, 'Enciende tu PS5 y asegúrate de que el control Access esté conectado correctamente a través de USB o Bluetooth.\r\nEn el menú de inicio de la PS5, ve a \"Configuración\" y luego selecciona \"Dispositivos\".\r\nEn la sección \"Controladores y dispositivos de entrada\", selecciona \"Controladores\" y luego \"Asignación de botones\".\r\nSelecciona tu control Access de la lista de dispositivos conectados.\r\nAhora, sigue las instrucciones en pantalla para asignar los botones según tus preferencias en Fall Guys.\r\nUna vez que hayas configurado los botones, guarda la configuración y sal de la configuración de controladores.\r\nAhora tu control Access de PS5 debería estar configurado correctamente para jugar a Fall Guys. ¡Buena suerte!', '2024-03-13 18:05:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneos`
--

CREATE TABLE `torneos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `torneos`
--

INSERT INTO `torneos` (`id`, `titulo`, `fecha`, `descripcion`) VALUES
(1, 'Torneo de League of Legends', '2024-05-15', 'Únete a nuestro torneo de League of Legends y demuestra tus habilidades en este popular MOBA.'),
(2, 'Competencia de FIFA 25', '2024-06-20', 'Demuestra tus habilidades en la cancha virtual con nuestra competencia de FIFA 25.'),
(3, 'Concurso de Super Smash Bros Ultimate', '2024-07-10', 'Participa en nuestro concurso de Super Smash Bros Ultimate y lucha contra otros jugadores para convertirte en el campeón.'),
(4, 'Competencia de Rocket League', '2024-08-05', 'Demuestra tus habilidades automovilísticas en nuestro torneo de Rocket League.'),
(5, 'Torneo de Fortnite', '2024-09-12', 'Enfréntate a otros jugadores en nuestro torneo de Fortnite y gana fabulosos premios.'),
(6, 'Torneo de Call of Duty: Warzone', '2024-10-18', 'Enfréntate a otros soldados en nuestro torneo de Call of Duty: Warzone y demuestra quién es el mejor.'),
(7, 'Torneo de FIFA 24', '2024-06-10', 'Participa en nuestro torneo de FIFA 24 y compite contra los mejores jugadores para ganar fabulosos premios.'),
(8, 'Torneo de Call of Duty: Warzone', '2024-08-05', 'Demuestra tu habilidad en Call of Duty: Warzone y gana increíbles premios en nuestro torneo en línea.'),
(9, 'Torneo de Fortnite Battle Royale', '2024-09-15', 'Participa en nuestro torneo de Fortnite Battle Royale y compite por premios épicos.');

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
(4, '', 'debanhisiuu', 'debanhi@gmail.com', '123', '1995-11-10'),
(5, '', 'Ye', 'ye@gmail.com', '123', '1999-06-25');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
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
-- Indices de la tabla `torneos`
--
ALTER TABLE `torneos`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `torneos`
--
ALTER TABLE `torneos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
