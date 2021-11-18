CREATE DATABASE  IF NOT EXISTS `curso_base_datos_2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `curso_base_datos_2`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: curso_base_datos_2
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `opr_modelo`
--

DROP TABLE IF EXISTS `opr_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opr_modelo` (
  `id_modelo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador del modelo',
  `descripcion` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'descripción o detalle del modelo del producto',
  `id_producto` int(11) DEFAULT NULL COMMENT 'identificador secundario del producto',
  `estado_registro` enum('A','B') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'A' COMMENT 'El estado del registro, A-Alta y B-Baja',
  PRIMARY KEY (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opr_modelo`
--

LOCK TABLES `opr_modelo` WRITE;
/*!40000 ALTER TABLE `opr_modelo` DISABLE KEYS */;
INSERT INTO `opr_modelo` VALUES (28,'Traning',11,'A'),(29,'Running',11,'A'),(30,'Basketball',11,'A'),(31,'Voleyball',11,'A'),(32,'Casual',11,'A'),(33,'Outdoor',11,'A'),(34,'Tennis',11,'A'),(35,'Grama Sintetica',16,'A'),(36,'Todo Terreno',16,'A'),(37,'Papi Turf',16,'A'),(38,'Futbol Sala',16,'A'),(39,'Natacion',37,'A'),(40,'Ciclismo',37,'A'),(41,'Camping',37,'A'),(42,'Botas Industriales',12,'A');
/*!40000 ALTER TABLE `opr_modelo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-18  9:37:25
