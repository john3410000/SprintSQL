DROP schema IF exists sprint;
CREATE SCHEMA `sprint` ;

CREATE TABLE `sprint`.`accidente` (
  `idaccidente` INT NOT NULL,
  `accidia` date NOT NULL,
  `accihora` time NOT NULL,
  `accilugar` varchar(150) NOT NULL,
  `acciorigen` varchar(100) NOT NULL,
  `acciconsecuencias` varchar(100) DEFAULT NULL,
  `cliente_idcliente` INT NOT NULL,
  PRIMARY KEY (`idaccidente`));
 

CREATE TABLE `sprint`.`asistentes` (
  `idasistentes` INT NOT NULL,
  `asistnombrecompleto` varchar(100) NOT NULL,
  `asistedad` INT NOT NULL,
  `asistcorreo` varchar(70) DEFAULT NULL,
  `asisttelefono` varchar(20) DEFAULT NULL,
  `capacitacion_idcapacitacion` INT NOT NULL,
  PRIMARY KEY (`idasistentes`));

CREATE TABLE `sprint`.`capacitacion` (
  `idcapacitacion` INT NOT NULL,
  `capfecha` date NOT NULL,
  `caphora` time DEFAULT NULL,
  `caplugar` varchar(50) NOT NULL,
  `capduracion` INT DEFAULT NULL,
  `cliente_rutcliente` INT NOT NULL,
  PRIMARY KEY (`idcapacitacion`));
  

CREATE TABLE `sprint`.`cliente` (
  `rutcliente` INT NOT NULL,
  `clinombres` varchar(30) NOT NULL,
  `cliapellidos` varchar(50) NOT NULL,
  `clitelefono` varchar(20) NOT NULL,
  `cliafp` varchar(30) DEFAULT NULL,
  `clisistemasalud` INT DEFAULT NULL,
  `clidireccion` varchar(70) NOT NULL,
  `comuna` varchar(50) NOT NULL,
  `cliedad` INT NOT NULL,
  PRIMARY KEY (`rutcliente`));

CREATE TABLE `sprint`.`visita` (
  `idvisita` INT NOT NULL,
  `visfecha` date NOT NULL,
  `vishora` time DEFAULT NULL,
  `vislugar` varchar(50) NOT NULL,
  `viscomentario` varchar(250) NOT NULL,
  `cliente_rutcliente` INT NOT NULL,
  PRIMARY KEY (`idvisita`));
 

CREATE TABLE `sprint`.`chequeos` (
  `id_check` INT NOT NULL,
  `nom_chequeo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_check`));

CREATE TABLE `sprint`.`administrativos` (
  `id_administrativo` INT NOT NULL,
  `run_administrativo` INT(9) NOT NULL,
  `nombre_administrativo` VARCHAR(70) NOT NULL,
  `apellido_administrativo` VARCHAR(70) NOT NULL,
  `correo_administrativo` VARCHAR(45) NULL,
  `area_administrativo` VARCHAR(45) NULL,
  `admin_idusuario` INT NOT NULL,
  PRIMARY KEY (`id_administrativo`));

CREATE TABLE `sprint`.`profesionales` (
  `id_prof` INT NOT NULL,
  `run_prof` VARCHAR(45) NOT NULL,
  `nombre_prof` VARCHAR(45) NOT NULL,
  `apellido_prof` VARCHAR(45) NOT NULL,
  `fono_prof` VARCHAR(45) NOT NULL,
  `titulo_prof` VARCHAR(45) NOT NULL,
  `proyecto_prof` VARCHAR(45) NOT NULL,
  `prof_idusuario` INT NOT NULL,
  PRIMARY KEY (`id_prof`));

CREATE TABLE `sprint`.`registro_chequeo` (
  `idregistro_chequeo` INT NOT NULL,
  `estado_chequeo` VARCHAR(45) NOT NULL,
  `check_idvisita` INT NOT NULL,
  `check_idchequeo` INT NOT NULL,
  PRIMARY KEY (`idregistro_chequeo`));

