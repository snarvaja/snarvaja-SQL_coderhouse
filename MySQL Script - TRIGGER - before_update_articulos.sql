DROP TRIGGER IF EXISTS `sql_coderhouse_narvaja_santiago`.`articulos_BEFORE_UPDATE`;

DELIMITER $$
USE `sql_coderhouse_narvaja_santiago`$$
CREATE DEFINER = CURRENT_USER TRIGGER `sql_coderhouse_narvaja_santiago`.`articulos_BEFORE_UPDATE` BEFORE UPDATE ON `articulos` FOR EACH ROW
BEGIN
INSERT INTO sql_coderhouse_narvaja_santiago.logs (accion , usuario , fecha , id_articulo )
VALUES (CONCAT('Actualizacion articulo: ' , IF(
												NEW.precio <> OLD.precio , 'Precio',
											IF( NEW.id_articulo <> OLD.id_articulo , 'id_articulo',
                                            IF( NEW.grupo <> OLD.grupo , 'Grupo' ,
                                            IF( NEW.familia <> OLD.familia , 'Familia',
                                            IF( NEW.sector <> OLD.sector , 'Sector' ,
                                            IF( NEW.nombre <> OLD.nombre ,'Nombre' , 'Otro'))))))) , USER() , CURDATE() , OLD.id_articulo );  
END$$
DELIMITER ;