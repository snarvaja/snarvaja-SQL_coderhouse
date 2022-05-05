DROP TRIGGER IF EXISTS `sql_coderhouse_narvaja_santiago`.`articulos_AFTER_UPDATE`;

DELIMITER $$
USE `sql_coderhouse_narvaja_santiago`$$
CREATE DEFINER = CURRENT_USER TRIGGER `sql_coderhouse_narvaja_santiago`.`articulos_AFTER_UPDATE` AFTER UPDATE ON `articulos` FOR EACH ROW
BEGIN
INSERT INTO sql_coderhouse_narvaja_santiago.bitacora_precio_articulos (id_articulo , precio_previo , fecha_actualizacion , precio_nuevo )
VALUES (OLD.id_articulo , OLD.precio , CURDATE() , NEW.precio);
END$$
DELIMITER ;
