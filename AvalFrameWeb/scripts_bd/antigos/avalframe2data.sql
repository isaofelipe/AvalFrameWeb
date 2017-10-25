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
-- Dumping data for table `aeej`
--

LOCK TABLES `aeej` WRITE;
/*!40000 ALTER TABLE `aeej` DISABLE KEYS */;
/*!40000 ALTER TABLE `aeej` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `aprendizagens`
--

LOCK TABLES `aprendizagens` WRITE;
/*!40000 ALTER TABLE `aprendizagens` DISABLE KEYS */;
INSERT INTO `aprendizagens` VALUES (1,'D','DSDS');
/*!40000 ALTER TABLE `aprendizagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `competencias`
--

LOCK TABLES `competencias` WRITE;
/*!40000 ALTER TABLE `competencias` DISABLE KEYS */;
INSERT INTO `competencias` VALUES (1,'cc',10),(3,'competencia1',80),(4,'sdads',122),(8,'Cãopetencia',55),(9,'Competencia2',50),(12,'cincin',80);
/*!40000 ALTER TABLE `competencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `competencias_aprendizagens`
--

LOCK TABLES `competencias_aprendizagens` WRITE;
/*!40000 ALTER TABLE `competencias_aprendizagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `competencias_aprendizagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `etapas_jogo`
--

LOCK TABLES `etapas_jogo` WRITE;
/*!40000 ALTER TABLE `etapas_jogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `etapas_jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fases_jogo`
--

LOCK TABLES `fases_jogo` WRITE;
/*!40000 ALTER TABLE `fases_jogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `fases_jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `jogos_digitais`
--

LOCK TABLES `jogos_digitais` WRITE;
/*!40000 ALTER TABLE `jogos_digitais` DISABLE KEYS */;
INSERT INTO `jogos_digitais` VALUES (1,'fdsaf'),(2,'dsfdas');
/*!40000 ALTER TABLE `jogos_digitais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `niveis_de_apredizagem`
--

LOCK TABLES `niveis_de_apredizagem` WRITE;
/*!40000 ALTER TABLE `niveis_de_apredizagem` DISABLE KEYS */;
INSERT INTO `niveis_de_apredizagem` VALUES (1,1,'adsa',1.0000,2.0000,3.0000);
/*!40000 ALTER TABLE `niveis_de_apredizagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `niveis_de_competencia_avaliacao`
--

LOCK TABLES `niveis_de_competencia_avaliacao` WRITE;
/*!40000 ALTER TABLE `niveis_de_competencia_avaliacao` DISABLE KEYS */;
INSERT INTO `niveis_de_competencia_avaliacao` VALUES (1,1,'C1',1.0000,1.0000,1.0000);
/*!40000 ALTER TABLE `niveis_de_competencia_avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `niveis_jogo`
--

LOCK TABLES `niveis_jogo` WRITE;
/*!40000 ALTER TABLE `niveis_jogo` DISABLE KEYS */;
INSERT INTO `niveis_jogo` VALUES (1,1,'fdsa'),(1,2,'fdsa');
/*!40000 ALTER TABLE `niveis_jogo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-10 19:03:02
