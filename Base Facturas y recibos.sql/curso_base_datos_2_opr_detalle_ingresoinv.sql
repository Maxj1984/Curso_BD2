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
-- Table structure for table `opr_detalle_ingresoinv`
--

DROP TABLE IF EXISTS `opr_detalle_ingresoinv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opr_detalle_ingresoinv` (
  `id_detalle_ingresoInv` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'identificador detalle de ingreso',
  `id_encabezado_ingresoInv` int(11) DEFAULT NULL COMMENT 'id de encabezado ingreso',
  `id_codigo_producto` int(11) DEFAULT NULL COMMENT 'codigo de producto',
  `id_bodega` int(255) DEFAULT NULL COMMENT 'codigo de bodega',
  `descripcion` varchar(75) NOT NULL COMMENT 'descripcion de producto',
  `cantidad` int(11) DEFAULT NULL COMMENT 'cantidad a ingresar',
  `costo_unitario` decimal(10,2) DEFAULT NULL COMMENT 'costo de producto',
  `valor` decimal(10,2) DEFAULT NULL COMMENT 'valor total por producto',
  PRIMARY KEY (`id_detalle_ingresoInv`),
  KEY `cod_produc_idx` (`id_codigo_producto`),
  KEY `cod_bodega_idx` (`id_bodega`),
  KEY `id_encabezado_idx` (`id_encabezado_ingresoInv`),
  CONSTRAINT `cod_bodega` FOREIGN KEY (`id_bodega`) REFERENCES `opr_bodega` (`id_bodega`),
  CONSTRAINT `cod_produc` FOREIGN KEY (`id_codigo_producto`) REFERENCES `opr_codigo_producto` (`id_codigo_producto`),
  CONSTRAINT `id_encabezado` FOREIGN KEY (`id_encabezado_ingresoInv`) REFERENCES `opr_encabezado_ingresoinv` (`id_encabezado_ingresoInv`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='tabla detalle de compras o ingreso a inventario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opr_detalle_ingresoinv`
--

LOCK TABLES `opr_detalle_ingresoinv` WRITE;
/*!40000 ALTER TABLE `opr_detalle_ingresoinv` DISABLE KEYS */;
INSERT INTO `opr_detalle_ingresoinv` VALUES (1,1,922,NULL,'',1168,695.00,811760.00),(2,2,922,NULL,'',332,695.00,230740.00),(3,3,10,NULL,'',500,NULL,NULL);
/*!40000 ALTER TABLE `opr_detalle_ingresoinv` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-18  9:37:26
