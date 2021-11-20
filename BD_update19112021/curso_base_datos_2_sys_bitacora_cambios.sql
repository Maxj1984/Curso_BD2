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
-- Table structure for table `sys_bitacora_cambios`
--

DROP TABLE IF EXISTS `sys_bitacora_cambios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_bitacora_cambios` (
  `id_bitacora_cambios` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'identificado de la bitacora autoincrementable',
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'fecha del cambio',
  `tabla` varchar(50) NOT NULL COMMENT 'tabla afectada o donde se realizo el cambio',
  `campo` varchar(50) NOT NULL COMMENT 'campo afectado, modificado o eliminado',
  `valor_campo_inicial` varchar(100) DEFAULT NULL COMMENT 'registro inicial del campo afectado',
  `valor_campo_final` varchar(100) DEFAULT NULL COMMENT 'nuevo valor del campo afectado',
  `id_operador` int(11) unsigned NOT NULL COMMENT 'identificador del operador que realizao la modificacion.',
  PRIMARY KEY (`id_bitacora_cambios`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='tabla para registrar en bitacora los cambios de las tabla cli_cliente';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_bitacora_cambios`
--

LOCK TABLES `sys_bitacora_cambios` WRITE;
/*!40000 ALTER TABLE `sys_bitacora_cambios` DISABLE KEYS */;
INSERT INTO `sys_bitacora_cambios` VALUES (1,'2021-08-11 21:20:21','cli_cliente','cuenta','489-74-9738','489-74-2222',7),(2,'2021-08-11 21:20:21','cli_cliente','descripcion','Ivory Ramirez','cambio',6),(3,'2021-08-11 21:20:21','cli_cliente','id_ciudad','857','120',1),(4,'2021-08-11 21:20:21','cli_cliente','telefono','364-263-3033','364-263-1111',1),(5,'2021-08-13 20:55:56','cli_cliente','descripcion','Perry Bentley','Perry Bentley old',12),(6,'2021-08-13 20:58:19','cli_cliente','descripcion','Perry Bentley old','Perry Bentley new',12),(7,'2021-08-13 21:09:01','cli_cliente','descripcion','cabmio','cabmio nuevo',15),(8,'2021-08-13 21:09:01','cli_cliente','descripcion','cambio','cambio viejo2.0',6);
/*!40000 ALTER TABLE `sys_bitacora_cambios` ENABLE KEYS */;
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
