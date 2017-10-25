-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema avalframeweb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema avalframeweb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `avalframeweb` DEFAULT CHARACTER SET utf8 ;
USE `avalframeweb` ;

-- -----------------------------------------------------
-- Table `avalframeweb`.`dispositivos_captura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avalframeweb`.`dispositivos_captura` (
  `codigo` INT(2) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `nome` (`nome` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `avalframeweb`.`aeej`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avalframeweb`.`aeej` (
  `codigo` INT(3) NOT NULL AUTO_INCREMENT,
  `codigo_dispositivo` INT(2) NOT NULL,
  `tipo` CHAR(1) NULL DEFAULT NULL,
  `descricao` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `descricao` (`descricao` ASC),
  INDEX `fk_aeej_dispositivos_captura1_idx` (`codigo_dispositivo` ASC),
  CONSTRAINT `fk_aeej_dispositivos_captura1`
    FOREIGN KEY (`codigo_dispositivo`)
    REFERENCES `avalframeweb`.`dispositivos_captura` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `avalframeweb`.`aprendizagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avalframeweb`.`aprendizagens` (
  `codigo` INT(3) NOT NULL AUTO_INCREMENT,
  `tipo` CHAR(1) NOT NULL,
  `titulo` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `titulo` (`titulo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `avalframeweb`.`jogos_digitais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avalframeweb`.`jogos_digitais` (
  `codigo` INT(3) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `avalframeweb`.`niveis_jogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avalframeweb`.`niveis_jogo` (
  `codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `codigo_jogo` INT(3) NOT NULL,
  `nivel` INT(2) NOT NULL,
  `titulo` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `uq_niveis` (`codigo_jogo` ASC, `nivel` ASC),
  INDEX `codigo_jogo` (`codigo_jogo` ASC),
  CONSTRAINT `fk_niveis_jogo_codigo_jogo`
    FOREIGN KEY (`codigo_jogo`)
    REFERENCES `avalframeweb`.`jogos_digitais` (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `avalframeweb`.`fases_jogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avalframeweb`.`fases_jogo` (
  `codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `fase` INT(2) NOT NULL,
  `codigo_jogo` INT(3) NOT NULL,
  `codigo_nivel` INT(2) NOT NULL,
  `titulo` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `uq_fases_jogo` (`fase` ASC, `codigo_jogo` ASC, `codigo_nivel` ASC),
  INDEX `fases_jogo_ibfk_1` (`codigo_jogo` ASC),
  INDEX `fases_jogo_ibfk_2` (`codigo_nivel` ASC),
  CONSTRAINT `fases_jogo_ibfk_1`
    FOREIGN KEY (`codigo_jogo`)
    REFERENCES `avalframeweb`.`jogos_digitais` (`codigo`),
  CONSTRAINT `fases_jogo_ibfk_2`
    FOREIGN KEY (`codigo_nivel`)
    REFERENCES `avalframeweb`.`niveis_jogo` (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `avalframeweb`.`etapas_jogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avalframeweb`.`etapas_jogo` (
  `codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `etapa` INT(2) NOT NULL,
  `codigo_jogo` INT(3) NOT NULL,
  `codigo_nivel` INT(2) NOT NULL,
  `codigo_fase` INT(2) NOT NULL,
  `titulo` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `uq_etapas_jogo` (`etapa` ASC, `codigo_jogo` ASC, `codigo_nivel` ASC, `codigo_fase` ASC),
  INDEX `codigo_jogo` (`codigo_jogo` ASC),
  INDEX `etapas_jogo_ibfk_2` (`codigo_nivel` ASC),
  INDEX `etapas_jogo_ibfk_3` (`codigo_fase` ASC),
  CONSTRAINT `etapas_jogo_ibfk_1`
    FOREIGN KEY (`codigo_jogo`)
    REFERENCES `avalframeweb`.`jogos_digitais` (`codigo`),
  CONSTRAINT `etapas_jogo_ibfk_22`
    FOREIGN KEY (`codigo_nivel`)
    REFERENCES `avalframeweb`.`niveis_jogo` (`codigo`),
  CONSTRAINT `etapas_jogo_ibfk_33`
    FOREIGN KEY (`codigo_fase`)
    REFERENCES `avalframeweb`.`fases_jogo` (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `avalframeweb`.`aprendizagens_aeej`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avalframeweb`.`aprendizagens_aeej` (
  `codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `codigo_aprendizagem` INT(3) NOT NULL,
  `codigo_jogo` INT(3) NOT NULL,
  `nivel_jogo` INT(2) NOT NULL,
  `fase_jogo` INT(2) NOT NULL,
  `etapa_jogo` INT(2) NOT NULL,
  `codigo_aeej` INT(3) NOT NULL,
  `tipo_operacao` CHAR(1) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `descritor_operacao` VARCHAR(30) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `valor_padrao` INT(3) NOT NULL,
  `contribuicao_do_aeej_na_aprendizagem` DECIMAL(5,4) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC),
  UNIQUE INDEX `uq_aprendizagens_aeej` (`codigo_aprendizagem` ASC, `codigo_jogo` ASC, `nivel_jogo` ASC, `fase_jogo` ASC, `etapa_jogo` ASC, `codigo_aeej` ASC),
  INDEX `codigo_aprendizagem_idx` (`codigo_aprendizagem` ASC),
  INDEX `codigo_jogo_idx` (`codigo_jogo` ASC),
  INDEX `FK_nivel_jogo_idx` (`nivel_jogo` ASC),
  INDEX `FK_fase_jogo_idx` (`fase_jogo` ASC),
  INDEX `FK_etapa_jogo_idx` (`etapa_jogo` ASC),
  INDEX `FK_codigo_aeej_idx` (`codigo_aeej` ASC),
  CONSTRAINT `FK_codigo_aeej`
    FOREIGN KEY (`codigo_aeej`)
    REFERENCES `avalframeweb`.`aeej` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_codigo_aprendizagem`
    FOREIGN KEY (`codigo_aprendizagem`)
    REFERENCES `avalframeweb`.`aprendizagens` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_codigo_jogo`
    FOREIGN KEY (`codigo_jogo`)
    REFERENCES `avalframeweb`.`jogos_digitais` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_etapa_jogo`
    FOREIGN KEY (`etapa_jogo`)
    REFERENCES `avalframeweb`.`etapas_jogo` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_fase_jogo`
    FOREIGN KEY (`fase_jogo`)
    REFERENCES `avalframeweb`.`fases_jogo` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_nivel_jogo`
    FOREIGN KEY (`nivel_jogo`)
    REFERENCES `avalframeweb`.`niveis_jogo` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `avalframeweb`.`competencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avalframeweb`.`competencias` (
  `codigo` INT(3) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(30) NOT NULL,
  `valor_maximo_pontos` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `titulo` (`titulo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `avalframeweb`.`competencias_aprendizagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avalframeweb`.`competencias_aprendizagens` (
  `codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `codigo_competencia` INT(3) NOT NULL,
  `codigo_aprendizagem` INT(3) NOT NULL,
  `contribuicao_da_aprendizagem_na_competencia` DECIMAL(5,4) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `uq_competencias_aprendizagens` (`codigo_competencia` ASC, `codigo_aprendizagem` ASC),
  INDEX `competencias_aprendizagens_ibfk_2` (`codigo_aprendizagem` ASC),
  CONSTRAINT `competencias_aprendizagens_ibfk_1`
    FOREIGN KEY (`codigo_competencia`)
    REFERENCES `avalframeweb`.`competencias` (`codigo`),
  CONSTRAINT `competencias_aprendizagens_ibfk_2`
    FOREIGN KEY (`codigo_aprendizagem`)
    REFERENCES `avalframeweb`.`aprendizagens` (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `avalframeweb`.`jogadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avalframeweb`.`jogadores` (
  `codigo` INT(3) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `sexo` CHAR(1) NULL DEFAULT NULL,
  `data_nascimento` DATE NULL DEFAULT NULL,
  `data_desde_quando_joga` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `avalframeweb`.`niveis_aprendizagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avalframeweb`.`niveis_aprendizagem` (
  `codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `nivel` INT(1) NOT NULL,
  `codigo_aprendizagem` INT(3) NOT NULL,
  `titulo` VARCHAR(20) NULL DEFAULT NULL,
  `inicio_nivel` DECIMAL(5,4) NULL DEFAULT NULL,
  `fim_nivel` DECIMAL(5,4) NULL DEFAULT NULL,
  `jogadores_nesse_nivel` DECIMAL(5,4) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `uq_niveis_aprendizagem` (`nivel` ASC, `codigo_aprendizagem` ASC),
  INDEX `codigo_aprendizagem` (`codigo_aprendizagem` ASC),
  CONSTRAINT `niveis_aprendizagem_ibfk_1`
    FOREIGN KEY (`codigo_aprendizagem`)
    REFERENCES `avalframeweb`.`aprendizagens` (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `avalframeweb`.`niveis_competencia_avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avalframeweb`.`niveis_competencia_avaliacao` (
  `codigo` INT(1) NOT NULL AUTO_INCREMENT,
  `codigo_competencia` INT(3) NULL DEFAULT NULL,
  `titulo` VARCHAR(20) NULL DEFAULT NULL,
  `inicio_nivel` DECIMAL(5,4) NULL DEFAULT NULL,
  `fim_nivel` DECIMAL(5,4) NULL DEFAULT NULL,
  `jogadores_nesse_nivel` DECIMAL(5,4) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `codigo_competencia` (`codigo_competencia` ASC),
  CONSTRAINT `niveis_competencia_avaliacao_ibfk_1`
    FOREIGN KEY (`codigo_competencia`)
    REFERENCES `avalframeweb`.`competencias` (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
