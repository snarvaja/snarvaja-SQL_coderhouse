-- Esta function busca evaluar el ticket promedio del cliente, tomando como parametro su id, para recategorizarlo en un nuevo segmento RFM segun corresponda
USE `sql_coderhouse_narvaja_santiago`;
DROP function IF EXISTS `recategorizacion_rfm_clientes`;

DELIMITER //
CREATE FUNCTION `recategorizacion_rfm_clientes`(param1_id_cliente VARCHAR(25))
RETURNS VARCHAR(15)
READS SQL DATA

BEGIN
    DECLARE ticket_promedio FLOAT;
	DECLARE recategorizacion_rfm VARCHAR(15);
      
    SET ticket_promedio = 
						(SELECT TRUNCATE((vxc.ventas_por_cliente / vxc.cantidad_compras), 3) 
						FROM sql_coderhouse_narvaja_santiago.ventas_por_clientes AS vxc
                        WHERE id_cliente = param1_id_cliente) ;
	SET recategorizacion_rfm = 
						(SELECT IFNULL(
										IF( ticket_promedio < 1000 , 'Cobre' ,
																		IF( ticket_promedio < 3000 , 'Bronce' ,
                                                                        IF( ticket_promedio < 10000 , 'Plata' , 
                                                                        IF( ticket_promedio < 20000 , 'Oro',
                                                                        'Platino')))) , 
                                                                        'Sin compras')
						FROM DUAL );
	RETURN recategorizacion_rfm;
    END//
    
    DELIMITER ;


-- Function que busca recompilar a que sucursales asistieron los clientes y agruparlas utilizando GROUP_CONCAT. Utiliza como parametro el id del cliente    
USE `sql_coderhouse_narvaja_santiago`;
DROP function IF EXISTS `donde_compra`;

DELIMITER //
CREATE FUNCTION `donde_compra`(param1_id_cliente VARCHAR(25))
RETURNS VARCHAR(255)
READS SQL DATA

BEGIN
    DECLARE sucursal_compra VARCHAR(255);
	
      
    SET sucursal_compra = 
						(SELECT  IFNULL(
										GROUP_CONCAT(DISTINCT(sucursal)),
                                        'Sin compras')
						FROM detalle_compra
						WHERE id_cliente = param1_id_cliente
                        );
    
	RETURN sucursal_compra;
    END//
    
    DELIMITER ;