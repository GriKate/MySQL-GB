-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_14
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `catalogs`
--

DROP DATABASE IF EXISTS photo_print_service;
CREATE DATABASE photo_print_service;
USE photo_print_service;

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'Фотографии'),(2,'Фотокниги'),(3,'Фотокалендари'),(4,'Постеры'),(5,'Печать на холсте'),(6,'Печать на пенокартоне'),(7,'Магниты с фото'),(8,'Кружки с фото');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layouts_photo`
--

DROP TABLE IF EXISTS `layouts_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layouts_photo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `layout_id` bigint(20) unsigned DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `photo_id` (`photo_id`),
  KEY `layout_id` (`layout_id`),
  CONSTRAINT `layouts_photo_ibfk_1` FOREIGN KEY (`photo_id`) REFERENCES `user_photo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `layouts_photo_ibfk_2` FOREIGN KEY (`layout_id`) REFERENCES `user_layouts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layouts_photo`
--

LOCK TABLES `layouts_photo` WRITE;
/*!40000 ALTER TABLE `layouts_photo` DISABLE KEYS */;
INSERT INTO `layouts_photo` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,1,21),(22,2,22),(23,3,23),(24,4,24),(25,5,25),(26,6,26),(27,7,27),(28,8,28),(29,9,29),(30,10,30),(31,11,31),(32,12,32),(33,13,33),(34,14,34),(35,15,35),(36,16,36),(37,17,37),(38,18,38),(39,19,39),(40,20,40),(41,1,41),(42,2,42),(43,3,43),(44,4,44),(45,5,45),(46,6,46),(47,7,47),(48,8,48),(49,9,49),(50,10,50),(51,11,51),(52,12,52),(53,13,53),(54,14,54),(55,15,55),(56,16,56),(57,17,57),(58,18,58),(59,19,59),(60,20,60),(61,1,61),(62,2,62),(63,3,63),(64,4,64),(65,5,65),(66,6,66),(67,7,67),(68,8,68),(69,9,69),(70,10,70),(71,11,71),(72,12,72),(73,13,73),(74,14,74),(75,15,75),(76,16,76),(77,17,77),(78,18,78),(79,19,79),(80,20,80);
/*!40000 ALTER TABLE `layouts_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `status` enum('обрабатывается','исполняется','доставка','выполнен','отменен') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2021-06-17 20:56:34','исполняется'),(2,2,'1990-02-09 06:37:28','отменен'),(3,8,'2008-08-26 15:48:20','обрабатывается'),
(4,5,'2009-10-26 22:24:22','выполнен'),(5,4,'2021-01-30 19:01:36','доставка'),(6,6,'2001-10-06 01:43:46','отменен'),(7,7,'2000-08-02 03:55:16','доставка'),
(8,12,'2021-12-05 08:13:01','исполняется'),(9,9,'1973-03-04 01:50:54','доставка'),(10,10,'2000-09-19 02:46:55','исполняется'),(11,17,'1971-01-09 06:57:36','доставка'),
(12,8,'1989-05-31 04:27:12','отменен'),(13,13,'1973-07-27 10:15:56','выполнен'),(14,15,'2021-11-28 16:41:23','выполнен'),(15,14,'2013-05-12 11:14:49','выполнен'),
(16,16,'2013-06-06 19:49:50','обрабатывается'),(17,28,'2022-05-02 20:35:45','отменен'),(18,18,'1982-05-24 02:29:52','доставка'),(19,19,'1995-11-10 09:11:11','отменен'),
(20,22,'2022-01-23 20:11:22','доставка'),(21,21,'1989-01-04 21:01:28','отменен'),(22,20,'1972-01-02 02:57:59','доставка'),(23,23,'1983-06-28 05:12:12','доставка'),
(24,3,'2021-01-16 03:44:12','выполнен'),(25,25,'2008-04-09 03:54:26','обрабатывается'),(26,26,'2000-11-09 04:05:25','обрабатывается'),
(27,27,'1995-01-02 06:59:35','доставка'),(28,11,'1982-02-08 01:21:40','выполнен'),(29,29,'2021-12-04 21:00:24','обрабатывается'),
(30,30,'2017-10-17 00:03:41','обрабатывается'),(31,15,'2004-04-05 01:04:21','выполнен'),(32,32,'2009-09-22 05:16:25','отменен'),
(33,35,'1984-08-08 02:20:07','доставка'),(34,34,'2005-04-05 04:18:04','отменен'),(35,33,'1981-11-13 04:32:06','исполняется'),
(36,36,'2021-07-28 04:44:19','выполнен'),(37,37,'2017-08-10 02:59:11','доставка'),(38,40,'2016-03-22 05:22:49','доставка'),
(39,39,'2022-03-28 23:50:28','доставка'),(40,3,'1970-06-12 16:59:11','исполняется');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `products_features_id` bigint(20) unsigned DEFAULT NULL,
  `catalog_id` int(10) unsigned DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  -- `price` bigint(20) unsigned DEFAULT NULL,
  `discount_id` bigint(20) unsigned DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `products_features_id` (`products_features_id`),
  KEY `catalog_id` (`catalog_id`),
  KEY `discount_id` (`discount_id`),
  CONSTRAINT `orders_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_products_ibfk_2` FOREIGN KEY (`products_features_id`) REFERENCES `products_features` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_products_ibfk_3` FOREIGN KEY (`catalog_id`) REFERENCES `catalogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_products_ibfk_4` FOREIGN KEY (`discount_id`) REFERENCES `promo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` VALUES (1,1,1,1,1,1,'\0'),(2,2,2,2,2,2,'\0'),(3,3,3,3,3,3,'\0'),(4,4,4,4,1,4,'\0'),(5,5,5,5,2,5,'\0'),
(6,6,6,6,3,6,'\0'),(7,7,7,7,1,7,'\0'),(8,8,8,8,2,8,'\0'),(9,9,9,1,3,9,'\0'),(10,10,10,2,1,10,'\0'),
(11,11,11,3,2,11,'\0'),(12,12,12,4,1,12,'\0'),(13,13,13,5,2,13,'\0'),(14,14,14,6,3,14,'\0'),(15,15,15,7,1,15,'\0'),

(16,16,21,1,1,1,'\0'),(17,17,22,2,2,2,'\0'),(18,18,23,3,3,3,'\0'),(19,19,24,4,1,4,'\0'),(20,20,25,5,2,5,'\0'),
(21,21,26,6,3,6,'\0'),(22,22,27,7,1,7,'\0'),(23,23,28,8,2,8,'\0'),(24,24,29,1,3,9,''),(25,25,30,2,1,10,'\0'),
(26,26,31,3,2,11,'\0'),(27,27,32,4,1,12,'\0'),(28,28,33,5,2,13,'\0'),(29,29,34,6,3,14,'\0'),(30,30,35,7,1,15,'\0'),

(31,31,36,1,1,1,'\0'),(32,32,37,2,2,2,'\0'),(33,33,38,3,3,3,'\0'),(34,34,39,4,1,4,'\0'),(35,35,40,5,2,5,'\0'),
(36,36,41,6,3,6,'\0'),(37,37,42,7,1,7,'\0'),(38,38,43,8,2,8,'\0'),(39,39,44,1,3,9,''),(40,40,45,2,1,10,'\0'),
(41,1,46,3,2,11,'\0'),(42,2,47,4,1,12,'\0'),(43,3,48,5,2,13,'\0'),(44,4,49,6,3,14,'\0'),(45,5,50,7,1,15,'\0'),

(46,6,51,1,1,1,'\0'),(47,7,52,2,2,2,'\0'),(48,8,53,3,3,3,'\0'),(49,9,54,4,1,4,'\0'),(50,10,55,5,2,5,'\0'),
(51,11,56,6,3,6,'\0'),(52,12,57,7,1,7,'\0'),(53,13,58,8,2,8,'\0'),(54,14,59,1,3,9,''),(55,15,60,2,1,10,'\0'),
(56,16,61,3,2,11,'\0'),(57,17,62,4,1,12,'\0'),(58,18,63,5,2,13,'\0'),(59,19,64,6,3,14,'\0'),(60,20,65,7,1,15,'\0'),

(61,21,66,1,1,1,'\0'),(62,22,67,2,2,2,'\0'),(63,23,68,3,3,3,'\0'),(64,24,69,4,1,4,'\0'),(65,25,70,5,2,5,'\0'),
(66,26,71,6,3,6,'\0'),(67,27,72,7,1,7,'\0'),(68,28,73,8,2,8,'\0'),(69,29,74,1,3,9,''),(70,30,75,2,1,10,'\0'),
(71,31,76,3,2,11,'\0'),(72,32,77,4,1,12,'\0'),(73,33,78,5,2,13,'\0'),(74,34,79,6,3,14,'\0'),(75,35,80,7,1,15,'\0'),
(76,36,81,6,3,6,'\0'),(77,37,82,7,1,7,'\0'),(78,38,83,8,2,8,'\0'),(79,39,9,1,3,9,''),(80,40,10,2,1,10,'\0');
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `density` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'плотность',
  `cover` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'матоваяглянец',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` VALUES (1,'Fuji High', '250 г/м2', 'Матовая'),
