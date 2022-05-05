-- Usuario destinado a la gestion de la compra de articulos, para esto necesita tener acceso a la tabla de articulos vigentes y saber cuales son los comportamientos de ventas--
CREATE USER 'compras'@'localhost' IDENTIFIED BY 'compraarticulos';
GRANT SELECT , UPDATE , INSERT ON sql_coderhouse_narvaja_santiago.articulos TO 'compras'@'localhost';
GRANT SELECT ON sql_coderhouse_narvaja_santiago.ventas_por_articulos TO 'compras'@'localhost';

SHOW GRANTS FOR 'compras'@'localhost';

-- Usuario destinado a la gestion de clientes, solo tiene acceso a lectura ya que no puede modificar la informacion que los clientes cargaron al sistema--
CREATE USER 'clientes'@'localhost' IDENTIFIED BY 'controlclientes';
GRANT SELECT ON sql_coderhouse_narvaja_santiago.perfil_clientes TO 'clientes'@'localhost';
GRANT SELECT ON sql_coderhouse_narvaja_santiago.ventas_por_clientes TO 'clientes'@'localhost';


SHOW GRANTS FOR 'clientes'@'localhost';