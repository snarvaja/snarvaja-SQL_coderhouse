-- Prueba del funcionamiento de la function recategorizacion_rfm_clientes. Esta toma como parametro el id del cliente y analiza su ticket promedio para realizar la recategorizacion. 
-- La idea de este script es comparar el segmento anterior y cual seria la recategorizacion. Tambien se muestra el ticket promedio para ver como la recategorizacion impacta segun su valor.
USE sql_coderhouse_narvaja_santiago;
SELECT pc.id_cliente , pc.segmento_RFM , TRUNCATE( (vpc.ventas_por_cliente / vpc.cantidad_compras) , 3) AS ticket_promedio , recategorizacion_rfm_clientes(pc.id_cliente) AS recategorizacion 
FROM sql_coderhouse_narvaja_santiago.perfil_clientes AS pc
INNER JOIN sql_coderhouse_narvaja_santiago.ventas_por_clientes AS vpc ON pc.id_cliente = vpc.id_cliente;

-- Muestra del funcionamiento de la function donde_compra. Toma como parametro el id del cliente y concatena todas las sucursales donde realizo una compra. La fuente de informacion para esta function es la vista detalle_compras
-- Toma el id_clientes desde la tabla perfil_clientes y busca en detalle compra cuales fueron las sucursales donde realizaron la compra, si es que compraron. 
USE sql_coderhouse_narvaja_santiago;
SELECT id_cliente , donde_compra(id_cliente) AS sucursales
FROM sql_coderhouse_narvaja_santiago.perfil_clientes;



