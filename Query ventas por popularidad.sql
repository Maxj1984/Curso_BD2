-- volumen de ventas y popularidad
select
f.descripcion as Bodega
,year(b.fecha) as Año
,d.descripcion as Marca
,a.id_codigo_producto as Codigo
,c.descripcion as Producto
,e.descripcion as Modelo
,sum(a.cantidad) as Volumen_Ventas
,concat(ROUND((count(b.id_cliente)/ g.Total_año)*100,2), "%") as Promedio_cliente_ventas
, (case 
when (count(b.id_cliente)/ g.Total_año) >= 0.8 then "Muy Popular"
when (count(b.id_cliente)/ g.Total_año) >= 0.6 then "Popular"
when (count(b.id_cliente)/ g.Total_año) >= 0.4 then "Promedio"
when (count(b.id_cliente)/ g.Total_año) < 0.4 then "Poco Popular"
end) as Popularidad 
from cc_factura_detalle a
join cc_factura_encabezado b on a.id_factura_encabezado = b.id_factura_encabezado
join opr_codigo_producto c on a.id_codigo_producto = c.id_codigo_producto
join opr_marca d on c.id_marca= d.id_marca_producto
join opr_modelo e on c.id_modelo = e.id_modelo
join opr_bodega f on a.id_bodega = f.id_bodega
join
(
select
year(b.fecha) as Anio
,a.id_codigo_producto as Id_producto
,count(b.id_cliente) as Total_Año
from cc_factura_detalle a
join cc_factura_encabezado b on a.id_factura_encabezado = b.id_factura_encabezado
group by year(b.fecha)
) g on year(b.fecha) = g.anio
-- where year(b.fecha)=2021
group by a.id_codigo_producto
order by count(b.id_cliente) desc;

select * from vw_volumen_ventas_popularidad;