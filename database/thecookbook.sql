-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2025 at 10:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thecookbook`
--
CREATE DATABASE IF NOT EXISTS `thecookbook` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `thecookbook`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Breakfast'),
(2, 'Lunch'),
(3, 'Dinner'),
(4, 'Snack'),
(5, 'Drinks'),
(6, 'Pastries'),
(7, 'Sweets');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `recipe_comments_id` int(11) DEFAULT NULL,
  `user_comments_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `created_at`, `recipe_comments_id`, `user_comments_id`) VALUES
(1, 'something nice', '2025-11-26 13:40:03', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20251125165535', '2025-11-25 17:55:51', 44),
('DoctrineMigrations\\Version20251125172308', '2025-11-25 18:23:14', 58),
('DoctrineMigrations\\Version20251125172903', '2025-11-25 18:29:06', 160),
('DoctrineMigrations\\Version20251125175642', '2025-11-25 18:56:49', 96),
('DoctrineMigrations\\Version20251125182728', '2025-11-25 19:27:31', 109),
('DoctrineMigrations\\Version20251126121837', '2025-11-26 13:18:43', 29);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`) VALUES
(1, 'Carrot'),
(2, 'Potato'),
(3, 'Tomato'),
(4, 'Onion'),
(5, 'Garlic'),
(6, 'Ginger'),
(7, 'Broccoli'),
(8, 'Cauliflower'),
(9, 'Spinach'),
(10, 'Kale'),
(11, 'Lettuce'),
(12, 'Cabbage'),
(13, 'Zucchini'),
(14, 'Eggplant'),
(15, 'Bell Pepper'),
(16, 'Green Beans'),
(17, 'Peas'),
(18, 'Corn'),
(19, 'Mushroom'),
(20, 'Celery'),
(21, 'Cucumber'),
(22, 'Pumpkin'),
(23, 'Sweet Potato'),
(24, 'Beetroot'),
(25, 'Asparagus'),
(26, 'Leek'),
(27, 'Apple'),
(28, 'Banana'),
(29, 'Orange'),
(30, 'Pineapple'),
(31, 'Strawberry'),
(32, 'Blueberry'),
(33, 'Grapes'),
(34, 'Peach'),
(35, 'Mango'),
(36, 'Pear'),
(37, 'Lemon'),
(38, 'Lime'),
(39, 'Watermelon'),
(40, 'Cantaloupe'),
(41, 'Avocado'),
(42, 'Kiwi'),
(43, 'Milk'),
(44, 'Butter'),
(45, 'Cheese'),
(46, 'Cream'),
(47, 'Yogurt'),
(48, 'Sour Cream'),
(49, 'Cream Cheese'),
(50, 'Mozzarella'),
(51, 'Cheddar'),
(52, 'Parmesan'),
(53, 'Chicken Breast'),
(54, 'Chicken Thigh'),
(55, 'Ground Beef'),
(56, 'Steak'),
(57, 'Pork Chop'),
(58, 'Pork Belly'),
(59, 'Bacon'),
(60, 'Ham'),
(61, 'Turkey'),
(62, 'Lamb'),
(63, 'Sausage'),
(64, 'Shrimp'),
(65, 'Salmon'),
(66, 'Tuna'),
(67, 'Cod'),
(68, 'Tilapia'),
(69, 'Crab'),
(70, 'Lobster'),
(71, 'Clams'),
(72, 'Mussels'),
(73, 'Squid'),
(74, 'Rice'),
(75, 'Brown Rice'),
(76, 'Quinoa'),
(77, 'Oats'),
(78, 'Barley'),
(79, 'Pasta'),
(80, 'Noodles'),
(81, 'Bread'),
(82, 'Tortilla'),
(83, 'Couscous'),
(84, 'Lentils'),
(85, 'Chickpeas'),
(86, 'Black Beans'),
(87, 'Kidney Beans'),
(88, 'Pinto Beans'),
(89, 'Soybeans'),
(90, 'Tofu'),
(91, 'Almonds'),
(92, 'Walnuts'),
(93, 'Pecans'),
(94, 'Cashews'),
(95, 'Peanuts'),
(96, 'Sunflower Seeds'),
(97, 'Pumpkin Seeds'),
(98, 'Chia Seeds'),
(99, 'Olive Oil'),
(100, 'Vegetable Oil'),
(101, 'Canola Oil'),
(102, 'Sesame Oil'),
(103, 'Coconut Oil'),
(104, 'Eggs'),
(105, 'Sugar'),
(106, 'Honey'),
(107, 'Maple Syrup'),
(108, 'Molasses'),
(109, 'Flour'),
(110, 'Yeast'),
(111, 'Baking Powder'),
(112, 'Baking Soda'),
(113, 'Cornstarch'),
(114, 'Cocoa Powder');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `recipe_ratings_id` int(11) DEFAULT NULL,
  `user_ratings_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `prep_time_min` int(11) NOT NULL,
  `cook_time_min` int(11) NOT NULL,
  `total_time_min` int(11) NOT NULL,
  `servings` int(11) NOT NULL,
  `difficulty` varchar(50) NOT NULL,
  `images` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_recipe_id` int(11) DEFAULT NULL,
  `categories_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `title`, `description`, `prep_time_min`, `cook_time_min`, `total_time_min`, `servings`, `difficulty`, `images`, `created_at`, `updated_at`, `user_recipe_id`, `categories_id`) VALUES
