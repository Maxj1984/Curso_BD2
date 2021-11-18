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
-- Table structure for table `sys_estado`
--

DROP TABLE IF EXISTS `sys_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_estado` (
  `id_estado` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla estado',
  `descripcion` varchar(75) NOT NULL COMMENT 'Nombre del estado de residencia',
  `estado_registro` enum('A','B') NOT NULL DEFAULT 'A' COMMENT 'Estado del registro A-Alta y B-Baja',
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información de los estados de residencia del cliente.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_estado`
--

LOCK TABLES `sys_estado` WRITE;
/*!40000 ALTER TABLE `sys_estado` DISABLE KEYS */;
INSERT INTO `sys_estado` VALUES (1,'Missouri','A'),(2,'Alabama','A'),(3,'Idaho','A'),(4,'Wisconsin','A'),(5,'Rhode Island','A'),(6,'California','A'),(7,'Maine','A'),(8,'Hawaii','A'),(9,'Montana','A'),(10,'Florida','A'),(11,'Kansas','A'),(12,'New Hampshire','A'),(13,'Alaska','A'),(14,'Georgia','A'),(15,'New Mexico','A'),(16,'Texas','A'),(17,'Delaware','A'),(18,'Michigan','A'),(19,'Ohio','A'),(20,'South Dakota','A'),(21,'Minnesota','A'),(22,'Nebraska','A'),(23,'Utah','A'),(24,'Indiana','A'),(25,'South Carolina','A'),(26,'North Carolina','A'),(27,'Maryland','A'),(28,'Colorado','A'),(29,'Vermont','A'),(30,'District of Columbia','A'),(31,'Pennsylvania','A'),(32,'Washington','A'),(33,'Kentucky','A'),(34,'New York','A'),(35,'Nevada','A'),(36,'Arkansas','A'),(37,'Connecticut','A'),(38,'North Dakota','A'),(39,'Louisiana','A'),(40,'Virginia','A'),(41,'Arizona','A'),(42,'Wyoming','A'),(43,'Iowa','A'),(44,'Illinois','A'),(45,'Mississippi','A'),(46,'Tennessee','A'),(47,'West Virginia','A'),(48,'New Jersey','A'),(49,'Oregon','A'),(50,'Oklahoma','A'),(51,'Massachusetts','A');
/*!40000 ALTER TABLE `sys_estado` ENABLE KEYS */;
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
