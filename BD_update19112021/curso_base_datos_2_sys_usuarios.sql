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
-- Table structure for table `sys_usuarios`
--

DROP TABLE IF EXISTS `sys_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_usuarios` (
  `id_entidad` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `clave_acceso` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `telefono` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` enum('U','S','A') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'U',
  `estado_registro` enum('A','B') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_entidad`) USING BTREE,
  UNIQUE KEY `idx_clave` (`clave_acceso`) USING BTREE,
  UNIQUE KEY `idx_usuario` (`usuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_usuarios`
--

LOCK TABLES `sys_usuarios` WRITE;
/*!40000 ALTER TABLE `sys_usuarios` DISABLE KEYS */;
INSERT INTO `sys_usuarios` VALUES (1,'Administrador','administrador','ab6f954b1cb19bdd92b95b82a24a5ab94d745669','','administrador@correo.com','5b1ec2888f612','A','A'),(2,'Sergio Mendez','sergio.mendez','11c583a6147afc209a8a00b006bdb726be4884ef','','sergio.mendez@correo.com','5d4191ce339e3','U','A'),(3,'Lester Marroquin','lester.marroquin','25264c7de5c988522d9ae8216f58a5f70996e064','','lester.marroquin@correo.com','57291986c58d1','U','B'),(4,'Verónica Ríos','veronica.rios','01366c6a0fc56e73d6f2b746778b3bfde9021a8b','','veronica.rios@correo.com','577533e8b67b9','U','B'),(5,'Jorge Gomez','jorge.gomez','b97034f5529f152be50c0edce358b19ddcb134ab','','jorge.gomez@correo.com','57753557c0f0e','U','B'),(6,'Samantha Roldan','samantha.roldan','a1426ba159fc38230764c0e56f2e876fcbecdc3d','','samantha.roldan@correo.com','57753582868b1','U','A'),(7,'Jimmy Mejia','jimmy.mejia','25c184e137bdc7b08532313c8842939c4b4cb43b','','jimmy.mejia@correo.com','577535abec364','U','A'),(8,'Carlos Torres','carlos.torres1','cef891d4ec4a0aa224f43b169767a0ff5af8dfb6','','carlos.torres@correo.com','577535f0254fd','U','A'),(9,'Erick Recinos','erick.recinos','e29b5c2ca57cb93712cfbbaa892eae73298de544','','erick.recinos@correo.com','577537d026d7e','U','B'),(10,'Luis Moran','luis.moran','07996a88cc10c0c5e1719f2982c03834becfb13d','','luis.moran@correo.com','57753a0488361','U','B'),(11,'Jenifer Ramirez','jenifer.ramirez','7a7a88b4f7b187026642729b47fa8a7b18d03aa0','','jenifer.ramirez@correo.com','57753a44c30d8','U','A'),(12,'Patricia Alavarado','patricia.alvarado','13ba7c38b169f0a0b3bfa9fac6fa54d8589113e0','','patricia.alvarado@correo.com','57753aa121914','U','B'),(13,'David Flores','david.flores','e89b4720bbcf96778f370258d392c5ade50af30f','','david.flores@correo.com','5b1ec2888f612','U','B'),(14,'Alejandro Roldan','alejandro.roldan','db332afcd6467a9d979b69ef0e19c0480fbca663','','alejandro.roldan@correo.com','5b51dae57dc84','U','A'),(15,'Jonatan Lopez','jonatan.lopez','57ab82352a82bdb5f64dc6ff36faf32e906fe881','','jonatan.lopez@correo.com','5b85e5af5d96d','U','B'),(16,'Karen Gonzalez','karen.gonzalez','b0746f1a724feaa95061c804277c89d4ac8f6c32','','karen.gonzalez@correo.com','5b86add981182','U','B'),(17,'Felipe Torres','felipe.torres','e11059981214452a1b5a698b924250b81870b6be','','felipe.torres@correo.com','5c479d0a03c39','U','B'),(18,'Jose Roldan','jose.roldan','0e4d9ebb1b39e0491ea1d84f74b9777d589b7a50','','jose.roldan@correo.com','5c4c7ca867e67','U','A'),(19,'Lisa Cruz','lisa.cruz','3996639e7666e1e8c48665a550806bfb26ea8dfe','','lisa.cruz@correo.com','5cbde22fd9070','U','B'),(20,'Alicia Figueroa','alicia.figueroa','878119373d8d2a14f8d2518c3a66a48fa266be29','','alicia.figueroa@coreo.com','5dc973c0d80a8','U','B');
/*!40000 ALTER TABLE `sys_usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-19 21:24:52
