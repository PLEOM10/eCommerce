-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: e-commerce
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('PLACED','ACCEPTED','CANCELLED') DEFAULT 'PLACED',
  `payment_status` enum('UNPAID','PAID') DEFAULT 'UNPAID',
  PRIMARY KEY (`id`),
  KEY `FK_user_orderDetails_idx` (`user_id`),
  CONSTRAINT `FK_user_orderDetails` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,4,45000,'2023-05-12 11:54:53','2023-05-12 11:54:53','PLACED','UNPAID'),(2,4,20000,'2023-05-12 14:50:13','2023-05-19 15:09:02','ACCEPTED','UNPAID'),(3,4,20000,'2023-05-12 16:42:37','2023-05-18 14:29:41','ACCEPTED','UNPAID'),(4,4,20000,'2023-05-12 16:55:01','2023-05-18 14:30:09','ACCEPTED','UNPAID'),(5,4,20000,'2023-05-12 16:58:47','2023-05-18 14:36:38','ACCEPTED','UNPAID'),(6,4,20000,'2023-05-12 17:00:27','2023-05-18 15:01:32','ACCEPTED','UNPAID'),(7,4,20000,'2023-05-12 17:01:54','2023-05-19 17:23:42','ACCEPTED','PAID'),(8,4,20000,'2023-05-12 17:15:28','2023-05-18 15:41:36','ACCEPTED','UNPAID'),(9,4,20000,'2023-05-12 17:43:17','2023-05-18 15:48:51','ACCEPTED','UNPAID'),(10,4,20000,'2023-05-12 17:50:44','2023-05-19 11:18:47','ACCEPTED','UNPAID'),(11,4,20000,'2023-05-12 18:00:17','2023-05-19 16:44:49','ACCEPTED','UNPAID'),(12,4,20000,'2023-05-12 18:02:01','2023-05-12 18:02:01','PLACED','UNPAID'),(13,4,20000,'2023-05-12 18:05:45','2023-05-12 18:05:45','PLACED','UNPAID'),(14,4,20000,'2023-05-12 18:07:39','2023-05-12 18:07:39','PLACED','UNPAID'),(15,4,20000,'2023-05-12 18:08:25','2023-05-12 18:08:25','PLACED','UNPAID'),(16,4,20000,'2023-05-12 18:15:32','2023-05-12 18:15:32','PLACED','UNPAID'),(17,4,20000,'2023-05-12 18:16:46','2023-05-12 18:16:46','PLACED','UNPAID'),(18,4,20000,'2023-05-12 18:17:16','2023-05-12 18:17:16','PLACED','UNPAID'),(19,4,20000,'2023-05-12 18:18:12','2023-05-12 18:18:12','PLACED','UNPAID'),(20,4,20000,'2023-05-12 18:18:52','2023-05-12 18:18:52','PLACED','UNPAID'),(21,4,20000,'2023-05-12 18:20:10','2023-05-12 18:20:10','PLACED','UNPAID'),(22,4,20000,'2023-05-12 18:21:57','2023-05-12 18:21:57','PLACED','UNPAID'),(23,4,20000,'2023-05-12 18:31:44','2023-05-12 18:31:45','PLACED','UNPAID'),(24,7,20000,'2023-05-17 17:06:02','2023-05-19 17:40:15','PLACED','PAID'),(25,7,100000,'2023-05-17 17:41:04','2023-05-19 15:09:02','PLACED','PAID'),(26,7,20000,'2023-05-17 18:01:03','2023-05-19 17:40:53','PLACED','PAID'),(27,7,20000,'2023-05-17 18:02:44','2023-05-19 18:24:05','PLACED','PAID'),(28,7,40000,'2023-05-18 11:28:42','2023-05-18 11:28:42','PLACED','UNPAID'),(29,7,20000,'2023-05-18 15:56:59','2023-05-18 15:56:59','PLACED','UNPAID'),(30,6,20000,'2023-05-18 17:46:05','2023-05-18 17:46:05','PLACED','UNPAID'),(31,6,25000,'2023-05-18 17:46:39','2023-05-18 17:46:39','PLACED','UNPAID'),(32,8,25000,'2023-05-18 17:49:39','2023-05-18 17:49:39','PLACED','UNPAID'),(33,7,20000,'2023-05-19 12:35:44','2023-05-19 12:35:44','PLACED','UNPAID'),(34,7,20000,'2023-05-19 12:38:49','2023-05-19 12:38:49','PLACED','UNPAID'),(35,7,20000,'2023-05-19 12:47:08','2023-05-19 12:47:08','PLACED','UNPAID'),(36,7,25000,'2023-05-19 12:47:55','2023-05-19 12:47:55','PLACED','UNPAID'),(37,7,120000,'2023-05-19 12:52:11','2023-05-19 12:52:11','PLACED','UNPAID'),(38,7,120000,'2023-05-19 12:52:26','2023-05-22 10:33:08','PLACED','UNPAID'),(39,7,200000,'2023-05-19 13:09:14','2023-05-19 17:28:49','PLACED','PAID'),(40,7,200000,'2023-05-19 18:10:44','2023-05-19 18:10:44','PLACED','UNPAID');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_item_product_idx` (`order_id`),
  KEY `FK_product_item_idx` (`product_id`),
  CONSTRAINT `FK_order_item` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`id`),
  CONSTRAINT `FK_product_item` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,'2023-05-12 11:56:23','2023-05-12 11:56:23'),(2,1,2,1,'2023-05-12 11:56:23','2023-05-12 11:56:23'),(3,2,1,1,'2023-05-12 14:50:13','2023-05-12 14:50:13'),(4,3,1,1,'2023-05-12 16:42:37','2023-05-12 16:42:37'),(5,4,1,1,'2023-05-12 16:55:02','2023-05-12 16:55:02'),(6,5,1,1,'2023-05-12 16:58:47','2023-05-12 16:58:47'),(7,6,1,1,'2023-05-12 17:00:27','2023-05-12 17:00:27'),(8,7,1,1,'2023-05-12 17:01:54','2023-05-12 17:01:54'),(9,8,1,1,'2023-05-12 17:15:29','2023-05-12 17:15:29'),(10,9,1,1,'2023-05-12 17:43:17','2023-05-12 17:43:17'),(11,10,1,1,'2023-05-12 17:50:44','2023-05-12 17:50:44'),(12,11,1,1,'2023-05-12 18:00:17','2023-05-12 18:00:17'),(13,12,1,1,'2023-05-12 18:02:01','2023-05-12 18:02:01'),(14,13,1,1,'2023-05-12 18:05:45','2023-05-12 18:05:45'),(15,14,1,1,'2023-05-12 18:07:39','2023-05-12 18:07:39'),(16,15,1,1,'2023-05-12 18:08:25','2023-05-12 18:08:25'),(17,16,1,1,'2023-05-12 18:15:32','2023-05-12 18:15:32'),(18,17,1,1,'2023-05-12 18:16:46','2023-05-12 18:16:46'),(19,18,1,1,'2023-05-12 18:17:16','2023-05-12 18:17:16'),(20,19,1,1,'2023-05-12 18:18:12','2023-05-12 18:18:12'),(21,20,1,1,'2023-05-12 18:18:52','2023-05-12 18:18:52'),(22,21,1,1,'2023-05-12 18:20:10','2023-05-12 18:20:10'),(23,22,1,1,'2023-05-12 18:21:57','2023-05-12 18:21:57'),(24,23,1,1,'2023-05-12 18:31:45','2023-05-12 18:31:45'),(25,24,1,1,'2023-05-17 17:06:02','2023-05-17 17:06:02'),(26,25,15,1,'2023-05-17 17:41:04','2023-05-17 17:41:04'),(27,26,1,1,'2023-05-17 18:01:03','2023-05-17 18:01:03'),(28,27,1,1,'2023-05-17 18:02:44','2023-05-17 18:02:44'),(29,28,6,1,'2023-05-18 11:28:42','2023-05-18 11:28:42'),(30,29,1,1,'2023-05-18 15:56:59','2023-05-18 15:56:59'),(31,30,1,1,'2023-05-18 17:46:05','2023-05-18 17:46:05'),(32,31,3,1,'2023-05-18 17:46:39','2023-05-18 17:46:39'),(33,32,3,1,'2023-05-18 17:49:39','2023-05-18 17:49:39'),(34,33,1,1,'2023-05-19 12:35:44','2023-05-19 12:35:44'),(35,34,1,1,'2023-05-19 12:38:49','2023-05-19 12:38:49'),(36,35,1,1,'2023-05-19 12:47:08','2023-05-19 12:47:08'),(37,36,2,1,'2023-05-19 12:47:55','2023-05-19 12:47:55'),(38,37,6,3,'2023-05-19 12:52:11','2023-05-19 12:52:11'),(39,38,6,3,'2023-05-19 12:52:26','2023-05-19 12:52:39'),(40,39,6,5,'2023-05-19 13:09:14','2023-05-19 13:09:14'),(41,40,1,10,'2023-05-19 18:10:44','2023-05-19 18:10:44');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `provider` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_payment_idx` (`order_id`),
  CONSTRAINT `FK_order_payment` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `inventory_id` int DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_category_product_idx` (`category_id`),
  KEY `FK_inventory_product_idx` (`inventory_id`),
  CONSTRAINT `FK_category_product` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`),
  CONSTRAINT `FK_inventory_product` FOREIGN KEY (`inventory_id`) REFERENCES `product_inventory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Samsung Phone X',1,1,20000,'2023-05-08 17:20:30','2023-05-08 17:20:30',NULL),(2,'Samsung Phone Y',1,2,25000,'2023-05-11 11:16:26','2023-05-11 11:16:26',NULL),(3,'Samsung Phone Z',1,3,25000,'2023-05-11 11:21:46','2023-05-11 17:02:35',NULL),(4,'Apple Phone 1',1,4,50000,'2023-05-11 11:21:46','2023-05-11 17:04:06',NULL),(5,'Apple Phone 2',1,5,65000,'2023-05-11 11:21:46','2023-05-11 17:04:06',NULL),(6,'Mi Tablet',2,6,40000,'2023-05-11 17:05:01','2023-05-11 17:05:01',NULL),(7,'Oneplus Tablet',2,7,55000,'2023-05-11 17:06:16','2023-05-11 17:06:16',NULL),(8,'Dell Laptop',3,8,100000,'2023-05-11 17:10:02','2023-05-11 17:10:02',NULL),(9,'Lenovo Laptop',3,9,80000,'2023-05-11 17:10:02','2023-05-11 17:10:02',NULL),(10,'Acer Laptop',3,10,95000,'2023-05-11 17:10:02','2023-05-11 17:10:02',NULL),(11,'Sony Monitor',4,11,15000,'2023-05-11 17:11:32','2023-05-11 17:11:32',NULL),(12,'Alienware Monitor',4,12,30000,'2023-05-11 17:11:32','2023-05-11 17:11:32',NULL),(13,'Microsoft Monitor',4,13,20000,'2023-05-11 17:11:32','2023-05-11 17:11:32',NULL),(14,'Alienware CSU',5,14,150000,'2023-05-11 17:13:16','2023-05-11 17:13:16',NULL),(15,'ASUS CSU',5,15,100000,'2023-05-11 17:13:16','2023-05-11 17:13:16',NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Mobile','2023-05-08 17:18:31','2023-05-08 17:18:31',NULL),(2,'Tablet','2023-05-11 16:50:35','2023-05-11 16:50:35',NULL),(3,'Laptop','2023-05-11 16:50:49','2023-05-11 16:50:49',NULL),(4,'Monitor','2023-05-11 16:50:58','2023-05-11 16:50:58',NULL),(5,'CSU','2023-05-11 16:52:04','2023-05-11 16:52:04',NULL);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventory`
