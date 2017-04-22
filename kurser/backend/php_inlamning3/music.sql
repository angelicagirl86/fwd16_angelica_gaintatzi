-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 22, 2017 at 12:06 PM
-- Server version: 5.6.35
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `Music`
--
CREATE DATABASE IF NOT EXISTS `Music` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Music`;

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `albumID` int(11) NOT NULL,
  `albumName` varchar(45) NOT NULL,
  `albumYear` int(11) NOT NULL,
  `fk_artistID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`albumID`, `albumName`, `albumYear`, `fk_artistID`) VALUES
(1, 'Thriller', 1982, 1),
(2, 'The Stranger', 1977, 2),
(3, 'Jagged Little Pill', 1995, 3),
(4, 'Jailhouse Rock', 1957, 4),
(5, 'Let\'s Dance', 1983, 5),
(6, 'Blood on the Tracks', 1975, 6),
(7, '...And Justice for All', 1988, 7),
(8, 'Paranoid', 1970, 8);

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
CREATE TABLE `artist` (
  `artistID` int(11) NOT NULL,
  `artistName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artistID`, `artistName`) VALUES
(1, 'Michael Jackson'),
(2, 'Billy Joel'),
(3, 'Alanis Morissette'),
(4, 'Elvis Presley'),
(5, 'David Bowie'),
(6, 'Bob Dylan'),
(7, 'Metallica'),
(8, 'Black Sabbath');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`albumID`),
  ADD KEY `FK_AlbumArtist` (`fk_artistID`);

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artistID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `albumID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `artistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `FK_AlbumArtist` FOREIGN KEY (`fk_artistID`) REFERENCES `artist` (`artistID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
