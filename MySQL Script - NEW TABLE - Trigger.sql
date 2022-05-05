
DROP TABLE IF EXISTS `sql_coderhouse_narvaja_santiago`.`bitacora_precio_articulos`;

 CREATE TABLE `sql_coderhouse_narvaja_santiago`.`bitacora_precio_articulos` (
  `id_modificacion` INT NOT NULL  AUTO_INCREMENT,
  `id_articulo` INT NOT NULL,
  `precio_previo` FLOAT,
  `precio_nuevo` FLOAT,
  `fecha_actualizacion` DATE NOT NULL,
  PRIMARY KEY (`id_modificacion`),
  UNIQUE INDEX `id_modificacion_UNIQUE` (`id_modificacion` ASC) VISIBLE);
  
DROP TABLE IF EXISTS `sql_coderhouse_narvaja_santiago`.`logs`;

 CREATE TABLE `sql_coderhouse_narvaja_santiago`.`logs` (
  `id` INT NOT NULL  AUTO_INCREMENT,
  `accion` VARCHAR(255) NOT NULL,
  `usuario` VARCHAR(50) NOT NULL,
  `fecha` DATE NOT NULL,
  `id_articulo` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);
  
  
DROP TABLE IF EXISTS `sql_coderhouse_narvaja_santiago`.`bitacora_articulos_promo`;

 CREATE TABLE `sql_coderhouse_narvaja_santiago`.`bitacora_articulos_promo` (
  `id_modificacion` INT NOT NULL  AUTO_INCREMENT,
  `id_articulo` INT NOT NULL,
  `monto_desc_previo` FLOAT,
  `monto_desc_nuevo` FLOAT,
  `porce_desc_previo` FLOAT,
  `porce_desc_nuevo` FLOAT,
  `fecha_actualizacion` DATE NOT NULL,
  PRIMARY KEY (`id_modificacion`),
  UNIQUE INDEX `id_modificacion_UNIQUE` (`id_modificacion` ASC) VISIBLE);