(1, 'something good', 'delicious', 12, 30, 42, 4, 'hard', 'something.jpeg', '2025-11-25 19:56:41', '2025-11-25 19:56:41', 1, 3),
(2, 'Teriyaki Chicken', 'chicken with rice and sauce', 15, 45, 60, 6, 'medium', 'teriyaki', '2025-11-26 12:46:50', '2025-11-26 12:46:50', 1, 3),
(3, 'random food', 'idk', 12, 13, 25, 4, 'hard', 'something', '2025-11-27 09:13:33', '2025-11-27 09:13:33', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_tags`
--

CREATE TABLE `recipe_tags` (
  `recipe_id` int(11) NOT NULL,
  `tags_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_tags`
--

INSERT INTO `recipe_tags` (`recipe_id`, `tags_id`) VALUES
(1, 1),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `spices`
--

CREATE TABLE `spices` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spices`
--

INSERT INTO `spices` (`id`, `name`) VALUES
(130, 'Black Pepper'),
(131, 'White Pepper'),
(132, 'Green Peppercorn'),
(133, 'Pink Peppercorn'),
(134, 'Long Pepper'),
(135, 'Cubeb Pepper'),
(136, 'Sichuan Peppercorn'),
(137, 'Sansho Pepper'),
(138, 'Grains of Paradise'),
(139, 'Selim Pepper'),
(140, 'Bird\'s Eye Chili'),
(141, 'Thai Chili'),
(142, 'Cayenne Pepper'),
(143, 'Aleppo Pepper'),
(144, 'Urfa Biber'),
(145, 'Piri Piri'),
(146, 'Arbol Chili'),
(147, 'Ancho Chili'),
(148, 'Pasilla Chili'),
(149, 'Guajillo Chili'),
(150, 'Mulato Chili'),
(151, 'Chipotle'),
(152, 'Habanero Powder'),
(153, 'Ghost Pepper Powder'),
(154, 'Carolina Reaper Powder'),
(155, 'Scotch Bonnet Powder'),
(156, 'Serrano Powder'),
(157, 'Aji Amarillo Powder'),
(158, 'Aji Panca Powder'),
(159, 'Cumin Seeds'),
(160, 'Ground Cumin'),
(161, 'Coriander Seeds'),
(162, 'Ground Coriander'),
(163, 'Fennel Seeds'),
(164, 'Caraway Seeds'),
(165, 'Anise Seeds'),
(166, 'Dill Seeds'),
(167, 'Fenugreek Seeds'),
(168, 'Mustard Seeds'),
(169, 'Yellow Mustard Seeds'),
(170, 'Brown Mustard Seeds'),
(171, 'Nigella Seeds'),
(172, 'Poppy Seeds'),
(173, 'Ajwain'),
(174, 'Celery Seed'),
(175, 'Hemp Seeds (culinary)'),
(176, 'Amaranth Seed'),
(177, 'Charoli (Chironji)'),
(178, 'Ginger'),
(179, 'Turmeric'),
(180, 'Galangal'),
(181, 'Greater Galangal'),
(182, 'Lesser Galangal'),
(183, 'Fingerroot'),
(184, 'Sand Ginger'),
(185, 'Horseradish'),
(186, 'Wasabi'),
(187, 'Arrowroot Powder'),
(188, 'Cinnamon'),
(189, 'Ceylon Cinnamon'),
(190, 'Cassia'),
(191, 'Cinnamon Sticks'),
(192, 'Star Anise'),
(193, 'Cardamom'),
(194, 'Green Cardamom'),
(195, 'Black Cardamom'),
(196, 'Tonka Beans'),
(197, 'Mastic'),
(198, 'Orris Root'),
(199, 'Asafoetida'),
(200, 'Asafoetida Resin'),
(201, 'Quassia Wood'),
(202, 'Sassafras'),
(203, 'Salep Powder'),
(204, 'Vanilla Bean'),
(205, 'Oregano'),
(206, 'Basil'),
(207, 'Thyme'),
(208, 'Rosemary'),
(209, 'Sage'),
(210, 'Parsley'),
(211, 'Marjoram'),
(212, 'Tarragon'),
(213, 'Mint'),
(214, 'Spearmint'),
(215, 'Peppermint'),
(216, 'Bay Leaf'),
(217, 'Curry Leaf'),
(218, 'Neem Leaf'),
(219, 'Kaffir Lime Leaf'),
(220, 'Lemongrass'),
(221, 'Sorrel'),
(222, 'Shiso Leaf'),
(223, 'Vietnamese Coriander'),
(224, 'Epazote'),
(225, 'Hoja Santa'),
(226, 'Woodruff'),
(227, 'Lemon Verbena'),
(228, 'Huacatay'),
(229, 'Sesame Leaves'),
(230, 'Pandan Leaf'),
(231, 'Saffron'),
(232, 'Cloves'),
(233, 'Lavender'),
(234, 'Dried Rose Petals'),
(235, 'Dried Rose Buds'),
(236, 'Chamomile'),
(237, 'Hibiscus'),
(238, 'Allspice'),
(239, 'Juniper Berries'),
(240, 'Citrus Peel Powder'),
(241, 'Lime Peel'),
(242, 'Lemon Peel'),
(243, 'Orange Peel'),
(244, 'Dried Tangerine Peel'),
(245, 'Dried Lime (Loomi)'),
(246, 'Aged Orange Peel (Chenpi)'),
(247, 'Vanilla Powder'),
(248, 'Black Garlic Powder'),
(249, 'Berbere'),
(250, 'Mitmita'),
(251, 'Suya Spice'),
(252, 'Ethiopian Koreima'),
(253, 'Kebsa Spice'),
(254, 'Rooibos Spice'),
(255, 'Moroccan Preserved Lemon Powder'),
(256, 'Za\'atar'),
(257, 'Lebanese Za\'atar'),
(258, 'Syrian Za\'atar'),
(259, 'Jordanian Za\'atar'),
(260, 'Sumac'),
(261, 'Mahleb'),
(262, 'Fenugreek Leaves (Kasuri Methi)'),
(263, 'Garam Masala'),
(264, 'Chaat Masala'),
(265, 'Tandoori Masala'),
(266, 'Curry Powder'),
(267, 'Panch Phoron'),
(268, 'Vadouvan'),
(269, 'Amchur (Dry Mango Powder)'),
(270, 'Tamarind Powder'),
(271, 'Kokum'),
(272, 'Kokum Rind'),
(273, 'Kalpasi (Stone Flower)'),
(274, 'Black Cumin'),
(275, 'Kalonji'),
(276, 'Dry Ginger Powder'),
(277, 'Five Spice Powder'),
(278, 'Furikake'),
(279, 'Shichimi Togarashi'),
(280, 'Yuzu Peel'),
(281, 'Kombu Powder'),
(282, 'Lotus Root Powder'),
(283, 'Hawthorn Powder'),
(284, 'Laksa Leaf (Vietnamese Coriander)'),
(285, 'Turmeric Leaf'),
(286, 'Galangal Powder'),
(287, 'Makrut Lime Peel'),
(288, 'Allspice (Pimento)'),
(289, 'Jerk Seasoning'),
(290, 'Achiote (Annatto Seeds)'),
(291, 'Epazote'),
(292, 'Mexican Oregano'),
(293, 'Culantro'),
(294, 'Sacha Culantro'),
(295, 'Himalayan Pink Salt'),
(296, 'Hawaiian Red Salt'),
(297, 'Hawaiian Black Lava Salt'),
(298, 'Fleur de Sel'),
(299, 'Maldon Salt'),
(300, 'Smoked Salt'),
(301, 'Roasted Garlic Powder'),
(302, 'Onion Powder'),
(303, 'Tomato Powder'),
(304, 'Mushroom Powder'),
(305, 'Porcini Powder'),
(306, 'Liquid Smoke Powder'),
(307, 'Fermented Black Bean Powder'),
(308, 'Miso Powder'),
(309, 'Nori Flakes'),
(310, 'Italian Seasoning'),
(311, 'Herbes de Provence'),
(312, 'BBQ Rub'),
(313, 'Creole Seasoning'),
(314, 'Cajun Seasoning'),
(315, 'Taco Seasoning'),
(316, 'Pumpkin Spice'),
(317, 'Apple Pie Spice'),
(318, 'Ranch Seasoning'),
(319, 'Steak Seasoning'),
(320, 'Poultry Seasoning'),
(321, 'Seafood Seasoning'),
(322, 'Annatto Powder'),
(323, 'Yerba Mate Powder'),
(324, 'Mango Ginger'),
(325, 'Copaiba Resin'),
(326, 'Grains of Selim'),
(327, 'Naga Jolokia Powder'),
(328, 'Black Lime Powder'),
(329, 'Persian Blue Salt');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(1, 'Spicy'),
(2, 'Gluten free'),
(3, 'Vegan');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `profile_picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`, `profile_picture`) VALUES
(1, 'sudhiribo@hotmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$anh2xuPJdn3e98ECNaYGLOn.eikP.tjjfbpDT4KtaHXafciM5KJh2', 'Sudhir', 'Gopie', 'sud logo.png'),
(2, 'knjio@gmail.com', '[\"ROLE_USER\"]', '$2y$13$XMVCjuuPUkRBzl417chP/u6vcgkbSVkJ2PC415.B2WKi1EfYVaLtK', 'Kimberly', 'Njio', 'sud logo.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5F9E962AB7C5DBE2` (`recipe_comments_id`),
  ADD KEY `IDX_5F9E962ACA2C5C13` (`user_comments_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CEB607C9DC026E2C` (`recipe_ratings_id`),
  ADD KEY `IDX_CEB607C9321B2EA3` (`user_ratings_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DA88B13759382FF0` (`user_recipe_id`),
  ADD KEY `IDX_DA88B137A21214B7` (`categories_id`);

--
-- Indexes for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  ADD PRIMARY KEY (`recipe_id`,`tags_id`),
  ADD KEY `IDX_10A7CEF959D8A214` (`recipe_id`),
  ADD KEY `IDX_10A7CEF98D7B4FB4` (`tags_id`);

--
-- Indexes for table `spices`
--
ALTER TABLE `spices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `spices`
--
ALTER TABLE `spices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_5F9E962AB7C5DBE2` FOREIGN KEY (`recipe_comments_id`) REFERENCES `recipe` (`id`),
  ADD CONSTRAINT `FK_5F9E962ACA2C5C13` FOREIGN KEY (`user_comments_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `FK_CEB607C9321B2EA3` FOREIGN KEY (`user_ratings_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_CEB607C9DC026E2C` FOREIGN KEY (`recipe_ratings_id`) REFERENCES `recipe` (`id`);

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `FK_DA88B13759382FF0` FOREIGN KEY (`user_recipe_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_DA88B137A21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  ADD CONSTRAINT `FK_10A7CEF959D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_10A7CEF98D7B4FB4` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
