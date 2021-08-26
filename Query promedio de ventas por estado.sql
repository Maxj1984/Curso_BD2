/*****Estado*****/
SELECT
    f.descripcion as nombre_estado
    ,Concat(ROUND((SUM(IF(month(c.fecha)=1,a.valor,0))/ ( SELECT SUM( valor ) FROM cc_factura_detalle ) * 100 ),2 ),'%') AS ENERO
    ,Concat(ROUND((SUM(IF(month(c.fecha)=2,a.valor,0))/ ( SELECT SUM( valor ) FROM cc_factura_detalle ) * 100 ),2 ),'%') AS FEBRERO
    ,Concat(ROUND((SUM(IF(month(c.fecha)=3,a.valor,0))/ ( SELECT SUM( valor ) FROM cc_factura_detalle ) * 100 ),2 ),'%') AS MARZO
    ,Concat(ROUND((SUM(IF(month(c.fecha)=4,a.valor,0))/ ( SELECT SUM( valor ) FROM cc_factura_detalle ) * 100 ),2 ),'%') AS ABRIL
    ,Concat(ROUND((SUM(IF(month(c.fecha)=5,a.valor,0))/ ( SELECT SUM( valor ) FROM cc_factura_detalle ) * 100 ),2 ),'%') AS MAYO
    ,Concat(ROUND((SUM(IF(month(c.fecha)=6,a.valor,0))/ ( SELECT SUM( valor ) FROM cc_factura_detalle ) * 100 ),2 ),'%') AS JUNIO
    ,Concat(ROUND((SUM(IF(month(c.fecha)=7,a.valor,0))/ ( SELECT SUM( valor ) FROM cc_factura_detalle ) * 100 ),2 ),'%') AS JULIO
    ,Concat(ROUND((SUM(IF(month(c.fecha)=8,a.valor,0))/ ( SELECT SUM( valor ) FROM cc_factura_detalle ) * 100 ),2 ),'%') AS AGOSTO
    ,Concat(ROUND((SUM(IF(month(c.fecha)=9,a.valor,0))/ ( SELECT SUM( valor ) FROM cc_factura_detalle ) * 100 ),2 ),'%') AS SEPTIEMBRE
    ,Concat(ROUND((SUM(IF(month(c.fecha)=10,a.valor,0))/ ( SELECT SUM( valor ) FROM cc_factura_detalle ) * 100 ),2 ),'%') AS OCTUBRE
    ,Concat(ROUND((SUM(IF(month(c.fecha)=11,a.valor,0))/ ( SELECT SUM( valor ) FROM cc_factura_detalle ) * 100 ),2 ),'%') AS NOVIEMBRE
    ,Concat(ROUND((SUM(IF(month(c.fecha)=12,a.valor,0))/ ( SELECT SUM( valor ) FROM cc_factura_detalle ) * 100 ),2 ),'%') AS DICIEMBRE
    ,Concat(ROUND(
         ( sum(a.valor) / ( SELECT SUM( valor ) FROM cc_factura_detalle ) * 100 ),
         2 
       ),'%') as porcentaje_producto
	,sum(a.valor) as total_vendido_por_producto_por_año -- este campo como referencia para que salgan de duda 
    ,(SELECT SUM( valor ) FROM cc_factura_detalle) AS ventas_totales_por_año -- y asi ven que el porcentaje esta bien, la formula que use fue (total_vendido_por_producto_por_año/ventas_totales_por_año)*100
FROM
	cc_factura_detalle a
JOIN 
	opr_codigo_producto b ON a.id_codigo_producto=b.id_codigo_producto
JOIN 
	opr_marca m ON b.id_marca = m.id_marca_producto
JOIN 
	cc_factura_encabezado c ON a.id_factura_encabezado=c.id_factura_encabezado
JOIN 
	cli_cliente d ON c.id_cliente=d.id_cliente
JOIN 
	sys_ciudad e ON d.id_ciudad=e.id_ciudad
JOIN 
	sys_estado f ON e.id_estado=f.id_estado
WHERE year(c.fecha) = 2021
GROUP BY f.id_estado
ORDER BY nombre_estado
;