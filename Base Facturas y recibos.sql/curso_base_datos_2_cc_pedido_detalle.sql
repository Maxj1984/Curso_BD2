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
-- Table structure for table `cc_pedido_detalle`
--

DROP TABLE IF EXISTS `cc_pedido_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_pedido_detalle` (
  `id_detalle_pedido` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador Autoincrementable del detalle de pedido',
  `id_pedido_encabezado` int(11) unsigned DEFAULT NULL COMMENT 'ID del pedido encabezado a la que pertenece el detalle',
  `id_bodega` int(11) DEFAULT NULL COMMENT 'ID de la bodega del producto',
  `id_codigo_producto` int(11) DEFAULT NULL COMMENT 'codigo del producto',
  `descripcion` varchar(75) NOT NULL COMMENT 'descripcion del producto',
  `cantidad` int(11) DEFAULT NULL COMMENT 'cantidad vendida',
  `valor_unitario` decimal(10,2) DEFAULT NULL COMMENT 'precio unitario',
  `valor` decimal(10,2) DEFAULT NULL COMMENT 'total de producto vendido',
  `valor_iva` decimal(10,2) NOT NULL COMMENT 'IVA del producto',
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `id_encabezadopedido_idx` (`id_pedido_encabezado`),
  CONSTRAINT `id_encabezadopedido` FOREIGN KEY (`id_pedido_encabezado`) REFERENCES `cc_pedido_encabezado` (`id_pedido_encabezado`)
) ENGINE=InnoDB AUTO_INCREMENT=68018 DEFAULT CHARSET=utf8 COMMENT='Tabla para registrar los detalles de pedidos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cc_pedido_detalle`
--

LOCK TABLES `cc_pedido_detalle` WRITE;
/*!40000 ALTER TABLE `cc_pedido_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `cc_pedido_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-18  9:37:27
