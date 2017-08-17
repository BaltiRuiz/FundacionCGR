-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 17, 2017 at 10:33 PM
-- Server version: 10.1.20-MariaDB
-- PHP Version: 7.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DGP`
--

-- --------------------------------------------------------

--
-- Table structure for table `Administradores`
--

CREATE TABLE `Administradores` (
  `dni` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Asistencia_Asiste_Pedida`
--

CREATE TABLE `Asistencia_Asiste_Pedida` (
  `#asistencia` int(16) NOT NULL,
  `#recurso` int(16) NOT NULL,
  `hora_asistencia` time DEFAULT NULL,
  `fecha_asistencia` date DEFAULT NULL,
  `dni` varchar(9) DEFAULT NULL,
  `fecha_peticion` date DEFAULT NULL,
  `hora_peticion` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Asistentes`
--

CREATE TABLE `Asistentes` (
  `dni` varchar(9) NOT NULL,
  `estado_actividad` varchar(15) NOT NULL,
  `id_telegram` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Compuesta`
--

CREATE TABLE `Compuesta` (
  `#recurso` int(16) NOT NULL,
  `#guia` int(16) NOT NULL,
  `prioridad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Contenido_Formado`
--

CREATE TABLE `Contenido_Formado` (
  `#contenido` int(16) NOT NULL,
  `#idioma` int(11) NOT NULL,
  `#recurso` int(16) NOT NULL,
  `nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Datos_Museo`
--

CREATE TABLE `Datos_Museo` (
  `nombre_museo` varchar(80) NOT NULL,
  `CIF` varchar(20) NOT NULL,
  `correo` varchar(80) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Equipamiento_Contiene`
--

CREATE TABLE `Equipamiento_Contiene` (
  `#equipamiento` int(16) NOT NULL,
  `ubicacion` text NOT NULL,
  `n_sala` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `proveedor` text,
  `img` text NOT NULL,
  `desc_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Guia`
--

CREATE TABLE `Guia` (
  `#guia` int(16) NOT NULL,
  `nombre_guia` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `GuiasPersonalizadas`
--

CREATE TABLE `GuiasPersonalizadas` (
  `#guias` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `GuiasPredefinidas`
--

CREATE TABLE `GuiasPredefinidas` (
  `#guia` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Idioma`
--

CREATE TABLE `Idioma` (
  `#idioma` int(11) NOT NULL,
  `codigo_idioma` varchar(3) NOT NULL,
  `nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Multimedia`
--

CREATE TABLE `Multimedia` (
  `#contenido` int(16) NOT NULL,
  `formato` varchar(20) NOT NULL,
  `url` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Personal`
--

CREATE TABLE `Personal` (
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(120) DEFAULT NULL,
  `direccion` varchar(120) DEFAULT NULL,
  `password` text NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `token_personal` varchar(80) DEFAULT NULL,
  `telefono` int(9) DEFAULT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Recursos_Tiene`
--

CREATE TABLE `Recursos_Tiene` (
  `#recurso` int(16) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `codigo_qr` int(16) NOT NULL,
  `nombre` text NOT NULL,
  `ultima_fecha_modificacion` date DEFAULT NULL,
  `img_qr` text,
  `#equipamiento` int(16) NOT NULL,
  `img` text,
  `desc_img` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Salas`
--

CREATE TABLE `Salas` (
  `#sala` int(11) NOT NULL,
  `n_sala` varchar(11) NOT NULL,
  `descripcion_sala` text,
  `planta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Telegram_bot`
--

CREATE TABLE `Telegram_bot` (
  `Nombre` text NOT NULL,
  `Token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Texto`
--

CREATE TABLE `Texto` (
  `#contenido` int(16) NOT NULL,
  `informacion_texto` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Indexes for table `Administradores`
--
ALTER TABLE `Administradores`
  ADD PRIMARY KEY (`dni`);

--
-- Indexes for table `Asistencia_Asiste_Pedida`
--
ALTER TABLE `Asistencia_Asiste_Pedida`
  ADD PRIMARY KEY (`#asistencia`);

--
-- Indexes for table `Asistentes`
--
ALTER TABLE `Asistentes`
  ADD PRIMARY KEY (`dni`);

--
-- Indexes for table `Compuesta`
--
ALTER TABLE `Compuesta`
  ADD PRIMARY KEY (`#recurso`,`#guia`),
  ADD KEY `#guia` (`#guia`);

--
-- Indexes for table `Contenido_Formado`
--
ALTER TABLE `Contenido_Formado`
  ADD PRIMARY KEY (`#contenido`);

--
-- Indexes for table `Datos_Museo`
--
ALTER TABLE `Datos_Museo`
  ADD PRIMARY KEY (`nombre_museo`);

--
-- Indexes for table `Equipamiento_Contiene`
--
ALTER TABLE `Equipamiento_Contiene`
  ADD PRIMARY KEY (`#equipamiento`);

--
-- Indexes for table `Guia`
--
ALTER TABLE `Guia`
  ADD PRIMARY KEY (`#guia`);

--
-- Indexes for table `GuiasPersonalizadas`
--
ALTER TABLE `GuiasPersonalizadas`
  ADD PRIMARY KEY (`#guias`);

--
-- Indexes for table `GuiasPredefinidas`
--
ALTER TABLE `GuiasPredefinidas`
  ADD PRIMARY KEY (`#guia`);

--
-- Indexes for table `Idioma`
--
ALTER TABLE `Idioma`
  ADD PRIMARY KEY (`#idioma`),
  ADD UNIQUE KEY `codigo_idioma` (`codigo_idioma`);

--
-- Indexes for table `Multimedia`
--
ALTER TABLE `Multimedia`
  ADD PRIMARY KEY (`#contenido`,`formato`);

--
-- Indexes for table `Personal`
--
ALTER TABLE `Personal`
  ADD PRIMARY KEY (`dni`);

--
-- Indexes for table `Recursos_Tiene`
--
ALTER TABLE `Recursos_Tiene`
  ADD PRIMARY KEY (`#recurso`),
  ADD UNIQUE KEY `codigo_qr` (`codigo_qr`);

--
-- Indexes for table `Salas`
--
ALTER TABLE `Salas`
  ADD PRIMARY KEY (`#sala`),
  ADD KEY `n_sala` (`n_sala`);

--
-- Indexes for table `Texto`
--
ALTER TABLE `Texto`
  ADD PRIMARY KEY (`#contenido`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Asistencia_Asiste_Pedida`
--
ALTER TABLE `Asistencia_Asiste_Pedida`
  MODIFY `#asistencia` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=836;
--
-- AUTO_INCREMENT for table `Contenido_Formado`
--
ALTER TABLE `Contenido_Formado`
  MODIFY `#contenido` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `Equipamiento_Contiene`
--
ALTER TABLE `Equipamiento_Contiene`
  MODIFY `#equipamiento` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `Guia`
--
ALTER TABLE `Guia`
  MODIFY `#guia` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1257;
--
-- AUTO_INCREMENT for table `Idioma`
--
ALTER TABLE `Idioma`
  MODIFY `#idioma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Recursos_Tiene`
--
ALTER TABLE `Recursos_Tiene`
  MODIFY `#recurso` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `Salas`
--
ALTER TABLE `Salas`
  MODIFY `#sala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Administradores`
--
ALTER TABLE `Administradores`
  ADD CONSTRAINT `Administradores_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `Personal` (`dni`);

--
-- Constraints for table `Asistentes`
--
ALTER TABLE `Asistentes`
  ADD CONSTRAINT `Asistentes_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `Personal` (`dni`);

--
-- Constraints for table `Compuesta`
--
ALTER TABLE `Compuesta`
  ADD CONSTRAINT `Compuesta_ibfk_2` FOREIGN KEY (`#recurso`) REFERENCES `Recursos_Tiene` (`#recurso`),
  ADD CONSTRAINT `Compuesta_ibfk_3` FOREIGN KEY (`#guia`) REFERENCES `Guia` (`#guia`);

--
-- Constraints for table `GuiasPersonalizadas`
--
ALTER TABLE `GuiasPersonalizadas`
  ADD CONSTRAINT `GuiasPersonalizadas_ibfk_1` FOREIGN KEY (`#guias`) REFERENCES `Guia` (`#guia`);

--
-- Constraints for table `GuiasPredefinidas`
--
ALTER TABLE `GuiasPredefinidas`
  ADD CONSTRAINT `GuiasPredefinidas_ibfk_1` FOREIGN KEY (`#guia`) REFERENCES `Guia` (`#guia`);

--
-- Constraints for table `Multimedia`
--
ALTER TABLE `Multimedia`
  ADD CONSTRAINT `Multimedia_ibfk_1` FOREIGN KEY (`#contenido`) REFERENCES `Contenido_Formado` (`#contenido`);

--
-- Constraints for table `Texto`
--
ALTER TABLE `Texto`
  ADD CONSTRAINT `Texto_ibfk_1` FOREIGN KEY (`#contenido`) REFERENCES `Contenido_Formado` (`#contenido`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
