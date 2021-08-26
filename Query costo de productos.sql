DROP FUNCTION IF EXISTS fn_costo_producto;

DELIMITER $$
create function fn_costo_producto (cod_product int) returns decimal(10,2)
begin
declare Costo decimal(10,2);
select 
round(((sum(valor) - sum(valor_iva)) * 0.18),2) into Costo
from cc_factura_detalle
where id_codigo_producto=cod_product
group by id_codigo_producto
;

return Costo;
END$$
DELIMITER ;


-- calcular costo
select 
a.id_codigo_producto
,c.descripcion
,sum(a.cantidad) as total_vendido
,sum(a.valor) as valor
, (sum(a.valor) - sum(a.valor_iva)) as valor_sin_iva
,round(((sum(a.valor) - sum(a.valor_iva)) * 0.18),2) as Costo
from cc_factura_detalle a
join cc_factura_encabezado b  on a.id_factura_encabezado =b.id_factura_encabezado
join opr_codigo_producto c on a.id_codigo_producto = c.id_codigo_producto
where a.id_codigo_producto=209
group by a.id_codigo_producto;

select fn_costo_producto(209) ;

select 
*
,round(((valor - valor_iva) * 0.18),2) as Costo
from cc_factura_detalle
where id_codigo_producto=209;

select 
a.id_codigo_producto
,a.valor
,a.valor_iva
, (a.valor - a.valor_iva) as total_sin_iva
,round(((a.valor - a.valor_iva) * 0.18),2) as Costo
from cc_factura_detalle a
join cc_factura_encabezado b  on a.id_factura_encabezado =b.id_factura_encabezado
group by a.id_codigo_producto;