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
-- Table structure for table `cc_pago`
--

DROP TABLE IF EXISTS `cc_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc_pago` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla cc_pago',
  `id_tip_pago` int(11) NOT NULL COMMENT 'FK conecta a la tabla sys_tipo_pago',
  `id_banco` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL COMMENT 'descripcion del pago efectuado',
  `emisor` enum('B','C','D') NOT NULL DEFAULT 'C' COMMENT 'Persona o entidad que emite el pago B:banco, C:cliente, D:donacion',
  `estado` enum('A','P','R') NOT NULL DEFAULT 'P' COMMENT 'Estado del pago A:aprobado, P:pendiente, R:rechazado',
  `no_transaccion` varchar(15) DEFAULT NULL COMMENT 'Numero de transacción de emitida por el banco',
  `transaccion_interna` int(10) unsigned NOT NULL COMMENT 'No. registro interno de transacciones de pago',
  `monto_pago` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion y bitacora de pagos realizados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cc_pago`
--

LOCK TABLES `cc_pago` WRITE;
/*!40000 ALTER TABLE `cc_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `cc_pago` ENABLE KEYS */;
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