--

DROP TABLE IF EXISTS `product_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventory`
--

LOCK TABLES `product_inventory` WRITE;
/*!40000 ALTER TABLE `product_inventory` DISABLE KEYS */;
INSERT INTO `product_inventory` VALUES (1,100,'2023-05-08 17:20:23','2023-05-08 17:20:23',NULL),(2,50,'2023-05-11 11:16:21','2023-05-11 11:16:21',NULL),(3,50,'2023-05-11 16:55:10','2023-05-11 16:55:10',NULL),(4,50,'2023-05-11 16:56:49','2023-05-11 16:56:49',NULL),(5,50,'2023-05-11 16:56:49','2023-05-11 16:56:49',NULL),(6,100,'2023-05-11 16:56:49','2023-05-11 16:56:49',NULL),(7,100,'2023-05-11 16:56:49','2023-05-11 16:56:49',NULL),(8,75,'2023-05-11 16:56:49','2023-05-11 16:56:49',NULL),(9,100,'2023-05-11 16:56:49','2023-05-11 16:56:49',NULL),(10,25,'2023-05-11 16:56:49','2023-05-11 16:56:49',NULL),(11,50,'2023-05-11 16:56:49','2023-05-11 16:56:49',NULL),(12,50,'2023-05-11 16:56:49','2023-05-11 16:56:49',NULL),(13,100,'2023-05-11 16:56:49','2023-05-11 16:56:49',NULL),(14,100,'2023-05-11 16:56:49','2023-05-11 16:56:49',NULL),(15,75,'2023-05-11 16:56:49','2023-05-11 16:56:49',NULL),(16,100,'2023-05-11 16:56:49','2023-05-11 16:56:49',NULL),(17,25,'2023-05-11 16:56:49','2023-05-11 16:56:49',NULL);
/*!40000 ALTER TABLE `product_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `user_type` enum('ADMIN','CUSTOMER') DEFAULT 'CUSTOMER',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'foo_1','bar_1',NULL,'Foo','Bar','8191716288','CUSTOMER','2023-05-08 12:48:37',NULL),(2,'foo_2','bar_2',NULL,'Foo2','Bar2','8191764258','CUSTOMER','2023-05-11 10:16:38',NULL),(3,'foo_3','bar_3',NULL,'Foo3','Bar3','8122764357','CUSTOMER','2023-05-11 10:19:20','2023-05-11 10:19:59'),(4,'foo_4','$2a$10$ZdLBi3hQu0jdVn0IFzvpBeTnQPr7r2JrgiE8xVTpDnJeRQooIfT4G','pranavcollege36@gmail.com','Foo4','Bar4','8333764410','CUSTOMER','2023-05-11 11:54:47','2023-05-12 17:55:30'),(5,'admin123','$2a$10$HHurQQLLFxpG51NyNM/jSuStdPBG8y8BsBC83Ll9ohxYSZzlj5t.S',NULL,'Admin','Admin','1234567890','ADMIN','2023-05-12 11:32:52','2023-05-12 11:33:30'),(6,'David1234','$2a$10$NhYHjLIOovVXlhqpwNXiPubHWz.fhuHgQQWjHoVDmQ89FiXM8iNji','pranavcollege36@gmail.com','David','Humus','8879948148','CUSTOMER','2023-05-15 15:26:25','2023-05-16 18:40:09'),(7,'Larry1234','$2a$10$oh33vs8sKc33RpqOR3UoA.9mNaVjM/bfN02Dvfg0.wttfvmzfcAde','pranavcollege36@gmail.com','Larry','David','8822991199','CUSTOMER','2023-05-16 12:42:47','2023-05-16 18:40:09'),(8,'Barry1234','$2a$10$FSh19ZcxPMuaMhzGuvTO8u2ngC1A5G/dNLCxu8Q37WFl8ThFQ9jJy',NULL,'Barry','Allen','9191919191','CUSTOMER','2023-05-18 17:49:21','2023-05-18 17:49:21');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_payment`
--

DROP TABLE IF EXISTS `user_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `payment_type` varchar(45) DEFAULT NULL,
  `provider` varchar(45) DEFAULT NULL,
  `account_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_idx` (`user_id`),
  CONSTRAINT `FK_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_payment`
--

LOCK TABLES `user_payment` WRITE;
/*!40000 ALTER TABLE `user_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-22 10:40:56
