
USE sql_coderhouse_narvaja_santiago;
CALL rendimiento_sucursales('compras','d');

USE sql_coderhouse_narvaja_santiago;
CALL rendimiento_sucursales('compras','a');

USE sql_coderhouse_narvaja_santiago;
CALL rendimiento_sucursales('clientes','d');

USE sql_coderhouse_narvaja_santiago;
CALL rendimiento_sucursales('clientes','a');

USE sql_coderhouse_narvaja_santiago;
CALL rendimiento_sucursales('sucursal','d');

USE sql_coderhouse_narvaja_santiago;
CALL rendimiento_sucursales('sucursal','a');

USE sql_coderhouse_narvaja_santiago;
SELECT * FROM sql_coderhouse_narvaja_santiago.sucursales; 
CALL update_suc('Sur','Patagonia');
SELECT * FROM sql_coderhouse_narvaja_santiago.sucursales; 

USE sql_coderhouse_narvaja_santiago;
SELECT * FROM sql_coderhouse_narvaja_santiago.sucursales; 
CALL update_suc('Centro','Rio IV');
SELECT * FROM sql_coderhouse_narvaja_santiago.sucursales; 