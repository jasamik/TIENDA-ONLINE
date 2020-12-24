-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-09-2020 a las 16:43:35
-- Versión del servidor: 10.3.23-MariaDB-cll-lve
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aquariad_commerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `email` text COLLATE utf8_spanish_ci NOT NULL,
  `foto` text COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `perfil` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id`, `nombre`, `email`, `foto`, `password`, `perfil`, `estado`, `fecha`) VALUES
(3, 'Carlos Mejia', 'jasamik@hotmail.com', 'vistas/img/perfiles/519.jpg', '$2a$07$asxx54ahjppf45sd87a5au6Pk2Pjm6StmyW5FBRNSxw2.mTSo4lDW', 'administrador', 1, '2020-05-07 22:09:14'),
(4, 'Merylin Salvador', 'merylin.s_v@hotmail.com', '', '$2a$07$asxx54ahjppf45sd87a5auaKpXpxipdoM4FbFx2fhmMXeJBEcKc.C', 'administrador', 1, '2020-05-07 22:09:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `ruta` text COLLATE utf8_spanish_ci NOT NULL,
  `tipo` text COLLATE utf8_spanish_ci NOT NULL,
  `img` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `banner`
--

INSERT INTO `banner` (`id`, `ruta`, `tipo`, `img`, `estado`, `fecha`) VALUES
(10, 'sin-categoria', 'sin-categoria', 'vistas/img/banner/banner 2.jpg.jpg.jpg', 1, '2020-06-20 06:00:34'),
(13, 'alimentos', 'categorias', 'vistas/img/banner/fondo.jpg.jpg', 1, '2020-06-20 06:05:43'),
(14, 'tropical', 'subcategorias', 'vistas/img/banner/fondo.jpg.jpg', 1, '2020-06-20 06:06:20'),
(15, 'acondicionadores', 'subcategorias', 'vistas/img/banner/acondicionadores.jpg', 1, '2020-06-20 06:10:38'),
(16, 'agua-salada', 'subcategorias', 'vistas/img/banner/banner 2.jpg.jpg.jpg.jpg', 1, '2020-06-20 06:11:40'),
(17, 'peces-marinos', 'subcategorias', 'vistas/img/banner/banner 2.jpg.jpg.jpg.jpg', 1, '2020-06-20 06:12:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cabeceras`
--

