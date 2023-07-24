-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2021 at 10:53 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tp`
--

-- --------------------------------------------------------

--
-- Table structure for table `alojamiento`
--

CREATE TABLE `alojamiento` (
  `Id` int(11) NOT NULL,
  `Titulo` varchar(50) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `Contacto` varchar(15) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `id_ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alojamiento`
--

INSERT INTO `alojamiento` (`Id`, `Titulo`, `Descripcion`, `Contacto`, `Tipo`, `id_ciudad`) VALUES
(1, 'Casa quinta Hermosa vista', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop p', '24945435', 'Casa Quinta', 0),
(2, 'Casa zona centro', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum in orci consequat risus porta commodo nec vitae urna. Maecenas aliquam erat ut mi ornare, ut efficitur mi egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam hendrerit risus non arcu vulputate mollis. Ut sodales eleifend erat, pellentesque maximus lectus faucibus sed. Nam efficitur feugiat mi, quis egestas turpis mattis eget. Curabitur non ornare nisl. Fusce faucibus lorem vitae dapibus iaculis. Phasellus ', '2496575', 'Casa', 3),
(3, 'hotel lujoso', 'asdasdsadasdsadasdasdas', '2312342', 'Hotel', 3),
(4, 'Casa zona sur', 'mimamamemima', '232312342', 'Casa', 5),
(5, 'Departamento fiestero', 'kifuinsduijnfdxbjkl gfxbjklfdbfdxftnhdrwegartn', '34847623', 'Depto', 5),
(6, 'Departamento fiestero', 'kifuinsduijnfdxbjkl gfxbjklfdbfdxftnhdrwegartn', '34847623', 'Depto', 1),
(7, 'departa lujoso', 'sdgdgfdgfdgdfg', '4423432423', 'Depto', 2),
(8, 'casa quinta zona campestre', 'elbananeroww', '12312332', 'Casa', 1),
(9, 'edificio lujoso', 'fdgfsdgfedg', '', 'Depto', 2),
(10, 'casa de campo', '', '', 'Casa', 3),
(15, 'edificio lujoso', 'adsdasd', '342342', 'Depto', 1),
(16, 'casa nueva', 'sin estrenar', '1231234343', 'nueva', 5),
(17, 'Chalet', 'lroem ipsu', '54235', 'Chalet', 5),
(19, 'Chalet lujosisimo', 'dasdasds', '342343', 'Chalet', 2),
(21, 'Casa con vista a la villa 31', 'ad', '1', 'Casa', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ciudad`
--

CREATE TABLE `ciudad` (
  `Ciudad_id` int(11) NOT NULL,
  `ciudad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ciudad`
--

INSERT INTO `ciudad` (`Ciudad_id`, `ciudad`) VALUES
(0, 'Azul'),
(1, 'Tandil'),
(2, 'caba'),
(3, 'Mar del Plata'),
(5, 'Pinamar');

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(11) NOT NULL,
  `id_alojamiento` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `comentario` varchar(1000) NOT NULL,
  `puntaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `id_alojamiento`, `id_user`, `comentario`, `puntaje`) VALUES
(84, 1, 19, 'ergerg', 4),
(86, 1, 19, 'hjvhjv ', 3);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `Id_usuarios` int(11) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Rol` int(15) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`Id_usuarios`, `Email`, `Password`, `Rol`) VALUES
(19, 'lion', '$2y$10$HV9kPgZe7Xwe.ltr6AoVe.HwVnfI0I/1vJI5RuYnp1M7lMY.ytuMK', 2),
(21, 'lion', '$2y$10$3PnoioXqA4D/ShZdKpzPoehezI23F9I8NQz8GkyNhRclGYM9A/QXG', 2),
(37, 'demo@gmail.com', '$2y$10$WgvPGCtdcHG1yVFYJBvS/e4YOGaRuoKd22YDDJ2XaMcDnRTWNutDu', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alojamiento`
--
ALTER TABLE `alojamiento`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_id_ciudad` (`id_ciudad`) USING BTREE;

--
-- Indexes for table `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`Ciudad_id`);

--
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `comentarios_alojamiento_id_alojamiento` (`id_alojamiento`),
  ADD KEY `comentarios_usuarios_id_user` (`id_user`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id_usuarios`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alojamiento`
--
ALTER TABLE `alojamiento`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `Ciudad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_alojamiento_id_alojamiento` FOREIGN KEY (`id_alojamiento`) REFERENCES `alojamiento` (`Id`),
  ADD CONSTRAINT `comentarios_usuarios_id_user` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`Id_usuarios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
