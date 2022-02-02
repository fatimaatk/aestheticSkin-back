-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 02 fév. 2022 à 09:24
-- Version du serveur :  8.0.27-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `store`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'visage et cou'),
(2, 'contour des yeux'),
(3, 'mains');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `comments`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae orci pretium, malesuada diam et, condimentum leo. Vestibulum id luctus erat, sit amet maximus nisi. Suspendisse facilisis dui ligula, vitae ornare nibh accumsan vitae. Phasellus in diam tortor. '),
(2, 'Vivamus elementum tincidunt sapien porta dignissim. Donec iaculis dictum nibh non volutpat. Donec nec posuere justo. Maecenas vestibulum dignissim tristique. Fusce interdum massa at urna dictum, ut finibus ligula dapibus. Nulla facilisi. Praesent ac mattis mi, id eleifend ex. In tincidunt vehicula sem vitae eleifend. In elementum lobortis laoreet. Proin augue massa, sagittis et elit ut, maximus bibendum arcu. Curabitur ut leo sapien.');

-- --------------------------------------------------------

--
-- Structure de la table `favoris`
--

CREATE TABLE `favoris` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `favoris`
--

INSERT INTO `favoris` (`id`, `product_id`, `user_id`) VALUES
(1, 1, 1),
(2, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `image1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image2` varchar(255) NOT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int NOT NULL,
  `texture_id` int DEFAULT NULL,
  `description` text NOT NULL,
  `ingrédients` text NOT NULL,
  `contenance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `title`, `image1`, `image2`, `image3`, `image4`, `price`, `category_id`, `texture_id`, `description`, `ingrédients`, `contenance`) VALUES
(1, 'La crème hydratante', 'img1', 'img2', 'img3', 'img4', '29.50', 1, 1, 'Votre indispensable pour une peau éclatante !\r\nAppliquez matin et soir pour un résultat efficace.\r\nNotre crème contient un SPF 50. Appliquez-la sur tout votre visage sans oublier votre cou. Faites des mouvements circulaire pour la faire pénétrer, puis étirez la matière de l\'intérieur vers l\'extérieur du visage.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque.', '80 ml'),
(2, 'Le sérum fluide', 'img1', 'img2', 'img3', NULL, '19.50', 1, 2, 'Notre sérum est un véritable shot d\'actif pour la peau. Il s\'utilise toujours en complément d\'une crème de jour afin de booster son action. \r\n', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '50 ml'),
(3, 'Le soin contour des yeux', 'img1', 'img2', 'img3', NULL, '21.50', 2, 1, 'Ce soin permet de redonner un coup d’éclat à la peau. \r\nConcentré en vitamines, il permettra de décongestionner le contour de vos yeux et ainsi de révéler votre regard.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '50 ml'),
(4, 'La lotion tonique', 'img1', 'img2', 'img3', NULL, '24.50', 1, 3, 'Idéale pour reserrer les pores, elle élimine les peaux mortes et les traces restantes de maquillage.\r\nLa lotion tonique s\'utilise toujours après avoir nettoyé la peau pour un effet fraîcheur.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '120 ml'),
(5, 'La crème douceur des mains', 'img1', 'img2', NULL, NULL, '14.50', 3, 1, 'En utilisant notre crème protectrice, vos mains sont préservées des agressions extérieures. \r\nLes mains sont en effet des zones très exposées. \r\nNotre crème va alors réparer les micro-gerçures et consolider la barrière cutanée.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '50 ml'),
(6, 'Le jade roller', 'img1', 'img2', NULL, NULL, '25.50', 1, NULL, 'Le rouleau de jade est un précieux outil de beauté asiatique en pierre fine, développé et peaufiné au cours des siècles. \r\nIl améliore l\'apparence et la santé de la peau du visage grâce à un massage doux et frais. \r\nAdapté à tous types de peau, il prodigue un soin profond et révélateur d\'éclat.', 'Pierre fine 100% naturelle et pure', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `rate`
--

CREATE TABLE `rate` (
  `id` int NOT NULL,
  `note` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `rate`
--

INSERT INTO `rate` (`id`, `note`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `rate_comment`
--

CREATE TABLE `rate_comment` (
  `id` int NOT NULL,
  `rate_id` int NOT NULL,
  `comment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `rate_comment`
--

INSERT INTO `rate_comment` (`id`, `rate_id`, `comment_id`, `user_id`, `product_id`) VALUES
(1, 5, 1, 1, 1),
(2, 5, 1, 1, 2),
(3, 4, 2, 1, 3),
(4, 5, 1, 1, 4),
(5, 4, 2, 1, 5),
(6, 4, 2, 1, 6);

-- --------------------------------------------------------

--
-- Structure de la table `texture`
--

CREATE TABLE `texture` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `texture`
--

INSERT INTO `texture` (`id`, `title`) VALUES
(1, 'crème'),
(2, 'sérum'),
(3, 'lotion');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `email`, `password`) VALUES
(1, 'Lenard', 'Sarah', 'admin@admin.fr', 'password');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `favoris`
--
ALTER TABLE `favoris`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `product_id` (`product_id`,`user_id`),
  ADD KEY `favoris_user` (`user_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `products_texture` (`texture_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Index pour la table `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `rate_comment`
--
ALTER TABLE `rate_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `rate_comment_comment` (`comment_id`),
  ADD KEY `rate_comment_user` (`user_id`),
  ADD KEY `rate_comment_product` (`product_id`),
  ADD KEY `rate_comment_rate` (`rate_id`) USING BTREE;

--
-- Index pour la table `texture`
--
ALTER TABLE `texture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `favoris`
--
ALTER TABLE `favoris`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `rate`
--
ALTER TABLE `rate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `rate_comment`
--
ALTER TABLE `rate_comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `texture`
--
ALTER TABLE `texture`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `favoris`
--
ALTER TABLE `favoris`
  ADD CONSTRAINT `favoris_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `favoris_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `products_texture` FOREIGN KEY (`texture_id`) REFERENCES `texture` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `rate_comment`
--
ALTER TABLE `rate_comment`
  ADD CONSTRAINT `rate_comment_comment` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `rate_comment_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `rate_comment_rate` FOREIGN KEY (`rate_id`) REFERENCES `rate` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `rate_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
