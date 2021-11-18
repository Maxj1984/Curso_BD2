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
-- Table structure for table `opr_encabezado_ingresoinv`
--

DROP TABLE IF EXISTS `opr_encabezado_ingresoinv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opr_encabezado_ingresoinv` (
  `id_encabezado_ingresoInv` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador autoincrementable de ingresos a inventario',
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `proveedor` varchar(100) NOT NULL COMMENT 'nombre del proveedor',
  `direccion` varchar(100) DEFAULT NULL COMMENT 'direccion del proveedor',
  `telefono` varchar(15) DEFAULT NULL COMMENT 'telefono del proveedor',
  `observación` varchar(100) NOT NULL COMMENT 'motivo de la compra o ingreso',
  `docto_referencia` varchar(15) NOT NULL COMMENT 'número de documento que ampara la compra o ingreso a bodega',
  `valor` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'valor de la compra',
  `valor_iva` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'valor del impuesto',
  `id_operador` int(11) unsigned DEFAULT NULL COMMENT 'operador que registra el ingreso',
  `estado_registro` enum('A','B') NOT NULL DEFAULT 'A' COMMENT 'A = activo , B = baja',
  PRIMARY KEY (`id_encabezado_ingresoInv`),
  KEY `operadorId_idx` (`id_operador`),
  CONSTRAINT `operadorId` FOREIGN KEY (`id_operador`) REFERENCES `sys_usuarios` (`id_entidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='tabla para registrar las compras de producto e ingreso a inventario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opr_encabezado_ingresoinv`
--

LOCK TABLES `opr_encabezado_ingresoinv` WRITE;
/*!40000 ALTER TABLE `opr_encabezado_ingresoinv` DISABLE KEYS */;
INSERT INTO `opr_encabezado_ingresoinv` VALUES (1,'2020-01-01 00:00:00','Deportes 2000',NULL,NULL,'compra de 1168 unidades','19873549',811760.00,86974.29,NULL,'A'),(2,'2021-01-01 00:00:00','Deportes 2000',NULL,NULL,'compra de 332 unidades','897845',230740.00,24722.14,NULL,'A'),(3,'2020-01-01 00:00:00','dfasdfafd',NULL,NULL,'fsafdadsf','4684024',0.00,0.00,NULL,'A');
/*!40000 ALTER TABLE `opr_encabezado_ingresoinv` ENABLE KEYS */;
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
