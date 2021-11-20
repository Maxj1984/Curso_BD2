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
-- Table structure for table `opr_pedido_encabezado`
--

DROP TABLE IF EXISTS `opr_pedido_encabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opr_pedido_encabezado` (
  `id_pedido_encabezado` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'identificador autoincrementable del pedido encabezado',
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'fecha de emisión del pedido',
  `id_cliente` int(11) unsigned NOT NULL COMMENT 'identificador del cliente',
  `descripcion` varchar(75) DEFAULT NULL COMMENT 'nombre del cliente o razón social',
  `valor` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'monto total del pedido',
  `valor_iva` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'valor de IVa del pedido',
  `id_operador` int(11) unsigned DEFAULT NULL COMMENT 'identificador del operador que emite el pedido',
  `estado_facturado` enum('S','N') NOT NULL DEFAULT 'N',
  `id_factura_encabezado` int(10) unsigned NOT NULL,
  `estado_registro` enum('A','B') NOT NULL DEFAULT 'A' COMMENT 'El estado del registro, A-Alta y B-Baja',
  PRIMARY KEY (`id_pedido_encabezado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información de los pedidos emitidos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opr_pedido_encabezado`
--

LOCK TABLES `opr_pedido_encabezado` WRITE;
/*!40000 ALTER TABLE `opr_pedido_encabezado` DISABLE KEYS */;
INSERT INTO `opr_pedido_encabezado` VALUES (1,'2021-10-06 21:59:34',4459,'Myra Atkinson',1482.00,0.00,NULL,'N',0,'A'),(2,'2021-10-06 21:59:34',2723,'Felix Ryan',325.00,0.00,NULL,'N',0,'A'),(3,'2021-10-06 21:59:34',2712,'Orlando Lyons',774.00,0.00,NULL,'N',0,'A'),(4,'2021-10-06 21:59:34',687,'Cynthia Wooten',304.00,0.00,NULL,'N',0,'A'),(5,'2021-10-06 21:59:34',210,'Wesley Garrison',323.00,0.00,NULL,'N',0,'A'),(6,'2021-10-06 21:59:34',2005,'Tate Randall',380.00,0.00,NULL,'N',0,'A'),(7,'2021-10-06 21:59:34',4883,'Merritt Wiggins',427.00,0.00,NULL,'N',0,'A'),(8,'2021-10-06 21:59:34',946,'Yasir Cooley',5772.00,0.00,NULL,'N',0,'A'),(9,'2021-10-06 21:59:34',3871,'Ann Rush',1004.00,0.00,NULL,'N',0,'A'),(10,'2021-10-06 21:59:34',3893,'Preston Christensen',766.00,0.00,NULL,'N',0,'A'),(11,'2021-10-06 21:59:34',4223,'Liberty Watkins',14256.00,0.00,NULL,'N',0,'A'),(12,'2021-10-06 21:59:34',3886,'Stephen Davis',8928.00,0.00,NULL,'N',0,'A'),(13,'2021-10-06 21:59:34',2618,'Macon Hudson',2964.00,0.00,NULL,'N',0,'A'),(14,'2021-10-06 21:59:34',3165,'Virginia Sanford',1636.00,0.00,NULL,'N',0,'A'),(15,'2021-10-06 21:59:34',2797,'Summer Gaines',489.00,0.00,NULL,'N',0,'A'),(16,'2021-10-06 21:59:34',2650,'Pearl Matthews',681.00,0.00,NULL,'N',0,'A'),(17,'2021-10-06 21:59:34',251,'Connor Wooten',3024.00,0.00,NULL,'N',0,'A'),(18,'2021-10-06 21:59:34',3865,'Elaine Waters',1174.00,0.00,NULL,'N',0,'A'),(19,'2021-10-06 21:59:34',3498,'Dean Bridges',2202.00,0.00,NULL,'N',0,'A'),(20,'2021-10-06 21:59:34',41,'Faith Rocha',11343.00,0.00,NULL,'N',0,'A'),(21,'2021-10-06 21:59:34',2085,'Dillon Rios',1617.00,0.00,NULL,'N',0,'A'),(22,'2021-10-06 21:59:34',1726,'Finn Vance',525.00,0.00,NULL,'N',0,'A'),(23,'2021-10-06 21:59:34',4212,'Akeem Bowman',656.00,0.00,NULL,'N',0,'A'),(24,'2021-10-06 21:59:34',261,'Cyrus Lang',554.00,0.00,NULL,'N',0,'A'),(25,'2021-10-06 21:59:34',53,'Zane Callahan',577.00,0.00,NULL,'N',0,'A'),(26,'2021-10-06 21:59:34',3867,'Molly May',1390.00,0.00,NULL,'N',0,'A'),(27,'2021-10-06 21:59:34',1393,'Iona Farley',713.00,0.00,NULL,'N',0,'A'),(28,'2021-10-06 21:59:34',2032,'Brooke Barnes',1370.00,0.00,NULL,'N',0,'A'),(29,'2021-10-06 21:59:34',4742,'Grant Wyatt',683.00,0.00,NULL,'N',0,'A'),(30,'2021-10-06 21:59:34',1634,'Jermaine Stevens',780.00,0.00,NULL,'N',0,'A'),(31,'2021-10-06 21:59:34',4180,'Amir Hickman',418.00,0.00,NULL,'N',0,'A'),(32,'2021-10-06 21:59:34',3345,'Hilary Freeman',3900.00,0.00,NULL,'N',0,'A'),(33,'2021-10-06 21:59:34',3774,'Mallory Frost',344.00,0.00,NULL,'N',0,'A'),(34,'2021-10-06 21:59:34',2865,'Hyacinth Swanson',532.00,0.00,NULL,'N',0,'A'),(35,'2021-10-06 21:59:34',175,'Aspen Franks',1624.00,0.00,NULL,'N',0,'A'),(36,'2021-10-06 21:59:34',3909,'Neil Webb',590.00,0.00,NULL,'N',0,'A'),(37,'2021-10-06 21:59:34',3103,'Nina Oconnor',799.00,0.00,NULL,'N',0,'A'),(38,'2021-10-06 21:59:34',3058,'Jonas Collins',558.00,0.00,NULL,'N',0,'A'),(39,'2021-10-06 21:59:34',1523,'Rama Alford',1492.00,0.00,NULL,'N',0,'A'),(40,'2021-10-06 21:59:34',2485,'Joel Mooney',794.00,0.00,NULL,'N',0,'A'),(41,'2021-10-06 21:59:34',2901,'Sharon Sanchez',3036.00,0.00,NULL,'N',0,'A'),(42,'2021-10-06 21:59:34',1583,'Drew Clayton',792.00,0.00,NULL,'N',0,'A'),(43,'2021-10-06 21:59:34',3188,'Belle Bolton',2356.00,0.00,NULL,'N',0,'A'),(44,'2021-10-06 21:59:34',396,'Sharon Lambert',1546.00,0.00,NULL,'N',0,'A'),(45,'2021-10-06 21:59:34',2894,'Tobias Le',4452.00,0.00,NULL,'N',0,'A'),(46,'2021-10-06 21:59:34',1090,'Ralph Gonzalez',2904.00,0.00,NULL,'N',0,'A'),(47,'2021-10-06 21:59:34',3177,'Cairo Everett',4024.00,0.00,NULL,'N',0,'A'),(48,'2021-10-06 21:59:34',1316,'Sydnee Head',1372.00,0.00,NULL,'N',0,'A'),(49,'2021-10-06 21:59:34',4013,'Briar Stewart',2740.00,0.00,NULL,'N',0,'A'),(50,'2021-10-06 21:59:34',3015,'Alisa Simmons',980.00,0.00,NULL,'N',0,'A'),(51,'2021-10-06 21:59:34',3999,'Martena Carroll',7764.00,0.00,NULL,'N',0,'A'),(52,'2021-10-06 21:59:34',3647,'Akeem Farrell',1230.00,0.00,NULL,'N',0,'A'),(53,'2021-10-06 21:59:34',4863,'Igor Cervantes',4566.00,0.00,NULL,'N',0,'A'),(54,'2021-10-06 21:59:34',2949,'Paul Chandler',3330.00,0.00,NULL,'N',0,'A'),(55,'2021-10-06 21:59:34',3906,'Brynne Cochran',374.00,0.00,NULL,'N',0,'A'),(56,'2021-10-06 21:59:34',1862,'Mollie Freeman',362.00,0.00,NULL,'N',0,'A'),(57,'2021-10-06 21:59:34',3116,'Gannon Rivers',361.00,0.00,NULL,'N',0,'A'),(58,'2021-10-06 21:59:34',141,'Virginia Simpson',545.00,0.00,NULL,'N',0,'A'),(59,'2021-10-06 21:59:34',1442,'Quintessa Gibbs',324.00,0.00,NULL,'N',0,'A'),(60,'2021-10-06 21:59:34',4809,'Diana Barron',47820.00,0.00,NULL,'N',0,'A'),(61,'2021-10-06 21:59:34',1550,'Quinn Jackson',7620.00,0.00,NULL,'N',0,'A'),(62,'2021-10-06 21:59:34',4482,'Autumn Cameron',3816.00,0.00,NULL,'N',0,'A'),(63,'2021-10-06 21:59:34',1232,'Claudia Gentry',3616.00,0.00,NULL,'N',0,'A'),(64,'2021-10-06 21:59:34',3817,'Ali Bradshaw',1844.00,0.00,NULL,'N',0,'A'),(65,'2021-10-06 21:59:34',237,'Debra Mclean',1262.00,0.00,NULL,'N',0,'A'),(66,'2021-10-06 21:59:34',3973,'Elmo Adams',1642.00,0.00,NULL,'N',0,'A'),(67,'2021-10-06 21:59:34',2868,'Benedict Figueroa',1546.00,0.00,NULL,'N',0,'A'),(68,'2021-10-06 21:59:34',3421,'Elijah Herman',1122.00,0.00,NULL,'N',0,'A'),(69,'2021-10-06 21:59:34',4746,'Vanna Long',3488.00,0.00,NULL,'N',0,'A'),(70,'2021-10-06 21:59:34',1722,'Katelyn Avila',1642.00,0.00,NULL,'N',0,'A'),(71,'2021-10-06 21:59:34',539,'Eaton Hoffman',4002.00,0.00,NULL,'N',0,'A'),(72,'2021-10-06 21:59:34',267,'Ralph Grant',613.00,0.00,NULL,'N',0,'A'),(73,'2021-10-06 21:59:34',4026,'Abel Marks',956.00,0.00,NULL,'N',0,'A'),(74,'2021-10-06 21:59:34',680,'Winifred Browning',2812.00,0.00,NULL,'N',0,'A'),(75,'2021-10-06 21:59:34',4052,'Melissa Maldonado',2676.00,0.00,NULL,'N',0,'A'),(76,'2021-10-06 21:59:34',1661,'Leilani Galloway',6828.00,0.00,NULL,'N',0,'A'),(77,'2021-10-06 21:59:34',1851,'Helen Calderon',2526.00,0.00,NULL,'N',0,'A'),(78,'2021-10-06 21:59:34',4121,'Imogene Fisher',709.00,0.00,NULL,'N',0,'A'),(79,'2021-10-06 21:59:34',4688,'Marny English',6470.00,0.00,NULL,'N',0,'A'),(80,'2021-10-06 21:59:34',4646,'Hoyt May',1192.00,0.00,NULL,'N',0,'A'),(81,'2021-10-06 21:59:34',3379,'Rhonda Rice',3534.00,0.00,NULL,'N',0,'A'),(82,'2021-10-06 21:59:34',4196,'Clementine Barry',843.00,0.00,NULL,'N',0,'A'),(83,'2021-10-06 21:59:34',4889,'Ava Barker',1312.00,0.00,NULL,'N',0,'A'),(84,'2021-10-06 21:59:34',3153,'Karleigh Valencia',692.00,0.00,NULL,'N',0,'A'),(85,'2021-10-06 21:59:34',1987,'Flynn Morton',3785.00,0.00,NULL,'N',0,'A'),(86,'2021-10-06 21:59:34',1254,'Herrod Browning',4092.00,0.00,NULL,'N',0,'A'),(87,'2021-10-06 21:59:34',3800,'Bo Odonnell',1456.00,0.00,NULL,'N',0,'A'),(88,'2021-10-06 21:59:34',2290,'Kimberley Harris',730.00,0.00,NULL,'N',0,'A'),(89,'2021-10-06 21:59:34',4600,'Dalton Benson',822.00,0.00,NULL,'N',0,'A'),(90,'2021-10-06 21:59:34',1870,'Quamar Fields',516.00,0.00,NULL,'N',0,'A'),(91,'2021-10-06 21:59:34',866,'Inga Grant',529.00,0.00,NULL,'N',0,'A'),(92,'2021-10-06 21:59:34',3651,'Keaton Dunn',8688.00,0.00,NULL,'N',0,'A'),(93,'2021-10-06 21:59:34',4344,'Omar Mcconnell',1052.00,0.00,NULL,'N',0,'A'),(94,'2021-10-06 21:59:34',2455,'Wanda Gross',5436.00,0.00,NULL,'N',0,'A'),(95,'2021-10-06 21:59:34',918,'Erica Navarro',1011.00,0.00,NULL,'N',0,'A'),(96,'2021-10-06 21:59:34',1807,'Cailin Evans',933.00,0.00,NULL,'N',0,'A'),(97,'2021-10-06 21:59:34',3521,'Angela Fuentes',325.00,0.00,NULL,'N',0,'A'),(98,'2021-10-06 21:59:34',3290,'Eleanor Boyd',680.00,0.00,NULL,'N',0,'A'),(99,'2021-10-06 21:59:34',2635,'Hillary Poole',5560.00,0.00,NULL,'N',0,'A'),(100,'2021-10-06 21:59:34',2629,'Germaine Riley',0.00,0.00,NULL,'N',0,'A');
/*!40000 ALTER TABLE `opr_pedido_encabezado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-19 21:24:50