(2,'Fuji High', '250 г/м2', 'Глянцевая'),
(3,'Fuji Premium', '300 г/м2', 'Матовая'),
(4,'Fuji Premium', '300 г/м2', 'Глянцевая'),
(5,'Мелованная', '170 г/м2', NULL),
(6,'Мелованная', '250 г/м2', NULL),
(7,'Холст', NULL, 'Защитное матовое покрытие'),
(8,'Пенокартон', NULL, NULL);
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci UNIQUE NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_name_catalog_idx` (`name`,`catalog_id`),
  KEY `catalog_id` (`catalog_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`catalog_id`) REFERENCES `catalogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Фото'),(2,1,'Фото премиум'),(3,2,'Фотокнига'),(4,2,'Фотокнига премиум'),
(5,3,'Фотокалендарь'),(6,4,'Постер'),(7,5,'Печать на холсте'),(8,6,'Печать на пенокартоне'),
(9,7,'Магнит с фото'),(10,8,'Кружка с фото малая'),(11,8,'Кружка с фото большая'),(12,6,'vel'),(13,5,'voluptas'),(14,3,'voluptatem'),(15,7,'voluptates');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_features`
--

DROP TABLE IF EXISTS `products_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_features` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `size` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paper_id` bigint(20) unsigned DEFAULT NULL,
  `price` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `paper_id` (`paper_id`),
  CONSTRAINT `products_features_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_features_ibfk_2` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_features`
--

