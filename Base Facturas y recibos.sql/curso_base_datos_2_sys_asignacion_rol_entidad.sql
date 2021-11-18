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
-- Table structure for table `sys_asignacion_rol_entidad`
--

DROP TABLE IF EXISTS `sys_asignacion_rol_entidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_asignacion_rol_entidad` (
  `id_asignacion_rol_entidad` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador asignacion de rol de la tabla',
  `id_rol_entidad` int(10) unsigned NOT NULL COMMENT 'Identificador del Rol a asignarse ',
  `id_entidad` int(10) unsigned NOT NULL COMMENT 'Identificador de la entidad.',
  PRIMARY KEY (`id_asignacion_rol_entidad`),
  KEY `id_rol_entidad_idx` (`id_rol_entidad`),
  KEY `id_entidad_idx` (`id_entidad`),
  CONSTRAINT `id_entidad` FOREIGN KEY (`id_entidad`) REFERENCES `sys_usuarios` (`id_entidad`),
  CONSTRAINT `id_rol_entidad` FOREIGN KEY (`id_rol_entidad`) REFERENCES `sys_rol_entidad` (`id_rol_entidad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información de la asignación de los roles a las entidades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_asignacion_rol_entidad`
--

LOCK TABLES `sys_asignacion_rol_entidad` WRITE;
/*!40000 ALTER TABLE `sys_asignacion_rol_entidad` DISABLE KEYS */;
INSERT INTO `sys_asignacion_rol_entidad` VALUES (1,3,5),(2,3,7),(3,3,10),(4,3,12),(5,3,15);
/*!40000 ALTER TABLE `sys_asignacion_rol_entidad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-18  9:37:28
