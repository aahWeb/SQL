-- MySQL dump 10.13  Distrib 8.0.33, for macos12.6 (x86_64)
--
-- Host: localhost    Database: db_aviation
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `comp` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('published','unpublished','draft') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `num_street` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`comp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES ('AUS','sydney','Australie','AUSTRA Air','draft',19),('CHI','chi','Chine','CHINA Air','draft',NULL),('FRE1','beaubourg','France','Air France','draft',17),('FRE2','paris','France','Air Electric','draft',22),('SIN','pasir','Singapour','SIN A','draft',15);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_pilots`
--

DROP TABLE IF EXISTS `new_pilots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_pilots` (
  `certificate` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`certificate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_pilots`
--

LOCK TABLES `new_pilots` WRITE;
/*!40000 ALTER TABLE `new_pilots` DISABLE KEYS */;
INSERT INTO `new_pilots` VALUES ('ct-1','Alan'),('ct-10','Tom'),('ct-100','Yi'),('ct-11','Sophie'),('ct-12','Albert'),('ct-16','Yan'),('ct-56','Benoit'),('ct-6','John'),('ct-7','Pierre');
/*!40000 ALTER TABLE `new_pilots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilots`
--

DROP TABLE IF EXISTS `pilots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilots` (
  `certificate` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_flying` decimal(7,1) DEFAULT NULL,
  `company` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_day` datetime DEFAULT NULL,
  `next_flight` datetime DEFAULT NULL,
  `num_jobs` smallint unsigned DEFAULT '0',
  PRIMARY KEY (`certificate`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_pilots_company` (`company`),
  CONSTRAINT `fk_pilots_company` FOREIGN KEY (`company`) REFERENCES `companies` (`comp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilots`
--

LOCK TABLES `pilots` WRITE;
/*!40000 ALTER TABLE `pilots` DISABLE KEYS */;
INSERT INTO `pilots` VALUES ('ct-1',90.0,'AUS','Alan',NULL,NULL,0),('ct-10',90.0,'FRE1','Tom',NULL,NULL,0),('ct-100',200.0,'SIN','Yi','1978-02-04 00:00:00','2020-12-04 09:50:52',10),('ct-11',200.0,'AUS','Sophie','1978-10-17 00:00:00','2020-06-11 12:00:52',50),('ct-12',190.0,'AUS','Albert','1990-04-04 00:00:00','2020-05-08 12:50:52',10),('ct-16',190.0,'SIN','Yan','1998-01-04 00:00:00','2020-05-08 12:50:52',30),('ct-56',300.0,'AUS','Benoit','2000-01-04 00:00:00','2020-02-04 12:50:52',7),('ct-6',20.0,'FRE1','John','2000-01-04 00:00:00','2020-12-04 12:50:52',13),('ct-7',80.0,'CHI','Pierre','1977-01-04 00:00:00','2020-05-04 12:50:52',8);
/*!40000 ALTER TABLE `pilots` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-16 11:46:46
