-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: taller_mtto
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `taller_mtto`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `taller_mtto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `taller_mtto`;

--
-- Table structure for table `aprobaciones_mantenimientos`
--

DROP TABLE IF EXISTS `aprobaciones_mantenimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aprobaciones_mantenimientos` (
  `id_aprobacion` int NOT NULL AUTO_INCREMENT,
  `id_mantenimiento` int DEFAULT NULL,
  `id_usuario_aprobador` int DEFAULT NULL,
  `fecha_aprobacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('Aprobado','Rechazado') NOT NULL,
  `comentario` text,
  PRIMARY KEY (`id_aprobacion`),
  KEY `id_mantenimiento` (`id_mantenimiento`),
  KEY `id_usuario_aprobador` (`id_usuario_aprobador`),
  CONSTRAINT `aprobaciones_mantenimientos_ibfk_1` FOREIGN KEY (`id_mantenimiento`) REFERENCES `mantenimientos` (`id_mantenimiento`) ON DELETE CASCADE,
  CONSTRAINT `aprobaciones_mantenimientos_ibfk_2` FOREIGN KEY (`id_usuario_aprobador`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprobaciones_mantenimientos`
--

LOCK TABLES `aprobaciones_mantenimientos` WRITE;
/*!40000 ALTER TABLE `aprobaciones_mantenimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `aprobaciones_mantenimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivos_mantenimiento`
--

DROP TABLE IF EXISTS `archivos_mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archivos_mantenimiento` (
  `id_archivo` int NOT NULL AUTO_INCREMENT,
  `id_mantenimiento` int DEFAULT NULL,
  `tipo_archivo` enum('Imagen','Documento','Otro') NOT NULL,
  `nombre_archivo` varchar(255) NOT NULL,
  `ruta_archivo` varchar(500) NOT NULL,
  `version` int DEFAULT '1',
  `fecha_subida` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_archivo`),
  KEY `id_mantenimiento` (`id_mantenimiento`),
  CONSTRAINT `archivos_mantenimiento_ibfk_1` FOREIGN KEY (`id_mantenimiento`) REFERENCES `mantenimientos` (`id_mantenimiento`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos_mantenimiento`
--

LOCK TABLES `archivos_mantenimiento` WRITE;
/*!40000 ALTER TABLE `archivos_mantenimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivos_mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add usuario',7,'add_usuario'),(26,'Can change usuario',7,'change_usuario'),(27,'Can delete usuario',7,'delete_usuario'),(28,'Can view usuario',7,'view_usuario'),(29,'Can add Token',8,'add_token'),(30,'Can change Token',8,'change_token'),(31,'Can delete Token',8,'delete_token'),(32,'Can view Token',8,'view_token'),(33,'Can add Token',9,'add_tokenproxy'),(34,'Can change Token',9,'change_tokenproxy'),(35,'Can delete Token',9,'delete_tokenproxy'),(36,'Can view Token',9,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$600000$Qp1vnmA7tGjweKCmrdxYX5$t4XM6Bh0mpBgRX4OY94o31nzh6KaR9SywnMsYp/ROjs=','2025-03-02 14:34:04.747393',1,'admin','','','admin@email.com',1,1,'2025-03-02 14:02:09.690370'),(3,'pbkdf2_sha256$600000$WhUnuxKfmrxaSyjmcnO1kG$yaG6mlRHro0dZX4pvqSBt8MhS+T2c1/Ejd2F+8KtkAc=','2025-03-05 03:10:09.401289',0,'prueba','Prueba','','',0,1,'2025-03-02 14:15:41.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('2b2d1e52f62b23d2f96ab7e4dbd325712bfe47c7','2025-03-02 15:53:51.685307',3),('8397b923887cf17722ba36e7a08be3c6dbbe0c7f','2025-03-02 14:03:10.248726',2);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cronograma_mantenimiento`
--

DROP TABLE IF EXISTS `cronograma_mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cronograma_mantenimiento` (
  `id_cronograma` int NOT NULL AUTO_INCREMENT,
  `id_equipo` int NOT NULL,
  `tipo_actividad` enum('Lubricacion','Revision','Otro') NOT NULL,
  `fecha_programada` date NOT NULL,
  `anio` int GENERATED ALWAYS AS (year(`fecha_programada`)) STORED,
  `mes` int GENERATED ALWAYS AS (month(`fecha_programada`)) STORED,
  `semana_anio` int GENERATED ALWAYS AS (week(`fecha_programada`,3)) STORED,
  `dia_mes` int GENERATED ALWAYS AS (dayofmonth(`fecha_programada`)) STORED,
  `responsable` varchar(100) DEFAULT NULL,
  `estado` enum('Pendiente','Realizado','Cancelado') DEFAULT 'Pendiente',
  PRIMARY KEY (`id_cronograma`),
  KEY `id_equipo` (`id_equipo`),
  CONSTRAINT `cronograma_mantenimiento_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cronograma_mantenimiento`
--

LOCK TABLES `cronograma_mantenimiento` WRITE;
/*!40000 ALTER TABLE `cronograma_mantenimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `cronograma_mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-03-02 14:15:41.778396','3','prueba',1,'[{\"added\": {}}]',4,2),(2,'2025-03-02 14:16:53.624480','3','prueba',2,'[{\"changed\": {\"fields\": [\"First name\"]}}]',4,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'authtoken','token'),(9,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'usuarios','usuario');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-03-02 13:00:13.370397'),(2,'auth','0001_initial','2025-03-02 13:00:13.796399'),(3,'admin','0001_initial','2025-03-02 13:00:13.901362'),(4,'admin','0002_logentry_remove_auto_add','2025-03-02 13:00:13.909253'),(5,'admin','0003_logentry_add_action_flag_choices','2025-03-02 13:00:13.915821'),(6,'contenttypes','0002_remove_content_type_name','2025-03-02 13:00:14.000103'),(7,'auth','0002_alter_permission_name_max_length','2025-03-02 13:00:14.049853'),(8,'auth','0003_alter_user_email_max_length','2025-03-02 13:00:14.068619'),(9,'auth','0004_alter_user_username_opts','2025-03-02 13:00:14.075585'),(10,'auth','0005_alter_user_last_login_null','2025-03-02 13:00:14.117563'),(11,'auth','0006_require_contenttypes_0002','2025-03-02 13:00:14.121053'),(12,'auth','0007_alter_validators_add_error_messages','2025-03-02 13:00:14.128089'),(13,'auth','0008_alter_user_username_max_length','2025-03-02 13:00:14.177074'),(14,'auth','0009_alter_user_last_name_max_length','2025-03-02 13:00:14.230792'),(15,'auth','0010_alter_group_name_max_length','2025-03-02 13:00:14.245822'),(16,'auth','0011_update_proxy_permissions','2025-03-02 13:00:14.252259'),(17,'auth','0012_alter_user_first_name_max_length','2025-03-02 13:00:14.308231'),(18,'sessions','0001_initial','2025-03-02 13:00:14.338745'),(19,'usuarios','0001_initial','2025-03-02 13:31:37.278509'),(20,'authtoken','0001_initial','2025-03-02 13:40:53.353787'),(21,'authtoken','0002_auto_20160226_1747','2025-03-02 13:40:53.370747'),(22,'authtoken','0003_tokenproxy','2025-03-02 13:40:53.374379'),(23,'authtoken','0004_alter_tokenproxy_options','2025-03-02 13:40:53.381432');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('twcb24cd9986j2lwo0mllvvux3j3mz74','.eJxVjEEOwiAQRe_C2pAWGOy4dO8ZyAwMUjU0Ke3KeHfbpAvd_vfef6tA61LC2mQOY1IXZdTpd2OKT6k7SA-q90nHqS7zyHpX9EGbvk1JXtfD_Tso1MpWR8jeYGYSFBCXE0YgtF2W3vfZRW8Gi4JGENhnSB2L4fPWWBA7gFOfLwi0OFY:1tokOK:rfe-hnJHnY5KUSCgBCNau231VxjPvhkNeegY4V68HVk','2025-03-16 14:34:04.750689');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` enum('Neumatico','Hidraulico','Mecanico','Electrico') NOT NULL,
  `descripcion` text,
  `fecha_adquisicion` date DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimientos`
--

DROP TABLE IF EXISTS `mantenimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimientos` (
  `id_mantenimiento` int NOT NULL AUTO_INCREMENT,
  `id_equipo` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `tipo_mantenimiento` enum('Correctivo','Preventivo','Predictivo') NOT NULL,
  `fecha_realizacion` date NOT NULL,
  `observaciones` text,
  `estado_aprobacion` enum('Pendiente Aprobacion','Aprobado','Rechazado') DEFAULT 'Pendiente Aprobacion',
  PRIMARY KEY (`id_mantenimiento`),
  KEY `id_equipo` (`id_equipo`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `mantenimientos_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`) ON DELETE CASCADE,
  CONSTRAINT `mantenimientos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimientos`
--

LOCK TABLES `mantenimientos` WRITE;
/*!40000 ALTER TABLE `mantenimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantenimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piezas_reemplazadas`
--

DROP TABLE IF EXISTS `piezas_reemplazadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piezas_reemplazadas` (
  `id_pieza` int NOT NULL AUTO_INCREMENT,
  `id_equipo` int DEFAULT NULL,
  `nombre_pieza` varchar(100) NOT NULL,
  `fabricante_pieza` varchar(100) DEFAULT NULL,
  `fecha_instalacion` date NOT NULL,
  `vida_util_estimada` int DEFAULT NULL COMMENT 'En meses',
  `estado` enum('Nueva','Usada','Defectuosa') DEFAULT 'Nueva',
  PRIMARY KEY (`id_pieza`),
  KEY `id_equipo` (`id_equipo`),
  CONSTRAINT `piezas_reemplazadas_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piezas_reemplazadas`
--

LOCK TABLES `piezas_reemplazadas` WRITE;
/*!40000 ALTER TABLE `piezas_reemplazadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `piezas_reemplazadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `reporte_mantenimientos_completo`
--

DROP TABLE IF EXISTS `reporte_mantenimientos_completo`;
/*!50001 DROP VIEW IF EXISTS `reporte_mantenimientos_completo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reporte_mantenimientos_completo` AS SELECT 
 1 AS `id_mantenimiento`,
 1 AS `equipo`,
 1 AS `responsable`,
 1 AS `tipo_mantenimiento`,
 1 AS `fecha_realizacion`,
 1 AS `observaciones`,
 1 AS `estado_mantenimiento`,
 1 AS `fecha_aprobacion`,
 1 AS `estado_aprobacion_mantenimiento`,
 1 AS `comentario_aprobacion`,
 1 AS `nombre_archivo`,
 1 AS `ruta_archivo`,
 1 AS `tipo_archivo`,
 1 AS `version`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `repuestos_equipos`
--

DROP TABLE IF EXISTS `repuestos_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repuestos_equipos` (
  `id_repuesto` int NOT NULL AUTO_INCREMENT,
  `id_equipo` int NOT NULL,
  `nombre_repuesto` varchar(100) NOT NULL,
  `referencia` varchar(100) NOT NULL,
  `cantidad` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_repuesto`),
  KEY `id_equipo` (`id_equipo`),
  CONSTRAINT `repuestos_equipos_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repuestos_equipos`
--

LOCK TABLES `repuestos_equipos` WRITE;
/*!40000 ALTER TABLE `repuestos_equipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `repuestos_equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `rol` enum('Admin','Tecnico','Supervisor') NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Admin','admin@example.com','240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9','Admin');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_cronograma_mantenimiento`
--

DROP TABLE IF EXISTS `vista_cronograma_mantenimiento`;
/*!50001 DROP VIEW IF EXISTS `vista_cronograma_mantenimiento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_cronograma_mantenimiento` AS SELECT 
 1 AS `id_cronograma`,
 1 AS `equipo`,
 1 AS `tipo_actividad`,
 1 AS `fecha_programada`,
 1 AS `anio`,
 1 AS `mes`,
 1 AS `semana_anio`,
 1 AS `dia_mes`,
 1 AS `responsable`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `taller_mtto`
--

USE `taller_mtto`;

--
-- Final view structure for view `reporte_mantenimientos_completo`
--

/*!50001 DROP VIEW IF EXISTS `reporte_mantenimientos_completo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reporte_mantenimientos_completo` AS select `m`.`id_mantenimiento` AS `id_mantenimiento`,`e`.`nombre` AS `equipo`,`u`.`nombre` AS `responsable`,`m`.`tipo_mantenimiento` AS `tipo_mantenimiento`,`m`.`fecha_realizacion` AS `fecha_realizacion`,`m`.`observaciones` AS `observaciones`,`m`.`estado_aprobacion` AS `estado_mantenimiento`,`a`.`fecha_aprobacion` AS `fecha_aprobacion`,`a`.`estado` AS `estado_aprobacion_mantenimiento`,`a`.`comentario` AS `comentario_aprobacion`,`f`.`nombre_archivo` AS `nombre_archivo`,`f`.`ruta_archivo` AS `ruta_archivo`,`f`.`tipo_archivo` AS `tipo_archivo`,`f`.`version` AS `version` from ((((`mantenimientos` `m` join `equipos` `e` on((`m`.`id_equipo` = `e`.`id_equipo`))) join `usuarios` `u` on((`m`.`id_usuario` = `u`.`id_usuario`))) left join `aprobaciones_mantenimientos` `a` on((`m`.`id_mantenimiento` = `a`.`id_mantenimiento`))) left join `archivos_mantenimiento` `f` on((`m`.`id_mantenimiento` = `f`.`id_mantenimiento`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cronograma_mantenimiento`
--

/*!50001 DROP VIEW IF EXISTS `vista_cronograma_mantenimiento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cronograma_mantenimiento` AS select `c`.`id_cronograma` AS `id_cronograma`,`e`.`nombre` AS `equipo`,`c`.`tipo_actividad` AS `tipo_actividad`,`c`.`fecha_programada` AS `fecha_programada`,`c`.`anio` AS `anio`,`c`.`mes` AS `mes`,`c`.`semana_anio` AS `semana_anio`,`c`.`dia_mes` AS `dia_mes`,`c`.`responsable` AS `responsable`,`c`.`estado` AS `estado` from (`cronograma_mantenimiento` `c` join `equipos` `e` on((`c`.`id_equipo` = `e`.`id_equipo`))) */;
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

-- Dump completed on 2025-03-04 22:24:34
