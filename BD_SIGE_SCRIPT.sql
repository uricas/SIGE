CREATE SCHEMA IF NOT EXISTS BD_SIGE DEFAULT CHARACTER SET utf8 ;
USE BD_SIGE ;

-- -----------------------------------------------------
-- Table SGE.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS BD_SIGE.`Rol` (
  `idRol` INT NOT NULL AUTO_INCREMENT,
  `nombreRol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table SGE.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS BD_SIGE.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `rol_id` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_Usuario_Rol_idx` (`rol_id` ASC),
  CONSTRAINT `fk_Usuario_Rol`
    FOREIGN KEY (`rol_id`)
    REFERENCES BD_SIGE.`Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table SGE.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS BD_SIGE.`Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS BD_SIGE.`Examen` (
  `idExamen` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(150) NOT NULL,
  `token` VARCHAR(45) NOT NULL,
  `fechaInicio` DATETIME(1) NOT NULL,
  `fechaFin` DATETIME(1) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `categoria_id` INT NOT NULL,
  `profesor_id` INT NOT NULL,
  PRIMARY KEY (`idExamen`),
  INDEX `fk_Examen_Categoria1_idx` (`categoria_id` ASC),
  INDEX `fk_Examen_Usuario1_idx` (`profesor_id` ASC),
  UNIQUE INDEX `token_UNIQUE` (`token` ASC),
  CONSTRAINT `fk_Examen_Categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES BD_SIGE.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Examen_Usuario1`
    FOREIGN KEY (`profesor_id`)
    REFERENCES BD_SIGE.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS BD_SIGE.`Pregunta` (
  `idPregunta` INT NOT NULL AUTO_INCREMENT,
  `pregunta` VARCHAR(45) NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`idPregunta`),
  INDEX `fk_Pregunta_Categoria1_idx` (`categoria_id` ASC),
  CONSTRAINT `fk_Pregunta_Categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES BD_SIGE.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS BD_SIGE.`Respuesta` (
  `idRespuesta` INT NOT NULL AUTO_INCREMENT,
  `respuesta` VARCHAR(45) NOT NULL,
  `pregunta_id` INT NOT NULL,
  `correcta` TINYINT NOT NULL,
  PRIMARY KEY (`idRespuesta`),
  INDEX `fk_Respuesta_Pregunta1_idx` (`pregunta_id` ASC),
  CONSTRAINT `fk_Respuesta_Pregunta1`
    FOREIGN KEY (`pregunta_id`)
    REFERENCES BD_SIGE.`Pregunta` (`idPregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS BD_SIGE.`Aplicacion` (
  `idAplicacion` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `examen_id` INT NOT NULL,
  `calificacion` DOUBLE NOT NULL,
  PRIMARY KEY (`idAplicacion`),
  INDEX `fk_ExamenRespuesta_Usuario1_idx` (`usuario_id` ASC),
  INDEX `fk_ExamenRespuesta_Examen1_idx` (`examen_id` ASC),
  CONSTRAINT `fk_ExamenRespuesta_Usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES BD_SIGE.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ExamenRespuesta_Examen1`
    FOREIGN KEY (`examen_id`)
    REFERENCES BD_SIGE.`Examen` (`idExamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS BD_SIGE.`ExamenTienePregunta` (
  `idExamenPregunta` INT NOT NULL AUTO_INCREMENT,
  `pregunta_id` INT NOT NULL,
  `examen_id` INT NOT NULL,
  PRIMARY KEY (`idExamenPregunta`),
  INDEX `fk_Pregunta_has_Examen_Examen1_idx` (`examen_id` ASC),
  INDEX `fk_Pregunta_has_Examen_Pregunta1_idx` (`pregunta_id` ASC),
  CONSTRAINT `fk_Pregunta_has_Examen_Pregunta1`
    FOREIGN KEY (`pregunta_id`)
    REFERENCES BD_SIGE.`Pregunta` (`idPregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pregunta_has_Examen_Examen1`
    FOREIGN KEY (`examen_id`)
    REFERENCES BD_SIGE.`Examen` (`idExamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS BD_SIGE.`RespuestaUsuario` (
  `idRespuestaUsuario` INT NOT NULL AUTO_INCREMENT,
  `correcta` TINYINT NOT NULL,
  `aplicacion_id` INT NOT NULL,
  `respuesta_id` INT NOT NULL,
  PRIMARY KEY (`idRespuestaUsuario`),
  INDEX `fk_RespuestaUsuario_Aplicacion1_idx` (`aplicacion_id` ASC),
  INDEX `fk_RespuestaUsuario_Respuesta1_idx` (`respuesta_id` ASC),
  CONSTRAINT `fk_RespuestaUsuario_Aplicacion1`
    FOREIGN KEY (`aplicacion_id`)
    REFERENCES BD_SIGE.`Aplicacion` (`idAplicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RespuestaUsuario_Respuesta1`
    FOREIGN KEY (`respuesta_id`)
    REFERENCES BD_SIGE.`Respuesta` (`idRespuesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
########################
