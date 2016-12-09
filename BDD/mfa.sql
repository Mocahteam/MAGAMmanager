-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Client :  localhost
-- Généré le :  Ven 09 Décembre 2016 à 11:07
-- Version du serveur :  10.1.19-MariaDB-1~jessie
-- Version de PHP :  5.6.27-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mfa`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `id` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  `nom` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `application`
--

CREATE TABLE `application` (
  `id` int(11) NOT NULL,
  `id_groupe_pr` int(11) DEFAULT NULL,
  `id_operation` int(11) NOT NULL,
  `bd` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `bd`
--

CREATE TABLE `bd` (
  `id` varchar(6) CHARACTER SET latin1 NOT NULL,
  `new_entity` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `fusion_references`
--

CREATE TABLE `fusion_references` (
  `reference` int(11) NOT NULL,
  `referenced` int(11) NOT NULL,
  `poids` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `groupe_activite`
--

CREATE TABLE `groupe_activite` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL,
  `open` tinyint(1) NOT NULL,
  `bd` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `groupe_propriete`
--

CREATE TABLE `groupe_propriete` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL,
  `for_activite` text NOT NULL,
  `for_utilisateur` text NOT NULL,
  `min_act` float NOT NULL,
  `max_act` float NOT NULL,
  `pas_act` float NOT NULL,
  `defaut_act` float NOT NULL,
  `min_uti` float NOT NULL,
  `max_uti` float NOT NULL,
  `pas_uti` float NOT NULL,
  `defaut_uti` float NOT NULL,
  `open` tinyint(1) NOT NULL,
  `bd` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `groupe_utilisateur`
--

CREATE TABLE `groupe_utilisateur` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL,
  `open` tinyint(1) NOT NULL,
  `bd` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `operation`
--

CREATE TABLE `operation` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL,
  `type_operation` tinyint(1) NOT NULL COMMENT '0=calcul, 1=fusion, 2=transformation'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `operation`
--

INSERT INTO `operation` (`id`, `nom`, `type_operation`) VALUES
(1, 'produit des valeurs', 0),
(2, 'diffÃ©rence entre valeurs', 0),
(3, 'valeur min', 1),
(4, 'valeur max', 1),
(5, 'produit des valeurs', 1),
(6, 'moyenne des valeurs', 1),
(7, 'besoin d\'apprendre', 0),
(9, 'meilleur individuel', 2),
(10, 'meilleur pour le groupe', 2),
(11, 'somme des valeurs', 1),
(12, 'facteur alÃ©atoire', 0),
(13, 'valeur directe', 0),
(15, '2e meilleur individuel ', 2),
(16, '3e meilleur individuel', 2);

-- --------------------------------------------------------

--
-- Structure de la table `propriete`
--

CREATE TABLE `propriete` (
  `id` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  `nom` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  `nom` text NOT NULL,
  `mail` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `valeur_activite`
--

CREATE TABLE `valeur_activite` (
  `id_activite` int(11) NOT NULL,
  `id_propriete` int(11) NOT NULL,
  `valeur` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `visu`
--

CREATE TABLE `visu` (
  `id_user` int(11) DEFAULT NULL,
  `id_groupe_act` int(11) DEFAULT NULL,
  `bd` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Index pour les tables exportées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_groupe` (`id_groupe`);

--
-- Index pour la table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calcul_is` (`id_operation`),
  ADD KEY `groupe_is` (`id_groupe_pr`),
  ADD KEY `bd` (`bd`);

--
-- Index pour la table `bd`
--
ALTER TABLE `bd`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fusion_references`
--
ALTER TABLE `fusion_references`
  ADD PRIMARY KEY (`reference`,`referenced`),
  ADD KEY `referenced_is` (`referenced`);

--
-- Index pour la table `groupe_activite`
--
ALTER TABLE `groupe_activite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bd` (`bd`);

--
-- Index pour la table `groupe_propriete`
--
ALTER TABLE `groupe_propriete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bd` (`bd`);

--
-- Index pour la table `groupe_utilisateur`
--
ALTER TABLE `groupe_utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bd` (`bd`);

