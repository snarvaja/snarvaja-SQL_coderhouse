DROP TRIGGER IF EXISTS `sql_coderhouse_narvaja_santiago`.`articulos_en_promocion_BEFORE_UPDATE`;

DELIMITER $$
USE `sql_coderhouse_narvaja_santiago`$$
CREATE DEFINER = CURRENT_USER TRIGGER `sql_coderhouse_narvaja_santiago`.`articulos_en_promocion_BEFORE_UPDATE` BEFORE UPDATE ON `articulos_en_promocion` FOR EACH ROW
BEGIN
INSERT INTO sql_coderhouse_narvaja_santiago.logs (accion , usuario , fecha , id_articulo )
VALUES (CONCAT('Actualizacion promocion articulo: ' , IF(
														(NEW.tope_descuento <> OLD.tope_descuento) AND (NEW.porcentaje_descuento <> OLD.porcentaje_descuento), 'Desccuento y tope',
											IF(	NEW.tope_descuento <> OLD.tope_descuento , 'Tope descuento',
											IF( NEW.porcentaje_descuento <> OLD.porcentaje_descuento , 'Porcentaje descuento' , 
												'Otro')))) , USER() , CURDATE() , OLD.id_articulo );  
END$$
DELIMITER ;