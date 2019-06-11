-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 11, 2019 at 12:21 AM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anisotop`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(72) COLLATE utf8mb4_bin NOT NULL,
  `alias` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `direccion` varchar(160) COLLATE utf8mb4_bin DEFAULT NULL,
  `postal` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL,
  `ciudad` varchar(48) COLLATE utf8mb4_bin NOT NULL,
  `estado` varchar(48) COLLATE utf8mb4_bin NOT NULL,
  `pais` varchar(48) COLLATE utf8mb4_bin NOT NULL,
  `telefono` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `correo` tinytext COLLATE utf8mb4_bin,
  `notas` tinytext COLLATE utf8mb4_bin,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `codigos_reempacado`
--

CREATE TABLE `codigos_reempacado` (
  `id` int(11) UNSIGNED NOT NULL,
  `codigo` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `descripcion` text COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `conductores`
--

CREATE TABLE `conductores` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(56) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `consolidados`
--

CREATE TABLE `consolidados` (
  `id` int(10) UNSIGNED NOT NULL,
  `numero` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `alias_cliente_numero` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `notificacion_at` datetime DEFAULT NULL,
  `palets` tinyint(3) UNSIGNED DEFAULT NULL,
  `cliente_id` tinyint(3) UNSIGNED NOT NULL,
  `cerrado_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `entradas`
--

