USE `sql_coderhouse_narvaja_santiago`;
DROP PROCEDURE IF EXISTS `articulos_top`;

DELIMITER //
CREATE PROCEDURE `articulos_top` (IN param1_total VARCHAR(25))
BEGIN 
	IF param1_total = 'ingresos' THEN
		SET @ordenar = CONCAT('ORDER BY ' , 'total_ingresos');
	ELSE IF param1_total  = 'unidades' THEN
		SET @ordenar =  CONCAT('ORDER BY ' , 'total_unidades');
	ELSE 
		SET @ordenar =  CONCAT('ORDER BY ' , 'precio');
	        END IF;
            END IF;
        
SET @clausula = 
				CONCAT( 'SELECT id_articulo , articulo , SUM(total_unidades) AS total_unidades , TRUNCATE(SUM(precio), 3) AS total_ingresos , precio
FROM sql_coderhouse_narvaja_santiago.detalle_compra
GROUP BY id_articulo ' ,
@ordenar , ' DESC
LIMIT 10');

PREPARE ejecutarSQL FROM @clausula;
EXECUTE ejecutarSQL;
DEALLOCATE PREPARE ejecutarSQL;
END//

DELIMITER ;