-- Valida Nit
DROP FUNCTION IF EXISTS Func_nit;

DELIMITER $$

CREATE FUNCTION Func_nit(
	nit int -- nombre de la variable a trabajar
) 
RETURNS varchar(20)
DETERMINISTIC
BEGIN

	DECLARE fun_tamaño int; -- variable para validar el tamaño del nit
	DECLARE msg varchar(20); -- mensaje a responder si es valido o invalido
    -- declaramos las posiciones del nit para poder trabajar despues
	DECLARE pos_1 int;
	DECLARE pos_2 int;
	DECLARE pos_3 int;
	DECLARE pos_4 int;
	DECLARE pos_5 int;
	DECLARE pos_6 int;
	DECLARE pos_7 int;
	DECLARE pos_8 int;
    
	DECLARE sum_res int; -- suma del resultado de las posiciones de la numeracion del nit 
	DECLARE divi_res int; -- division para resultado de la suma de las posiciones del nit 
	DECLARE mult_res int; -- multiplicacion de la division del resultado
	DECLARE rest_res int; -- resta del resultado 
    
    DECLARE res_div int; -- el resultado de la resta lo dividimos
	DECLARE res_mult int;  -- el resultado de la resta lo multiplicamos
	DECLARE res_rest int; -- resultado de la resata de la multiplicacion 
	
    DECLARE res_fin int; -- este es especial para la numeracion que no es 0
    
    -- 76983420
    -- 73809454 
    
    SET fun_tamaño = (SELECT LENGTH(nit)); -- le asignamos un tamaño a la funcion tamaño 
	-- evaluamos si el tamaño es al menos de 8 
    IF (fun_tamaño != 8) then
		-- si el tamaño no coincide con los 8 caracteres seteamos el mensaje en invalido
		SET msg = "invalido";
	ELSE 
		-- si el tamaño coincide con los 8 caracteres, asignamos la posicion del nit
		SET pos_1 = substr(nit,1,1);
		SET pos_2 = substr(nit,2,1);
		SET pos_3 = substr(nit,3,1);
		SET pos_4 = substr(nit,4,1);
		SET pos_5 = substr(nit,5,1);
		SET pos_6 = substr(nit,6,1);
		SET pos_7 = substr(nit,7,1);
		SET pos_8 = substr(nit,8,1);
		-- realizamos las operaciones correspondientes para el resultado 
        SET sum_res = ((pos_7*2)+(pos_6*3)+(pos_5*4)+(pos_4*5)+(pos_3*6)+(pos_2*7)+(pos_1*8));
        SET divi_res = truncate(sum_res/11,0); -- usamos truncate para obtener el valor entero del decimal de la division
        SET mult_res = divi_res*11;
        SET rest_res = sum_res-mult_res;
        -- el resultado anterior lo volvemos a evaluar 
        SET res_div = truncate(rest_res/11,0); -- usamos truncate para obtener el valor entero del decimal de la division
        SET res_mult= res_div*11;
        SET res_rest= rest_res-res_mult;
        
        SET res_fin = 11-res_rest;
        -- si el ultimo numero dle nit es 0 no usamos la ultima operacion porque no coincide o 0 no afecta a la ultima operacion
        IF ( pos_8 = 0 ) THEN
			-- decimos que si el resultado de la resta es igual a la ultima pocision entonces seteamos los mensajes 
			IF (res_rest = pos_8) THEN
				SET msg = CONCAT("valido ");
			ELSE
				SET msg =  CONCAT("invvalido ");
			END IF ;
		ELSE -- si el ultimo numero del nit es diferente a 0 entonces si puede afectar el resultado final
			IF (res_fin= pos_8) THEN
				SET msg = CONCAT("valido ");
			ELSE
				SET msg =  CONCAT("invvalido ");
			END IF ;
        END IF;
    END IF;
RETURN (msg);
END$$
DELIMITER ;

select Func_nit(904945);