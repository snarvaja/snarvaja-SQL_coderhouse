USE `sql_coderhouse_narvaja_santiago`;
DROP PROCEDURE IF EXISTS `update_suc`;

DELIMITER //
CREATE PROCEDURE `update_suc` (IN param1_zona VARCHAR(30), IN param2_nombre VARCHAR(50))
BEGIN 	
	IF param1_zona = IFNULL((SELECT DISTINCT(region) 
							FROM sql_coderhouse_narvaja_santiago.sucursales
							WHERE region = param1_zona 
							GROUP BY region),'Otro') THEN
		SET @id_suc = (SELECT MAX(id_sucursal)+1 FROM sql_coderhouse_narvaja_santiago.sucursales
WHERE region = param1_zona);
	ELSE 
		SET @id_suc =   (SELECT ((MAX(LEFT(id_sucursal,1))+1)*100)+1 FROM sql_coderhouse_narvaja_santiago.sucursales); 

		END IF;
       
                
   SET @region = param1_zona;
   SET @nombre = param2_nombre;
   SET @clausula = CONCAT('INSERT INTO sql_coderhouse_narvaja_santiago.sucursales (id_sucursal , region , nombre) 

VALUES 
(' , @id_suc, ' , \'' , @region , '\' , \'' , @nombre,'\');');


PREPARE ejecutarSQL FROM @clausula;
EXECUTE ejecutarSQL;
DEALLOCATE PREPARE ejecutarSQL;
END//

DELIMITER ;