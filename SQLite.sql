-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 05 fév. 2024 à 17:01
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `netflux`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

CREATE TABLE `acteur` (
  `IdActeur` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Prénom` varchar(255) DEFAULT NULL,
  `Date_Naissance` date DEFAULT NULL,
  `Date_Mort` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `acteur`
--

INSERT INTO `acteur` (`IdActeur`, `Nom`, `Prénom`, `Date_Naissance`, `Date_Mort`) VALUES
(1, 'Johnson', 'Dwayne', '1972-05-02', NULL),
(2, 'Hodge', 'Aldis', '1986-09-20', NULL),
(3, 'Brosnan', 'Pierce', '1963-05-16', NULL),
(4, 'Shahi', 'Sarah', '1980-01-10', NULL),
(5, 'Centineo', 'Noah', '1996-05-09', NULL),
(6, 'Wood', 'Elijah', '1981-01-28', NULL),
(7, 'McKellen', 'Ian', '1939-05-25', NULL),
(8, 'Astin', 'Sean', '1971-02-25', NULL),
(9, 'Mortensen', 'Viggo ', '1958-10-20', NULL),
(10, 'Adams', 'Kev', '1991-07-01', NULL),
(11, 'Rouve', 'Jean-Paul', '1967-01-27', NULL),
(12, 'Judor', 'Eric', '1968-07-25', NULL),
(13, 'Blanc', 'Michel', '1952-04-16', NULL),
(14, 'Guide', 'Vanessa', '1983-03-21', NULL),
(15, 'Johansson', 'Scarlett', '1984-11-22', NULL),
(16, 'Kitano', 'Takeshi', '19847-01-18', NULL),
(17, 'Pitt', 'Michael', '1981-04-10', NULL),
(18, 'Asbaek', 'Pilou', '1982-03-02', NULL),
(19, 'Binoche', 'Juliette', '1964-03-09', NULL),
(20, 'Washington', 'Denzel', '1954-12-28', NULL),
(21, 'Owen', 'Clive', '1964-10-03', NULL),
(22, 'Foster', 'Jodie', '1962-11-19', NULL),
(23, 'Plummer', 'Christopher', '1929-12-13', '2021-02-5'),
(24, 'Dafoe', 'Willem', '1955-07-22', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `FkVideo` int(11) NOT NULL,
  `FkGenre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `appartient`
--

INSERT INTO `appartient` (`FkVideo`, `FkGenre`) VALUES
(1, 4),
(2, 5),
(3, 3),
(3, 6),
(4, 7),
(5, 8);
-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `IdGenre` int(11) NOT NULL,
  `Libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`IdGenre`, `Libelle`) VALUES
(1, 'Action'),
(2, 'Aventure'),
(3, 'Fantastique'),
(4, 'Super-héros'),
(5, 'Fantasy'),
(6, 'Comédie'),
(7, 'Science-fiction'),
(8, 'Policier');


-- --------------------------------------------------------

--
-- Structure de la table `joue`
--

CREATE TABLE `joue` (
  `FkVideo` int(11) NOT NULL,
  `FkActeur` int(11) NOT NULL,
  `Role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `joue`
--

INSERT INTO `joue` (`FkVideo`, `FkActeur`, `Role`) VALUES
(1, 1, 'Black Adam'),
(1, 2, 'Hawkman'),
(1, 3, 'Doctor Fate'),
(1, 4, 'Adrianna Tomaz'),
(2, 6, 'Frodon Sacquet'),
(2, 7, 'Gandalf le Gris'),
(2, 8, 'Samsagace Gamegie'),
(2, 9, 'Aragorn'),
(3, 10, 'Sam'),
(3, 11, 'Jean-Pierre'),
(3, 12, 'Frank Bonarel'),
(3, 13, 'Le père de Sofia'),
(3, 14, 'Sofia'),
(4, 15, 'Mira Killian'),
(4, 16, 'Daisuke Aramaki'),
(4, 17, 'Hideo Kuze'),
(4, 18, 'Batou'),
(4, 19, 'Dr Ouelet'),
(5, 20, 'Keith Frazier'),
(5, 21, 'Dalton Russell'),
(5, 22, 'Madeleine White'),
(5, 23, 'Arthur Case'),
(5, 24, 'John Darius');
-- --------------------------------------------------------

--
-- Structure de la table `obtientacteur`
--

CREATE TABLE `obtientacteur` (
  `FkActeur` int(11) NOT NULL,
  `FkRecompense` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `obtientacteur`
--

INSERT INTO `obtientacteur` (`FkActeur`, `FkRecompense`) VALUES
(1, 1),
(6, 3),
(21, 8);
-- --------------------------------------------------------

--
-- Structure de la table `obtientrealisateur`
--

CREATE TABLE `obtientrealisateur` (
  `FkRealisateur` int(11) NOT NULL,
  `FkRecompense` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `obtientrealisateur`
--

INSERT INTO `obtientrealisateur` (`FkRealisateur`, `FkRecompense`) VALUES
(2, 4),
(5, 5),
(5, 7);
-- --------------------------------------------------------

--
-- Structure de la table `obtientvideo`
--

CREATE TABLE `obtientvideo` (
  `FkVideo` int(11) NOT NULL,
  `FkRecompense` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `obtientvideo`
--

INSERT INTO `obtientvideo` (`FkVideo`, `FkRecompense`) VALUES
(2, 2),
(5, 6);
-- --------------------------------------------------------

--
-- Structure de la table `producteur`
--

CREATE TABLE `producteur` (
  `IdProducteur` int(11) NOT NULL,
  `RaisonSocial` varchar(255) DEFAULT NULL,
  `Date_Creation` year(4) DEFAULT NULL,
  `Adresse` varchar(255) DEFAULT NULL,
  `Mail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `producteur`
--

INSERT INTO `producteur` (`IdProducteur`, `RaisonSocial`, `Date_Creation`, `Adresse`, `Mail`) VALUES
(1, 'DC Studios', '2016', '4000 Warner Boulevard Burbank, Californie 91522 ', 'copyright@wb.com'),
(2, 'New Line Cinema ', '1967', '4000 Warner Boulevard Burbank, Californie 91522', 'copyright@wb.com'),
(3, 'WingNut Films', '1987', 'Stone Street Wellington 6022 New Zealand', 'dion@filmtec.co.nz'),
(4, 'Pathé', '1896', '2 rue Lamennais 75008 Paris', 'accueil@pathe.com'),
(5, 'Paramount Pictures', '1916', '5555 Melrose Avenue,  Californie', 'Studio_Operations@paramount.com'),
(6, 'DreamWorks Pictures', '1994', '1000 Flower Street 91201 Glendale, Californie', 'DreamWorksJrCommunity@dreamworks.com'),
(7, 'Reliance Entertainment', '2005', '5th Floor, Valecha Chambers, New Link Road, Andheri (W), Mumbai -400053', 're.info@restudios.co.in'),
(8, 'Universal Pictures', '1912', '00 Universal City Plaza Drive in Universal City, California.', 'dceline.demoulin@nbcuni.com'),
(9, 'Imagine Entertainment', '1985', '150 S El Camino Dr, Beverly Hills, Californi 90212', NULL),
(10, '40 Acres & A Mule Filmworks', '1983', ' 75 S Elliott Pl, Brooklyn, New York', 'contactus@40acres.com');
-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `FkVideo` int(11) NOT NULL,
  `FkProducteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`FkVideo`, `FkProducteur`) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 8),
(5, 9),
(5, 10);

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

CREATE TABLE `realisateur` (
  `IdRealisateur` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Prénom` varchar(255) DEFAULT NULL,
  `Date_Naissance` date DEFAULT NULL,
  `Date_Mort` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `realisateur`
--

INSERT INTO `realisateur` (`IdRealisateur`, `Nom`, `Prénom`, `Date_Naissance`, `Date_Mort`) VALUES
(1, 'Collet-Serra', 'Jaume', '1974-03-23', NULL),
(2, 'Jackson', 'Peter', '1961-10-31', NULL),
(3, 'Benzaquen', 'Arthur', '1974-01-01', NULL),
(4, 'Sanders', 'Rupert', '1971-03-16', NULL),
(5, 'Lee', 'Spike', '1957-03-20', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `realise`
--

CREATE TABLE `realise` (
  `FkVideo` int(11) NOT NULL,
  `FkRealisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `realise`
--

INSERT INTO `realise` (`FkVideo`, `FkRealisateur`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `recompense`
--

CREATE TABLE `recompense` (
  `IdRecompense` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Catégorie` varchar(255) DEFAULT NULL,
  `Annee` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `recompense`
--

INSERT INTO `recompense` (`IdRecompense`, `Nom`, `Catégorie`, `Annee`) VALUES
(1, 'Acteur de cinéma préféré', "2023 Kids Choice Awards", '2023'),
(2, 'Meilleur film', 'Empire Awards', '2002'),
(3, 'Meilleur acteur', 'Empire Awards', '2002'),
(4, 'Meilleur script', 'Prix Nebula', '2003'),
(5, 'Meilleur réalisateur', 'Black Movie Awards', '2006'),
(6, 'Meilleur film', 'Australian Academy of Cinema and Television Arts Awards', '2007'),
(7, 'Meilleur réalisateur', 'Black Reel Awards', '2007'),
(8, 'Meilleur acteur', 'Central Ohio Film Critics Association Awards', '2007');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `IdType` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`IdType`, `Nom`) VALUES
(1, 'Film'),
(2, 'Anime'),
(3, 'Serie');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `Identifiant` varchar(255) NOT NULL,
  `Mdp` varchar(255) DEFAULT NULL,
  `Date_Naissance` date DEFAULT NULL,
  `Adresse` varchar(255) DEFAULT NULL,
  `Genre` enum('Homme','Femme','Autres') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`Identifiant`, `Mdp`, `Date_Naissance`, `Adresse`, `Genre`) VALUES
('adam', 'adam2002', '2023-09-01', 'a@gmail.com', 'Homme');

-- --------------------------------------------------------

--
-- Structure de la table `video`
--

CREATE TABLE `video` (
  `IdVideo` int(11) NOT NULL,
  `Titre` varchar(255) DEFAULT NULL,
  `FkType` int(11) DEFAULT NULL,
  `Date_Sortie` date DEFAULT NULL,
  `Duree` int(11) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `video`
--

INSERT INTO `video` (`IdVideo`, `Titre`, `FkType`, `Date_Sortie`, `Duree`, `Image`) VALUES
(1, 'Black Adam', 1, '2022-10-19', 125, 'BlackAdam'),
(2, 'Le Seigneur des anneaux : La Communauté de l\'anneau', 1, '2001-12-19', 178, 'SeigneurAnneaux'),
(3, 'Les nouvelles aventures d\'Aladin', 1, '2015-10-14', 104, 'Aladin'),
(4, 'Ghost in The Shell', 1, '2017-03-29', 104, 'Ghost'),
(5, "Inside Man : L'Homme de l'intérieur", 1, '2006-04-12', 129, 'InsideMan');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acteur`
--
ALTER TABLE `acteur`
  ADD PRIMARY KEY (`IdActeur`);

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`FkVideo`,`FkGenre`),
  ADD KEY `FkGenre` (`FkGenre`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`IdGenre`);

--
-- Index pour la table `joue`
--
ALTER TABLE `joue`
  ADD PRIMARY KEY (`FkVideo`,`FkActeur`,`Role`),
  ADD KEY `joue_ibfk_2` (`FkActeur`);

--
-- Index pour la table `obtientacteur`
--
ALTER TABLE `obtientacteur`
  ADD PRIMARY KEY (`FkActeur`,`FkRecompense`),
  ADD KEY `FkRecompense` (`FkRecompense`);

--
-- Index pour la table `obtientrealisateur`
--
ALTER TABLE `obtientrealisateur`
  ADD PRIMARY KEY (`FkRealisateur`,`FkRecompense`),
  ADD KEY `FkRecompense` (`FkRecompense`);

--
-- Index pour la table `obtientvideo`
--
ALTER TABLE `obtientvideo`
  ADD PRIMARY KEY (`FkVideo`,`FkRecompense`),
  ADD KEY `FkRecompense` (`FkRecompense`);

--
-- Index pour la table `producteur`
--
ALTER TABLE `producteur`
  ADD PRIMARY KEY (`IdProducteur`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`FkVideo`,`FkProducteur`),
  ADD KEY `FkProducteur` (`FkProducteur`);

--
-- Index pour la table `realisateur`
--
ALTER TABLE `realisateur`
  ADD PRIMARY KEY (`IdRealisateur`);

--
-- Index pour la table `realise`
--
ALTER TABLE `realise`
  ADD PRIMARY KEY (`FkVideo`,`FkRealisateur`),
  ADD KEY `FkRealisateur` (`FkRealisateur`);

--
-- Index pour la table `recompense`
--
ALTER TABLE `recompense`
  ADD PRIMARY KEY (`IdRecompense`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`IdType`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`Identifiant`);

--
-- Index pour la table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`IdVideo`),
  ADD KEY `FkType` (`FkType`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `appartient_ibfk_1` FOREIGN KEY (`FkVideo`) REFERENCES `video` (`IdVideo`),
  ADD CONSTRAINT `appartient_ibfk_2` FOREIGN KEY (`FkGenre`) REFERENCES `genre` (`IdGenre`);

--
-- Contraintes pour la table `joue`
--
ALTER TABLE `joue`
  ADD CONSTRAINT `joue_ibfk_1` FOREIGN KEY (`FkVideo`) REFERENCES `video` (`IdVideo`),
  ADD CONSTRAINT `joue_ibfk_2` FOREIGN KEY (`FkActeur`) REFERENCES `acteur` (`IdActeur`);

--
-- Contraintes pour la table `obtientacteur`
--
ALTER TABLE `obtientacteur`
  ADD CONSTRAINT `obtientacteur_ibfk_1` FOREIGN KEY (`FkActeur`) REFERENCES `acteur` (`IdActeur`),
  ADD CONSTRAINT `obtientacteur_ibfk_2` FOREIGN KEY (`FkRecompense`) REFERENCES `recompense` (`IdRecompense`);

--
-- Contraintes pour la table `obtientrealisateur`
--
ALTER TABLE `obtientrealisateur`
  ADD CONSTRAINT `obtientrealisateur_ibfk_1` FOREIGN KEY (`FkRealisateur`) REFERENCES `realisateur` (`IdRealisateur`),
  ADD CONSTRAINT `obtientrealisateur_ibfk_2` FOREIGN KEY (`FkRecompense`) REFERENCES `recompense` (`IdRecompense`);

--
-- Contraintes pour la table `obtientvideo`
--
ALTER TABLE `obtientvideo`
  ADD CONSTRAINT `obtientvideo_ibfk_1` FOREIGN KEY (`FkVideo`) REFERENCES `video` (`IdVideo`),
  ADD CONSTRAINT `obtientvideo_ibfk_2` FOREIGN KEY (`FkRecompense`) REFERENCES `recompense` (`IdRecompense`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`FkVideo`) REFERENCES `video` (`IdVideo`),
  ADD CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`FkProducteur`) REFERENCES `producteur` (`IdProducteur`);

--
-- Contraintes pour la table `realise`
--
ALTER TABLE `realise`
  ADD CONSTRAINT `realise_ibfk_1` FOREIGN KEY (`FkVideo`) REFERENCES `video` (`IdVideo`),
  ADD CONSTRAINT `realise_ibfk_2` FOREIGN KEY (`FkRealisateur`) REFERENCES `realisateur` (`IdRealisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
