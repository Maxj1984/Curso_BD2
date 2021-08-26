-- Desarrollar una vista que muestre la suma del valor de las compras realizadas, la cantidad de compras 
-- y promedio del valor de las de compras que han realizado los clientes 
-- vista compras y promedio compras
select
year(b.fecha) as Año
,c.descripcion as Cliente
,sum(a.valor) as Valor_Ventas
,count(b.id_factura_encabezado) as Comprasd_Clientes
,(round((sum(a.valor)/d.Valor_Ventas_anio),4))*100 as Promedio_venta
from cc_factura_detalle a
join cc_factura_encabezado b on a.id_factura_encabezado = b.id_factura_encabezado
join cli_cliente c on b.id_cliente = c.id_cliente
join
(select
year(b.fecha) as anio
,sum(a.valor) as Valor_Ventas_anio
from cc_factura_detalle a
join cc_factura_encabezado b on a.id_factura_encabezado = b.id_factura_encabezado
join cli_cliente c on b.id_cliente = c.id_cliente
group by year(b.fecha)
order by Valor_Ventas_anio desc) d on year(b.fecha)= d.anio
group by b.id_cliente
order by Comprasd_Clientes desc;


select
year(b.fecha)
,sum(a.valor) as Valor_Ventas_anio
from cc_factura_detalle a
join cc_factura_encabezado b on a.id_factura_encabezado = b.id_factura_encabezado
join cli_cliente c on b.id_cliente = c.id_cliente
group by year(b.fecha)
order by Valor_Ventas_anio desc;