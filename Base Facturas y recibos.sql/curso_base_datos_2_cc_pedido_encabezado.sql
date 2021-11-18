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
-- Table structure for table `cc_pedido_encabezado`
--

DROP TABLE IF EXISTS `cc_pedido_encabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_pedido_encabezado` (
  `id_pedido_encabezado` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'identificador autoincrementable del pedido encabezado',
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'fecha de emisión del pedido',
  `id_vendedor` int(11) DEFAULT NULL COMMENT 'identificador del vendedor',
  `id_cliente` int(11) unsigned NOT NULL COMMENT 'identificador del cliente',
  `cliente` varchar(100) DEFAULT NULL COMMENT 'nombre del cliente o razón social',
  `direccion` varchar(100) DEFAULT NULL COMMENT 'dirección del cliente',
  `telefono` varchar(15) DEFAULT NULL COMMENT 'telefono del cliente',
  `nit` varchar(10) DEFAULT NULL COMMENT 'identificador tributario del cliente',
  `valor` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'monto total del pedido',
  `valor_iva` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'valor de IVa del pedido',
  `id_operador` int(11) unsigned DEFAULT NULL COMMENT 'identificador del operador que emite el pedido',
  `estado_registro` enum('A','B') NOT NULL DEFAULT 'A' COMMENT 'El estado del registro, A-Alta y B-Baja',
  PRIMARY KEY (`id_pedido_encabezado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30012 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información de los pedidos emitidos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cc_pedido_encabezado`
--

LOCK TABLES `cc_pedido_encabezado` WRITE;
/*!40000 ALTER TABLE `cc_pedido_encabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `cc_pedido_encabezado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-18  9:37:29
