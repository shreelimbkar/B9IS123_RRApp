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
-- Table structure for table `user_bnb_review`
--

DROP TABLE IF EXISTS `user_bnb_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_bnb_review` (
  `user_bnb_review_id` int(11) NOT NULL AUTO_INCREMENT,
  `repor_flag_count` varchar(45) NOT NULL DEFAULT '0',
  `is_active` enum('T','F') NOT NULL DEFAULT 'T',
  `review_bnb_user_id` int(11) NOT NULL,
  `bnb_master_id` int(11) NOT NULL,
  `like_count` varchar(45) NOT NULL DEFAULT '0',
  `modified_date` date NOT NULL,
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`user_bnb_review_id`),
  KEY `user_review_user_id_idx` (`review_bnb_user_id`),
  KEY `bnb_master_id` (`bnb_master_id`),
  CONSTRAINT `bnb_master_id` FOREIGN KEY (`bnb_master_id`) REFERENCES `bnb_master` (`bnb_id`),
  CONSTRAINT `review_bnb_user_id` FOREIGN KEY (`review_bnb_user_id`) REFERENCES `user_table` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_bnb_review`
--

LOCK TABLES `user_bnb_review` WRITE;
/*!40000 ALTER TABLE `user_bnb_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_bnb_review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-19 21:52:49
