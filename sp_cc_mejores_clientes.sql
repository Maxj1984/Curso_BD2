CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cc_mejores_clientes`()
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
        set @mensaje_error = concat('Ocurrió una ', @tipo,' número',@numero,' , estado del error',@estado,' Mensaje: ',@mensaje); -- se construye un mensaje de error con los datos obtenidos
        select @mensaje_error; 
		rollback;
	 end;
     
start transaction;
CREATE TEMPORARY TABLE IF NOT EXISTS mejores_clientes (id_cliente int,descripcion varchar(75),valor decimal(10,2), abono decimal(10,2), porcentaje decimal(10,2), numero_compras int); 
	TRUNCATE TABLE mejores_clientes;
    
	 OPEN clientes;
      clientes_ciclo : LOOP
		FETCH clientes INTO idCliente, totalVenta;
        IF salir THEN 
			CLOSE clientes;
            LEAVE clientes_ciclo; 
		END IF;
        
        INSERT INTO mejores_clientes
        SELECT 
			a.id_cliente
			,b.descripcion
			,sum(a.valor)
			,sum(a.abono)
			,cast(((sum(a.abono)/sum(a.valor))*100) as decimal(10,2))
			,count( a.id_cliente)
		FROM cc_factura_encabezado a
		join cli_cliente b on a.id_cliente = b.id_cliente
        where a.id_cliente=idCliente
		Group by a.id_cliente;
	
    END LOOP clientes_ciclo;
    
    SELECT * FROM mejores_clientes
    where numero_compras >= 6 and porcentaje>=70
    order by porcentaje desc, numero_compras desc
    limit 100;
    
END