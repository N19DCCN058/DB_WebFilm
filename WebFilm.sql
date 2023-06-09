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
  `is_enabled` tinyint NOT NULL DEFAULT '0',
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
INSERT INTO `accounts` VALUES ('Hieu','$2a$10$WdszReY6R6Oy.iZYVx3qhuBxYx3yJGzWEXUtqbwdsFYqXeiEi9buS',10,2,1),('HieuNguyen','$2a$10$WdszReY6R6Oy.iZYVx3qhuBxYx3yJGzWEXUtqbwdsFYqXeiEi9buS',16,3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Action'),(2,'Bction'),(3,'Cction');
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
INSERT INTO `comments` VALUES (1,'Hieu',1,'hay','2023-04-25 21:41:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episodes`
--

LOCK TABLES `episodes` WRITE;
/*!40000 ALTER TABLE `episodes` DISABLE KEYS */;
INSERT INTO `episodes` VALUES (1,'http://localhost:8081/movies/content/7079a322-3fed-46bb-a072-e6c37c3e6b08.mp4',1,1),(2,'http://localhost:8081/movies/content/916d285c-7771-4617-9076-00d7547a9007.mp4',2,1);
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
INSERT INTO `evaluations` VALUES (1,'Hieu',1,'khong hay');
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
  `film_description` varchar(2000) NOT NULL,
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
INSERT INTO `films` VALUES (1,'a','http://localhost:8081/movies/75228b6e-a21a-4932-9613-d639a3eb4152.png','http://localhost:8081/movies/205ff62c-ee03-4db7-bbaa-3dbad894a523.mp4','abc',120,'1996-03-03',1,1,1,1,0);
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
INSERT INTO `films_categories` VALUES (1,1),(1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(3,'ROLE_CLIENT'),(2,'ROLE_USER');
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (26,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1IiwiaWF0IjoxNjgyMDkyNTk2LCJleHAiOjE2ODI2OTczOTZ9.X9UPZpUt8GAvsPUir6KeLkhUowMnc90738JFg-5Wbi3uCXy--3c19W6bI1OGMilMzSgrzR6Q1m7igepwAtAcBQ',1,1,'Hieu'),(27,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1IiwiaWF0IjoxNjgyMDkzMzY4LCJleHAiOjE2ODI2OTgxNjh9.uJRVBLNqRTfs5EWoSvCg-_AMkYZRACdNCVR23ExI-gFMj80f5nxqUODs8UoiXXfAVglwsQN9WkGYKYDWXW8Vyg',1,1,'Hieu'),(28,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1IiwiaWF0IjoxNjgyNDAwODA4LCJleHAiOjE2ODMwMDU2MDh9.5qRvT6QrETQCYusEJuxjIvfKqUONFfboq9aDYAljn9EB7tCMJ6u5LhP-5u54n-QK_tXuV1sq5eAdit9nmUKvCQ',1,1,'Hieu'),(29,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1IiwiaWF0IjoxNjgyNDI3OTcwLCJleHAiOjE2ODMwMzI3NzB9.hZhZJivtn6tdlGScMKmhAFoVUUm1qKryI0nwPtx67LofLhn9w0I5rYqytL4ZHitQ93DzSvslhKk8tQ5lDJXD-w',1,1,'Hieu'),(30,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1IiwiaWF0IjoxNjgyNDI4MDA1LCJleHAiOjE2ODMwMzI4MDV9.mN03tr-wnG46dsnx_VhcS_0W5Qw_NtIICFzIMpu27ylDZwY6L6MOIIubAQsM4ayaD2GF6q7HYHCp0u4XkV7H4w',1,1,'Hieu'),(31,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1IiwiaWF0IjoxNjgyNDI4MTExLCJleHAiOjE2ODMwMzI5MTF9.lQ15aeZMr-wFxmejKWGTWMbZC8DUiGkHWtnkB2T8Siv8-oSoYghvi241JPB807OFY3YXdGLxF4GLVEwA11q24g',1,1,'Hieu'),(32,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1IiwiaWF0IjoxNjgyNDI4NTIxLCJleHAiOjE2ODMwMzMzMjF9.oi6zS1IkxX5lWaODrLL4GKCj1sKwhOVDxh_71xa4ltYF8b3YR6TQSwYkp3tgqhihsn5z1POkMpCryj2ROBNESA',1,1,'Hieu'),(33,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1IiwiaWF0IjoxNjgyNDMzNDgzLCJleHAiOjE2ODMwMzgyODN9.qgXyEvUfDMMdecpJBDouB9je-_8BG97DcETBvcmr-ULaF3njFi_pjYRKm20AdnnKp8Sj05CrQE6_6n8Bu8TBjg',1,1,'Hieu'),(34,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1IiwiaWF0IjoxNjgyNDMzNTM3LCJleHAiOjE2ODMwMzgzMzd9.IyIVk1eDuNem8Fy510JxKI_l2yHQd3kAQOBLchMz12ByCDcvmpIfsCKzATRnArcOMMfuBVIJigTVIVuEjWOUhA',1,1,'Hieu'),(40,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1Tmd1eWVuIiwiaWF0IjoxNjgyNDg0MDYyLCJleHAiOjE2ODI1NzA0NjJ9.bAOPw-0VSvcaUUUtBwbLpjU6cGoHwlTZhAa9DZ846J7ZfUtv4d_-nvuF1xJ4DIdXkgrWNgpLvBPDbn3S6-TfsA',1,1,'HieuNguyen'),(41,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1Tmd1eWVuIiwiaWF0IjoxNjgyNDg0ODMxLCJleHAiOjE2ODMwODk2MzF9.1K4Z-Ij7DSSAW8EYQiCsix-Gb9oblaCsnEpH7f-T34YZ9dvJmuIf0UhKYpPQvpH8bSLy-74QJp9t9REWZ2ujOQ',1,1,'HieuNguyen'),(42,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1Tmd1eWVuIiwiaWF0IjoxNjgyNDg1Mzk1LCJleHAiOjE2ODMwOTAxOTV9.hXATe22pILOP8HEgvB_s8RpvSevEr6wvM8G-96h2S2jCHVLH4WoVSRHIYN-1UIGl7Aenejorcw6t1i7yY2znBw',1,1,'HieuNguyen'),(43,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1IiwiaWF0IjoxNjgyNDg1ODM3LCJleHAiOjE2ODMwOTA2Mzd9.IkQH7SJLGtr9g1iNdEGnYkclEf3dlharXYHHh6NyvyE15UjF0NxWfq2MgjQmtY7Knk10ZU0GPFUb8dfdWC8lSQ',1,1,'Hieu'),(44,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1IiwiaWF0IjoxNjgyNDg1ODQ0LCJleHAiOjE2ODMwOTA2NDR9.WMvMVxGeo1-FrQnq9H4KvT1HbSolx7SsKRqJ_FSUR6NRAO5zAmypWhXir7ow3DcxjI97olXb68dfDQCGPAS3cA',0,0,'Hieu'),(45,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1Tmd1eWVuIiwiaWF0IjoxNjgyNDg3MTMxLCJleHAiOjE2ODMwOTE5MzF9.MVSXq1SD-w9av4qjaTJtmdJZsnQ7SzEUvGrMC5ouF2voBu9zzNY1nxetpWUT7cpYVd0ruBnZ18JB00WRLMOQsQ',1,1,'HieuNguyen'),(46,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1Tmd1eWVuIiwiaWF0IjoxNjgyNDg3NTY4LCJleHAiOjE2ODMwOTIzNjh9.nPZRgeuGrf35enbBYr5Yn_YsVqiGBDkMCKmuC3AvJ2JZe9OLZFxkTbnbx91fG4wIE-1cT7csDBZocyAHj1cxRg',1,1,'HieuNguyen'),(47,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1Tmd1eWVuIiwiaWF0IjoxNjgyNDkxNjk3LCJleHAiOjE2ODI1NzgwOTd9.Xzjc_i3hezT15agudw9GTEjgQMD3JC8yc2oGzUhqB2njglFtB7nJwYXkqfXvGAcKKVR1d_RD3TJdXbbQ4oLsCw',1,1,'HieuNguyen'),(48,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1Tmd1eWVuIiwiaWF0IjoxNjgyNDkxNzg3LCJleHAiOjE2ODMwOTY1ODd9.-ywSrm6Bq9aV6HI-qu4j0vJsx3QHJQtehtDyo6tqPfxDjP_fFG4d6h13kjI_c9EDEYew987bJgBKWTeCNZoiFg',1,1,'HieuNguyen'),(49,'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJIaWV1Tmd1eWVuIiwiaWF0IjoxNjgyNDkxODI4LCJleHAiOjE2ODMwOTY2Mjh9.6ijtPj2i1IEyfqGSJ2ycrcIkIE3yZY-XKiT0VMhYdgTafuPG025ua4bWmxpM-vHwgUpAyH1EKV-D6DiJQKK1Tw',0,0,'HieuNguyen');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nguyen Van A','0969665842','Anguyenvan@gmail.com',0,'2001-01-01'),(2,'Tesst2','1232s23323','hieungu2ysen3',0,'2001-05-16'),(3,'Tesst2','ssssss','ssss',0,'2001-05-16'),(4,'Hieu','sssssss','sssas',0,'2001-05-16'),(5,'Hieu123','asdsdsadsadasd','adsdd',0,'2001-05-16'),(7,'Hieusdsd123','asdsdsasdsddsadasd','adssdsddd',0,'2001-05-16'),(8,'Hieu','sssss23ssss','ssssa2ass',0,'2001-05-16'),(10,'Hieu','1sd2222','asd',0,'2001-01-01'),(16,'HieuNguyen','12312344444','hieuhdhk@gmail.com',0,'2001-05-16');
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

-- Dump completed on 2023-04-26 14:01:55
