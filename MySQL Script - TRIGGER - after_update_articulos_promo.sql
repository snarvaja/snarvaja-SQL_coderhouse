DROP TRIGGER IF EXISTS `sql_coderhouse_narvaja_santiago`.`articulos_en_promocion_AFTER_UPDATE`;

DELIMITER $$
USE `sql_coderhouse_narvaja_santiago`$$
CREATE DEFINER = CURRENT_USER TRIGGER `sql_coderhouse_narvaja_santiago`.`articulos_en_promocion_AFTER_UPDATE` AFTER UPDATE ON `articulos_en_promocion` FOR EACH ROW
BEGIN
INSERT INTO sql_coderhouse_narvaja_santiago.bitacora_articulos_promo 
VALUES (NULL , 
		OLD.id_articulo , 
        IF( OLD.tope_descuento = NEW.tope_descuento , NULL , OLD.tope_descuento ) ,
        IF( OLD.tope_descuento = NEW.tope_descuento , NULL , NEW.tope_descuento ), 
        IF( OLD.porcentaje_descuento = NEW.porcentaje_descuento , NULL , OLD.porcentaje_descuento ) ,
        IF( OLD.porcentaje_descuento = NEW.porcentaje_descuento , NULL , NEW.porcentaje_descuento ), 
        CURDATE());
END$$
DELIMITER ;
