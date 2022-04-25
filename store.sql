-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 25 avr. 2022 à 06:58
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `category_title`) VALUES
(1, 'visage et cou'),
(2, 'contour des yeux'),
(3, 'mains');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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

DROP TABLE IF EXISTS `favoris`;
CREATE TABLE IF NOT EXISTS `favoris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`),
  KEY `product_id` (`product_id`,`user_id`),
  KEY `favoris_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

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

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  `texture_id` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `ingredients` text NOT NULL,
  `contenance` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `products_texture` (`texture_id`),
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `title`, `image1`, `image2`, `image3`, `image4`, `price`, `category_id`, `texture_id`, `description`, `ingredients`, `contenance`) VALUES
(1, 'La crème hydratante', 'http://localhost:3000/assets/creme1.jpeg', 'http://localhost:3000/assets/creme2.jpeg', 'http://localhost:3000/assets/creme3.jpeg', NULL, '29.50', 1, 3, 'Votre indispensable pour une peau éclatante !\r\nAppliquez matin et soir pour un résultat efficace.\r\nNotre crème contient un SPF 50. Appliquez-la sur tout votre visage sans oublier votre cou. Faites des mouvements circulaire pour la faire pénétrer, puis étirez la matière de l\'intérieur vers l\'extérieur du visage.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque', '80 ml'),
(2, 'Le sérum fluide', 'http://localhost:3000/assets/serum1.jpeg', 'http://localhost:3000/assets/serum2.jpeg', 'http://localhost:3000/assets/serum3.jpeg', NULL, '19.50', 1, 2, 'Notre sérum est un véritable shot d\'actif pour la peau. Il s\'utilise toujours en complément d\'une crème de jour afin de booster son action.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '50 ml'),
(3, 'Le soin contour des yeux', 'http://localhost:3000/assets/yeux1.jpeg', 'http://localhost:3000/assets/yeux2.jpeg', 'http://localhost:3000/assets/yeux3.jpeg', NULL, '21.50', 2, 1, 'Ce soin permet de redonner un coup d’éclat à la peau. \r\nConcentré en vitamines, il permettra de décongestionner le contour de vos yeux et ainsi de révéler votre regard.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '50 ml'),
(4, 'La lotion tonique', 'http://localhost:3000/assets/lotion1.jpeg', 'http://localhost:3000/assets/lotion2.jpeg', 'http://localhost:3000/assets/lotion3.jpeg', NULL, '24.50', 1, 3, 'Idéale pour reserrer les pores, elle élimine les peaux mortes et les traces restantes de maquillage.\r\nLa lotion tonique s\'utilise toujours après avoir nettoyé la peau pour un effet fraîcheur.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '120 ml'),
(5, 'La crème douceur des mains', 'http://localhost:3000/assets/hand1.jpeg', 'http://localhost:3000/assets/hand2.jpeg', NULL, NULL, '14.50', 3, 1, 'En utilisant notre crème protectrice, vos mains sont préservées des agressions extérieures. \r\nLes mains sont en effet des zones très exposées. \r\nNotre crème va alors réparer les micro-gerçures et consolider la barrière cutanée.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '50 ml'),
(6, 'Le jade roller', 'http://localhost:3000/assets/jaderoll.jpeg', 'http://localhost:3000/assets/jaderoll2.jpeg', NULL, NULL, '25.50', 1, 4, 'Le rouleau de jade est un précieux outil de beauté asiatique en pierre fine, développé et peaufiné au cours des siècles. \r\nIl améliore l\'apparence et la santé de la peau du visage grâce à un massage doux et frais. \r\nAdapté à tous types de peau, il prodigue un soin profond et révélateur d\'éclat.', 'Pierre fine 100% naturelle et pure 666666666', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `rate`
--

DROP TABLE IF EXISTS `rate`;
CREATE TABLE IF NOT EXISTS `rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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

DROP TABLE IF EXISTS `rate_comment`;
CREATE TABLE IF NOT EXISTS `rate_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rate_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `rate_comment_comment` (`comment_id`),
  KEY `rate_comment_user` (`user_id`),
  KEY `rate_comment_product` (`product_id`),
  KEY `rate_comment_rate` (`rate_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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

DROP TABLE IF EXISTS `texture`;
CREATE TABLE IF NOT EXISTS `texture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texture_title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `texture`
--

INSERT INTO `texture` (`id`, `texture_title`) VALUES
(1, 'Crème'),
(2, 'Sérum'),
(3, 'Lotion'),
(4, 'Accessoire');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `is_admin`, `lastname`, `firstname`) VALUES
(1, 'admin@admin.fr', 'password', 1, 'fatimouche2', 'fatimouche1'),
(22, 'test@test.com', '$2b$10$RCPvhWQO6N9SP8cahUhpfuKDcOjVCpmZumXMi1IJ3l5mrTc8EWUhy', 1, 'ait khelifa', 'fatima'),
(23, 'fatima@admin.com', '$2b$10$UXGFuODycHwfBGQG1wAm6.oLIPR/7ADwF6VZfF5WQ.r4NELMgDcsq', 1, 'admin', 'fatima'),
(24, 'test1@test.com', '$2b$10$Sp.4t.hZvkxi25lTWsh19.UnVKGBZSdin5qQ1fL6tZs0YG1kAGUrS', 0, 'Bounoua', 'Fatima'),
(25, 'test2@test.com', '$2b$10$Dc2lvmJeCY3agmgvhzUVJ.9aM1evx6S5zJAAqGqXGm7mTCNxHU45a', 0, 'test2', 'test');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `favoris`
--
ALTER TABLE `favoris`
  ADD CONSTRAINT `favoris_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `favoris_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `products_texture` FOREIGN KEY (`texture_id`) REFERENCES `texture` (`id`);

--
-- Contraintes pour la table `rate_comment`
--
ALTER TABLE `rate_comment`
  ADD CONSTRAINT `rate_comment_comment` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `rate_comment_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `rate_comment_rate` FOREIGN KEY (`rate_id`) REFERENCES `rate` (`id`),
  ADD CONSTRAINT `rate_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
