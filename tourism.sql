-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 05, 2023 at 11:56 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourism`
--

-- --------------------------------------------------------

--
-- Table structure for table `Destinasi`
--

CREATE TABLE `Destinasi` (
  `ID_Destinasi` int(11) NOT NULL,
  `Nama_Destinasi` varchar(255) DEFAULT NULL,
  `Negara` varchar(255) DEFAULT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Rating` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Destinasi`
--

INSERT INTO `Destinasi` (`ID_Destinasi`, `Nama_Destinasi`, `Negara`, `Deskripsi`, `Rating`) VALUES
(1, 'Bali', 'Indonesia', 'Pulau eksotis dengan pantai indah', 4.50),
(2, 'Tokyo', 'Jepang', 'Kota Dengan Wrisan Budaya Leluhur', 4.80),
(3, 'Jakarta', 'Indonesia', 'Kota Dengan Sejuta Cerita', 4.20);

-- --------------------------------------------------------

--
-- Table structure for table `Hotel`
--

CREATE TABLE `Hotel` (
  `ID_Hotel` int(11) NOT NULL,
  `Nama_Hotel` varchar(255) DEFAULT NULL,
  `ID_Destinasi` int(11) DEFAULT NULL,
  `Rating` decimal(3,2) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Hotel`
--

INSERT INTO `Hotel` (`ID_Hotel`, `Nama_Hotel`, `ID_Destinasi`, `Rating`, `Alamat`) VALUES
(1, 'Hotel Bali Beach', 1, 4.30, 'Jalan Pantai Kuta, Bali'),
(2, 'Hotel Tokyo Street', 2, 4.70, 'Street Tokyo 211'),
(3, 'Aston', 3, 4.00, 'Jl. Raya Simatupang');

-- --------------------------------------------------------

--
-- Table structure for table `Pemesanan`
--

CREATE TABLE `Pemesanan` (
  `ID_Pemesanan` int(11) NOT NULL,
  `Tamu` varchar(255) NOT NULL,
  `ID_Hotel` int(11) DEFAULT NULL,
  `TanggalCheckIn` date DEFAULT NULL,
  `TanggalCheckOut` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Pemesanan`
--

INSERT INTO `Pemesanan` (`ID_Pemesanan`, `Tamu`, `ID_Hotel`, `TanggalCheckIn`, `TanggalCheckOut`) VALUES
(1, 'Arnol', 1, '2023-09-10', '2023-09-15'),
(2, 'Bimo', 2, '2023-10-05', '2023-10-10'),
(3, 'Aldo', 3, '2023-11-15', '2023-11-20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Destinasi`
--
ALTER TABLE `Destinasi`
  ADD PRIMARY KEY (`ID_Destinasi`);

--
-- Indexes for table `Hotel`
--
ALTER TABLE `Hotel`
  ADD PRIMARY KEY (`ID_Hotel`),
  ADD KEY `ID_Destinasi` (`ID_Destinasi`);

--
-- Indexes for table `Pemesanan`
--
ALTER TABLE `Pemesanan`
  ADD PRIMARY KEY (`ID_Pemesanan`),
  ADD KEY `ID_Hotel` (`ID_Hotel`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Destinasi`
--
ALTER TABLE `Destinasi`
  MODIFY `ID_Destinasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Hotel`
--
ALTER TABLE `Hotel`
  MODIFY `ID_Hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Pemesanan`
--
ALTER TABLE `Pemesanan`
  MODIFY `ID_Pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Hotel`
--
ALTER TABLE `Hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`ID_Destinasi`) REFERENCES `Destinasi` (`ID_Destinasi`);

--
-- Constraints for table `Pemesanan`
--
ALTER TABLE `Pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`ID_Hotel`) REFERENCES `Hotel` (`ID_Hotel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
