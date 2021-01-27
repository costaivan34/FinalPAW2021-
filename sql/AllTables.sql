-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-01-2020 a las 21:57:48
-- Versión del servidor: 10.1.39-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE SCHEMA foodapp;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `foodapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicaplato`
--
USE foodapp;
CREATE TABLE `caracteristicaplato` (
  `idCaracteristica` int(30) NOT NULL,
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(60) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicasitio`
--
USE foodapp;
CREATE TABLE `caracteristicasitio` (
  `idCaracteristica` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(60) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



--
-- Estructura de tabla para la tabla `comentariositio`
--
USE foodapp;
CREATE TABLE `comentariositio` (
  `idComentario` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `descripcion` int(11) NOT NULL,
  `valoracionServicio` int(11) NOT NULL,
  `valoracionPrecio` int(11) NOT NULL,
  `valoracionAmbiente` int(11) NOT NULL,
  `fecha` DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--
USE foodapp;
CREATE TABLE `horario` (
  `idHorario` int(11) NOT NULL,
  `dia` text COLLATE latin1_spanish_ci NOT NULL,
  `horaInicio` TIME NOT NULL,
  `horaFin` TIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenesplatos`
--
USE foodapp;
CREATE TABLE `imagenesplatos` (
  `idImagen` int(11) NOT NULL,
  `idPlato` int(11) NOT NULL,
  `nombre` text COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` text COLLATE latin1_spanish_ci NOT NULL,
  `datos` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenessitio`
--
USE foodapp;
CREATE TABLE `imagenessitio` (
  `idImagen` int(11) NOT NULL,
  `idSitio` int(11) NOT NULL,
  `nombre` text COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` text COLLATE latin1_spanish_ci NOT NULL,
  `datos` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infonutricional`
--
USE foodapp;
CREATE TABLE `infonutricional` (
  `idInfo` int(11) NOT NULL,
  `nombre` text COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



--
-- Estructura de tabla para la tabla `itemsitio`
--
USE foodapp;
CREATE TABLE `itemsitio` (
  `idItem` int(11) NOT NULL,
  `idSitio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listacaractplato`
--
USE foodapp;
CREATE TABLE `listacaractplato` (
  `idListaCaract` int(11) NOT NULL,
  `idCaract` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listacaractsitio`
--
USE foodapp;
CREATE TABLE `listacaractsitio` (
  `idListaCaract` int(11) NOT NULL,
  `idCaract` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listacomentsitios`
--
USE foodapp;
CREATE TABLE `listacomentsitios` (
  `idLista` int(11) NOT NULL,
  `idComent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listahorario`
--
USE foodapp;
CREATE TABLE `listahorario` (
  `idListaH` int(11) NOT NULL,
  `idHorario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listainfo`
--
USE foodapp;
CREATE TABLE `listainfo` (
  `idListaInfo` int(11) NOT NULL,
  `idValor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listamediospagos`
--
USE foodapp;
CREATE TABLE `listamediospagos` (
  `idListaPagos` int(11) NOT NULL,
  `idMedio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listasitiosfav`
--
USE foodapp;
CREATE TABLE `listasitiosfav` (
  `idLista` int(11) NOT NULL,
  `idItem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mediospago`
--
USE foodapp;
CREATE TABLE `mediospago` (
  `idMedio` int(11) NOT NULL,
  `nombre` text COLLATE latin1_spanish_ci NOT NULL,
  `coutas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--
USE foodapp;
CREATE TABLE `plato` (
  `idPlato` int(11) NOT NULL,
  `nombre` text COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` text COLLATE latin1_spanish_ci NOT NULL,
  `precio` text COLLATE latin1_spanish_ci NOT NULL,
  `idSitio` int(11) NOT NULL,
  `idListaInfo` int(11) NOT NULL,
  `idListaCarac` int(11) NOT NULL,
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sitio`
--
USE foodapp;
CREATE TABLE `sitio` (
  `idSitio` int(11) NOT NULL,
  `nombre` text COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` text COLLATE latin1_spanish_ci NOT NULL,
  `telefono` text COLLATE latin1_spanish_ci NOT NULL,
  `sitioWeb` text COLLATE latin1_spanish_ci NOT NULL,
  `valoracionPrecio` int(11) NOT NULL,
  `valoracionAmbiente` int(11) NOT NULL,
  `valoracionServicio` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idlistaHorario` int(11) NOT NULL,
  `idListaPago` int(11) NOT NULL,
  `idUbicacion` int(11) NOT NULL,
  `idListaCarac` int(11) NOT NULL,
  `idListaComent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--
USE foodapp;
CREATE TABLE `ubicacion` (
  `idUbicacion` int(11) NOT NULL,
  `direccion` text COLLATE latin1_spanish_ci NOT NULL,
  `ciudad` text COLLATE latin1_spanish_ci NOT NULL,
  `provincia` text COLLATE latin1_spanish_ci NOT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--
USE foodapp;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `mail`VARCHAR(60) COLLATE latin1_spanish_ci NOT NULL,
  `alias` text COLLATE latin1_spanish_ci NOT NULL,
  `nombre` text COLLATE latin1_spanish_ci NOT NULL,
  `apellido` text COLLATE latin1_spanish_ci NOT NULL,
  `direccion` text COLLATE latin1_spanish_ci NOT NULL,
  `password` text COLLATE latin1_spanish_ci NOT NULL,
  `fotoPerfil` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valornutricional`
--
USE foodapp;
CREATE TABLE `valornutricional` (
  `idValor` int(11) NOT NULL,
  `idInfo` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caracteristicaplato`
--
ALTER TABLE `caracteristicaplato`
  ADD PRIMARY KEY (`idCaracteristica`);

--
-- Indices de la tabla `caracteristicasitio`
--
ALTER TABLE `caracteristicasitio`
  ADD PRIMARY KEY (`idCaracteristica`);


--
-- Indices de la tabla `comentariositio`
--
ALTER TABLE `comentariositio`
  ADD PRIMARY KEY (`idComentario`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`idHorario`);

--
-- Indices de la tabla `imagenesplatos`
--
ALTER TABLE `imagenesplatos`
  ADD PRIMARY KEY (`idImagen`),
  ADD KEY `idPlato` (`idPlato`);

--
-- Indices de la tabla `imagenessitio`
--
ALTER TABLE `imagenessitio`
  ADD PRIMARY KEY (`idImagen`),
  ADD KEY `idSitio` (`idSitio`);

--
-- Indices de la tabla `infonutricional`
--
ALTER TABLE `infonutricional`
  ADD PRIMARY KEY (`idInfo`);


--
-- Indices de la tabla `itemsitio`
--
ALTER TABLE `itemsitio`
  ADD PRIMARY KEY (`idItem`,`idSitio`),
  ADD KEY `idSitio` (`idSitio`);

--
-- Indices de la tabla `listacaractplato`
--
ALTER TABLE `listacaractplato`
  ADD PRIMARY KEY (`idListaCaract`,`idCaract`),
  ADD KEY `idCaract` (`idCaract`);

--
-- Indices de la tabla `listacaractsitio`
--
ALTER TABLE `listacaractsitio`
  ADD PRIMARY KEY (`idListaCaract`) USING BTREE;


--
-- Indices de la tabla `listacomentsitios`
--
ALTER TABLE `listacomentsitios`
  ADD PRIMARY KEY (`idLista`,`idComent`),
  ADD KEY `idComent` (`idComent`);

--
-- Indices de la tabla `listahorario`
--
ALTER TABLE `listahorario`
  ADD PRIMARY KEY (`idListaH`,`idHorario`),
  ADD KEY `idHorario` (`idHorario`);

--
-- Indices de la tabla `listainfo`
--
ALTER TABLE `listainfo`
  ADD PRIMARY KEY (`idListaInfo`,`idValor`),
  ADD KEY `idValor` (`idValor`);

--
-- Indices de la tabla `listamediospagos`
--
ALTER TABLE `listamediospagos`
  ADD PRIMARY KEY (`idListaPagos`,`idMedio`),
  ADD KEY `idMedio` (`idMedio`);

--
-- Indices de la tabla `listaplatosfav`
--
ALTER TABLE `listaplatosfav`
  ADD PRIMARY KEY (`idLista`,`idItem`),
  ADD KEY `idItem` (`idItem`);

--
-- Indices de la tabla `listasitiosfav`
--
ALTER TABLE `listasitiosfav`
  ADD PRIMARY KEY (`idLista`,`idItem`),
  ADD KEY `idItem` (`idItem`);

--
-- Indices de la tabla `mediospago`
--
ALTER TABLE `mediospago`
  ADD PRIMARY KEY (`idMedio`);

--
-- Indices de la tabla `plato`
--
ALTER TABLE `plato`
  ADD PRIMARY KEY (`idPlato`),
  ADD KEY `idSitio` (`idSitio`),
  ADD KEY `idListaInfo` (`idListaInfo`),
  ADD KEY `idListaCarac` (`idListaCarac`),


--
-- Indices de la tabla `sitio`
--
ALTER TABLE `sitio`
  ADD PRIMARY KEY (`idSitio`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idlistaHorario` (`idlistaHorario`),
  ADD KEY `idListaPago` (`idListaPago`),
  ADD KEY `idUbicacion` (`idUbicacion`),
  ADD KEY `idListaCarac` (`idListaCarac`),
  ADD KEY `idListaComent` (`idListaComent`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`idUbicacion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`,`mail`);

--
-- Indices de la tabla `valornutricional`
--
ALTER TABLE `valornutricional`
  ADD PRIMARY KEY (`idValor`,`idInfo`),
  ADD KEY `idInfo` (`idInfo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caracteristicasitio`
--
ALTER TABLE `caracteristicasitio`
  MODIFY `idCaracteristica` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;


--
-- AUTO_INCREMENT de la tabla `comentariositio`
--
ALTER TABLE `comentariositio`
  MODIFY `idComentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `idHorario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenesplatos`
--
ALTER TABLE `imagenesplatos`
  MODIFY `idImagen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenessitio`
--
ALTER TABLE `imagenessitio`
  MODIFY `idImagen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `infonutricional`
--
ALTER TABLE `infonutricional`
  MODIFY `idInfo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `itemplato`
--
ALTER TABLE `itemplato`
  MODIFY `idItem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `itemsitio`
--
ALTER TABLE `itemsitio`
  MODIFY `idItem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `listacaractplato`
--
ALTER TABLE `listacaractplato`
  MODIFY `idListaCaract` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `listacaractsitio`
--
ALTER TABLE `listacaractsitio`
  MODIFY `idListaCaract` int(11) NOT NULL AUTO_INCREMENT;

x

--
-- AUTO_INCREMENT de la tabla `listacomentsitios`
--
ALTER TABLE `listacomentsitios`
  MODIFY `idLista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `listahorario`
--
ALTER TABLE `listahorario`
  MODIFY `idListaH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `listainfo`
--
ALTER TABLE `listainfo`
  MODIFY `idListaInfo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `listamediospagos`
--
ALTER TABLE `listamediospagos`
  MODIFY `idListaPagos` int(11) NOT NULL AUTO_INCREMENT;


--
-- AUTO_INCREMENT de la tabla `listasitiosfav`
--
ALTER TABLE `listasitiosfav`
  MODIFY `idLista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mediospago`
--
ALTER TABLE `mediospago`
  MODIFY `idMedio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plato`
--
ALTER TABLE `plato`
  MODIFY `idPlato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sitio`
--
ALTER TABLE `sitio`
  MODIFY `idSitio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `idUbicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `valornutricional`
--
ALTER TABLE `valornutricional`
  MODIFY `idValor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarioplato`
--


--
-- Filtros para la tabla `comentariositio`
--
ALTER TABLE `comentariositio`
  ADD CONSTRAINT `comentariositio_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `imagenesplatos`
--
ALTER TABLE `imagenesplatos`
  ADD CONSTRAINT `imagenesplatos_ibfk_1` FOREIGN KEY (`idPlato`) REFERENCES `plato` (`idPlato`);

--
-- Filtros para la tabla `imagenessitio`
--
ALTER TABLE `imagenessitio`
  ADD CONSTRAINT `imagenessitio_ibfk_1` FOREIGN KEY (`idSitio`) REFERENCES `sitio` (`idSitio`);

--
-- Filtros para la tabla `itemplato`
--
ALTER TABLE `itemplato`
  ADD CONSTRAINT `itemplato_ibfk_1` FOREIGN KEY (`idPlato`) REFERENCES `plato` (`idPlato`);

--
-- Filtros para la tabla `itemsitio`
--
ALTER TABLE `itemsitio`
  ADD CONSTRAINT `itemsitio_ibfk_1` FOREIGN KEY (`idSitio`) REFERENCES `sitio` (`idSitio`);

--
-- Filtros para la tabla `listacaractplato`
--
ALTER TABLE `listacaractplato`
  ADD CONSTRAINT `listacaractplato_ibfk_1` FOREIGN KEY (`idCaract`) REFERENCES `caracteristicaplato` (`idCaracteristica`);


--
-- Filtros para la tabla `listacomentsitios`
--
ALTER TABLE `listacomentsitios`
  ADD CONSTRAINT `listacomentsitios_ibfk_1` FOREIGN KEY (`idComent`) REFERENCES `comentariositio` (`idComentario`);

--
-- Filtros para la tabla `listahorario`
--
ALTER TABLE `listahorario`
  ADD CONSTRAINT `listahorario_ibfk_1` FOREIGN KEY (`idHorario`) REFERENCES `horario` (`idHorario`);

--
-- Filtros para la tabla `listainfo`
--
ALTER TABLE `listainfo`
  ADD CONSTRAINT `listainfo_ibfk_1` FOREIGN KEY (`idValor`) REFERENCES `valornutricional` (`idValor`);

--
-- Filtros para la tabla `listamediospagos`
--
ALTER TABLE `listamediospagos`
  ADD CONSTRAINT `listamediospagos_ibfk_1` FOREIGN KEY (`idMedio`) REFERENCES `mediospago` (`idMedio`);


--
-- Filtros para la tabla `listasitiosfav`
--
ALTER TABLE `listasitiosfav`
  ADD CONSTRAINT `listasitiosfav_ibfk_1` FOREIGN KEY (`idItem`) REFERENCES `itemsitio` (`idItem`);

--
-- Filtros para la tabla `plato`
--
ALTER TABLE `plato`
  ADD CONSTRAINT `plato_ibfk_1` FOREIGN KEY (`idSitio`) REFERENCES `sitio` (`idSitio`),
  ADD CONSTRAINT `plato_ibfk_3` FOREIGN KEY (`idListaInfo`) REFERENCES `listainfo` (`idListaInfo`),
  ADD CONSTRAINT `plato_ibfk_4` FOREIGN KEY (`idListaCarac`) REFERENCES `listacaractplato` (`idListaCaract`),


--
-- Filtros para la tabla `sitio`
--
ALTER TABLE `sitio`
  ADD CONSTRAINT `sitio_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `sitio_ibfk_2` FOREIGN KEY (`idlistaHorario`) REFERENCES `listahorario` (`idListaH`),
  ADD CONSTRAINT `sitio_ibfk_3` FOREIGN KEY (`idListaPago`) REFERENCES `listamediospagos` (`idListaPagos`),
  ADD CONSTRAINT `sitio_ibfk_4` FOREIGN KEY (`idUbicacion`) REFERENCES `ubicacion` (`idUbicacion`),
  ADD CONSTRAINT `sitio_ibfk_5` FOREIGN KEY (`idListaCarac`) REFERENCES `listacaractsitio` (`idListaCaract`),
  ADD CONSTRAINT `sitio_ibfk_6` FOREIGN KEY (`idListaComent`) REFERENCES `listacomentsitios` (`idLista`);


--
-- Filtros para la tabla `valornutricional`
--
ALTER TABLE `valornutricional`
  ADD CONSTRAINT `valornutricional_ibfk_1` FOREIGN KEY (`idInfo`) REFERENCES `infonutricional` (`idInfo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
