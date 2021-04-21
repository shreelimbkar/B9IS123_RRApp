-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: rating_db
-- ------------------------------------------------------
-- Server version	5.7.33-log

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
-- Table structure for table `bar_booking`
--

DROP TABLE IF EXISTS `bar_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bar_booking` (
  `bar_bookings_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_date` date NOT NULL,
  `to-date` date NOT NULL,
  `bar_book_user_id` int(11) NOT NULL,
  `bar_resource_id` int(11) NOT NULL,
  `number_of_adult` varchar(45) NOT NULL,
  `number_of_child` varchar(45) NOT NULL,
  `number_of_rooms` varchar(45) NOT NULL,
  `special_requirement` varchar(100) NOT NULL,
  `is_status` enum('T','F') NOT NULL DEFAULT 'T',
  `modified_date` date NOT NULL,
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`bar_bookings_id`),
  KEY `bar_book_user_id_idx` (`bar_book_user_id`),
  KEY `bar_resource_id` (`bar_resource_id`),
  CONSTRAINT `bar_book_user_id` FOREIGN KEY (`bar_book_user_id`) REFERENCES `user_table` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bar_resource_id` FOREIGN KEY (`bar_resource_id`) REFERENCES `resource_master` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bar_booking`
--

LOCK TABLES `bar_booking` WRITE;
/*!40000 ALTER TABLE `bar_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `bar_booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-21 10:22:08
