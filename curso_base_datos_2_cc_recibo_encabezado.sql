-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: curso_base_datos_2
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.20-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cc_recibo_encabezado`
--

DROP TABLE IF EXISTS `cc_recibo_encabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc_recibo_encabezado` (
  `id_recibo_encabezado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla encabezado',
  `num_recibo` int(10) unsigned NOT NULL COMMENT 'NO. recibo interno',
  `cliente` varchar(100) NOT NULL COMMENT 'Descripcion del cliente (nombres y apellidos)',
  `cuenta` varchar(11) NOT NULL COMMENT 'NO. cuenta del cliente',
  `fecha_emitida` datetime DEFAULT current_timestamp() COMMENT 'fecha de emision del recibo_detalle',
  `estado` enum('A','C','R') DEFAULT NULL COMMENT 'estado del detalle, A:aprobado; C:cancelado; R:rechazado\n',
  PRIMARY KEY (`id_recibo_encabezado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='informacion del encabezado de recibo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cc_recibo_encabezado`
--

LOCK TABLES `cc_recibo_encabezado` WRITE;
/*!40000 ALTER TABLE `cc_recibo_encabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `cc_recibo_encabezado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-26  0:16:18
