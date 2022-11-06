-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 06 nov. 2022 à 22:41
-- Version du serveur : 10.6.5-MariaDB
-- Version de PHP : 7.4.26

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
(1, 2021, 'Norman\'Zik 2021'),
(2, 2022, 'Norman\'Zik 2022'),
(3, 2023, 'Norman\'Zik 2023'),
(4, 2024, 'Norman\'Zik 2024');

-- --------------------------------------------------------

--
-- Structure de la table `festival`
--

DROP TABLE IF EXISTS `festival`;
CREATE TABLE IF NOT EXISTS `festival` (
  `idFestival` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  PRIMARY KEY (`idFestival`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `festival`
--

INSERT INTO `festival` (`idFestival`, `nom`, `dateDebut`, `dateFin`) VALUES
(1, 'Francofolies', '2023-07-12', '2023-07-16'),
(2, 'Beauregard', '2023-07-06', '2023-07-09'),
(3, 'Vieilles Charrues', '2023-07-13', '2023-07-16'),
(4, 'TomorrowLand Winter', '2023-03-18', '2023-03-25'),
(5, 'TomorrowLand', '2023-08-06', '2023-08-24');

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
  `lieuRepetition` varchar(50) DEFAULT 'Itinérant',
  `avatar` varchar(50) DEFAULT NULL,
  `estSelectionne` int(11) DEFAULT NULL,
  `dispositifID` int(11) DEFAULT 0,
  `genreID` int(11) DEFAULT NULL,
  `contactMembreID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_GROUPE_DISPOSITIF` (`dispositifID`),
  KEY `FK_GROUPE_GENRE` (`genreID`),
  KEY `FK_GROUPE_MEMBRECONTACT` (`contactMembreID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id`, `nom`, `dateCreation`, `telephone`, `melSiteWeb`, `lieuRepetition`, `avatar`, `estSelectionne`, `dispositifID`, `genreID`, `contactMembreID`) VALUES
(2, 'Louise Attaque', '1944-01-01', '0607080910', 'contact@louiseattaque.org', 'Itinérant', 'louiseattaque.jpg', NULL, 1, 3, 3),
(3, 'Les Spartavies', '2012-02-21', '0639809180', 'spartd@chez_ouam.fr', 'Itinérant', NULL, NULL, 2, 2, 6),
(4, 'Les flash', '2012-02-21', '0688552110', 'contact@sonymusic.fr', 'Caen', NULL, NULL, 3, 2, 1),
(5, 'PH Electro', '2023-11-06', '0606060606', 'contact@ph-electro.org', 'Paris', 'profilImage2.png', NULL, 4, 6, 2);

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
(2, 3),
(2, 4),
(2, 5),
(4, 6),
(5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `instrument`
--

DROP TABLE IF EXISTS `instrument`;
CREATE TABLE IF NOT EXISTS `instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `instrument`
--

INSERT INTO `instrument` (`id`, `libelle`) VALUES
(1, 'Violon'),
(2, 'Voix'),
(3, 'Piano'),
(4, 'Guitare');

-- --------------------------------------------------------

--
-- Structure de la table `jouer_concert`
--

DROP TABLE IF EXISTS `jouer_concert`;
CREATE TABLE IF NOT EXISTS `jouer_concert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupeID` int(11) NOT NULL,
  `lieuConcertID` int(11) NOT NULL,
  `dateConcert` date DEFAULT NULL,
  `heureDebut` time NOT NULL,
  `heureFin` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_JOUERCONCERT_LIEUCONCERT` (`lieuConcertID`),
  KEY `groupeID` (`groupeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `jouer_concert`
--

INSERT INTO `jouer_concert` (`id`, `groupeID`, `lieuConcertID`, `dateConcert`, `heureDebut`, `heureFin`) VALUES
(1, 2, 1, '2022-11-06', '21:00:00', '23:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `jouer_festival`
--

DROP TABLE IF EXISTS `jouer_festival`;
CREATE TABLE IF NOT EXISTS `jouer_festival` (
  `groupeID` int(11) NOT NULL,
  `festivalID` int(11) NOT NULL,
  `datePassage` date NOT NULL,
  `teteAffiche` int(11) DEFAULT 0,
  PRIMARY KEY (`groupeID`,`festivalID`),
  KEY `FK_JOUERFESTIVAL_FESTIVAL` (`festivalID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `jouer_festival`
--

INSERT INTO `jouer_festival` (`groupeID`, `festivalID`, `datePassage`, `teteAffiche`) VALUES
(2, 1, '2023-07-16', 1),
(3, 2, '2023-07-06', 1),
(4, 3, '2023-07-14', 1),
(5, 4, '2023-03-25', 1),
(5, 5, '2023-08-15', 1);

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

-- --------------------------------------------------------

--
-- Structure de la table `lieuconcert`
--

DROP TABLE IF EXISTS `lieuconcert`;
CREATE TABLE IF NOT EXISTS `lieuconcert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `codePostal` varchar(6) DEFAULT NULL,
  `salleNom` varchar(70) CHARACTER SET utf8mb3 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lieuconcert`
--

INSERT INTO `lieuconcert` (`id`, `nom`, `ville`, `codePostal`, `salleNom`) VALUES
(1, 'Le Cargo', 'Caen', '14123', 'Le Cargo'),
(2, NULL, NULL, NULL, NULL);

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
  `password` varchar(50) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `gradeID` int(11) NOT NULL DEFAULT 0,
  `instrumentPrincipalID` int(11) DEFAULT NULL,
  `statutID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MEMBRE_INSTRUMENTPRINCIPAL` (`instrumentPrincipalID`),
  KEY `statutID` (`statutID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id`, `nom`, `prenom`, `mail`, `password`, `avatar`, `gradeID`, `instrumentPrincipalID`, `statutID`) VALUES
(1, 'Richter', 'John', 'john@normanzik.fr', 'fe2ed0901ce08fb4b02e8b3a3b7f8281', NULL, 2, 3, 1),
(2, 'Lemoine', 'Julien', 'julienlemoine14@live.fr', '3a7e857e49a09ea88ba3a642a3474178', 'profilImage1.png', 0, 2, 3),
(3, 'Roussel', 'Gaetan', 'gaetan@vent.org', 'ae83534482371be79b78c8f921d6a8be', 'profilImage2.png', 0, 4, 1),
(4, 'Samuel', 'Arnaud', 'samuel@arnaud.fr', '1f2dad3faa4ee6c96c78433953b7edfe', 'louiseattaque.jpg', 0, 1, 1),
(5, 'Feix', 'Robin', 'robin@desbois.foret', '57f577f20c810532125affa919c3eaad', 'louiseattaque.jpg', 0, 2, 1),
(6, 'Margotton', 'Gregoire', 'gregoire@normanzik.fr', '3a6baa2677d16db9e73465f1a52df91a', NULL, 0, 2, 2);

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
  `groupeID` int(11) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `intitule` varchar(50) DEFAULT NULL,
  `duree` time DEFAULT NULL,
  `lienURL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`groupeID`,`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `titre`
--

INSERT INTO `titre` (`groupeID`, `numero`, `intitule`, `duree`, `lienURL`) VALUES
(2, '1', 'J\'t\'emmène au vent', '03:04:00', NULL),
(2, '2', 'Anomalie', '03:09:00', NULL);

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
  ADD CONSTRAINT `groupe_ibfk_2` FOREIGN KEY (`contactMembreID`) REFERENCES `membre` (`id`),
  ADD CONSTRAINT `groupe_ibfk_3` FOREIGN KEY (`genreID`) REFERENCES `genre_musical` (`id`);

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
  ADD CONSTRAINT `jouer_concert_ibfk_1` FOREIGN KEY (`groupeID`) REFERENCES `groupe` (`id`),
  ADD CONSTRAINT `jouer_concert_ibfk_2` FOREIGN KEY (`lieuConcertID`) REFERENCES `lieuconcert` (`id`);

--
-- Contraintes pour la table `jouer_festival`
--
ALTER TABLE `jouer_festival`
  ADD CONSTRAINT `jouer_festival_ibfk_1` FOREIGN KEY (`groupeID`) REFERENCES `groupe` (`id`),
  ADD CONSTRAINT `jouer_festival_ibfk_2` FOREIGN KEY (`festivalID`) REFERENCES `festival` (`idFestival`);

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
  ADD CONSTRAINT `membre_ibfk_1` FOREIGN KEY (`instrumentPrincipalID`) REFERENCES `instrument` (`id`);

--
-- Contraintes pour la table `titre`
--
ALTER TABLE `titre`
  ADD CONSTRAINT `titre_ibfk_1` FOREIGN KEY (`groupeID`) REFERENCES `groupe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
