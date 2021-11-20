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
-- Table structure for table `opr_ruta_entrega`
--

DROP TABLE IF EXISTS `opr_ruta_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opr_ruta_entrega` (
  `id_ruta_entrega` int(10) unsigned NOT NULL COMMENT 'Identificador de la tabla',
  `descripcion` varchar(75) NOT NULL COMMENT 'Descripción de la ruta de entrega de producto',
  `estado_registro` enum('A','B') NOT NULL DEFAULT 'A' COMMENT 'Estado del registro A-Alta y B-Baja',
  PRIMARY KEY (`id_ruta_entrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información de la ruta de entrega de los productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opr_ruta_entrega`
--

LOCK TABLES `opr_ruta_entrega` WRITE;
/*!40000 ALTER TABLE `opr_ruta_entrega` DISABLE KEYS */;
INSERT INTO `opr_ruta_entrega` VALUES (1,'Ruta Norte','A'),(2,'Ruta Oeste','A'),(3,'Ruta Este','A'),(4,'Ruta Sur','A'),(5,'Ruta Noreste','A'),(6,'Ruta Sureste','A'),(7,'Ruta Noroeste','A'),(8,'Ruta Suroeste','A'),(9,'Ruta Central','A');
/*!40000 ALTER TABLE `opr_ruta_entrega` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-19 21:24:45