CREATE TABLE `sprint`.`usuario` (
  `idusuario` INT NOT NULL,
  `nombreuser` VARCHAR(45) NOT NULL,
  `apellidouser` VARCHAR(45) NOT NULL,
  `fnacimientouser` DATE NOT NULL,
  `rutuser` INT NOT NULL,
  `user_rutcliente` INT NOT NULL,
  PRIMARY KEY (`idusuario`));




ALTER TABLE `sprint`.`registro_chequeo` 
ADD INDEX `registrocheck_chequeo_fk_idx` (`check_idchequeo` ASC) VISIBLE;
;
ALTER TABLE `sprint`.`registro_chequeo` 
ADD CONSTRAINT `registrocheck_chequeo_fk`
  FOREIGN KEY (`check_idchequeo`)
  REFERENCES `sprint`.`chequeos` (`id_check`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `sprint`.`registro_chequeo` 
ADD INDEX `registrocheck_visita_fk_idx` (`check_idvisita` ASC) VISIBLE;
;
ALTER TABLE `sprint`.`registro_chequeo` 
ADD CONSTRAINT `registrocheck_visita_fk`
  FOREIGN KEY (`check_idvisita`)
  REFERENCES `sprint`.`visita` (`idvisita`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE `sprint`.`usuario` 
ADD INDEX `usuario_cliente_FK_idx` (`user_rutcliente` ASC) VISIBLE;
;
ALTER TABLE `sprint`.`usuario` 
ADD CONSTRAINT `usuario_cliente_FK`
  FOREIGN KEY (`user_rutcliente`)
  REFERENCES `sprint`.`cliente` (`rutcliente`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE `sprint`.`visita` 
ADD INDEX `visita_cliente_FK_idx` (`cliente_rutcliente` ASC) VISIBLE;
;
ALTER TABLE `sprint`.`visita` 
ADD CONSTRAINT `visita_cliente_FK`
  FOREIGN KEY (`cliente_rutcliente`)
  REFERENCES `sprint`.`cliente` (`rutcliente`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE `sprint`.`asistentes` 
ADD INDEX `asistentes_capacitacion_FK_idx` (`capacitacion_idcapacitacion` ASC) VISIBLE;
;
ALTER TABLE `sprint`.`asistentes` 
ADD CONSTRAINT `asistentes_capacitacion_FK`
  FOREIGN KEY (`capacitacion_idcapacitacion`)
  REFERENCES `sprint`.`capacitacion` (`idcapacitacion`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE `sprint`.`capacitacion` 
ADD INDEX `capacitacion_cliente_FK_idx` (`cliente_rutcliente` ASC) VISIBLE;
;
ALTER TABLE `sprint`.`capacitacion` 
ADD CONSTRAINT `capacitacion_cliente_FK`
  FOREIGN KEY (`cliente_rutcliente`)
  REFERENCES `sprint`.`cliente` (`rutcliente`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE `sprint`.`accidente` 
ADD INDEX `accidente_cliente_FK_idx` (`cliente_idcliente` ASC) VISIBLE;
;
ALTER TABLE `sprint`.`accidente` 
ADD CONSTRAINT `accidente_cliente_FK`
  FOREIGN KEY (`cliente_idcliente`)
  REFERENCES `sprint`.`cliente` (`rutcliente`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE `sprint`.`profesionales` 
ADD INDEX `profesionales_usuario_FK_idx` (`prof_idusuario` ASC) VISIBLE;
;
ALTER TABLE `sprint`.`profesionales` 
ADD CONSTRAINT `profesionales_usuario_FK`
  FOREIGN KEY (`prof_idusuario`)
  REFERENCES `sprint`.`usuario` (`idusuario`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE `sprint`.`administrativos` 
ADD INDEX `administrativos_usuario_FK_idx` (`admin_idusuario` ASC) VISIBLE;
;
ALTER TABLE `sprint`.`administrativos` 
ADD CONSTRAINT `administrativos_usuario_FK`
  FOREIGN KEY (`admin_idusuario`)
  REFERENCES `sprint`.`usuario` (`idusuario`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;


CREATE TABLE `sprint`.`pagoclientes` (
  `idpagoclientes` INT NOT NULL AUTO_INCREMENT,
  `fechapago` DATE NOT NULL,
  `montopago` INT NOT NULL,
  `mes_apagar` INT NOT NULL,
  `ano_apagar` INT NOT NULL,
  `pago_idcliente` INT NOT NULL,
  PRIMARY KEY (`idpagoclientes`));

ALTER TABLE `sprint`.`pagoclientes` 
ADD INDEX `pagocliente_idcliente_idx` (`pago_idcliente` ASC) VISIBLE;
;
ALTER TABLE `sprint`.`pagoclientes` 
ADD CONSTRAINT `pagocliente_rutcliente`
  FOREIGN KEY (`pago_idcliente`)
  REFERENCES `sprint`.`cliente` (`rutcliente`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

CREATE TABLE `sprint`.`asesorias` (
  `idasesorias` INT NOT NULL,
  `fecha_realizacion` DATE NOT NULL,
  `motivo_solicitud` VARCHAR(100) NOT NULL,
  `profesional_acargo` INT NOT NULL,
  PRIMARY KEY (`idasesorias`),
  UNIQUE INDEX `idasesorias_UNIQUE` (`idasesorias` ASC) VISIBLE);

ALTER TABLE `sprint`.`asesorias` 
ADD INDEX `asesorias_profesionales_FK_idx` (`profesional_acargo` ASC) VISIBLE;
;
ALTER TABLE `sprint`.`asesorias` 
ADD CONSTRAINT `asesorias_profesionales_FK`
  FOREIGN KEY (`profesional_acargo`)
  REFERENCES `sprint`.`profesionales` (`id_prof`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

CREATE TABLE `sprint`.`accionesmejora` (
  `id_accion` INT NOT NULL AUTO_INCREMENT,
  `titulo_actividad` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `plazo_accion` INT NOT NULL,
  PRIMARY KEY (`id_accion`),
  UNIQUE INDEX `id_accion_UNIQUE` (`id_accion` ASC) VISIBLE);

ALTER TABLE `sprint`.`accionesmejora` 
ADD CONSTRAINT `accion_asesoria_FK`
  FOREIGN KEY (`id_accion`)
  REFERENCES `sprint`.`asesorias` (`idasesorias`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;


INSERT INTO `sprint`.`cliente` (`rutcliente`, `clinombres`, `cliapellidos`, `clitelefono`, `cliafp`, `clisistemasalud`, `clidireccion`, `comuna`, `cliedad`) VALUES 
('111111111', 'elba', 'lazo', '11223344', 'modelo', '1', 'av 1', 'vina', '45'),
('222222222', 'edgar', 'ganta', '55667788', 'habitat', '2', 'av 2', 'valparaiso', '57'),
('333333333', 'alan', 'brito', '11992288', 'cuprum', '2', 'av 3', 'vina', '26'),
('444444444', 'lola', 'mento', '33774466', 'uno', '1', 'av 4', 'valparaiso', '39'),
('555555555', 'omar', 'ciano', '55009988', 'provida', '2', 'av 5', 'valparaiso', '63');


INSERT INTO `sprint`.`capacitacion` (`idcapacitacion`, `capfecha`, `caphora`, `caplugar`, `capduracion`, `cliente_rutcliente`) VALUES 
('1', '2023-01-02', '9:00:00', 'valparaiso', '90', '111111111'),
('2', '2023-01-07', '9:30:00', 'vina', '60', '555555555'),
('3', '2023-01-14', '10:00:00', 'vina', '120', '444444444'),
('4', '2023-01-23', '10:20:00', 'valparaiso', '30', '333333333'),
('5', '2023-01-30', '11:00:00', 'vina', '70', '111111111'),
('6', '2023-01-31', '14:00:00', 'valparaiso', '60', '222222222');


INSERT INTO `sprint`.`asistentes` (`idasistentes`, `asistnombrecompleto`, `asistedad`, `asistcorreo`, `asisttelefono`, `capacitacion_idcapacitacion`) VALUES 
('1', 'ana', '34', 'a@h.com', '1234', '1'),
('2', 'evelin', '26', 'b@h.com', '5678', '1'),
('3', 'leon', '42', 'cb@h.com', '7890', '2'),
('4', 'tomas', '45', 'db@h.com', '2345', '2'),
('5', 'pedro', '21', 'eb@h.com', '3456', '3'),
('6', 'pablo', '29', 'fb@h.com', '4567', '3'),
('7', 'maria', '33', 'gb@h.com', '5678', '4'),
('8', 'tamara', '36', 'hb@h.com', '6789', '4'),
('9', 'susana', '48', 'ib@h.com', '7654', '5'),
('10', 'camilo', '56', 'jb@h.com', '0987', '5'),
('11', 'jael', '51', 'kb@h.com', '8765', '6'),
('12', 'ricardo', '40', 'lb@h.com', '4321', '6');


INSERT INTO `sprint`.`pagoclientes` (`idpagoclientes`, `fechapago`, `montopago`, `mes_apagar`, `ano_apagar`, `pago_idcliente`) VALUES 
('1', '2023-01-30', '125000', '12', '2022', '111111111'),
('2', '2023-02-07', '150000', '1', '2023', '111111111'),
('3', '2022-12-25', '300000', '12', '2022', '222222222'),
('4', '2022-12-10', '250000', '11', '2022', '333333333'),
('5', '2023-01-30', '180000', '1', '2023', '444444444'),
('6', '2022-12-22', '240000', '11', '2022', '444444444'),
('7', '2023-01-20', '320000', '1', '2023', '555555555');


INSERT INTO `sprint`.`accidente` (`idaccidente`, `accidia`, `accihora`, `accilugar`, `acciorigen`, `acciconsecuencias`, `cliente_idcliente`) VALUES 
('1', '2023-01-02', '10:45:00', 'valparaiso', 'golpe en la rodilla', 'amputacion de pierna', '222222222'),
('2', '2023-01-12', '09:13:00', 'vina', 'corte por sierra circular', 'restauracion de mano derecha', '111111111'),
('3', '2023-01-16', '11:27:00', 'valparaiso', 'caida de escaleras', 'pie izquierdo esguince ', '333333333'),
('4', '2023-01-21', '14:30:00', 'valparaiso', 'caida por piso mojado', 'tec abierto', '444444444'),
('5', '2023-01-25', '17:45:00', 'vina', 'quemadura con acido', 'curaciones periodicas por 30 dias', '555555555'),
('6', '2023-01-26', '16:25:00', 'vina', 'intoxicacion por quimicos', 'vomitos explosivos', '444444444'),
('7', '2023-01-30', '13:55:00', 'valparaiso', 'atropello con grua horquilla', 'luxacion de costillas', '222222222');


INSERT INTO `sprint`.`visita` (`idvisita`, `visfecha`, `vishora`, `vislugar`, `viscomentario`, `cliente_rutcliente`) VALUES 
('1', '2023/01/03', '09:00:00', 'valparaiso', 'comentario 1', '111111111'),
('2', '2023/01/05', '09:00:00', 'vina', 'comentario 2', '222222222'),
('3', '2023/01/07', '09:00:00', 'valparaiso', 'comentario 3', '333333333'),
('4', '2023/01/14', '09:00:00', 'vina', 'comentario 4', '111111111'),
('5', '2023/01/17', '09:00:00', 'valparaiso', 'comentario 5', '444444444'),
('6', '2023/01/20', '09:00:00', 'vina', 'comentario 6', '555555555'),
('7', '2023/01/23', '09:00:00', 'valparaiso', 'comentario 7', '333333333'),
('8', '2023/01/27', '09:00:00', 'vina', 'comentario 8', '555555555'),
('9', '2023/01/30', '09:00:00', 'valparaiso', 'comentario 9', '444444444'),
('10', '2023/02/02', '09:00:00', 'vina', 'comentario 10', '222222222');


INSERT INTO `sprint`.`chequeos` (`id_check`, `nom_chequeo`) VALUES 
('1', 'chequeo1'),
('2', 'chequeo2'),
('3', 'chequeo3'),
('4', 'chequeo4'),
('5', 'chequeo5'),
('6', 'chequeo6'),
('7', 'chequeo7'),
('8', 'chequeo8');


INSERT INTO `sprint`.`registro_chequeo` (`idregistro_chequeo`, `estado_chequeo`, `check_idvisita`, `check_idchequeo`) VALUES 
('1', 'Aprobado sin observaciones', '1', '1'),
('2', 'Aprobado sin observaciones', '2', '2'),
('3', 'Aprobado con observaciones', '3', '3'),
('4', 'Aprobado con observaciones', '4', '4'),
('5', 'Chequeos no cumplidos', '5', '5'),
('6', 'Chequeos no cumplidos', '6', '6'),
('7', 'Aprobado sin observaciones', '7', '7'),
('8', 'Aprobado con observaciones', '8', '8');


INSERT INTO `sprint`.`usuario` (idusuario, nombreuser, apellidouser, fnacimientouser, rutuser, user_rutcliente) values
(1, 'Pancho', 'Perez', '1985-01-02', 121212129, 111111111),
(2, 'Pancho', 'Perez', '1985-02-03', 131313139, 222222222),
(3, 'Pancho', 'Perez', '1985-03-04', 141414149, 333333333);


INSERT INTO `sprint`.`profesionales` (id_prof, run_prof, nombre_prof, apellido_prof, fono_prof, titulo_prof, proyecto_prof, prof_idusuario) values
(1, 900000000, 'Bruce', 'Banner', 111222333, 'Prevencicionista de Riesgo', 'SinDescanzo', 1),
(2, 900000001, 'Bruce', 'Wayne', 222333444, 'Prevencicionista de Riesgo', 'SinPiedad', 2),
(3, 900000001, 'Barry', 'Allen', 555666777, 'Prevencicionista de Riesgo', 'SinMisericordia', 3);


INSERT INTO `sprint`.`asesorias` (idasesorias, fecha_realizacion, motivo_solicitud, profesional_acargo) values
(1, '2020-02-27','Caidas multiples en escalera', 1),
(2, '2020-01-15','laminadoras antiguas', 2),
(3, '2020-02-27','horquilla de la muerte', 3);


INSERT INTO `sprint`.`accionesmejora` (id_accion, titulo_actividad, descripcion, plazo_accion) values
(1, 'NSW Protocolo de Transito','Se ensena a la gente como usar la escalera', 3),
(2, 'CTW Protocolo de Manipulacion','Se ensena a la gente como usar la laminadora', 5),
(3, 'EWI Curso de uso de Horquilla','Se ensena a operar una horquilla y protocolo de seguridad', 9);


INSERT INTO `sprint`.`administrativos` (`id_administrativo`, `run_administrativo`, `nombre_administrativo`, `apellido_administrativo`, `correo_administrativo`, `area_administrativo`, `admin_idusuario`) VALUES 
('1', '123456789', 'ana', 'gonzalez', 'a@b.com', 'RRHH', '1'),
('2', '234567890', 'juan', 'araya', 's@b.com', 'abastecimiento', '2'),
('3', '345678901', 'pedro', 'zamorano', 'd@b.com', 'finanzas', '3'),
('4', '456789012', 'maria', 'guzman', 'f@b.com', 'comercial', '1'),
('5', '567890123', 'pablo', 'faundes', 'g@b.com', 'legal', '2');
