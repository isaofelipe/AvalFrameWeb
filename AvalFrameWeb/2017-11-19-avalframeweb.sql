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
  `codigo` int(3) NOT NULL AUTO_INCREMENT,
  `codigo_dispositivo` int(2) NOT NULL,
  `tipo` char(1) DEFAULT NULL,
  `descricao` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `descricao` (`descricao`),
  KEY `fk_aeej_dispositivos_captura1_idx` (`codigo_dispositivo`),
  CONSTRAINT `fk_aeej_dispositivos_captura1` FOREIGN KEY (`codigo_dispositivo`) REFERENCES `dispositivos_captura` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeej`
--

LOCK TABLES `aeej` WRITE;
/*!40000 ALTER TABLE `aeej` DISABLE KEYS */;
INSERT INTO `aeej` VALUES (2,1,'A','fds'),(3,1,'T','fdsfdsf');
/*!40000 ALTER TABLE `aeej` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aprendizagens`
--

DROP TABLE IF EXISTS `aprendizagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aprendizagens` (
  `codigo` int(3) NOT NULL AUTO_INCREMENT,
  `tipo` char(1) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `valor_maximo` int(3) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `titulo` (`titulo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprendizagens`
--

LOCK TABLES `aprendizagens` WRITE;
/*!40000 ALTER TABLE `aprendizagens` DISABLE KEYS */;
INSERT INTO `aprendizagens` VALUES (1,'H','Habj',10),(2,'C','Comp',10);
/*!40000 ALTER TABLE `aprendizagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aprendizagens_aeej`
--

DROP TABLE IF EXISTS `aprendizagens_aeej`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aprendizagens_aeej` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
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
  UNIQUE KEY `uq_aprendizagens_aeej` (`codigo_aprendizagem`,`codigo_jogo`,`nivel_jogo`,`fase_jogo`,`etapa_jogo`,`codigo_aeej`),
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
  CONSTRAINT `FK_nivel_jogo` FOREIGN KEY (`nivel_jogo`) REFERENCES `niveis_jogo` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `base_consolidada`
--

DROP TABLE IF EXISTS `base_consolidada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_consolidada` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_jogador` int(3) DEFAULT NULL,
  `data_inicio_jogo` date DEFAULT NULL,
  `hora_inicio_jogo` time DEFAULT NULL,
  `codigo_jogo` int(3) DEFAULT NULL,
  `codigo_aprendizagem` int(3) DEFAULT NULL,
  `valor_aprendizagem` float DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_consolidada`
--

LOCK TABLES `base_consolidada` WRITE;
/*!40000 ALTER TABLE `base_consolidada` DISABLE KEYS */;
INSERT INTO `base_consolidada` VALUES (1,1,'2017-01-01','00:00:00',1,1,4),(2,1,'2017-01-01',NULL,1,1,9);
/*!40000 ALTER TABLE `base_consolidada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competencias`
--

DROP TABLE IF EXISTS `competencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competencias` (
  `codigo` int(3) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) NOT NULL,
  `valor_maximo_pontos` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `titulo` (`titulo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencias`
--

LOCK TABLES `competencias` WRITE;
/*!40000 ALTER TABLE `competencias` DISABLE KEYS */;
INSERT INTO `competencias` VALUES (1,'Competencia 1',10),(2,'Competencia 2',10);
/*!40000 ALTER TABLE `competencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competencias_aprendizagens`
--

DROP TABLE IF EXISTS `competencias_aprendizagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competencias_aprendizagens` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_competencia` int(3) NOT NULL,
  `codigo_aprendizagem` int(3) NOT NULL,
  `contribuicao_da_aprendizagem_na_competencia` decimal(5,4) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `uq_competencias_aprendizagens` (`codigo_competencia`,`codigo_aprendizagem`),
  KEY `competencias_aprendizagens_ibfk_2` (`codigo_aprendizagem`),
  CONSTRAINT `competencias_aprendizagens_ibfk_1` FOREIGN KEY (`codigo_competencia`) REFERENCES `competencias` (`codigo`),
  CONSTRAINT `competencias_aprendizagens_ibfk_2` FOREIGN KEY (`codigo_aprendizagem`) REFERENCES `aprendizagens` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencias_aprendizagens`
--

LOCK TABLES `competencias_aprendizagens` WRITE;
/*!40000 ALTER TABLE `competencias_aprendizagens` DISABLE KEYS */;
INSERT INTO `competencias_aprendizagens` VALUES (1,1,1,0.1000),(2,1,2,0.9000);
/*!40000 ALTER TABLE `competencias_aprendizagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispositivos_captura`
--

DROP TABLE IF EXISTS `dispositivos_captura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispositivos_captura` (
  `codigo` int(2) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispositivos_captura`
--

LOCK TABLES `dispositivos_captura` WRITE;
/*!40000 ALTER TABLE `dispositivos_captura` DISABLE KEYS */;
INSERT INTO `dispositivos_captura` VALUES (1,'Disp');
/*!40000 ALTER TABLE `dispositivos_captura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapas_jogo`
--

DROP TABLE IF EXISTS `etapas_jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etapas_jogo` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `etapa` int(2) NOT NULL,
  `codigo_jogo` int(3) NOT NULL,
  `codigo_nivel` int(2) NOT NULL,
  `codigo_fase` int(2) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `uq_etapas_jogo` (`etapa`,`codigo_jogo`,`codigo_nivel`,`codigo_fase`),
  KEY `codigo_jogo` (`codigo_jogo`),
  KEY `etapas_jogo_ibfk_2` (`codigo_nivel`),
  KEY `etapas_jogo_ibfk_3` (`codigo_fase`),
  CONSTRAINT `etapas_jogo_ibfk_1` FOREIGN KEY (`codigo_jogo`) REFERENCES `jogos_digitais` (`codigo`),
  CONSTRAINT `etapas_jogo_ibfk_22` FOREIGN KEY (`codigo_nivel`) REFERENCES `niveis_jogo` (`codigo`),
  CONSTRAINT `etapas_jogo_ibfk_33` FOREIGN KEY (`codigo_fase`) REFERENCES `fases_jogo` (`codigo`)
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
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `fase` int(2) NOT NULL,
  `codigo_jogo` int(3) NOT NULL,
  `codigo_nivel` int(2) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `uq_fases_jogo` (`fase`,`codigo_jogo`,`codigo_nivel`),
  KEY `fases_jogo_ibfk_1` (`codigo_jogo`),
  KEY `fases_jogo_ibfk_2` (`codigo_nivel`),
  CONSTRAINT `fases_jogo_ibfk_1` FOREIGN KEY (`codigo_jogo`) REFERENCES `jogos_digitais` (`codigo`),
  CONSTRAINT `fases_jogo_ibfk_2` FOREIGN KEY (`codigo_nivel`) REFERENCES `niveis_jogo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fases_jogo`
--

LOCK TABLES `fases_jogo` WRITE;
/*!40000 ALTER TABLE `fases_jogo` DISABLE KEYS */;
INSERT INTO `fases_jogo` VALUES (1,1,1,1,'Fase S');
/*!40000 ALTER TABLE `fases_jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_registro`
--

DROP TABLE IF EXISTS `historico_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_registro` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_jogador` int(6) DEFAULT NULL,
  `data_inicio_jogo` date DEFAULT NULL,
  `hora_inicio_jogo` time DEFAULT NULL,
  `codigo_jogo` int(3) DEFAULT NULL,
  `nivel_jogo` int(2) DEFAULT NULL,
  `fase_jogo` int(2) DEFAULT NULL,
  `etapa_jogo` int(2) DEFAULT NULL,
  `codigo_aeej` int(3) DEFAULT NULL,
  `tipo_aeej` varchar(1) DEFAULT NULL,
  `valor1` int(4) DEFAULT NULL,
  `valor2` int(4) DEFAULT NULL,
  `valor3` int(4) DEFAULT NULL,
  `data_gravacao` date DEFAULT NULL,
  `hora_gravacao` time DEFAULT NULL,
  `nome_arquivo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_registro`
--

LOCK TABLES `historico_registro` WRITE;
/*!40000 ALTER TABLE `historico_registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogadores`
--

DROP TABLE IF EXISTS `jogadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jogadores` (
  `codigo` int(3) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `data_desde_quando_joga` date DEFAULT NULL,
  `coeficiente_de_rendimento` float(4,2) DEFAULT NULL,
  `tipo_jogo_preferido` int(1) DEFAULT NULL,
  `perfil_recomendacao` int(1) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogadores`
--

LOCK TABLES `jogadores` WRITE;
/*!40000 ALTER TABLE `jogadores` DISABLE KEYS */;
INSERT INTO `jogadores` VALUES (1,'Joao','M','1991-01-01','1991-05-05',NULL,NULL,NULL),(2,'Jose','F','1997-01-01','2002-01-01',NULL,NULL,NULL);
/*!40000 ALTER TABLE `jogadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogos_digitais`
--

DROP TABLE IF EXISTS `jogos_digitais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jogos_digitais` (
  `codigo` int(3) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogos_digitais`
--

LOCK TABLES `jogos_digitais` WRITE;
/*!40000 ALTER TABLE `jogos_digitais` DISABLE KEYS */;
INSERT INTO `jogos_digitais` VALUES (1,'Jogo 1'),(2,'Jogo 2');
/*!40000 ALTER TABLE `jogos_digitais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveis_aprendizagem`
--

DROP TABLE IF EXISTS `niveis_aprendizagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveis_aprendizagem` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` int(1) NOT NULL,
  `codigo_aprendizagem` int(3) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `inicio_nivel` decimal(5,4) DEFAULT NULL,
  `fim_nivel` decimal(5,4) DEFAULT NULL,
  `jogadores_nesse_nivel` decimal(5,4) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `uq_niveis_aprendizagem` (`nivel`,`codigo_aprendizagem`),
  KEY `codigo_aprendizagem` (`codigo_aprendizagem`),
  CONSTRAINT `niveis_aprendizagem_ibfk_1` FOREIGN KEY (`codigo_aprendizagem`) REFERENCES `aprendizagens` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveis_aprendizagem`
--

LOCK TABLES `niveis_aprendizagem` WRITE;
/*!40000 ALTER TABLE `niveis_aprendizagem` DISABLE KEYS */;
INSERT INTO `niveis_aprendizagem` VALUES (1,1,1,'Ruim',0.0000,0.5000,NULL),(2,2,1,'Bom',0.5000,1.0000,NULL);
/*!40000 ALTER TABLE `niveis_aprendizagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveis_competencia_avaliacao`
--

DROP TABLE IF EXISTS `niveis_competencia_avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveis_competencia_avaliacao` (
  `codigo` int(1) NOT NULL AUTO_INCREMENT,
  `codigo_competencia` int(3) DEFAULT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `inicio_nivel` decimal(5,4) DEFAULT NULL,
  `fim_nivel` decimal(5,4) DEFAULT NULL,
  `jogadores_nesse_nivel` decimal(5,4) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_competencia` (`codigo_competencia`),
  CONSTRAINT `niveis_competencia_avaliacao_ibfk_1` FOREIGN KEY (`codigo_competencia`) REFERENCES `competencias` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveis_competencia_avaliacao`
--

LOCK TABLES `niveis_competencia_avaliacao` WRITE;
/*!40000 ALTER TABLE `niveis_competencia_avaliacao` DISABLE KEYS */;
INSERT INTO `niveis_competencia_avaliacao` VALUES (1,1,'Baixo',0.0000,0.5000,NULL),(2,1,'Alto',0.5000,1.0000,NULL);
/*!40000 ALTER TABLE `niveis_competencia_avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveis_jogo`
--

DROP TABLE IF EXISTS `niveis_jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveis_jogo` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_jogo` int(3) NOT NULL,
  `nivel` int(2) NOT NULL,
  `titulo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `uq_niveis` (`codigo_jogo`,`nivel`),
  KEY `codigo_jogo` (`codigo_jogo`),
  CONSTRAINT `fk_niveis_jogo_codigo_jogo` FOREIGN KEY (`codigo_jogo`) REFERENCES `jogos_digitais` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveis_jogo`
--

LOCK TABLES `niveis_jogo` WRITE;
/*!40000 ALTER TABLE `niveis_jogo` DISABLE KEYS */;
INSERT INTO `niveis_jogo` VALUES (1,1,1,'Facil'),(2,1,2,'Médio'),(3,2,1,'Facil'),(4,2,2,'Médio');
/*!40000 ALTER TABLE `niveis_jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_aluno_aprendizagem`
--

DROP TABLE IF EXISTS `vw_aluno_aprendizagem`;
/*!50001 DROP VIEW IF EXISTS `vw_aluno_aprendizagem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_aluno_aprendizagem` AS SELECT 
 1 AS `codigo`,
 1 AS `nome_jogador`,
 1 AS `titulo_aprendizagem`,
 1 AS `data_inicio_jogo`,
 1 AS `hora_inicio_jogo`,
 1 AS `valor_aprendizagem`,
 1 AS `titulo_nivel_aprendizagem`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'avalframeweb'
--

--
-- Final view structure for view `vw_aluno_aprendizagem`
--

/*!50001 DROP VIEW IF EXISTS `vw_aluno_aprendizagem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_aluno_aprendizagem` AS select `bc`.`codigo` AS `codigo`,`j`.`nome` AS `nome_jogador`,`a`.`titulo` AS `titulo_aprendizagem`,`bc`.`data_inicio_jogo` AS `data_inicio_jogo`,`bc`.`hora_inicio_jogo` AS `hora_inicio_jogo`,`bc`.`valor_aprendizagem` AS `valor_aprendizagem`,`na`.`titulo` AS `titulo_nivel_aprendizagem` from (((`base_consolidada` `bc` join `aprendizagens` `a` on((`bc`.`codigo_aprendizagem` = `a`.`codigo`))) join `niveis_aprendizagem` `na` on(((`bc`.`valor_aprendizagem` / `a`.`valor_maximo`) between `na`.`inicio_nivel` and `na`.`fim_nivel`))) join `jogadores` `j` on((`bc`.`codigo_jogador` = `j`.`codigo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-19 17:08:41
