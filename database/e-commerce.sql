-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: chargup
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `address` varchar(300) NOT NULL,
  `floor` varchar(100) DEFAULT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `type` enum('HOME','OFFICE','OTHER') NOT NULL DEFAULT 'HOME',
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address_FK` (`customer_id`),
  CONSTRAINT `address_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `path` varchar(50) DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `station_id` int DEFAULT NULL,
  `vehicle_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `charge_point_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `thumbnail` varchar(300) DEFAULT NULL,
  `uploaded_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attachment_FK` (`customer_id`),
  KEY `attachment_FK_1` (`station_id`),
  KEY `attachment_FK_2` (`member_id`),
  KEY `attachment_FK_3` (`vendor_id`),
  CONSTRAINT `attachment_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `attachment_FK_1` FOREIGN KEY (`station_id`) REFERENCES `charging_station` (`id`),
  CONSTRAINT `attachment_FK_2` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  CONSTRAINT `attachment_FK_3` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `charge_point_id` int NOT NULL,
  `connector_id` int NOT NULL,
  `invoice_id` int DEFAULT NULL,
  `charge_type` enum('CASH','KWH','TIME','CHARGE%') NOT NULL DEFAULT 'CASH',
  `charge_type_value` varchar(20) DEFAULT NULL,
  `from_time` time DEFAULT NULL,
  `to_time` time DEFAULT NULL,
  `payable_amount` float DEFAULT NULL,
  `charging_status` enum('BOOKED','CANCELLED','COMPLETED','IN_PROGRESS','ADVANCE_PENDING','BALANCE_PENDING') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'ADVANCE_PENDING',
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `vehicle_id` int DEFAULT NULL,
  `station_id` int DEFAULT NULL,
  `referal_code` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reservation_id` varchar(100) DEFAULT NULL,
  `charging_type` enum('BOOKED','DIRECT') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'BOOKED',
  `transaction_id` varchar(100) DEFAULT NULL,
  `is_booked` int DEFAULT NULL,
  `actual_start_time` datetime DEFAULT NULL,
  `gross_amount` float DEFAULT NULL,
  `actual_stop_time` datetime DEFAULT NULL,
  `is_missed` tinyint DEFAULT '0',
  `charged_by` int DEFAULT NULL,
  `charged_by_member` tinyint DEFAULT '0',
  `power_consumed` int DEFAULT NULL,
  `remind_at` time DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_FK` (`station_id`),
  KEY `booking_FK_1` (`customer_id`),
  KEY `booking_FK_2` (`charge_point_id`),
  KEY `booking_FK_3` (`connector_id`),
  KEY `booking_FK_4` (`vehicle_id`),
  CONSTRAINT `booking_FK` FOREIGN KEY (`station_id`) REFERENCES `charging_station` (`id`),
  CONSTRAINT `booking_FK_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `booking_FK_2` FOREIGN KEY (`charge_point_id`) REFERENCES `charging_point` (`id`),
  CONSTRAINT `booking_FK_3` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`),
  CONSTRAINT `booking_FK_4` FOREIGN KEY (`vehicle_id`) REFERENCES `my_vehicles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charger_types`
--

DROP TABLE IF EXISTS `charger_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charger_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `thumbnail` varchar(300) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charger_types`
--

LOCK TABLES `charger_types` WRITE;
/*!40000 ALTER TABLE `charger_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `charger_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_point`
--

DROP TABLE IF EXISTS `charging_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charging_point` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `station_id` int DEFAULT NULL,
  `cp_id` varchar(30) DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `charging_point_FK` (`station_id`),
  CONSTRAINT `charging_point_FK` FOREIGN KEY (`station_id`) REFERENCES `charging_station` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_point`
--

LOCK TABLES `charging_point` WRITE;
/*!40000 ALTER TABLE `charging_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `charging_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_station`
--

