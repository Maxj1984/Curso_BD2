
select
f.descripcion as Bodega
,year(b.fecha) as Año
,d.descripcion as Marca
,a.id_codigo_producto as Codigo
,c.descripcion as Producto
,e.descripcion as Modelo
,sum(a.cantidad) as Volumen_Ventas
from cc_factura_detalle a
join cc_factura_encabezado b on a.id_factura_encabezado = b.id_factura_encabezado
join opr_codigo_producto c on a.id_codigo_producto = c.id_codigo_producto
join opr_marca d on c.id_marca= d.id_marca_producto
join opr_modelo e on c.id_modelo = e.id_modelo
join opr_bodega f on a.id_bodega = f.id_bodega

group by year(b.fecha), a.id_codigo_producto
order by sum(a.cantidad) desc;

select * from vw_volumen_ventas;

-- select * from cc_factura_encabezado;

