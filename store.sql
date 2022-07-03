-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 03 juil. 2022 à 20:20
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
-- Structure de la table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `nom_delivery` varchar(255) DEFAULT NULL,
  `prenom_delivery` varchar(255) DEFAULT NULL,
  `nom_shipping` varchar(255) DEFAULT NULL,
  `prenom_shipping` varchar(255) DEFAULT NULL,
  `adress_shipping` varchar(255) DEFAULT NULL,
  `adress_delivery` varchar(255) DEFAULT NULL,
  `type_paiement` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `price_delivery` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `codePostal_shipping` int(11) DEFAULT NULL,
  `ville_shipping` varchar(255) DEFAULT NULL,
  `codePostal_delivery` int(11) DEFAULT NULL,
  `ville_delivery` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  KEY `paiement_id` (`type_paiement`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `nom_delivery`, `prenom_delivery`, `nom_shipping`, `prenom_shipping`, `adress_shipping`, `adress_delivery`, `type_paiement`, `status_id`, `price_delivery`, `total_price`, `codePostal_shipping`, `ville_shipping`, `codePostal_delivery`, `ville_delivery`) VALUES
(1, 23, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 22, 'coucou', 'coucou', 'coucou', 'coucou', 'coucou', 'coucou', NULL, NULL, NULL, NULL, 59000, 'coucou', 59000, 'coucou'),
(12, NULL, 'test', 'test', 'test', 'test', 'test', 'test', NULL, NULL, NULL, NULL, 5900, 'post', 5900, 'post'),
(13, NULL, 'test', 'test', 'test', 'test', 'ccoucou', 'ccoucou', NULL, NULL, NULL, NULL, 5900000, 'post', 5900000, 'post'),
(14, 22, 'test', 'test', 'test', 'test', 'test', 'test', NULL, NULL, NULL, NULL, 59000, 'test', 59000, 'test'),
(15, 22, 'test', 'test', 'test', 'test', 'test', 'test', NULL, NULL, NULL, NULL, 59000, 'test', 59000, 'test'),
(16, 22, 'Ait Khelifa', 'Fatima', 'Ait Khelifa', 'Fatima', '23 rue de l\'amiral courbet', '23 rue de l\'amiral courbet', 1, 1, 0, 51, 59000, 'Lille', 59000, 'Lille'),
(17, 22, 'Ait Khelifa', 'Fatima', 'Ait Khelifa', 'Fatima', '23 rue de l\'amiral courbet', '23 rue de l\'amiral courbet', NULL, 1, 0, 198, 59000, 'Lille', 59000, 'Lille');

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
-- Structure de la table `delivery_status`
--

