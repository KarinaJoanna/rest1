-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 27-12-2022 a las 04:09:23
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `VIDEOTECA`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actor`
--

CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellidos` varchar(64) NOT NULL,
  `imdb` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actor`
--

INSERT INTO `actor` (`id`, `nombre`, `apellidos`, `imdb`) VALUES
(1, 'Harrison', 'Ford', 'nm0000148'),
(2, 'Russell', 'Crowe', 'nm0000128'),
(3, 'Lee', 'Marvin', 'nm0001511'),
(4, 'Clint', 'Eastwood', 'nm0000142'),
(5, 'Jean', 'Seberg', 'nm0781029'),
(6, 'Bruce', 'Dern', 'nm0001136'),
(7, 'Bruce', 'Boxleitner', 'nm0000310'),
(8, 'Rutger', ' Hauer', 'nm0000442'),
(9, 'Sean', 'Young', 'nm0000707'),
(10, 'Matthew', 'McConaughey', 'nm0000190');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actores_por_pelicula`
--

CREATE TABLE `actores_por_pelicula` (
  `idpelicula` int(11) NOT NULL,
  `idactor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actores_por_pelicula`
--

INSERT INTO `actores_por_pelicula` (`idpelicula`, `idactor`) VALUES
(1, 1),
(2, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `director`
--

CREATE TABLE `director` (
  `id` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellidos` varchar(64) NOT NULL,
  `imdb` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `director`
--

INSERT INTO `director` (`id`, `nombre`, `apellidos`, `imdb`) VALUES
(1, 'Ridley', 'Scott', 'nm0000631'),
(2, 'Mike', 'Nichols', 'nm0001566'),
(3, 'Robert', 'Zemekis', 'nm0000709'),
(4, 'Douglas', 'Trumbull', 'nm0874320');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directores_por_pelicula`
--

CREATE TABLE `directores_por_pelicula` (
  `idpelicula` int(11) NOT NULL,
  `iddirector` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `directores_por_pelicula`
--

INSERT INTO `directores_por_pelicula` (`idpelicula`, `iddirector`) VALUES
(1, 1),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `nombre` varchar(2) NOT NULL,
  `descripcion` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `nombre`, `descripcion`) VALUES
(1, 'CF', 'Ciencia Ficcion'),
(2, 'A', 'Aventuras'),
(3, 'D', 'Drama'),
(4, 'C', 'Comedia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `id` int(11) NOT NULL,
  `titulo` varchar(80) NOT NULL,
  `idsoporte` int(11) NOT NULL,
  `idgenero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id`, `titulo`, `idsoporte`, `idgenero`) VALUES
(1, 'Blade Runner', 1, 1),
(2, 'Gladiator', 1, 2),
(3, 'A proposito de Henry', 2, 3),
(4, 'Naves misteriosas', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soporte`
--

CREATE TABLE `soporte` (
  `id` int(11) NOT NULL,
  `nombre` varchar(3) NOT NULL,
  `descripcion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `soporte`
--

INSERT INTO `soporte` (`id`, `nombre`, `descripcion`) VALUES
(1, 'DVD', 'Digital Versatile Disc'),
(2, 'VHS', 'Video Home System'),
(3, 'LD', 'Laser Disc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `apellido` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `login` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `pwd` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `rol` varchar(45) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido`, `login`, `pwd`, `rol`) VALUES
(1, 'Juan', 'Pérez', 'juanp', 'juanp', 'administrador'),
(2, 'María', 'Flores', 'mariaf', 'mariaf', 'usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `actores_por_pelicula`
--
ALTER TABLE `actores_por_pelicula`
  ADD PRIMARY KEY (`idpelicula`,`idactor`),
  ADD KEY `app_FK1` (`idpelicula`),
  ADD KEY `app_FK2` (`idactor`);

--
-- Indices de la tabla `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `directores_por_pelicula`
--
ALTER TABLE `directores_por_pelicula`
  ADD PRIMARY KEY (`idpelicula`,`iddirector`),
  ADD KEY `dpp_FK1` (`idpelicula`),
  ADD KEY `dpp_FK2` (`iddirector`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_FK1` (`idsoporte`),
  ADD KEY `p_FK2` (`idgenero`);

--
-- Indices de la tabla `soporte`
--
ALTER TABLE `soporte`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actor`
--
ALTER TABLE `actor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `director`
--
ALTER TABLE `director`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `soporte`
--
ALTER TABLE `soporte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actores_por_pelicula`
--
ALTER TABLE `actores_por_pelicula`
  ADD CONSTRAINT `actores_por_pelicula_ibfk_1` FOREIGN KEY (`idpelicula`) REFERENCES `pelicula` (`id`),
  ADD CONSTRAINT `actores_por_pelicula_ibfk_2` FOREIGN KEY (`idactor`) REFERENCES `actor` (`id`);

--
-- Filtros para la tabla `directores_por_pelicula`
--
ALTER TABLE `directores_por_pelicula`
  ADD CONSTRAINT `directores_por_pelicula_ibfk_1` FOREIGN KEY (`idpelicula`) REFERENCES `pelicula` (`id`),
  ADD CONSTRAINT `directores_por_pelicula_ibfk_2` FOREIGN KEY (`iddirector`) REFERENCES `director` (`id`);

--
-- Filtros para la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD CONSTRAINT `pelicula_ibfk_1` FOREIGN KEY (`idsoporte`) REFERENCES `soporte` (`id`),
  ADD CONSTRAINT `pelicula_ibfk_2` FOREIGN KEY (`idgenero`) REFERENCES `genero` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