CREATE TABLE `cabeceras` (
  `id` int(11) NOT NULL,
  `ruta` text COLLATE utf8_spanish_ci NOT NULL,
  `titulo` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `palabrasClaves` text COLLATE utf8_spanish_ci NOT NULL,
  `portada` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cabeceras`
--

INSERT INTO `cabeceras` (`id`, `ruta`, `titulo`, `descripcion`, `palabrasClaves`, `portada`, `fecha`) VALUES
(1, 'inicio', 'Aquaria Depot', 'Tienda online Peruana, para la compra de peces y accesorios en General para Acuarios.', 'Aquaria Depot, acuarismo peruano, accesorios para peces, acuariofilia, compras acuaristicas, peces, ciclidos africanos, peces discos, peces marinos, corales, plantas, plantas acuaticas, peceras, acuarios, aquariadepot, alimento para peces, filtros para acuario, skimmer, perú, swordtail, mollys, ciclidos africanos, frontosas, mariposas, tang, caracoles, acuario, peces, pez, ciclidos africano, tienda de acuario, petshop, acuariofilia, acuaria, aquaria depot, peces marinos, pez, peces, muebles de acuario, motores, compresoras, filtros, alimento para peces, comida para peces, seachem, tropical, sera, minjiang, boyu, sobo, rs electrical\r\n', 'vistas/img/cabeceras/logo.jpg', '2020-06-18 02:34:19'),
(2, 'peces', 'PECES', 'Peces', 'Peces', 'vistas/img/cabeceras/peces.jpg', '2019-11-12 13:54:07'),
(3, 'alimentos', 'ALIMENTOS', 'Alimentos', 'Alimentos', 'vistas/img/cabeceras/alimentos.jpg', '2019-11-12 13:59:59'),
(6, 'accesorios', 'ACCESORIOS', 'ACCESORIOS', 'ACCESORIOS', 'vistas/img/cabeceras/accesorios.jpg', '2019-11-12 16:20:41'),
(8, 'agua-dulce', 'Agua Dulce', 'Peces de Agua Dulce', 'Peces de Agua Dulce', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:30:11'),
(9, 'agua-salada', 'Agua Salada', 'Peces de Agua Salada', 'Peces de Agua Salada', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:29:45'),
(11, 'invertebrados', 'Invertebrados', 'Invertebrados', 'Invertebrados', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:32:42'),
(12, 'nutrafin', 'Nutrafin', 'Nutrafin', 'Nutrafin', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:32:53'),
(13, 'plantas', 'Plantas', 'Plantas', 'Plantas', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:33:13'),
(14, 'corales', 'Corales', 'Corales', 'Corales', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:33:35'),
(15, 'canister', 'Canister', 'Canister', 'Canister', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:34:06'),
(16, 'motores', 'Motores', 'Motores', 'Motores', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:34:30'),
(17, 'sera', 'Sera', 'Sera', 'Sera', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:35:08'),
(18, 'filtros-de-esponja', 'Filtros de esponja', 'Filtros de esponja', 'Filtros de esponja', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:35:10'),
(19, 'compresoras', 'Compresoras', 'Compresoras', 'Compresoras', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:35:43'),
(20, 'tropical', 'Tropical', 'Tropical', 'TROPICAL', 'vistas/img/cabeceras/tropical.jpg', '2020-06-20 05:56:35'),
(21, 'skimmer', 'Skimmer', 'Skimmer', 'Skimmer', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:36:22'),
(22, 'wave-maker', 'Wave Maker', 'Wave Maker', 'Wave Maker', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:36:59'),
(23, 'material-de-filtracion', 'Material de Filtración', 'Material de Filtración', 'Material de Filtración', 'vistas/img/cabeceras/material-de-filtracion.jpg', '2019-11-12 16:56:49'),
(24, 'acondicionadores', 'Acondicionadores', 'Acondicionadores', 'Acondicionadores', 'vistas/img/cabeceras/acondicionadores.jpg', '2020-06-20 05:57:02'),
(26, 'iluminacion', 'Iluminación', 'Iluminación', 'Iluminación', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:42:04'),
(27, 'termostatos', 'Termostatos', 'Termostatos', 'Termostatos', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:42:47'),
(31, 'rocas-para-acuario', 'Rocas para Acuario', 'Rocas para Acuario', 'Rocas para Acuario', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:44:50'),
(32, 'grava-para-acuario', 'Grava para Acuario', 'Grava para Acuario', 'Grava para Acuario', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:45:40'),
(33, 'spectrum', 'Spectrum', 'Spectrum', 'Spectrum', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:46:18'),
(34, 'adornos-para-acuario', 'Adornos para Acuario', 'Adornos para Acuario', 'Adornos para Acuario', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:46:56'),
(35, 'jbl', 'JBL', 'JBL', 'JBL', 'vistas/img/cabeceras/default/default.jpg', '2020-06-19 00:27:25'),
(36, 'acuarios-boyu', 'Acuarios Boyu', 'Acuarios Boyu', 'Boyu', 'vistas/img/cabeceras/default/default.jpg', '2020-01-16 16:56:33'),
(37, 'tapas-para-acuario', 'Tapas para Acuario', 'Tapas para Acuario', 'Tapas para Acuario', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:48:35'),
(38, 'acuarios-nacionales', 'Acuarios Nacionales', 'Acuarios Nacionales', 'Nacionales', 'vistas/img/cabeceras/default/default.jpg', '2020-01-16 16:56:58'),
(39, 'muebles-para-acuario', 'Muebles para Acuario', 'Muebles para Acuario', 'Muebles para Acuario', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:48:58'),
(40, 'test-de-agua', 'Test de Agua', 'Test de Agua', 'Test de Agua', 'vistas/img/cabeceras/default/default.jpg', '2019-10-02 02:50:19'),
(54, 'skimmer-red-starfish-rs-x6', 'Skimmer Red StarFish RS X6', '- Capacidad Litros: 500 - 1000\n- Bomba: HP-2500\n- Potencia de Bomba: 25W\n- Medidas: 23 x 21 x 53', 'skimmer,red star fish', 'vistas/img/cabeceras/skimmer-red-starfish-rs-x6.png', '2019-10-04 03:58:06'),
(55, 'red-starfish-', 'Red StarFish ', '- Capacidad: 400 - 500 L\n- Boma: HP-1500L\n- Potencia de Bomba: 12W, DC 24V\n- Medidas: 19 x 18 x 48.5\n- Toma de Aire: 600 L/H ', 'skimmer', 'vistas/img/cabeceras/red-starfish-.png', '2019-10-04 04:23:52'),
(56, 'red-starfish-', 'Red StarFish ', 'a', 'skimmer', 'vistas/img/cabeceras/red-starfish-.png', '2019-10-04 04:22:16'),
(57, 'skimmer-red-starfish-rs-n130plus', 'Skimmer Red StarFish RS N130Plus', '- Capacidad: 400 - 500 L\n- Boma: HP-1500L\n- Potencia de Bomba: 12W, DC 24V\n- Medidas: 19 x 18 x 48.5\n- Toma de Aire: 600 L/H ', 'skimmer, red starfish', 'vistas/img/cabeceras/skimmer-red-starfish-rs-n130plus.png', '2019-10-04 04:33:25'),
(58, 'skimmer-red-starfish', 'skimmer red Starfish', 'asdfasdfasdfasdfadsfasdfdsa \nadsfasfasdfdsa', 'muebles', 'vistas/img/cabeceras/default/default.jpg', '2019-10-04 16:20:07'),
(60, 'skimmer-red-starfish-rs-x6', 'Skimmer Red StarFish RS X6', '- Capacidad Litro: 500-1000  -Bomba: HP-2500  -Potencia de Bomba: 25W  -Medidas: 23 x 21 x 53  -Toma de Aire: 900 L/H', 'skimmer, filtracion,rs-x6,RS-X6,rs x6,Red StarFish', 'vistas/img/cabeceras/skimmer-red-starfish-rs-x6.png', '2019-10-06 01:52:17'),
(61, 'skimmer-red-starfish-rs-x6', 'Skimmer Red StarFish RS X6', '- Capacidad Litro: 500-1000  -Bomba: HP-2500  -Potencia de Bomba: 25W  -Medidas: 23 x 21 x 53  -Toma de Aire: 900 L/H', 'skimmer, filtracion,rs-x6,RS-X6,rs x6,Red StarFish', 'vistas/img/cabeceras/skimmer-red-starfish-rs-x6.png', '2019-10-06 01:52:20'),
(62, 'skimmer-red-starfish-rs-x6', 'Skimmer Red StarFish RS X6', '- Capacidad Litro: 500-1000  -Bomba: HP-2500  -Potencia de Bomba: 25W  -Medidas: 23 x 21 x 53  -Toma de Aire: 900 L/H', 'skimmer, filtracion,rs-x6,RS-X6,rs x6,Red StarFish', 'vistas/img/cabeceras/skimmer-red-starfish-rs-x6.png', '2019-10-06 01:52:28'),
(63, 'skimmer-red-starfish-rs-x6', 'Skimmer Red StarFish RS X6', 'a', 'Red StarFish', 'vistas/img/cabeceras/skimmer-red-starfish-rs-x6.png', '2019-10-06 02:13:43'),
(64, 'skimmer-red-starfish-rs-x61', 'Skimmer Red StarFish RS X61', '-Capacidad Litros: 500-1000L -Bomba: HP-2500 -Potencia de bomba: 25W -Medidas: 23 x 21 x 53 -Toma de Aire: 900 L/H', 'Skimmer', 'vistas/img/cabeceras/skimmer-red-starfish-rs-x61.png', '2019-10-06 02:27:41'),
(65, 'skimmer-red-starfish-rs-x6', 'Skimmer Red StarFish RS X6', 'a', 'Skimmer', 'vistas/img/cabeceras/default/default.jpg', '2019-10-06 03:39:48'),
(71, 'skimmer-red-starfish-sd-300', 'Skimmer Red StarFish SD 300', '-Capacidad Litros: 10.000L -Medidas: 59 x 49 x 95 -Toma de Aire: 2800 L/Hx2', 'Skimmer', 'vistas/img/cabeceras/skimmer-red-starfish-sd-300.jpg', '2019-10-06 04:56:51'),
(81, 'prodac', 'Prodac', 'Prodac', 'Prodac', 'vistas/img/cabeceras/default/default.jpg', '2019-10-10 23:02:38'),
(87, 'skimmer-red-starfish-rs-x6', 'Skimmer Red StarFish RS X6', '-Capacidad Litros: 500-1000 -Bomba: HP-2500 -Potencia de Bomba: 25W -Medidas: 23x21x53 -Toma de Aire: 900 L/H', 'Skimmer,Red starfish,rs x6', 'vistas/img/cabeceras/skimmer-red-starfish-rs-x6.jpg', '2019-10-11 03:23:02'),
(98, 'bombas-de-agua', 'Bombas de Agua', 'Bombas de Agua', 'Bombas de Agua', 'vistas/img/cabeceras/bombas-de-agua.jpg', '2019-11-12 16:54:37'),
(99, 'luces-uv', 'Luces UV', 'Luces UV', 'Luces UV', 'vistas/img/cabeceras/luces-uv.jpg', '2019-11-12 16:51:50'),
(106, 'filtros-sumergibles', 'Filtros Sumergibles', 'Filtros Sumergibles', 'Filtros Sumergibles', 'vistas/img/cabeceras/filtros-sumergibles.jpg', '2019-11-12 16:47:35'),
(107, 'sal-marina', 'Sal Marina', 'Sal Marina', 'Sal Marina', 'vistas/img/cabeceras/sal-marina.jpg', '2019-11-12 16:47:14'),
(112, 'skimmer-red-starfish-pr-100', 'Skimmer Red StarFish PR 100', 'Reduce los productos de desechos químicos físicos y solubles para mantener la pecera saludable', 'Skimmer,Red starFish,Filtracion para pecera,600L', 'vistas/img/cabeceras/skimmer-red-starfish-pr-100.jpg', '2019-10-18 02:39:21'),
(113, 'skimmer-red-starfish-pr-150', 'Skimmer Red StarFish PR 150', 'Reduce los productos de desechos químicos físicos y solubles para mantener la pecera saludable', 'Skimmer,Red StarFish,1500L,Filtracion', 'vistas/img/cabeceras/skimmer-red-starfish-pr-150.jpg', '2019-10-18 02:37:38'),
(114, 'skimmer-red-starfish-rs-n230-plus', 'Skimmer Red StarFish RS N230 Plus', 'Skimmer de con corriente continua RS-N230, Bajo voltaje, seguro y silencioso. Para eliminar los desechos proteicos del acuario y los desechos orgánicos. Desmontar completamente el cuerpo, fácil de limpiar.', 'Red StarFish,RS N230,Filtracion,Skimmer', 'vistas/img/cabeceras/skimmer-red-starfish-rs-n230-plus.jpg', '2019-10-18 03:19:30'),
(115, 'skimmer-red-starfish-rs-n170-plus', 'Skimmer Red StarFish RS N170 Plus', '\nSkimmer de con corriente continua RS-N170, Bajo voltaje, seguro y silencioso. Para eliminar los desechos proteicos del acuario y los desechos orgánicos. Desmontar completamente el cuerpo, fácil de limpiar.', 'Skimmer,Red StarFish,RS N170,Filtracion', 'vistas/img/cabeceras/skimmer-red-starfish-rs-n170-plus.jpg', '2019-10-18 03:46:37'),
(117, 'skimmer-red-starfish-rs-n170-plus', 'SKIMMER RED STARFISH RS N170 PLUS', 'Skimmer de corriente continua RS-N170 Plus, Bajo voltaje, seguro y silencioso. Para eliminar los desechos proteicos del acuario y los desechos orgánicos. Desmontar completamente el cuerpo, fácil de limpiar.', 'RS N170 plus,red starfish,skimmer', 'vistas/img/cabeceras/skimmer-red-starfish-rs-n170-plus.png', '2019-11-05 00:19:14'),
(118, 'skimmer-red-starfish-rs-x6', 'SKIMMER RED STARFISH RS X6', 'SKIMMER RED STARFISH RS X6', 'RED STARFISH,SKIMMER RS X6,RS X6', 'vistas/img/cabeceras/skimmer-red-starfish-rs-x6.jpg', '2019-11-05 03:07:56'),
(119, 'skimmer-red-starfish-rs-x6', 'SKIMMER RED STARFISH RS X6', 'Skimmer Red StarFish', 'skimmer, red starfish,rs x6,skimmer rs x6', 'vistas/img/cabeceras/skimmer-red-starfish-rs-x6.jpg', '2019-11-05 17:36:21'),
(120, 'skimmer-red-starfish-rs-x6', 'SKIMMER RED STARFISH RS X6', 'SKIMMER RED STARFISH RS X6', 'skimmer,red starfish rs x6,rs x6', 'vistas/img/cabeceras/skimmer-red-starfish-rs-x6.jpg', '2019-11-05 17:43:31'),
(127, 'videos', 'videos', 'Videos', 'otros,accesorios para acuario,otros accesorios', 'vistas/img/cabeceras/otros.jpg', '2020-01-16 16:57:36'),
(135, 'peces-marinos', 'Peces Marinos', 'Peces Marinos', 'Peces Marinos,videos Peces Marinos,videos', 'vistas/img/cabeceras/default/default.jpg', '2020-01-16 17:03:39'),
(137, 'aaaaaaa', 'aaaaaaa', 'asdasd', 'videos', 'vistas/img/cabeceras/default/default.jpg', '2020-01-17 14:24:48'),
(138, 'cccc', 'cccc', 'ccc', 'video,videos', 'vistas/img/cabeceras/default/default.jpg', '2020-01-17 17:42:12'),
(139, 'skimmer-red-starfish-rs-n170-plus', 'Skimmer Red StarFish RS N170 Plus', 'a', 'skimmer,red starfish,filtracion,RS N170', 'vistas/img/cabeceras/default/default.jpg', '2020-02-04 16:36:38'),
(140, 'skimmer-red-starfish-rs-n170', 'Skimmer Red StarFish RS N170', 'Skimmer de corriente continua RS-N170, Bajo voltaje, seguro y silencioso. Para eliminar los desechos proteicos del acuario y los desechos orgánicos. Desmontar completamente el cuerpo, fácil de limpiar.', 'skimmer, red starfish,rs,r170,filtracion', 'vistas/img/cabeceras/skimmer-red-starfish-rs-n170.png', '2020-02-04 16:58:25'),
(142, 'acuarios-y-filtracion', 'Acuarios y Filtración', 'Acuarios y Filtración', 'filtracion,acuarios,filtros', 'vistas/img/cabeceras/default/default.jpg', '2020-02-19 17:51:22'),
(144, '10-peces-marinos-para-principiantes', '10 peces marinos para principiantes', 'Aquí les dejo una lista de 10 peces marinos para principiantes ', 'peces marinos,marinos para principiante,nuevos peces marinos,acuario marino,marino', 'vistas/img/cabeceras/10-peces-marinos-para-principiantes.jpg', '2020-06-15 21:58:37'),
(155, 'pez-marino-foxface', 'Pez Marino FoxFace', 'El Siganus vulpinus es el pez conejo más habitual en el comercio y destaca morfológicamente por presentar un arco chocolate oscuro que recorre desde la base de su primera espina dorsal hasta la barbilla y una zona blanca ancha detrás de la barrera ocular.', 'foxface,pez marino,siganus vulpinus,fox face,marino', 'vistas/img/cabeceras/pez-marino-foxface.jpg', '2020-06-15 21:58:08'),
(156, 'pez-marino-blue-tang', 'Pez Marino Blue Tang', 'Especie compatible con otros peces marinos, siempre que se disponga de suficiente espacio para evitar agresiones por territorialidad, si se mantienen ejemplares de la misma especie o mismo género, es necesario una convivencia desde joven para que estén adaptados y acostumbrados a la vida en comunidad.', 'blue tang,peces marinos,marino', 'vistas/img/cabeceras/pez-marino-blue-tang.jpg', '2020-06-15 21:57:20'),
(158, 'pez-marino-naso-elegans', 'pez marino naso elegans', 'Aqui les dejo este video tutorial del pez cirujano naso Rubio conosido cientificamente como naso elegant.', 'naso elegant,naso blonde,naso,pez marino,marino', 'vistas/img/cabeceras/pez-marino-naso-elegans.jpg', '2020-06-15 21:56:49'),
(159, 'pez-marino-power-blue-acanthurus-leucosternon', 'Pez marino power blue Acanthurus leucosternon', 'Su coloración base es el azul brillante con la aleta dorsal y el nacimiento de la caudal de color amarillo. Las aletas ventrales y anal son blancas al igual que la caudal en donde es visible un ribete de color negro. ', 'power blue,Acanthurus leucosternon', 'vistas/img/cabeceras/pez-marino-power-blue-acanthurus-leucosternon.jpg', '2020-02-25 18:09:44'),
(161, 'pez-marino-power-blue', 'Pez marino power blue', 'Tiene una forma oval con cuerpo muy colorido y marcas audaces. Es muy apreciado por sus colores vivos y marcas con varios tonos diferentes de azul con detalles de color amarillo y blanco. Un color brillante amarillo destaca las aletas dorsales y pectorales, y las marcas de color negro azulado llamativas.', 'pez marino,powder blue,marino,l', 'vistas/img/cabeceras/pez-marino-power-blue.jpg', '2020-06-15 21:56:06'),
(162, 'copperband-butterfly', 'Copperband Butterfly', 'El pez mariposa de nariz alargada (Chelmon rostratus ) es un pez marino, de la familia Chaetodontidae. Es uno de los peces marinos más populares y solicitados en acuariofilia marina. Su población salvaje es abundante, siendo una especie común y estable.', 'pez marino,chelmon rostratus,copperband,chelmon,marino', 'vistas/img/cabeceras/copperband-butterfly.jpg', '2020-06-20 03:19:40'),
(163, 'pez-mandarin', 'Pez Mandarin', 'Conocido comúnmente como pez mandarín o pez dragón puede ser encontrado bajo distintos seudónimos en la bibliografía especializada: Callionymus splendidus, Neosynchiropus splendidus o Pterosynchiropus splendidus.', 'pez mandarin,gobio,pez marino,marino', 'vistas/img/cabeceras/pez-mandarin.jpg', '2020-06-15 21:54:38'),
(164, 'angel-bicolor', 'Angel Bicolor', 'Aunque no se trata de una de las especies del género Centropyge más pequeñas, El Centropyge bicolor tiene ganado un puesto de honor entre aquellas más atractivas que se pueden contemplar en un acuario marino doméstico. ', 'pez marino,angel bicolor', 'vistas/img/cabeceras/angel-bicolor.jpg', '2020-05-13 00:55:59'),
(165, 'purple-tang', 'Purple Tang', 'El Zebrasoma xanthurum o cirujano púrpura, como se denomina comúnmente, pertenece a la familia Acanthuridae incluida en el orden de los Perciformes.  La característica distintiva de esta familia es una pareja de espinas, una a cada lado de la cola, muy peligrosas que eriza como defensa a su voluntad.', 'pez marino,purple tang', 'vistas/img/cabeceras/purple-tang.jpg', '2020-05-13 01:03:21'),
(166, 'filtro-de-esponja-grande-sobo', 'FILTRO DE ESPONJA GRANDE SOBO', 'El filtro de esponja de acuario proporciona el agua con oxígeno muy necesario, proporciona filtración biológica y calidad de agua estable.', 'filtración,filtracion,filtro,filtro esponja,filtro de esponja', 'vistas/img/cabeceras/filtro-de-esponja-grande-sobo.jpg', '2020-06-15 23:30:41'),
(167, 'filtro-aereo-venus-aqua-600t', 'FILTRO AEREO VENUS AQUA 600T', 'Filtros aéreos con gran capacidad para material filtrante en sus distintas presentaciones de la marca VENUSAQUA', 'filtracion,filtración,filtro,filtros,filtro aereo', 'vistas/img/cabeceras/filtro-aereo-venus-aqua-600t.jpg', '2020-06-16 00:04:46'),
(168, 'filtro-interno-venus-aqua', 'FILTRO INTERNO VENUS AQUA', 'Este filtro interno para acuarios está diseñado para uso sumergible y se puede usar en el acuario Fresh Tank. El filtro viene completo con accesorios de boquilla de aireación venturi incluidos que se pueden usar por separado con ambas salidas que tienen la característica de agregar más aireación a su pecera. ', 'filtracion,filtración,filtro,filtro interno,filtro sumergible,aqua venus,aquavenus', 'vistas/img/cabeceras/filtro-interno-venus-aqua.jpg', '2020-06-16 01:19:24'),
(170, 'seachem-matrix-500-ml', 'SEACHEM MATRIX 500 ML', 'Matrix es una biomedia de alta porosidad que proporciona una biofiltración eficiente para la eliminación de residuos nitrogenados. Matrix es un sólido inorgánico poroso de aproximadamente 10 mm de diámetro. ', 'seachem,matrix,filtración,filtracion', 'vistas/img/cabeceras/seachem-matrix-500-ml.jpg', '2020-06-16 01:59:32'),
(171, 'canutillos-ceramicos-minjiang-1000-ml', 'CANUTILLOS CERAMICOS MINJIANG 1000 ML', 'La función de lo canutillos para acuario es la de albergar bacterias beneficiosas, capaces de transformar las sustancias químicas perjudiciales del acuario (producto de la actividad metabólica de peces y plantas, o restos de comida) en compuestos inocuos y no tóxicos para la vida del acuario.', 'filtracion,filtración,material filtrante,ceramicos,canutillos,minjiang', 'vistas/img/cabeceras/canutillos-ceramicos-minjiang-1000-ml.jpg', '2020-06-16 02:19:49'),
(172, 'carbon-activado-minjiang-1000-ml', 'CARBON ACTIVADO MINJIANG 1000 ML', 'Las características del carbón hacen que sirva como una esponja natural, absorbiendo varios químicos (entre otros, restos de metales pesados, fosfatos, nitrato, restos de medicamentos o toxinas) y aislándolos sin peligro hasta que retiramos el carbón y lo reemplazamos.', 'filtracion,carbon,carbon activado,minjiang', 'vistas/img/cabeceras/carbon-activado-minjiang-1000-ml.jpg', '2020-06-16 02:42:07'),
(173, 'filtro-interno-rs-electrical-rs332f', 'FILTRO INTERNO RS ELECTRICAL RS332F', 'La filtración es el corazón de un acuario. La vida acuática (o los peces) necesita agua limpia para mantenerse, por lo que la filtración de calidad es esencial e importante para tener un buen acuario. La filtración puede ser biológica, mecánica y química.', 'filtracion,fitro,rs electrical,filtro interno', 'vistas/img/cabeceras/filtro-interno-rs-electrical-rs332f.jpg', '2020-06-16 03:15:24'),
(174, 'filtro-interno-rs-electrical-rs628b', 'FILTRO INTERNO RS ELECTRICAL RS628B', 'Filtro interno, para acuario. Incluye material filtrante (esponja y carbón activado). Bomba de 900L/h. Potencia de 12w.', 'filtracion,filtro,rs electrical,filtro sumergible,filtro interno', 'vistas/img/cabeceras/filtro-interno-rs-electrical-rs628b.jpg', '2020-06-16 04:17:00'),
(175, 'filtro-interno-rs-electrical-rs6001fa', 'FILTRO INTERNO RS ELECTRICAL RS6001FA', 'Filtro interno, para acuario. Incluye material filtrante. Bomba de 2000L/h. Altura máxima de 1,5m. Potencia de 32w.', 'filtracion,filtro,rs electrical,filtro sumergible,filtro interno', 'vistas/img/cabeceras/filtro-interno-rs-electrical-rs6001fa.jpg', '2020-06-16 04:47:01'),
(176, 'filtro-interno-sobo-fc1001', 'FILTRO INTERNO SOBO FC1001', 'Este filtro Sobo FC -1001 es adecuado principalmente para tanques de agua de 50/60 litros. Súper silencioso y energéticamente eficiente, fácil de limpiar. F.Max: 800L / H.', 'filtracion,filtro,sobo,filtro interno,filtro sumergible', 'vistas/img/cabeceras/filtro-interno-sobo-fc1001.jpg', '2020-06-16 05:09:33'),
(177, 'bomba-de-aire-sobo-sb666a', 'BOMBA DE AIRE SOBO SB666A', 'SOBO SB-666A  con 2 bocas de salida.', 'sobo,bomba de aire,filtro,filtracion,aireador,bomba', 'vistas/img/cabeceras/bomba-de-aire-sobo-sb666a.jpg', '2020-06-16 05:31:17'),
(178, 'mallas', 'Mallas', 'mallas', 'mallas,red,redes,malla', 'vistas/img/cabeceras/default/default.jpg', '2020-06-16 05:35:08'),
(179, 'otros', 'Otros', 'otros', 'otros', 'vistas/img/cabeceras/default/default.jpg', '2020-06-16 05:35:25'),
(180, 'mayas-boyu-fn-8', 'MAYAS BOYU FN 8', 'Red para captura de peces de 8 pulgadas.', 'red,redes,malla,mallas,boyu', 'vistas/img/cabeceras/mayas-boyu-fn-8.jpg', '2020-06-16 05:51:19'),
(181, 'mayas-boyu-fn-12', 'MAYAS BOYU FN 12', 'Red para captura de peces de 12 pulgadas.', 'red,redes,malla', 'vistas/img/cabeceras/mayas-boyu-fn-12.jpg', '2020-06-16 05:51:13'),
(182, 'maternidad-boyu-nb3201', 'MATERNIDAD BOYU NB3201', 'Maternidad para crías de peces. puede aislar a los peces tropicales de manera efectiva, Separa de manera segura a las crías recién nacidas de la madre y otros peces o peces aislados lesionados o agresivos .', 'malla, maternidad para crias,parideras,boyu', 'vistas/img/cabeceras/maternidad-boyu-nb3201.jpg', '2020-06-16 06:03:01'),
(184, 'seachem-stability-250-ml', 'SEACHEM STABILITY 250 ML', 'Stability establecerá de forma rápida y segura el biofiltro del acuario en sistemas marinos y de agua dulce, evitando así la causa número 1 de muerte de peces: el \"síndrome del tanque nuevo\". Stability está formulado específicamente para el acuario y contiene una mezcla sinérgica de bacterias aeróbicas y anaeróbicas.', 'SEACHEM,ESTABILITY,STABILITY,BACTERIAS', 'vistas/img/cabeceras/seachem-stability-250-ml.jpg', '2020-06-16 18:00:34'),
(185, 'seachem-stability-250-ml', 'SEACHEM STABILITY 250 ML', 'Stability está formulado específicamente para el acuario y contiene una mezcla sinérgica de bacterias aeróbicas, anaeróbicas y facultativas que facilitan la descomposición de desechos orgánicos, amoníaco, nitrito y nitrato.', 'SEACHEM,STABILITY,ACONDICIONADORES,BACTERIAS', 'vistas/img/cabeceras/seachem-stability-250-ml.jpg', '2020-06-16 18:09:03'),
(186, 'seachem-stability-250-ml', 'SEACHEM STABILITY 250 ML', 'Stability está formulado específicamente para el acuario y contiene una mezcla sinérgica de bacterias aeróbicas, anaeróbicas y facultativas que facilitan la descomposición de desechos orgánicos, amoníaco, nitrito y nitrato.', 'seachem,acondicionadores,bacterias,stability', 'vistas/img/cabeceras/seachem-stability-250-ml.jpg', '2020-06-16 18:11:45'),
(187, 'seachem-stability-250-ml', 'SEACHEM STABILITY 250 ML', 'AAAAAAAAAAAAAAAAA', 'seachem,filtracion,acondicionaro,bacterias,stability', 'vistas/img/cabeceras/seachem-stability-250-ml.jpg', '2020-06-16 18:15:50'),
(188, 'seachem-stability-250-ml', 'SEACHEM STABILITY 250 ML', 'Stability esta formulado específicamente para el acuario y contiene una mezcla sinérgica de bacterias aeróbicas, anaeróbicas y facultativas que facilitan la descomposición de desechos orgánicos, amoníaco, nitrito y nitrato.', 'stability', 'vistas/img/cabeceras/seachem-stability-250-ml.jpg', '2020-06-16 18:26:21'),
(189, 'seachem-prime-250-ml', 'SEACHEM PRIME 250 ML', 'Casi todas las compañías de mascotas acuáticas fabrican un producto que elimina el cloro. Sin embargo, ninguno de ellos puede compararse en calidad, concentración o efectividad con el producto estrella de Seachem: Prime. Prime es el acondicionador completo y concentrado tanto para agua dulce como salada.', 'SEACHEM,PRIME,ACONDICIONADOR', 'vistas/img/cabeceras/seachem-prime-250-ml.jpg', '2020-06-16 18:41:01'),
(190, 'seachem-stability-250-ml', 'SEACHEM STABILITY 250 ML', 'Stability está formulado específicamente para el acuario y contiene una mezcla sinérgica de bacterias aeróbicas, anaeróbicas y facultativas que facilitan la descomposición de desechos orgánicos, amoníaco, nitrito y nitrato.', 'stability,seachem,bacterias', 'vistas/img/cabeceras/seachem-stability-250-ml.jpg', '2020-06-16 18:43:31'),
(191, 'vitaminas', 'Vitaminas', 'vitaminas', 'vitaminas', 'vistas/img/cabeceras/vitaminas.jpg', '2020-06-20 06:07:37'),
(192, 'seachem-garlic-guard-250-ml', 'SEACHEM GARLIC GUARD 250 ML', 'GarlicGuard es un potenciador de olores y sabores con olor a ajo totalmente natural para peces de agua dulce y salada. Nuestra investigación ha demostrado que muchos peces se sienten atraídos por los olores naturales, como el ajo. Simplemente mezcle GarlicGuard con cualquier alimento.', 'ajo,seachem,garlic,vitaminas', 'vistas/img/cabeceras/seachem-garlic-guard-250-ml.jpg', '2020-06-16 19:30:05'),
(193, 'seachem-clarity-250-ml', 'SEACHEM CLARITY 250 ML', 'Clarity contiene agentes precipitantes y floculantes en la misma botella, lo que permite eliminar todos los tipos de turbidez en una sola dosis.', 'SEACHEM,CLARITY,ACONDICIONADORES,ACONDICIONADOR', 'vistas/img/cabeceras/seachem-clarity-250-ml.jpg', '2020-06-16 23:07:42'),
(194, 'seachem-de-nitrate-500-ml', 'SEACHEM DE NITRATE 500 ML', 'denitrate  es un material económico, natural y poroso con una distribución de poros y geometría que promueve tanto la nitrificación aeróbica dentro de los primeros milímetros de profundidad como la desnitrificación anaeróbica en el núcleo.', 'SEACHEM,DENITRATE,FILTRACION', 'vistas/img/cabeceras/seachem-de-nitrate-500-ml.jpg', '2020-06-16 23:27:14'),
(195, 'seachem-stability-250-ml', 'SEACHEM STABILITY 250 ML', 'Stability establecerá de forma rápida y segura el biofiltro del acuario en sistemas marinos y de agua dulce, evitando así la causa número 1 de muerte de peces: el síndrome del tanque nuevo.', 'SEACHEM,STABILITY,ACONDICIONADOR,BACTERIAS', 'vistas/img/cabeceras/seachem-stability-250-ml.jpg', '2020-06-16 23:37:50'),
(196, 'seachem-flourish-250-ml', 'SEACHEM FLOURISH 250 ML', 'Flourish es un suplemento integral de plantas para el acuario natural de agua dulce. Contiene una rica variedad de micro elementos importantes, oligoelementos y otros nutrientes. Estos incluyen calcio, magnesio, hierro y otros elementos importantes que han demostrado ser beneficiosos para las plantas acuáticas.', 'PLANTAS,SEACHEM,ABONO,ABONOS,FLOURISH', 'vistas/img/cabeceras/seachem-flourish-250-ml.jpg', '2020-06-16 23:47:54'),
(197, 'filtro-interno-minjiang-bl2001f', 'FILTRO INTERNO MINJIANG BL2001F', 'Filtro Interno Minjiang de 1400 litros por hora, 20 watts de consumo.', 'MINJIANG,FILTRACION,FILTRO,RECIRCULADOR', 'vistas/img/cabeceras/filtro-interno-minjiang-bl2001f.jpg', '2020-06-17 00:09:39'),
(198, 'sera-pond-flake-1000-ml', 'SERA POND FLAKE 1000 ML', 'sera Pond Flakes es el alimento principal que se compone de escamas cuidadosamente elaboradas, para todos los peces pequeños del estanque, como las carpas doradas y los ródeos (Rhodeus amarus), así como para los peces jóvenes.', 'SERA,SERA POND FLAKE,COMIDA,ALIMENTO,ALIMENTOS,ALIMENTO PARA PECES,COMIDA PARA PECES,ESCAMAS', 'vistas/img/cabeceras/sera-pond-flake-1000-ml.jpg', '2020-06-17 00:30:10'),
(199, 'sera-cichlid-stick-1000-ml', 'SERA CICHLID STICK 1000 ML', 'Sera Cichlids Sticks es el alimento principal en forma de sticks elaborados manteniendo todas sus propiedades, sin colorantes ni conservantes, para cíclidos omnívoros grandes, entre los que se cuentan muchas especies sudamericanas, y otros peces grandes.', 'sera,cichlid stick,alimento,alimentos,comida,comidas', 'vistas/img/cabeceras/sera-cichlid-stick-1000-ml.jpg', '2020-06-17 00:45:18'),
(200, 'sera-granugreen-250-ml', 'SERA GRANUGREEN 250 ML', 'Sera Granugreen Nature es el alimento principal en forma de granulado elaborado manteniendo todas sus propiedades, sin colorantes ni conservantes, para cíclidos pequeños principalmente herbívoros y comedores de algas. Entre ellos se cuentan muchos de los cíclidos de África oriental.', 'SERA,CICLIDOS,GRANUGREEN,ALIMENTO,ALIMENTOS,COMIDA,COMIDAS', 'vistas/img/cabeceras/sera-granugreen-250-ml.jpg', '2020-06-17 00:52:50'),
(201, 'sera-granured-250-ml', 'SERA GRANURED 250 ML', 'sera Granured Nature es el alimento principal en forma de granulado elaborado manteniendo todas sus propiedades, sin colorantes ni conservantes, para cíclidos pequeños principalmente carnívoros y omnívoros.', 'SERA,GRANURED,CICLIDOS,ALIMENTO,ALIMENTOS,COMIDA,COMIDAS', 'vistas/img/cabeceras/sera-granured-250-ml.jpg', '2020-06-17 01:06:45'),
(202, 'sera-gourmet-nori-5-gr', 'SERA GOURMET NORI 5 GR', 'Sera marin Gourmet Nori es la golosina que se compone de un 100% de algas Nori cuidadosamente secadas, para animales del acuario, como peces comedores de algas, crustáceos y erizos de mar.', 'SERA,NORI,MARINOS,ALGA NORI,GOURMET NORI', 'vistas/img/cabeceras/sera-gourmet-nori-5-gr.jpg', '2020-06-17 01:17:46'),
(203, 'sera-fishtamin-15-ml', 'SERA FISHTAMIN 15 ML', 'sera Fishtamin es el alimento complementario que se compone de un concentrado multivitamínico emulsionado, cuidadosamente elaborado, para todos los peces en el agua dulce y salada.', 'SERA,VITAMINAS,FISHTAMIN,PECES,ALIMENTO,ALIMENTOS,COMIDA,COMIDAS', 'vistas/img/cabeceras/sera-fishtamin-15-ml.jpg', '2020-06-17 01:28:09'),
(204, 'sera-vipan-1000-ml', 'SERA VIPAN 1000 ML', 'sera Vipan Nature es el alimento principal que se compone de escamas flotantes, sin colorantes ni conservantes, para todos los peces ornamentales que se alimentan en la superficie.', 'SERA,VIPAN,COMIDA,COMIDAS,ALIMENTO,ALIMENTOS,PECES', 'vistas/img/cabeceras/sera-vipan-1000-ml.jpg', '2020-06-17 01:41:41'),
(206, 'tropical-ichtio-vit-1000ml', 'TROPICAL ICHTIO VIT 1000ML', 'ICHTIO-VIT alimento de escamas básico y multicomplemental Un alimento completo en forma de escamas, obtenido de seleccionados complementos vegetales y animales de la cualidad más alta.', 'TROPICAL,ALIMENTO,ALIMENTOS,COMIDA,COMIDAS,ICHTIO,ICHTIO-VIT', 'vistas/img/cabeceras/tropical-ichtio-vit-1000ml.jpg', '2020-06-17 21:47:42'),
(207, 'tropical-supervit-1000-ml', 'TROPICAL SUPERVIT 1000 ML', 'SUPERVIT un alimento de escamas multicomplemental y básico con beta glucano. Un alimento básico completo en forma de escamas, destinado para la alimentación diaria de los peces omnívoros de acuarios.', 'TROPICAL,SUPERVIT,ALIMENTO,ALIMENTOS,COMIDA,COMIDAS,PECES,PEZ,CICLIDOS,ACUARIOFILIA', 'vistas/img/cabeceras/tropical-supervit-1000-ml.jpg', '2020-06-17 22:01:51'),
(208, 'tropical-spirulina-flakes-1000-ml', 'TROPICAL SPIRULINA FLAKES 1000 ML', 'SPIRULINA FLAKES Un alimento vegetal de escamas con complemento de algas Spirulina platensis. Un alimento vegetal en forma de escamas con complemento de algas Spirulina platensis (6%). Destinado para la alimentación diaria de los peces herbívoros y omnívoros de acuarios con agua dulce y salada.', 'TROPICAL,ESPIRULINA,SPIRULINA FLAKES,ESCAMAS,ALIMENTO,COMIDA,PECES,PEZ,CICLIDO,CILIDOS,CICLIDOS AFRICANO,CICLIDOS AFRICANOS', 'vistas/img/cabeceras/tropical-spirulina-flakes-1000-ml.jpg', '2020-06-18 23:59:03'),
(209, 'tropical-vitality-color-1000-ml', 'TROPICAL VITALITY COLOR 1000 ML', 'VITALITY & COLOR Un alimento de proteínas en forma de escamas con efecto de activación de color y vitalizante, destinado para la alimentación diaria de los peces carnívoros y omnívoros. ', 'TROPICAL,VITALITY,COLOR,PECES,PEZ,COMIDA,COMIDAS,COMIDA PARA PECES,ALIMENTO,ALIMENTOS', 'vistas/img/cabeceras/tropical-vitality-color-1000-ml.jpg', '2020-06-17 22:35:29'),
(210, 'tropical-spirulina-granulat-1000-ml', 'TROPICAL SPIRULINA GRANULAT 1000 ML', 'SPIRULINA GRANULAT es un alimento completo en forma de granulado que se hunde lentamente con spirulina (6%) para la alimentación diaria de peces herbívoros y omnívoros de acuarios de agua dulce y salada.', 'TROPICAL,SPIRULINA,ESPIRULINA,GRANULAT,CICLIDOS,PECES,PEZ,ALIMENTO,COMIDA,CICLIDOS AFRICANOS,CICLIDO', 'vistas/img/cabeceras/tropical-spirulina-granulat-1000-ml.jpg', '2020-06-18 23:58:14'),
(211, 'tropical-super-goldifish-mini-sticks-250-ml', 'TROPICAL SUPER GOLDIFISH MINI STICKS 250 ML', 'SUPER GOLDFISH MINI STICKS un alimento básico para peces cabeza de león y otros peces dorados japoneses. Un alimento de porción completa en forma de sticks que hunden destinado para peces dorados de cabeza de león y otras formas japonesas.', 'TROPICAL,GOLDFISH,ALIMENTO,COMIDA,TROPICAL GOLDFISH SUPER MINI', 'vistas/img/cabeceras/tropical-super-goldifish-mini-sticks-250-ml.jpg', '2020-06-17 23:28:22'),
(212, 'tropical-goldfish-colour-pellet-1000-ml', 'TROPICAL GOLDFISH COLOUR PELLET 1000 ML', 'GOLDFISH COLOUR PELLET un alimento básico granulado, resaltador del color, con beta glucano para carpas doradas. Un alimento básico en finos gránulos flotantes, resaltador del color para todas especies de carpas doradas y carpas koi jóvenes que habitan los acuarios y los estanques.', 'TROPICAL,ALIMENTO,COMIDA,COMIDAS,GOLDFISH,GOLDFISH COLOUR PELLETS', 'vistas/img/cabeceras/tropical-goldfish-colour-pellet-1000-ml.jpg', '2020-06-17 23:39:09'),
(213, 'tropical-marine-power-garlic-1000-ml', 'TROPICAL Marine Power Garlic 1000 ml', 'Alimento en forma de granulado que se hunde con alto contenido de ajo (30%).  el ajo contribuye al buen funcionamiento del sistema digestivo y refuerza la inmunidad natural de los peces', 'TROPICAL,AJO,MARINOS,PECES MARINOS,MARINE POWER GARLIC,COMIDA,COMIDAS,ALIMENTO,ALIMENTOS', 'vistas/img/cabeceras/tropical-marine-power-garlic-1000-ml.jpg', '2020-06-18 21:46:18'),
(214, 'tropical-marine-power-krill-1000-ml', 'TROPICAL MARINE POWER KRILL 1000 ML', 'Alimento en forma de granulado que se hunde con alto contenido de krill antártico (40%).  el krill antártico es fuente de proteínas ricas en aminoácidos esenciales y ácidos grados insaturados, incluidos los omega 3, que contribuyen al crecimiento de los peces y su condición general.', 'TROPICAL,PECES MARINOS,MARINE,ALIMENTO,COMIDA,MARINE POWER KRILL,KRILL', 'vistas/img/cabeceras/tropical-marine-power-krill-1000-ml.jpg', '2020-06-18 21:58:05'),
(215, 'tropical-marine-power-spirulina-1000-ml', 'TROPICAL MARINE POWER SPIRULINA 1000 ML', 'Alimento en forma de granulado que se hunde con alto contenido de spirulina (36%). las sustancias contenidas en la spirulina apoyan a la inmunidad natural de los peces y contribuyen a los procesos de digestión y gracias a los carotenoides contenidos en la spirulina el alimento refuerza los colores de los peces.', 'TROPICAL,MARINOS,PECES,PECES MARINOS,COMIDA,ALIMENTO,ESPIRULINA,MARINE ESPIRULINA,MARIN POWER SPIRULINA', 'vistas/img/cabeceras/tropical-marine-power-spirulina-1000-ml.jpg', '2020-06-18 22:15:12'),
(216, '-tropical-discus-gran-d50-plus-1000-ml', ' TROPICAL DISCUS GRAN D50 PLUS 1000 ML', 'Tropical Discus Gran D-50 Plus es un alimento potenciador del color en forma de gránulos hundibles con alto (50%) contenido de proteína para discos jóvenes y adultos y otros peces, particularmente las especies más exigentes. Su característica más destacada es su alto contenido de proteína de gran calidad.', 'TROPICAL,DISCOS,DISCUS,TROPICAL DISCUS D50,ALIMENTO,COMIDA,COMIDA PARA PECES,COMIDA PARA DISCOS', 'vistas/img/cabeceras/-tropical-discus-gran-d50-plus-1000-ml.jpg', '2020-06-18 22:28:08'),
(217, 'tropical-discus-gran-wild-1000-ml', 'TROPICAL DISCUS GRAN WILD 1000 ML', 'DISCUS TROPICAL GRAN WILD es un alimento de múltiples ingredientes en forma de gránulos que se hunden lentamente con la adición de algas, krill y frutas. Destinado a la alimentación diaria de disco salvaje y otras especies exigentes de peces capturados en la naturaleza. ', 'TROPICAL,DISCOS,DISCUS,PECES,ALIMENTO,COMIDA,TROPICAL DISCUS GRAND WILD', 'vistas/img/cabeceras/tropical-discus-gran-wild-1000-ml.jpg', '2020-06-18 22:38:33'),
(218, 'tropical-super-spirulina-forte-1000-ml', 'TROPICAL SUPER SPIRULINA FORTE 1000 ML', 'SUPER SPIRULINA FORTE Alimento vegetal de escamas con un alto (36%) contenido de las algas Spirulina platensis. Destinado para cíclidos africanos alguívoros y otros peces, también marinos, que exigen en su dieta una gran cantidad de componentes vegetales.', 'TROPICAL,MALAWI,ESPIRULINA,SPIRULINA,ESPIRULINA SUPER FORTE,SPIRULINA SUPER FORTE,COMIDA,ALIMENTO', 'vistas/img/cabeceras/tropical-super-spirulina-forte-1000-ml.jpg', '2020-06-18 22:51:07'),
(219, 'tropical--krill-flake-500-ml', 'TROPICAL  KRILL FLAKE 500 ML', 'KRILL FLAKE un alimento resaltador de color con krill para peces caprichosos Alimento multicomplemental resaltador del color con un alto contenido de krill antártico (40%), destinado para la alimentación diaria de peces omnívoros y carnívoros, sobre todo los que son caprichosos y no recogen con gusto alimentos.', 'TROPICAL,KRILL,FLAKE,ESCAMAS,KRILL FLAKES', 'vistas/img/cabeceras/tropical--krill-flake-500-ml.jpg', '2020-06-18 23:23:31'),
(220, 'cichlid-carnivore-small-1000-ml', 'CICHLID CARNIVORE SMALL 1000 ML', 'CICHLID CARNIVORE SMALL PELLET alimento que potencia el color para cíclidos carnívoros jóvenes y pequeños. Alimento altamente proteínico con astaxantín para cíclidos carnívoros jóvenes y pequeños, e.g.: Cyphotilapia afra, Placidochromis electra, Hemichromis bimaculatus, ETC.', 'tropical,carnivor,ciclidos,tanganika,malawi,cichlid carnivor,alimento,comida para peces,comida,ciclidos africanos', 'vistas/img/cabeceras/cichlid-carnivore-small-1000-ml.jpg', '2020-06-18 23:33:15'),
(221, 'tropical-malawi-chips-1000-ml', 'TROPICAL MALAWI CHIPS 1000 ML', 'MALAWI CHIPS Alimento multi-ingrediente para cíclidos mbunas del lago Malawi MALAWI CHIPS es un alimento multicomponente en forma de chips pequeños que se sumergen lentamente, destinado para cíclidos mbunas y otros cíclidos herbívoros. Una fórmula muy variada garantiza que los peces tengan una condición perfecta.', 'TROPICAL,CICLIDOS AFRICANOS,ALIMENTO,COMIDA,COMIDA PARA PECES,MALAWI,MALAWI CHIPS,MALAWI CHIP', 'vistas/img/cabeceras/tropical-malawi-chips-1000-ml.jpg', '2020-06-18 23:42:54'),
(222, 'tropical-tanganyika-chips-1000-ml', 'TROPICAL TANGANYIKA CHIPS 1000 ML', 'TANGANYIKA CHIPS es un alimento completo y especial en forma de chips para los cíclidos más grandes del Lago Tanganika, incluyendo los de las familias Altolamprologus, Julidochromis, Lamprologus, Neolamprologus, Cyprichromis, Paracyprichromis y también para los peces jóvenes del género Cyphotilapia frontosa y otros...', 'TROPICAL,ALIMENTO,COMIDA PARA PECES,COMIDA,TANGANYKA CHIP,TANGANIKA,TANGANYKA', 'vistas/img/cabeceras/tropical-tanganyika-chips-1000-ml.jpg', '2020-06-18 23:53:15'),
(223, 'tropical-carnivore-1000-ml', 'TROPICAL CARNIVORE 1000 ML', 'CARNIVORE un alimento para grandes peces carnívoros. Un alimento de proteínas en gránulos que hunden para peces de fondo Carnivore una propuesta nueva de la marca Tropical para los aficionados de los peces carnívoros. Un alto contenido de proteínas de fácil digestión cubrirá las necesidades tanto de los siluros, co', 'TROPICAL,CARNIVORE,CICLIDOS,CARNIVOROS,PECES,PEZ,RAYAS,OSCAR,ALIMENTO,COMIDA', 'vistas/img/cabeceras/tropical-carnivore-1000-ml.jpg', '2020-06-19 00:07:54'),
(224, 'jbl-goldpearls-1000-ml', 'JBL GoldPearls 1000 ML', 'Alimento completo y crecimiento ideal en carpas doradas y colas de velo: ingredientes selectos para satisfacer las necesidades de todas las variedades de carpas doradas. Nutritivo y fácil de digerir: Las perlas que se hunden son ideales para especies de pez de mín. 8 cm en todas las zonas del agua. ', 'JBL,GOLDFISH,ALIMENTO,COMIDA,COMIDA PARA GOLDFISH,JBL GOLDPEARLS,Goldfish', 'vistas/img/cabeceras/jbl-goldpearls-1000-ml.jpg', '2020-06-24 01:46:53'),
(225, 'jbl-novorift-1000-ml', 'JBL NovoRift 1000 ML', 'Alimento completo y crecimiento ideal en cíclidos comedores de aufwuchs de los lagos Tanganica y Malawi. Nutritivo y fácil de digerir: Condiciones ideales de alimentación para especies de pez de 10 a 25 cm en todas las zonas del agua. Con espirulina rica en proteínas', 'JBL,CICLIDO,CICLIDOS,CICLIDOS AFRICANOS,MALAWI,TANGANIKA,COMIDA,ALIMENTO,COMIDA PARA PECES', 'vistas/img/cabeceras/jbl-novorift-1000-ml.jpg', '2020-06-19 00:40:38'),
(226, 'jbl-agil-1000-ml', 'JBL AGIL 1000 ML', 'Especialmente adaptado a las necesidades alimenticias de las tortugas acuáticas y galápagos: Alimento básico en forma de barras flotantes para tortugas con un tamaño de 10-50 cm. La lisina estimula la formación de los huesos, el complejo multivitamínico y la vitamina C fortalecen y estabilizan el sistema inmunitario.', 'JBL,TORTUGAS,ALIMENTO PARA TORTUAS,COMIDA PARA TORTUGAS,ALIMENTO,COMIDA', 'vistas/img/cabeceras/jbl-agil-1000-ml.jpg', '2020-06-19 00:58:02'),
(227, 'aclimatacion-de-un-pez-nuevo', 'Aclimatación de un Pez Nuevo', 'El proceso de agregar peces a un acuario debe ser progresivo y respetuoso con el animal, para evitar problemas en su adaptación al nuevo hábitat. En el vídeo de esta semana te presento una guía en 5 pasos para aclimatar adecuadamente los nuevos habitantes al entorno.', 'video,aclimatación,aclimatar peces,peces nuevos', 'vistas/img/cabeceras/aclimatacion-de-un-pez-nuevo.jpg', '2020-06-22 04:26:28'),
(228, 'filtracion-del-acuario', 'FILTRACIÓN DEL ACUARIO', 'Seguimos con la serie de video tutoriales sobre acuariofilia, en esta ocasión abordaremos un tema muy importante como es la \"Filtración\" de nuestro acuario. Veremos algunos tipos de filtros y materiales filtrantes mas habituales.', 'filtracion,filtro,filtrado del acuario,video', 'vistas/img/cabeceras/filtracion-del-acuario.jpg', '2020-06-24 02:30:54'),
(229, 'filtracion-del-acuario', 'Filtración del Acuario', 'Los tipos de filtro o componentes del filtro que alojan las bacterias son muy variados, pero todos tienen una característica en común: deben ser muy materiales muy porosos. Por ejemplo, unos canutillos que parezca que están pulidos NO sirven.', 'filtracion,filtro,filtracion de acuario', 'vistas/img/cabeceras/filtracion-del-acuario.jpg', '2020-06-24 03:07:36'),
(230, 'filtro-acuario', 'filtro Acuario', 'Hay tres tipos principales de filtración en los acuarios: filtración biológica, filtración mecánica y filtración química. En muchos de los filtros de acuario se dan al menos dos de los tres tipo conjuntamente. A continuación pasamos a explicar brevemente cada tipo.', 'filtracion,filtro', 'vistas/img/cabeceras/filtro-acuario.jpg', '2020-06-24 03:23:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` text COLLATE utf8_spanish_ci NOT NULL,
  `ruta` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `oferta` int(11) NOT NULL,
  `precioOferta` float NOT NULL,
  `descuentoOferta` int(11) NOT NULL,
  `imgOferta` text COLLATE utf8_spanish_ci NOT NULL,
  `finOferta` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `ruta`, `estado`, `oferta`, `precioOferta`, `descuentoOferta`, `imgOferta`, `finOferta`, `fecha`) VALUES
