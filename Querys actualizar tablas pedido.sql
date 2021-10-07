-- insert masivo en pedido encabezado
insert into opr_pedido_encabezado(id_cliente,descripcion,valor)

select
	id_cliente
    ,cliente
    , 0  as valor
from cc_factura_encabezado
limit 100;

-- insert masivo en pedido detalle
insert into opr_pedido_detalle
select
	0 as id_pedido_detalle
	,id_detalle_factura as id_pedido_encabezado
    ,id_codigo_producto
    ,descripcion
    ,cantidad
    ,valor_unitario as precio_venta
    ,valor
from cc_factura_detalle
where id_detalle_factura>500 and id_detalle_factura<600;


-- actualizar el id de pedido encabezado en la tabla detalle pedido
update opr_pedido_detalle set id_pedido_encabezado=id_pedido_encabezado-500 where id_pedido_encabezado>1;

-- update masivo del valor pedido encabezado en base a su tabla detalle

update opr_pedido_encabezado a join opr_pedido_detalle b on a.id_pedido_encabezado=b.id_pedido_encabezado
	set a.valor = b.valor;