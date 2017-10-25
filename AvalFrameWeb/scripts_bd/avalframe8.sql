CREATE DATABASE  IF NOT EXISTS `avalframeweb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `avalframeweb`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: avalframeweb
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
  `codigo` int(3) auto_increment,
  `codigo_jogo` int(3) DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `descricao` varchar(30) NOT NULL UNIQUE,
  PRIMARY KEY (`codigo`),
  KEY `codigo_jogo` (`codigo_jogo`),
  CONSTRAINT `aeej_ibfk_1` FOREIGN KEY (`codigo_jogo`) REFERENCES `jogos_digitais` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeej`
--

LOCK TABLES `aeej` WRITE;
/*!40000 ALTER TABLE `aeej` DISABLE KEYS */;
/*!40000 ALTER TABLE `aeej` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aprendizagens`
--

DROP TABLE IF EXISTS `aprendizagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aprendizagens` (
  `codigo` int(3) auto_increment,
  `tipo` char(1) NOT NULL,
  `titulo` varchar(30) NOT NULL UNIQUE,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprendizagens`
--

LOCK TABLES `aprendizagens` WRITE;
/*!40000 ALTER TABLE `aprendizagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aprendizagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aprendizagens_aeej`
--

DROP TABLE IF EXISTS `aprendizagens_aeej`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aprendizagens_aeej` (
  `codigo` int auto_increment,
  `codigo_aprendizagem` int(3) NOT NULL,
  `codigo_jogo` int(3) NOT NULL,
  `nivel_jogo` int(2) NOT NULL,
  `fase_jogo` int(2) NOT NULL,
  `etapa_jogo` int(2) NOT NULL,
  `codigo_aeej` int(3) NOT NULL,
  `tipo_operacao` char(1) COLLATE utf8_bin NOT NULL,
  `descritor_operacao` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `valor_padrao` int(3) NOT NULL,
  `contribuicao_do_aeej_na_aprendizagem` decimal(5,4) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `codigo_aprendizagem_idx` (`codigo_aprendizagem`),
  KEY `codigo_jogo_idx` (`codigo_jogo`),
  KEY `FK_nivel_jogo_idx` (`nivel_jogo`),
  KEY `FK_fase_jogo_idx` (`fase_jogo`),
  KEY `FK_etapa_jogo_idx` (`etapa_jogo`),
  KEY `FK_codigo_aeej_idx` (`codigo_aeej`),
  CONSTRAINT `FK_codigo_aeej` FOREIGN KEY (`codigo_aeej`) REFERENCES `aeej` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_codigo_aprendizagem` FOREIGN KEY (`codigo_aprendizagem`) REFERENCES `aprendizagens` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_codigo_jogo` FOREIGN KEY (`codigo_jogo`) REFERENCES `jogos_digitais` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_etapa_jogo` FOREIGN KEY (`etapa_jogo`) REFERENCES `etapas_jogo` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_fase_jogo` FOREIGN KEY (`fase_jogo`) REFERENCES `fases_jogo` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_nivel_jogo` FOREIGN KEY (`nivel_jogo`) REFERENCES `niveis_jogo` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `uq_aprendizagens_aeej` UNIQUE (`codigo_aprendizagem`,`codigo_jogo`,`nivel_jogo`,`fase_jogo`,`etapa_jogo`,`codigo_aeej`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprendizagens_aeej`
--

LOCK TABLES `aprendizagens_aeej` WRITE;
/*!40000 ALTER TABLE `aprendizagens_aeej` DISABLE KEYS */;
/*!40000 ALTER TABLE `aprendizagens_aeej` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aprendizagens_dadosmultimodais`
--

DROP TABLE IF EXISTS `aprendizagens_dadosmultimodais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aprendizagens_dadosmultimodais` (
  `codigo` int(3) NOT NULL auto_increment,
  `codigo_aprendizagem` int(3) NOT NULL,
  `codigo_dispositivo` int(3) NOT NULL,
  `codigo_dadomultimodal` int(3) NOT NULL,
  `tipo_operacao` char(1) NOT NULL,
  `descritor_operacao` varchar(30) DEFAULT NULL,
  `valor` int(3) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_codigo_aprendizagem_idx` (`codigo_aprendizagem`),
  KEY `FK_codigo_dispositivo_idx` (`codigo_dispositivo`),
  KEY `FK_codigo_dadomultimodal_idx` (`codigo_dadomultimodal`),
  CONSTRAINT `FK_cod_aprendizagem` FOREIGN KEY (`codigo_aprendizagem`) REFERENCES `aprendizagens` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cod_dispositivo` FOREIGN KEY (`codigo_dispositivo`) REFERENCES `dispositivos_captura` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_codigo_dadomultimodal` FOREIGN KEY (`codigo_dadomultimodal`) REFERENCES `dados_multimodais` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `uq_aprendizagens_dadosmultimodais` UNIQUE (`codigo_aprendizagem`,`codigo_dispositivo`,`codigo_dadomultimodal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprendizagens_dadosmultimodais`
--

LOCK TABLES `aprendizagens_dadosmultimodais` WRITE;
/*!40000 ALTER TABLE `aprendizagens_dadosmultimodais` DISABLE KEYS */;
/*!40000 ALTER TABLE `aprendizagens_dadosmultimodais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competencias`
--

DROP TABLE IF EXISTS `competencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competencias` (
  `codigo` int(3) auto_increment,
  `titulo` varchar(30) NOT NULL UNIQUE,
  `valor_maximo_pontos` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencias`
--

LOCK TABLES `competencias` WRITE;
/*!40000 ALTER TABLE `competencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `competencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competencias_aprendizagens`
--

DROP TABLE IF EXISTS `competencias_aprendizagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competencias_aprendizagens` (
  `codigo` int PRIMARY KEY auto_increment,
  `codigo_competencia` int(3) NOT NULL,
  `codigo_aprendizagem` int(3) NOT NULL,
  `contribuicao_da_aprendizagem_na_competencia` decimal(5,4) DEFAULT NULL,
  CONSTRAINT `competencias_aprendizagens_ibfk_1` FOREIGN KEY (`codigo_competencia`) REFERENCES `competencias` (`codigo`),
  CONSTRAINT `competencias_aprendizagens_ibfk_2` FOREIGN KEY (`codigo_aprendizagem`) REFERENCES `aprendizagens` (`codigo`),
  CONSTRAINT `uq_competencias_aprendizagens` UNIQUE (`codigo_competencia`,`codigo_aprendizagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencias_aprendizagens`
--

LOCK TABLES `competencias_aprendizagens` WRITE;
/*!40000 ALTER TABLE `competencias_aprendizagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `competencias_aprendizagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dados_multimodais`
--

DROP TABLE IF EXISTS `dados_multimodais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dados_multimodais` (
  `codigo_dispositivo` int(2) NOT NULL,
  `codigo` int(2) auto_increment,
  `nome` varchar(30) NOT NULL UNIQUE,
  `codigo_unidade_medida` int(2) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_unidade_medida_idx` (`codigo_unidade_medida`),
  KEY `codigo_dispositivo` (`codigo_dispositivo`),
  CONSTRAINT `codigo_dispositivo` FOREIGN KEY (`codigo_dispositivo`) REFERENCES `dispositivos_captura` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `codigo_unidade_medida` FOREIGN KEY (`codigo_unidade_medida`) REFERENCES `unidades_medida` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dados_multimodais`
--

LOCK TABLES `dados_multimodais` WRITE;
/*!40000 ALTER TABLE `dados_multimodais` DISABLE KEYS */;
/*!40000 ALTER TABLE `dados_multimodais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispositivos_captura`
--

DROP TABLE IF EXISTS `dispositivos_captura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispositivos_captura` (
  `codigo` int(2) auto_increment,
  `tipo` char(1) DEFAULT NULL,
  `nome` varchar(30) NOT NULL UNIQUE,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispositivos_captura`
--

LOCK TABLES `dispositivos_captura` WRITE;
/*!40000 ALTER TABLE `dispositivos_captura` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispositivos_captura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapas_jogo`
--

DROP TABLE IF EXISTS `etapas_jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etapas_jogo` (
  `codigo` int PRIMARY KEY auto_increment,
  `etapa` int(2) NOT NULL,
  `codigo_jogo` int(3) NOT NULL,
  `codigo_nivel` int(2) NOT NULL,
  `codigo_fase` int(2) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  KEY `codigo_jogo` (`codigo_jogo`),
  KEY `etapas_jogo_ibfk_2` (`codigo_nivel`),
  KEY `etapas_jogo_ibfk_3` (`codigo_fase`),
  CONSTRAINT `etapas_jogo_ibfk_1` FOREIGN KEY (`codigo_jogo`) REFERENCES `jogos_digitais` (`codigo`),
  CONSTRAINT `etapas_jogo_ibfk_22` FOREIGN KEY (`codigo_nivel`) REFERENCES `niveis_jogo` (`codigo`),
  CONSTRAINT `etapas_jogo_ibfk_33` FOREIGN KEY (`codigo_fase`) REFERENCES `fases_jogo` (`codigo`),
  constraint `uq_etapas_jogo` UNIQUE (`etapa`,`codigo_jogo`,`codigo_nivel`,`codigo_fase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapas_jogo`
--

LOCK TABLES `etapas_jogo` WRITE;
/*!40000 ALTER TABLE `etapas_jogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `etapas_jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fases_jogo`
--

DROP TABLE IF EXISTS `fases_jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fases_jogo` (
  `codigo` int PRIMARY KEY auto_increment,
  `fase` int(2) NOT NULL,
  `codigo_jogo` int(3) NOT NULL,
  `codigo_nivel` int(2) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  CONSTRAINT `fases_jogo_ibfk_1` FOREIGN KEY (`codigo_jogo`) REFERENCES `jogos_digitais` (`codigo`),
  CONSTRAINT `fases_jogo_ibfk_2` FOREIGN KEY (`codigo_nivel`) REFERENCES `niveis_jogo` (`codigo`),
  CONSTRAINT `uq_fases_jogo` UNIQUE (`fase`,`codigo_jogo`,`codigo_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fases_jogo`
--

LOCK TABLES `fases_jogo` WRITE;
/*!40000 ALTER TABLE `fases_jogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `fases_jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogadores`
--

DROP TABLE IF EXISTS `jogadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jogadores` (
  `codigo` int(3) auto_increment,
  `nome` varchar(30) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `data_desde_quando_joga` date DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogadores`
--

LOCK TABLES `jogadores` WRITE;
/*!40000 ALTER TABLE `jogadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `jogadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogos_digitais`
--

DROP TABLE IF EXISTS `jogos_digitais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jogos_digitais` (
  `codigo` int(3) auto_increment,
  `titulo` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogos_digitais`
--

LOCK TABLES `jogos_digitais` WRITE;
/*!40000 ALTER TABLE `jogos_digitais` DISABLE KEYS */;
/*!40000 ALTER TABLE `jogos_digitais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveis_aprendizagem`
--

DROP TABLE IF EXISTS `niveis_aprendizagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveis_aprendizagem` (
  `codigo` int primary key auto_increment,
  `nivel` int(1) NOT NULL,
  `codigo_aprendizagem` int(3) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `inicio_nivel` decimal(5,4) DEFAULT NULL,
  `fim_nivel` decimal(5,4) DEFAULT NULL,
  `jogadores_nesse_nivel` decimal(5,4) DEFAULT NULL,
  KEY `codigo_aprendizagem` (`codigo_aprendizagem`),
  CONSTRAINT `niveis_aprendizagem_ibfk_1` FOREIGN KEY (`codigo_aprendizagem`) REFERENCES `aprendizagens` (`codigo`),
  constraint `uq_niveis_aprendizagem` UNIQUE (`nivel`,`codigo_aprendizagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveis_aprendizagem`
--

LOCK TABLES `niveis_aprendizagem` WRITE;
/*!40000 ALTER TABLE `niveis_aprendizagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `niveis_aprendizagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveis_competencia_avaliacao`
--

DROP TABLE IF EXISTS `niveis_competencia_avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveis_competencia_avaliacao` (
  `codigo` int(1) auto_increment,
  `codigo_competencia` int(3) DEFAULT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `inicio_nivel` decimal(5,4) DEFAULT NULL,
  `fim_nivel` decimal(5,4) DEFAULT NULL,
  `jogadores_nesse_nivel` decimal(5,4) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_competencia` (`codigo_competencia`),
  CONSTRAINT `niveis_competencia_avaliacao_ibfk_1` FOREIGN KEY (`codigo_competencia`) REFERENCES `competencias` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveis_competencia_avaliacao`
--

LOCK TABLES `niveis_competencia_avaliacao` WRITE;
/*!40000 ALTER TABLE `niveis_competencia_avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `niveis_competencia_avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveis_jogo`
--

DROP TABLE IF EXISTS `niveis_jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveis_jogo` (
  `codigo` int PRIMARY KEY auto_increment,
  `codigo_jogo` int(3) NOT NULL,
  `nivel` int(2) NOT NULL,
  `titulo` varchar(30) DEFAULT NULL,
  KEY `codigo_jogo` (`codigo_jogo`),
  CONSTRAINT `fk_niveis_jogo_codigo_jogo` FOREIGN KEY (`codigo_jogo`) REFERENCES `jogos_digitais` (`codigo`),
  CONSTRAINT `uq_niveis` UNIQUE (`codigo_jogo`,`nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveis_jogo`
--

LOCK TABLES `niveis_jogo` WRITE;
/*!40000 ALTER TABLE `niveis_jogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `niveis_jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades_medida`
--

DROP TABLE IF EXISTS `unidades_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidades_medida` (
  `codigo` int(2) auto_increment,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades_medida`
--

LOCK TABLES `unidades_medida` WRITE;
/*!40000 ALTER TABLE `unidades_medida` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidades_medida` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
