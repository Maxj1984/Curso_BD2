-- por productos 
SET lc_time_names = 'es_ES';

SELECT
    b.descripcion as nombre_producto
    ,SUM(IF(month(c.fecha)=1,a.cantidad,0)) AS ENERO
    ,SUM(IF(month(c.fecha)=2,a.cantidad,0)) AS FEBRERO
    ,SUM(IF(month(c.fecha)=3,a.cantidad,0)) AS MARZO
    ,SUM(IF(month(c.fecha)=4,a.cantidad,0)) AS ABRIL
    ,SUM(IF(month(c.fecha)=5,a.cantidad,0)) AS MAYO
    ,SUM(IF(month(c.fecha)=6,a.cantidad,0)) AS JUNIO
    ,SUM(IF(month(c.fecha)=7,a.cantidad,0)) AS JULIO
    ,SUM(IF(month(c.fecha)=8,a.cantidad,0)) AS AGOSTO
    ,SUM(IF(month(c.fecha)=9,a.cantidad,0)) AS SEPTIEMBRE
    ,SUM(IF(month(c.fecha)=10,a.cantidad,0)) AS OCTUBRE
    ,SUM(IF(month(c.fecha)=11,a.cantidad,0)) AS NOVIEMBRE
    ,SUM(IF(month(c.fecha)=12,a.cantidad,0)) AS DICIEMBRE
    ,sum(a.cantidad) as total_vendido
FROM
	cc_factura_detalle a
JOIN 
	opr_codigo_producto b ON a.id_codigo_producto=b.id_codigo_producto
JOIN 
	opr_marca m ON b.id_marca = m.id_marca_producto
JOIN 
	cc_factura_encabezado c ON a.id_factura_encabezado=c.id_factura_encabezado
WHERE year(c.fecha) = 2020
GROUP BY codigo_producto
ORDER BY nombre_producto
;