DROP TABLE IF EXISTS `charging_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charging_station` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` enum('PUBLIC','PRIVATE') NOT NULL DEFAULT 'PUBLIC',
  `address` varchar(300) NOT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `open_time` time DEFAULT NULL,
  `close_time` time DEFAULT NULL,
  `ratings` float NOT NULL DEFAULT '0',
  `thumbnail` varchar(100) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `pin` varchar(10) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `network_id` int DEFAULT NULL,
  `station_url` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `advance` int DEFAULT '10',
  `approved_status` enum('APPROVED','REJECTED','PENDING') DEFAULT 'PENDING',
  `threshold_time` int DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_station`
--

LOCK TABLES `charging_station` WRITE;
/*!40000 ALTER TABLE `charging_station` DISABLE KEYS */;
/*!40000 ALTER TABLE `charging_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configurations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `advance_amount` int DEFAULT NULL,
  `referal_amount` int DEFAULT NULL,
  `time` int DEFAULT '1',
  `reminders` varchar(100) DEFAULT NULL,
  `convenience` int DEFAULT NULL,
  `cgst` double(10,2) DEFAULT NULL,
  `sgst` double(10,2) DEFAULT NULL,
  `igst` double(10,2) DEFAULT NULL,
  `loyality_point_value` double DEFAULT NULL,
  `gift_voucher_amount` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connector`
--

DROP TABLE IF EXISTS `connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connector` (
  `id` int NOT NULL AUTO_INCREMENT,
  `charge_point_id` int DEFAULT NULL,
  `charger_type_id` int NOT NULL,
  `price_per_khw` float DEFAULT NULL,
  `power` double DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `in_use` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `connector_FK` (`charge_point_id`),
  KEY `connector_FK_1` (`charger_type_id`),
  CONSTRAINT `connector_FK` FOREIGN KEY (`charge_point_id`) REFERENCES `charging_point` (`id`) ON DELETE CASCADE,
  CONSTRAINT `connector_FK_1` FOREIGN KEY (`charger_type_id`) REFERENCES `charger_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connector`
--

LOCK TABLES `connector` WRITE;
/*!40000 ALTER TABLE `connector` DISABLE KEYS */;
/*!40000 ALTER TABLE `connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_types`
--

DROP TABLE IF EXISTS `coupon_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` enum('GENERIC','NETWORK','USER') DEFAULT 'GENERIC',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_types`
--

LOCK TABLES `coupon_types` WRITE;
/*!40000 ALTER TABLE `coupon_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_users`
--

DROP TABLE IF EXISTS `coupon_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(10) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `is_applied` tinyint DEFAULT '0',
  `status` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `coupon_users_FK` (`customer_id`),
  CONSTRAINT `coupon_users_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_users`
--

LOCK TABLES `coupon_users` WRITE;
/*!40000 ALTER TABLE `coupon_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `sub_title` varchar(100) DEFAULT NULL,
  `coupon_code` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `offer` int DEFAULT NULL,
  `type` enum('PERCENTAGE','AMOUNT') DEFAULT 'AMOUNT',
  `start_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `coupon_status` enum('NOT_STARTED','LIVE','EXPIRED') DEFAULT 'NOT_STARTED',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `network_id` int DEFAULT NULL,
  `min_amount` int DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `profile_picture` varchar(150) DEFAULT NULL,
  `player_id` varchar(30) DEFAULT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `notification_off` tinyint NOT NULL DEFAULT '0',
  `last_login_at` datetime DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `attachment_id` int DEFAULT NULL,
  `referal_code` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `loyality_points` int DEFAULT NULL,
  `thumbnail` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'http://43.204.45.214:3000/customer.png',
  `cashback` double(10,2) DEFAULT NULL,
  `referal` varchar(100) DEFAULT NULL,
  `question` varchar(5) DEFAULT NULL,
  `answer` varchar(8) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` varchar(1) DEFAULT NULL,
  `referal_amount` int DEFAULT '0',
  `referal_cashback_credited` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `player_id` varchar(1000) DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `mobile` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devices_FK` (`customer_id`),
  CONSTRAINT `devices_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(100) DEFAULT NULL,
  `answer` varchar(300) DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite_stations`
--

DROP TABLE IF EXISTS `favourite_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourite_stations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `station_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favourite_stations_FK` (`station_id`),
  KEY `favourite_stations_FK_1` (`customer_id`),
  CONSTRAINT `favourite_stations_FK` FOREIGN KEY (`station_id`) REFERENCES `charging_station` (`id`),
  CONSTRAINT `favourite_stations_FK_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite_stations`
--

LOCK TABLES `favourite_stations` WRITE;
/*!40000 ALTER TABLE `favourite_stations` DISABLE KEYS */;
/*!40000 ALTER TABLE `favourite_stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `station_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `rating` int DEFAULT NULL,
  `review` longtext,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `charger_rating` int DEFAULT NULL,
  `connector_rating` int DEFAULT NULL,
  `accuracy_rating` int DEFAULT NULL,
  `value_rating` int DEFAULT NULL,
  `location_rating` int DEFAULT NULL,
  `booking_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_FK` (`station_id`),
  KEY `feedback_FK_1` (`customer_id`),
  CONSTRAINT `feedback_FK` FOREIGN KEY (`station_id`) REFERENCES `charging_station` (`id`),
  CONSTRAINT `feedback_FK_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giftvouchers`
--

DROP TABLE IF EXISTS `giftvouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giftvouchers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `is_seen` tinyint DEFAULT '0',
  `is_claimed` tinyint DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `remarks` varchar(300) DEFAULT NULL,
  `vehicle_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `giftvouchers_FK` (`customer_id`),
  CONSTRAINT `giftvouchers_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giftvouchers`
--

LOCK TABLES `giftvouchers` WRITE;
/*!40000 ALTER TABLE `giftvouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `giftvouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_and_support`
--

DROP TABLE IF EXISTS `help_and_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_and_support` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `fb_url` varchar(1000) DEFAULT NULL,
  `insta_url` varchar(1000) DEFAULT NULL,
  `twitter_url` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_and_support`
--

LOCK TABLES `help_and_support` WRITE;
/*!40000 ALTER TABLE `help_and_support` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_and_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_enquiries`
--

DROP TABLE IF EXISTS `host_enquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `host_enquiries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `no_of_charging_points` int DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `pin` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_enquiries`
--

LOCK TABLES `host_enquiries` WRITE;
/*!40000 ALTER TABLE `host_enquiries` DISABLE KEYS */;
/*!40000 ALTER TABLE `host_enquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int DEFAULT NULL,
  `gross_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `discount_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `is_wallet` tinyint(1) NOT NULL DEFAULT '0',
  `wallet_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `coupon_amount` double(10,2) DEFAULT '0.00',
  `tax_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `net_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `total_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `payment_mode` enum('WALLET','RAZORPAY') NOT NULL DEFAULT 'RAZORPAY',
  `pg_order_id` varchar(100) DEFAULT NULL,
  `pg_response` longtext,
  `payment_status` enum('PENDING','PROCESSING','FAILED','SUCCESS','REFUNDED') NOT NULL DEFAULT 'PENDING',
  `refund_amount` double(10,2) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `cgst` double(10,2) DEFAULT '0.00',
  `sgst` double(10,2) DEFAULT '0.00',
  `igst` double(10,2) DEFAULT '0.00',
  `convenience_amount` double(10,2) DEFAULT '0.00',
  `reward_points` int DEFAULT '0',
  `payment_type` enum('ADVANCE','BALANCE') DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `doc_link` varchar(1000) DEFAULT NULL,
  `payment_made_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_FK` (`booking_id`),
  CONSTRAINT `invoice_FK` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyalitypoints`
--

DROP TABLE IF EXISTS `loyalitypoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyalitypoints` (
  `id` int NOT NULL AUTO_INCREMENT,
  `points` int DEFAULT NULL,
  `booking_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `reedemed` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `loyalitypoints_FK` (`booking_id`),
  CONSTRAINT `loyalitypoints_FK` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyalitypoints`
--

LOCK TABLES `loyalitypoints` WRITE;
/*!40000 ALTER TABLE `loyalitypoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `loyalitypoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer_master`
--

DROP TABLE IF EXISTS `manufacturer_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `thumbnail` varchar(300) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer_master`
--

LOCK TABLES `manufacturer_master` WRITE;
/*!40000 ALTER TABLE `manufacturer_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufacturer_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `member_type` enum('FAMILY','FRIEND','DRIVER') DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `thumbnail` varchar(300) DEFAULT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_FK` (`customer_id`),
  CONSTRAINT `member_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_vehicles`
--

DROP TABLE IF EXISTS `my_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_vehicles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `vehicle_registration_no` varchar(50) NOT NULL,
  `vehicle_type_id` int NOT NULL,
  `manufacturer_id` int NOT NULL,
  `vehicle_model_id` int NOT NULL,
  `vehicle_variant_id` int NOT NULL,
  `usage` enum('PRIVATE','COMMERCIAL') NOT NULL DEFAULT 'PRIVATE',
  `i_am` enum('OWNER','DRIVER') NOT NULL DEFAULT 'OWNER',
  `year` int NOT NULL,
  `vin_number` varchar(50) NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `vehicle_purchase_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `my_vehicles_FK` (`manufacturer_id`),
  KEY `my_vehicles_FK_1` (`vehicle_model_id`),
  KEY `my_vehicles_FK_2` (`vehicle_type_id`),
  KEY `my_vehicles_FK_3` (`vehicle_variant_id`),
  CONSTRAINT `my_vehicles_FK` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer_master` (`id`),
  CONSTRAINT `my_vehicles_FK_1` FOREIGN KEY (`vehicle_model_id`) REFERENCES `vehicle_model_master` (`id`),
  CONSTRAINT `my_vehicles_FK_2` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_type_master` (`id`),
  CONSTRAINT `my_vehicles_FK_3` FOREIGN KEY (`vehicle_variant_id`) REFERENCES `vehicle_variant_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_vehicles`
--

LOCK TABLES `my_vehicles` WRITE;
/*!40000 ALTER TABLE `my_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network`
--

DROP TABLE IF EXISTS `network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `network` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network`
--

LOCK TABLES `network` WRITE;
/*!40000 ALTER TABLE `network` DISABLE KEYS */;
/*!40000 ALTER TABLE `network` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(100) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `thumbnail` varchar(1000) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_FK` (`customer_id`),
  CONSTRAINT `notification_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_categories`
--

DROP TABLE IF EXISTS `notification_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_categories`
--

LOCK TABLES `notification_categories` WRITE;
/*!40000 ALTER TABLE `notification_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_category_types`
--

DROP TABLE IF EXISTS `notification_category_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_category_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_category_types`
--

LOCK TABLES `notification_category_types` WRITE;
/*!40000 ALTER TABLE `notification_category_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_category_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_sub_categories`
--

DROP TABLE IF EXISTS `notification_sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_sub_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sub_category_type` varchar(100) DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_sub_categories`
--

LOCK TABLES `notification_sub_categories` WRITE;
/*!40000 ALTER TABLE `notification_sub_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_types`
--

DROP TABLE IF EXISTS `notification_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_types`
--

LOCK TABLES `notification_types` WRITE;
/*!40000 ALTER TABLE `notification_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp`
--

DROP TABLE IF EXISTS `otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mobile` varchar(15) DEFAULT NULL,
  `otp` int NOT NULL,
  `otp_type` enum('SMS','EMAIL') NOT NULL DEFAULT 'SMS',
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email_otp` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp`
--

LOCK TABLES `otp` WRITE;
/*!40000 ALTER TABLE `otp` DISABLE KEYS */;
/*!40000 ALTER TABLE `otp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner_enquiries`
--

DROP TABLE IF EXISTS `owner_enquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner_enquiries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pin` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `query` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner_enquiries`
--

LOCK TABLES `owner_enquiries` WRITE;
/*!40000 ALTER TABLE `owner_enquiries` DISABLE KEYS */;
/*!40000 ALTER TABLE `owner_enquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `query` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  `status` enum('PENDING','ANSWERED') DEFAULT 'PENDING',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `queries_FK` (`vendor_id`),
  CONSTRAINT `queries_FK` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referals`
--

DROP TABLE IF EXISTS `referals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `status` enum('PENDING','ACCEPTED') DEFAULT 'PENDING',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `referal_code` varchar(100) DEFAULT NULL,
  `amount` int DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `referals_FK` (`customer_id`),
  CONSTRAINT `referals_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referals`
--

LOCK TABLES `referals` WRITE;
/*!40000 ALTER TABLE `referals` DISABLE KEYS */;
/*!40000 ALTER TABLE `referals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_content`
--

DROP TABLE IF EXISTS `static_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `static_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content_type` enum('ABOUT','CONTACT','PRIVACY','HELP','EV GUIDE') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_content`
--

LOCK TABLES `static_content` WRITE;
/*!40000 ALTER TABLE `static_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations_amenities`
--

DROP TABLE IF EXISTS `stations_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations_amenities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `station_id` int NOT NULL,
  `amenity_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stations_amenities_FK` (`amenity_id`),
  KEY `stations_amenities_FK_1` (`station_id`),
  CONSTRAINT `stations_amenities_FK` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`),
  CONSTRAINT `stations_amenities_FK_1` FOREIGN KEY (`station_id`) REFERENCES `charging_station` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations_amenities`
--

LOCK TABLES `stations_amenities` WRITE;
/*!40000 ALTER TABLE `stations_amenities` DISABLE KEYS */;
/*!40000 ALTER TABLE `stations_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations_connectors`
--

DROP TABLE IF EXISTS `stations_connectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations_connectors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `charge_point_id` int NOT NULL,
  `connector_id` int NOT NULL,
  `in_use` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stations_connectors_FK` (`charge_point_id`),
  KEY `stations_connectors_FK_1` (`connector_id`),
  CONSTRAINT `stations_connectors_FK` FOREIGN KEY (`charge_point_id`) REFERENCES `charging_point` (`id`),
  CONSTRAINT `stations_connectors_FK_1` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations_connectors`
--

LOCK TABLES `stations_connectors` WRITE;
/*!40000 ALTER TABLE `stations_connectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `stations_connectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(100) DEFAULT NULL,
  `meter_start` varchar(100) DEFAULT NULL,
  `meter_stop` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `start_time` varchar(100) DEFAULT NULL,
  `stop_time` varchar(100) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `booking_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_FK` (`booking_id`),
  CONSTRAINT `transaction_FK` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle_id` int DEFAULT NULL,
  `connector_id` int DEFAULT NULL,
  `source` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `destination` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `source_latitude` double DEFAULT NULL,
  `source_longitude` double DEFAULT NULL,
  `destination_latitude` double DEFAULT NULL,
  `destination_longitude` double DEFAULT NULL,
  `trip_status` enum('SAVED','ON_GOING','CANCELLED','COMPLETED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'SAVED',
  `time` varchar(100) DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `trip_FK` (`vehicle_id`),
  KEY `trip_FK_1` (`connector_id`),
  CONSTRAINT `trip_FK` FOREIGN KEY (`vehicle_id`) REFERENCES `my_vehicles` (`id`),
  CONSTRAINT `trip_FK_1` FOREIGN KEY (`connector_id`) REFERENCES `connector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notification_preferences`
--

DROP TABLE IF EXISTS `user_notification_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_notification_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_notification_preferences_FK` (`category_id`),
  KEY `user_notification_preferences_FK_1` (`type_id`),
  KEY `user_notification_preferences_FK_2` (`customer_id`),
  CONSTRAINT `user_notification_preferences_FK` FOREIGN KEY (`category_id`) REFERENCES `notification_categories` (`id`),
  CONSTRAINT `user_notification_preferences_FK_1` FOREIGN KEY (`type_id`) REFERENCES `notification_category_types` (`id`),
  CONSTRAINT `user_notification_preferences_FK_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notification_preferences`
--

LOCK TABLES `user_notification_preferences` WRITE;
/*!40000 ALTER TABLE `user_notification_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sub_notification_preferences`
--

DROP TABLE IF EXISTS `user_sub_notification_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sub_notification_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `sub_category_id` int DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_sub_notification_preferences_FK` (`type_id`),
  KEY `user_sub_notification_preferences_FK_1` (`category_id`),
  KEY `user_sub_notification_preferences_FK_2` (`sub_category_id`),
  KEY `user_sub_notification_preferences_FK_3` (`customer_id`),
  CONSTRAINT `user_sub_notification_preferences_FK` FOREIGN KEY (`type_id`) REFERENCES `notification_types` (`id`),
  CONSTRAINT `user_sub_notification_preferences_FK_1` FOREIGN KEY (`category_id`) REFERENCES `notification_categories` (`id`),
  CONSTRAINT `user_sub_notification_preferences_FK_2` FOREIGN KEY (`sub_category_id`) REFERENCES `notification_sub_categories` (`id`),
  CONSTRAINT `user_sub_notification_preferences_FK_3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sub_notification_preferences`
--

LOCK TABLES `user_sub_notification_preferences` WRITE;
/*!40000 ALTER TABLE `user_sub_notification_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_sub_notification_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_connectors`
--

DROP TABLE IF EXISTS `vehicle_connectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_connectors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int DEFAULT NULL,
  `model_id` int DEFAULT NULL,
  `charger_type_id` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `max_khw` double DEFAULT NULL,
  `time` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_connectors_FK` (`manufacturer_id`),
  KEY `vehicle_connectors_FK_1` (`model_id`),
  KEY `vehicle_connectors_FK_2` (`charger_type_id`),
  CONSTRAINT `vehicle_connectors_FK` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer_master` (`id`),
  CONSTRAINT `vehicle_connectors_FK_1` FOREIGN KEY (`model_id`) REFERENCES `vehicle_model_master` (`id`),
  CONSTRAINT `vehicle_connectors_FK_2` FOREIGN KEY (`charger_type_id`) REFERENCES `charger_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_connectors`
--

LOCK TABLES `vehicle_connectors` WRITE;
/*!40000 ALTER TABLE `vehicle_connectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_connectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_model_master`
--

DROP TABLE IF EXISTS `vehicle_model_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_model_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `manufacturer_id` int DEFAULT NULL,
  `thumbnail` varchar(300) DEFAULT NULL,
  `year` varchar(5) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_model_master_FK` (`manufacturer_id`),
  CONSTRAINT `vehicle_model_master_FK` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_model_master`
--

LOCK TABLES `vehicle_model_master` WRITE;
/*!40000 ALTER TABLE `vehicle_model_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_model_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_type_master`
--

DROP TABLE IF EXISTS `vehicle_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_type_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_type_master`
--

LOCK TABLES `vehicle_type_master` WRITE;
/*!40000 ALTER TABLE `vehicle_type_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_variant_master`
--

DROP TABLE IF EXISTS `vehicle_variant_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_variant_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `manufacturer_id` int DEFAULT NULL,
  `model_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_variant_master_FK` (`manufacturer_id`),
  KEY `vehicle_variant_master_FK_1` (`model_id`),
  CONSTRAINT `vehicle_variant_master_FK` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer_master` (`id`),
  CONSTRAINT `vehicle_variant_master_FK_1` FOREIGN KEY (`model_id`) REFERENCES `vehicle_model_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_variant_master`
--

LOCK TABLES `vehicle_variant_master` WRITE;
/*!40000 ALTER TABLE `vehicle_variant_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_variant_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mobile` varchar(15) NOT NULL,
  `pan` varchar(15) DEFAULT NULL,
  `gst_no` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `business_type` varchar(100) DEFAULT NULL,
  `business_url` varchar(100) DEFAULT NULL,
  `business_mobile` varchar(15) DEFAULT NULL,
  `business_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `area` int DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `reset_password_code` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `thumbnail` varchar(300) DEFAULT NULL,
  `user_type` enum('VENDOR','ADMIN') DEFAULT 'VENDOR',
  `approved_status` enum('APPROVED','REJECTED','PENDING') DEFAULT 'PENDING',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_accounts`
--

DROP TABLE IF EXISTS `vendor_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `tags` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `vendor_account_id` varchar(100) DEFAULT NULL,
  `vehicle_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_accounts_FK` (`vendor_id`),
  KEY `vendor_accounts_FK_1` (`customer_id`),
  KEY `vendor_accounts_FK_2` (`vehicle_id`),
  CONSTRAINT `vendor_accounts_FK` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`),
  CONSTRAINT `vendor_accounts_FK_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `vendor_accounts_FK_2` FOREIGN KEY (`vehicle_id`) REFERENCES `my_vehicles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_accounts`
--

LOCK TABLES `vendor_accounts` WRITE;
/*!40000 ALTER TABLE `vendor_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_configurations`
--

DROP TABLE IF EXISTS `vendor_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_configurations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int DEFAULT NULL,
  `cancellation_time` int DEFAULT NULL,
  `grace_time` int DEFAULT NULL,
  `advance_charges` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `vendor_configurations_FK` (`vendor_id`),
  CONSTRAINT `vendor_configurations_FK` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_configurations`
--

LOCK TABLES `vendor_configurations` WRITE;
/*!40000 ALTER TABLE `vendor_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_transactions`
--

DROP TABLE IF EXISTS `wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` float DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `type` enum('CREDIT','DEBIT') DEFAULT NULL,
  `from` enum('Loyality','Gift Voucher','Referal','Booking') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallet_transactions_FK` (`customer_id`),
  CONSTRAINT `wallet_transactions_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_transactions`
--

LOCK TABLES `wallet_transactions` WRITE;
/*!40000 ALTER TABLE `wallet_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-19 18:53:08
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
INSERT INTO `order_details` VALUES (1,4,45000,'2023-05-12 11:54:53','2023-05-12 11:54:53','PLACED','UNPAID'),(2,4,20000,'2023-05-12 14:50:13','2023-05-19 15:09:02','ACCEPTED','UNPAID'),(3,4,20000,'2023-05-12 16:42:37','2023-05-18 14:29:41','ACCEPTED','UNPAID'),(4,4,20000,'2023-05-12 16:55:01','2023-05-18 14:30:09','ACCEPTED','UNPAID'),(5,4,20000,'2023-05-12 16:58:47','2023-05-18 14:36:38','ACCEPTED','UNPAID'),(6,4,20000,'2023-05-12 17:00:27','2023-05-18 15:01:32','ACCEPTED','UNPAID'),(7,4,20000,'2023-05-12 17:01:54','2023-05-19 17:23:42','ACCEPTED','PAID'),(8,4,20000,'2023-05-12 17:15:28','2023-05-18 15:41:36','ACCEPTED','UNPAID'),(9,4,20000,'2023-05-12 17:43:17','2023-05-18 15:48:51','ACCEPTED','UNPAID'),(10,4,20000,'2023-05-12 17:50:44','2023-05-19 11:18:47','ACCEPTED','UNPAID'),(11,4,20000,'2023-05-12 18:00:17','2023-05-19 16:44:49','ACCEPTED','UNPAID'),(12,4,20000,'2023-05-12 18:02:01','2023-05-12 18:02:01','PLACED','UNPAID'),(13,4,20000,'2023-05-12 18:05:45','2023-05-12 18:05:45','PLACED','UNPAID'),(14,4,20000,'2023-05-12 18:07:39','2023-05-12 18:07:39','PLACED','UNPAID'),(15,4,20000,'2023-05-12 18:08:25','2023-05-12 18:08:25','PLACED','UNPAID'),(16,4,20000,'2023-05-12 18:15:32','2023-05-12 18:15:32','PLACED','UNPAID'),(17,4,20000,'2023-05-12 18:16:46','2023-05-12 18:16:46','PLACED','UNPAID'),(18,4,20000,'2023-05-12 18:17:16','2023-05-12 18:17:16','PLACED','UNPAID'),(19,4,20000,'2023-05-12 18:18:12','2023-05-12 18:18:12','PLACED','UNPAID'),(20,4,20000,'2023-05-12 18:18:52','2023-05-12 18:18:52','PLACED','UNPAID'),(21,4,20000,'2023-05-12 18:20:10','2023-05-12 18:20:10','PLACED','UNPAID'),(22,4,20000,'2023-05-12 18:21:57','2023-05-12 18:21:57','PLACED','UNPAID'),(23,4,20000,'2023-05-12 18:31:44','2023-05-12 18:31:45','PLACED','UNPAID'),(24,7,20000,'2023-05-17 17:06:02','2023-05-19 17:40:15','PLACED','PAID'),(25,7,100000,'2023-05-17 17:41:04','2023-05-19 15:09:02','PLACED','PAID'),(26,7,20000,'2023-05-17 18:01:03','2023-05-19 17:40:53','PLACED','PAID'),(27,7,20000,'2023-05-17 18:02:44','2023-05-19 18:24:05','PLACED','PAID'),(28,7,40000,'2023-05-18 11:28:42','2023-05-18 11:28:42','PLACED','UNPAID'),(29,7,20000,'2023-05-18 15:56:59','2023-05-18 15:56:59','PLACED','UNPAID'),(30,6,20000,'2023-05-18 17:46:05','2023-05-18 17:46:05','PLACED','UNPAID'),(31,6,25000,'2023-05-18 17:46:39','2023-05-18 17:46:39','PLACED','UNPAID'),(32,8,25000,'2023-05-18 17:49:39','2023-05-18 17:49:39','PLACED','UNPAID'),(33,7,20000,'2023-05-19 12:35:44','2023-05-19 12:35:44','PLACED','UNPAID'),(34,7,20000,'2023-05-19 12:38:49','2023-05-19 12:38:49','PLACED','UNPAID'),(35,7,20000,'2023-05-19 12:47:08','2023-05-19 12:47:08','PLACED','UNPAID'),(36,7,25000,'2023-05-19 12:47:55','2023-05-19 12:47:55','PLACED','UNPAID'),(37,7,120000,'2023-05-19 12:52:11','2023-05-19 12:52:11','PLACED','UNPAID'),(38,7,1200000,'2023-05-19 12:52:26','2023-05-19 12:52:26','PLACED','UNPAID'),(39,7,200000,'2023-05-19 13:09:14','2023-05-19 17:28:49','PLACED','PAID'),(40,7,200000,'2023-05-19 18:10:44','2023-05-19 18:10:44','PLACED','UNPAID');
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
  KEY `FK_items_product_idx` (`product_id`),
  KEY `FK_items_details_idx` (`order_id`),
  CONSTRAINT `FK_items_details` FOREIGN KEY (`order_id`) REFERENCES `order_details` (`id`),
  CONSTRAINT `FK_items_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
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
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `provider` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `id` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` int NOT NULL,
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

-- Dump completed on 2023-05-19 18:53:09
