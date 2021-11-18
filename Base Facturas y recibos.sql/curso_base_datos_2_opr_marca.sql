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
-- Table structure for table `opr_marca`
--

DROP TABLE IF EXISTS `opr_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opr_marca` (
  `id_marca_producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Indice autoincrementable de marca',
  `descripcion` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'descripcion o nombre de la marca del producto',
  `id_estado_registro` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT 'estado del registro 1= activo, 0 = baja',
  PRIMARY KEY (`id_marca_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opr_marca`
--

LOCK TABLES `opr_marca` WRITE;
/*!40000 ALTER TABLE `opr_marca` DISABLE KEYS */;
INSERT INTO `opr_marca` VALUES (18,'Adidas','1'),(19,'Thule','1'),(20,'Wilson','1'),(21,'Vitorinox','1'),(22,'Umbro','1'),(23,'Armour','1'),(24,'Rkeli','1'),(25,'Diego Explorer','1'),(26,'Diego Collection','1'),(27,'Fortis','1'),(28,'Spalding','1'),(29,'Rverlas','1'),(30,'Lorus','1'),(31,'Coleman','1'),(32,'Zippo','1'),(33,'Go Travel','1'),(34,'Milan','1'),(35,'Mikas','1'),(36,'Reto','1'),(37,'Swiss Gear','1'),(38,'Stigga','1'),(39,'Reebok','1'),(40,'Body','1'),(41,'Aguatek','1'),(42,'MagLite','1'),(43,'Nike','1'),(44,'Totto','1'),(45,'Free Bike','1'),(46,'Exceed','1'),(47,'Rinat','1'),(48,'Arena','1'),(49,'Gilbert','1'),(50,'John Deere','1'),(51,'Hanes','1'),(52,'Venzo','1'),(53,'Nanfeng','1'),(54,'Cup','1'),(55,'J5Tactical','1'),(56,'Cree','1'),(57,'Xpand','1'),(58,'Excede','1'),(59,'Freire','1'),(60,'Ultra Star','1'),(61,'B.C.','1'),(62,'Bandana','1'),(63,'Fox 40','1');
/*!40000 ALTER TABLE `opr_marca` ENABLE KEYS */;
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
