USE sql_coderhouse_narvaja_santiago;
SELECT pc.id_cliente , pc.segmento_RFM , TRUNCATE( (vpc.ventas_por_cliente / vpc.cantidad_compras) , 3) AS ticket_promedio , recategorizacion_rfm_clientes(pc.id_cliente) AS recategorizacion 
FROM sql_coderhouse_narvaja_santiago.perfil_clientes AS pc
INNER JOIN sql_coderhouse_narvaja_santiago.ventas_por_clientes AS vpc ON pc.id_cliente = vpc.id_cliente;

