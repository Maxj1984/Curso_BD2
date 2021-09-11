CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cc_consulta_productos`(in campo varchar(75), in valor_campo varchar(75), in tipo char(1))
BEGIN
	set @vistasql :="
	select
		a.id_codigo_producto as id_codigo_producto
		,a.fecha as fecha
		,a.codigo_producto
		,a.descripcion as Descripcion
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
		) tot on a.id_codigo_producto = tot.codigo_prod";
        
if tipo='C' then
	set @where_sql := concat(' where ',campo," like '%",valor_campo,"%'");
else
	if tipo='R' then
		set @where_sql:=concat('where ',campo,' between ',valor_campo);
	else
		set @where_sql:=concat('where date(',campo,')',' between ',valor_campo);
	end if;
end if;
	
set @cmdsql:=concat(@vistasql,' ',@where_sql);

PREPARE sqlstmt from @cmdsql;
EXECUTE sqlstmt;
DEALLOCATE PREPARE sqlstmt;

END