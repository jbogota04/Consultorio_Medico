-- MySQL Script generated by MySQL Workbench
-- Mon Oct  3 18:55:37 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Consultorio_Medico
-- -----------------------------------------------------
-- Base de datos de un consultorio on line para el Ciclo 3 UNAB Mision TIC 2022
-- 

-- -----------------------------------------------------
-- Schema Consultorio_Medico
--
-- Base de datos de un consultorio on line para el Ciclo 3 UNAB Mision TIC 2022
-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Consultorio_Medico` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
-- -----------------------------------------------------
-- Schema consultorio_medico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema consultorio_medico
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `consultorio_medico` ;
USE `Consultorio_Medico` ;

-- -----------------------------------------------------
-- Table `Consultorio_Medico`.`Historia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Consultorio_Medico`.`Historia` (
  `idHistoria` INT NOT NULL AUTO_INCREMENT,
  `HistoriaDetalle` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`idHistoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Consultorio_Medico`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Consultorio_Medico`.`Ciudad` (
  `idCiudad` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCiudad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Consultorio_Medico`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Consultorio_Medico`.`Paciente` (
  `Cedula` INT NOT NULL,
  `idPaciente` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Direccion` VARCHAR(100) NULL,
  `Edad` SMALLINT NULL,
  `Telefono` INT NULL,
  `Email` VARCHAR(100) NULL,
  `Historia_idHistoria` INT NOT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`Cedula`, `idPaciente`, `Historia_idHistoria`, `Ciudad_idCiudad`),
  INDEX `fk_Paciente_Historia1_idx` (`Historia_idHistoria` ASC) VISIBLE,
  INDEX `fk_Paciente_Ciudad1_idx` (`Ciudad_idCiudad` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_Historia1`
    FOREIGN KEY (`Historia_idHistoria`)
    REFERENCES `Consultorio_Medico`.`Historia` (`idHistoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_Ciudad1`
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `Consultorio_Medico`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Consultorio_Medico`.`Tipo_consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Consultorio_Medico`.`Tipo_consulta` (
  `idTipo_consulta` INT NOT NULL,
  `Tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipo_consulta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Consultorio_Medico`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Consultorio_Medico`.`Medico` (
  `idMedico` INT NOT NULL,
  `Cedula` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Telefono` INT NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`idMedico`, `Cedula`, `Ciudad_idCiudad`),
  INDEX `fk_Medico_Ciudad1_idx` (`Ciudad_idCiudad` ASC) VISIBLE,
  CONSTRAINT `fk_Medico_Ciudad1`
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `Consultorio_Medico`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Consultorio_Medico`.`Consultorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Consultorio_Medico`.`Consultorio` (
  `idConsultorio` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Telefono` INT NULL,
  `Email` VARCHAR(100) NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`idConsultorio`, `Ciudad_idCiudad`),
  INDEX `fk_Consultorio_Ciudad1_idx` (`Ciudad_idCiudad` ASC) VISIBLE,
  CONSTRAINT `fk_Consultorio_Ciudad1`
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `Consultorio_Medico`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Consultorio_Medico`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Consultorio_Medico`.`Consulta` (
  `idConsulta` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  `Tipo_consulta_idTipo_consulta` INT NOT NULL,
  `Paciente_Cedula` INT NOT NULL,
  `Paciente_idPaciente` INT NOT NULL,
  `Medico_idMedico` INT NOT NULL,
  `Medico_Cedula` INT NOT NULL,
  `Consultorio_idConsultorio` INT NOT NULL,
  `Consultorio_Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`idConsulta`, `Tipo_consulta_idTipo_consulta`, `Paciente_Cedula`, `Paciente_idPaciente`, `Medico_idMedico`, `Medico_Cedula`, `Consultorio_idConsultorio`, `Consultorio_Ciudad_idCiudad`),
  INDEX `fk_Consulta_Tipo_consulta_idx` (`Tipo_consulta_idTipo_consulta` ASC) VISIBLE,
  INDEX `fk_Consulta_Paciente1_idx` (`Paciente_Cedula` ASC, `Paciente_idPaciente` ASC) VISIBLE,
  INDEX `fk_Consulta_Medico1_idx` (`Medico_idMedico` ASC, `Medico_Cedula` ASC) VISIBLE,
  INDEX `fk_Consulta_Consultorio1_idx` (`Consultorio_idConsultorio` ASC, `Consultorio_Ciudad_idCiudad` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Tipo_consulta`
    FOREIGN KEY (`Tipo_consulta_idTipo_consulta`)
    REFERENCES `Consultorio_Medico`.`Tipo_consulta` (`idTipo_consulta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Paciente1`
    FOREIGN KEY (`Paciente_Cedula` , `Paciente_idPaciente`)
    REFERENCES `Consultorio_Medico`.`Paciente` (`Cedula` , `idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Medico1`
    FOREIGN KEY (`Medico_idMedico` , `Medico_Cedula`)
    REFERENCES `Consultorio_Medico`.`Medico` (`idMedico` , `Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Consultorio1`
    FOREIGN KEY (`Consultorio_idConsultorio` , `Consultorio_Ciudad_idCiudad`)
    REFERENCES `Consultorio_Medico`.`Consultorio` (`idConsultorio` , `Ciudad_idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Consultorio_Medico`.`Farmaceutica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Consultorio_Medico`.`Farmaceutica` (
  `NIT` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(100) NULL,
  `Telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`NIT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Consultorio_Medico`.`Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Consultorio_Medico`.`Medicamento` (
  `idMedicamento` INT NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  `Stock` INT NOT NULL,
  `Farmaceutica_NIT` INT NOT NULL,
  PRIMARY KEY (`idMedicamento`, `Farmaceutica_NIT`),
  INDEX `fk_Medicamento_Farmaceutica1_idx` (`Farmaceutica_NIT` ASC) VISIBLE,
  CONSTRAINT `fk_Medicamento_Farmaceutica1`
    FOREIGN KEY (`Farmaceutica_NIT`)
    REFERENCES `Consultorio_Medico`.`Farmaceutica` (`NIT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Consultorio_Medico`.`Enfermedades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Consultorio_Medico`.`Enfermedades` (
  `idEnfermedades` INT NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idEnfermedades`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Consultorio_Medico`.`Historia_Enfermedades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Consultorio_Medico`.`Historia_Enfermedades` (
  `Historia_idHistoria` INT NOT NULL,
  `Enfermedades_idEnfermedades` INT NOT NULL,
  PRIMARY KEY (`Historia_idHistoria`, `Enfermedades_idEnfermedades`),
  INDEX `fk_Historia_has_Enfermedades_Enfermedades1_idx` (`Enfermedades_idEnfermedades` ASC) VISIBLE,
  INDEX `fk_Historia_has_Enfermedades_Historia1_idx` (`Historia_idHistoria` ASC) VISIBLE,
  CONSTRAINT `fk_Historia_has_Enfermedades_Historia1`
    FOREIGN KEY (`Historia_idHistoria`)
    REFERENCES `Consultorio_Medico`.`Historia` (`idHistoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Historia_has_Enfermedades_Enfermedades1`
    FOREIGN KEY (`Enfermedades_idEnfermedades`)
    REFERENCES `Consultorio_Medico`.`Enfermedades` (`idEnfermedades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Consultorio_Medico`.`Consulta_Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Consultorio_Medico`.`Consulta_Medicamento` (
  `Consulta_idConsulta` INT NOT NULL,
  `Consulta_Tipo_consulta_idTipo_consulta` INT NOT NULL,
  `Consulta_Paciente_Cedula` INT NOT NULL,
  `Consulta_Medico_Cedula` INT NOT NULL,
  `Medicamento_idMedicamento` INT NOT NULL,
  `Medicamento_Farmaceutica_NIT` INT NOT NULL,
  PRIMARY KEY (`Consulta_idConsulta`, `Consulta_Tipo_consulta_idTipo_consulta`, `Consulta_Paciente_Cedula`, `Consulta_Medico_Cedula`, `Medicamento_idMedicamento`, `Medicamento_Farmaceutica_NIT`),
  INDEX `fk_Consulta_has_Medicamento_Medicamento1_idx` (`Medicamento_idMedicamento` ASC, `Medicamento_Farmaceutica_NIT` ASC) VISIBLE,
  INDEX `fk_Consulta_has_Medicamento_Consulta1_idx` (`Consulta_idConsulta` ASC, `Consulta_Tipo_consulta_idTipo_consulta` ASC, `Consulta_Paciente_Cedula` ASC, `Consulta_Medico_Cedula` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_has_Medicamento_Consulta1`
    FOREIGN KEY (`Consulta_idConsulta` , `Consulta_Tipo_consulta_idTipo_consulta` , `Consulta_Paciente_Cedula` , `Consulta_Medico_Cedula`)
    REFERENCES `Consultorio_Medico`.`Consulta` (`idConsulta` , `Tipo_consulta_idTipo_consulta` , `Paciente_Cedula` , `Medico_Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_has_Medicamento_Medicamento1`
    FOREIGN KEY (`Medicamento_idMedicamento` , `Medicamento_Farmaceutica_NIT`)
    REFERENCES `Consultorio_Medico`.`Medicamento` (`idMedicamento` , `Farmaceutica_NIT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `consultorio_medico` ;

-- -----------------------------------------------------
-- Table `consultorio_medico`.`ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio_medico`.`ciudad` (
  `idCiudad` INT NOT NULL,
  `Nombre` VARCHAR(45) COLLATE 'utf8mb3_spanish_ci' NOT NULL,
  PRIMARY KEY (`idCiudad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio_medico`.`consultorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio_medico`.`consultorio` (
  `idConsultorio` INT NOT NULL,
  `Nombre` VARCHAR(45) COLLATE 'utf8mb3_spanish_ci' NOT NULL,
  `Telefono` INT NULL DEFAULT NULL,
  `Email` VARCHAR(100) COLLATE 'utf8mb3_spanish_ci' NULL DEFAULT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`idConsultorio`),
  INDEX `fk_Consultorio_Ciudad1_idx` (`Ciudad_idCiudad` ASC) VISIBLE,
  CONSTRAINT `fk_Consultorio_Ciudad`
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `consultorio_medico`.`ciudad` (`idCiudad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio_medico`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio_medico`.`medico` (
  `idMedico` INT NOT NULL,
  `Cedula` INT NOT NULL,
  `Nombre` VARCHAR(45) COLLATE 'utf8mb3_spanish_ci' NOT NULL,
  `Direccion` VARCHAR(45) COLLATE 'utf8mb3_spanish_ci' NOT NULL,
  `Telefono` INT NOT NULL,
  `Email` VARCHAR(100) COLLATE 'utf8mb3_spanish_ci' NOT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`idMedico`, `Cedula`),
  INDEX `fk_Medico_Ciudad1_idx` (`Ciudad_idCiudad` ASC) VISIBLE,
  CONSTRAINT `fk_Medico_Ciudad`
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `consultorio_medico`.`ciudad` (`idCiudad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio_medico`.`historia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio_medico`.`historia` (
  `idHistoria` INT NOT NULL AUTO_INCREMENT,
  `HistoriaDetalle` VARCHAR(1000) COLLATE 'utf8mb3_spanish_ci' NOT NULL,
  PRIMARY KEY (`idHistoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio_medico`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio_medico`.`paciente` (
  `Cedula` INT NOT NULL,
  `idPaciente` INT NOT NULL,
  `Nombre` VARCHAR(45) COLLATE 'utf8mb3_spanish_ci' NULL DEFAULT NULL,
  `Apellido` VARCHAR(45) COLLATE 'utf8mb3_spanish_ci' NULL DEFAULT NULL,
  `Direccion` VARCHAR(100) COLLATE 'utf8mb3_spanish_ci' NULL DEFAULT NULL,
  `Edad` SMALLINT NULL DEFAULT NULL,
  `Telefono` INT NULL DEFAULT NULL,
  `Email` VARCHAR(100) COLLATE 'utf8mb3_spanish_ci' NULL DEFAULT NULL,
  `Historia_idHistoria` INT NOT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`Cedula`, `idPaciente`),
  INDEX `fk_Paciente_Historia1_idx` (`Historia_idHistoria` ASC) VISIBLE,
  INDEX `fk_Paciente_Ciudad1_idx` (`Ciudad_idCiudad` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_Ciudad`
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `consultorio_medico`.`ciudad` (`idCiudad`),
  CONSTRAINT `fk_Paciente_Historia`
    FOREIGN KEY (`Historia_idHistoria`)
    REFERENCES `consultorio_medico`.`historia` (`idHistoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio_medico`.`tipo_consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio_medico`.`tipo_consulta` (
  `idTipo_consulta` INT NOT NULL,
  `Tipo` VARCHAR(45) COLLATE 'utf8mb3_spanish_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`idTipo_consulta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio_medico`.`consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio_medico`.`consulta` (
  `idConsulta` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  `Tipo_consulta_idTipo_consulta` INT NOT NULL,
  `Paciente_Cedula` INT NOT NULL,
  `Paciente_idPaciente` INT NOT NULL,
  `Medico_idMedico` INT NOT NULL,
  `Medico_Cedula` INT NOT NULL,
  `Consultorio_idConsultorio` INT NOT NULL,
  `Consultorio_Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`idConsulta`),
  INDEX `fk_Consulta_Paciente1_idx` (`Paciente_Cedula` ASC, `Paciente_idPaciente` ASC) VISIBLE,
  INDEX `fk_Consulta_Medico1_idx` (`Medico_idMedico` ASC, `Medico_Cedula` ASC) VISIBLE,
  INDEX `fk_Consulta_Consultorio1_idx` (`Consultorio_idConsultorio` ASC) VISIBLE,
  INDEX `fk_Consulta_Tipo_consulta_idx` (`Tipo_consulta_idTipo_consulta` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Consultorio`
    FOREIGN KEY (`Consultorio_idConsultorio`)
    REFERENCES `consultorio_medico`.`consultorio` (`idConsultorio`),
  CONSTRAINT `fk_Consulta_Medico`
    FOREIGN KEY (`Medico_idMedico` , `Medico_Cedula`)
    REFERENCES `consultorio_medico`.`medico` (`idMedico` , `Cedula`),
  CONSTRAINT `fk_Consulta_Paciente`
    FOREIGN KEY (`Paciente_Cedula` , `Paciente_idPaciente`)
    REFERENCES `consultorio_medico`.`paciente` (`Cedula` , `idPaciente`),
  CONSTRAINT `fk_Consulta_Tipo_consulta`
    FOREIGN KEY (`Tipo_consulta_idTipo_consulta`)
    REFERENCES `consultorio_medico`.`tipo_consulta` (`idTipo_consulta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio_medico`.`farmaceutica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio_medico`.`farmaceutica` (
  `NIT` INT NOT NULL,
  `Nombre` VARCHAR(45) COLLATE 'utf8mb3_spanish_ci' NOT NULL,
  `Direccion` VARCHAR(100) COLLATE 'utf8mb3_spanish_ci' NULL DEFAULT NULL,
  `Telefono` VARCHAR(45) COLLATE 'utf8mb3_spanish_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`NIT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio_medico`.`medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio_medico`.`medicamento` (
  `idMedicamento` INT NOT NULL,
  `Nombre` VARCHAR(100) COLLATE 'utf8mb3_spanish_ci' NOT NULL,
  `Stock` INT NOT NULL,
  `Farmaceutica_NIT` INT NOT NULL,
  PRIMARY KEY (`idMedicamento`),
  INDEX `fk_Medicamento_Farmaceutica1_idx` (`Farmaceutica_NIT` ASC) VISIBLE,
  CONSTRAINT `fk_Medicamento_Farmaceutica`
    FOREIGN KEY (`Farmaceutica_NIT`)
    REFERENCES `consultorio_medico`.`farmaceutica` (`NIT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio_medico`.`consulta_medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio_medico`.`consulta_medicamento` (
  `Consulta_idConsulta` INT NOT NULL,
  `Medicamento_idMedicamento` INT NOT NULL,
  PRIMARY KEY (`Consulta_idConsulta`, `Medicamento_idMedicamento`),
  INDEX `fk_Consulta_has_Medicamento_Medicamento1_idx` (`Medicamento_idMedicamento` ASC) VISIBLE,
  INDEX `fk_Consulta_has_Medicamento_Consulta1_idx` (`Consulta_idConsulta` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_has_Medicamento_Consulta1`
    FOREIGN KEY (`Consulta_idConsulta`)
    REFERENCES `consultorio_medico`.`consulta` (`idConsulta`),
  CONSTRAINT `fk_Consulta_has_Medicamento_Medicamento1`
    FOREIGN KEY (`Medicamento_idMedicamento`)
    REFERENCES `consultorio_medico`.`medicamento` (`idMedicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio_medico`.`enfermedades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio_medico`.`enfermedades` (
  `idEnfermedades` INT NOT NULL,
  `Nombre` VARCHAR(100) COLLATE 'utf8mb3_spanish_ci' NOT NULL,
  PRIMARY KEY (`idEnfermedades`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorio_medico`.`historia_enfermedades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorio_medico`.`historia_enfermedades` (
  `Historia_idHistoria` INT NOT NULL,
  `Enfermedades_idEnfermedades` INT NOT NULL,
  PRIMARY KEY (`Historia_idHistoria`, `Enfermedades_idEnfermedades`),
  INDEX `fk_Historia_has_Enfermedades_Enfermedades1_idx` (`Enfermedades_idEnfermedades` ASC) VISIBLE,
  INDEX `fk_Historia_has_Enfermedades_Historia1_idx` (`Historia_idHistoria` ASC) VISIBLE,
  CONSTRAINT `fk_Historia_has_Enfermedades_Enfermedades`
    FOREIGN KEY (`Enfermedades_idEnfermedades`)
    REFERENCES `consultorio_medico`.`enfermedades` (`idEnfermedades`),
  CONSTRAINT `fk_Historia_has_Enfermedades_Historia`
    FOREIGN KEY (`Historia_idHistoria`)
    REFERENCES `consultorio_medico`.`historia` (`idHistoria`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
