-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2023 at 06:21 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `masjid`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`username`, `password`, `nama`) VALUES
('admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `blok`
--

CREATE TABLE `blok` (
  `id_blok` int(11) NOT NULL,
  `nama_blok` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_blok`
--

CREATE TABLE `detail_blok` (
  `id_detail_blok` int(11) NOT NULL,
  `id_blok` int(11) NOT NULL,
  `sub_blok` char(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keluarga`
--

CREATE TABLE `keluarga` (
  `id_keluarga` int(11) NOT NULL,
  `wakil_keluarga` varchar(50) NOT NULL,
  `id_detail_blok` int(11) NOT NULL,
  `no_rumah` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sumbangan`
--

CREATE TABLE `sumbangan` (
  `id_sumbangan` int(11) NOT NULL,
  `id_keluarga` int(11) NOT NULL,
  `nominal` int(11) DEFAULT NULL,
  `suguhan` enum('ya','tidak') NOT NULL,
  `keterangan` tinytext DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `blok`
--
ALTER TABLE `blok`
  ADD PRIMARY KEY (`id_blok`),
  ADD UNIQUE KEY `nama_blok` (`nama_blok`);

--
-- Indexes for table `detail_blok`
--
ALTER TABLE `detail_blok`
  ADD PRIMARY KEY (`id_detail_blok`),
  ADD UNIQUE KEY `blok_sublok` (`id_blok`,`sub_blok`);

--
-- Indexes for table `keluarga`
--
ALTER TABLE `keluarga`
  ADD PRIMARY KEY (`id_keluarga`),
  ADD UNIQUE KEY `alamat` (`id_detail_blok`,`no_rumah`);

--
-- Indexes for table `sumbangan`
--
ALTER TABLE `sumbangan`
  ADD PRIMARY KEY (`id_sumbangan`),
  ADD KEY `id_keluarga` (`id_keluarga`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blok`
--
ALTER TABLE `blok`
  MODIFY `id_blok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `detail_blok`
--
ALTER TABLE `detail_blok`
  MODIFY `id_detail_blok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `keluarga`
--
ALTER TABLE `keluarga`
  MODIFY `id_keluarga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `sumbangan`
--
ALTER TABLE `sumbangan`
  MODIFY `id_sumbangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_blok`
--
ALTER TABLE `detail_blok`
  ADD CONSTRAINT `detail_blok_ibfk_1` FOREIGN KEY (`id_blok`) REFERENCES `blok` (`id_blok`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keluarga`
--
ALTER TABLE `keluarga`
  ADD CONSTRAINT `keluarga_ibfk_1` FOREIGN KEY (`id_detail_blok`) REFERENCES `detail_blok` (`id_detail_blok`) ON UPDATE CASCADE;

--
-- Constraints for table `sumbangan`
--
ALTER TABLE `sumbangan`
  ADD CONSTRAINT `sumbangan_ibfk_1` FOREIGN KEY (`id_keluarga`) REFERENCES `keluarga` (`id_keluarga`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
