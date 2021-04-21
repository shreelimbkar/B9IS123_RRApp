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
-- Table structure for table `bnb_booking`
--

DROP TABLE IF EXISTS `bnb_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bnb_booking` (
  `bnb_booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `bnb_resource_id` int(11) NOT NULL,
  `bnb_book_user_id` int(11) NOT NULL,
  `number_of_adult` varchar(45) DEFAULT NULL,
  `number_of_child` varchar(45) DEFAULT NULL,
  `number_of_beds` varchar(45) DEFAULT NULL,
  `special_requirement` varchar(45) DEFAULT NULL,
  `is_status` varchar(45) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`bnb_booking_id`),
  KEY `bnb_book_user_id_idx` (`bnb_book_user_id`),
  KEY `bnb_resource_id` (`bnb_resource_id`),
  CONSTRAINT `bnb_book_user_id` FOREIGN KEY (`bnb_book_user_id`) REFERENCES `user_table` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bnb_resource_id` FOREIGN KEY (`bnb_resource_id`) REFERENCES `bnb_master` (`bnb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bnb_booking`
--

LOCK TABLES `bnb_booking` WRITE;
/*!40000 ALTER TABLE `bnb_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `bnb_booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-19 21:52:47
