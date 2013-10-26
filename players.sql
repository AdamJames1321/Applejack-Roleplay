-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 15, 2013 at 10:00 PM
-- Server version: 5.1.70-cll
-- PHP Version: 5.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `addicte_applejack`
--

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `_Name` longtext NOT NULL,
  `_Clan` longtext NOT NULL,
  `_SteamID` longtext NOT NULL,
  `_UniqueID` bigint(16) NOT NULL,
  `_Money` longtext NOT NULL,
  `_Access` longtext NOT NULL,
  `_Donator` longtext NOT NULL,
  `_Arrested` longtext NOT NULL,
  `_Inventory` longtext NOT NULL,
  `_Blacklist` longtext NOT NULL,
  `_Misc` longtext NOT NULL,
  PRIMARY KEY (`_UniqueID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`_Name`, `_Clan`, `_SteamID`, `_UniqueID`, `_Money`, `_Access`, `_Donator`, `_Arrested`, `_Inventory`, `_Blacklist`, `_Misc`) VALUES
('[FN] Â«Prophetâ„¢', '', 'STEAM_0:1:50179375', 437397637, '12500', '', '0', 'false', 'chinese_takeout: 5; health_vial: 5', '', 'EquippedWeapons'),
('[AG] The_Flaminator', '', 'STEAM_0:0:49905497', 2224980525, '9900', '', '0', 'false', 'health_vial: 5; chinese_takeout: 5', '', 'EquippedWeapons');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
         