-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: jv37_spring_jpa_product
-- ------------------------------------------------------
-- Server version	5.7.29-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Apple'),(2,'Huawei'),(3,'Samsung'),(4,'LG'),(5,'Nokia'),(6,'Xiaomi');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgpextbyee3uk9u6o2381m7ft1` (`product_id`),
  CONSTRAINT `FKgpextbyee3uk9u6o2381m7ft1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (4,'huawei-p30-lite-1-600x600.jpg',7),(5,'iphone-8-plus.jpg',8),(6,'mc-asus-rog-phone-2.jpg',9),(7,'a2f694d14fd1051297bea21116099ea8.jpg',10),(8,'huawei-p40-pro-400x460-3-400x460.png',11),(9,'lg-v40-silver.jpg',12),(10,'realme-7-043120-113149-400x460.png',13),(11,'realme-x50-mc-glacier.jpg',14),(12,'samsung-galaxy-note-10-hong-3.jpg',15),(13,'iphone-x-256gb-khong-face-id-didongviet.jpg',16);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_date` date NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'Quảng trị','Lamdeasung@gmail.com','Nguyễn Lâm','2020-11-15','1675753089',_binary ''),(2,'Quảng trị','lamabc@gmail.com','Nguyen Van Long','2020-11-15','0232121222',_binary ''),(3,'Quảng trị','Lamdeasung@gmail.com','Nguyen Hoai Nam','2020-11-15','0322141222',_binary ''),(4,'Quảng trị','ptu67314@gmail.com','Nguyễn Hoài Nam','2020-11-16','0389751764',_binary ''),(5,'Quảng trị','ptu67314@gmail.com','Nguyễn Lâm','2020-11-16','0375753089',_binary ''),(6,'Quảng trị','ptu67314@gmail.com','Nguyễn Lâm','2020-11-16','0389751764',_binary ''),(7,'Quảng trị','ptu67314@gmail.com','Nguyễn Lâm','2020-11-16','0389751764',_binary ''),(8,'Quảng trị','ptu67314@gmail.com','Nguyễn Lâm','2020-11-16','0232121222',_binary ''),(9,'Quảng trị','ptu67314@gmail.com','Nguyễn Lâm','2020-11-16','0232121222',_binary ''),(10,'Quảng trị','ptu67314@gmail.com','Nguyễn Lâm','2020-11-16','0235454121',_binary ''),(11,'Quảng trị','ptu67314@gmail.com','Nguyễn Lâm','2020-11-16','0375753089',_binary ''),(12,'Quảng trị','ptu67314@gmail.com','Nguyễn Lâm','2020-11-16','0235454121',_binary ''),(13,'Quảng trị','ptu67314@gmail.com','Nguyễn Lâm','2020-11-16','0389751764',_binary ''),(14,'Quảng trị','ptu67314@gmail.com','Nguyễn Lâm','2020-11-16','0322141222',_binary ''),(15,'Quảng trị','ptu67314@gmail.com','Nguyễn Lâm','2020-11-16','0235454121',_binary ''),(16,'Quảng trị','ptu67314@gmail.com','Nguyễn Lâm','2020-11-16','0389751764',_binary ''),(17,'Quảng trị','Lamdeasung@gmail.com','Nguyễn Lâm','2020-11-16','0389751764',_binary '');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sale` int(11) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `total` double DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlb8mofup9mi791hraxt9wlj5u` (`order_id`),
  KEY `FKb8bg2bkty0oksa3wiq5mp5qnc` (`product_id`),
  CONSTRAINT `FKb8bg2bkty0oksa3wiq5mp5qnc` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKlb8mofup9mi791hraxt9wlj5u` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,'mc-asus-rog-phone-2.jpg',8990000,1,0,_binary '',8990000,1,9),(2,'huawei-p30-lite-1-600x600.jpg',2560000,1,0,_binary '',2560000,2,7),(3,'huawei-p30-lite-1-600x600.jpg',2560000,1,0,_binary '',2560000,3,7),(4,'iphone-8-plus.jpg',7990000,1,0,_binary '',7990000,4,8),(5,'mc-asus-rog-phone-2.jpg',8990000,1,0,_binary '',8990000,5,9),(6,'mc-asus-rog-phone-2.jpg',8990000,1,0,_binary '',8990000,6,9),(7,'iphone-8-plus.jpg',7990000,1,0,_binary '',7990000,7,8),(8,'iphone-8-plus.jpg',7990000,1,0,_binary '',7990000,8,8),(9,'mc-asus-rog-phone-2.jpg',8990000,1,0,_binary '',8990000,9,9),(10,'iphone-8-plus.jpg',7990000,1,0,_binary '',7990000,10,8),(11,'mc-asus-rog-phone-2.jpg',8990000,1,0,_binary '',8990000,11,9),(12,'iphone-8-plus.jpg',7990000,1,0,_binary '',16980000,12,8),(13,'mc-asus-rog-phone-2.jpg',8990000,1,0,_binary '',16980000,12,9),(14,'huawei-p30-lite-1-600x600.jpg',2560000,1,0,_binary '',10550000,13,7),(15,'iphone-8-plus.jpg',7990000,1,0,_binary '',10550000,13,8),(16,'huawei-p30-lite-1-600x600.jpg',2560000,1,0,_binary '',19540000,14,7),(17,'iphone-8-plus.jpg',7990000,1,0,_binary '',19540000,14,8),(18,'mc-asus-rog-phone-2.jpg',8990000,1,0,_binary '',19540000,14,9),(19,'huawei-p30-lite-1-600x600.jpg',2560000,1,0,_binary '',19540000,15,7),(20,'iphone-8-plus.jpg',7990000,1,0,_binary '',19540000,15,8),(21,'mc-asus-rog-phone-2.jpg',8990000,1,0,_binary '',19540000,15,9),(22,'huawei-p30-lite-1-600x600.jpg',2560000,1,0,_binary '',27530000,16,7),(23,'iphone-8-plus.jpg',7990000,2,0,_binary '',27530000,16,8),(24,'mc-asus-rog-phone-2.jpg',8990000,1,0,_binary '',27530000,16,9),(25,'huawei-p40-pro-400x460-3-400x460.png',12000000,1,0,_binary '',12000000,17,11);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `publish_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (7,1,'Huawei P30 Lite','Huawei P30 Lite',2560000,'2019-02-15',2),(8,1,'iphone 8 plus','iphone 8 plus',7990000,'2019-01-24',1),(9,1,'Rog Phone 2','Rog Phone 2',8990000,'2019-06-15',6),(10,1,'samsung a12','samsung a12',4990000,'2019-02-04',3),(11,1,'huawei p40 pro','huawei p40 pro',12000000,'2020-03-25',2),(12,1,'LG V40','LG V40',5990000,'2018-06-25',4),(13,1,'Realme 7','Realme 7',3990000,'2019-02-21',4),(14,1,'REALME X50','REALME X50',250000,'2019-01-01',4),(15,1,'Samsung Galaxy Note10','Samsung Galaxy Note10',12650000,'2020-01-03',3),(16,1,'Iphone X','Iphone X',7990000,'2019-05-03',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_USER'),(2,'ROLE_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKiqpmjd2qb4rdkej916ymonic6` (`role_id`),
  KEY `FK4320p8bgvumlxjkohtbj214qi` (`user_id`),
  CONSTRAINT `FK4320p8bgvumlxjkohtbj214qi` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKiqpmjd2qb4rdkej916ymonic6` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,2,1),(2,1,2);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `status` bit(1) NOT NULL,
  `user_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'$2a$10$hbxecwitQQ.dDT4JOFzQAulNySFwEpaFLw38jda6Td.Y/cOiRzDFu',_binary '','admin'),(2,'$2a$10$hbxecwitQQ.dDT4JOFzQAulNySFwEpaFLw38jda6Td.Y/cOiRzDFu',_binary '','user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-30 12:45:32
