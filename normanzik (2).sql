-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : mer. 05 oct. 2022 à 08:27
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
-- Structure de la table `avoir_statut`
--

DROP TABLE IF EXISTS `avoir_statut`;
CREATE TABLE IF NOT EXISTS `avoir_statut` (
  `statutID` int(11) DEFAULT NULL,
  `membreID` int(11) DEFAULT NULL,
  KEY `FK_STATUT_STATUT` (`statutID`),
  KEY `FK_STATUT_MEMBRE` (`membreID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `avoir_statut`
--

INSERT INTO `avoir_statut` (`statutID`, `membreID`) VALUES
(1, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `dispositif`
--

DROP TABLE IF EXISTS `dispositif`;
CREATE TABLE IF NOT EXISTS `dispositif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee` year(4) DEFAULT NULL,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dispositif`
--

INSERT INTO `dispositif` (`id`, `annee`, `libelle`) VALUES
(1, 2023, 'Nor’Zik23'),
(2, 2022, 'Nor’Zik22'),
(3, 2021, 'Nor’Zik21'),
(4, 2024, 'Nor\'Zik24');

-- --------------------------------------------------------

--
-- Structure de la table `festival`
--

DROP TABLE IF EXISTS `festival`;
CREATE TABLE IF NOT EXISTS `festival` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomFestival` varchar(100) DEFAULT NULL,
  `dateDebut` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dateFin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `genre_musical`
--

DROP TABLE IF EXISTS `genre_musical`;
CREATE TABLE IF NOT EXISTS `genre_musical` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `genre_musical`
--

INSERT INTO `genre_musical` (`id`, `libelle`) VALUES
(1, 'Folk'),
(2, 'Pop'),
(3, 'Rock'),
(4, 'Reggae'),
(5, 'Métal'),
(6, 'Electro'),
(7, 'Swing'),
(8, 'Blues');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `dateCreation` varchar(50) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `melSiteWeb` varchar(50) DEFAULT NULL,
  `lieuRepetition` varchar(50) DEFAULT NULL,
  `estSelectionne` int(11) DEFAULT NULL,
  `dispositifID` int(11) DEFAULT NULL,
  `genreID` int(11) DEFAULT NULL,
  `contactMembreID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_GROUPE_DISPOSITIF` (`dispositifID`),
  KEY `FK_GROUPE_GENRE` (`genreID`),
  KEY `FK_GROUPE_MEMBRECONTACT` (`contactMembreID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id`, `nom`, `dateCreation`, `telephone`, `melSiteWeb`, `lieuRepetition`, `estSelectionne`, `dispositifID`, `genreID`, `contactMembreID`) VALUES
(1, 'Les Spartavies', '2012-02-21', '063980918', 'spartd@chez_ouam.fr', 'Itinérant', 0, 1, 1, 2),
(2, 'Les flash', '2012-02-21', NULL, NULL, NULL, NULL, 1, 1, 2),
(3, 'Les flash', '2012-02-21', NULL, NULL, NULL, NULL, 3, 1, 10),
(7, 'Les skins', '2002-09-26', '0621212121', 'test@live.fr', NULL, NULL, 1, 1, 3),
(8, 'Les skins', '2002-09-26', '0621212121', 'test@live.fr', NULL, NULL, 1, 1, NULL),
(9, 'Les skins\'22', '2002-09-26', '0621212121', 'test@live.fr', NULL, NULL, 1, 1, NULL),
(10, 'Les skins\'22', '2002-09-26', '0621212121', 'test@live.fr', NULL, NULL, 4, 1, NULL),
(11, 'Les skins\'23', '2023-01-01', '0621212121', 'test@live.fr', NULL, NULL, 1, 1, NULL),
(12, 'Les skins\'23', '2023-01-01', '0621212121', 'test@live.fr', NULL, NULL, 1, 1, NULL),
(13, 'Les skins\'22', NULL, '0621212121', 'test@live.fr', NULL, NULL, NULL, 1, NULL),
(14, 'Les Spartavies2', NULL, '0621212121', 'test@live.fr', NULL, NULL, NULL, 1, NULL),
(15, 'Les Spartavies2', NULL, '0621212121', 'test@live.fr', NULL, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `groupe_membres`
--

DROP TABLE IF EXISTS `groupe_membres`;
CREATE TABLE IF NOT EXISTS `groupe_membres` (
  `groupeID` int(11) NOT NULL,
  `membreID` int(11) NOT NULL,
  PRIMARY KEY (`groupeID`,`membreID`),
  KEY `FK_GRP_MEMBRE` (`membreID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `groupe_membres`
--

INSERT INTO `groupe_membres` (`groupeID`, `membreID`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `instrument`
--

DROP TABLE IF EXISTS `instrument`;
CREATE TABLE IF NOT EXISTS `instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `instrument`
--

INSERT INTO `instrument` (`id`, `libelle`) VALUES
(1, 'Bouzouki'),
(2, 'Voix'),
(3, 'Guitare'),
(4, 'Percussions'),
(5, 'Violon'),
(6, 'Piano');

-- --------------------------------------------------------

--
-- Structure de la table `jouer_concert`
--

DROP TABLE IF EXISTS `jouer_concert`;
CREATE TABLE IF NOT EXISTS `jouer_concert` (
  `groupeID` int(11) NOT NULL,
  `lieuConcertID` int(11) NOT NULL,
  `dateConcert` date DEFAULT NULL,
  PRIMARY KEY (`groupeID`,`lieuConcertID`),
  KEY `FK_JOUERCONCERT_LIEUCONCERT` (`lieuConcertID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `jouer_festival`
--

DROP TABLE IF EXISTS `jouer_festival`;
CREATE TABLE IF NOT EXISTS `jouer_festival` (
  `groupeID` int(11) NOT NULL,
  `festivalID` int(11) NOT NULL,
  `datePassage` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`groupeID`,`festivalID`),
  KEY `FK_JOUERFESTIVAL_FESTIVAL` (`festivalID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `jouer_groupe`
--

DROP TABLE IF EXISTS `jouer_groupe`;
CREATE TABLE IF NOT EXISTS `jouer_groupe` (
  `groupeID` int(11) NOT NULL,
  `membreID` int(11) NOT NULL,
  `instrumentID` int(11) NOT NULL,
  `instrumentPrincipal` int(11) DEFAULT NULL,
  PRIMARY KEY (`groupeID`,`membreID`,`instrumentID`),
  KEY `FK_JOUERGROUPE_MEMBRE` (`membreID`),
  KEY `FK_JOUERGROUPE_INSTRUMENT` (`instrumentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `jouer_groupe`
--

INSERT INTO `jouer_groupe` (`groupeID`, `membreID`, `instrumentID`, `instrumentPrincipal`) VALUES
(1, 1, 1, NULL),
(1, 1, 2, NULL),
(1, 2, 2, NULL),
(1, 3, 4, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `lieuconcert`
--

DROP TABLE IF EXISTS `lieuconcert`;
CREATE TABLE IF NOT EXISTS `lieuconcert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `codePostal` varchar(6) DEFAULT NULL,
  `salleNom` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `mail` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gradeID` int(11) NOT NULL,
  `instrumentPrincipalID` int(11) DEFAULT NULL,
  `statutID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MEMBRE_INSTRUMENTPRINCIPAL` (`instrumentPrincipalID`),
  KEY `statutID` (`statutID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id`, `nom`, `prenom`, `mail`, `password`, `gradeID`, `instrumentPrincipalID`, `statutID`) VALUES
(1, 'Spart', 'David', 'test@live.Fr', 'test', 0, 1, 1),
(2, 'Spart', 'Jeanne', 'test@live.Fr', 'testPassword', 0, 2, 1),
(3, 'Aviès', 'Isabelle', '', '', 0, 4, 1),
(4, 'Lorem', 'Ipsum', '', '', 0, 1, 1),
(5, 'Test', 'Tets', '', '', 0, 1, 1),
(6, 'Test', 'Tets2', '', '', 0, 1, 1),
(7, 'Sal', 'Arie', '', '', 0, 1, 2),
(8, 'Inter', 'Mittent', '', '', 0, 2, 1),
(9, 'Farietti', 'Arthur', '', '', 0, 6, 2),
(10, 'Farietti', 'Arthur', '', '', 0, 6, 3),
(11, 'Test', 'Creation', '', '', 0, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

DROP TABLE IF EXISTS `statut`;
CREATE TABLE IF NOT EXISTS `statut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `statut`
--

INSERT INTO `statut` (`id`, `libelle`) VALUES
(1, 'Intermittent'),
(2, 'Salarié'),
(3, 'Demandeur d\'emploi'),
(4, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `titre`
--

DROP TABLE IF EXISTS `titre`;
CREATE TABLE IF NOT EXISTS `titre` (
  `groupeID` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(50) NOT NULL,
  `intitule` varchar(50) DEFAULT NULL,
  `duree` time DEFAULT NULL,
  `lienURL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`groupeID`,`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `titre`
--

INSERT INTO `titre` (`groupeID`, `numero`, `intitule`, `duree`, `lienURL`) VALUES
(1, '1', 'SuperMaxMax', '00:01:30', '');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avoir_statut`
--
ALTER TABLE `avoir_statut`
  ADD CONSTRAINT `FK_STATUT_MEMBRE` FOREIGN KEY (`membreID`) REFERENCES `membre` (`id`),
  ADD CONSTRAINT `FK_STATUT_STATUT` FOREIGN KEY (`statutID`) REFERENCES `statut` (`id`);

--
-- Contraintes pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `FK_GROUPE_DISPOSITIF` FOREIGN KEY (`dispositifID`) REFERENCES `dispositif` (`id`),
  ADD CONSTRAINT `FK_GROUPE_GENRE` FOREIGN KEY (`genreID`) REFERENCES `genre_musical` (`id`),
  ADD CONSTRAINT `FK_GROUPE_MEMBRECONTACT` FOREIGN KEY (`contactMembreID`) REFERENCES `membre` (`id`);

--
-- Contraintes pour la table `groupe_membres`
--
ALTER TABLE `groupe_membres`
  ADD CONSTRAINT `FK_GRP_GROUPE` FOREIGN KEY (`groupeID`) REFERENCES `groupe` (`id`),
  ADD CONSTRAINT `FK_GRP_MEMBRE` FOREIGN KEY (`membreID`) REFERENCES `membre` (`id`);

--
-- Contraintes pour la table `jouer_concert`
--
ALTER TABLE `jouer_concert`
  ADD CONSTRAINT `FK_JOUERCONCERT_GROUPE` FOREIGN KEY (`groupeID`) REFERENCES `groupe` (`id`),
  ADD CONSTRAINT `FK_JOUERCONCERT_LIEUCONCERT` FOREIGN KEY (`lieuConcertID`) REFERENCES `lieuconcert` (`id`);

--
-- Contraintes pour la table `jouer_festival`
--
ALTER TABLE `jouer_festival`
  ADD CONSTRAINT `FK_JOUERFESTIVAL_FESTIVAL` FOREIGN KEY (`festivalID`) REFERENCES `festival` (`id`),
  ADD CONSTRAINT `FK_JOUERFESTIVAL_GROUPE` FOREIGN KEY (`groupeID`) REFERENCES `groupe` (`id`);

--
-- Contraintes pour la table `jouer_groupe`
--
ALTER TABLE `jouer_groupe`
  ADD CONSTRAINT `FK_JOUERGROUPE_GROUPE` FOREIGN KEY (`groupeID`) REFERENCES `groupe` (`id`),
  ADD CONSTRAINT `FK_JOUERGROUPE_INSTRUMENT` FOREIGN KEY (`instrumentID`) REFERENCES `instrument` (`id`),
  ADD CONSTRAINT `FK_JOUERGROUPE_MEMBRE` FOREIGN KEY (`membreID`) REFERENCES `membre` (`id`);

--
-- Contraintes pour la table `membre`
--
ALTER TABLE `membre`
  ADD CONSTRAINT `FK_MEMBRE_INSTRUMENTPRINCIPAL` FOREIGN KEY (`instrumentPrincipalID`) REFERENCES `instrument` (`id`),
  ADD CONSTRAINT `membre_ibfk_1` FOREIGN KEY (`statutID`) REFERENCES `statut` (`id`);

--
-- Contraintes pour la table `titre`
--
ALTER TABLE `titre`
  ADD CONSTRAINT `FK_TITRE_GROUPE` FOREIGN KEY (`groupeID`) REFERENCES `groupe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