CREATE TABLE `entradas` (
  `id` int(11) UNSIGNED NOT NULL,
  `numero` varchar(48) COLLATE utf8mb4_bin NOT NULL,
  `observaciones` text COLLATE utf8mb4_bin,
  `alias_cliente_numero` tinyint(1) NOT NULL DEFAULT '0',
  `cliente_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `consolidado_id` int(10) UNSIGNED DEFAULT NULL,
  `en_bodega_usa_by` tinyint(3) UNSIGNED DEFAULT NULL,
  `en_bodega_mex_by` tinyint(3) UNSIGNED DEFAULT NULL,
  `conductor_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `vehiculo_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `numero_vuelta` tinyint(3) UNSIGNED DEFAULT NULL,
  `cruce_at` datetime DEFAULT NULL,
  `reempacador_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `codigor_id` int(10) UNSIGNED DEFAULT NULL,
  `reempacado_at` datetime DEFAULT NULL,
  `recibido_at` datetime DEFAULT NULL,
  `creado_by` tinyint(3) UNSIGNED NOT NULL,
  `actualizado_by` tinyint(3) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `entrada_destinatario`
--

CREATE TABLE `entrada_destinatario` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `telefono` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `direccion` varchar(72) COLLATE utf8mb4_bin DEFAULT NULL,
  `postal` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL,
  `referencias` tinytext COLLATE utf8mb4_bin,
  `ciudad` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `estado` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `pais` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `verificacion_at` datetime DEFAULT NULL,
  `actualizado_by` tinyint(4) DEFAULT NULL,
  `entrada_id` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `entrada_medidas`
--

CREATE TABLE `entrada_medidas` (
  `id` int(10) UNSIGNED NOT NULL,
  `etapa` enum('cliente','bodega_usa','bodega_mex_entrada','bodega_mex_salida','transportadora') COLLATE utf8mb4_bin NOT NULL,
  `peso` decimal(8,3) UNSIGNED DEFAULT NULL,
  `medida_peso` enum('libras','kilogramos') COLLATE utf8mb4_bin DEFAULT NULL,
  `ancho` float UNSIGNED DEFAULT NULL,
  `altura` float UNSIGNED DEFAULT NULL,
  `profundidad` float UNSIGNED DEFAULT NULL,
  `medida_volumen` enum('pulgadas','centimetros') COLLATE utf8mb4_bin DEFAULT NULL,
  `actualizado_by` tinyint(4) NOT NULL,
  `entrada_id` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `entrada_remitente`
--

CREATE TABLE `entrada_remitente` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `telefono` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `direccion` varchar(72) COLLATE utf8mb4_bin DEFAULT NULL,
  `postal` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL,
  `ciudad` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `estado` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `pais` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `actualizado_by` tinyint(4) NOT NULL,
  `entrada_id` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `reempacadores`
--

CREATE TABLE `reempacadores` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(56) COLLATE utf8mb4_bin NOT NULL,
  `passcode` varchar(72) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `salidas`
--

CREATE TABLE `salidas` (
  `id` int(10) UNSIGNED NOT NULL,
  `rastreo` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL,
  `confirmacion` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` enum('en espera','en ruta','arribo','entregado') COLLATE utf8mb4_bin DEFAULT NULL,
  `incidente` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `cobertura` enum('domicilio','ocurre') COLLATE utf8mb4_bin NOT NULL,
  `direccion` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL,
  `postal` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL,
  `ciudad` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `estado` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `pais` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  `notas` text COLLATE utf8mb4_bin,
  `transportadora_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `actualizado_by` tinyint(4) NOT NULL,
  `impresiones` tinyint(4) NOT NULL DEFAULT '0',
  `entrada_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `transportadoras`
--

CREATE TABLE `transportadoras` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(24) COLLATE utf8mb4_bin NOT NULL,
  `web` tinytext COLLATE utf8mb4_bin,
  `telefonos` tinytext COLLATE utf8mb4_bin,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(48) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(72) COLLATE utf8mb4_bin NOT NULL,
  `tipo` enum('administrador','documentador','bodega_usa','bodega_mex','cliente') COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `tipo`, `created_at`, `updated_at`) VALUES
(1, 'test-admin', 'tadmin@mail.com', '$2y$10$gPYdwELIUR98NtNQKezniuCYklF86Tf6KMA9CbIVvyOnaBrE0GmQ6', 'administrador', '2019-03-30 19:51:13', '2019-03-30 19:51:13'),
(2, 'test-doc', 'tdoc@mail.com', '$2y$10$gPYdwELIUR98NtNQKezniuCYklF86Tf6KMA9CbIVvyOnaBrE0GmQ6', 'documentador', '2019-03-30 22:14:00', '2019-03-31 16:06:05'),
(4, 'test-busa', 'tbusa@mail.com', '$2y$10$gPYdwELIUR98NtNQKezniuCYklF86Tf6KMA9CbIVvyOnaBrE0GmQ6', 'bodega_usa', '2019-03-31 12:53:00', '2019-03-31 12:53:00'),
(5, 'test-bmex', 'tbmex@mail.com', '$2y$10$gPYdwELIUR98NtNQKezniuCYklF86Tf6KMA9CbIVvyOnaBrE0GmQ6', 'bodega_mex', '2019-03-31 12:56:46', '2019-04-08 05:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int(11) UNSIGNED NOT NULL,
  `alias` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `descripcion` text COLLATE utf8mb4_bin,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `alias` (`alias`),
  ADD UNIQUE KEY `cliente_usuario` (`usuario_id`);

--
-- Indexes for table `codigos_reempacado`
--
ALTER TABLE `codigos_reempacado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indexes for table `conductores`
--
ALTER TABLE `conductores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consolidados`
--
ALTER TABLE `consolidados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero` (`numero`);

--
-- Indexes for table `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entrada_destinatario`
--
ALTER TABLE `entrada_destinatario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrada_destinatario` (`entrada_id`) USING BTREE;

--
-- Indexes for table `entrada_medidas`
--
ALTER TABLE `entrada_medidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrada_medidas` (`entrada_id`) USING BTREE;

--
-- Indexes for table `entrada_remitente`
--
ALTER TABLE `entrada_remitente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrada_remitente` (`entrada_id`);

--
-- Indexes for table `reempacadores`
--
ALTER TABLE `reempacadores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `passcode` (`passcode`);

--
-- Indexes for table `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrada_salida` (`entrada_id`);

--
-- Indexes for table `transportadoras`
--
ALTER TABLE `transportadoras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `codigos_reempacado`
--
ALTER TABLE `codigos_reempacado`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conductores`
--
ALTER TABLE `conductores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consolidados`
--
ALTER TABLE `consolidados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entrada_destinatario`
--
ALTER TABLE `entrada_destinatario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entrada_medidas`
--
ALTER TABLE `entrada_medidas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entrada_remitente`
--
ALTER TABLE `entrada_remitente`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reempacadores`
--
ALTER TABLE `reempacadores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salidas`
--
ALTER TABLE `salidas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transportadoras`
--
ALTER TABLE `transportadoras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `entrada_destinatario`
--
ALTER TABLE `entrada_destinatario`
  ADD CONSTRAINT `entrada_destinatario` FOREIGN KEY (`entrada_id`) REFERENCES `entradas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrada_medidas`
--
ALTER TABLE `entrada_medidas`
  ADD CONSTRAINT `entrada_medidas` FOREIGN KEY (`entrada_id`) REFERENCES `entradas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrada_remitente`
--
ALTER TABLE `entrada_remitente`
  ADD CONSTRAINT `entrada_remitente` FOREIGN KEY (`entrada_id`) REFERENCES `entradas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salidas`
--
ALTER TABLE `salidas`
  ADD CONSTRAINT `entrada_salida` FOREIGN KEY (`entrada_id`) REFERENCES `entradas` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
