-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 21-10-2022 a las 02:12:16
-- Versión del servidor: 5.6.35
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestiondecitasusuario`
--
CREATE DATABASE IF NOT EXISTS `gestiondecitasusuario` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gestiondecitasusuario`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

DROP TABLE IF EXISTS `cita`;
CREATE TABLE IF NOT EXISTS `cita` (
  `IdPaciente` int(11) NOT NULL,
  `IdMedico` int(11) NOT NULL,
  `IdTipoCita` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `IdCita` int(11) NOT NULL,
  `Hora` date NOT NULL,
  PRIMARY KEY (`IdCita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

DROP TABLE IF EXISTS `medico`;
CREATE TABLE IF NOT EXISTS `medico` (
  `IdMedico` int(11) NOT NULL,
  `Cedula` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Celular` int(11) NOT NULL,
  `Email` varchar(300) NOT NULL,
  PRIMARY KEY (`IdMedico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoconsulta`
--

DROP TABLE IF EXISTS `tipoconsulta`;
CREATE TABLE IF NOT EXISTS `tipoconsulta` (
  `IdConsulta` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(300) NOT NULL,
  PRIMARY KEY (`IdConsulta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `Cedula` int(11) NOT NULL,
  `Nombre` varchar(300) NOT NULL,
  `Apellido` varchar(300) NOT NULL,
  `Direccion` varchar(300) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Celular` int(11) NOT NULL,
  `Email` varchar(300) NOT NULL,
  `NombreUsuario` varchar(100) NOT NULL,
  `Contraseña` varchar(300) NOT NULL,
  PRIMARY KEY (`Cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
