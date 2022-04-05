-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 10 fév. 2022 à 12:24
-- Version du serveur :  8.0.28-0ubuntu0.20.04.3
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `comments` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `favoris`
--

INSERT INTO `favoris` (`id`, `product_id`, `user_id`) VALUES
(8, 4, 1),
(9, 4, 1),
(6, 5, 1),
(10, 5, 1),
(11, 5, 1),
(7, 6, 1),
(16, 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `image1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image2` varchar(255) NOT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int NOT NULL,
  `texture_id` int DEFAULT NULL,
  `description` text NOT NULL,
  `ingrédients` text NOT NULL,
  `contenance` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `texture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `title`, `image1`, `image2`, `image3`, `image4`, `price`, `category_id`, `texture_id`, `description`, `ingrédients`, `contenance`, `category`, `texture`) VALUES
(1, 'La crème hydratante', 'http://localhost:3000/assets/creme1.jpeg', 'http://localhost:3000/assets/creme2.jpeg', 'http://localhost:3000/assets/creme3.jpeg', NULL, '29.50', 1, 1, 'Votre indispensable pour une peau éclatante !\r\nAppliquez matin et soir pour un résultat efficace.\r\nNotre crème contient un SPF 50. Appliquez-la sur tout votre visage sans oublier votre cou. Faites des mouvements circulaire pour la faire pénétrer, puis étirez la matière de l\'intérieur vers l\'extérieur du visage.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque.', '80 ml', 'visage et cou', 'crème'),
(2, 'Le sérum fluide', 'http://localhost:3000/assets/serum1.jpeg', 'http://localhost:3000/assets/serum2.jpeg', 'http://localhost:3000/assets/serum3.jpeg', NULL, '19.50', 1, 2, 'Notre sérum est un véritable shot d\'actif pour la peau. Il s\'utilise toujours en complément d\'une crème de jour afin de booster son action. \r\n', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '50 ml', 'visage et cou', 'sérum'),
(3, 'Le soin contour des yeux', 'http://localhost:3000/assets/yeux1.jpeg', 'http://localhost:3000/assets/yeux2.jpeg', 'http://localhost:3000/assets/yeux3.jpeg', NULL, '21.50', 2, 1, 'Ce soin permet de redonner un coup d’éclat à la peau. \r\nConcentré en vitamines, il permettra de décongestionner le contour de vos yeux et ainsi de révéler votre regard.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '50 ml', 'contour des yeux', 'crème'),
(4, 'La lotion tonique', 'http://localhost:3000/assets/lotion1.jpeg', 'http://localhost:3000/assets/lotion2.jpeg', 'http://localhost:3000/assets/lotion3.jpeg', NULL, '24.50', 1, 3, 'Idéale pour reserrer les pores, elle élimine les peaux mortes et les traces restantes de maquillage.\r\nLa lotion tonique s\'utilise toujours après avoir nettoyé la peau pour un effet fraîcheur.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '120 ml', 'visage et cou', 'lotion'),
(5, 'La crème douceur des mains', 'http://localhost:3000/assets/hand1.jpeg', 'http://localhost:3000/assets/hand2.jpeg', NULL, NULL, '14.50', 3, 1, 'En utilisant notre crème protectrice, vos mains sont préservées des agressions extérieures. \r\nLes mains sont en effet des zones très exposées. \r\nNotre crème va alors réparer les micro-gerçures et consolider la barrière cutanée.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '50 ml', 'main', 'crème'),
(6, 'Le jade roller', 'http://localhost:3000/assets/jaderoll.jpeg', 'http://localhost:3000/assets/jaderoll2.jpeg', NULL, NULL, '25.50', 1, NULL, 'Le rouleau de jade est un précieux outil de beauté asiatique en pierre fine, développé et peaufiné au cours des siècles. \r\nIl améliore l\'apparence et la santé de la peau du visage grâce à un massage doux et frais. \r\nAdapté à tous types de peau, il prodigue un soin profond et révélateur d\'éclat.', 'Pierre fine 100% naturelle et pure', NULL, 'visage et cou', '');

-- --------------------------------------------------------

--
-- Structure de la table `rate`
--

CREATE TABLE `rate` (
  `id` int NOT NULL,
  `note` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `product_id` int NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `rate_comment`
--

INSERT INTO `rate_comment` (`id`, `rate_id`, `comment_id`, `user_id`, `product_id`, `comment`) VALUES
(1, 5, 1, 1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
(2, 5, 1, 1, 2, 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(3, 4, 2, 1, 3, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.'),
(4, 5, 1, 1, 4, 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.'),
(5, 4, 2, 1, 5, 'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur.'),
(6, 4, 2, 1, 6, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.'),
(11, 5, 1, 1, 4, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.');

-- --------------------------------------------------------

--
-- Structure de la table `texture`
--

CREATE TABLE `texture` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `lastname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `is_admin`, `lastname`, `firstname`) VALUES
(1, 'admin@admin.fr', 'password', 1, 'fatimouche2', 'fatimouche1'),
(2, 'test@test.com', '$2b$10$CkvQeurSMA./gOduPbiI.OVJRkFMMGlTxyhS9yJEpgtJvmk07uAgS', 0, 'test', 'test'),
(3, 'test@gmail.com', '$2b$10$Lfuva7MXnWwo1CKZ3IcnW.feMyOR.ogclaV2woybqwLX/.nfmz.9G', 0, 'test', 'test'),
(4, 'test3@test.com', '$2b$10$u1ZXgfRKGmyRijacSEtPlOb3QmNZuGiXdZPgLuDWptchgte5yLGee', 0, 'test', 'test'),
(5, 'test5@test.com', '$2b$10$A7O5QyQukiIE/KhTMQzMGe2toEmP6zmbamxJYtpsEuvU4kCXgJ3b2', 0, 'test', 'test'),
(6, 'nico@nico.fr', '$2b$10$SUL.E3TRKu3pdmMHuurbeeTGLc9y5NkypLpR9frXi9lMOkkFohgeC', 0, 'saucisson', 'nico'),
(7, 'test6@test.com', '$2b$10$IIL0.uvNrDzHG4IdjPsLlebJtfsScEm27rJVfUUe4ckalz0i46JjO', 0, 'test', 'test'),
(8, 'test8@gmail.com', '$2b$10$LT6/kVxD4B6vKKlV9eb3z.dtjIXZj3hzvL/FVxkYWvq7eXxPJkuDK', 0, 'test', 'test'),
(9, 'test10@test.com', '$2b$10$cNBNCFmq8u7P/xfwGy828OgME4frUbpYNgOEd3v3mTIYLuiS6XGr6', 0, 'test', 'test'),
(10, 'test777@gmail.com', '$2b$10$WLMuFhz5mWzPg69Nj/6yvO7QwozubbwVkGCOqG.zW2CKMAwWg7R2u', 0, 'test', 'test'),
(11, 'dccc@dccc.com', '$2b$10$uxrVLKX4XlurG2KYPsk/TuPb19p5BBJdo/GvJ3VwMKNDC6kk0UD6K', 0, 'd', 'd'),
(12, 'admin@aadmin.fr', '$2b$10$cWuTR1uuiILUC6dWi3Cuk.LyKFUP5g.7VuXec1KzFQgmhUPqgIF8y', 1, 'test', 'test'),
(13, 'TEST12222@TEST.COM', '$2b$10$cmhzI8GTPwN7NhlmtnDfWeeEzwlVzMs0UTwITxuX1PyM2F2J/H87C', 0, 'AITKHELIFA', 'LYES'),
(14, 'testtt@gmail.com', '$2b$10$tdh0kiJBckk.Td0it4vv9uuPIkAet8hkTVjO3fmWtFz9foYxTG7I6', 0, 'test', 'TEST'),
(15, 'nico1@nico.fr', '$2b$10$kVL1qUocDFMdz4iPP4SV6OcCWPAcn0c9gtqbZHBEiX3xMiE5Pc1JK', 0, 'Le super Rigolo', 'Nico'),
(16, 'julien@test.com', '$2b$10$AHG9zjius4NY4RYP9l.9Iev2uX06cyDB0chdM1Z0Zt525t.bvYmzy', 0, 'Bruno', 'Kevin'),
(17, 'jenny@jenny.com', '$2b$10$ULmB4vj1.ww68yvwMK8iUuPWUIBoeJDR2//3jid7kH/0maALlur8y', 0, 'Beyonce', 'Beyonce');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `texture`
--
ALTER TABLE `texture`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