LOCK TABLES `products_features` WRITE;
/*!40000 ALTER TABLE `products_features` DISABLE KEYS */;
INSERT INTO `products_features` VALUES (1,1,'610855',1,1349),(2,2,'',2,437),(3,3,'88405218',3,416),(4,4,'65967013',4,1186),(5,5,'27716389',5,630),(6,6,'318',6,1051),(7,7,'',7,999),(8,8,'94848368',8,381),(9,9,'2',1,1460),(10,10,'9',2,1017),(11,11,'500',3,1744),(12,12,'',4,225),(13,13,'852',5,1658),(14,14,'1553907',6,1670),(15,15,'5163193',7,517),(16,1,'2',8,872),(17,2,'789805',1,1007),(18,3,'38049029',2,435),(19,4,'47134',3,216),(20,5,'73306192',4,960),(21,6,'73',5,1008),(22,7,'4',6,614),(23,8,'719341208',7,610),(24,9,'',8,1523),(25,10,'169382',1,1622),(26,11,'61',2,323),(27,12,'230',3,1782),(28,13,'',4,1187),(29,14,'72707',5,1948),(30,15,'523',6,196),(31,1,'1',7,1729),(32,2,'5252',8,953),(33,3,'5',1,65),(34,4,'1778623',2,1577),(35,5,'18',3,571),(36,6,'28',4,454),(37,7,'195196780',5,1333),(38,8,'384161',6,1424),(39,9,'',7,815),(40,10,'12',8,1572),(41,11,'4692',1,41),(42,12,'903285653',2,759),(43,13,'4208699',3,111),(44,14,'29025',4,375),(45,15,'4700',5,51),(46,1,'6',6,212),(47,2,'',7,1203),(48,3,'361',8,393),(49,4,'5',1,946),(50,5,'70434',2,399),(51,6,'582926',3,1433),(52,7,'8982002',4,1484),(53,8,'17',5,178),(54,9,'79638670',6,84),(55,10,'41160',7,607),(56,11,'229',8,194),(57,12,'264',1,1443),(58,13,'259',2,1046),(59,14,'222',3,1319),(60,15,'589823073',4,283),(61,1,'',5,703),(62,2,'182240657',6,520),(63,3,'59',7,1037),(64,4,'',8,1502),(65,5,'552803',1,800),(66,6,'6027',2,1967),(67,7,'838',3,250),(68,8,'2145530',4,395),(69,9,'205',5,305),(70,10,'91',6,1299),(71,11,'2198453',7,582),(72,12,'818',8,209),(73,13,'6493',1,31),(74,14,'4547624',2,2000),(75,15,'151709969',3,739),(76,1,'4562',4,1580),(77,2,'247419141',5,21),(78,3,'9',6,530),(79,4,'206330',7,1526),(80,5,'967',8,1491),(81,6,'569747',1,1138),(82,7,'26109784',2,1512),(83,8,'84422',3,130),(84,9,'767',4,1958),(85,10,'598428',5,924),(86,11,'496234',6,1840),(87,12,'507',7,1171),(88,13,'3244',8,984),(89,14,'87048',1,301),(90,15,'30808',2,749),(91,1,'6331',3,269),(92,2,'8848396',4,698),(93,3,'512',5,1692),(94,4,'48',6,742),(95,5,'7',7,740),(96,6,'80',8,1812),(97,7,'2',1,1454),(98,8,'204958',2,1910),(99,9,'17',3,410),(100,10,'',4,1685);
/*!40000 ALTER TABLE `products_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promo`
--

DROP TABLE IF EXISTS `promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'правила',
  `started_at` datetime DEFAULT current_timestamp(),
  `finished_at` datetime DEFAULT NULL,
  `discount` int(10) unsigned DEFAULT NULL COMMENT 'скидка',
  `present` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'подарок',
  `catalog_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  CONSTRAINT `promo_ibfk_1` FOREIGN KEY (`catalog_id`) REFERENCES `catalogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo`
--

LOCK TABLES `promo` WRITE;
/*!40000 ALTER TABLE `promo` DISABLE KEYS */;
INSERT INTO `promo` VALUES (1,'Aut doloremque corrupti blanditiis nisi maiores et.','Unde velit incidunt alias. Aut maxime distinctio dolor quo est deleniti.','2005-11-09 00:30:49','1977-07-01 17:34:27',42,'ipsa',1),
(2,'Recusandae dolorem molestiae odit ut consequatur ex tempora.','A est tenetur iure ut. Deleniti dicta ab reiciendis veritatis quia et esse.','2008-02-22 23:23:52','1997-07-24 23:47:35',34,'eaque',2),
(3,'Enim omnis voluptatem non.','Temporibus odio soluta et itaque quia. Vero quibusdam ut ut a animi voluptatem.','2002-12-12 19:39:31','2024-05-22 01:50:14',43,'omnis',3),
(4,'Laborum ipsum  ad.','Necessitatibus ut laboriosam deleniti iure et et deserunt. ','2008-09-15 06:53:57','2009-12-21 07:08:50',13,'necessitatibus',4),
(5,'Sint mollitia doloribus voluptatem suscipit quis.','Doloribus quasi ipsam voluptate nam excepturi. Vel et fugiat aut ea ut.','2011-05-07 11:01:24','1992-10-25 16:13:27',12,'nemo',5),
(6,'Hic molestias mollitia.','Perferendis magni aspernatur laborum tenetur pariatur.','1987-09-03 12:47:30','1971-12-28 19:04:18',12,'quam',6),
(7,'Accusantium ipsa.','Similique in hic id ipsa. Similique rerum temporibus et eius laboriosam itaque consequuntur.','1998-12-08 08:41:01','1970-09-29 01:55:23',46,'quas',7),
(8,'Possimus autem sunt incidunt molestias.','Repudiandae dolores quaerat sint vel odit modi. A aliquid facilis rem est.','2017-02-10 17:31:08','1980-06-10 08:39:58',12,'tenetur',8),
(9,'Ab facere ea eum in quidem.','Doloribus temporibus aliquid molestiae magnam.','2014-06-18 01:03:47','2002-08-18 13:40:17',25,'accusamus',1),
(10,'Neque velit sunt modi illum.','Et in optio sit fuga possimus velit.','1994-06-02 17:03:12','1997-03-20 22:16:38',16,'et',2),
(11,'Nemo debitis occaecati dolor sit at sed.','Veniam iure sunt et repellendus delectus voluptas.','2012-09-05 18:31:32','2004-03-15 21:03:12',42,'nobis',3),
(12,'Quia et sapiente ut maxime quaerat ab deserunt.','Maxime quo qui ipsa omnis at.','2016-11-25 22:42:09','2006-03-03 09:03:48',14,'sed',4),
(13,'Non consequatur asperiores.','Ipsum vitae similique quod et. Vero impedit sequi autem qui expedita sunt quo.','1994-01-04 00:34:49','1983-03-13 13:29:41',21,'atque',5),
(14,'Qui quam placeat sequi ut possimus expedita.','Sed consequatur et veritatis ea.','2008-12-26 10:18:52','2022-03-30 22:47:24',16,'amet',6),
(15,'Mollitia maiores officiis dolore dicta qui repellendus velit.','Eius excepturi laboriosam saepe. Et ut aliquid odio accusantium eum nobis sed. Eum et vero veniam aut repudiandae nesciunt qui.','1985-03-25 14:29:52','2019-06-25 03:34:58',26,'optio',7),(16,'Doloremque tempore molestiae quibusdam maiores.','Fuga sint fugit eos dolorem omnis delectus exercitationem. Eligendi ipsam qui consequatur. Illum qui aut porro inventore.','1986-03-14 05:03:52','2020-11-04 09:23:23',13,'dolorem',8),(17,'Et iusto similique minima voluptate ipsum.','Quo amet amet odio omnis veniam. Ut assumenda eius eveniet non quia earum sit vero. Et voluptatem saepe rerum libero laudantium illum asperiores. Ab et iure qui laboriosam nam.','1974-08-24 20:45:24','1993-09-06 19:48:53',25,'voluptas',1),(18,'Modi aperiam eum deleniti suscipit.','Vitae numquam cumque vel voluptatem eius quas itaque. Laboriosam vel fugiat aut aspernatur in. Sint ea vel maiores alias.','1981-01-05 22:02:20','2000-02-29 19:42:18',42,'enim',2),(19,'Aut perspiciatis quia voluptate est corrupti qui quisquam autem.','Repellendus dolore harum doloribus molestiae facilis. Praesentium ut voluptatem accusantium. Voluptas provident quo optio doloremque esse.','2004-10-27 06:39:58','1972-12-30 22:54:19',45,'voluptates',3),(20,'Quia amet excepturi corporis est velit molestias laboriosam sequi.','Temporibus error aut tempora cumque. Quisquam eum deserunt dignissimos sint et ad odit. Vel ut molestiae molestiae similique laudantium ut.','1998-03-19 12:26:20','1982-11-28 12:43:02',18,'vel',4),(21,'Et officiis ut omnis enim neque.','Voluptatibus omnis dolorum autem et sed vel. Aut sit aut magni cum nesciunt aut commodi. Nam praesentium non voluptatem. Sed in doloribus dignissimos repellat.','1993-11-20 11:46:51','2001-05-13 00:43:42',33,'quia',5),(22,'Atque velit maxime voluptatem quo sit.','Quas sint et culpa ipsum repellat vel qui quasi. Reiciendis et rem veniam in amet possimus ad odio. Vero accusantium cumque ipsum totam qui molestiae.','2010-08-04 00:09:21','2021-10-11 18:04:18',41,'labore',6),(23,'Cumque aut aliquam quam necessitatibus necessitatibus et.','Omnis nobis ipsam consequatur voluptate perferendis magni rerum. Quia ut magnam optio. Porro eveniet ducimus mollitia blanditiis.','2002-04-21 15:24:15','2005-04-15 16:53:12',23,'dolorem',7),(24,'Veritatis omnis dicta vel.','Quia nesciunt iusto cupiditate voluptatem ut voluptatem consequatur. Ipsum et officiis et expedita illo sit. Omnis sunt placeat odio.','1993-02-07 14:33:34','2018-03-30 09:59:40',12,'voluptatem',8),(25,'Nam quaerat mollitia ut a quis quis.','Delectus mollitia sed explicabo. Velit possimus rem atque eligendi reiciendis. Velit esse similique inventore et dolores.','1997-04-09 16:28:49','2014-02-20 16:07:18',10,'voluptatem',1),(26,'Atque in soluta occaecati sint repudiandae cupiditate odit.','Eligendi officiis magnam cupiditate nihil architecto. Alias est doloribus dignissimos. Dicta et est ad et sequi autem dolore aliquam.','2012-11-12 02:41:05','2022-01-06 20:58:06',46,'consequatur',2),(27,'Saepe vel omnis fugit rerum mollitia qui provident.','Sed dolorem voluptatem ut ipsum culpa. Aspernatur ipsam aperiam fugiat quasi vel odit quis placeat. Voluptatem aut illum voluptas tempore dolorem.','2002-02-12 17:18:57','1972-03-24 21:04:53',14,'reprehenderit',3),(28,'Quod nam sit odit quis inventore consequatur quo.','Non quo odit magni qui. Ut aut laborum sunt qui. Architecto nostrum asperiores minima doloremque. Magnam error eaque expedita dolorem impedit nemo.','2001-10-15 12:35:38','1977-02-06 19:55:00',31,'sequi',4),(29,'Rerum eaque autem assumenda quibusdam nesciunt.','Et delectus est eveniet excepturi suscipit. Dolorem fuga eaque numquam minus sapiente et et debitis. Dolorem laudantium accusamus est est soluta.','1990-04-09 04:27:50','1974-04-14 06:29:44',28,'qui',5),(30,'Earum labore aliquid voluptatem quidem rem harum.','Aut molestias provident aperiam explicabo. Temporibus dicta quidem sint rerum. Tenetur commodi distinctio doloremque sed ducimus dolor.','1977-07-25 14:34:53','1981-09-28 06:38:46',31,'voluptatem',6),(31,'Provident quo architecto aut molestiae qui placeat.','Temporibus rerum laborum inventore. Iusto et ut blanditiis alias repellendus similique. Voluptatum tempora accusamus a ex unde maxime quod. Aspernatur laboriosam minima veniam fugit ipsa ea ea.','2019-09-19 01:47:19','1983-09-18 18:56:41',19,'quibusdam',7),(32,'Voluptate ab debitis dolorem rerum sint qui sequi.','Ut doloribus dolore sed. Repellendus facilis expedita et voluptates error dolores.','2011-01-20 03:29:56','1990-02-27 04:44:03',40,'est',8),(33,'Nobis fugit laborum nihil harum.','Voluptatem quia dolorem quibusdam. Molestiae autem officia deserunt in. Itaque ut modi ea qui velit sit voluptas quos. Repellendus veniam doloribus accusamus.','2020-09-12 19:05:34','1990-02-14 13:18:16',27,'quia',1),(34,'Ipsam voluptas magni nobis quisquam.','Distinctio dignissimos saepe officiis nemo maxime dignissimos. Voluptas reprehenderit tempora aut quo fugit alias qui. Laborum adipisci sunt omnis aut voluptatem.','1970-03-16 18:30:02','2022-01-24 20:31:07',47,'vero',2),(35,'Vel aut ad cumque dolores modi.','Qui velit adipisci sit sapiente soluta sint error. Id sunt corrupti reprehenderit libero. Quo aspernatur similique iusto et cumque. Dolore voluptatem ab aliquam aliquam.','2018-01-15 23:40:22','1990-04-22 07:50:37',30,'et',3),(36,'Dolore natus debitis qui laboriosam veniam voluptatibus.','Reprehenderit non harum accusamus sit. Repudiandae quo facilis eius perspiciatis voluptatem placeat. Et ut repellat veniam harum necessitatibus eos. Quod nobis et et sit.','2010-01-04 05:02:40','2013-03-29 04:14:42',34,'expedita',4),(37,'Voluptatem quos corrupti minima voluptatibus porro quis.','Dicta harum dolorem ut blanditiis consequatur. Et adipisci delectus voluptas. Enim ut et nulla cumque. Quod commodi quis vel explicabo.','2011-08-04 00:26:20','1987-06-24 22:15:34',28,'itaque',5),(38,'Omnis odit aut non ipsa rerum.','Qui ut nulla quo. Libero rerum in aut ipsam ut voluptas. Voluptatibus est nesciunt voluptate itaque laborum perferendis est dolor. In est ut rem velit quo est fugit. Laudantium quia rerum non optio.','2012-04-25 07:00:04','2002-04-28 11:59:58',23,'voluptatem',6),(39,'Magni quia consequuntur et dicta quia.','Pariatur magnam optio consequatur ipsa. Ratione nulla aut eveniet repellat harum. Quo asperiores tenetur ipsum harum. Ad cumque debitis enim libero.','1974-08-04 02:54:49','1984-03-15 10:10:09',31,'fuga',7),(40,'Ut nemo sint sed modi inventore.','Quaerat odit inventore consequuntur facilis ut culpa. Asperiores exercitationem modi eius. Eum ratione nostrum quidem quia qui.','2007-09-07 13:23:57','2011-03-13 08:54:59',24,'aut',8),(41,'Sit qui impedit ex est.','Eveniet eveniet voluptatem quo blanditiis officiis et sequi. Autem cumque est et in quidem accusamus. Dolor modi non veritatis quam assumenda quo nisi ipsum.','2004-09-02 13:13:06','2005-01-02 11:16:00',20,'hic',1),(42,'Libero est doloremque voluptate quia quasi consequatur dolore quia.','Nulla labore rerum tempore est. Nisi dolor labore ducimus facere. Perspiciatis fugiat error eveniet laudantium. Itaque odio aut reprehenderit rerum.','2022-06-01 18:11:12','1989-11-15 03:10:02',50,'numquam',2),(43,'Et ut natus dolores.','Ipsum eum assumenda soluta. Molestiae molestiae quidem ut iste ut et. Reiciendis eum quo consequatur sed perferendis repellendus maiores. Optio consectetur in dolores incidunt assumenda sequi.','1996-08-23 20:13:21','1998-04-06 23:47:15',18,'maxime',3),(44,'Eum enim illo dolorem sit atque suscipit.','Ad et rerum ipsa suscipit ab. Sit necessitatibus harum ipsa optio sed dolorum ipsam aut. Et pariatur inventore sunt et voluptas et. Sint quas natus in error repudiandae amet omnis sapiente.','1981-02-25 12:45:58','2019-12-23 06:42:44',36,'dicta',4),(45,'Omnis odio nobis sit magnam et tempore magnam.','Debitis omnis dolor sapiente est maiores. Corporis enim blanditiis ut laborum officiis. Possimus et ut qui mollitia. Autem mollitia rerum velit.','1999-10-14 16:43:21','2019-05-04 22:12:13',28,'veniam',5),(46,'Veritatis doloremque qui et non.','Ullam aut quo qui impedit aut nemo quia. Aliquam enim atque quo suscipit exercitationem tempore. Non in magni sed soluta perspiciatis aspernatur non fugit.','1998-03-15 15:20:31','2009-05-15 18:27:48',33,'dolore',6),(47,'Eius consequuntur est quasi similique et.','Aut et reprehenderit itaque ab blanditiis adipisci maxime. Quos cum ullam alias omnis corporis. Laboriosam voluptas aperiam mollitia pariatur beatae sed est soluta.','2010-12-03 11:55:53','2017-12-10 16:38:34',23,'omnis',7),(48,'Aut ut quo ut est.','Perspiciatis fugiat in alias rerum. Molestias et possimus dignissimos ipsa incidunt velit similique.','1970-11-22 02:03:01','1973-10-24 10:14:25',48,'enim',8),(49,'Officiis odio ipsam nulla ut repellat velit ea.','Et autem impedit iure et velit voluptas quisquam. Harum qui velit fugit assumenda ipsa. Nulla itaque repudiandae suscipit non commodi aliquid molestiae. Pariatur et ut veritatis aperiam.','1996-01-21 08:47:07','1991-11-08 19:48:42',31,'molestiae',1),(50,'Quidem aspernatur dolore non exercitationem quas placeat minus.','Dolores odio nobis ea aliquam et qui. Vero dolorum nesciunt reprehenderit quis corrupti aliquam. Quas repellendus molestiae est quidem ut enim assumenda.','2016-03-08 12:34:12','2013-09-18 13:12:02',30,'quod',2),(51,'Occaecati aut quia perspiciatis ipsum quia.','Aut aperiam ratione doloremque at et ut facere. Deleniti nisi nostrum nemo quia totam nam. Quibusdam sed quos accusamus aut reprehenderit officia. Eum sit libero cupiditate.','1996-06-27 01:36:31','1983-10-22 01:36:27',31,'omnis',3),(52,'Nulla beatae nemo aliquid minima quod et beatae.','Cum aliquid consequatur beatae beatae. Commodi ut ut nostrum. Sapiente repudiandae quia earum autem.','1971-01-02 07:58:15','2005-04-23 15:37:59',41,'doloremque',4),(53,'Ratione est et autem et enim officia et esse.','Laboriosam saepe dolorem in. Dolor architecto voluptatem itaque ducimus qui eum. Perspiciatis reprehenderit est non dolor officiis voluptas et.','1994-03-30 07:16:49','2014-05-09 00:37:28',44,'quae',5),(54,'Amet veniam magnam nam possimus sed ullam quia.','Veritatis sunt in numquam quia rerum debitis ut. Vitae eos quo sit aut illum. Laboriosam nostrum dolore sit rem at accusamus. Et necessitatibus pariatur omnis.','2000-12-31 03:35:36','1977-11-18 10:55:32',28,'porro',6),(55,'Doloremque sit quibusdam sed.','Nisi omnis exercitationem occaecati facilis. Sit quam et quae et provident maxime magnam. Voluptates maxime ex totam et. Ea praesentium ullam necessitatibus laudantium placeat corrupti.','2007-12-08 10:39:30','1981-04-01 23:34:43',45,'ipsa',7),(56,'Aut sed non qui earum labore quis.','Temporibus autem iste aut quia repellendus. Placeat ducimus nam sed. Atque eum omnis animi voluptatum et doloribus pariatur magni.','2011-11-20 13:29:08','1982-04-06 17:46:10',31,'molestiae',8),(57,'Aut praesentium tenetur praesentium et rerum nisi amet.','Eveniet fugiat dolorem et rerum. Sequi omnis consequatur libero quidem repudiandae voluptatem. Ex et hic qui accusamus et.','2008-11-28 23:42:26','1998-01-17 02:53:23',36,'in',1),(58,'Autem qui cupiditate dolorum ut non.','Amet quas maxime eveniet quidem necessitatibus. Enim est qui exercitationem saepe. Aspernatur laborum nihil laboriosam voluptatem.','1973-09-09 15:34:33','1986-11-09 08:54:57',31,'facilis',2),(59,'Temporibus dolor consectetur vitae itaque.','Tenetur fugit velit facilis mollitia doloremque hic odio. Distinctio et perspiciatis et eos ut et. In sed cum saepe velit enim.','1993-10-02 13:47:38','2002-11-24 12:42:50',33,'quam',3),(60,'Dolorem asperiores unde cupiditate sit ea eius dolore.','Eveniet iste perferendis nulla commodi. Aut eos tempore at deleniti est qui. Ipsum minus enim deleniti possimus. Officia ad omnis sunt praesentium.','1999-09-24 23:18:32','2020-08-22 02:55:09',19,'provident',4),(61,'Ea nam libero iusto.','Molestiae harum qui dignissimos at sequi numquam quasi. Veniam voluptas nihil quia incidunt ipsum minima. Molestiae inventore exercitationem corporis. A in non ut voluptas temporibus facilis.','2003-11-30 10:26:35','1989-04-28 00:25:19',17,'sunt',5),(62,'Id sunt incidunt et et veniam officiis.','Nulla assumenda natus dolorem quas id blanditiis. Ea et voluptatum deserunt aspernatur quia quo. Dolor iste nemo a error ea ducimus eos.','2005-01-12 17:24:33','1977-08-12 17:32:07',45,'voluptatum',6),(63,'Explicabo in nemo sit quos quo dignissimos.','Cupiditate debitis ullam voluptates est eligendi id id. Sint et eos expedita totam in. Enim id quia modi repellat autem quos.','2021-11-30 15:27:37','2012-09-08 03:58:24',42,'et',7),(64,'Doloribus dolores quia accusantium beatae voluptates.','Tenetur aut vel at at qui ut voluptatibus. Voluptate soluta est libero. Officiis atque voluptatem natus et aut. Repellendus iste magni in delectus. Sequi ut aliquam pariatur nulla maiores nesciunt.','1971-10-03 10:13:48','1981-10-04 05:33:14',29,'error',8),(65,'Asperiores ratione minus maxime aliquam.','Adipisci nostrum pariatur minus fuga. Et expedita nesciunt earum sed similique quis. Harum dolorum qui tempora consequuntur.','1977-09-20 19:15:38','2000-12-17 09:30:01',11,'facilis',1),(66,'Necessitatibus et sint non ipsum similique quo quis minima.','Eum rerum sit voluptatem. Molestias omnis id veniam vitae. Esse nostrum dolores odio aspernatur et voluptatum illo.','1980-02-01 09:05:54','2001-02-02 07:45:51',13,'ut',2),(67,'Aut accusantium id porro.','Amet tempora eligendi voluptatum non dolorum illo dolores. Dolor cupiditate exercitationem eveniet tenetur totam. Rem consequatur enim error dolor nihil deserunt. Ducimus ducimus non dolor sunt.','1991-03-07 04:49:51','1984-07-30 22:18:38',18,'quaerat',3),(68,'Sequi atque maiores omnis accusantium iure praesentium unde et.','Ullam incidunt laborum laudantium quis blanditiis et. Quaerat fugiat eius dolorum magnam possimus. Provident labore harum perspiciatis. Dolor quod delectus harum autem molestias.','2000-10-30 23:41:33','2020-12-04 14:45:53',27,'totam',4),(69,'Quae et facilis in perferendis quibusdam illum.','Est magnam minima blanditiis placeat eius doloribus placeat. Asperiores voluptate fuga sit laudantium.','1993-02-15 05:56:04','1987-06-28 12:20:52',50,'fugiat',5),(70,'Dolores tempore quia amet.','Culpa ratione reprehenderit commodi dolor non. Expedita tempore asperiores adipisci sit. In explicabo nisi aut.','2013-12-23 09:14:13','1984-09-23 01:49:56',30,'est',6),(71,'Eos voluptas omnis alias ut fugiat et sed.','Rerum omnis aperiam voluptatem aut dolores molestiae dolorem exercitationem. Aut saepe non sequi quisquam voluptatibus est. Qui earum neque fugiat architecto.','1993-07-22 08:09:42','1999-06-02 19:09:19',43,'recusandae',7),(72,'Quidem dolorum sed soluta eum qui odio ratione.','Officiis velit debitis similique quia aliquam ut. Iste deleniti quia tempora.\nOccaecati rem vel ullam dicta. Non qui deleniti quibusdam expedita at. Labore deserunt aspernatur aspernatur et voluptas.','1980-09-10 18:56:15','2008-08-19 20:30:42',33,'repudiandae',8),(73,'Ratione pariatur voluptatum aliquam molestiae et quae.','Error quia eius ab ex aut et. Aperiam iure eius magni repellendus enim. Aut labore et possimus similique maxime. Doloremque voluptas nihil quia voluptatem.','1989-10-19 02:16:11','2007-09-02 15:13:35',33,'minima',1),(74,'Deserunt nisi omnis aliquam libero natus fugiat.','Quod et voluptates optio esse laudantium. Nemo facere cupiditate perferendis ut ratione. At sed autem consectetur illo velit et.','1976-10-01 04:06:00','2010-05-25 20:41:19',26,'quasi',2),(75,'Vitae sit nulla odit nemo hic tenetur aut.','Suscipit ab laborum placeat velit porro in. Aspernatur ex et et saepe excepturi qui. Enim cumque aut deserunt officia eius. Distinctio eum quia ut aut enim dolore cupiditate recusandae.','1996-04-05 09:56:49','1979-11-02 22:27:36',43,'omnis',3),(76,'Sed enim aspernatur beatae excepturi iste voluptatem.','Ut minima et suscipit. Officiis magnam commodi tempora molestiae quas ratione. Nihil modi hic non labore. Quia mollitia molestiae iusto est. Laborum nam suscipit qui aut.','2002-06-28 11:32:29','1980-03-22 00:36:29',42,'recusandae',4),(77,'Ducimus numquam necessitatibus eaque recusandae rerum.','Temporibus est sit ullam quo exercitationem sint ullam. Quis sit enim ad voluptatum. Ut minus ut quidem enim velit repellendus eius.','2003-04-26 06:39:41','1977-12-12 17:57:28',33,'debitis',5),(78,'Temporibus provident quidem optio vero quas et velit.','Eos itaque magni dolores quo eveniet asperiores voluptate. Ut et nobis suscipit ea delectus. Consequuntur qui voluptatem fuga omnis.','1984-09-01 15:56:48','1992-09-03 11:37:28',13,'corrupti',6),(79,'Corporis doloribus vero officiis commodi est laborum a.','Doloribus hic velit et unde excepturi voluptas ab. Dignissimos sed et in quasi omnis. Est aut consequatur distinctio quaerat eos molestiae.','2011-02-27 05:01:05','2020-05-28 07:01:32',26,'nisi',7),(80,'Ut iusto est hic voluptates.','Ratione expedita consectetur et nihil et ea. Aut praesentium et eos pariatur aut in nam. Sed aut deleniti voluptatum repellat qui. Nam atque vel quae et corporis incidunt sequi.','2010-09-04 03:43:04','1974-04-16 06:13:28',21,'nihil',8),(81,'Suscipit laboriosam eaque earum.','Reiciendis quibusdam delectus delectus perferendis harum aut rem voluptas. Animi ut aut maxime laborum eveniet velit asperiores.','1977-02-21 20:50:00','2006-11-28 05:09:19',16,'temporibus',1),(82,'Molestiae sed sint beatae id quia minus voluptatem.','Voluptas numquam exercitationem et. Quibusdam et alias quaerat deserunt ipsa quasi maxime rem. Voluptatem quas amet modi soluta et harum. Ut possimus quia consectetur ea ex officiis corrupti.','1996-08-09 10:23:15','2017-11-01 19:56:45',20,'qui',2),(83,'Consequatur eum rerum deserunt blanditiis explicabo voluptas adipisci.','Blanditiis nulla commodi quod quaerat vitae qui voluptatem. Non et quis quas similique doloremque eius. Eaque modi soluta soluta. Dignissimos illo quia cupiditate magni nisi.','1987-02-22 00:15:57','1993-11-28 21:39:54',39,'laborum',3),(84,'Ut minus voluptates aut labore quasi est autem.','Officiis vel minus numquam enim temporibus ullam. Sint cum molestiae similique autem dolor. Asperiores magnam aut sint. Voluptas dolorem et eos ipsa aut.','2013-12-19 13:45:23','2009-08-17 02:43:22',24,'nihil',4),(85,'Alias rem suscipit voluptate cumque alias et eos.','Necessitatibus velit aut harum autem. Esse est repellendus aut voluptas ea. Voluptatibus dolorem quo perferendis. Quibusdam dolor tempora vel rem voluptate saepe.','1994-01-23 22:12:19','1978-01-26 15:02:55',15,'totam',5),(86,'Et aliquid doloremque ut recusandae sed aperiam qui veniam.','Nihil iusto officiis voluptas sint eos ut nihil porro. Nesciunt nemo eius odio labore. Cumque nihil aliquid sint beatae.','2016-05-26 05:34:15','1993-07-16 21:26:59',50,'possimus',6),(87,'Reiciendis quia iure similique quam maiores facere.','Officia ut vitae alias sit neque consequatur illum. Voluptatem eius est quasi. Delectus est eveniet eligendi tenetur odio.','1970-08-05 05:41:00','2007-06-20 18:12:19',49,'doloribus',7),(88,'Voluptate libero laborum dolorem occaecati eos ut esse.','Quo quam recusandae ducimus sed voluptates. Dolorum voluptatem earum quos esse suscipit animi aut. Est similique aut voluptatum suscipit et at. Aut esse sed beatae ratione est delectus maxime ex.','1995-04-17 23:49:08','1974-05-23 23:34:36',13,'nobis',8),(89,'Eaque voluptas quae repudiandae sapiente quae est.','Velit cumque vitae odit. Sed necessitatibus voluptates vel amet praesentium ea alias. Adipisci quidem incidunt dolor aut magni nemo aliquid distinctio. Quos est hic iste provident.','1983-10-26 21:26:50','1987-08-04 01:10:25',49,'voluptas',1),(90,'Nisi aut ex exercitationem facilis atque iusto est.','Accusantium harum quisquam id voluptas distinctio sit amet. Ullam error odit maxime deleniti labore amet dolor. Perferendis autem aut maxime velit suscipit.','1975-08-16 14:07:55','1986-10-19 03:55:08',33,'animi',2),(91,'Nisi repellendus et explicabo repudiandae atque nostrum quo.','Aliquid ut et qui. Architecto animi et hic vel pariatur asperiores vero recusandae. Necessitatibus incidunt quia ratione nobis voluptate provident harum.','2019-04-19 11:11:53','1983-05-25 22:56:59',21,'quia',3),(92,'Nostrum cum delectus necessitatibus.','Saepe et consectetur dolor est occaecati error quia. Eum qui porro est magnam pariatur cum placeat quam. Doloribus eos similique delectus ad.','1972-07-30 21:07:38','2012-09-15 16:28:42',19,'fugit',4),(93,'Et culpa non natus assumenda.','Recusandae quo consequatur ea velit suscipit accusantium. At commodi ipsam accusamus sed tempore sit harum. Dolores eaque perferendis perferendis qui sapiente et dolores.','2000-11-21 06:17:46','2014-04-03 23:20:38',38,'cumque',5),(94,'Tenetur voluptatibus rem deserunt enim maxime veritatis mollitia.','Quam at ducimus rerum illum excepturi laborum. Ut et est illum ipsa et. Qui saepe quae id iure omnis.','1989-05-17 20:36:51','2016-02-04 00:57:17',49,'aut',6),(95,'Rerum delectus ducimus minus et tempore esse aliquam.','Nam repudiandae ullam ex aut. Tempora temporibus eos aliquid rerum impedit. Tenetur quasi architecto dignissimos illum.','1982-11-03 04:51:38','1985-11-14 21:23:14',45,'in',7),(96,'Deleniti modi maiores et rerum quo blanditiis deserunt.','Laudantium aut eaque cumque nostrum. Dolorum dolores temporibus sit aliquam blanditiis. Reiciendis ut voluptatem consequuntur quo sunt.','1987-02-10 18:17:55','2015-09-17 01:15:22',24,'soluta',8),(97,'Asperiores vero eos incidunt rerum velit et ipsam.','Accusamus fugiat dolorem et suscipit et ab. Vel quia eos veniam aut. Rerum sint eos omnis dignissimos qui sunt possimus.','2011-11-24 08:39:14','2000-02-23 05:10:31',11,'porro',1),(98,'Facere tempora omnis consequatur id natus error.','Neque quia accusamus necessitatibus. Ipsum totam molestiae consequatur veritatis. Tempore quia consequatur ipsa voluptatem minus earum. Cum delectus vero aspernatur cumque.','1993-11-23 03:35:21','2021-02-28 04:13:49',42,'culpa',2),(99,'Exercitationem sed ipsam quibusdam.','Animi fuga minus sit quis quas perferendis cumque. Qui est id nostrum voluptatem omnis illo temporibus. Eum a sapiente est ipsa. Maiores aut quia ducimus ducimus quis ea.','1983-07-17 13:14:31','1990-06-23 13:57:47',14,'eos',3),(100,'Vero ipsum et architecto dolores molestias ut expedita.','Consectetur molestiae consequatur aut qui architecto suscipit. Dolorem harum quis rerum consequatur et odio. Nisi numquam itaque pariatur quia culpa quisquam.','1976-04-24 20:07:37','2013-04-25 18:08:20',10,'nemo',4);
/*!40000 ALTER TABLE `promo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_layouts`
--

DROP TABLE IF EXISTS `user_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_layouts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `user_layouts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_layouts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_layouts`
--

LOCK TABLES `user_layouts` WRITE;
/*!40000 ALTER TABLE `user_layouts` DISABLE KEYS */;
INSERT INTO `user_layouts` VALUES (1,1,1,'2008-11-17 05:21:15','1988-11-01 15:45:03','\0'),(2,2,2,'2014-10-23 14:42:56','1970-09-19 07:07:28',''),(3,3,3,'1975-07-24 08:09:32','2021-11-21 10:03:37',''),(4,4,4,'2004-02-18 16:57:33','2005-10-14 21:56:21','\0'),(5,5,5,'2012-06-22 14:58:04','1972-07-02 00:23:31',''),(6,6,6,'1974-08-26 01:12:54','2007-01-25 13:17:17',''),(7,7,7,'1972-08-01 16:41:09','1973-08-26 16:35:05','\0'),(8,8,8,'1987-04-11 03:32:55','1985-03-15 16:37:42',''),(9,9,9,'1973-02-13 18:31:48','1988-01-16 17:22:33',''),(10,10,10,'2001-10-24 13:42:57','1989-09-19 15:13:20',''),(11,11,11,'2014-12-03 09:29:44','1993-09-01 22:28:44','\0'),(12,12,12,'1999-07-15 00:33:33','2020-02-17 18:31:04',''),(13,13,13,'2008-01-05 11:49:25','1996-02-11 04:06:12',''),(14,14,14,'2010-12-03 20:44:29','2002-06-05 06:51:57','\0'),(15,15,15,'1982-05-03 14:16:12','2016-05-13 09:16:25','\0'),(16,16,1,'1994-04-08 19:39:57','1971-08-17 23:05:52','\0'),(17,17,2,'1981-07-14 10:10:28','1990-11-27 12:50:41','\0'),(18,18,3,'2011-01-20 13:26:22','2008-12-27 08:48:46',''),(19,19,4,'1974-04-21 23:36:05','1980-06-01 06:46:11','\0'),(20,20,5,'1985-06-23 00:27:03','2007-06-29 08:07:57','\0');
/*!40000 ALTER TABLE `user_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_photo`
--

DROP TABLE IF EXISTS `user_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_photo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_photo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_photo`
--

LOCK TABLES `user_photo` WRITE;
/*!40000 ALTER TABLE `user_photo` DISABLE KEYS */;
INSERT INTO `user_photo` VALUES (1,1,'atque',37706804,'1971-05-09 08:37:59',''),(2,2,'atque',799829,'1987-08-16 21:05:52','\0'),(3,3,'quis',4171971,'1973-12-23 08:10:31',''),(4,4,'rerum',851889,'1989-09-24 22:01:43',''),(5,5,'modi',6247998,'1990-09-24 18:59:59','\0'),(6,6,'aut',0,'2015-02-04 19:02:30',''),(7,7,'ut',8,'2011-08-11 00:17:51','\0'),(8,8,'consectetur',860007561,'2012-02-09 16:13:15','\0'),(9,9,'voluptas',85725059,'1994-01-04 02:38:42',''),(10,10,'et',4024608,'1973-05-07 21:41:02','\0'),(11,11,'voluptate',9,'1999-08-06 00:25:23','\0'),(12,12,'sit',0,'1973-12-13 04:16:05','\0'),(13,13,'ut',2634775,'2022-03-19 14:16:10','\0'),(14,14,'culpa',12,'1973-08-20 13:01:34','\0'),(15,15,'praesentium',80188,'2017-07-10 16:36:25','\0'),(16,16,'officiis',4326271,'2002-09-19 15:09:26',''),(17,17,'fugiat',54396,'1973-03-29 16:43:41',''),(18,18,'recusandae',0,'1985-07-22 04:37:56','\0'),(19,19,'quasi',300489,'1977-06-01 12:50:44',''),(20,20,'rerum',33,'2007-04-19 16:41:09',''),(21,21,'quisquam',9303436,'2021-07-02 05:40:49',''),(22,22,'est',7815975,'1974-06-01 08:06:26','\0'),(23,23,'deleniti',21069818,'2018-07-10 18:48:51','\0'),(24,24,'cupiditate',757696,'1976-04-26 00:14:46',''),(25,25,'qui',3216300,'1971-02-17 05:35:12','\0'),(26,26,'voluptatum',464,'2016-10-19 12:24:16',''),(27,27,'voluptas',951596,'2012-01-19 15:50:35',''),(28,28,'sit',0,'2021-12-17 12:15:00','\0'),(29,29,'magnam',5558827,'1984-01-14 14:43:50',''),(30,30,'tempore',37135237,'1980-03-09 21:53:37',''),(31,31,'eligendi',4612307,'1976-09-12 19:19:51',''),(32,32,'fuga',3081926,'2021-01-29 03:45:45','\0'),(33,33,'dolores',489,'1978-07-25 19:11:33','\0'),(34,34,'debitis',303,'1993-09-09 18:06:36','\0'),(35,35,'alias',87157960,'1983-04-08 04:44:43','\0'),(36,36,'ducimus',426160,'2009-01-22 11:25:19',''),(37,37,'nulla',91,'2022-03-03 21:52:53','\0'),(38,38,'in',9,'1988-01-17 04:25:45','\0'),(39,39,'et',5389640,'1995-03-09 14:44:35',''),(40,40,'recusandae',92770256,'1979-07-30 02:04:55',''),(41,41,'officiis',3606594,'1981-04-15 03:49:35',''),(42,42,'omnis',5532409,'1985-11-17 22:08:51',''),(43,43,'nesciunt',4821,'2006-03-12 12:38:28',''),(44,44,'sed',572,'2015-07-30 20:55:58',''),(45,45,'earum',831,'1983-06-22 10:25:49','\0'),(46,46,'asperiores',188,'1991-01-12 12:06:59','\0'),(47,47,'eius',80579625,'2006-01-07 20:35:43',''),(48,48,'eos',1856,'1993-02-25 17:29:27','\0'),(49,49,'corrupti',81,'1987-08-18 10:46:28',''),(50,50,'sed',10,'2012-01-08 18:07:40',''),(51,51,'aliquam',635,'1981-01-19 07:36:45',''),(52,52,'aut',99832,'1972-01-25 02:53:10',''),(53,53,'aspernatur',14,'2007-02-19 10:43:01','\0'),(54,54,'quia',678985127,'2009-01-20 04:19:45',''),(55,55,'numquam',372590223,'2021-12-02 17:55:59','\0'),(56,56,'dignissimos',135,'1977-11-28 06:54:36','\0'),(57,57,'sequi',211501,'1996-10-01 12:53:42','\0'),(58,58,'exercitationem',14766,'1972-02-17 09:02:02','\0'),(59,59,'modi',0,'1974-07-19 11:57:53',''),(60,60,'deserunt',3,'2002-11-08 17:57:38',''),(61,61,'sed',6412,'1976-10-15 21:27:21','\0'),(62,62,'aliquid',64305,'2008-08-17 01:43:27','\0'),(63,63,'dicta',40,'2017-07-26 18:31:25',''),(64,64,'sed',917997,'1982-01-22 16:05:51','\0'),(65,65,'perspiciatis',460421260,'1992-10-16 12:51:00','\0'),(66,66,'eligendi',300423970,'2001-04-17 17:32:13',''),(67,67,'atque',894144280,'1995-02-23 09:57:49',''),(68,68,'omnis',162222659,'1986-10-22 13:00:12',''),(69,69,'aut',0,'1996-11-19 22:48:15',''),(70,70,'harum',390,'2019-06-28 06:46:24',''),(71,71,'vel',5781,'2000-04-13 20:24:42','\0'),(72,72,'optio',23,'2002-11-15 09:36:08','\0'),(73,73,'sint',22298,'2005-11-08 01:43:54',''),(74,74,'saepe',898780845,'1976-07-28 13:54:38','\0'),(75,75,'voluptatem',19620372,'1979-12-07 15:11:52',''),(76,76,'nihil',184298314,'1979-04-01 10:30:14',''),(77,77,'quia',8037736,'2010-06-06 19:19:05','\0'),(78,78,'ut',626227,'1994-12-23 17:58:12',''),(79,79,'consequatur',9,'2005-04-26 20:21:43',''),(80,80,'blanditiis',77676,'1999-06-08 15:58:02',''),(81,81,'ullam',752186679,'1970-02-25 16:25:42',''),(82,82,'aut',725087,'1993-05-16 13:22:23',''),(83,83,'minus',740661,'1983-03-11 00:03:35',''),(84,84,'quas',39885311,'2021-10-03 23:23:37',''),(85,85,'non',19534162,'1988-03-31 01:24:19',''),(86,86,'dolor',850,'1995-04-04 17:24:43','\0'),(87,87,'minus',0,'1999-12-10 03:24:16',''),(88,88,'voluptas',9326,'1992-01-24 04:26:56','\0'),(89,89,'sit',511659825,'2010-07-06 13:49:12',''),(90,90,'quo',7898873,'1985-05-15 15:56:11','\0'),(91,91,'nemo',52853,'2011-04-28 11:45:46',''),(92,92,'consequatur',495,'1977-08-22 03:41:53',''),(93,93,'autem',1285,'1986-11-03 05:28:59','\0'),(94,94,'voluptates',9672,'1998-01-27 00:24:29',''),(95,95,'itaque',7731820,'1993-03-06 09:40:17',''),(96,96,'quae',5109745,'1971-08-20 04:11:26','\0'),(97,97,'ut',303094,'2015-07-01 22:51:29',''),(98,98,'id',7224440,'1982-06-23 17:23:58',''),(99,99,'dolorem',794,'2019-02-17 07:36:27','\0'),(100,100,'omnis',325272,'2006-12-02 22:55:42','\0');
/*!40000 ALTER TABLE `user_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Carmelo','jairo68@example.net','3cdb70a7b37a2dd6c02e685eaea3feae000ddf4a','Malcolm',530859,''),(2,'Devin','jmoore@example.net','7fbcfc1ff468d2384e55e788a9245ac3a1b98635','Annie',604364,''),(3,'Mollie','vaughn.walker@example.com','6d005c85df746206eeee7fdea0c3563f5726e8cc','Juliana',446,''),(4,'Doyle','zemlak.ramon@example.net','91bf31dc89f3c78486c8bc05e7bc27d52edd3227','Reanna',52,''),(5,'Juston','claudie90@example.net','a9e4b861a907427ff2a7afa47b1ff3198d56889b','Pat',1,''),(6,'Kayley','kuhlman.astrid@example.com','ca3e16d40f7eea2d7ea917e9cbc518bd01c545e0','Imani',0,''),(7,'Riley','joany.kuhn@example.com','73e1a391c6d70f5f048ff5e5242516d124e6c304','Adam',2870172995,''),(8,'Jevon','alberta90@example.net','db0c0f086dc7c10b6854507f48e3fb7538092809','Elwin',830751,''),(9,'Richie','willa.goyette@example.org','1e217489d952502b25029017940285002a8f3029','Ariane',624,'\0'),(10,'Yolanda','ignatius25@example.org','3c555bac7893be13f16726e16ec52aad11c0c690','Anissa',0,''),(11,'Dayana','nellie.grant@example.org','29c925a270e01c3343e2743b30ff1a9e388081c0','Beatrice',3,''),(12,'Stephany','sherwood.gulgowski@example.org','c2bb9c10333c95b6c926e09c69ccb523b004405f','Sid',170634,'\0'),(13,'Maximillia','mekhi38@example.net','71c87716f975d0c79167bd588b1c76d8fd3aa90d','Rowena',162119,'\0'),(14,'Marley','jesse.lehner@example.net','06c477ea876effee18933fe120ca92b04b4eedff','Mabelle',9415481411,'\0'),(15,'Jaron','xrippin@example.org','f291dd016f693bc90c23bff3ff4532588dc3f835','Lillie',2305070332,'\0'),(16,'Dedric','gene01@example.net','155d47c47629618951e6601f11f07cb6ba75f84e','Dolores',27950,'\0'),(17,'Ruthie','devante.wolf@example.org','2e9f812eb6e5c153f40196b111e9d63c9385b896','Sam',93,'\0'),(18,'Matilda','nolan.kailey@example.org','1c97124e9770a85be2d37e1d2149e1a60aba9f4f','Bo',0,'\0'),(19,'Travon','etillman@example.com','7e650c6951c37cd1bc921b56d0bf5d34b32fbc41','Thalia',0,'\0'),(20,'Charles','ycronin@example.org','d2e99907762861d3746e6da61596e924073156ad','Concepcion',1,'\0'),(21,'Maudie','vcollins@example.org','4711c24904acc56de42f82de295070861c36d6ca','Gregoria',247,''),(22,'Constance','santa54@example.net','e08da9746fb58e259707b63218eb5b022dbfd2e3','Rosie',297134,''),(23,'Alexandrine','goyette.trinity@example.net','5499fe8056b17f55197beee3e24950416e0a2058','Dorothy',605663643,'\0'),(24,'Hardy','vilma00@example.net','bac14bcd20f74264caa6385c508683ac7bb9809e','Odell',73,'\0'),(25,'Randi','zcummerata@example.net','e23a305a16e9de4d75fce0cd8b0b2efb48e093da','Rosemary',327,''),(26,'Kasey','reymundo.satterfield@example.org','21439f9e97e8a46d7df7eaf285989c5b4657e47c','Madelynn',0,'\0'),(27,'Nash','vkovacek@example.com','172a815d059b159e359c96622f789c8708a52e94','Melyssa',58,''),(28,'Trinity','franecki.daija@example.org','ef1d2ab9f4259a701924af46e8fb14d414f30e29','Samanta',0,''),(29,'Asia','carmstrong@example.net','85c46a1dd5ad3537463eac1143034283c6317263','Catalina',1,''),(30,'Larry','davin.durgan@example.com','0836f7ae1a4027c11dd411bcb4960fe9da239508','Blaise',1,'\0'),(31,'Deon','dhowell@example.org','7c9e3a06f9e1e37aa1f5566a3d2f7a5837057aa7','Bridgette',0,'\0'),(32,'Ettie','jessy05@example.net','4ed876c8f7816f2bcc27d2e85df392b2af1e60d4','Randi',92,''),(33,'Jessica','ally.lakin@example.com','1f274b6e4b7e6aca106e42a1bcfee4b0f7bc9ab3','Oceane',0,'\0'),(34,'Thelma','pstoltenberg@example.com','03e295583bf92eb505fc3fd5120490f24ba2f7b4','Jewell',0,''),(35,'Sandra','walsh.junius@example.org','096afef3697af32cda34308475e5d6497780b366','Abby',2382246866,''),(36,'Prudence','rosemary66@example.net','0e8ef647ba0806de0e452580c363a5ebc25c5698','Nikolas',1,'\0'),(37,'Shawna','kenton.orn@example.com','fba2a7ebc4afe8c97a337e1efc570b1601d18271','Cortez',0,''),(38,'Damon','gianni62@example.org','448ce992c6f2229a02dd93e2485bc69d4ae31e88','Antwan',5722202781,'\0'),(39,'Joanne','guadalupe.deckow@example.net','a3ca2747e4baff5ed277448c1a1a3e3444de7610','Jesus',590,'\0'),(40,'Rosie','xolson@example.org','a3db9a6d279f65159f9ad9d79eda616bf52bb03d','Leann',69410,''),(41,'Lennie','qkozey@example.net','facd3739f3a8f2a5c57f81dfcbe459f287d39b82','Demarco',1,''),(42,'Trent','qhowe@example.com','ce848fc3730ee8317129add2a15a5da4b4d5c764','Tyrique',1,''),(43,'Murl','pansy.legros@example.net','8dd0db9c97f996a8ba7014046281104a93bc3102','Karelle',781261,'\0'),(44,'Xavier','alia.maggio@example.org','4fcae43807f469da523758dd6a66fb77113571f6','Andy',757645,'\0'),(45,'Bradley','schmitt.mohamed@example.net','7809f68f1fb6c93ac4865f41ec7f4eb6eb4cb970','Kali',67723,'\0'),(46,'Patience','hermiston.alessia@example.com','84ae9964812cc08114738e12898a69721ab98969','Thad',9,'\0'),(47,'Lorenza','bayer.bryce@example.net','cdaa256bf2f258eb6625422804b5821ede9fa56c','Matt',0,'\0'),(48,'Kole','brannon.ledner@example.org','27498a193df4a9e9c2514204987db8d9e40c1682','Darby',731,'\0'),(49,'Milford','ernser.cali@example.org','22baeeb3e71a454dd48a57ea47a340302059ff48','Korbin',1,''),(50,'Lawson','heather.tromp@example.net','bc19b41e211f73dec6891d7d7ca26eb4bbff7484','Candace',0,''),(51,'Kevon','hilll.dahlia@example.com','87fac73f5e72aa173b97e78189addb1f22d29503','Kayli',18,'\0'),(52,'Adeline','wolff.juana@example.net','45813e7c7243f59eb6b5b7c9efe3bf38c3627c02','Gage',1,''),(53,'Alf','tyrell55@example.org','76abe8339c5fc779b5efa7d6a26940eb76b3c0c6','Orville',9694036200,''),(54,'Kenneth','ramiro.mann@example.org','b7639170cbad36636d3c57f034da29458276319c','Maverick',0,'\0'),(55,'Darrell','hilda86@example.net','6cd5c9fb935188754b8d16d4d5bb799f4c68436d','Virginie',2850861746,'\0'),(56,'Helen','marcelle.o\'kon@example.net','2de105e325d8603caf1afcc3e1af524820e61644','Hazel',896960,'\0'),(57,'Lucie','odavis@example.org','0bd29b4db9e99cd5dc7c92df866170c59db955e8','Manuel',692035,'\0'),(58,'Wallace','mzulauf@example.com','659653d3f78823729977351f135b17ac89c0dcc7','Julian',243896,'\0'),(59,'Flossie','crona.mike@example.net','57d089cb1503a83e56a87d8e412829524abee757','Lloyd',846513,''),(60,'Abner','wankunding@example.net','ee5cfa4e8a6716dc163af1d22396ecd883b70dca','Bettie',61,''),(61,'Else','reinger.sibyl@example.net','f53a8aa1bd524feba10db5a330066f6159bb4ced','Jeffry',243420,'\0'),(62,'Serenity','uebert@example.net','9c54ec0f422b7bc5b1e894d0e3b0336b2c70ccaa','Noemie',0,''),(63,'Henri','marielle.veum@example.com','e155a2624d4b2bd2af89f9c480cf74ea0ea90933','Daniela',2506881049,'\0'),(64,'Alexanne','margot.fahey@example.org','6be28a25fc33d32b3b3961d31458c8d32dbe36ce','Samanta',727,'\0'),(65,'Rahsaan','tony.trantow@example.org','fbe7fc7c84586eb36b61f298fe0b600ac42e8fd4','Alba',10,'\0'),(66,'Joanny','lharber@example.org','46d1e0fb3f3ebd57495ca18dc4bb8559bd6d1909','Willa',1,''),(67,'Nelle','boyer.yasmine@example.org','4eaab9d75eac16ed9065dacfbee350fe6ce1280c','Noemie',320,'\0'),(68,'Karlee','kiana.ankunding@example.org','02041719f7982864064104ca9139e32182dee93c','Christy',3723855416,'\0'),(69,'Lavonne','kilback.julien@example.net','50d97bdf95ebb040b5e4c4a9e60051a0f9695ff8','Dayne',633570,''),(70,'Charity','brad.schinner@example.net','211c48e12a22449289a6c47170f1a12f1e4e0cd3','Madelyn',1,''),(71,'Eddy','o\'reilly.jessyca@example.org','f865c2052c3ae420ece689da4e92d0bd28b15b7e','Demario',0,''),(72,'Tiara','schuppe.rhianna@example.net','c2af430a0dd5ea444dd5975582d74ee1ac2b2bdf','Fabian',620,''),(73,'Zander','lehner.emmy@example.org','72dd35606d35457458f89b02bb1963d59c3e9a94','Walton',656910,''),(74,'Ashleigh','hartmann.jessica@example.com','dd3f888554319619a0aa075edc92ff58651cefe5','Jeffrey',29671,'\0'),(75,'Della','aliya.zieme@example.com','de1cc083576e19e00f896dbd1575cbb8aa33fb4d','Patsy',65,'\0'),(76,'Guido','vmuller@example.net','87cc11b407ffdd58dfcba941916afc04ce191dc2','Darien',456,'\0'),(77,'Axel','howell.americo@example.net','42fea5efb31b0cbf6cfbd30b2187394d1e6f6095','Nyasia',327703,'\0'),(78,'Caden','clifton24@example.com','3e54bc5ea35326ebac65aad7b7f2258cef4f3dfe','Shirley',0,''),(79,'Boyd','annette.ankunding@example.com','91495b0e2d1dc0f64e64087f40058412ec8135b8','Theron',0,''),(80,'Rachel','syble.cole@example.com','5571699135c4b5cdac1e7e9d6d82be9e67d24449','Bria',1,''),(81,'Lenna','malcolm18@example.org','5ed86faa7c6a91eea8649c7e9d9f82cf14bbe7df','Dagmar',72,''),(82,'Ardella','cgoyette@example.net','ae976581184893038b8a7402b2406055a72ddc7d','Deanna',865058,'\0'),(83,'Derick','bwiegand@example.com','820408e1dcd8929a66a9a754079e5b72f2a06feb','Constantin',1,'\0'),(84,'Travis','jailyn59@example.net','2de900ce2687e47bf6b9358ececa77b024f57f27','Deshaun',1,'\0'),(85,'Shakira','shanahan.jaida@example.org','360decaf7d8c3c4adb82099e27c1ce365aa9c8ed','Patricia',463603,''),(86,'Adrienne','johnny.paucek@example.org','6495079b99a4c3d97c1acd78b271a63f85014c64','Faye',0,'\0'),(87,'Shemar','cschmitt@example.com','c0ffd3a801eb8d728c719ee236e995ce1a405f90','Paul',306,'\0'),(88,'Vivien','graham.viviane@example.net','7e603af69dbe50adf0297da06abb25fe3e9a29a3','Garfield',0,''),(89,'Shanelle','hfahey@example.com','91fbb757ae54da056edf5d5e960d5bd8147b453d','Braden',690382,''),(90,'Garrick','darrell46@example.net','d3c6e046da1bba878714da67c176138c1f2b7ec7','Julio',781689,''),(91,'Gayle','bruen.ona@example.org','b315d045859f0927b169acebef2615640052c423','Roxanne',1,''),(92,'Ray','hermiston.orval@example.org','a73aed4a86bf6882e46566f18c5ff656b4a9ed91','Treva',0,''),(93,'Sincere','murazik.jaren@example.org','98c8d9318075be9536133de95f55df182e58f587','Deron',4603637078,''),(94,'Lois','hyatt.candace@example.org','f5590504ff13868d6cea55972c17e08e7d86f227','Quinn',0,'\0'),(95,'Eino','wolff.kaycee@example.org','996240884a2617e3fe7652a47ad20d44e6f1f03e','Edison',521,''),(96,'Dean','leopoldo.mann@example.org','f2032b82ed0cdc586d657225c5cffa2691d5cb9a','Lucio',25,'\0'),(97,'Ewald','daniela50@example.com','4e3ebe04c0e2323adb546cc163a878be9a142a34','Raina',0,''),(98,'Joanie','ahilll@example.org','798af4f078e58070f9ee3e214d771ce956c83cb9','Micaela',1,'\0'),(99,'Makayla','taryn82@example.com','c0640aa356add5b03af2a73e755413f58de159cd','Will',230140,'\0'),(100,'Madyson','jessika27@example.net','264886e1ea3051256388c566bcce4dcb07894783','Theo',0,'\0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-20 16:10:35
