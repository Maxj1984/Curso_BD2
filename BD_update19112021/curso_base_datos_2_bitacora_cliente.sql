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
-- Table structure for table `bitacora_cliente`
--

DROP TABLE IF EXISTS `bitacora_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_cliente` (
  `id_bitacora` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cliente en la empresa',
  `descripcion` varchar(100) NOT NULL COMMENT 'Nombre de la empresa o persona que es cliente de la empresa.',
  `direccion` varchar(100) NOT NULL COMMENT 'Ubicación física del cliente',
  `telefono` varchar(25) DEFAULT NULL COMMENT 'Teléfono de contacto con el cliente.',
  `nit` varchar(11) DEFAULT NULL COMMENT 'NIT del cliente',
  `correo` varchar(75) DEFAULT NULL COMMENT 'Correo de contacto con el cliente',
  `tipo_registro` enum('O','N') NOT NULL COMMENT 'El tipo del registro, O-Old y N-New',
  PRIMARY KEY (`id_bitacora`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla contiene la información de los clientes de la empresa.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_cliente`
--

LOCK TABLES `bitacora_cliente` WRITE;
/*!40000 ALTER TABLE `bitacora_cliente` DISABLE KEYS */;
INSERT INTO `bitacora_cliente` VALUES (1,'Perry Bentley old','',NULL,NULL,NULL,'O'),(2,'Perry Bentley new','',NULL,NULL,NULL,'N'),(5,'cabmio','66186 West Faroe Islands Ave.','746-273-6742','4262609-2','Hall@dictum.com','O'),(6,'cabmio nuevo','66186 West Faroe Islands Ave.','746-273-6742','4262609-2','Hall@dictum.com','N'),(7,'cambio','66006  Cameroon St.','734-225-6329','2955574-9','Ronan@bibendum.gov','O'),(8,'cambio viejo2.0','66006  Cameroon St.','734-225-6329','2955574-9','Ronan@bibendum.gov','N'),(9,'MacKenzie Odom','97126 East Norwalk Ave.','139-548-9322','22102455-2','Azalia@elit.com','O'),(10,'MacKenzie Odom','97126 East Norwalk Ave.','139-548-9322','962301-9','Azalia@elit.com','N'),(11,'MacKenzie Odom','97126 East Norwalk Ave.','139-548-9322','962301-9','Azalia@elit.com','O'),(12,'MacKenzie Odom','97126 East Norwalk Ave.','139-548-9322','9623019','Azalia@elit.com','N'),(13,'Nolan Simpson','82434  Cyprus Way','607-140-3019','1941260-9','Brandon@eros.com','O'),(14,'Nolan Simpson','82434  Cyprus Way','607-140-3019','1941260-9','Brandon@eros.com','N'),(15,'Reece Berry','95362 South Alamogordo Ct.','313-871-6121','2139403-1','Deanna@nonummy.net','O'),(16,'Reece Berry','95362 South Alamogordo Ct.','313-871-6121','2139403-1','Deanna@nonummy.net','N');
/*!40000 ALTER TABLE `bitacora_cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-19 21:24:38
