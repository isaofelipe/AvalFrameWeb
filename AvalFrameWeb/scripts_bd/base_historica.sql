-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema base_historica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema base_historica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `base_historica` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `base_historica` ;

-- -----------------------------------------------------
-- Table `base_historica`.`relatorio_alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_historica`.`relatorio_alunos` (
  `codigo` INT PRIMARY KEY auto_increment,
  `codigo_jogador` INT NOT NULL COMMENT '',
  `data_inicio_sessao_jogo` DATE NULL COMMENT '',
  `hora_inicio_sessao_jogo` TIME NULL COMMENT '',
  `codigo_jogo` INT NOT NULL COMMENT '',
  `nivel_jogo` INT NOT NULL COMMENT '',
  `fase_jogo` INT NOT NULL COMMENT '',
  `etapa_jogo` INT NOT NULL COMMENT '',
  `codigo_aeej` INT NOT NULL COMMENT '',
  `tipo_aeej` CHAR(1) NULL COMMENT '',
  `valor_aeej` INT NULL COMMENT '',
  `data_gravacao` DATE NULL COMMENT '',
  `hora_gravacao` TIME NULL COMMENT ''
  )
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
