CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_opr_kardex_producto`(in idProducto int, fecha_inicial varchar(10), fecha_final varchar(10))
BEGIN
declare saldo_inicial INT;
declare saldo_existencia INT;

DECLARE exit handler for sqlexception, sqlwarning
	begin
		get diagnostics condition 1
			@estado = returned_sqlstate -- status del error
            ,@numero = mysql_errno -- numero de error
            ,@mensaje = message_text; -- mensaje del error
            
		if left(@estado,2) = '01' then -- si el error empieza con 01 el error es una advertencia, sino es una excepcion
			set @tipo = 'ADVERTENCIA';
		else
			set @tipo = 'EXCEPTION';
		end if;
        set @mensaje_error = concat('Ocurrió una ', @tipo,' número',@numero,' , estado del error ',@estado,' Mensaje: ',@mensaje); -- se construye un mensaje de error con los datos obtenidos
        select @mensaje_error; 
		
	 end;

CREATE TEMPORARY TABLE IF NOT EXISTS kardex (fecha varchar(10),codigo_producto int,unidades int,tipo char(1)); 
	TRUNCATE TABLE kardex;

CREATE TEMPORARY TABLE IF NOT EXISTS saldo (codigo int,saldo_inv int); 
TRUNCATE TABLE saldo;

    insert into saldo (codigo,saldo_inv) select id_codigo_producto,existencia from opr_codigo_producto where id_codigo_producto=idProducto;
    
    insert into saldo (codigo,saldo_inv) select a.id_codigo_producto,sum(a.cantidad) as ingreso_existencia from opr_detalle_ingresoinv a 
		join opr_encabezado_ingresoinv b on a.id_encabezado_ingresoInv=b.id_encabezado_ingresoInv 
		where a.id_codigo_producto=idProducto and year(b.fecha)<year(fecha_inicial);
    
    insert into saldo (codigo,saldo_inv)
		select a.id_codigo_producto,sum(a.cantidad) as existencia from opr_detalle_devolucion a 
		join opr_encabezado_devolucion b on a.id_encabezado_devolucion=b.id_encabezado_devolucion 
		where a.id_codigo_producto=idProducto and year(b.fecha)<year(fecha_inicial);

-- ventas
INSERT INTO kardex (fecha,codigo_producto,unidades,tipo)
	select
		date(b.fecha)
		,a.id_codigo_producto
		,a.cantidad
		,'F' as tipo
	from cc_factura_detalle a
	join cc_factura_encabezado b on a.id_factura_encabezado=b.id_factura_encabezado
	where a.id_codigo_producto=idProducto and b.fecha  between fecha_inicial and fecha_final;
    
-- ingresos
INSERT INTO kardex (fecha,codigo_producto,unidades,tipo)
	select 
		date(b.fecha) as fecha
		,a.id_codigo_producto as codigo_producto
		,a.cantidad as unidades
		,'I' as tipo
	from opr_detalle_ingresoinv a 
	join opr_encabezado_ingresoinv b on a.id_encabezado_ingresoInv=b.id_encabezado_ingresoInv
    where a.id_codigo_producto=idProducto and b.fecha  between fecha_inicial and fecha_final;

-- salidas
INSERT INTO kardex (fecha,codigo_producto,unidades,tipo)
	select 
		date(b.fecha) as fecha
		,a.id_codigo_producto as codigo_producto
		,a.cantidad as unidades
		,'S' as tipo
	from opr_detalle_salidainv a 
	join opr_encabezado_salidainv b on a.id_encabezado_salidaInv=b.id_encabezado_salidaInv
    where a.id_codigo_producto=idProducto and b.fecha  between fecha_inicial and fecha_final;

-- devoluciones
INSERT INTO kardex (fecha,codigo_producto,unidades,tipo)
	select 
		date(b.fecha) as fecha
		,a.id_codigo_producto as codigo_producto
		,a.cantidad as unidades
		,'D' as tipo
	from opr_detalle_devolucion a 
	join opr_encabezado_devolucion b on a.id_encabezado_devolucion=b.id_encabezado_devolucion
    where a.id_codigo_producto=idProducto and b.fecha  between fecha_inicial and fecha_final;


select sum(saldo_inv) into saldo_inicial from saldo;
SET @acumulador=saldo_inicial;

select
''Fecha,''Codigo,'Saldo Inicial'Descripcion,''Unidades,''Tipo_Movimiento,saldo_inicial Existencia
union
(select 
	a.fecha
    ,b.codigo_producto
    ,b.descripcion
    ,a.unidades
    ,(case
    when a.tipo='F' then 'Factura Venta'
    when a.tipo='I' then 'Ingreso Inventario'
    when a.tipo='S' then 'Salida Inventario'
    when a.tipo='D' then 'Devolución'
    end)
    ,(case
    when a.tipo='F' then @acumulador:= @acumulador - a.unidades
    when a.tipo='I' then @acumulador:=@acumulador + a.unidades
    when a.tipo='S' then @acumulador:=@acumulador - a.unidades
    when a.tipo='D' then @acumulador:=@acumulador + a.unidades
    end)
from kardex a
join opr_codigo_producto b on a.codigo_producto=b.id_codigo_producto
order by fecha)
union
select
''Fecha,''Codigo,'Saldo Final'Descripcion,''Unidades,''Tipo_Movimiento,@acumulador Existencia
;
END