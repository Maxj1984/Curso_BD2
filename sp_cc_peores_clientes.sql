CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cc_peores_clientes`(in campo varchar(75),in valor_campo varchar(75), in tipo char(1))
BEGIN
declare salir boolean default false;
declare idCliente INT DEFAULT 0;
DECLARE totalVenta DECIMAL(10,2) DEFAULT 0.00;

DECLARE clientes CURSOR FOR
        SELECT
			id_cliente
			,sum(valor) AS Total_Ventas
		FROM cc_factura_encabezado
		group by id_cliente
		order by Total_Ventas desc;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET salir = TRUE;

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
        set @mensaje_error = concat('Ocurrió una ', @tipo,' número ',@numero,' , estado del error ',@estado,' Mensaje:  ',@mensaje); -- se construye un mensaje de error con los datos obtenidos
        select @mensaje_error; 
		rollback;
	 end;
     
start transaction;
CREATE TEMPORARY TABLE IF NOT EXISTS peores_clientes (id_cliente int,descripcion varchar(75),valor decimal(10,2), abono decimal(10,2), porcentaje decimal(10,2), fecha datetime, id_vendedor int,nombre_vendedor varchar(75),id_estado int,nombre_estado varchar(75)); 
	TRUNCATE TABLE peores_clientes;
    
	 OPEN clientes;
      clientes_ciclo : LOOP
		FETCH clientes INTO idCliente, totalVenta;
        IF salir THEN 
			CLOSE clientes;
            LEAVE clientes_ciclo; 
		END IF;
        
        INSERT INTO peores_clientes
        SELECT 
			a.id_cliente
			,b.descripcion
			,sum(a.valor)
			,sum(a.abono)
			,cast(((sum(a.abono)/sum(a.valor))*100) as decimal(10,2))
            ,a.fecha
            ,b.id_vendedor
            ,e.descripcion
            ,d.id_estado
            ,d.descripcion
		FROM cc_factura_encabezado a
		join cli_cliente b on a.id_cliente = b.id_cliente
        join sys_ciudad c on b.id_ciudad=c.id_ciudad
        join sys_estado d on c.id_estado=d.id_estado
        join sys_usuarios e on b.id_vendedor=e.id_entidad
        where a.id_cliente=idCliente
		Group by a.id_cliente;
	
    END LOOP clientes_ciclo;
    
   set @vistasql :="
	SELECT
		id_cliente
        ,descripcion
        ,valor
        ,abono
        ,porcentaje";


	if tipo='E' then
			set @where_sql := concat('
				,nombre_estado FROM peores_clientes
			where porcentaje<=40 and nombre_estado  like "%',valor_campo,'%" 
			order by porcentaje asc, valor desc limit 100;');
			else
			if tipo='V' then
            set @where_sql := concat('
				,nombre_vendedor FROM peores_clientes
			where porcentaje<=40 and nombre_vendedor  like "%',valor_campo,'%" 
			order by porcentaje asc, valor desc limit 100;');
            else
            if tipo='F' then
			set @where_sql:=concat(',fecha FROM peores_clientes 
            where porcentaje<=40 and date(fecha) between "',
            campo,'" and "',valor_campo,'" 
			order by porcentaje asc, valor desc limit 100;');
	end if;
    end if;        
    end if;
    
    set @cmdsql:=concat(@vistasql,' ',@where_sql);

	PREPARE sqlstmt from @cmdsql;
	EXECUTE sqlstmt;
	DEALLOCATE PREPARE sqlstmt;

    
END