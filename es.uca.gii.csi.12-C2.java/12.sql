-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2024 at 11:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `12`
--

-- --------------------------------------------------------

--
-- Table structure for table `vehiculo`
--

CREATE TABLE `vehiculo` (
  `ID` int(11) NOT NULL,
  `Matricula` varchar(10) NOT NULL,
  `Disponible` tinyint(1) NOT NULL,
  `Variante_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehiculo`
--

INSERT INTO `vehiculo` (`ID`, `Matricula`, `Disponible`, `Variante_id`) VALUES
(1, '9061LZL', 0, 1),
(2, '0961AAA', 0, 1),
(3, '1234ABC', 1, 2);

--
-- Triggers `vehiculo`
--
DELIMITER $$
CREATE TRIGGER `vehiculo_bi` BEFORE INSERT ON `vehiculo` FOR EACH ROW begin
    if NEW.Matricula = '' then
        signal sqlstate '45000' set
            message_text = 'Matricula no puede ser cadena vacía.';
    end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `vehiculo_bu` BEFORE UPDATE ON `vehiculo` FOR EACH ROW begin
    if NEW.Matricula = '' then
        signal sqlstate '45000' set
            message_text = 'Matricula no puede ser cadena vacía.';
    end if;
end
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `matricula_unique` (`Matricula`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
