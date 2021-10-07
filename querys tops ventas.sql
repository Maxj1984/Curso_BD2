-- Top 3 Vendedores por rango de fecha
select
year(a.fecha) as Fecha 
,b.descripcion
, sum(a.valor) as Total_Ventas
from cc_factura_encabezado a
join sys_usuarios b on a.id_operador = b.id_entidad
where a.fecha >= '2020-01-01' and a.fecha<='2020-01-15'
group by b.id_entidad
order by sum(a.valor) desc
limit 3;


-- Top 20 Productos por rango de fecha
select
c.descripcion
,sum(a.valor) as Total_Ventas
from cc_factura_detalle a
join cc_factura_encabezado b on a.id_factura_encabezado = b.id_factura_encabezado
join opr_codigo_producto c on a.id_codigo_producto = c.id_codigo_producto
where b.fecha >= '2020-01-01' and b.fecha<='2020-01-15'
group by c.id_codigo_producto
order by sum(a.valor) desc
limit 3;

-- Top Vendedores por producto por rango de fecha
select
c.descripcion
,sum(a.valor) as Total_Ventas
from cc_factura_detalle a
join cc_factura_encabezado b on a.id_factura_encabezado = b.id_factura_encabezado
join opr_codigo_producto c on a.id_codigo_producto = c.id_codigo_producto
where b.fecha >= '2020-01-01' and b.fecha<='2020-01-15'
group by c.id_codigo_producto
order by sum(a.valor) desc
limit 10;