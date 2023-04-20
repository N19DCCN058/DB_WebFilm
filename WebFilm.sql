-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: web_phim
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `account_name` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`account_name`),
  UNIQUE KEY `client_id_UNIQUE` (`user_id`),
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_id_accounts` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('Hieu','$2a$10$K495bQlsNljT8tAGwkRV5urUZspZTd3xSNSGN8rSZmpE4RqO6Tmzq',8,3),('Hieu123','$2a$10$f/aTk5RIH2GlFY5nzbknYeZgL1PDdygpCcOe3kEWNuLpFGbi8yGVW',5,3),('Hieu2','$2a$10$WdszReY6R6Oy.iZYVx3qhuBxYx3yJGzWEXUtqbwdsFYqXeiEi9buS',10,3),('Hieusdsd123','$2a$10$WdszReY6R6Oy.iZYVx3qhuBxYx3yJGzWEXUtqbwdsFYqXeiEi9buS',7,3),('nguyenvana','12345678',1,1),('Tesst2','$2a$10$SMqyDM/qf9//EUZ//AtPyeEwrcMQ6hgGtxQFQTUQddmKDsdsZRxXi',3,3);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `actor_id` int NOT NULL AUTO_INCREMENT,
  `actor_name` varchar(45) NOT NULL,
  PRIMARY KEY (`actor_id`),
  UNIQUE KEY `actor_name_UNIQUE` (`actor_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Action');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `film_id` int NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `comment_level` int NOT NULL,
  `comment_content` varchar(200) NOT NULL,
  `comment_date` datetime NOT NULL,
  PRIMARY KEY (`film_id`,`account_name`,`comment_level`),
  KEY `fk_comments_film_id_idx` (`film_id`),
  KEY `fk_comments_account_name_idx` (`account_name`),
  CONSTRAINT `fk_comments_account_name` FOREIGN KEY (`account_name`) REFERENCES `accounts` (`account_name`) ON UPDATE CASCADE,
  CONSTRAINT `fk_comments_film_id` FOREIGN KEY (`film_id`) REFERENCES `films` (`film_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_chk_1` CHECK (((`comment_level` >= 1) and (`comment_level` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Hieu2',1,'hay','2023-04-20 15:07:02');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directors` (
  `director_id` int NOT NULL AUTO_INCREMENT,
  `director_name` varchar(45) NOT NULL,
  PRIMARY KEY (`director_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (1,'Brian De Palma');
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_details`
--

DROP TABLE IF EXISTS `discount_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_details` (
  `discount_id` int NOT NULL,
  `film_package_id` int NOT NULL,
  PRIMARY KEY (`discount_id`,`film_package_id`),
  KEY `film_package_id_idx` (`film_package_id`),
  KEY `discount_details_film_package_id_idx` (`film_package_id`),
  CONSTRAINT `discount_details_film_package_id` FOREIGN KEY (`film_package_id`) REFERENCES `film_packages` (`film_package_id`) ON UPDATE CASCADE,
  CONSTRAINT `discount_id` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_details`
--

LOCK TABLES `discount_details` WRITE;
/*!40000 ALTER TABLE `discount_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `discount_id` int NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `discount_rate` float NOT NULL,
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,'2023-02-02','2023-02-12',0.1),(2,'2023-04-15','2023-04-25',0.15);
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episodes`
--

DROP TABLE IF EXISTS `episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episodes` (
  `episode_id` int NOT NULL AUTO_INCREMENT,
  `episode_path` varchar(200) NOT NULL,
  `numerical_order` int NOT NULL,
  `film_id` int NOT NULL,
  PRIMARY KEY (`episode_id`),
  KEY `fk_episodes_film_id_idx` (`film_id`),
  CONSTRAINT `fk_episodes_film_id` FOREIGN KEY (`film_id`) REFERENCES `films` (`film_id`) ON UPDATE CASCADE,
  CONSTRAINT `episodes_chk_1` CHECK ((`numerical_order` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episodes`
--

LOCK TABLES `episodes` WRITE;
/*!40000 ALTER TABLE `episodes` DISABLE KEYS */;
INSERT INTO `episodes` VALUES (1,'abc',1,1);
/*!40000 ALTER TABLE `episodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluations`
--

DROP TABLE IF EXISTS `evaluations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluations` (
  `film_id` int NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `star_number` int NOT NULL,
  `comment` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`film_id`,`account_name`),
  KEY `FK_evaluations_filmid_idx` (`film_id`),
  KEY `FK_evaluations_account_name_idx` (`account_name`),
  CONSTRAINT `FK_evaluations_account_name` FOREIGN KEY (`account_name`) REFERENCES `accounts` (`account_name`) ON UPDATE CASCADE,
  CONSTRAINT `FK_evaluations_film_id` FOREIGN KEY (`film_id`) REFERENCES `films` (`film_id`) ON UPDATE CASCADE,
  CONSTRAINT `evaluations_chk_1` CHECK (((`star_number` >= 1) and (`star_number` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluations`
--

LOCK TABLES `evaluations` WRITE;
/*!40000 ALTER TABLE `evaluations` DISABLE KEYS */;
INSERT INTO `evaluations` VALUES (1,'Hieu2',1,'khong hay');
/*!40000 ALTER TABLE `evaluations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_packages`
--

DROP TABLE IF EXISTS `film_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_packages` (
  `film_package_id` int NOT NULL AUTO_INCREMENT,
  `used_time` int NOT NULL,
  `applicable_date` date NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`film_package_id`),
  CONSTRAINT `film_packages_chk_price` CHECK ((`price` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_packages`
--

LOCK TABLES `film_packages` WRITE;
/*!40000 ALTER TABLE `film_packages` DISABLE KEYS */;
INSERT INTO `film_packages` VALUES (1,1,'2023-05-22',1000),(2,3,'2023-05-22',1800),(3,6,'2023-05-22',2500),(4,1,'2023-01-01',900),(5,3,'2023-01-01',1700),(6,6,'2023-01-01',2400),(7,1,'2022-01-01',800),(8,3,'2022-01-01',1600),(9,6,'2022-01-01',2300);
/*!40000 ALTER TABLE `film_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_producers`
--

DROP TABLE IF EXISTS `film_producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_producers` (
  `film_producer_id` int NOT NULL AUTO_INCREMENT,
  `film_producer_name` varchar(80) NOT NULL,
  PRIMARY KEY (`film_producer_id`),
  UNIQUE KEY `film_producer_name_UNIQUE` (`film_producer_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_producers`
--

LOCK TABLES `film_producers` WRITE;
/*!40000 ALTER TABLE `film_producers` DISABLE KEYS */;
INSERT INTO `film_producers` VALUES (1,'Tom Cruise');
/*!40000 ALTER TABLE `film_producers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `film_id` int NOT NULL AUTO_INCREMENT,
  `film_name` varchar(80) NOT NULL,
  `film_poster_path` varchar(150) NOT NULL,
  `trailer_path` varchar(150) NOT NULL,
  `film_description` varchar(200) NOT NULL,
  `film_duration` int NOT NULL,
  `release_time` date NOT NULL,
  `odd_film` tinyint NOT NULL,
  `film_producer_id` int NOT NULL,
  `nation_id` int NOT NULL,
  `director_id` int NOT NULL,
  `average_rating` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`film_id`),
  UNIQUE KEY `film_name_UNIQUE` (`film_name`),
  KEY `film_producer_id_idx` (`film_producer_id`),
  KEY `nation_id_idx` (`nation_id`),
  KEY `director_id_idx` (`director_id`),
  CONSTRAINT `director_id` FOREIGN KEY (`director_id`) REFERENCES `directors` (`director_id`) ON UPDATE CASCADE,
  CONSTRAINT `film_producer_id` FOREIGN KEY (`film_producer_id`) REFERENCES `film_producers` (`film_producer_id`) ON UPDATE CASCADE,
  CONSTRAINT `nation_id` FOREIGN KEY (`nation_id`) REFERENCES `nations` (`nation_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'a','abc','abc','abc',120,'1996-03-03',1,1,1,1,0);
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films_actors`
--

DROP TABLE IF EXISTS `films_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_actors` (
  `film_id` int NOT NULL,
  `actor_id` int NOT NULL,
  PRIMARY KEY (`film_id`,`actor_id`),
  KEY `actor_id_idx` (`actor_id`),
  CONSTRAINT `actor_id` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`) ON UPDATE CASCADE,
  CONSTRAINT `movie_id` FOREIGN KEY (`film_id`) REFERENCES `films` (`film_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_actors`
--

LOCK TABLES `films_actors` WRITE;
/*!40000 ALTER TABLE `films_actors` DISABLE KEYS */;
/*!40000 ALTER TABLE `films_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films_categories`
--

DROP TABLE IF EXISTS `films_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_categories` (
  `film_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`film_id`,`category_id`),
  KEY `category_id_idx` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON UPDATE CASCADE,
  CONSTRAINT `film_id` FOREIGN KEY (`film_id`) REFERENCES `films` (`film_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_categories`
--

LOCK TABLES `films_categories` WRITE;
/*!40000 ALTER TABLE `films_categories` DISABLE KEYS */;
INSERT INTO `films_categories` VALUES (1,1);
/*!40000 ALTER TABLE `films_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nations`
--

DROP TABLE IF EXISTS `nations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nations` (
  `nation_id` int NOT NULL AUTO_INCREMENT,
  `nation_name` varchar(60) NOT NULL,
  PRIMARY KEY (`nation_id`),
  UNIQUE KEY `nation_name_UNIQUE` (`nation_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nations`
--

LOCK TABLES `nations` WRITE;
/*!40000 ALTER TABLE `nations` DISABLE KEYS */;
INSERT INTO `nations` VALUES (1,'America');
/*!40000 ALTER TABLE `nations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchased_film_packages`
--

DROP TABLE IF EXISTS `purchased_film_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchased_film_packages` (
  `account_name` varchar(50) NOT NULL,
  `film_package_id` int NOT NULL,
  `purchase_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  PRIMARY KEY (`account_name`,`film_package_id`),
  KEY `film_package_id_idx` (`film_package_id`),
  CONSTRAINT `account_name_film_packages_of_clients` FOREIGN KEY (`account_name`) REFERENCES `accounts` (`account_name`) ON UPDATE CASCADE,
  CONSTRAINT `film_package_id` FOREIGN KEY (`film_package_id`) REFERENCES `film_packages` (`film_package_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchased_film_packages`
--

LOCK TABLES `purchased_film_packages` WRITE;
/*!40000 ALTER TABLE `purchased_film_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchased_film_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name_UNIQUE` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'ROLE_ADMIN'),(3,'ROLE_CLIENT'),(1,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(500) NOT NULL,
  `revoked` tinyint DEFAULT NULL,
  `expired` tinyint DEFAULT NULL,
  `account_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_name_tokens_idx` (`account_name`),
  CONSTRAINT `account_name_tokens` FOREIGN KEY (`account_name`) REFERENCES `accounts` (`account_name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJUZXNzdDIiLCJpYXQiOjE2ODEzMTU1NjYsImV4cCI6MTY4MTkyMDM2Nn0.zBKQED5QusuwiGTq23XtHFy2LXC2ybOsoEz1kHMNSJP66q3UuweLt8tl15jZPQYm1RX0MPF4lZMC03hF62wMxQ',0,0,'Tesst2'),(2,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1IiwiaWF0IjoxNjgxNDU3NDA4LCJleHAiOjE2ODIwNjIyMDh9.xSSiFaTE9SmdBvQ1FlOkw9xpNFsVznOMHcPEWQn48Hd_EWHoufYLcfE9NNFJixQvWG2UI6dRX3jGZOitPmaXeA',1,1,'Hieu'),(3,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1IiwiaWF0IjoxNjgxNDU3NDk4LCJleHAiOjE2ODIwNjIyOTh9.Fi2EBQfHkg99EWM4798iUDLlGatbPlDFN6IwTpDpcGU_G-DalQ0pwnByPUpoZnJXSHEP4nR5xcwstbmoQjD-hA',1,1,'Hieu'),(4,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1c2RzZDEyMyIsImlhdCI6MTY4MTY1NDg1NSwiZXhwIjoxNjgyMjU5NjU1fQ.qUwdPfpMxp6VLOhA4ymIFUuwla3gXVmlIyVPRk7Fqt0yQZmmBQhDWG9lkzWCDe5XALqTKkDwY1wwF9IH0GXihA',0,0,'Hieusdsd123'),(5,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1IiwiaWF0IjoxNjgxOTA4ODg5LCJleHAiOjE2ODI1MTM2ODl9.LOP0aX9vaeEpN81w-1Ot76aiH01NFxIvaJkSbfvXIbbWKFfbP7agBGF87W5I9HlUJq5VasB0HzCw921UoZhrKw',1,1,'Hieu'),(6,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1IiwiaWF0IjoxNjgxOTA4OTE1LCJleHAiOjE2ODI1MTM3MTV9.5t5gcKzmpl4Gto3CTA0YNRMiPdXhtUmuWZZtEEl_u92sOh9ukvKsp12b8P-CuC1eA9YEFIrMzWwnI43X08gwbg',0,0,'Hieu'),(7,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTkwODk3MCwiZXhwIjoxNjgyNTEzNzcwfQ.Dy1pRQKpzS_9eYEhTEcPns55kh7d9tc1lCbDhenrBItEkS3YxsaXCZreZMhDj6STN0n5GtutIniKNRJW0HflJA',1,1,'Hieu2'),(8,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTkwODk3MiwiZXhwIjoxNjgyNTEzNzcyfQ.x0y-HETF-fiWp5Zq8A_CqfcrCV8iLHscU_42yzjxXz-jMBtcgpYeY_Q1rk6WmjkGdgA2C2Nrz5JH6si22ppMqA',1,1,'Hieu2'),(9,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTkwOTEzMywiZXhwIjoxNjgyNTEzOTMzfQ.f71viADk0x7wFJ806pkUGX9tNqS2MtxguiuhZtmUSX7OPnM8FjYFH6WmFwPTeBiSlvZuYwjz3makxsjfrgAFUw',1,1,'Hieu2'),(10,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTkwOTIyMiwiZXhwIjoxNjgyNTE0MDIyfQ.j-uMK-mRAfovz-KKfqr487MXrDnkA6bIGI4eUKjjdCh9F0kLXtu4cpx-6_5iQ_y7cfGmmmGqkZCcuYtMLNouwQ',1,1,'Hieu2'),(11,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTkwOTMxNSwiZXhwIjoxNjgyNTE0MTE1fQ.0Bm_wy5ZGs0TbQg1conjea0zr3ADlMlSX5ZMqGr3Pr2pEfpiljvGj0uK-6cGMo3G6k_jQL6DsMIjGTR-NGOrAg',1,1,'Hieu2'),(12,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTkwOTQ1MSwiZXhwIjoxNjgyNTE0MjUxfQ.LLbGvGPhqWcGDt-PwyYtas3s3VTdgjkQbxJKVgyKEcFGjFJoWldDQMWy3UrPrg2niY2I8p5eX4CeubgMG4CSXg',1,1,'Hieu2'),(13,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTkwOTUzMiwiZXhwIjoxNjgyNTE0MzMyfQ.zzuFaws0YXZ0b1UosGK-ImQvh26ZZXn89Rvg3hu2JAJ_PTWOlQFeGDKbsqg5gYl9zrhuvfwXdUFmhZvARbuOwg',1,1,'Hieu2'),(14,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTkwOTY1OSwiZXhwIjoxNjgyNTE0NDU5fQ.FwpY1FILaAZaZWVZ58V0H7GpTV6URw7zfz_gKh6l_MjI3oK-0yiPidn1klmpcYy81LEVJHVzO8GlDG5DpylXzA',1,1,'Hieu2'),(15,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTkxMDE0NywiZXhwIjoxNjgyNTE0OTQ3fQ.jyPEgxL2uK525CxGNSsYX2rytkHzm1OGRhg_5mgjJ7tdRksVnXZtry9LuW5PhjDdS20KIczElNgyUU9j3OTrtQ',1,1,'Hieu2'),(16,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTkxMDUxMSwiZXhwIjoxNjgyNTE1MzExfQ.N0hQPlE9qxtpZ4aTrq63E_ppmnkySHig0FRsAZyp5ehzqJajCgNN6WQvrnnDVdVqUj1EEukCrlTy3lF03YoarA',1,1,'Hieu2'),(17,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTkxMDU3NCwiZXhwIjoxNjgyNTE1Mzc0fQ.TooNZMdOwXGZ1UhCqOSdWmgLxYXouvw4QDGrfs3tpfdG7pUEjrYQXNXDnO2PtiOp965A07EuFvT6oyn_PQ-3Nw',1,1,'Hieu2'),(18,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTkxMDY0MiwiZXhwIjoxNjgyNTE1NDQyfQ.VoU4kpvegfwn4Q9NHS_ISGGM-L8BVckGjGMfEfv1joo5F5WCagcoo56b1pR-2vcL0p9-MvFsaPFJ9aNtrxIEEQ',1,1,'Hieu2'),(19,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTkxNzA2OCwiZXhwIjoxNjgyNTIxODY4fQ.OGLcJ1eci9oLbRjXThm2tmz_BGynXrtGq9RGwKn0HSlnojXMGD3wYOaBnpswd3NAdf1VMjnYRg4GpsoH6ZhMkQ',1,1,'Hieu2'),(20,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTkxODk0MCwiZXhwIjoxNjgyNTIzNzQwfQ.ENKVLHDo_FGox3Qa7pIdWzRZmM7ArCxPX09Mv1uuCYf6Q17BeBoZSiQAk1o42MzBF0ftdpvlCuRdpuqV-z9JEQ',1,1,'Hieu2'),(21,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTkyNTIxNSwiZXhwIjoxNjgyNTMwMDE1fQ.TOUldU3YthZEnv5B7OE67STGZPzu0fvvRjo9uRIyPYpWv8rXcib-dopVlgTzO2DZCjj2vWXqM_Yqi6jlfsJ7Sg',1,1,'Hieu2'),(22,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTk3MjM2NiwiZXhwIjoxNjgyNTc3MTY2fQ.v9fGIikUK_-Kd8RlhArackhezbe6f0zg_PyMNSCw975t_1MQ7ve1_hXIVZH05Y1cf9fyvp5r4LL4AlX3MqAGYg',1,1,'Hieu2'),(23,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1MiIsImlhdCI6MTY4MTk3Mjk1MywiZXhwIjoxNjgyNTc3NzUzfQ.RavJyBzrg7BvB_s1-wIsf7GqeTQG6NDDevN_8gA5EHJZMLCjeGqNKyNIihTXek38rQbmQk7k8SgWo-0Yjyu0Sw',0,0,'Hieu2');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `birthdate` date NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `phone_UNIQUE` (`phone_number`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nguyen Van A','0969665842','Anguyenvan@gmail.com',0,'2001-01-01'),(2,'Tesst2','1232s23323','hieungu2ysen3',0,'2001-05-16'),(3,'Tesst2','ssssss','ssss',0,'2001-05-16'),(4,'Hieu','sssssss','sssas',0,'2001-05-16'),(5,'Hieu123','asdsdsadsadasd','adsdd',0,'2001-05-16'),(7,'Hieusdsd123','asdsdsasdsddsadasd','adssdsddd',0,'2001-05-16'),(8,'Hieu','sssss23ssss','ssssa2ass',0,'2001-05-16'),(10,'Hieu2','1sd2222','1as22d',1,'2001-01-01');
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

-- Dump completed on 2023-04-20 15:16:01
