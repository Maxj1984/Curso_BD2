-- total de ventas por ciudad 
select
	c.descripcion as ciudad
    ,sum(a.valor) as total
from cc_factura_encabezado a
join cli_cliente b on a.id_cliente = b.id_cliente
join sys_ciudad c on b.id_ciudad = c.id_ciudad
where year(a.fecha) ='2021'
group by b.id_ciudad
order by total desc
;

call sp_cc_total_ventas_ciudad('2021-01-01', '2021-03-31');

-- total de ventas por estado
select
	d.descripcion as Estado
    ,sum(a.valor) as total
from cc_factura_encabezado a
join cli_cliente b on a.id_cliente = b.id_cliente
join sys_ciudad c on b.id_ciudad = c.id_ciudad
join sys_estado d on c.id_estado = d.id_estado
where year(a.fecha) ='2021'
group by d.id_estado
order by total desc;

call sp_cc_total_ventas_estado('2021-01-01', '2021-03-31');


-- total de ventas por año y rango de fecha

select
	c.descripcion as ciudad
    ,d.total_año
    ,sum(a.valor) as total
from cc_factura_encabezado a
join cli_cliente b on a.id_cliente = b.id_cliente
join sys_ciudad c on b.id_ciudad = c.id_ciudad
join (
select
	b.id_ciudad
	,c.descripcion as ciudad
    ,sum(a.valor) as total_año
from cc_factura_encabezado a
join cli_cliente b on a.id_cliente = b.id_cliente
join sys_ciudad c on b.id_ciudad = c.id_ciudad
where year(a.fecha) ='2021'
group by b.id_ciudad
) as d on c.id_ciudad = d.id_ciudad
where a.fecha >= '2021-01-01' and a.fecha<='2021-03-31'
group by b.id_ciudad
order by total desc;
call sp_cc_total_ventas_ciudad('2021-01-01', '2021-03-31');
call sp_cc_comparativo_rango_fecha('2021-01-01', '2021-03-31');


select
	b.id_ciudad
	,c.descripcion as ciudad
    ,sum(a.valor) as total_año
from cc_factura_encabezado a
join cli_cliente b on a.id_cliente = b.id_cliente
join sys_ciudad c on b.id_ciudad = c.id_ciudad
where year(a.fecha) ='2021'
group by b.id_ciudad
order by total_año desc;



-- total de ventas por año y rango de fecha

select
	c.descripcion as ciudad
    ,d.total_año 
    ,sum(a.valor) as total
    ,(sum(a.valor) /d.total_año) as porcentaje
from cc_factura_encabezado a
join cli_cliente b on a.id_cliente = b.id_cliente
join sys_ciudad c on b.id_ciudad = c.id_ciudad
join (
select
	b.id_ciudad
	,c.descripcion as ciudad
    ,sum(a.valor) as total_año
from cc_factura_encabezado a
join cli_cliente b on a.id_cliente = b.id_cliente
join sys_ciudad c on b.id_ciudad = c.id_ciudad
where year(a.fecha) ='2021'
group by b.id_ciudad
) as d on c.id_ciudad = d.id_ciudad
where a.fecha >= '2021-01-01' and a.fecha<='2021-03-31'
group by b.id_ciudad
order by total desc;


-- total de ventas por año y rango de fecha

select
	b.descripcion as cliente
    ,d.total_año 
    ,sum(a.valor) as total
    ,(sum(a.valor) /d.total_año) as porcentaje
from cc_factura_encabezado a
join cli_cliente b on a.id_cliente = b.id_cliente
join sys_ciudad c on b.id_ciudad = c.id_ciudad
join (
select
	b.id_ciudad
	,c.descripcion as ciudad
    ,sum(a.valor) as total_año
from cc_factura_encabezado a
join cli_cliente b on a.id_cliente = b.id_cliente
join sys_ciudad c on b.id_ciudad = c.id_ciudad
where year(a.fecha) ='2021'
group by b.id_ciudad
) as d on c.id_ciudad = d.id_ciudad
where a.fecha >= '2021-01-01' and a.fecha<='2021-03-31'
group by b.id_cliente
order by total desc;
