select
id_codigo_producto
,descripcion
, precio
, round((precio /1.12),2) as precio_sin_iva
,round((precio /1.12),2)*.18 as ganancia
,precio -(round((precio /1.12),2)*.18) as Costo
from opr_codigo_producto;


select
id_codigo_producto
,descripcion
, precio
, round((precio /1.12),2) as precio_sin_iva
,round((precio /1.12),2)*.18 as ganancia
,fn_costo_producto(id_codigo_producto) as Costo
from opr_codigo_producto;
