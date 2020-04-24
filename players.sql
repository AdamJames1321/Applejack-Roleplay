-- phpMyAdmin SQL Dump
-- version 3.3.10.4
-- http://www.phpmyadmin.net
--
-- Host: mysql.c1yd3i.com
-- Generation Time: Oct 24, 2013 at 02:03 PM
-- Server version: 5.1.56
-- PHP Version: 5.3.27

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ciderrp`
--

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `_Key` text NOT NULL,
  `_Name` text NOT NULL,
  `_SteamID` text NOT NULL,
  `_UniqueID` text NOT NULL,
  `_Inventory` text NOT NULL,
  `_Blacklist` text NOT NULL,
  `_Misc` text NOT NULL,
  `_Donator` text NOT NULL,
  `_Money` text NOT NULL,
  `_Clan` text NOT NULL,
  `_Access` text NOT NULL,
  `_Arrested` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`_Key`, `_Name`, `_SteamID`, `_UniqueID`, `_Inventory`, `_Blacklist`, `_Misc`, `_Donator`, `_Money`, `_Clan`, `_Access`, `_Arrested`) VALUES
('', 'Craig.Collin', 'STEAM_0:0:41687673', '1896910761', 'chinese_takeout: 5; health_vial: 5', '', 'EquippedWeapons', '0', '50200', 'No clan ', '', 'false'),
('', '[FL:RP] HeR0x', 'STEAM_0:1:46282055', '3363626079', 'melon: 4; chinese_takeout: 5; cider_fiveseven: 7; ammo_pistol: 4; health_vial: 4', '', 'EquippedWeapons', '0', '7225', 'MNU - F.R.F.B Guard', '', 'false'),
('', 'Mysterious', 'STEAM_0:1:41457172', '3167501478', 'chinese_takeout: 5; health_vial: 5', '', 'EquippedWeapons', '0', '50900', 'No clan ', '', 'false'),
('', '[DS] Decie_ere', 'STEAM_0:1:62121734', '715611401', 'ammo_pistol: 9; ammo_rifle: 10; cider_glock18: 10; chinese_takeout: 5; health_vial: 5', '', 'EquippedWeapons', '0', '12500', 'No clan ', '', 'false'),
('', '[No Fear]', 'STEAM_0:0:18901474', '1136750797', 'rope: 8; chinese_takeout: 5; scirocco: 1; golf: 1; health_vial: 5', '', 'EquippedWeapons', '0', '265200', '', '', 'false'),
('', 'Bot01', 'BOT', '1513418020', 'chinese_takeout: 5; health_vial: 5', '', 'EquippedWeapons', '0', '10200', '', '', 'false'),
('', 'Bot02', 'BOT', '3275603102', 'health_vial: 5; chinese_takeout: 5', '', 'EquippedWeapons', '0', '10200', '', '', 'false');
