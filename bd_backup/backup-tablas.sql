-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: tablas
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `cuidadores`
--

DROP TABLE IF EXISTS `cuidadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuidadores` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Telefono` varchar(12) NOT NULL,
  `ID_GUARDERIA` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_GUARDERIA` (`ID_GUARDERIA`),
  CONSTRAINT `cuidadores_ibfk_1` FOREIGN KEY (`ID_GUARDERIA`) REFERENCES `guarderias` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuidadores`
--

LOCK TABLES `cuidadores` WRITE;
/*!40000 ALTER TABLE `cuidadores` DISABLE KEYS */;
INSERT INTO `cuidadores` VALUES (1,'Felipe','3058697412',1),(2,'Laura','3014569876',1),(3,'Larry','3084569874',1),(4,'Dan','3054863201',2),(5,'Sandro','3002564782',2),(6,'Mario','3014598322',1);
/*!40000 ALTER TABLE `cuidadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guarderias`
--

DROP TABLE IF EXISTS `guarderias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guarderias` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Direccion` varchar(80) NOT NULL,
  `Telefono` varchar(12) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guarderias`
--

LOCK TABLES `guarderias` WRITE;
/*!40000 ALTER TABLE `guarderias` DISABLE KEYS */;
INSERT INTO `guarderias` VALUES (1,'La Favorita','CL Falsa 123 28','6019852647'),(2,'La No tan Favorita','CR Esperanza 1 45','6012365489'),(3,'Guarderia la Tercera','Calle de la Esperanza','6014568954');
/*!40000 ALTER TABLE `guarderias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perros`
--

DROP TABLE IF EXISTS `perros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perros` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Raza` varchar(20) NOT NULL,
  `Edad` float NOT NULL,
  `Peso` float NOT NULL,
  `ID_GUARDERIA` int NOT NULL,
  `ID_CUIDADOR` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_GUARDERIA` (`ID_GUARDERIA`),
  KEY `ID_CUIDADOR` (`ID_CUIDADOR`),
  CONSTRAINT `perros_ibfk_1` FOREIGN KEY (`ID_GUARDERIA`) REFERENCES `guarderias` (`ID`),
  CONSTRAINT `perros_ibfk_2` FOREIGN KEY (`ID_CUIDADOR`) REFERENCES `cuidadores` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perros`
--

LOCK TABLES `perros` WRITE;
/*!40000 ALTER TABLE `perros` DISABLE KEYS */;
INSERT INTO `perros` VALUES (1,'Kira','Terrier Norfolk',5,6,1,3),(2,'Joints','Poodle',12,8,1,1),(3,'Luna','French Poodle',8,7,1,3),(4,'Bruno','Siberiano',5,15,1,2),(5,'Hachy','Dalmata',1,12,1,1),(6,'Miel','Golden Retriver',3,17,2,4),(7,'Lucy','Pomerainia',5,2,1,6),(8,'Maki','Pincher',2,1,1,6),(9,'Pinkie','Chihuahua',4,2,1,6),(10,'Cucarachin','Pincher',8,2.5,1,6),(11,'Guardian','Pastor Aleman',9,13,2,4),(12,'Babas','Bulldog',6,11,2,5),(13,'Lassie','Afgano',5,14,1,2),(14,'Lassie','Cocker Spaniel',11,9,2,5),(15,'Lassie','Doberman',10,18,2,4);
/*!40000 ALTER TABLE `perros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'UserAdmin','PassAdmin',1),(2,'UsuarioNormal1','PassUNormal1',0),(3,'UsuarioNormal2','PassUNormal2',0);
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

-- Dump completed on 2024-07-19 22:41:09
