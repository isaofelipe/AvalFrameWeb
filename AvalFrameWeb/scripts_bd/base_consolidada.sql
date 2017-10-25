-- MySQL Workbench Forward Engineering
-- -----------------------------------------------------
-- Schema base_consolidada
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema base_consolidada
-- -----------------------------------------------------
CREATE DATABASE base_consolidada DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE base_consolidada;


-- -----------------------------------------------------
-- Table `base_consolidada`.`aeej_aprendizagens_dados`
-- -----------------------------------------------------
CREATE TABLE base_consolidada.aeej_aprendizagens_dados (
  codigo INT NOT NULL AUTO_INCREMENT COMMENT '',
  codigo_jogador INT NOT NULL COMMENT '',
  data_inicio_jogo DATE NULL COMMENT '',
  hora_inicio_jogo TIME NULL COMMENT '',
  codigo_aprendizagem INT NULL COMMENT '',
  valor_aprendizagem DECIMAL NULL COMMENT '',
  PRIMARY KEY (codigo)  COMMENT '')
ENGINE = InnoDB;
