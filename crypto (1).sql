-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2025 at 07:23 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crypto`
--

-- --------------------------------------------------------

--
-- Table structure for table `adausdt`
--

CREATE TABLE `adausdt` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `open` decimal(18,8) NOT NULL,
  `high` decimal(18,8) NOT NULL,
  `low` decimal(18,8) NOT NULL,
  `close` decimal(18,8) NOT NULL,
  `volume` decimal(18,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `avaxusdt`
--

CREATE TABLE `avaxusdt` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `open` decimal(18,8) NOT NULL,
  `high` decimal(18,8) NOT NULL,
  `low` decimal(18,8) NOT NULL,
  `close` decimal(18,8) NOT NULL,
  `volume` decimal(18,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bnbusdt`
--

CREATE TABLE `bnbusdt` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `open` decimal(18,8) NOT NULL,
  `high` decimal(18,8) NOT NULL,
  `low` decimal(18,8) NOT NULL,
  `close` decimal(18,8) NOT NULL,
  `volume` decimal(18,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btcusdt`
--

CREATE TABLE `btcusdt` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `open` decimal(18,8) NOT NULL,
  `high` decimal(18,8) NOT NULL,
  `low` decimal(18,8) NOT NULL,
  `close` decimal(18,8) NOT NULL,
  `volume` decimal(18,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dogeusdt`
--

CREATE TABLE `dogeusdt` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `open` decimal(18,8) NOT NULL,
  `high` decimal(18,8) NOT NULL,
  `low` decimal(18,8) NOT NULL,
  `close` decimal(18,8) NOT NULL,
  `volume` decimal(18,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dotusdt`
--

CREATE TABLE `dotusdt` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `open` decimal(18,8) NOT NULL,
  `high` decimal(18,8) NOT NULL,
  `low` decimal(18,8) NOT NULL,
  `close` decimal(18,8) NOT NULL,
  `volume` decimal(18,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ethusdt`
--

CREATE TABLE `ethusdt` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `open` decimal(18,8) NOT NULL,
  `high` decimal(18,8) NOT NULL,
  `low` decimal(18,8) NOT NULL,
  `close` decimal(18,8) NOT NULL,
  `volume` decimal(18,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `linkusdt`
--

CREATE TABLE `linkusdt` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `open` decimal(18,8) NOT NULL,
  `high` decimal(18,8) NOT NULL,
  `low` decimal(18,8) NOT NULL,
  `close` decimal(18,8) NOT NULL,
  `volume` decimal(18,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ltcusdt`
--

CREATE TABLE `ltcusdt` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `open` decimal(18,8) NOT NULL,
  `high` decimal(18,8) NOT NULL,
  `low` decimal(18,8) NOT NULL,
  `close` decimal(18,8) NOT NULL,
  `volume` decimal(18,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maticusdt`
--

CREATE TABLE `maticusdt` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `open` decimal(18,8) NOT NULL,
  `high` decimal(18,8) NOT NULL,
  `low` decimal(18,8) NOT NULL,
  `close` decimal(18,8) NOT NULL,
  `volume` decimal(18,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shibusdt`
--

CREATE TABLE `shibusdt` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `open` decimal(18,8) NOT NULL,
  `high` decimal(18,8) NOT NULL,
  `low` decimal(18,8) NOT NULL,
  `close` decimal(18,8) NOT NULL,
  `volume` decimal(18,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `solusdt`
--

CREATE TABLE `solusdt` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `open` decimal(18,8) NOT NULL,
  `high` decimal(18,8) NOT NULL,
  `low` decimal(18,8) NOT NULL,
  `close` decimal(18,8) NOT NULL,
  `volume` decimal(18,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trxusdt`
--

CREATE TABLE `trxusdt` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `open` decimal(18,8) NOT NULL,
  `high` decimal(18,8) NOT NULL,
  `low` decimal(18,8) NOT NULL,
  `close` decimal(18,8) NOT NULL,
  `volume` decimal(18,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uniusdt`
--

CREATE TABLE `uniusdt` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `open` decimal(18,8) NOT NULL,
  `high` decimal(18,8) NOT NULL,
  `low` decimal(18,8) NOT NULL,
  `close` decimal(18,8) NOT NULL,
  `volume` decimal(18,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `xrpusdt`
--

CREATE TABLE `xrpusdt` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `open` decimal(18,8) NOT NULL,
  `high` decimal(18,8) NOT NULL,
  `low` decimal(18,8) NOT NULL,
  `close` decimal(18,8) NOT NULL,
  `volume` decimal(18,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adausdt`
--
ALTER TABLE `adausdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `avaxusdt`
--
ALTER TABLE `avaxusdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bnbusdt`
--
ALTER TABLE `bnbusdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `btcusdt`
--
ALTER TABLE `btcusdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dogeusdt`
--
ALTER TABLE `dogeusdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dotusdt`
--
ALTER TABLE `dotusdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ethusdt`
--
ALTER TABLE `ethusdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `linkusdt`
--
ALTER TABLE `linkusdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ltcusdt`
--
ALTER TABLE `ltcusdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maticusdt`
--
ALTER TABLE `maticusdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shibusdt`
--
ALTER TABLE `shibusdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `solusdt`
--
ALTER TABLE `solusdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trxusdt`
--
ALTER TABLE `trxusdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uniusdt`
--
ALTER TABLE `uniusdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xrpusdt`
--
ALTER TABLE `xrpusdt`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adausdt`
--
ALTER TABLE `adausdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3060;

--
-- AUTO_INCREMENT for table `avaxusdt`
--
ALTER TABLE `avaxusdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3060;

--
-- AUTO_INCREMENT for table `bnbusdt`
--
ALTER TABLE `bnbusdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3060;

--
-- AUTO_INCREMENT for table `btcusdt`
--
ALTER TABLE `btcusdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3059;

--
-- AUTO_INCREMENT for table `dogeusdt`
--
ALTER TABLE `dogeusdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3060;

--
-- AUTO_INCREMENT for table `dotusdt`
--
ALTER TABLE `dotusdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3060;

--
-- AUTO_INCREMENT for table `ethusdt`
--
ALTER TABLE `ethusdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3060;

--
-- AUTO_INCREMENT for table `linkusdt`
--
ALTER TABLE `linkusdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3060;

--
-- AUTO_INCREMENT for table `ltcusdt`
--
ALTER TABLE `ltcusdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3060;

--
-- AUTO_INCREMENT for table `maticusdt`
--
ALTER TABLE `maticusdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3060;

--
-- AUTO_INCREMENT for table `shibusdt`
--
ALTER TABLE `shibusdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3060;

--
-- AUTO_INCREMENT for table `solusdt`
--
ALTER TABLE `solusdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3060;

--
-- AUTO_INCREMENT for table `trxusdt`
--
ALTER TABLE `trxusdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3060;

--
-- AUTO_INCREMENT for table `uniusdt`
--
ALTER TABLE `uniusdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3060;

--
-- AUTO_INCREMENT for table `xrpusdt`
--
ALTER TABLE `xrpusdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3060;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