DROP TABLE IF EXISTS `delivery_status`;
CREATE TABLE IF NOT EXISTS `delivery_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `delivery_status`
--

INSERT INTO `delivery_status` (`id`, `status`) VALUES
(1, 'Validée'),
(2, 'En cours'),
(3, 'Livrée');

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
-- Structure de la table `many_product_cart`
--

DROP TABLE IF EXISTS `many_product_cart`;
CREATE TABLE IF NOT EXISTS `many_product_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_fk` (`cart_id`),
  KEY `product_fk` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `many_product_cart`
--

INSERT INTO `many_product_cart` (`id`, `cart_id`, `product_id`, `qty`) VALUES
(1, 1, 1, 2),
(2, 16, 1, 1),
(3, 16, 3, 1),
(4, 16, 1, 1),
(5, 16, 3, 1),
(6, 17, 1, 4),
(7, 17, 3, 1),
(8, 17, 5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
CREATE TABLE IF NOT EXISTS `paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_paiement` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`id`, `type_paiement`) VALUES
(1, 'Paypal'),
(3, 'Carte');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
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

INSERT INTO `products` (`id`, `title`, `image1`, `image2`, `image3`, `price`, `category_id`, `texture_id`, `description`, `ingredients`, `contenance`) VALUES
(1, 'La crème hydratante', 'http://localhost:3000/assets/creme1.jpeg', 'http://localhost:3000/assets/creme2.jpeg', 'http://localhost:3000/assets/creme3.jpeg', '29.50', 1, 1, 'Votre indispensable pour une peau éclatante !\r\nAppliquez matin et soir pour un résultat efficace.\r\nNotre crème contient un SPF 50. Appliquez-la sur tout votre visage sans oublier votre cou. Faites des mouvements circulaire pour la faire pénétrer, puis étirez la matière de l\'intérieur vers l\'extérieur du visage.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque', '80 ml'),
(2, 'Le sérum fluide', 'http://localhost:3000/assets/serum1.jpeg', 'http://localhost:3000/assets/serum2.jpeg', 'http://localhost:3000/assets/serum3.jpeg', '19.50', 1, 2, 'Notre sérum est un véritable shot d\'actif pour la peau. Il s\'utilise toujours en complément d\'une crème de jour afin de booster son action.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '50 ml'),
(3, 'Le soin contour des yeux', 'http://localhost:3000/assets/yeux1.jpeg', 'http://localhost:3000/assets/yeux2.jpeg', 'http://localhost:3000/assets/yeux3.jpeg', '21.50', 2, 1, 'Ce soin permet de redonner un coup d’éclat à la peau. \r\nConcentré en vitamines, il permettra de décongestionner le contour de vos yeux et ainsi de révéler votre regard.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '50 ml'),
(4, 'La lotion tonique', 'http://localhost:3000/assets/lotion1.jpeg', 'http://localhost:3000/assets/lotion2.jpeg', 'http://localhost:3000/assets/lotion3.jpeg', '24.50', 1, 3, 'Idéale pour reserrer les pores, elle élimine les peaux mortes et les traces restantes de maquillage.\r\nLa lotion tonique s\'utilise toujours après avoir nettoyé la peau pour un effet fraîcheur.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '120 ml'),
(5, 'La crème douceur des mains', 'http://localhost:3000/assets/image1-1650894834727.jpeg', 'http://localhost:3000/assets/image2-1650894788051.jpeg', 'http://localhost:3000/assets/image3-1650894559523.jpeg', '14.50', 3, 1, 'En utilisant notre crème protectrice, vos mains sont préservées des agressions extérieures. \r\nLes mains sont en effet des zones très exposées. \r\nNotre crème va alors réparer les micro-gerçures et consolider la barrière cutanée.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur tincidunt ornare. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent rhoncus in massa non euismod. Ut in mauris eu ex auctor malesuada. Morbi sollicitudin, odio sit amet vestibulum dictum, risus felis facilisis tellus, et mollis urna tortor pharetra neque. Maecenas suscipit faucibus libero, ac tincidunt erat commodo mattis. Cras pellentesque lobortis neque, vel vestibulum eros fermentum eget. Sed scelerisque vel magna et maximus.', '50 ml'),
(6, 'Le jade roller', 'http://localhost:3000/assets/jaderoll.jpeg', 'http://localhost:3000/assets/image2-1650894382496.webp', 'http://localhost:3000/assets/image3-1650893910227.jpeg', '25.50', 1, 4, 'Le rouleau de jade est un précieux outil de beauté asiatique en pierre fine, développé et peaufiné au cours des siècles. \r\nIl améliore l\'apparence et la santé de la peau du visage grâce à un massage doux et frais. \r\nAdapté à tous types de peau, il prodigue un soin profond et révélateur d\'éclat.', 'Pierre fine 100% naturelle et pure', NULL);

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
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `isVisible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `rate_comment_user` (`user_id`),
  KEY `rate_comment_product` (`product_id`),
  KEY `rate_comment_rate` (`rate_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rate_comment`
--

INSERT INTO `rate_comment` (`id`, `rate_id`, `user_id`, `product_id`, `comment`, `isVisible`) VALUES
(1, 5, 1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', 0),
(2, 5, 1, 2, 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0),
(3, 4, 1, 3, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 0),
(4, 5, 1, 4, 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 0),
(5, 4, 1, 5, 'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur.', 0),
(6, 4, 1, 6, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', 0),
(11, 5, 1, 4, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', 0),
(12, 3, 22, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', 0),
(13, 2, 22, 2, 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1),
(14, 2, 22, 3, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 0),
(15, 3, 22, 4, 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 1),
(16, 5, 22, 5, 'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur.', 1),
(17, 4, 22, 6, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', 1),
(18, 3, 23, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', 1),
(19, 2, 23, 2, 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1),
(20, 4, 23, 3, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 1),
(21, 5, 23, 4, 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 1),
(22, 2, 23, 5, 'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur.', 1),
(23, 2, 23, 6, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', 1),
(32, 1, 25, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', 1),
(33, 5, 25, 2, 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1),
(34, 2, 25, 3, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 1),
(35, 4, 25, 4, 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.', 1),
(36, 5, 25, 5, 'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur.', 1),
(37, 5, 25, 6, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', 1),
(42, 5, 28, 1, 'heloooo', 0),
(43, 5, 22, 1, 'Super produit !', 0),
(44, 5, 22, 1, 'Super produit !', 0),
(45, 5, 22, 1, 'Yes!', 0),
(46, 5, 22, 1, 'Super produit !', 0),
(47, 4, 22, 1, 'Magnifque produit', 0),
(48, 3, 22, 3, 'Pas top !', 0),
(49, 5, 22, 3, 'Vraiment super !', 0),
(50, 5, 22, 3, 'Génial !', 0);

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
  `adresse` varchar(255) NOT NULL,
  `codePostal` int(11) NOT NULL,
  `ville` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `is_admin`, `lastname`, `firstname`, `adresse`, `codePostal`, `ville`) VALUES
(1, 'admin@admin.fr', 'password', 1, 'fatimouche2', 'fatimouche1', '', 0, ''),
(22, 'test@test.com', '$2b$10$RCPvhWQO6N9SP8cahUhpfuKDcOjVCpmZumXMi1IJ3l5mrTc8EWUhy', 1, 'ait khelifa', 'fatima', 'coucou', 59, 'coucou'),
(23, 'fatima@admin.com', '$2b$10$UXGFuODycHwfBGQG1wAm6.oLIPR/7ADwF6VZfF5WQ.r4NELMgDcsq', 1, 'admin', 'fatima', '', 0, ''),
(25, 'test2@test.com', '$2b$10$Dc2lvmJeCY3agmgvhzUVJ.9aM1evx6S5zJAAqGqXGm7mTCNxHU45a', 0, 'test2', 'test', '', 0, ''),
(28, 'coucou@coucou.com', '$2b$10$HlnqhMY5nFWEMDofCqlzF.DAlyxv1hYKI6mMoCNOvmMnJFxkUuQre', 0, 'coucou', 'coucou', 'coucou', 59, 'coucou'),
(29, 'fatima@fatima.com', '$2b$10$gFXS6H5RUBdfTFJ.u0YA/.LaMOioRUD/RJKZlNEBTdFehIdps1Llm', 0, 'Fatima', 'Fatima', '9 rue fatima', 59222, 'Fatima'),
(30, '1@1.com', '$2b$10$dLvlyPcX1EPVix0j/rikBekVp6NrPaLMgjWAfebzS6ebfLUs1jbYi', 0, 'coucou', 'couccou', 'coucou', 59000, 'COUCOU'),
(31, 'testtt@test.com', '$2b$10$qEWTApomx2r13lpIWyYnSe8ZxDVHZo4txeTgzOfRcETc2cd1h7uAS', 0, 'fatima', 'fatima', 'coucou', 59, 'coucou'),
(32, 'coucou@coucouuu.com', '$2b$10$7YVQ4XqjXsl9823pAAZfd.ZRp/HEddpkzRO4.hrTRZkUHkjFaHSa2', 0, 'coucou', 'bertrand', '212121', 21212, 'lille'),
(33, 'nouveau@nouveau.com', '$2b$10$WEQerS9iqR9qrGrYgsQkR.dMaHGeRHbLqBaW4WKeiRbT3ZNe/qp6e', 0, 'nouveau', 'nouveau', '111', 11111, 'nouveau');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `paiement_id` FOREIGN KEY (`type_paiement`) REFERENCES `paiement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `status_id` FOREIGN KEY (`status_id`) REFERENCES `delivery_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `favoris`
--
ALTER TABLE `favoris`
  ADD CONSTRAINT `favoris_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `favoris_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `many_product_cart`
--
ALTER TABLE `many_product_cart`
  ADD CONSTRAINT `cart_fk` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_texture` FOREIGN KEY (`texture_id`) REFERENCES `texture` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `rate_comment`
--
ALTER TABLE `rate_comment`
  ADD CONSTRAINT `rate_comment_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rate_comment_rate` FOREIGN KEY (`rate_id`) REFERENCES `rate` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rate_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
