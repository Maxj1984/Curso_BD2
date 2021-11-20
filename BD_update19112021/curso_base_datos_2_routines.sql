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
-- Temporary view structure for view `vw_cartera_clientes_saldos`
--

DROP TABLE IF EXISTS `vw_cartera_clientes_saldos`;
/*!50001 DROP VIEW IF EXISTS `vw_cartera_clientes_saldos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cartera_clientes_saldos` AS SELECT 
 1 AS `Estado`,
 1 AS `cliente`,
 1 AS `Monto_Venta`,
 1 AS `Monto_Abono`,
 1 AS `Saldo_Actual`,
 1 AS `Comision_venta`,
 1 AS `Porcentaje_Deuda`,
 1 AS `Fecha_Compra`,
 1 AS `Fecha_Abono`,
 1 AS `Dias_Transcurridos`,
 1 AS `Cartera`,
 1 AS `Vendedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_volumen_ventas`
--

DROP TABLE IF EXISTS `vw_volumen_ventas`;
/*!50001 DROP VIEW IF EXISTS `vw_volumen_ventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_volumen_ventas` AS SELECT 
 1 AS `Bodega`,
 1 AS `Año`,
 1 AS `Marca`,
 1 AS `Codigo`,
 1 AS `Producto`,
 1 AS `Modelo`,
 1 AS `Volumen_Ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_compras_cliente_promedio`
--

DROP TABLE IF EXISTS `vw_compras_cliente_promedio`;
/*!50001 DROP VIEW IF EXISTS `vw_compras_cliente_promedio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_compras_cliente_promedio` AS SELECT 
 1 AS `Año`,
 1 AS `Cliente`,
 1 AS `Valor_Ventas`,
 1 AS `Comprasd_Clientes`,
 1 AS `Promedio_venta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_cli_informacion_cliente`
--

DROP TABLE IF EXISTS `vw_cli_informacion_cliente`;
/*!50001 DROP VIEW IF EXISTS `vw_cli_informacion_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cli_informacion_cliente` AS SELECT 
 1 AS `id_cliente`,
 1 AS `cuenta`,
 1 AS `fecha`,
 1 AS `descripcion`,
 1 AS `direccion`,
 1 AS `ciudad`,
 1 AS `telefono`,
 1 AS `nit`,
 1 AS `correo`,
 1 AS `ruta_entrega`,
 1 AS `credito_clien`,
 1 AS `dias_credito`,
 1 AS `monto_credito`,
 1 AS `vendedor`,
 1 AS `operador`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_volumen_ventas_popularidad`
--

DROP TABLE IF EXISTS `vw_volumen_ventas_popularidad`;
/*!50001 DROP VIEW IF EXISTS `vw_volumen_ventas_popularidad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_volumen_ventas_popularidad` AS SELECT 
 1 AS `Bodega`,
 1 AS `Año`,
 1 AS `Marca`,
 1 AS `Codigo`,
 1 AS `Producto`,
 1 AS `Modelo`,
 1 AS `Volumen_Ventas`,
 1 AS `Promedio_cliente_ventas`,
 1 AS `Popularidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_cartera_clientes_saldos`
--

/*!50001 DROP VIEW IF EXISTS `vw_cartera_clientes_saldos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cartera_clientes_saldos` AS select `est`.`descripcion` AS `Estado`,`a`.`cliente` AS `cliente`,`a`.`valor` AS `Monto_Venta`,`a`.`abono` AS `Monto_Abono`,`a`.`saldo` AS `Saldo_Actual`,round((`a`.`valor` * 0.15),2) AS `Comision_venta`,round((`a`.`saldo` / `a`.`valor`),2) AS `Porcentaje_Deuda`,cast(`a`.`fecha` as date) AS `Fecha_Compra`,cast(`renc`.`fecha` as date) AS `Fecha_Abono`,timestampdiff(DAY,`a`.`fecha`,`renc`.`fecha`) AS `Dias_Transcurridos`,(case when (timestampdiff(DAY,`a`.`fecha`,`renc`.`fecha`) <= 30) then 'Cartera Normal' when (timestampdiff(DAY,`a`.`fecha`,`renc`.`fecha`) <= 60) then 'Cartera Atrasada' else 'Cartera Dificil' end) AS `Cartera`,`us`.`descripcion` AS `Vendedor` from ((((((`cc_factura_encabezado` `a` join `cc_recibo_detalle` `rdet` on((`a`.`id_factura_encabezado` = `rdet`.`id_factura_encabezado`))) join `cc_recibo_encabezado` `renc` on((`rdet`.`id_encabezado_recibo` = `renc`.`id_recibo_encabezado`))) join `cli_cliente` `cli` on((`a`.`id_cliente` = `cli`.`id_cliente`))) join `sys_usuarios` `us` on((`a`.`id_vendedor` = `us`.`id_entidad`))) join `sys_ciudad` `cit` on((`cli`.`id_ciudad` = `cit`.`id_ciudad`))) join `sys_estado` `est` on((`cit`.`id_estado` = `est`.`id_estado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_volumen_ventas`
--

/*!50001 DROP VIEW IF EXISTS `vw_volumen_ventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_volumen_ventas` AS select `f`.`descripcion` AS `Bodega`,year(`b`.`fecha`) AS `Año`,`d`.`descripcion` AS `Marca`,`c`.`codigo_producto` AS `Codigo`,`c`.`descripcion` AS `Producto`,`e`.`descripcion` AS `Modelo`,sum(`a`.`cantidad`) AS `Volumen_Ventas` from (((((`cc_factura_detalle` `a` join `cc_factura_encabezado` `b` on((`a`.`id_factura_encabezado` = `b`.`id_factura_encabezado`))) join `opr_codigo_producto` `c` on((`a`.`id_codigo_producto` = `c`.`id_codigo_producto`))) join `opr_marca` `d` on((`c`.`id_marca` = `d`.`id_marca_producto`))) join `opr_modelo` `e` on((`c`.`id_modelo` = `e`.`id_modelo`))) join `opr_bodega` `f` on((`a`.`id_bodega` = `f`.`id_bodega`))) group by year(`b`.`fecha`),`a`.`id_codigo_producto` order by sum(`a`.`cantidad`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_compras_cliente_promedio`
--

/*!50001 DROP VIEW IF EXISTS `vw_compras_cliente_promedio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_compras_cliente_promedio` AS select year(`b`.`fecha`) AS `Año`,`c`.`descripcion` AS `Cliente`,sum(`a`.`valor`) AS `Valor_Ventas`,count(`b`.`id_factura_encabezado`) AS `Comprasd_Clientes`,(round((sum(`a`.`valor`) / `d`.`Valor_Ventas_anio`),4) * 100) AS `Promedio_venta` from (((`cc_factura_detalle` `a` join `cc_factura_encabezado` `b` on((`a`.`id_factura_encabezado` = `b`.`id_factura_encabezado`))) join `cli_cliente` `c` on((`b`.`id_cliente` = `c`.`id_cliente`))) join (select year(`b`.`fecha`) AS `anio`,sum(`a`.`valor`) AS `Valor_Ventas_anio` from ((`cc_factura_detalle` `a` join `cc_factura_encabezado` `b` on((`a`.`id_factura_encabezado` = `b`.`id_factura_encabezado`))) join `cli_cliente` `c` on((`b`.`id_cliente` = `c`.`id_cliente`))) group by year(`b`.`fecha`) order by `Valor_Ventas_anio` desc) `d` on((year(`b`.`fecha`) = `d`.`anio`))) group by `b`.`id_cliente` order by `Comprasd_Clientes` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cli_informacion_cliente`
--

/*!50001 DROP VIEW IF EXISTS `vw_cli_informacion_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cli_informacion_cliente` AS select `a`.`id_cliente` AS `id_cliente`,`a`.`cuenta` AS `cuenta`,date_format(`a`.`fecha`,'%d/%m/%y') AS `fecha`,`a`.`descripcion` AS `descripcion`,`a`.`direccion` AS `direccion`,`b`.`descripcion` AS `ciudad`,`a`.`telefono` AS `telefono`,`a`.`nit` AS `nit`,`a`.`correo` AS `correo`,`c`.`descripcion` AS `ruta_entrega`,if((`a`.`credito` = 'N'),'No tine Credito','Cliente tiene Credito') AS `credito_clien`,`a`.`dias_credito` AS `dias_credito`,`a`.`monto_credito` AS `monto_credito`,`d`.`descripcion` AS `vendedor`,`e`.`descripcion` AS `operador`,if((`a`.`estado_registro` = 'A'),'Activo','Baja') AS `estado` from ((((`cli_cliente` `a` join `sys_ciudad` `b` on((`a`.`id_ciudad` = `b`.`id_ciudad`))) join `opr_ruta_entrega` `c` on((`a`.`id_ruta_entrega` = `c`.`id_ruta_entrega`))) join `sys_usuarios` `d` on((`a`.`id_vendedor` = `d`.`id_entidad`))) join `sys_usuarios` `e` on((`a`.`id_operador` = `e`.`id_entidad`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_volumen_ventas_popularidad`
--

/*!50001 DROP VIEW IF EXISTS `vw_volumen_ventas_popularidad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_volumen_ventas_popularidad` AS select `f`.`descripcion` AS `Bodega`,year(`b`.`fecha`) AS `Año`,`d`.`descripcion` AS `Marca`,`c`.`codigo_producto` AS `Codigo`,`c`.`descripcion` AS `Producto`,`e`.`descripcion` AS `Modelo`,sum(`a`.`cantidad`) AS `Volumen_Ventas`,concat(round(((count(`b`.`id_cliente`) / `g`.`Total_Año`) * 100),2),'%') AS `Promedio_cliente_ventas`,(case when ((count(`b`.`id_cliente`) / `g`.`Total_Año`) >= 0.8) then 'Muy Popular' when ((count(`b`.`id_cliente`) / `g`.`Total_Año`) >= 0.6) then 'Popular' when ((count(`b`.`id_cliente`) / `g`.`Total_Año`) >= 0.4) then 'Promedio' when ((count(`b`.`id_cliente`) / `g`.`Total_Año`) < 0.4) then 'Poco Popular' end) AS `Popularidad` from ((((((`cc_factura_detalle` `a` join `cc_factura_encabezado` `b` on((`a`.`id_factura_encabezado` = `b`.`id_factura_encabezado`))) join `opr_codigo_producto` `c` on((`a`.`id_codigo_producto` = `c`.`id_codigo_producto`))) join `opr_marca` `d` on((`c`.`id_marca` = `d`.`id_marca_producto`))) join `opr_modelo` `e` on((`c`.`id_modelo` = `e`.`id_modelo`))) join `opr_bodega` `f` on((`a`.`id_bodega` = `f`.`id_bodega`))) join (select year(`b`.`fecha`) AS `Anio`,`a`.`id_codigo_producto` AS `Id_producto`,count(`b`.`id_cliente`) AS `Total_Año` from (`cc_factura_detalle` `a` join `cc_factura_encabezado` `b` on((`a`.`id_factura_encabezado` = `b`.`id_factura_encabezado`))) group by year(`b`.`fecha`)) `g` on((year(`b`.`fecha`) = `g`.`Anio`))) group by `a`.`id_codigo_producto` order by count(`b`.`id_cliente`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-19 21:24:53
