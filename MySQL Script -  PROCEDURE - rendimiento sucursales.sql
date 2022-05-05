USE `sql_coderhouse_narvaja_santiago`;
DROP PROCEDURE IF EXISTS `rendimiento_sucursales`;

DELIMITER //
CREATE PROCEDURE `rendimiento_sucursales` (IN param1_orden VARCHAR(25) , IN param2 VARCHAR(1))
BEGIN 	
	IF param1_orden = 'sucursal' THEN 
		SET @orden = CONCAT('ORDER BY ' , 'sucursal');
	ELSE IF param1_orden = 'compras' THEN 
		SET @orden = CONCAT('ORDER BY ' , 'cantidad_compras');
	ELSE IF param1_orden = 'clientes' THEN 
		SET @orden = CONCAT('ORDER BY ' , 'cantidad_clientes');
	ELSE 
		SET @orden = CONCAT('ORDEn BY ' , 'compras_por_cliente');
        END IF;
        END IF;
        END IF;
	IF param2 = 'd' THEN 
		SET @jerarquia = CONCAT(' DESC');
	ELSE 
		SET @jerarquia = CONCAT(' ASC');
		END IF;
    
SET @clausula = CONCAT('SELECT 
sucursal ,
COUNT(DISTINCT(numero_ticket)) AS cantidad_compras ,
COUNT(DISTINCT(id_cliente)) AS cantidad_clientes ,
(COUNT(DISTINCT(numero_ticket)) / COUNT(DISTINCT(id_cliente)) ) AS compras_por_cliente
FROM sql_coderhouse_narvaja_santiago.detalle_compra
GROUP BY sucursal ' , @orden , @jerarquia);

PREPARE ejecutarSQL FROM @clausula;
EXECUTE ejecutarSQL;
DEALLOCATE PREPARE ejecutarSQL;
END//

DELIMITER ;