--
-- Index pour la table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `propriete`
--
ALTER TABLE `propriete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_groupe` (`id_groupe`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_groupe` (`id_groupe`);

--
-- Index pour la table `valeur_activite`
--
ALTER TABLE `valeur_activite`
  ADD PRIMARY KEY (`id_activite`,`id_propriete`),
  ADD KEY `id_propriete` (`id_propriete`);

--
-- Index pour la table `valeur_croisee`
--
ALTER TABLE `valeur_croisee`
  ADD PRIMARY KEY (`id_activite`,`id_utilisateur`),
  ADD KEY `valeur_croisee_ibfk_2` (`id_utilisateur`);

--
-- Index pour la table `valeur_utilisateur`
--
ALTER TABLE `valeur_utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`,`id_propriete`),
  ADD KEY `id_propriete` (`id_propriete`);

--
-- Index pour la table `visu`
--
ALTER TABLE `visu`
  ADD PRIMARY KEY (`bd`),
  ADD KEY `id_user_id` (`id_user`),
  ADD KEY `id_groupe_act_id` (`id_groupe_act`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `activite`
--
ALTER TABLE `activite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=471;
--
-- AUTO_INCREMENT pour la table `application`
--
ALTER TABLE `application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT pour la table `groupe_activite`
--
ALTER TABLE `groupe_activite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `groupe_propriete`
--
ALTER TABLE `groupe_propriete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT pour la table `groupe_utilisateur`
--
ALTER TABLE `groupe_utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT pour la table `operation`
--
ALTER TABLE `operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `propriete`
--
ALTER TABLE `propriete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `activite`
--
ALTER TABLE `activite`
  ADD CONSTRAINT `activite_ibfk_1` FOREIGN KEY (`id_groupe`) REFERENCES `groupe_activite` (`id`);

--
-- Contraintes pour la table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `appli_bd_is` FOREIGN KEY (`bd`) REFERENCES `bd` (`id`),
  ADD CONSTRAINT `calcul_is` FOREIGN KEY (`id_operation`) REFERENCES `operation` (`id`),
  ADD CONSTRAINT `groupe_is` FOREIGN KEY (`id_groupe_pr`) REFERENCES `groupe_propriete` (`id`);

--
-- Contraintes pour la table `fusion_references`
--
ALTER TABLE `fusion_references`
  ADD CONSTRAINT `reference_is` FOREIGN KEY (`reference`) REFERENCES `application` (`id`),
  ADD CONSTRAINT `referenced_is` FOREIGN KEY (`referenced`) REFERENCES `application` (`id`);

--
-- Contraintes pour la table `groupe_activite`
--
ALTER TABLE `groupe_activite`
  ADD CONSTRAINT `gpa_bd_is` FOREIGN KEY (`bd`) REFERENCES `bd` (`id`);

--
-- Contraintes pour la table `groupe_propriete`
--
ALTER TABLE `groupe_propriete`
  ADD CONSTRAINT `gpp_bd_is` FOREIGN KEY (`bd`) REFERENCES `bd` (`id`);

--
-- Contraintes pour la table `groupe_utilisateur`
--
ALTER TABLE `groupe_utilisateur`
  ADD CONSTRAINT `gpu_bd_is` FOREIGN KEY (`bd`) REFERENCES `bd` (`id`);

--
-- Contraintes pour la table `propriete`
--
ALTER TABLE `propriete`
  ADD CONSTRAINT `propriete_ibfk_1` FOREIGN KEY (`id_groupe`) REFERENCES `groupe_propriete` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`id_groupe`) REFERENCES `groupe_utilisateur` (`id`);

--
-- Contraintes pour la table `valeur_activite`
--
ALTER TABLE `valeur_activite`
  ADD CONSTRAINT `valeur_activite_ibfk_1` FOREIGN KEY (`id_activite`) REFERENCES `activite` (`id`),
  ADD CONSTRAINT `valeur_activite_ibfk_2` FOREIGN KEY (`id_propriete`) REFERENCES `propriete` (`id`);

--
-- Contraintes pour la table `valeur_utilisateur`
--
ALTER TABLE `valeur_utilisateur`
  ADD CONSTRAINT `valeur_utilisateur_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `valeur_utilisateur_ibfk_2` FOREIGN KEY (`id_propriete`) REFERENCES `propriete` (`id`);

--
-- Contraintes pour la table `visu`
--
ALTER TABLE `visu`
  ADD CONSTRAINT `id_groupe_act_id` FOREIGN KEY (`id_groupe_act`) REFERENCES `groupe_activite` (`id`),
  ADD CONSTRAINT `id_user_id` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `vis_bd_is` FOREIGN KEY (`bd`) REFERENCES `bd` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
