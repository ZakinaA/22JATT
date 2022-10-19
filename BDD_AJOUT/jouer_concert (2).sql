-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : mer. 19 oct. 2022 à 07:22
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `normanzik`
--

-- --------------------------------------------------------

--
-- Structure de la table `jouer_concert`
--

DROP TABLE IF EXISTS `jouer_concert`;
CREATE TABLE IF NOT EXISTS `jouer_concert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupeID` int(11) DEFAULT NULL,
  `lieuConcertID` int(11) DEFAULT NULL,
  `dateConcert` varchar(50) NOT NULL,
  `HeureDebut` varchar(50) NOT NULL,
  `HeureFin` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_JOUERCONCERT_LIEUCONCERT` (`lieuConcertID`),
  KEY `FK_JOUERCONCERT_GROUPE` (`groupeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `jouer_concert`
--

INSERT INTO `jouer_concert` (`id`, `groupeID`, `lieuConcertID`, `dateConcert`, `HeureDebut`, `HeureFin`) VALUES
(1, 1, 2, '2022-12-08', '20h00', '02h30'),
(2, 2, 1, '2022-10-05', '18h30', '23h30'),
(3, 7, 1, '2022-06-09', '21h00', '02h00'),
(4, 7, 1, '2022-10-05', '21h00', '02h30'),
(5, 8, 2, '2022-12-01', '21h30', '01h00'),
(6, 1, 1, '2022-12-01', '21h30', '01h00');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `jouer_concert`
--
ALTER TABLE `jouer_concert`
  ADD CONSTRAINT `FK_JOUERCONCERT_GROUPE` FOREIGN KEY (`groupeID`) REFERENCES `groupe` (`id`),
  ADD CONSTRAINT `FK_JOUERCONCERT_LIEUCONCERT` FOREIGN KEY (`lieuConcertID`) REFERENCES `lieuconcert` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
