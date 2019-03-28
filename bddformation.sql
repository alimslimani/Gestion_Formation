-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 21 mai 2018 à 21:04
-- Version du serveur :  10.1.25-MariaDB
-- Version de PHP :  7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bddformation`
--

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

CREATE TABLE `agent` (
  `idAgent` int(10) NOT NULL,
  `nomAgent` varchar(30) NOT NULL,
  `prenomAgent` varchar(30) NOT NULL,
  `villeAgent` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `agent`
--

INSERT INTO `agent` (`idAgent`, `nomAgent`, `prenomAgent`, `villeAgent`) VALUES
(1, 'ALBAN', 'Florent', 'Paris'),
(2, 'ARTIZ', 'Sylvaine', 'Bordeaux'),
(3, 'AUBRY', 'Mélanie', 'Tours'),
(4, 'BARBOT', 'Christine', 'Toulouse'),
(5, 'BAZIER', 'Laure', 'Nice'),
(6, 'BIGOT', 'Hervé', 'Paris'),
(7, 'BLANDIN', 'Louis', 'Dijon'),
(8, 'BLOUIN', 'Yannick', 'Dijon'),
(9, 'CADIOU', 'Pierre', 'Toulouse'),
(10, 'CLOSERAIE', 'Pauline', 'Paris'),
(11, 'DE FOUCAULT', 'Hélène', 'Bordeaux'),
(12, 'DEGAS', 'Sophie', 'Tours'),
(13, 'LE COZIC', 'Marc', 'Poitiers'),
(14, 'LEBLANC', 'Sébastien', 'Reims'),
(15, 'LECOZ', 'Christine', 'Marseille');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `idFormation` int(10) NOT NULL,
  `nomFormation` varchar(50) NOT NULL,
  `lieuFormation` varchar(30) NOT NULL,
  `prixFormation` int(10) NOT NULL,
  `dureeFormation` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`idFormation`, `nomFormation`, `lieuFormation`, `prixFormation`, `dureeFormation`) VALUES
(1, 'La maîtrise des ouvrages Module 1', 'Paris', 90, 2),
(2, 'Formation conception des roulements', 'Bordeaux', 110, 3),
(3, 'Formation chef de chantier roulant', 'Tours', 150, 1),
(4, 'Formation comptable module A', 'Paris', 120, 4),
(5, 'Formation assistant de direction', 'Tours', 210, 2),
(6, 'Formation aux outils bureautiques', 'Dijon', 190, 3),
(7, 'Formation réseaux informatiques', 'Toulouse', 170, 1),
(8, 'Formation administrateur de base de données', 'Nice', 110, 1),
(9, 'Formation paramétrage des stocks', 'Bordeaux', 140, 4),
(10, 'Formation gestion de stocks', 'Paris', 120, 5),
(11, 'Gérer le patrimoine Module 1', 'Dijon', 160, 2),
(12, 'Formation contrôleur sur ligne', 'Toulouse', 100, 3),
(13, 'Formation conducteur de marchandises', 'Dijon', 180, 1),
(14, 'Formation conducteur de ligne ', 'Paris', 210, 4),
(15, 'Formation conducteur TGV', 'Nice', 180, 2);

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `numAgent` int(10) NOT NULL,
  `numFormation` int(10) NOT NULL,
  `presence` int(1) NOT NULL,
  `nbKm` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`numAgent`, `numFormation`, `presence`, `nbKm`) VALUES
(1, 2, 0, 591),
(1, 3, 1, 241),
(2, 1, 1, 589),
(3, 3, 1, 0),
(5, 1, 1, 931),
(5, 2, 0, 802),
(6, 3, 0, 240),
(7, 1, 1, 314),
(7, 3, 1, 421),
(8, 2, 0, 671),
(9, 1, 0, 679),
(9, 3, 1, 588),
(10, 1, 1, 0),
(11, 3, 1, 349),
(12, 1, 1, 239),
(12, 2, 0, 355),
(12, 3, 0, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`idAgent`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`idFormation`);

--
-- Index pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`numAgent`,`numFormation`),
  ADD KEY `numFormation` (`numFormation`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`numAgent`) REFERENCES `agent` (`idAgent`),
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`numFormation`) REFERENCES `formation` (`idFormation`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
