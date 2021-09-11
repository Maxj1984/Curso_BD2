CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtros_Multiples`(in buscar varchar(75), in buscar2 varchar(75) )
BEGIN
set buscar2='';
if buscar2 ='' then
select
a.id_codigo_producto as id_codigo_producto
,a.fecha as fecha
,a.codigo_producto
,a.descripcion
,a.codigo_fabricante
,b.descripcion as tipo_producto
,c.descripcion as marca
,d.descripcion as modelo
,a.talla
,a.existencia
,a.precio
,e.descripcion as operador
,(case
when a.estado_registro = 'A' then 'Activo'
when a.estado_registro = 'B' then 'Inactivo'
end) as estado_registro
,tot.total_ventas as Total_Ventas
from opr_codigo_producto a
join opr_tipo_producto b on a.id_tipo_producto = b.id_tipo_producto
join opr_marca c on a.id_marca=c.id_marca_producto
join opr_modelo d on a.id_modelo = d.id_modelo
join sys_usuarios e on a.id_operador = e.id_entidad
join
(
select
a.id_codigo_producto as codigo_prod
, a.descripcion as descrip_produc
,sum(a.valor) as total_ventas
from cc_factura_detalle a
join cc_factura_encabezado b on a.id_factura_encabezado = b.id_factura_encabezado
group by a.id_codigo_producto
) tot on a.id_codigo_producto = tot.codigo_prod
where a.descripcion like buscar or
a.codigo_fabricante like buscar or
b.descripcion like buscar or
c.descripcion like buscar or
d.descripcion like buscar or
a.id_codigo_producto like buscar or
a.codigo_producto like buscar;
end if;

if buscar2 !='' then
select
a.id_codigo_producto as id_codigo_producto
,a.fecha as fecha
,a.codigo_producto
,a.descripcion
,a.codigo_fabricante
,b.descripcion as tipo_producto
,c.descripcion as marca
,d.descripcion as modelo
,a.talla
,a.existencia
,a.precio
,e.descripcion as operador
,(case
when a.estado_registro = 'A' then 'Activo'
when a.estado_registro = 'B' then 'Inactivo'
end) as estado_registro
,tot.total_ventas as Total_Ventas
from opr_codigo_producto a
join opr_tipo_producto b on a.id_tipo_producto = b.id_tipo_producto
join opr_marca c on a.id_marca=c.id_marca_producto
join opr_modelo d on a.id_modelo = d.id_modelo
join sys_usuarios e on a.id_operador = e.id_entidad
join
(
select
a.id_codigo_producto as codigo_prod
, a.descripcion as descrip_produc
,sum(a.valor) as total_ventas
from cc_factura_detalle a
join cc_factura_encabezado b on a.id_factura_encabezado = b.id_factura_encabezado
group by a.id_codigo_producto
) tot on a.id_codigo_producto = tot.codigo_prod
where 
date(a.fecha) >= buscar and date(a.fecha) <= buscar2 or
a.talla between buscar and buscar2 or
a.existencia between buscar and buscar2 or
a.precio between buscar and buscar2;
end if;

END