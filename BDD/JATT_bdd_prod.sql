-- phpMyAdmin SQL Dump
-- version 5.0.4deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 19 oct. 2022 à 09:26
-- Version du serveur :  10.5.12-MariaDB-0+deb11u1
-- Version de PHP : 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `JATT`
--

-- --------------------------------------------------------

--
-- Structure de la table `avoir_statut`
--

CREATE TABLE `avoir_statut` (
  `statutID` int(11) DEFAULT NULL,
  `membreID` int(11) DEFAULT NULL
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

CREATE TABLE `dispositif` (
  `id` int(11) NOT NULL,
  `annee` year(4) DEFAULT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `festival` (
  `idFestival` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `festival`
--

INSERT INTO `festival` (`idFestival`, `nom`, `dateDebut`, `dateFin`) VALUES
(1, 'BeauRegard', '2023-06-01', '2023-06-04'),
(2, 'MauvaisRegard', '2024-05-02', '2024-06-02'),
(3, 'VilaintRegard', '2025-06-05', '2025-06-08'),
(4, 'MaginifqueRegard', '2026-06-04', '2026-06-07');

-- --------------------------------------------------------

--
-- Structure de la table `genre_musical`
--

CREATE TABLE `genre_musical` (
  `id` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `groupe` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `dateCreation` varchar(50) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `melSiteWeb` varchar(50) DEFAULT NULL,
  `lieuRepetition` varchar(50) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `estSelectionne` int(11) DEFAULT NULL,
  `dispositifID` int(11) DEFAULT NULL,
  `genreID` int(11) DEFAULT NULL,
  `contactMembreID` int(11) DEFAULT NULL,
  `idgenremusical` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id`, `nom`, `dateCreation`, `telephone`, `melSiteWeb`, `lieuRepetition`, `avatar`, `estSelectionne`, `dispositifID`, `genreID`, `contactMembreID`, `idgenremusical`) VALUES
(1, 'Les Spartavies', '2012-02-21', '063980918', 'spartd@chez_ouam.fr', 'Itinérant', 'profilImage1.png', 0, 1, 1, 2, 0),
(2, 'Les flash', '2012-02-21', NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 0),
(8, 'Les skins', '2002-09-26', '0621212121', 'test@live.fr', NULL, NULL, NULL, 1, 1, NULL, 0),
(9, 'Les skins\'22', '2002-09-26', '0621212121', 'test@live.fr', NULL, 'profilImage2.png', NULL, 1, 1, NULL, 0),
(12, 'Les skins\'23', '2023-01-01', '0621212121', 'test@live.fr', NULL, NULL, NULL, 1, 1, NULL, 0),
(13, 'Les skins\'22', '2023-01-01', '0621212121', 'test@live.fr', NULL, NULL, NULL, NULL, 1, NULL, 0),
(15, 'Les Spartavies2', NULL, '0621212121', 'test@live.fr', NULL, NULL, NULL, NULL, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `groupe_membres`
--

CREATE TABLE `groupe_membres` (
  `groupeID` int(11) NOT NULL,
  `membreID` int(11) NOT NULL
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

CREATE TABLE `instrument` (
  `id` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `instrument`
--

INSERT INTO `instrument` (`id`, `libelle`) VALUES
(1, 'Bouzouki'),
(2, 'Voix'),
(3, 'Guitare'),
(4, 'Percussions'),
(5, 'Violon'),
(6, 'Piano'),
(7, NULL),
(8, 'Batterie'),
(9, 'Triangle'),
(10, 'Train'),
(11, 'Jambe');

-- --------------------------------------------------------

--
-- Structure de la table `jouer_concert`
--

CREATE TABLE `jouer_concert` (
  `groupeID` int(11) NOT NULL,
  `lieuConcertID` int(11) NOT NULL,
  `dateConcert` date DEFAULT NULL,
  `heureDebut` time NOT NULL,
  `heureFin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `jouer_concert`
--

INSERT INTO `jouer_concert` (`groupeID`, `lieuConcertID`, `dateConcert`, `heureDebut`, `heureFin`) VALUES
(1, 2, '2022-12-08', '11:00:00', '17:00:00'),
(2, 1, '2022-10-05', '00:00:00', '00:00:00'),
(7, 1, '2022-06-09', '00:00:00', '00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `jouer_festival`
--

CREATE TABLE `jouer_festival` (
  `groupeID` int(11) NOT NULL,
  `festivalID` int(11) NOT NULL,
  `datePassage` date NOT NULL,
  `teteAffiche` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `jouer_festival`
--

INSERT INTO `jouer_festival` (`groupeID`, `festivalID`, `datePassage`, `teteAffiche`) VALUES
(1, 2, '2022-10-12', '1'),
(1, 4, '2022-10-12', NULL),
(2, 1, '2022-10-12', '1'),
(3, 3, '2022-10-12', NULL),
(10, 1, '2022-10-12', NULL),
(12, 3, '2022-10-12', '1'),
(13, 4, '2022-10-12', '1'),
(14, 2, '2022-10-12', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `jouer_groupe`
--

CREATE TABLE `jouer_groupe` (
  `groupeID` int(11) NOT NULL,
  `membreID` int(11) NOT NULL,
  `instrumentID` int(11) NOT NULL,
  `instrumentPrincipal` int(11) DEFAULT NULL
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

CREATE TABLE `lieuconcert` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `codePostal` varchar(6) DEFAULT NULL,
  `salleNom` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lieuconcert`
--

INSERT INTO `lieuconcert` (`id`, `nom`, `ville`, `codePostal`, `salleNom`) VALUES
(1, 'Laflèche', 'Caen', '14000', 'Théâtre de caen '),
(2, 'LesFripons', 'Rennes', '35000', 'Stade de Rennes');

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE `membre` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `mail` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `gradeID` int(11) NOT NULL DEFAULT 0,
  `instrumentPrincipalID` int(11) DEFAULT NULL,
  `statutID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id`, `nom`, `prenom`, `mail`, `password`, `avatar`, `gradeID`, `instrumentPrincipalID`, `statutID`) VALUES
(1, 'Lemoine', 'Julien', 'julienlemoine14@live.fr', 'ca865743d4b846053b5201d58872ea60', 'profilImage1.png', 2, 1, 3),
(2, 'Farietti', 'Arthur', 'test@live.fr', 'd48693036d329932f77160322e67ede0', NULL, 0, 1, 1),
(3, 'Lemoine', 'Julien', 'julienlemoine14@live.fr', 'ca865743d4b846053b5201d58872ea60', NULL, 0, 7, 1),
(4, 'Lemoine', 'Julien', 'julienlemoine14@live.fr', 'ca865743d4b846053b5201d58872ea60', NULL, 0, 8, 1),
(5, 'Guilbert', 'Thomas', 'julienlemoine14@live.fr', 'd61e320a3393dc8438c224e4262f3665', NULL, 0, 9, 1),
(6, 'Ver Eecke', 'Thomas', 'thomasvereecke@normanzik.fr', '46edfb170aa6876c7c9002e35e1c4719', NULL, 0, 10, 3),
(7, 'Loiseau', 'Benjamin', 'loiseaubenjamin@normanzik.fr', 'e9db19bd76e33b014f3ef5d52b682e4c', NULL, 0, 11, 2),
(8, 'Grégoire', 'Herve', 'gregoire@normanzik.fr', '3a6baa2677d16db9e73465f1a52df91a', NULL, 0, 4, 2),
(9, 'Rivoli', 'Linda', 'linda.rivoli@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, 0, 11, 2),
(10, 'Richter2', 'John', 'john@normanzik.fr', 'fe2ed0901ce08fb4b02e8b3a3b7f8281', NULL, 2, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE `statut` (
  `id` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `titre` (
  `groupeID` int(11) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `intitule` varchar(50) DEFAULT NULL,
  `duree` time DEFAULT NULL,
  `lienURL` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `titre`
--

INSERT INTO `titre` (`groupeID`, `numero`, `intitule`, `duree`, `lienURL`) VALUES
(1, '1', 'SuperMaxMax', '00:01:30', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `avoir_statut`
--
ALTER TABLE `avoir_statut`
  ADD KEY `FK_STATUT_STATUT` (`statutID`),
  ADD KEY `FK_STATUT_MEMBRE` (`membreID`);

--
-- Index pour la table `dispositif`
--
ALTER TABLE `dispositif`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `festival`
--
ALTER TABLE `festival`
  ADD PRIMARY KEY (`idFestival`);

--
-- Index pour la table `genre_musical`
--
ALTER TABLE `genre_musical`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_GROUPE_DISPOSITIF` (`dispositifID`),
  ADD KEY `FK_GROUPE_GENRE` (`genreID`),
  ADD KEY `FK_GROUPE_MEMBRECONTACT` (`contactMembreID`);

--
-- Index pour la table `groupe_membres`
--
ALTER TABLE `groupe_membres`
  ADD PRIMARY KEY (`groupeID`,`membreID`),
  ADD KEY `FK_GRP_MEMBRE` (`membreID`);

--
-- Index pour la table `instrument`
--
ALTER TABLE `instrument`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jouer_concert`
--
ALTER TABLE `jouer_concert`
  ADD PRIMARY KEY (`groupeID`,`lieuConcertID`),
  ADD KEY `FK_JOUERCONCERT_LIEUCONCERT` (`lieuConcertID`);

--
-- Index pour la table `jouer_festival`
--
ALTER TABLE `jouer_festival`
  ADD PRIMARY KEY (`groupeID`,`festivalID`),
  ADD KEY `FK_JOUERFESTIVAL_FESTIVAL` (`festivalID`);

--
-- Index pour la table `jouer_groupe`
--
ALTER TABLE `jouer_groupe`
  ADD PRIMARY KEY (`groupeID`,`membreID`,`instrumentID`),
  ADD KEY `FK_JOUERGROUPE_MEMBRE` (`membreID`),
  ADD KEY `FK_JOUERGROUPE_INSTRUMENT` (`instrumentID`);

--
-- Index pour la table `lieuconcert`
--
ALTER TABLE `lieuconcert`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_MEMBRE_INSTRUMENTPRINCIPAL` (`instrumentPrincipalID`),
  ADD KEY `statutID` (`statutID`);

--
-- Index pour la table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `titre`
--
ALTER TABLE `titre`
  ADD PRIMARY KEY (`groupeID`,`numero`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `dispositif`
--
ALTER TABLE `dispositif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `festival`
--
ALTER TABLE `festival`
  MODIFY `idFestival` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `genre_musical`
--
ALTER TABLE `genre_musical`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `instrument`
--
ALTER TABLE `instrument`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `lieuconcert`
--
ALTER TABLE `lieuconcert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `membre`
--
ALTER TABLE `membre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `statut`
--
ALTER TABLE `statut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `titre`
--
ALTER TABLE `titre`
  MODIFY `groupeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Contraintes pour la table `jouer_groupe`
--
ALTER TABLE `jouer_groupe`
  ADD CONSTRAINT `FK_JOUERGROUPE_GROUPE` FOREIGN KEY (`groupeID`) REFERENCES `groupe` (`id`),
  ADD CONSTRAINT `FK_JOUERGROUPE_INSTRUMENT` FOREIGN KEY (`instrumentID`) REFERENCES `instrument` (`id`),
  ADD CONSTRAINT `FK_JOUERGROUPE_MEMBRE` FOREIGN KEY (`membreID`) REFERENCES `membre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
