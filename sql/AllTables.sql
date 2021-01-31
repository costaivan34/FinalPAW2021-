-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-01-2021 a las 01:06:02
-- Versión del servidor: 10.1.39-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


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

CREATE TABLE `caracteristicaplato` (
  `idCaracteristica` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `caracteristicaplato`
--

INSERT INTO `caracteristicaplato` (`idCaracteristica`, `nombre`, `descripcion`) VALUES
(1, 'Gluten', 'El plato contiene gluten y/o derivados'),
(2, 'Picante', 'El plato contiene picante'),
(3, 'Vegano', 'El plato es apto para veganos'),
(4, 'Azucar', 'El plato tiene alto contenido de azucar'),
(5, 'Sal', 'El plato tiene alto contenido de sodio'),
(7, 'Lacteos', 'El plato contiene lacteos y/o derivados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicasitio`
--

CREATE TABLE `caracteristicasitio` (
  `idCaracteristica` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `caracteristicasitio`
--

INSERT INTO `caracteristicasitio` (`idCaracteristica`, `nombre`, `descripcion`) VALUES
(1, 'wifi', 'Si el local tiene wifi'),
(2, 'wheelchair', 'Si el local es accesible'),
(3, 'aireacondicionado', 'Si el local tiene aire acondicionado'),
(4, 'estacionamiento', 'Si el local tiene estacionamiento'),
(5, 'tv', 'Si el local tiene tv'),
(6, 'niños', 'Si el local tiene juegos para niños');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentariositios`
--

CREATE TABLE `comentariositios` (
  `idComentario` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` datetime NOT NULL,
  `valoracionSabor` int(11) NOT NULL,
  `valoracionPrecio` int(11) NOT NULL,
  `valoracionAmbiente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `idHorario` int(11) NOT NULL,
  `idSitio` int(11) NOT NULL,
  `idDia` int(11) NOT NULL,
  `HDesde` int(11) NOT NULL,
  `HHasta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`idHorario`, `idSitio`, `idDia`, `HDesde`, `HHasta`) VALUES
(1, 1, 5, 19, 23),
(2, 1, 6, 19, 23),
(3, 1, 8, 11, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenesplatos`
--

CREATE TABLE `imagenesplatos` (
  `idImagen` int(11) NOT NULL,
  `idPlato` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenessitios`
--

CREATE TABLE `imagenessitios` (
  `idImagen` int(11) NOT NULL,
  `idSitio` int(11) NOT NULL,
  `path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imagenessitios`
--

INSERT INTO `imagenessitios` (`idImagen`, `idSitio`, `path`) VALUES
(1, 1, '/private/1/1.jpg'),
(2, 1, '/private/1/2.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infonutricional`
--

CREATE TABLE `infonutricional` (
  `idInfo` int(11) NOT NULL,
  `nombre` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `infonutricional`
--

INSERT INTO `infonutricional` (`idInfo`, `nombre`) VALUES
(1, 'Peso'),
(2, 'Energia'),
(3, 'Carbohidratos'),
(4, 'Proteina'),
(5, 'Grasas'),
(6, 'Sodio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listacaractplato`
--

CREATE TABLE `listacaractplato` (
  `idListaCaract` int(11) NOT NULL,
  `idPlato` int(11) NOT NULL,
  `idCaract` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listacaractsitio`
--

CREATE TABLE `listacaractsitio` (
  `idListaCaract` int(11) NOT NULL,
  `idSitio` int(11) NOT NULL,
  `idCaract` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listacomentsitios`
--

CREATE TABLE `listacomentsitios` (
  `idLista` int(11) NOT NULL,
  `idSitio` int(11) NOT NULL,
  `idComent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platos`
--

CREATE TABLE `platos` (
  `idPlato` int(11) NOT NULL,
  `nombre` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `precio` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `idSitio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semanasdias`
--

CREATE TABLE `semanasdias` (
  `idDia` int(11) NOT NULL,
  `nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `semanasdias`
--

INSERT INTO `semanasdias` (`idDia`, `nombre`) VALUES
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miercoles'),
(4, 'Jueves'),
(5, 'Viernes'),
(6, 'Sabado'),
(8, 'Domingo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sitios`
--

CREATE TABLE `sitios` (
  `idSitio` int(11) NOT NULL,
  `nombre` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8 NOT NULL,
  `telefono` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `sitioWeb` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `valoracionPrecio` int(11) NOT NULL,
  `valoracionAmbiente` int(11) NOT NULL,
  `valoracionSabor` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sitios`
--

INSERT INTO `sitios` (`idSitio`, `nombre`, `descripcion`, `telefono`, `sitioWeb`, `valoracionPrecio`, `valoracionAmbiente`, `valoracionSabor`, `idUsuario`) VALUES
(1, 'La Protegida', 'Durante el siglo XIX, los vecinos de Navarro contaban con varios servicos de diligencias que unía a éste con la gran aldea de Buenos Aires y con pueblo y parajes vecinos. En épocas en que los caminos eran sólo huellas, aquellas diligencias sirvieron al transporte de correspondencia, encomiendas y pasajeros, convirtiéndose en indispensables actores de desarrollo para los incipientes vecindarios afincados en el medio de la inhóspita pampa. \"LA PROTEGIDA\" era una de aquellas compañias de diligencias, que en el siglo XIX trasnportaba sus cargas desde Buenos Aires a Navarro...\r\n...Ya avanzado el siglo XX , a principios de la década del \'70, en la ciudad de Navarro cerraba definitivamente el almacén de ramos generales del \"Turco Emilio\".\r\nEste señero almacén, fundado en 1926 por el inmigrante sirio-libanés Abdul \"Emilio\" Mustafá, había cumplido un importante ciclo en la historia comercial de la comunidad, pero superado por nuevos pautas económicas cesó en su actividad, alquilando su edificio para sucesivos y diferentes emprendimientos comerciales....\r\n...Coincidente con ese tiempo, un joven de -por entonces- 15 años, comienzó a interesarse por objetos antiguos y artículos de viejos almacenes y pulpería de su pueblo; iniciando así, una colección que perdura hasta estos días. Hoy, estas tres historias independientes se conjugan y de la fusión de aquel viejo edificio del almacén del \"Turco\" Emilio más la copiosa colección lograda en más de 35 años por aquel jóven y el nombre de aquella legendaria diligencia surge a nosotros el \"Almacén Museo LA PROTEGIDA\" como un símbolo de buena combinación de Turismo, Gastronomía y Cultura regional.', '+549 2324 580678 ', 'consultas@laprotegida.com', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `idUbicacion` int(11) NOT NULL,
  `idSitio` int(11) NOT NULL,
  `direccion` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `ciudad` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `provincia` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `X` text NOT NULL,
  `Y` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`idUbicacion`, `idSitio`, `direccion`, `ciudad`, `provincia`, `X`, `Y`) VALUES
(1, 1, 'Calle 19 esquina 30', 'Navarro ', 'Buenos Aires', '20', '30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `mail` varchar(60) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `nombre` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `apellido` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `direccion` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `password` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `fotoPerfil` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `mail`, `nombre`, `apellido`, `direccion`, `password`, `fotoPerfil`) VALUES
(1, 'costaivan34@gmail.com', 'Iván', 'Costa', 'Calle 123, enmicasa', '1234', '/private/usuarios/1/perfil.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valornutricional`
--

CREATE TABLE `valornutricional` (
  `idValor` int(11) NOT NULL,
  `idPlato` int(11) NOT NULL,
  `idInfo` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indices de la tabla `comentariositios`
--
ALTER TABLE `comentariositios`
  ADD PRIMARY KEY (`idComentario`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`idHorario`,`idSitio`),
  ADD KEY `idPlato` (`idSitio`),
  ADD KEY `horario_ibfk_2` (`idDia`);

--
-- Indices de la tabla `imagenesplatos`
--
ALTER TABLE `imagenesplatos`
  ADD PRIMARY KEY (`idImagen`,`idPlato`),
  ADD KEY `idPlato` (`idPlato`);

--
-- Indices de la tabla `imagenessitios`
--
ALTER TABLE `imagenessitios`
  ADD PRIMARY KEY (`idImagen`,`idSitio`),
  ADD KEY `idSitio` (`idSitio`);

--
-- Indices de la tabla `infonutricional`
--
ALTER TABLE `infonutricional`
  ADD PRIMARY KEY (`idInfo`);

--
-- Indices de la tabla `listacaractplato`
--
ALTER TABLE `listacaractplato`
  ADD PRIMARY KEY (`idListaCaract`,`idPlato`),
  ADD KEY `idPlato` (`idPlato`);

--
-- Indices de la tabla `listacaractsitio`
--
ALTER TABLE `listacaractsitio`
  ADD PRIMARY KEY (`idListaCaract`,`idSitio`),
  ADD KEY `idSitio` (`idSitio`);

--
-- Indices de la tabla `listacomentsitios`
--
ALTER TABLE `listacomentsitios`
  ADD PRIMARY KEY (`idLista`,`idSitio`),
  ADD KEY `idSitio` (`idSitio`),
  ADD KEY `listacomentsitios_ibfk_1` (`idComent`);

--
-- Indices de la tabla `platos`
--
ALTER TABLE `platos`
  ADD PRIMARY KEY (`idPlato`),
  ADD KEY `idSitio` (`idSitio`);

--
-- Indices de la tabla `semanasdias`
--
ALTER TABLE `semanasdias`
  ADD PRIMARY KEY (`idDia`);

--
-- Indices de la tabla `sitios`
--
ALTER TABLE `sitios`
  ADD PRIMARY KEY (`idSitio`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`idUbicacion`,`idSitio`),
  ADD KEY `idSitio` (`idSitio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`,`mail`);

--
-- Indices de la tabla `valornutricional`
--
ALTER TABLE `valornutricional`
  ADD PRIMARY KEY (`idValor`,`idPlato`),
  ADD KEY `idPlato` (`idPlato`),
  ADD KEY `valornutricional_ibfk_1` (`idInfo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caracteristicaplato`
--
ALTER TABLE `caracteristicaplato`
  MODIFY `idCaracteristica` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `caracteristicasitio`
--
ALTER TABLE `caracteristicasitio`
  MODIFY `idCaracteristica` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `comentariositios`
--
ALTER TABLE `comentariositios`
  MODIFY `idComentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `infonutricional`
--
ALTER TABLE `infonutricional`
  MODIFY `idInfo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `platos`
--
ALTER TABLE `platos`
  MODIFY `idPlato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `semanasdias`
--
ALTER TABLE `semanasdias`
  MODIFY `idDia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `sitios`
--
ALTER TABLE `sitios`
  MODIFY `idSitio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `idUbicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `valornutricional`
--
ALTER TABLE `valornutricional`
  MODIFY `idValor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`idSitio`) REFERENCES `sitios` (`idSitio`),
  ADD CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`idDia`) REFERENCES `semanasdias` (`idDia`);

--
-- Filtros para la tabla `imagenesplatos`
--
ALTER TABLE `imagenesplatos`
  ADD CONSTRAINT `imagenesplatos_ibfk_1` FOREIGN KEY (`idPlato`) REFERENCES `platos` (`idPlato`);

--
-- Filtros para la tabla `imagenessitios`
--
ALTER TABLE `imagenessitios`
  ADD CONSTRAINT `imagenessitios_ibfk_1` FOREIGN KEY (`idSitio`) REFERENCES `sitios` (`idSitio`);

--
-- Filtros para la tabla `listacaractplato`
--
ALTER TABLE `listacaractplato`
  ADD CONSTRAINT `listacaractplato_ibfk_2` FOREIGN KEY (`idPlato`) REFERENCES `platos` (`idPlato`);

--
-- Filtros para la tabla `listacaractsitio`
--
ALTER TABLE `listacaractsitio`
  ADD CONSTRAINT `listacaractsitio_ibfk_2` FOREIGN KEY (`idSitio`) REFERENCES `sitios` (`idSitio`);

--
-- Filtros para la tabla `listacomentsitios`
--
ALTER TABLE `listacomentsitios`
  ADD CONSTRAINT `listacomentsitios_ibfk_1` FOREIGN KEY (`idComent`) REFERENCES `comentariositios` (`idComentario`),
  ADD CONSTRAINT `listacomentsitios_ibfk_2` FOREIGN KEY (`idSitio`) REFERENCES `sitios` (`idSitio`);

--
-- Filtros para la tabla `platos`
--
ALTER TABLE `platos`
  ADD CONSTRAINT `platos_ibfk_1` FOREIGN KEY (`idSitio`) REFERENCES `sitios` (`idSitio`);

--
-- Filtros para la tabla `sitios`
--
ALTER TABLE `sitios`
  ADD CONSTRAINT `sitios_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD CONSTRAINT `Ubicacion_ibfk_1` FOREIGN KEY (`idSitio`) REFERENCES `sitios` (`idSitio`);

--
-- Filtros para la tabla `valornutricional`
--
ALTER TABLE `valornutricional`
  ADD CONSTRAINT `valornutricional_ibfk_1` FOREIGN KEY (`idInfo`) REFERENCES `infonutricional` (`idInfo`),
  ADD CONSTRAINT `valornutricional_ibfk_2` FOREIGN KEY (`idPlato`) REFERENCES `platos` (`idPlato`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
