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
-- Table structure for table `resource_master`
--

DROP TABLE IF EXISTS `resource_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_master` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_category` varchar(45) NOT NULL,
  `resource_name` varchar(45) NOT NULL,
  `resource_city_code` varchar(45) NOT NULL,
  `resource_address` varchar(100) NOT NULL,
  `resource_details` json NOT NULL,
  `resource_price` int(11) NOT NULL,
  `resource_review` varchar(200) DEFAULT NULL,
  `resource_images` varchar(1000) DEFAULT NULL,
  `resource_is_active` enum('T','F') NOT NULL DEFAULT 'T',
  `modified_date` date NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `resource_city_code_idx` (`resource_city_code`),
  CONSTRAINT `resource_city_code` FOREIGN KEY (`resource_city_code`) REFERENCES `city` (`city_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_master`
--

LOCK TABLES `resource_master` WRITE;
/*!40000 ALTER TABLE `resource_master` DISABLE KEYS */;
INSERT INTO `resource_master` VALUES (1,'Hotel','Hyatt Centric','c-001','Dean Street The Liberties, Dublin D08 W3X7 Ireland','{\"roomFeatures\": {\"air\": \"Airconditioning\", \"desk\": \"Desk\", \"sofa\": \"Sofabed\", \"coffee\": \"Coffee/teamaker\", \"curtains\": \"Blackoutcurtains\", \"roomService\": \"Roomservice\", \"housekeeping\": \"Housekeeping\"}, \"propertyAmenities\": {\"bar\": \"Bar/lounge\", \"gym\": \"FitnessCentrewithGym/WorkoutRoom\", \"wifi\": \"Free High Speed Internet (WiFi)\", \"walking\": \"Walkingtours\", \"Breakfast\": \"Breakfastavailable\", \"nonSmoking\": \"Non-smokinghotel\", \"restaurant\": \"Restaurant\", \"entertainment\": \"Eveningentertainment\", \"privateParking\": \"Paid private parking on-site\"}}',109,NULL,NULL,'T','2021-04-19','2021-04-19'),(2,'Hotel','The Alex Hotel','c-001','41-47 Fenian Street, Dublin D02 H678 Ireland','{\"roomFeatures\": {\"air\": \"Airconditioning\", \"desk\": \"Desk\", \"sofa\": \"Sofabed\", \"coffee\": \"Coffee/teamaker\", \"curtains\": \"Blackoutcurtains\", \"roomService\": \"Roomservice\", \"housekeeping\": \"Housekeeping\"}, \"propertyAmenities\": {\"bar\": \"Bar/lounge\", \"gym\": \"FitnessCentrewithGym/WorkoutRoom\", \"wifi\": \"Free High Speed Internet (WiFi)\", \"walking\": \"Walkingtours\", \"Breakfast\": \"Breakfastavailable\", \"nonSmoking\": \"Non-smokinghotel\", \"restaurant\": \"Restaurant\", \"entertainment\": \"Eveningentertainment\", \"privateParking\": \"Paid private parking on-site\"}}',185,NULL,NULL,'T','2021-04-19','2021-04-19'),(3,'Restaurant','Glovers Alley','c-001','128 Stephen’s Green Fitzwilliam Hotel, Dublin 2 Ireland','{\"Meals\": {\"lunch\": \"Lunch\", \"dinner\": \"Dinner\"}, \"Cuisines\": {\"irish\": \"Irish\", \"European\": \"European\"}, \"Features\": {\"card\": \"Accepts Credit Cards\", \"wifi\": \"Free Wifi\", \"alcohol\": \"Serves Alcohol\", \"seating\": \"Seating\", \"giftCards\": \"Gift Cards Available\", \"reservations\": \"Reservations\", \"tableService\": \"Table Service\"}, \"specialDiets\": {\"vegan\": \"Vegan\", \"gluten\": \"Gluten Free Options\", \"vegetarian\": \"Vegetarian Friendly\"}}',200,NULL,NULL,'T','2021-04-19','2021-04-19');
/*!40000 ALTER TABLE `resource_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-19 21:52:50
