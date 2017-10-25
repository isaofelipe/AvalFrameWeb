CREATE DATABASE  IF NOT EXISTS `avalframeweb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `avalframeweb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: avalframeweb
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aeej`
--

DROP TABLE IF EXISTS `aeej`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aeej` (
  `codigo` int(3) NOT NULL,
  `codigo_jogo` int(3) DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `descricao` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_jogo` (`codigo_jogo`),
  CONSTRAINT `aeej_ibfk_1` FOREIGN KEY (`codigo_jogo`) REFERENCES `jogos_digitais` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aprendizagens`
--

DROP TABLE IF EXISTS `aprendizagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aprendizagens` (
  `codigo` int(3) NOT NULL,
  `tipo` char(1) DEFAULT NULL,
  `titulo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `competencias`
--

DROP TABLE IF EXISTS `competencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competencias` (
  `codigo` int(3) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `valor_maximo_pontos` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `competencias_aprendizagens`
--

DROP TABLE IF EXISTS `competencias_aprendizagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competencias_aprendizagens` (
  `codigo_competencia` int(3) NOT NULL,
  `codigo_apredizagem` int(3) NOT NULL,
  `contribuicao_da_apredizagem_na_competencia` decimal(5,4) DEFAULT NULL,
  PRIMARY KEY (`codigo_competencia`,`codigo_apredizagem`),
  KEY `codigo_apredizagem` (`codigo_apredizagem`),
  CONSTRAINT `competencias_aprendizagens_ibfk_1` FOREIGN KEY (`codigo_competencia`) REFERENCES `competencias` (`codigo`),
  CONSTRAINT `competencias_aprendizagens_ibfk_2` FOREIGN KEY (`codigo_apredizagem`) REFERENCES `aprendizagens` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `etapas_jogo`
--

DROP TABLE IF EXISTS `etapas_jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etapas_jogo` (
  `codigo` int(2) NOT NULL,
  `codigo_jogo` int(3) NOT NULL,
  `codigo_nivel` int(2) NOT NULL,
  `codigo_fase` int(2) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`codigo_jogo`,`codigo_nivel`,`codigo_fase`),
  KEY `codigo_jogo` (`codigo_jogo`),
  KEY `etapas_jogo_ibfk_2` (`codigo_nivel`),
  KEY `etapas_jogo_ibfk_3` (`codigo_fase`),
  CONSTRAINT `etapas_jogo_ibfk_1` FOREIGN KEY (`codigo_jogo`) REFERENCES `jogos_digitais` (`codigo`),
  CONSTRAINT `etapas_jogo_ibfk_2` FOREIGN KEY (`codigo_nivel`) REFERENCES `niveis_jogo` (`codigo`),
  CONSTRAINT `etapas_jogo_ibfk_3` FOREIGN KEY (`codigo_fase`) REFERENCES `fases_jogo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fases_jogo`
--

DROP TABLE IF EXISTS `fases_jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fases_jogo` (
  `codigo` int(2) NOT NULL,
  `codigo_jogo` int(3) NOT NULL,
  `codigo_nivel` int(2) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`codigo_jogo`,`codigo_nivel`),
  KEY `codigo_jogo` (`codigo_jogo`),
  KEY `fases_jogo_ibfk_2` (`codigo_nivel`),
  CONSTRAINT `fases_jogo_ibfk_1` FOREIGN KEY (`codigo_jogo`) REFERENCES `jogos_digitais` (`codigo`),
  CONSTRAINT `fases_jogo_ibfk_2` FOREIGN KEY (`codigo_nivel`) REFERENCES `niveis_jogo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jogos_digitais`
--

DROP TABLE IF EXISTS `jogos_digitais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jogos_digitais` (
  `codigo` int(3) NOT NULL,
  `titulo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `niveis_de_apredizagem`
--

DROP TABLE IF EXISTS `niveis_de_apredizagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveis_de_apredizagem` (
  `codigo` int(1) NOT NULL,
  `codigo_apredizagem` int(3) DEFAULT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `inicio_nivel` decimal(5,4) DEFAULT NULL,
  `fim_nivel` decimal(5,4) DEFAULT NULL,
  `jogadores_nesse_nivel` decimal(5,4) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_apredizagem` (`codigo_apredizagem`),
  CONSTRAINT `niveis_de_apredizagem_ibfk_1` FOREIGN KEY (`codigo_apredizagem`) REFERENCES `aprendizagens` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `niveis_de_competencia_avaliacao`
--

DROP TABLE IF EXISTS `niveis_de_competencia_avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveis_de_competencia_avaliacao` (
  `codigo` int(1) NOT NULL,
  `codigo_competencia` int(3) DEFAULT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `inicio_nivel` decimal(5,4) DEFAULT NULL,
  `fim_nivel` decimal(5,4) DEFAULT NULL,
  `jogadores_nesse_nivel` decimal(5,4) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_competencia` (`codigo_competencia`),
  CONSTRAINT `niveis_de_competencia_avaliacao_ibfk_1` FOREIGN KEY (`codigo_competencia`) REFERENCES `competencias` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `niveis_jogo`
--

DROP TABLE IF EXISTS `niveis_jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveis_jogo` (
  `codigo` int(2) NOT NULL,
  `codigo_jogo` int(3) NOT NULL,
  `titulo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`codigo_jogo`),
  KEY `codigo_jogo` (`codigo_jogo`),
  CONSTRAINT `niveis_jogo_ibfk_1` FOREIGN KEY (`codigo_jogo`) REFERENCES `jogos_digitais` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-10 19:19:35