(7, 'PECES', 'peces', 1, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-01 17:58:14'),
(8, 'ALIMENTOS', 'alimentos', 1, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-01 17:58:29'),
(10, 'FILTRACION', 'filtracion', 1, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 16:33:37'),
(11, 'ACCESORIOS', 'accesorios', 1, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-01 18:00:11'),
(13, 'ACUARIOS', 'acuarios', 1, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:43:32'),
(14, 'VIDEOS', 'videos', 1, 0, 0, 0, '', '0000-00-00 00:00:00', '2020-01-16 16:57:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `calificacion` float NOT NULL,
  `comentario` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `id_usuario`, `id_producto`, `calificacion`, `comentario`, `fecha`) VALUES
(1, 36, 38, 0, '', '2020-01-17 14:55:39'),
(2, 36, 36, 0, '', '2020-01-17 19:21:39'),
(3, 36, 23, 0, '', '2020-01-17 19:33:58'),
(4, 36, 22, 0, '', '2020-01-17 19:37:11'),
(5, 36, 40, 0, '', '2020-01-17 20:00:32'),
(6, 42, 24, 5, '95', '2020-01-29 16:18:40'),
(7, 42, 38, 0, '', '2020-01-29 15:47:44'),
(8, 36, 24, 0, '', '2020-03-03 20:56:51'),
(9, 36, 47, 0, '', '2020-03-03 20:56:51'),
(10, 36, 17, 0, '', '2020-03-04 15:38:01'),
(11, 24, 47, 5, 'Ok', '2020-06-05 03:35:30'),
(12, 24, 57, 0, '', '2020-06-12 00:10:40'),
(13, 24, 58, 0, '', '2020-06-12 00:18:07'),
(14, 24, 47, 0, '', '2020-06-12 00:25:10'),
(15, 24, 39, 0, '', '2020-06-12 00:47:02'),
(16, 24, 46, 0, '', '2020-06-12 00:51:42'),
(17, 24, 48, 0, '', '2020-06-12 01:03:37'),
(18, 24, 38, 0, '', '2020-06-12 01:03:37'),
(19, 24, 40, 0, '', '2020-06-12 01:08:41'),
(20, 24, 18, 0, '', '2020-06-12 02:13:42'),
(21, 24, 20, 0, '', '2020-06-12 02:23:33'),
(22, 24, 59, 0, '', '2020-06-12 03:34:02'),
(23, 24, 39, 0, '', '2020-06-12 03:51:41'),
(24, 24, 38, 0, '', '2020-06-12 03:54:50'),
(25, 24, 8, 0, '', '2020-06-13 08:23:37'),
(26, 24, 10, 0, '', '2020-06-13 08:23:37'),
(27, 24, 101, 0, '', '2020-06-16 03:31:17'),
(28, 37, 111, 0, '', '2020-06-16 06:28:02'),
(29, 24, 132, 0, '', '2020-06-17 20:32:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comercio`
--

CREATE TABLE `comercio` (
  `id` int(11) NOT NULL,
  `impuesto` float NOT NULL,
  `envioNacional` float NOT NULL,
  `envioInternacional` float NOT NULL,
  `tasaMinimaNal` float NOT NULL,
  `tasaMinimaInt` float NOT NULL,
  `pais` text COLLATE utf8_spanish_ci NOT NULL,
  `llavePublicaCulqi` text COLLATE utf8_spanish_ci NOT NULL,
  `llaveSecretaCulqi` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `comercio`
--

INSERT INTO `comercio` (`id`, `impuesto`, `envioNacional`, `envioInternacional`, `tasaMinimaNal`, `tasaMinimaInt`, `pais`, `llavePublicaCulqi`, `llaveSecretaCulqi`) VALUES
(1, 0, 20, 0, 0, 0, 'PE', 'pk_live_dHN7laUuK9QzUltq', 'sk_live_yorEjviEkDQ4LO9G');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `envio` int(11) NOT NULL,
  `email` text COLLATE utf8_spanish_ci NOT NULL,
  `productos` text COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` text COLLATE utf8_spanish_ci NOT NULL,
  `pago` text COLLATE utf8_spanish_ci NOT NULL,
  `pais` text COLLATE utf8_spanish_ci NOT NULL,
  `departamento` text COLLATE utf8_spanish_ci NOT NULL,
  `provincia` text COLLATE utf8_spanish_ci NOT NULL,
  `distrito` text COLLATE utf8_spanish_ci NOT NULL,
  `telefono` text COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deseos`
--

CREATE TABLE `deseos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `deseos`
--

INSERT INTO `deseos` (`id`, `id_usuario`, `id_producto`, `fecha`) VALUES
(1, 53, 98, '2020-07-14 02:36:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramientas`
--

CREATE TABLE `herramientas` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `temperatura` decimal(10,0) NOT NULL,
  `salinidad` decimal(10,0) NOT NULL,
  `ph` int(11) NOT NULL,
  `nitritos` decimal(10,0) NOT NULL,
  `amoniaco` decimal(10,0) NOT NULL,
  `nitratos` decimal(10,0) NOT NULL,
  `fosfatos` decimal(10,0) NOT NULL,
  `calcio` int(11) NOT NULL,
  `magnesio` int(11) NOT NULL,
  `alcalinidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `herramientas`
--

INSERT INTO `herramientas` (`id`, `fecha`, `temperatura`, `salinidad`, `ph`, `nitritos`, `amoniaco`, `nitratos`, `fosfatos`, `calcio`, `magnesio`, `alcalinidad`) VALUES
(1, '2020-03-11', 26, 1024, 7, 0, 0, 5, 0, 456, 1035, 8),
(2, '2020-03-11', 26, 1024, 7, 0, 0, 5, 0, 456, 1035, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `nuevosUsuarios` int(11) NOT NULL,
  `nuevasVentas` int(11) NOT NULL,
  `nuevasVisitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `nuevosUsuarios`, `nuevasVentas`, `nuevasVisitas`) VALUES
(1, 32, 0, 73);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `temperatura` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salinidad` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ph` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no2` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nh3` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no3` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `po4` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ca` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mg` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kh` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id`, `idusuario`, `fecha`, `temperatura`, `salinidad`, `ph`, `no2`, `nh3`, `no3`, `po4`, `ca`, `mg`, `kh`) VALUES
(1, 1, '2020-02-10', '26', '1023', '7', '5', '5', '5', '5', '5', '1350', '9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla`
--

CREATE TABLE `plantilla` (
  `id` int(11) NOT NULL,
  `barraSuperior` text COLLATE utf8_spanish_ci NOT NULL,
  `textoSuperior` text COLLATE utf8_spanish_ci NOT NULL,
  `colorFondo` text COLLATE utf8_spanish_ci NOT NULL,
  `colorTexto` text COLLATE utf8_spanish_ci NOT NULL,
  `logo` text COLLATE utf8_spanish_ci NOT NULL,
  `icono` text COLLATE utf8_spanish_ci NOT NULL,
  `redesSociales` text COLLATE utf8_spanish_ci NOT NULL,
  `apiFacebook` text COLLATE utf8_spanish_ci NOT NULL,
  `pixelFacebook` text COLLATE utf8_spanish_ci NOT NULL,
  `googleAnalytics` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `plantilla`
--

INSERT INTO `plantilla` (`id`, `barraSuperior`, `textoSuperior`, `colorFondo`, `colorTexto`, `logo`, `icono`, `redesSociales`, `apiFacebook`, `pixelFacebook`, `googleAnalytics`, `fecha`) VALUES
(1, '#000000', '#ffffff', '#ff9900', '#ffffff', 'vistas/img/plantilla/logo.png', 'vistas/img/plantilla/icono.png', '[{\"red\":\"fa-facebook\",\"estilo\":\"facebookBlanco\",\"url\":\"https://www.facebook.com/Aquariadepot1\",\"activo\":1},{\"red\":\"fa-youtube\",\"estilo\":\"youtubeBlanco\",\"url\":\"http://youtube.com/\",\"activo\":1},{\"red\":\"fa-instagram\",\"estilo\":\"twitterBlanco\",\"url\":\"https://www.instagram.com/aquariadepot/\",\"activo\":1},{\"red\":\"fa-whatsapp\",\"estilo\":\"google-plusBlanco\",\"url\":\"https://wa.me/51956764214\",\"activo\":1},{\"red\":\"fa-twitter\",\"estilo\":\"instagramBlanco\",\"url\":\"\",\"activo\":0}]', '\n      		\n      		<script>\n  window.fbAsyncInit = function() {\n    FB.init({\n      appId      : \'1668989089899154\',\n      cookie     : true,\n      xfbml      : true,\n      version    : \'v2.10\'\n    });\n      \n    FB.AppEvents.logPageView();   \n      \n  };\n\n  (function(d, s, id){\n     var js, fjs = d.getElementsByTagName(s)[0];\n     if (d.getElementById(id)) {return;}\n     js = d.createElement(s); js.id = id;\n     js.src = \"https://connect.facebook.net/en_US/sdk.js\";\n     fjs.parentNode.insertBefore(js, fjs);\n   }(document, \'script\', \'facebook-jssdk\'));\n</script>\n      		\n      		\n      		', '\n  			<!-- Facebook Pixel Code -->\n<script>\n  !function(f,b,e,v,n,t,s)\n  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?\n  n.callMethod.apply(n,arguments):n.queue.push(arguments)};\n  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\';\n  n.queue=[];t=b.createElement(e);t.async=!0;\n  t.src=v;s=b.getElementsByTagName(e)[0];\n  s.parentNode.insertBefore(t,s)}(window, document,\'script\',\n  \'https://connect.facebook.net/en_US/fbevents.js\');\n  fbq(\'init\', \'536162033839252\');\n  fbq(\'track\', \'PageView\');\n</script>\n<noscript><img height=\"1\" width=\"1\" style=\"display:none\"\n  src=\"https://www.facebook.com/tr?id=536162033839252&ev=PageView&noscript=1\"\n/></noscript>\n<!-- End Facebook Pixel Code -->    \n  			', '<!-- Global site tag (gtag.js) - Google Analytics -->\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=UA-150526183-1\"></script>\n<script>\n  window.dataLayer = window.dataLayer || [];\n  function gtag(){dataLayer.push(arguments);}\n  gtag(\'js\', new Date());\n\n  gtag(\'config\', \'UA-150526183-1\');\n</script>    \n            \n            \n  			      \n  			      \n  			      \n  			', '2020-06-26 00:23:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_subcategoria` int(11) NOT NULL,
  `tipo` text COLLATE utf8_spanish_ci NOT NULL,
  `ruta` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `titulo` text COLLATE utf8_spanish_ci NOT NULL,
  `titular` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `multimedia` text COLLATE utf8_spanish_ci NOT NULL,
  `detalles` text COLLATE utf8_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `portada` text COLLATE utf8_spanish_ci NOT NULL,
  `vistas` int(11) NOT NULL,
  `ventas` int(11) NOT NULL,
  `vistasGratis` int(11) NOT NULL,
  `ventasGratis` int(11) NOT NULL,
  `ofertadoPorCategoria` int(11) NOT NULL,
  `ofertadoPorSubCategoria` int(11) NOT NULL,
  `oferta` int(11) NOT NULL,
  `precioOferta` float NOT NULL,
  `descuentoOferta` int(11) NOT NULL,
  `imgOferta` text COLLATE utf8_spanish_ci NOT NULL,
  `finOferta` datetime NOT NULL,
  `peso` float NOT NULL,
  `entrega` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `id_categoria`, `id_subcategoria`, `tipo`, `ruta`, `estado`, `titulo`, `titular`, `descripcion`, `multimedia`, `detalles`, `precio`, `portada`, `vistas`, `ventas`, `vistasGratis`, `ventasGratis`, `ofertadoPorCategoria`, `ofertadoPorSubCategoria`, `oferta`, `precioOferta`, `descuentoOferta`, `imgOferta`, `finOferta`, `peso`, `entrega`, `fecha`) VALUES
(74, 14, 62, 'virtual', '10-peces-marinos-para-principiantes', 1, '10 peces marinos para principiantes', 'Aquí les dejo una lista de 10 peces marinos para principiantes ...', 'Aquí les dejo una lista de 10 peces marinos para principiantes ', 'Hau3_NouAIc', '{}', 0, 'vistas/img/productos/10-peces-marinos-para-principiantes.png', 0, 0, 35, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '2020-09-02 11:11:41'),
(85, 14, 62, 'virtual', 'pez-marino-foxface', 1, 'Pez Marino FoxFace', 'El Siganus vulpinus es el pez conejo más habitual en el comercio y destaca morfológicamente por presentar un arco chocolate oscuro que recorre desde la base de su primera espina dorsal hasta la barbilla y una zona blanca an...', 'El Siganus vulpinus es el pez conejo más habitual en el comercio y destaca morfológicamente por presentar un arco chocolate oscuro que recorre desde la base de su primera espina dorsal hasta la barbilla y una zona blanca ancha detrás de la barrera ocular.', 'FuTffrXxK-0', '{}', 0, 'vistas/img/productos/pez-marino-foxface.png', 0, 0, 21, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '2020-09-03 01:59:04'),
(86, 14, 62, 'virtual', 'pez-marino-blue-tang', 1, 'Pez Marino Blue Tang', 'Especie compatible con otros peces marinos, siempre que se disponga de suficiente espacio para evitar agresiones por territorialidad, si se mantienen ejemplares de la misma especie o mismo género, es necesario una convivenci...', 'Especie compatible con otros peces marinos, siempre que se disponga de suficiente espacio para evitar agresiones por territorialidad, si se mantienen ejemplares de la misma especie o mismo género, es necesario una convivencia desde joven para que estén adaptados y acostumbrados a la vida en comunidad.', 'vkl3tAQq3L4', '{}', 0, 'vistas/img/productos/pez-marino-blue-tang.png', 0, 0, 39, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '2020-09-03 12:06:36'),
(88, 14, 62, 'virtual', 'pez-marino-naso-elegans', 1, 'pez marino naso elegans', 'Aqui les dejo este video tutorial del pez cirujano naso Rubio conosido cientificamente como naso elegant....', 'Aqui les dejo este video tutorial del pez cirujano naso Rubio conosido cientificamente como naso elegant.', 'rC6JPcAiaOo', '{}', 0, 'vistas/img/productos/pez-marino-naso-elegans.png', 0, 0, 50, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '2020-09-03 08:54:36'),
(91, 14, 62, 'virtual', 'pez-marino-power-blue', 1, 'Pez marino power blue', 'Tiene una forma oval con cuerpo muy colorido y marcas audaces. Es muy apreciado por sus colores vivos y marcas con varios tonos diferentes de azul con detalles de color amarillo y blanco. Un color brillante amarillo destaca l...', 'Tiene una forma oval con cuerpo muy colorido y marcas audaces. Es muy apreciado por sus colores vivos y marcas con varios tonos diferentes de azul con detalles de color amarillo y blanco. Un color brillante amarillo destaca las aletas dorsales y pectorales, y las marcas de color negro azulado llamativas.', 'os5csq0cKPg', '{}', 0, 'vistas/img/productos/pez-marino-power-blue.png', 0, 0, 7, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '2020-08-29 07:28:09'),
(92, 14, 62, 'virtual', 'copperband-butterfly', 1, 'Copperband Butterfly', 'El pez mariposa de nariz alargada (Chelmon rostratus ) es un pez marino, de la familia Chaetodontidae. Es uno de los peces marinos más populares y solicitados en acuariofilia marina. Su población salvaje es abundante, siend...', 'El pez mariposa de nariz alargada (Chelmon rostratus ) es un pez marino, de la familia Chaetodontidae. Es uno de los peces marinos más populares y solicitados en acuariofilia marina. Su población salvaje es abundante, siendo una especie común y estable.', 'hC4XhRSkfUg', '{}', 0, 'vistas/img/productos/copperband-butterfly.png', 0, 0, 53, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '2020-08-29 06:58:38'),
(93, 14, 62, 'virtual', 'pez-mandarin', 1, 'Pez Mandarin', 'Conocido comúnmente como pez mandarín o pez dragón puede ser encontrado bajo distintos seudónimos en la bibliografía especializada: Callionymus splendidus, Neosynchiropus splendidus o Pterosynchiropus splendidus....', 'Conocido comúnmente como pez mandarín o pez dragón puede ser encontrado bajo distintos seudónimos en la bibliografía especializada: Callionymus splendidus, Neosynchiropus splendidus o Pterosynchiropus splendidus.', 'AtLawAa3TkU', '{}', 0, 'vistas/img/productos/pez-mandarin.png', 0, 0, 22, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '2020-08-29 06:43:07'),
(94, 14, 62, 'virtual', 'angel-bicolor', 1, 'Angel Bicolor', 'Aunque no se trata de una de las especies del género Centropyge más pequeñas, El Centropyge bicolor tiene ganado un puesto de honor entre aquellas más atractivas que se pueden contemplar en un acuario marino doméstico. ...', 'Aunque no se trata de una de las especies del género Centropyge más pequeñas, El Centropyge bicolor tiene ganado un puesto de honor entre aquellas más atractivas que se pueden contemplar en un acuario marino doméstico. ', '_plrkZYhhNA', '{}', 0, 'vistas/img/productos/angel-bicolor.png', 0, 0, 29, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '2020-09-03 05:54:38'),
(95, 14, 62, 'virtual', 'purple-tang', 1, 'Purple Tang', 'El Zebrasoma xanthurum o cirujano púrpura, como se denomina comúnmente, pertenece a la familia Acanthuridae incluida en el orden de los Perciformes.  La característica distintiva de esta familia es una pareja de espinas, u...', 'El Zebrasoma xanthurum o cirujano púrpura, como se denomina comúnmente, pertenece a la familia Acanthuridae incluida en el orden de los Perciformes.  La característica distintiva de esta familia es una pareja de espinas, una a cada lado de la cola, muy peligrosas que eriza como defensa a su voluntad.', 'UqENWcwa6A4', '{}', 0, 'vistas/img/productos/purple-tang.png', 0, 0, 25, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '2020-09-03 10:52:04'),
(96, 10, 32, 'fisico', 'filtro-de-esponja-grande-sobo', 1, 'FILTRO DE ESPONJA GRANDE SOBO', 'El filtro de esponja de acuario proporciona el agua con oxígeno muy necesario, proporciona filtración biológica y calidad de agua estable....', 'El filtro de esponja de acuario proporciona el agua con oxígeno muy necesario, proporciona filtración biológica y calidad de agua estable.', '[{\"foto\":\"vistas/img/multimedia/filtro-de-esponja-grande-sobo/IMAGEN PRINCIPAL.jpg\"},{\"foto\":\"vistas/img/multimedia/filtro-de-esponja-grande-sobo/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"GRANDE SB-3330\"],\"Color\":[],\"Marca\":[\"SOBO\"]}', 25, 'vistas/img/productos/filtro-de-esponja-grande-sobo.jpg', 24, 0, 1, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '2020-08-06 02:52:58'),
(97, 10, 57, 'fisico', 'filtro-aereo-venus-aqua-600t', 1, 'FILTRO AEREO VENUS AQUA 600T', 'Filtros aéreos con gran capacidad para material filtrante en sus distintas presentaciones de la marca VENUSAQUA...', 'Filtros aéreos con gran capacidad para material filtrante en sus distintas presentaciones de la marca VENUSAQUA', '[{\"foto\":\"vistas/img/multimedia/filtro-aereo-venus-aqua-600t/IMAGEN PRINCIPAL.jpg\"},{\"foto\":\"vistas/img/multimedia/filtro-aereo-venus-aqua-600t/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"600T - 650 L/H\"],\"Color\":[],\"Marca\":[\"VENUS AQUA\"]}', 36, 'vistas/img/productos/filtro-aereo-venus-aqua-600t.jpg', 59, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '2020-08-28 02:54:26'),
(98, 10, 57, 'fisico', 'filtro-interno-venus-aqua', 1, 'FILTRO INTERNO VENUS AQUA', 'Este filtro interno para acuarios está diseñado para uso sumergible y se puede usar en el acuario Fresh Tank. El filtro viene completo con accesorios de boquilla de aireación venturi incluidos que se pueden usar por separa...', 'Este filtro interno para acuarios está diseñado para uso sumergible y se puede usar en el acuario Fresh Tank. El filtro viene completo con accesorios de boquilla de aireación venturi incluidos que se pueden usar por separado con ambas salidas que tienen la característica de agregar más aireación a su pecera. ', '[{\"foto\":\"vistas/img/multimedia/filtro-interno-venus-aqua/IMAGEN INTERNA2 aqua venus 1800F.jpg\"},{\"foto\":\"vistas/img/multimedia/filtro-interno-venus-aqua/IMAGEN INTERNA aqua venus 1800F.jpg\"}]', '{\"Talla\":[\"2000 L/H\"],\"Color\":[],\"Marca\":[\"VENUS AQUA\"]}', 52, 'vistas/img/productos/filtro-interno-venus-aqua.jpg', 23, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-26 01:34:59'),
(100, 10, 37, 'fisico', 'seachem-matrix-500-ml', 1, 'SEACHEM MATRIX 500 ML', 'Matrix es una biomedia de alta porosidad que proporciona una biofiltración eficiente para la eliminación de residuos nitrogenados. Matrix es un sólido inorgánico poroso de aproximadamente 10 mm de diámetro. ...', 'Matrix es una biomedia de alta porosidad que proporciona una biofiltración eficiente para la eliminación de residuos nitrogenados. Matrix es un sólido inorgánico poroso de aproximadamente 10 mm de diámetro. ', '[{\"foto\":\"vistas/img/multimedia/seachem-matrix-500-ml/IMAGEN INTERNA MATRIX 250 ML 1.jpg\"},{\"foto\":\"vistas/img/multimedia/seachem-matrix-500-ml/IMAGEN INTERNA MATRIX 250 ML 2.jpg\"}]', '{\"Talla\":[\"MATRIX 500 ML\"],\"Color\":[],\"Marca\":[\"SEACHEM\"]}', 45, 'vistas/img/productos/seachem-matrix-500-ml.jpg', 35, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-09-03 09:34:37'),
(101, 10, 37, 'fisico', 'canutillos-ceramicos-minjiang-1000-ml', 1, 'CANUTILLOS CERAMICOS MINJIANG 1000 ML', 'La función de lo canutillos para acuario es la de albergar bacterias beneficiosas, capaces de transformar las sustancias químicas perjudiciales del acuario (producto de la actividad metabólica de peces y plantas, o restos ...', 'La función de lo canutillos para acuario es la de albergar bacterias beneficiosas, capaces de transformar las sustancias químicas perjudiciales del acuario (producto de la actividad metabólica de peces y plantas, o restos de comida) en compuestos inocuos y no tóxicos para la vida del acuario.', '[{\"foto\":\"vistas/img/multimedia/canutillos-ceramicos-minjiang-1000-ml/IMAGEN INTERNA CERAMICOS 1000ML 3.png\"},{\"foto\":\"vistas/img/multimedia/canutillos-ceramicos-minjiang-1000-ml/IMAGEN INTERNA MATRIX 250 ML 3.png\"}]', '{\"Talla\":[\"CERAMICOS 1000 ML\"],\"Color\":[],\"Marca\":[\"MINJIANG\"]}', 25, 'vistas/img/productos/canutillos-ceramicos-minjiang-1000-ml.png', 48, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '2020-09-02 13:07:41'),
(102, 10, 37, 'fisico', 'carbon-activado-minjiang-1000-ml', 1, 'CARBON ACTIVADO MINJIANG 1000 ML', 'Las características del carbón hacen que sirva como una esponja natural, absorbiendo varios químicos (entre otros, restos de metales pesados, fosfatos, nitrato, restos de medicamentos o toxinas) y aislándolos sin peligro ...', 'Las características del carbón hacen que sirva como una esponja natural, absorbiendo varios químicos (entre otros, restos de metales pesados, fosfatos, nitrato, restos de medicamentos o toxinas) y aislándolos sin peligro hasta que retiramos el carbón y lo reemplazamos.', '[{\"foto\":\"vistas/img/multimedia/carbon-activado-minjiang-1000-ml/IMAGEN INTERNA CARBON2.png\"},{\"foto\":\"vistas/img/multimedia/carbon-activado-minjiang-1000-ml/IMAGEN INTERNA CARBON1.png\"}]', '{\"Talla\":[\"CARGON ACTIVADO 1000ML\"],\"Color\":[],\"Marca\":[\"MINJIANG\"]}', 25, 'vistas/img/productos/carbon-activado-minjiang-1000-ml.png', 12, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-25 16:41:54'),
(103, 10, 57, 'fisico', 'filtro-interno-rs-electrical-rs332f', 1, 'FILTRO INTERNO RS ELECTRICAL RS332F', 'La filtración es el corazón de un acuario. La vida acuática (o los peces) necesita agua limpia para mantenerse, por lo que la filtración de calidad es esencial e importante para tener un buen acuario. La filtración puede...', 'La filtración es el corazón de un acuario. La vida acuática (o los peces) necesita agua limpia para mantenerse, por lo que la filtración de calidad es esencial e importante para tener un buen acuario. La filtración puede ser biológica, mecánica y química.', '[{\"foto\":\"vistas/img/multimedia/filtro-interno-rs-electrical-rs332f/IMAGEN INTERNA CARBON2.jpg\"},{\"foto\":\"vistas/img/multimedia/filtro-interno-rs-electrical-rs332f/IMAGEN INTERNA1.jpg\"}]', '{\"Talla\":[\"1800 L/h\"],\"Color\":[],\"Marca\":[\"RS ELECTRICAL\"]}', 46, 'vistas/img/productos/filtro-interno-rs-electrical-rs332f.png', 11, 0, 2, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-07-17 02:43:55'),
(104, 10, 57, 'fisico', 'filtro-interno-rs-electrical-rs628b', 0, 'FILTRO INTERNO RS ELECTRICAL RS628B', 'Filtro interno, para acuario. Incluye material filtrante (esponja y carbón activado). Bomba de 900L/h. Potencia de 12w....', 'Filtro interno, para acuario. Incluye material filtrante (esponja y carbón activado). Bomba de 900L/h. Potencia de 12w.', '[{\"foto\":\"vistas/img/multimedia/filtro-interno-rs-electrical-rs628b/IMAGEN INTERNA1.jpg\"},{\"foto\":\"vistas/img/multimedia/filtro-interno-rs-electrical-rs628b/IMAGEN INTERNA2.jpg\"}]', '{\"Talla\":[\"900 L/H\"],\"Color\":[],\"Marca\":[\"RS ELECTRICAL\"]}', 47, 'vistas/img/productos/filtro-interno-rs-electrical-rs628b.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-07-04 20:56:43'),
(105, 10, 57, 'fisico', 'filtro-interno-rs-electrical-rs6001fa', 0, 'FILTRO INTERNO RS ELECTRICAL RS6001FA', 'Filtro interno, para acuario. Incluye material filtrante. Bomba de 2000L/h. Altura máxima de 1,5m. Potencia de 32w....', 'Filtro interno, para acuario. Incluye material filtrante. Bomba de 2000L/h. Altura máxima de 1,5m. Potencia de 32w.', '[{\"foto\":\"vistas/img/multimedia/filtro-interno-rs-electrical-rs6001fa/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"2000 L/H\"],\"Color\":[],\"Marca\":[\"RS ELECTRICAL\"]}', 47, 'vistas/img/productos/filtro-interno-rs-electrical-rs6001fa.png', 10, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-07-07 02:30:29'),
(106, 10, 57, 'fisico', 'filtro-interno-sobo-fc1001', 1, 'FILTRO INTERNO SOBO FC1001', 'Este filtro Sobo FC -1001 es adecuado principalmente para tanques de agua de 50/60 litros. Súper silencioso y energéticamente eficiente, fácil de limpiar. F.Max: 800L / H....', 'Este filtro Sobo FC -1001 es adecuado principalmente para tanques de agua de 50/60 litros. Súper silencioso y energéticamente eficiente, fácil de limpiar. F.Max: 800L / H.', '[{\"foto\":\"vistas/img/multimedia/filtro-interno-sobo-fc1001/IMAGEN INTERNA.jpg\"},{\"foto\":\"vistas/img/multimedia/filtro-interno-sobo-fc1001/IMAGEN PRINCIPAL.png\"}]', '{\"Talla\":[\"800 L/H\"],\"Color\":[],\"Marca\":[\"SOBO\"]}', 32, 'vistas/img/productos/filtro-interno-sobo-fc1001.png', 19, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-28 22:22:52'),
(107, 10, 30, 'fisico', 'bomba-de-aire-sobo-sb666a', 1, 'BOMBA DE AIRE SOBO SB666A', 'SOBO SB-666A  con 2 bocas de salida....', 'SOBO SB-666A  con 2 bocas de salida.', '[{\"foto\":\"vistas/img/multimedia/bomba-de-aire-sobo-sb666a/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"2 SALIDAS\"],\"Color\":[],\"Marca\":[\"SOBO\"]}', 21, 'vistas/img/productos/bomba-de-aire-sobo-sb666a.jpg', 13, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-27 12:11:35'),
(108, 11, 64, 'fisico', 'mayas-boyu-fn-8', 1, 'MAYAS BOYU FN 8', 'Red para captura de peces de 8 pulgadas....', 'Red para captura de peces de 8 pulgadas.', '[{\"foto\":\"vistas/img/multimedia/mayas-boyu-fn-8/IMAGEN PRINCIPAL.jpg\"},{\"foto\":\"vistas/img/multimedia/mayas-boyu-fn-8/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"FN-8\"],\"Color\":[],\"Marca\":[\"BOYU\"]}', 6, 'vistas/img/productos/mayas-boyu-fn-8.jpg', 43, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-13 18:45:46'),
(109, 11, 64, 'fisico', 'mayas-boyu-fn-12', 1, 'MAYAS BOYU FN 12', 'Red para captura de peces de 12 pulgadas....', 'Red para captura de peces de 12 pulgadas.', '[{\"foto\":\"vistas/img/multimedia/mayas-boyu-fn-12/IMAGEN PRINCIPAL.jpg\"},{\"foto\":\"vistas/img/multimedia/mayas-boyu-fn-12/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"FN-12\"],\"Color\":[],\"Marca\":[\"BOYU\"]}', 12, 'vistas/img/productos/mayas-boyu-fn-12.jpg', 3, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-28 03:39:35'),
(110, 11, 65, 'fisico', 'maternidad-boyu-nb3201', 1, 'MATERNIDAD BOYU NB3201', 'Maternidad para crías de peces. puede aislar a los peces tropicales de manera efectiva, Separa de manera segura a las crías recién nacidas de la madre y otros peces o peces aislados lesionados o agresivos ....', 'Maternidad para crías de peces. puede aislar a los peces tropicales de manera efectiva, Separa de manera segura a las crías recién nacidas de la madre y otros peces o peces aislados lesionados o agresivos .', '[{\"foto\":\"vistas/img/multimedia/maternidad-boyu-nb3201/IMAGEN PRINCIPAL.jpg\"},{\"foto\":\"vistas/img/multimedia/maternidad-boyu-nb3201/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"MATERNIDAD NB3201\"],\"Color\":[],\"Marca\":[\"BOYU\"]}', 10, 'vistas/img/productos/maternidad-boyu-nb3201.jpg', 13, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-27 00:33:13'),
(117, 10, 38, 'fisico', 'seachem-prime-250-ml', 1, 'SEACHEM PRIME 250 ML', 'Casi todas las compañías de mascotas acuáticas fabrican un producto que elimina el cloro. Sin embargo, ninguno de ellos puede compararse en calidad, concentración o efectividad con el producto estrella de Seachem: Prime. ...', 'Casi todas las compañías de mascotas acuáticas fabrican un producto que elimina el cloro. Sin embargo, ninguno de ellos puede compararse en calidad, concentración o efectividad con el producto estrella de Seachem: Prime. Prime es el acondicionador completo y concentrado tanto para agua dulce como salada.', '[{\"foto\":\"vistas/img/multimedia/seachem-prime-250-ml/IMAGEN INTERNA2.jpg\"},{\"foto\":\"vistas/img/multimedia/seachem-prime-250-ml/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"250 ML\"],\"Color\":[],\"Marca\":[\"SEACHEM\"]}', 45, 'vistas/img/productos/seachem-prime-250-ml.png', 12, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-27 22:13:37'),
(119, 8, 66, 'fisico', 'seachem-garlic-guard-250-ml', 1, 'SEACHEM GARLIC GUARD 250 ML', 'GarlicGuard es un potenciador de olores y sabores con olor a ajo totalmente natural para peces de agua dulce y salada. Nuestra investigación ha demostrado que muchos peces se sienten atraídos por los olores naturales, como ...', 'GarlicGuard es un potenciador de olores y sabores con olor a ajo totalmente natural para peces de agua dulce y salada. Nuestra investigación ha demostrado que muchos peces se sienten atraídos por los olores naturales, como el ajo. Simplemente mezcle GarlicGuard con cualquier alimento.', '[{\"foto\":\"vistas/img/multimedia/seachem-garlic-guard-250-ml/IMAGEN INTERNA2.jpg\"},{\"foto\":\"vistas/img/multimedia/seachem-garlic-guard-250-ml/IMAGEN INTERNA1.jpg\"}]', '{\"Talla\":[\"250 ML\"],\"Color\":[],\"Marca\":[\"SEACHEM\"]}', 50, 'vistas/img/productos/seachem-garlic-guard-250-ml.jpg', 24, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-02 17:12:14'),
(120, 10, 38, 'fisico', 'seachem-clarity-250-ml', 1, 'SEACHEM CLARITY 250 ML', 'Clarity contiene agentes precipitantes y floculantes en la misma botella, lo que permite eliminar todos los tipos de turbidez en una sola dosis....', 'Clarity contiene agentes precipitantes y floculantes en la misma botella, lo que permite eliminar todos los tipos de turbidez en una sola dosis.', '[{\"foto\":\"vistas/img/multimedia/seachem-clarity-250-ml/IMAGEN INTERNA1.jpg\"},{\"foto\":\"vistas/img/multimedia/seachem-clarity-250-ml/IMAGEN INTERNA2.jpg\"}]', '{\"Talla\":[\"250 ML\"],\"Color\":[],\"Marca\":[\"SEACHEM\"]}', 55, 'vistas/img/productos/seachem-clarity-250-ml.jpg', 7, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-27 22:14:13'),
(121, 10, 37, 'fisico', 'seachem-de-nitrate-500-ml', 1, 'SEACHEM DE NITRATE 500 ML', 'denitrate  es un material económico, natural y poroso con una distribución de poros y geometría que promueve tanto la nitrificación aeróbica dentro de los primeros milímetros de profundidad como la desnitrificación ana...', 'denitrate  es un material económico, natural y poroso con una distribución de poros y geometría que promueve tanto la nitrificación aeróbica dentro de los primeros milímetros de profundidad como la desnitrificación anaeróbica en el núcleo.', '[{\"foto\":\"vistas/img/multimedia/seachem-de-nitrate-500-ml/IMAGEN INTERNA2.jpg\"},{\"foto\":\"vistas/img/multimedia/seachem-de-nitrate-500-ml/IMAGEN INTERNA1.jpg\"},{\"foto\":\"vistas/img/multimedia/seachem-de-nitrate-500-ml/IMAGEN INTERNA3.jpg\"}]', '{\"Talla\":[\"250 ML\"],\"Color\":[],\"Marca\":[\"SEACHEM\"]}', 45, 'vistas/img/productos/seachem-de-nitrate-500-ml.jpg', 5, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-07-16 03:37:05'),
(123, 7, 27, 'fisico', 'seachem-flourish-250-ml', 1, 'SEACHEM FLOURISH 250 ML', 'Flourish es un suplemento integral de plantas para el acuario natural de agua dulce. Contiene una rica variedad de micro elementos importantes, oligoelementos y otros nutrientes. Estos incluyen calcio, magnesio, hierro y otro...', 'Flourish es un suplemento integral de plantas para el acuario natural de agua dulce. Contiene una rica variedad de micro elementos importantes, oligoelementos y otros nutrientes. Estos incluyen calcio, magnesio, hierro y otros elementos importantes que han demostrado ser beneficiosos para las plantas acuáticas.', '[{\"foto\":\"vistas/img/multimedia/seachem-flourish-250-ml/IMAGEN INTERNA.jpg\"},{\"foto\":\"vistas/img/multimedia/seachem-flourish-250-ml/IMAGEN INTERNA2.jpg\"}]', '{\"Talla\":[\"250 ML\"],\"Color\":[],\"Marca\":[\"SEACHEM\"]}', 47, 'vistas/img/productos/seachem-flourish-250-ml.jpg', 19, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-27 12:14:50'),
(124, 10, 57, 'fisico', 'filtro-interno-minjiang-bl2001f', 1, 'FILTRO INTERNO MINJIANG BL2001F', 'Filtro Interno Minjiang de 1400 litros por hora, 20 watts de consumo....', 'Filtro Interno Minjiang de 1400 litros por hora, 20 watts de consumo.', '[{\"foto\":\"vistas/img/multimedia/filtro-interno-minjiang-bl2001f/IMAGEN INTERNA1.jpg\"},{\"foto\":\"vistas/img/multimedia/filtro-interno-minjiang-bl2001f/IMAGEN INTERNA2.jpg\"}]', '{\"Talla\":[\"1400 L/H\"],\"Color\":[],\"Marca\":[\"MINJIANG\"]}', 30, 'vistas/img/productos/filtro-interno-minjiang-bl2001f.jpg', 22, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-09-02 15:22:47'),
(125, 8, 31, 'fisico', 'sera-pond-flake-1000-ml', 1, 'SERA POND FLAKE 1000 ML', 'sera Pond Flakes es el alimento principal que se compone de escamas cuidadosamente elaboradas, para todos los peces pequeños del estanque, como las carpas doradas y los ródeos (Rhodeus amarus), así como para los peces jóv...', 'sera Pond Flakes es el alimento principal que se compone de escamas cuidadosamente elaboradas, para todos los peces pequeños del estanque, como las carpas doradas y los ródeos (Rhodeus amarus), así como para los peces jóvenes.', '[{\"foto\":\"vistas/img/multimedia/sera-pond-flake-1000-ml/IMAGEN INTERNA2.jpg\"},{\"foto\":\"vistas/img/multimedia/sera-pond-flake-1000-ml/IMAGEN INTERNA1.jpg\"},{\"foto\":\"vistas/img/multimedia/sera-pond-flake-1000-ml/IMAGEN INTERNA3.jpg\"}]', '{\"Talla\":[\"1000 ML\"],\"Color\":[],\"Marca\":[\"SERA\"]}', 34, 'vistas/img/productos/sera-pond-flake-1000-ml.jpg', 24, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-26 22:07:10'),
(126, 8, 31, 'fisico', 'sera-cichlid-stick-1000-ml', 1, 'SERA CICHLID STICK 1000 ML', 'Sera Cichlids Sticks es el alimento principal en forma de sticks elaborados manteniendo todas sus propiedades, sin colorantes ni conservantes, para cíclidos omnívoros grandes, entre los que se cuentan muchas especies sudame...', 'Sera Cichlids Sticks es el alimento principal en forma de sticks elaborados manteniendo todas sus propiedades, sin colorantes ni conservantes, para cíclidos omnívoros grandes, entre los que se cuentan muchas especies sudamericanas, y otros peces grandes.', '[{\"foto\":\"vistas/img/multimedia/sera-cichlid-stick-1000-ml/IMAGEN INTERNA3.jpg\"}]', '{\"Talla\":[\"1000 ML (210GR)\"],\"Color\":[],\"Marca\":[\"SERA\"]}', 80, 'vistas/img/productos/sera-cichlid-stick-1000-ml.jpg', 7, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-06-26 06:50:05'),
(127, 8, 31, 'fisico', 'sera-granugreen-250-ml', 1, 'SERA GRANUGREEN 250 ML', 'Sera Granugreen Nature es el alimento principal en forma de granulado elaborado manteniendo todas sus propiedades, sin colorantes ni conservantes, para cíclidos pequeños principalmente herbívoros y comedores de algas. Entr...', 'Sera Granugreen Nature es el alimento principal en forma de granulado elaborado manteniendo todas sus propiedades, sin colorantes ni conservantes, para cíclidos pequeños principalmente herbívoros y comedores de algas. Entre ellos se cuentan muchos de los cíclidos de África oriental.', '[{\"foto\":\"vistas/img/multimedia/sera-granugreen-250-ml/IMAGEN INTERNA3.jpg\"}]', '{\"Talla\":[\"250 ML(135 GR)\"],\"Color\":[],\"Marca\":[\"SERA\"]}', 33, 'vistas/img/productos/sera-granugreen-250-ml.jpg', 5, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-06-25 23:25:08'),
(128, 8, 31, 'fisico', 'sera-granured-250-ml', 1, 'SERA GRANURED 250 ML', 'sera Granured Nature es el alimento principal en forma de granulado elaborado manteniendo todas sus propiedades, sin colorantes ni conservantes, para cíclidos pequeños principalmente carnívoros y omnívoros....', 'sera Granured Nature es el alimento principal en forma de granulado elaborado manteniendo todas sus propiedades, sin colorantes ni conservantes, para cíclidos pequeños principalmente carnívoros y omnívoros.', '[{\"foto\":\"vistas/img/multimedia/sera-granured-250-ml/IMAGEN INTERNA3.jpg\"}]', '{\"Talla\":[\"250 ML(135 GR)\"],\"Color\":[],\"Marca\":[\"SERA\"]}', 33, 'vistas/img/productos/sera-granured-250-ml.jpg', 6, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-06-28 23:25:10'),
(129, 8, 31, 'fisico', 'sera-gourmet-nori-5-gr', 0, 'SERA GOURMET NORI 5 GR', 'Sera marin Gourmet Nori es la golosina que se compone de un 100% de algas Nori cuidadosamente secadas, para animales del acuario, como peces comedores de algas, crustáceos y erizos de mar....', 'Sera marin Gourmet Nori es la golosina que se compone de un 100% de algas Nori cuidadosamente secadas, para animales del acuario, como peces comedores de algas, crustáceos y erizos de mar.', '[{\"foto\":\"vistas/img/multimedia/sera-gourmet-nori-5-gr/IMAGEN INTERNA3.jpg\"}]', '{\"Talla\":[\"5 GR\"],\"Color\":[],\"Marca\":[\"SERA\"]}', 10, 'vistas/img/productos/sera-gourmet-nori-5-gr.jpg', 3, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-06-30 06:00:07'),
(130, 8, 66, 'fisico', 'sera-fishtamin-15-ml', 1, 'SERA FISHTAMIN 15 ML', 'sera Fishtamin es el alimento complementario que se compone de un concentrado multivitamínico emulsionado, cuidadosamente elaborado, para todos los peces en el agua dulce y salada....', 'sera Fishtamin es el alimento complementario que se compone de un concentrado multivitamínico emulsionado, cuidadosamente elaborado, para todos los peces en el agua dulce y salada.', '[{\"foto\":\"vistas/img/multimedia/sera-fishtamin-15-ml/IMAGEN INTERNA3.jpg\"}]', '{\"Talla\":[\"15 ML\"],\"Color\":[],\"Marca\":[\"SERA\"]}', 31, 'vistas/img/productos/sera-fishtamin-15-ml.jpg', 6, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-06-29 20:22:49'),
(131, 8, 31, 'fisico', 'sera-vipan-1000-ml', 1, 'SERA VIPAN 1000 ML', 'sera Vipan Nature es el alimento principal que se compone de escamas flotantes, sin colorantes ni conservantes, para todos los peces ornamentales que se alimentan en la superficie....', 'sera Vipan Nature es el alimento principal que se compone de escamas flotantes, sin colorantes ni conservantes, para todos los peces ornamentales que se alimentan en la superficie.', '[{\"foto\":\"vistas/img/multimedia/sera-vipan-1000-ml/IMAGEN INTERNA3.jpg\"}]', '{\"Talla\":[\"1000 ML(210GR)\"],\"Color\":[],\"Marca\":[\"SEACHEM\"]}', 74, 'vistas/img/productos/sera-vipan-1000-ml.jpg', 13, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-26 22:06:39'),
(133, 8, 34, 'fisico', 'tropical-ichtio-vit-1000ml', 1, 'TROPICAL ICHTIO VIT 1000ML', 'ICHTIO-VIT alimento de escamas básico y multicomplemental Un alimento completo en forma de escamas, obtenido de seleccionados complementos vegetales y animales de la cualidad más alta....', 'ICHTIO-VIT alimento de escamas básico y multicomplemental Un alimento completo en forma de escamas, obtenido de seleccionados complementos vegetales y animales de la cualidad más alta.', '[{\"foto\":\"vistas/img/multimedia/tropical-ichtio-vit-1000ml/IMAGEN PRINCIPAL.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-ichtio-vit-1000ml/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"1000 ML (200GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 48, 'vistas/img/productos/tropical-ichtio-vit-1000ml.jpg', 13, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-28 00:55:49'),
(134, 8, 34, 'fisico', 'tropical-supervit-1000-ml', 0, 'TROPICAL SUPERVIT 1000 ML', 'SUPERVIT un alimento de escamas multicomplemental y básico con beta glucano. Un alimento básico completo en forma de escamas, destinado para la alimentación diaria de los peces omnívoros de acuarios....', 'SUPERVIT un alimento de escamas multicomplemental y básico con beta glucano. Un alimento básico completo en forma de escamas, destinado para la alimentación diaria de los peces omnívoros de acuarios.', '[{\"foto\":\"vistas/img/multimedia/tropical-supervit-1000-ml/IMAGEN INTERNA.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-supervit-1000-ml/IMAGEN PRINCIPAL.jpg\"}]', '{\"Talla\":[\"1000 ML(200GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 66, 'vistas/img/productos/tropical-supervit-1000-ml.jpg', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-07-25 20:17:49'),
(135, 8, 34, 'fisico', 'tropical-spirulina-flakes-1000-ml', 0, 'TROPICAL SPIRULINA FLAKES 1000 ML', 'SPIRULINA FLAKES Un alimento vegetal de escamas con complemento de algas Spirulina platensis. Un alimento vegetal en forma de escamas con complemento de algas Spirulina platensis (6%). Destinado para la alimentación diaria d...', 'SPIRULINA FLAKES Un alimento vegetal de escamas con complemento de algas Spirulina platensis. Un alimento vegetal en forma de escamas con complemento de algas Spirulina platensis (6%). Destinado para la alimentación diaria de los peces herbívoros y omnívoros de acuarios con agua dulce y salada.', '[{\"foto\":\"vistas/img/multimedia/tropical-spirulina-flakes-1000-ml/IMAGEN PRINCIPAL.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-spirulina-flakes-1000-ml/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"1000 ML (200GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 68, 'vistas/img/productos/tropical-spirulina-flakes-1000-ml.jpg', 5, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-07-03 01:22:16'),
(136, 8, 34, 'fisico', 'tropical-vitality-color-1000-ml', 1, 'TROPICAL VITALITY COLOR 1000 ML', 'VITALITY & COLOR Un alimento de proteínas en forma de escamas con efecto de activación de color y vitalizante, destinado para la alimentación diaria de los peces carnívoros y omnívoros. ...', 'VITALITY & COLOR Un alimento de proteínas en forma de escamas con efecto de activación de color y vitalizante, destinado para la alimentación diaria de los peces carnívoros y omnívoros. ', '[{\"foto\":\"vistas/img/multimedia/tropical-vitality-color-1000-ml/IMAGEN PRINCIPAL.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-vitality-color-1000-ml/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"1000 ML (200GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 60, 'vistas/img/productos/tropical-vitality-color-1000-ml.jpg', 6, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-07-31 03:40:12'),
(137, 8, 34, 'fisico', 'tropical-spirulina-granulat-1000-ml', 1, 'TROPICAL SPIRULINA GRANULAT 1000 ML', 'SPIRULINA GRANULAT es un alimento completo en forma de granulado que se hunde lentamente con spirulina (6%) para la alimentación diaria de peces herbívoros y omnívoros de acuarios de agua dulce y salada....', 'SPIRULINA GRANULAT es un alimento completo en forma de granulado que se hunde lentamente con spirulina (6%) para la alimentación diaria de peces herbívoros y omnívoros de acuarios de agua dulce y salada.', '[{\"foto\":\"vistas/img/multimedia/tropical-spirulina-granulat-1000-ml/IMAGEN PRINCIPAL.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-spirulina-granulat-1000-ml/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"1000 ML (440GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 76, 'vistas/img/productos/tropical-spirulina-granulat-1000-ml.jpg', 9, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-07-26 18:00:36'),
(138, 8, 34, 'fisico', 'tropical-super-goldifish-mini-sticks-250-ml', 0, 'TROPICAL SUPER GOLDIFISH MINI STICKS 250 ML', 'SUPER GOLDFISH MINI STICKS un alimento básico para peces cabeza de león y otros peces dorados japoneses. Un alimento de porción completa en forma de sticks que hunden destinado para peces dorados de cabeza de león y otras...', 'SUPER GOLDFISH MINI STICKS un alimento básico para peces cabeza de león y otros peces dorados japoneses. Un alimento de porción completa en forma de sticks que hunden destinado para peces dorados de cabeza de león y otras formas japonesas.', '[{\"foto\":\"vistas/img/multimedia/tropical-super-goldifish-mini-sticks-250-ml/IMAGEN INTERNA2.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-super-goldifish-mini-sticks-250-ml/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"250 ML (150GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 26, 'vistas/img/productos/tropical-super-goldifish-mini-sticks-250-ml.jpg', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-07-08 01:07:09'),
(139, 8, 34, 'fisico', 'tropical-goldfish-colour-pellet-1000-ml', 0, 'TROPICAL GOLDFISH COLOUR PELLET 1000 ML', 'GOLDFISH COLOUR PELLET un alimento básico granulado, resaltador del color, con beta glucano para carpas doradas. Un alimento básico en finos gránulos flotantes, resaltador del color para todas especies de carpas doradas y ...', 'GOLDFISH COLOUR PELLET un alimento básico granulado, resaltador del color, con beta glucano para carpas doradas. Un alimento básico en finos gránulos flotantes, resaltador del color para todas especies de carpas doradas y carpas koi jóvenes que habitan los acuarios y los estanques.', '[{\"foto\":\"vistas/img/multimedia/tropical-goldfish-colour-pellet-1000-ml/IMAGEN INTERNA2.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-goldfish-colour-pellet-1000-ml/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"1000 ML (360GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 69, 'vistas/img/productos/tropical-goldfish-colour-pellet-1000-ml.jpg', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-07-08 08:08:43'),
(140, 8, 34, 'fisico', 'tropical-marine-power-garlic-1000-ml', 1, 'TROPICAL Marine Power Garlic 1000 ml', 'Alimento en forma de granulado que se hunde con alto contenido de ajo (30%).  el ajo contribuye al buen funcionamiento del sistema digestivo y refuerza la inmunidad natural de los peces...', 'Alimento en forma de granulado que se hunde con alto contenido de ajo (30%).  el ajo contribuye al buen funcionamiento del sistema digestivo y refuerza la inmunidad natural de los peces', '[{\"foto\":\"vistas/img/multimedia/tropical-marine-power-garlic-1000-ml/IMAGEN INTERNA2.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-marine-power-garlic-1000-ml/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"1000 ML (600GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 96, 'vistas/img/productos/tropical-marine-power-garlic-1000-ml.jpg', 7, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-14 01:50:31'),
(141, 8, 34, 'fisico', 'tropical-marine-power-krill-1000-ml', 0, 'TROPICAL MARINE POWER KRILL 1000 ML', 'Alimento en forma de granulado que se hunde con alto contenido de krill antártico (40%).  el krill antártico es fuente de proteínas ricas en aminoácidos esenciales y ácidos grados insaturados, incluidos los omega 3, que ...', 'Alimento en forma de granulado que se hunde con alto contenido de krill antártico (40%).  el krill antártico es fuente de proteínas ricas en aminoácidos esenciales y ácidos grados insaturados, incluidos los omega 3, que contribuyen al crecimiento de los peces y su condición general.', '[{\"foto\":\"vistas/img/multimedia/tropical-marine-power-krill-1000-ml/IMAGEN INTERNA.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-marine-power-krill-1000-ml/IMAGEN INTERNA2.jpg\"}]', '{\"Talla\":[\"1000 ML (540GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 134, 'vistas/img/productos/tropical-marine-power-krill-1000-ml.jpg', 5, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-06-25 20:06:25'),
(142, 8, 34, 'fisico', 'tropical-marine-power-spirulina-1000-ml', 1, 'TROPICAL MARINE POWER SPIRULINA 1000 ML', 'Alimento en forma de granulado que se hunde con alto contenido de spirulina (36%). las sustancias contenidas en la spirulina apoyan a la inmunidad natural de los peces y contribuyen a los procesos de digestión y gracias a lo...', 'Alimento en forma de granulado que se hunde con alto contenido de spirulina (36%). las sustancias contenidas en la spirulina apoyan a la inmunidad natural de los peces y contribuyen a los procesos de digestión y gracias a los carotenoides contenidos en la spirulina el alimento refuerza los colores de los peces.', '[{\"foto\":\"vistas/img/multimedia/tropical-marine-power-spirulina-1000-ml/IMAGEN INTERNA2.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-marine-power-spirulina-1000-ml/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"1000 ML (600GR)\"],\"Color\":[],\"Marca\":[\"SEACHEM\"]}', 144, 'vistas/img/productos/tropical-marine-power-spirulina-1000-ml.jpg', 9, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-14 01:43:22'),
(143, 8, 34, 'fisico', '-tropical-discus-gran-d50-plus-1000-ml', 1, ' TROPICAL DISCUS GRAN D50 PLUS 1000 ML', 'Tropical Discus Gran D-50 Plus es un alimento potenciador del color en forma de gránulos hundibles con alto (50%) contenido de proteína para discos jóvenes y adultos y otros peces, particularmente las especies más exigent...', 'Tropical Discus Gran D-50 Plus es un alimento potenciador del color en forma de gránulos hundibles con alto (50%) contenido de proteína para discos jóvenes y adultos y otros peces, particularmente las especies más exigentes. Su característica más destacada es su alto contenido de proteína de gran calidad.', '[{\"foto\":\"vistas/img/multimedia/-tropical-discus-gran-d50-plus-1000-ml/IMAGEN INTERNA.jpg\"},{\"foto\":\"vistas/img/multimedia/-tropical-discus-gran-d50-plus-1000-ml/IMAGEN INTERNA2.jpg\"}]', '{\"Talla\":[\"1000 ML (440GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 84, 'vistas/img/productos/-tropical-discus-gran-d50-plus-1000-ml.jpg', 16, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-20 00:39:52'),
(144, 8, 34, 'fisico', 'tropical-discus-gran-wild-1000-ml', 1, 'TROPICAL DISCUS GRAN WILD 1000 ML', 'DISCUS TROPICAL GRAN WILD es un alimento de múltiples ingredientes en forma de gránulos que se hunden lentamente con la adición de algas, krill y frutas. Destinado a la alimentación diaria de disco salvaje y otras especie...', 'DISCUS TROPICAL GRAN WILD es un alimento de múltiples ingredientes en forma de gránulos que se hunden lentamente con la adición de algas, krill y frutas. Destinado a la alimentación diaria de disco salvaje y otras especies exigentes de peces capturados en la naturaleza. ', '[{\"foto\":\"vistas/img/multimedia/tropical-discus-gran-wild-1000-ml/IMAGEN INTERNA.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-discus-gran-wild-1000-ml/IMAGEN INTERNA2.jpg\"}]', '{\"Talla\":[\"1000 ML (440GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 79, 'vistas/img/productos/tropical-discus-gran-wild-1000-ml.jpg', 9, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-14 01:38:17'),
(145, 8, 34, 'fisico', 'tropical-super-spirulina-forte-1000-ml', 1, 'TROPICAL SUPER SPIRULINA FORTE 1000 ML', 'SUPER SPIRULINA FORTE Alimento vegetal de escamas con un alto (36%) contenido de las algas Spirulina platensis. Destinado para cíclidos africanos alguívoros y otros peces, también marinos, que exigen en su dieta una gran c...', 'SUPER SPIRULINA FORTE Alimento vegetal de escamas con un alto (36%) contenido de las algas Spirulina platensis. Destinado para cíclidos africanos alguívoros y otros peces, también marinos, que exigen en su dieta una gran cantidad de componentes vegetales.', '[{\"foto\":\"vistas/img/multimedia/tropical-super-spirulina-forte-1000-ml/IMAGEN INTERNA.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-super-spirulina-forte-1000-ml/IMAGEN INTERNA2.jpg\"}]', '{\"Talla\":[\"1000 ML (200GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 105, 'vistas/img/productos/tropical-super-spirulina-forte-1000-ml.jpg', 18, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-26 01:29:49'),
(146, 8, 34, 'fisico', 'tropical--krill-flake-500-ml', 0, 'TROPICAL  KRILL FLAKE 500 ML', 'KRILL FLAKE un alimento resaltador de color con krill para peces caprichosos Alimento multicomplemental resaltador del color con un alto contenido de krill antártico (40%), destinado para la alimentación diaria de peces omn...', 'KRILL FLAKE un alimento resaltador de color con krill para peces caprichosos Alimento multicomplemental resaltador del color con un alto contenido de krill antártico (40%), destinado para la alimentación diaria de peces omnívoros y carnívoros, sobre todo los que son caprichosos y no recogen con gusto alimentos.', '[{\"foto\":\"vistas/img/multimedia/tropical--krill-flake-500-ml/IMAGEN INTERNA2.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical--krill-flake-500-ml/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"500 ML (100GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 60, 'vistas/img/productos/tropical--krill-flake-500-ml.jpg', 4, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-07-03 01:21:42'),
(147, 8, 34, 'fisico', 'cichlid-carnivore-small-1000-ml', 1, 'CICHLID CARNIVORE SMALL 1000 ML', 'CICHLID CARNIVORE SMALL PELLET alimento que potencia el color para cíclidos carnívoros jóvenes y pequeños. Alimento altamente proteínico con astaxantín para cíclidos carnívoros jóvenes y pequeños, e.g.: Cyphotilapia...', 'CICHLID CARNIVORE SMALL PELLET alimento que potencia el color para cíclidos carnívoros jóvenes y pequeños. Alimento altamente proteínico con astaxantín para cíclidos carnívoros jóvenes y pequeños, e.g.: Cyphotilapia afra, Placidochromis electra, Hemichromis bimaculatus, ETC.', '[{\"foto\":\"vistas/img/multimedia/cichlid-carnivore-small-1000-ml/IMAGEN INTERNA.jpg\"},{\"foto\":\"vistas/img/multimedia/cichlid-carnivore-small-1000-ml/IMAGEN INTERNA2.jpg\"}]', '{\"Talla\":[\"1 000 ML (360GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 64, 'vistas/img/productos/cichlid-carnivore-small-1000-ml.jpg', 6, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-06-30 04:42:37'),
(148, 8, 34, 'fisico', 'tropical-malawi-chips-1000-ml', 1, 'TROPICAL MALAWI CHIPS 1000 ML', 'MALAWI CHIPS Alimento multi-ingrediente para cíclidos mbunas del lago Malawi MALAWI CHIPS es un alimento multicomponente en forma de chips pequeños que se sumergen lentamente, destinado para cíclidos mbunas y otros cíclid...', 'MALAWI CHIPS Alimento multi-ingrediente para cíclidos mbunas del lago Malawi MALAWI CHIPS es un alimento multicomponente en forma de chips pequeños que se sumergen lentamente, destinado para cíclidos mbunas y otros cíclidos herbívoros. Una fórmula muy variada garantiza que los peces tengan una condición perfecta.', '[{\"foto\":\"vistas/img/multimedia/tropical-malawi-chips-1000-ml/IMAGEN INTERNA3.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-malawi-chips-1000-ml/IMAGEN INTERNA.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-malawi-chips-1000-ml/IMAGEN INTERNA2.jpg\"}]', '{\"Talla\":[\"1000 ML (520GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 92, 'vistas/img/productos/tropical-malawi-chips-1000-ml.jpg', 6, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-07-06 12:27:56'),
(149, 8, 34, 'fisico', 'tropical-tanganyika-chips-1000-ml', 1, 'TROPICAL TANGANYIKA CHIPS 1000 ML', 'TANGANYIKA CHIPS es un alimento completo y especial en forma de chips para los cíclidos más grandes del Lago Tanganika, incluyendo los de las familias Altolamprologus, Julidochromis, Lamprologus, Neolamprologus, Cyprichromi...', 'TANGANYIKA CHIPS es un alimento completo y especial en forma de chips para los cíclidos más grandes del Lago Tanganika, incluyendo los de las familias Altolamprologus, Julidochromis, Lamprologus, Neolamprologus, Cyprichromis, Paracyprichromis y también para los peces jóvenes del género Cyphotilapia frontosa y otros...', '[{\"foto\":\"vistas/img/multimedia/tropical-tanganyika-chips-1000-ml/IMAGEN INTERNA1.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-tanganyika-chips-1000-ml/IMAGEN INTERNA.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-tanganyika-chips-1000-ml/IMAGEN INTERNA2.jpg\"}]', '{\"Talla\":[\"1000 ML (520GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 92, 'vistas/img/productos/tropical-tanganyika-chips-1000-ml.jpg', 9, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-07-01 22:27:34'),
(150, 8, 34, 'fisico', 'tropical-carnivore-1000-ml', 1, 'TROPICAL CARNIVORE 1000 ML', 'CARNIVORE un alimento para grandes peces carnívoros. Un alimento de proteínas en gránulos que hunden para peces de fondo Carnivore una propuesta nueva de la marca Tropical para los aficionados de los peces carnívoros. Un ...', 'CARNIVORE un alimento para grandes peces carnívoros. Un alimento de proteínas en gránulos que hunden para peces de fondo Carnivore una propuesta nueva de la marca Tropical para los aficionados de los peces carnívoros. Un alto contenido de proteínas de fácil digestión cubrirá las necesidades tanto de los siluros, co', '[{\"foto\":\"vistas/img/multimedia/tropical-carnivore-1000-ml/IMAGEN INTERNA1.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-carnivore-1000-ml/IMAGEN INTERNA2.jpg\"},{\"foto\":\"vistas/img/multimedia/tropical-carnivore-1000-ml/IMAGEN INTERNA3.jpg\"}]', '{\"Talla\":[\"1000 ML (600GR)\"],\"Color\":[],\"Marca\":[\"TROPICAL\"]}', 94, 'vistas/img/productos/tropical-carnivore-1000-ml.jpg', 11, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-07-18 13:54:08'),
(151, 8, 47, 'fisico', 'jbl-goldpearls-1000-ml', 0, 'JBL GoldPearls 1000 ML', 'Alimento completo y crecimiento ideal en carpas doradas y colas de velo: ingredientes selectos para satisfacer las necesidades de todas las variedades de carpas doradas. Nutritivo y fácil de digerir: Las perlas que se hunden...', 'Alimento completo y crecimiento ideal en carpas doradas y colas de velo: ingredientes selectos para satisfacer las necesidades de todas las variedades de carpas doradas. Nutritivo y fácil de digerir: Las perlas que se hunden son ideales para especies de pez de mín. 8 cm en todas las zonas del agua. ', '[{\"foto\":\"vistas/img/multimedia/jbl-goldpearls-1000-ml/IMAGEN INTERNA3.jpg\"},{\"foto\":\"vistas/img/multimedia/jbl-goldpearls-1000-ml/IMAGEN INTERNA1.jpg\"},{\"foto\":\"vistas/img/multimedia/jbl-goldpearls-1000-ml/IMAGEN INTERNA.jpg\"}]', '{\"Talla\":[\"1000 ML (580GR)\"],\"Color\":[],\"Marca\":[\"JBL\"]}', 78, 'vistas/img/productos/jbl-goldpearls-1000-ml.jpg', 14, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-07-03 01:22:29'),
(152, 8, 47, 'fisico', 'jbl-novorift-1000-ml', 1, 'JBL NovoRift 1000 ML', 'Alimento completo y crecimiento ideal en cíclidos comedores de aufwuchs de los lagos Tanganica y Malawi. Nutritivo y fácil de digerir: Condiciones ideales de alimentación para especies de pez de 10 a 25 cm en todas las zon...', 'Alimento completo y crecimiento ideal en cíclidos comedores de aufwuchs de los lagos Tanganica y Malawi. Nutritivo y fácil de digerir: Condiciones ideales de alimentación para especies de pez de 10 a 25 cm en todas las zonas del agua. Con espirulina rica en proteínas', '[{\"foto\":\"vistas/img/multimedia/jbl-novorift-1000-ml/IMAGEN INTERNA2.jpg\"},{\"foto\":\"vistas/img/multimedia/jbl-novorift-1000-ml/IMAGEN INTERNA.jpg\"},{\"foto\":\"vistas/img/multimedia/jbl-novorift-1000-ml/IMAGEN INTERNA1.jpg\"}]', '{\"Talla\":[\"1000 ML (530GR)\"],\"Color\":[],\"Marca\":[\"JBL\"]}', 74, 'vistas/img/productos/jbl-novorift-1000-ml.jpg', 11, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-27 12:13:01'),
(153, 8, 47, 'fisico', 'jbl-agil-1000-ml', 1, 'JBL AGIL 1000 ML', 'Especialmente adaptado a las necesidades alimenticias de las tortugas acuáticas y galápagos: Alimento básico en forma de barras flotantes para tortugas con un tamaño de 10-50 cm. La lisina estimula la formación de los hu...', 'Especialmente adaptado a las necesidades alimenticias de las tortugas acuáticas y galápagos: Alimento básico en forma de barras flotantes para tortugas con un tamaño de 10-50 cm. La lisina estimula la formación de los huesos, el complejo multivitamínico y la vitamina C fortalecen y estabilizan el sistema inmunitario.', '[{\"foto\":\"vistas/img/multimedia/jbl-agil-1000-ml/IMAGEN INTERNA3.jpg\"},{\"foto\":\"vistas/img/multimedia/jbl-agil-1000-ml/IMAGEN INTERNA2.jpg\"},{\"foto\":\"vistas/img/multimedia/jbl-agil-1000-ml/IMAGEN INTERNA.jpg\"},{\"foto\":\"vistas/img/multimedia/jbl-agil-1000-ml/IMAGEN INTERNA1.jpg\"}]', '{\"Talla\":[\"1000 ML (400GR)\"],\"Color\":[],\"Marca\":[\"JBL\"]}', 68, 'vistas/img/productos/jbl-agil-1000-ml.jpg', 8, 0, 0, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 1, '2020-08-15 00:24:15');
INSERT INTO `productos` (`id`, `id_categoria`, `id_subcategoria`, `tipo`, `ruta`, `estado`, `titulo`, `titular`, `descripcion`, `multimedia`, `detalles`, `precio`, `portada`, `vistas`, `ventas`, `vistasGratis`, `ventasGratis`, `ofertadoPorCategoria`, `ofertadoPorSubCategoria`, `oferta`, `precioOferta`, `descuentoOferta`, `imgOferta`, `finOferta`, `peso`, `entrega`, `fecha`) VALUES
(154, 14, 63, 'virtual', 'aclimatacion-de-un-pez-nuevo', 1, 'Aclimatación de un Pez Nuevo', 'El proceso de agregar peces a un acuario debe ser progresivo y respetuoso con el animal, para evitar problemas en su adaptación al nuevo hábitat. En el vídeo de esta semana te presento una guía en 5 pasos para aclimatar a...', 'El proceso de agregar peces a un acuario debe ser progresivo y respetuoso con el animal, para evitar problemas en su adaptación al nuevo hábitat. En el vídeo de esta semana te presento una guía en 5 pasos para aclimatar adecuadamente los nuevos habitantes al entorno.', 'F3_Baclp8xE', '{}', 0, 'vistas/img/productos/aclimatacion-de-un-pez-nuevo.jpg', 0, 0, 22, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '2020-09-03 16:09:44'),
(157, 14, 63, 'virtual', 'filtro-acuario', 1, 'filtro Acuario', 'Hay tres tipos principales de filtración en los acuarios: filtración biológica, filtración mecánica y filtración química. En muchos de los filtros de acuario se dan al menos dos de los tres tipo conjuntamente. A contin...', 'Hay tres tipos principales de filtración en los acuarios: filtración biológica, filtración mecánica y filtración química. En muchos de los filtros de acuario se dan al menos dos de los tres tipo conjuntamente. A continuación pasamos a explicar brevemente cada tipo.', 'OM8fR02pn8Q', '{}', 0, 'vistas/img/productos/filtro-acuario.jpg', 0, 0, 96, 0, 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', 0, 0, '2020-09-01 20:45:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `imgFondo` text COLLATE utf8_spanish_ci NOT NULL,
  `tipoSlide` text COLLATE utf8_spanish_ci NOT NULL,
  `imgProducto` text COLLATE utf8_spanish_ci NOT NULL,
  `estiloImgProducto` text COLLATE utf8_spanish_ci NOT NULL,
  `estiloTextoSlide` text COLLATE utf8_spanish_ci NOT NULL,
  `titulo1` text COLLATE utf8_spanish_ci NOT NULL,
  `titulo2` text COLLATE utf8_spanish_ci NOT NULL,
  `titulo3` text COLLATE utf8_spanish_ci NOT NULL,
  `boton` text COLLATE utf8_spanish_ci NOT NULL,
  `url` text COLLATE utf8_spanish_ci NOT NULL,
  `orden` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `slide`
--

INSERT INTO `slide` (`id`, `nombre`, `imgFondo`, `tipoSlide`, `imgProducto`, `estiloImgProducto`, `estiloTextoSlide`, `titulo1`, `titulo2`, `titulo3`, `boton`, `url`, `orden`, `fecha`) VALUES
(17, 'Seachem', 'vistas/img/slide/slide17/fondo.jpg', 'slideOpcion1', '', '{\"top\":\"\",\"right\":\"\",\"left\":\"\",\"width\":\"\"}', '{\"top\":\"0\",\"right\":\"\",\"left\":\"0\",\"width\":\"0\"}', '{\"texto\":\"\",\"color\":\"#333\"}', '{\"texto\":\"\",\"color\":\"#777\"}', '{\"texto\":\"\",\"color\":\"#888\"}', '', '#', 3, '2020-07-22 23:16:03'),
(18, 'Tropical', 'vistas/img/slide/slide18/fondo.jpg', 'slideOpcion1', '', '{\"top\":\"\",\"right\":\"\",\"left\":\"\",\"width\":\"\"}', '{\"top\":\"0\",\"right\":\"\",\"left\":\"0\",\"width\":\"0\"}', '{\"texto\":\"\",\"color\":\"#333\"}', '{\"texto\":\"\",\"color\":\"#777\"}', '{\"texto\":\"\",\"color\":\"#888\"}', '', '#', 2, '2020-07-22 23:16:03'),
(20, 'accesorios', 'vistas/img/slide/slide20/fondo.jpg', 'slideOpcion1', '', '{\"top\":\"\",\"right\":\"\",\"left\":\"\",\"width\":\"\"}', '{\"top\":\"0\",\"right\":\"\",\"left\":\"0\",\"width\":\"0\"}', '{\"texto\":\"\",\"color\":\"#333\"}', '{\"texto\":\"\",\"color\":\"#777\"}', '{\"texto\":\"\",\"color\":\"#888\"}', '', '#', 4, '2020-07-22 23:16:03'),
(21, '', 'vistas/img/slide/slide21/fondo.jpg', 'slideOpcion1', '', '{\"top\":\"\",\"right\":\"\",\"left\":\"\",\"width\":\"\"}', '{\"top\":\"20\",\"right\":\"\",\"left\":\"15\",\"width\":\"40\"}', '{\"texto\":\"\",\"color\":\"\"}', '{\"texto\":\"\",\"color\":\"\"}', '{\"texto\":\"\",\"color\":\"\"}', '', '#', 1, '2020-07-22 23:20:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id` int(11) NOT NULL,
  `subcategoria` text COLLATE utf8_spanish_ci NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `ruta` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `ofertadoPorCategoria` int(11) NOT NULL,
  `oferta` int(11) NOT NULL,
  `precioOferta` float NOT NULL,
  `descuentoOferta` int(11) NOT NULL,
  `imgOferta` text COLLATE utf8_spanish_ci NOT NULL,
  `finOferta` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `subcategorias`
--

INSERT INTO `subcategorias` (`id`, `subcategoria`, `id_categoria`, `ruta`, `estado`, `ofertadoPorCategoria`, `oferta`, `precioOferta`, `descuentoOferta`, `imgOferta`, `finOferta`, `fecha`) VALUES
(22, 'Agua Dulce', 7, 'agua-dulce', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:30:11'),
(23, 'Agua Salada', 7, 'agua-salada', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:29:45'),
(25, 'Invertebrados', 7, 'invertebrados', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:32:42'),
(26, 'Nutrafin', 8, 'nutrafin', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:32:53'),
(27, 'Plantas', 7, 'plantas', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:33:13'),
(28, 'Corales', 7, 'corales', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:33:35'),
(29, 'Canister', 10, 'canister', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:34:06'),
(30, 'Motores', 10, 'motores', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:34:30'),
(31, 'Sera', 8, 'sera', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:35:08'),
(32, 'Filtros de esponja', 10, 'filtros-de-esponja', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:35:10'),
(33, 'Compresoras', 10, 'compresoras', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:35:43'),
(34, 'Tropical', 8, 'tropical', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:38:00'),
(35, 'Skimmer', 10, 'skimmer', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:36:22'),
(36, 'Wave Maker', 10, 'wave-maker', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:36:59'),
(37, 'Material de Filtración', 10, 'material-de-filtracion', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:37:54'),
(38, 'Acondicionadores', 10, 'acondicionadores', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:38:34'),
(40, 'Iluminación', 11, 'iluminacion', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:42:04'),
(41, 'Termostatos', 11, 'termostatos', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:42:47'),
(43, 'Rocas para Acuario', 11, 'rocas-para-acuario', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:44:50'),
(44, 'Grava para Acuario', 11, 'grava-para-acuario', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:45:40'),
(45, 'Spectrum', 8, 'spectrum', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:46:18'),
(46, 'Adornos para Acuario', 11, 'adornos-para-acuario', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:46:56'),
(47, 'JBL', 8, 'jbl', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2020-06-19 00:27:25'),
(48, 'Acuarios Boyu', 13, 'acuarios-boyu', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2020-01-16 16:56:33'),
(49, 'Tapas para Acuario', 13, 'tapas-para-acuario', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2020-01-16 16:55:35'),
(50, 'Acuarios Nacionales', 13, 'acuarios-nacionales', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2020-01-16 16:56:58'),
(51, 'Muebles para Acuario', 13, 'muebles-para-acuario', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2020-01-16 16:56:09'),
(52, 'Test de Agua', 11, 'test-de-agua', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-02 02:50:19'),
(54, 'Prodac', 8, 'prodac', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-10 23:02:38'),
(55, 'Bombas de Agua', 10, 'bombas-de-agua', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-17 14:07:40'),
(56, 'Luces UV', 11, 'luces-uv', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-17 14:08:28'),
(57, 'Filtros Sumergibles', 10, 'filtros-sumergibles', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-17 16:14:02'),
(58, 'Sal Marina', 11, 'sal-marina', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2019-10-17 16:18:29'),
(62, 'Peces Marinos', 14, 'peces-marinos', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2020-01-16 17:03:39'),
(63, 'Acuarios y Filtración', 14, 'acuarios-y-filtracion', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2020-02-19 17:51:22'),
(64, 'Mallas', 11, 'mallas', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2020-06-16 05:35:08'),
(65, 'Otros', 11, 'otros', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2020-06-16 05:35:25'),
(66, 'Vitaminas', 8, 'vitaminas', 1, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '2020-06-16 19:28:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `email` text COLLATE utf8_spanish_ci NOT NULL,
  `modo` text COLLATE utf8_spanish_ci NOT NULL,
  `foto` text COLLATE utf8_spanish_ci NOT NULL,
  `verificacion` int(11) NOT NULL,
  `emailEncriptado` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `telefono` text COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `password`, `email`, `modo`, `foto`, `verificacion`, `emailEncriptado`, `fecha`, `telefono`) VALUES
(17, 'carlos', '$2a$07$asxx54ahjppf45sd87a5auRajNP0zeqOkB9Qda.dSiTb2/n.wAC/2', 'jasamik@hotmail.com', 'directo', '', 0, 'dbe7a48717657224963963a2d53ab753', '2020-06-19 02:39:38', '9999999999'),
(24, 'carlos cichlids', 'null', 'carlosciclidosperu@gmail.com', 'google', 'https://lh3.googleusercontent.com/a-/AAuE7mADaYSqYbPIRu0Gzcj9dsUlNYcrgbz7AZQrguL8=s96-c', 0, 'null', '2020-01-30 13:28:15', '953351537'),
(26, 'Aquaria Depot', 'null', 'aquariadepot@gmail.com', 'facebook', 'http://graph.facebook.com/122798279119457/picture?type=large', 0, 'null', '2020-01-30 13:28:15', '953351537'),
(27, 'Carlos Mejia', 'null', 'jasamik123@gmail.com', 'facebook', 'http://graph.facebook.com/1021214248227919/picture?type=large', 0, 'null', '2020-01-30 13:28:15', '953351537'),
(28, 'Mauro Calderon', 'null', 'mauro.esteban.calderon@gmail.com', 'facebook', 'http://graph.facebook.com/10222071921487447/picture?type=large', 0, 'null', '2020-01-30 13:28:15', '953351537'),
(29, 'MauricioMuñozaracena AngelicaMora Caro', 'null', 'angemau2013@gmail.com', 'facebook', 'http://graph.facebook.com/1134234123444623/picture?type=large', 0, 'null', '2020-01-30 13:28:15', '953351537'),
(30, 'Merylin Salvador Vasquez', 'null', 'paloma_1893@hotmail.com', 'facebook', 'http://graph.facebook.com/10220128961635114/picture?type=large', 0, 'null', '2020-01-30 13:28:15', '953351537'),
(32, 'César MARTIN ', '$2a$07$asxx54ahjppf45sd87a5auasoy8R.fxKHTP41dUGR2sEaseGSoW6O', 'cma_sn@hotmail.com', 'directo', '', 0, '575548c14c07a5cfcf042c56039d56d5', '2020-01-30 13:28:15', '953351537'),
(33, 'Jasmine', '$2a$07$asxx54ahjppf45sd87a5auC/awFttqkFmESbyWXz5WBDi1MmdaB6e', 'Burde18038@outlook.com', 'directo', '', 0, '58a4eaba3e40be022bb5fa3f8bc3b558', '2020-01-30 13:28:15', '953351537'),
(34, 'Carlos Cichlids', 'null', 'carloscichlids@gmail.com', 'facebook', 'http://graph.facebook.com/561004118035377/picture?type=large', 0, 'null', '2020-01-30 13:28:15', '953351537'),
(36, 'carlos mejia', 'null', 'carlosmejia1814@gmail.com', 'google', 'https://lh4.googleusercontent.com/--jumLyr0BMU/AAAAAAAAAAI/AAAAAAAAAAA/ACHi3rca38nbKnZ3CwZbDsyI5NGWZDhDQQ/s96-c/photo.jpg', 0, 'null', '2020-01-30 13:28:15', '953351537'),
(37, 'merylin salvador vasquez', 'null', 'paloma.1893@gmail.com', 'google', 'https://lh3.googleusercontent.com/a-/AAuE7mBYsHZIIyvwfHF1tcPvzCj1bY62sBG7iiOpcDm8EQ=s96-c', 0, 'null', '2020-01-30 13:28:15', '953351537'),
(39, 'Alberto Enrique ', '$2a$07$asxx54ahjppf45sd87a5auZCHJ2N39cimJQ/HtfRNV8o1o2FBT3Du', 'kikilloelpoeta@hotmail.com', 'directo', '', 0, '47fa5a5cca25898fe2ba91a8cd12e2b8', '2020-01-30 13:27:29', '953351537'),
(43, 'Alan Rafael De la Cruz Del la Roca', 'null', 'alanrafaeldelacruzdelaroca@gmail.com', 'google', 'https://lh3.googleusercontent.com/a-/AOh14GjnHP4Nu65L5rIv7eBwjjZgSRUw6aNpbLlxbcvh=s96-c', 0, 'null', '2020-03-29 15:31:28', NULL),
(47, 'Lura Bra Sil', 'null', 'lurabrasil01@gmail.com', 'google', 'https://lh4.googleusercontent.com/-kkwhB1Ssi1E/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnnHwXsRHrmGak0fEFvMwkkckcAQQ/s96-c/photo.jpg', 0, 'null', '2020-06-04 18:53:00', NULL),
(48, 'Segundo Villacorta Medina', 'null', 'segundo.villacorta1974@gmail.com', 'google', 'https://lh4.googleusercontent.com/-_BRc7fy48lM/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuckgb1pDT6qGP34pOhsAUTxqgE_tQg/s96-c/photo.jpg', 0, 'null', '2020-06-12 03:47:28', NULL),
(49, 'Marco Antonio Nieto Celis', '$2a$07$asxx54ahjppf45sd87a5auAgCm.KbMGLW1gkRHRs7qsAuNpB0u/3K', 'ma_nc22@hotmail.com', 'directo', '', 0, '4cfb632cd011255971165b38ce4ef5e1', '2020-06-28 21:48:29', '944669910'),
(50, 'poli richard', '$2a$07$asxx54ahjppf45sd87a5auevAtk4xjGnTOBheuu.lLQNnoP8A4Eli', 'rigoze25@hotmail.com', 'directo', '', 0, '124199253e5fdea45dbe48aaee52cb9c', '2020-06-28 23:15:15', '995653916'),
(51, 'Michael Meza La Torre', 'null', 'hmeza.latorre@gmail.com', 'google', 'https://lh3.googleusercontent.com/a-/AOh14GgfjnEDIVC2sd_k5HQem79tlj8G5rE6oaSU-4ES=s96-c', 0, 'null', '2020-07-02 02:13:42', NULL),
(52, 'John R. Sauls', 'null', 'geogatedproject298@gmail.com', 'facebook', 'http://graph.facebook.com/10150085658200692/picture?type=large', 0, 'null', '2020-07-13 03:01:08', NULL),
(53, 'Arkitec Muebles', 'null', 'arkitecmuebles22@gmail.com', 'google', 'https://lh3.googleusercontent.com/a-/AOh14GhN3XyQbD1hzSMd1N9hhZ1r-cg8FlgdhGa0SAql=s96-c', 0, 'null', '2020-07-14 02:35:42', NULL),
(54, 'Henry Malca', 'null', 'henry_hm_79@hotmail.com', 'facebook', 'http://graph.facebook.com/3590530737697675/picture?type=large', 0, 'null', '2020-07-25 23:44:24', NULL),
(55, 'henry malca mesares', '$2a$07$asxx54ahjppf45sd87a5aurrl.NqTcMNTIE6eaKUEnjw7dq4UcXau', 'henry_hm_79@hotmail.com', 'directo', '', 0, '43d393a5711384485aaca27c59e06165', '2020-08-24 05:01:33', '938352149');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitaspaises`
--

CREATE TABLE `visitaspaises` (
  `id` int(11) NOT NULL,
  `pais` text COLLATE utf8_spanish_ci NOT NULL,
  `codigo` text COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `visitaspaises`
--

INSERT INTO `visitaspaises` (`id`, `pais`, `codigo`, `cantidad`, `fecha`) VALUES
(81, 'United States', 'US', 2, '2020-09-03 23:42:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitaspersonas`
--

CREATE TABLE `visitaspersonas` (
  `id` int(11) NOT NULL,
  `ip` text COLLATE utf8_spanish_ci NOT NULL,
  `pais` text COLLATE utf8_spanish_ci NOT NULL,
  `visitas` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `visitaspersonas`
--

INSERT INTO `visitaspersonas` (`id`, `ip`, `pais`, `visitas`, `fecha`) VALUES
(9104, '74.120.14.52', 'United States', 1, '2020-09-03 23:40:52'),
(9105, '216.119.143.50', 'United States', 1, '2020-09-03 23:42:51');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cabeceras`
--
ALTER TABLE `cabeceras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comercio`
--
ALTER TABLE `comercio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `deseos`
--
ALTER TABLE `deseos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plantilla`
--
ALTER TABLE `plantilla`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `visitaspaises`
--
ALTER TABLE `visitaspaises`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `visitaspersonas`
--
ALTER TABLE `visitaspersonas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `cabeceras`
--
ALTER TABLE `cabeceras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `comercio`
--
ALTER TABLE `comercio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `deseos`
--
ALTER TABLE `deseos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `plantilla`
--
ALTER TABLE `plantilla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT de la tabla `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=747;

--
-- AUTO_INCREMENT de la tabla `visitaspaises`
--
ALTER TABLE `visitaspaises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de la tabla `visitaspersonas`
--
ALTER TABLE `visitaspersonas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9106;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
