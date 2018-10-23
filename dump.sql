-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: migrantes3
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1

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
-- Table structure for table `anuncio`
--

DROP TABLE IF EXISTS `anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anuncio` (
  `id_anuncio` int(11) NOT NULL COMMENT 'Identificador Anuncio',
  `titulo_anuncio` varchar(250) NOT NULL COMMENT 'Título del anuncio',
  `alter_titulo_anuncio` varchar(250) DEFAULT NULL COMMENT 'Título alternativo en otro idioma del anuncio',
  `detalle_anuncio` varchar(600) NOT NULL COMMENT 'Detalles del Anuncio',
  `alter_detalle_anuncio` varchar(600) DEFAULT NULL COMMENT 'Detalles Alternativos en otro idioma del anuncio',
  `fecha_anuncio` datetime NOT NULL COMMENT 'Fecha de publicación del anuncio',
  `fecha_cierre_anuncio` datetime DEFAULT NULL COMMENT 'Fecha de cierre del anuncio',
  `tipo_trabajo` varchar(45) DEFAULT NULL,
  `salario` int(11) DEFAULT NULL,
  `estado_anuncio` tinyint(4) NOT NULL COMMENT 'Estado Actual del Anuncio',
  `user_ptr_id` int(11) NOT NULL COMMENT 'Identificador FK de usuario',
  `id_direccion` int(11) DEFAULT NULL,
  `id_idioma_alter` int(11) DEFAULT NULL COMMENT 'Idioma de Anuncio Alternativo',
  PRIMARY KEY (`id_anuncio`),
  KEY `id_idioma_alter_idx` (`id_idioma_alter`),
  KEY `user_ptr_id_idx` (`user_ptr_id`),
  KEY `id_direccion_idx` (`id_direccion`),
  CONSTRAINT `id_direccion_anun` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_idioma_alter` FOREIGN KEY (`id_idioma_alter`) REFERENCES `idioma` (`id_idioma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_ptr_id` FOREIGN KEY (`user_ptr_id`) REFERENCES `usuarios_empresa` (`user_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de Anuncios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncio`
--

LOCK TABLES `anuncio` WRITE;
/*!40000 ALTER TABLE `anuncio` DISABLE KEYS */;
INSERT INTO `anuncio` VALUES (1,'TRabajo 3','We need work','fgdfg','fdgdfg','2018-10-18 17:40:58','2018-10-18 17:40:58','Plazo Fijo',123432423,1,24,6,17),(2,'TRabajo segundo','We now','dfsdfds','fdsfdsf','2018-10-18 17:41:19','2018-10-18 17:41:19','Parcial',3244324,1,24,7,18),(3,'TRabajodfsdf 324234','dfsfds','dfsdfdsf','dsfdfdsf','2018-10-21 11:46:45','2018-10-21 11:46:45','Plazo Fijo',1111111,1,24,5,17);
/*!40000 ALTER TABLE `anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'empresa'),(1,'postulante');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,11),(2,1,16),(3,1,17),(4,1,18),(5,1,31),(6,1,32),(7,1,33),(8,1,34),(9,1,35),(10,1,36),(11,1,37),(12,1,38),(13,1,39),(14,1,40),(15,1,41),(16,1,42),(17,1,43),(18,1,44),(19,1,45),(20,1,46),(21,1,47),(22,1,49),(23,1,50),(24,1,51),(25,1,52),(26,1,53),(27,1,54),(28,1,55),(29,1,56),(30,1,80),(31,2,10),(32,2,11),(33,2,16),(34,2,17),(35,2,19),(36,2,20),(37,2,21),(38,2,22),(39,2,23),(40,2,25),(41,2,26),(42,2,28),(43,2,29),(44,2,34),(45,2,35),(46,2,36),(47,2,37),(48,2,38),(49,2,39),(50,2,40),(51,2,41),(52,2,43),(53,2,44),(54,2,46),(55,2,47),(56,2,52),(57,2,53),(58,2,55),(59,2,56),(60,2,73),(61,2,74),(62,2,91),(63,2,92);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add anuncio',7,'add_anuncio'),(20,'Can change anuncio',7,'change_anuncio'),(21,'Can delete anuncio',7,'delete_anuncio'),(22,'Can add estado postulacion',8,'add_estadopostulacion'),(23,'Can change estado postulacion',8,'change_estadopostulacion'),(24,'Can delete estado postulacion',8,'delete_estadopostulacion'),(25,'Can add postulacion',9,'add_postulacion'),(26,'Can change postulacion',9,'change_postulacion'),(27,'Can delete postulacion',9,'delete_postulacion'),(28,'Can add tipo anuncio',10,'add_tipoanuncio'),(29,'Can change tipo anuncio',10,'change_tipoanuncio'),(30,'Can delete tipo anuncio',10,'delete_tipoanuncio'),(31,'Can add curriculum',11,'add_curriculum'),(32,'Can change curriculum',11,'change_curriculum'),(33,'Can delete curriculum',11,'delete_curriculum'),(34,'Can add documentos',12,'add_documentos'),(35,'Can change documentos',12,'change_documentos'),(36,'Can delete documentos',12,'delete_documentos'),(37,'Can add documentos link usuarios',13,'add_documentoslinkusuarios'),(38,'Can change documentos link usuarios',13,'change_documentoslinkusuarios'),(39,'Can delete documentos link usuarios',13,'delete_documentoslinkusuarios'),(40,'Can add nacionalidad',14,'add_nacionalidad'),(41,'Can change nacionalidad',14,'change_nacionalidad'),(42,'Can delete nacionalidad',14,'delete_nacionalidad'),(43,'Can add oficio link usuario',15,'add_oficiolinkusuario'),(44,'Can change oficio link usuario',15,'change_oficiolinkusuario'),(45,'Can delete oficio link usuario',15,'delete_oficiolinkusuario'),(46,'Can add oficios',16,'add_oficios'),(47,'Can change oficios',16,'change_oficios'),(48,'Can delete oficios',16,'delete_oficios'),(49,'Can add profesion',17,'add_profesion'),(50,'Can change profesion',17,'change_profesion'),(51,'Can delete profesion',17,'delete_profesion'),(52,'Can add profesion link usuario',18,'add_profesionlinkusuario'),(53,'Can change profesion link usuario',18,'change_profesionlinkusuario'),(54,'Can delete profesion link usuario',18,'delete_profesionlinkusuario'),(55,'Can add tipo documento',19,'add_tipodocumento'),(56,'Can change tipo documento',19,'change_tipodocumento'),(57,'Can delete tipo documento',19,'delete_tipodocumento'),(58,'Can add tipo usuario',20,'add_tipousuario'),(59,'Can change tipo usuario',20,'change_tipousuario'),(60,'Can delete tipo usuario',20,'delete_tipousuario'),(61,'Can add usuarios',21,'add_usuarios'),(62,'Can change usuarios',21,'change_usuarios'),(63,'Can delete usuarios',21,'delete_usuarios'),(73,'Can add idioma',25,'add_idioma'),(74,'Can change idioma',25,'change_idioma'),(75,'Can delete idioma',25,'delete_idioma'),(79,'Can add user',27,'add_empresa'),(80,'Can change user',27,'change_empresa'),(81,'Can delete user',27,'delete_empresa'),(82,'Can add user',28,'add_postulante'),(83,'Can change user',28,'change_postulante'),(84,'Can delete user',28,'delete_postulante'),(85,'Can add ciudad',29,'add_ciudad'),(86,'Can change ciudad',29,'change_ciudad'),(87,'Can delete ciudad',29,'delete_ciudad'),(88,'Can add comuna',30,'add_comuna'),(89,'Can change comuna',30,'change_comuna'),(90,'Can delete comuna',30,'delete_comuna'),(91,'Can add direccion',31,'add_direccion'),(92,'Can change direccion',31,'change_direccion'),(93,'Can delete direccion',31,'delete_direccion'),(94,'Can add region',32,'add_region'),(95,'Can change region',32,'change_region'),(96,'Can delete region',32,'delete_region');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$dj9VxBNSbI8y$iz9c4NjobDQJPey1o7GKBeWhtoF6e2v4sHZRz4b9Aqo=','2018-10-12 12:23:39',1,'migrante','Alfredo','Figueroa','migrante@gmail.com',1,1,'2018-10-12 12:20:58'),(2,'pbkdf2_sha256$24000$sNX8Qz8O8oSi$e5VhG8n3Qwhax4kr+DzKUgdo7GwK+9NdyIOiZoMEBJI=','2018-10-22 15:31:31',1,'alfredo','','','',1,1,'2018-10-16 14:08:50'),(3,'pbkdf2_sha256$24000$YCu2reZFGjwc$qf0p1QuylnZpgRoSEsXKn2Vde62cAX9wrQHrNI1qdRQ=','2018-10-17 00:23:14',0,'postulante','','','',0,1,'2018-10-16 14:27:44'),(4,'pbkdf2_sha256$24000$4Wz7hvq13tFp$YCZss/t//jt8Y+B8B8PvZ9jBYRgNqKJCy3IRCFFqBxs=','2018-10-17 00:26:45',0,'empresa','','','',0,1,'2018-10-16 14:47:25'),(5,'postu1234',NULL,0,'postulante2','','','postulante@gmail.com',0,1,'2018-10-16 22:52:25'),(6,'postu1234',NULL,0,'postulante3','','','postulante@gmail.com',0,1,'2018-10-16 23:12:39'),(7,'empre1234',NULL,0,'empresa2','','','empresa@gmail.com',0,1,'2018-10-16 23:13:32'),(8,'postu1234',NULL,0,'postulante4','','','postulante@gmail.com',0,1,'2018-10-16 23:15:51'),(9,'empre1234',NULL,0,'empresa3','','','empresa@gmail.com',0,1,'2018-10-16 23:17:34'),(10,'empre1234',NULL,0,'empresa4','','','empresa@gmail.com',0,1,'2018-10-16 23:19:32'),(11,'postu1234',NULL,0,'postulante5','Alfredo','','postulante@gmail.com',0,1,'2018-10-16 23:20:19'),(12,'empre1234',NULL,0,'empresa5','','','empresa@gmail.com',0,1,'2018-10-16 23:27:39'),(13,'empre1234',NULL,0,'empresa6','','','empresa@gmail.com',0,1,'2018-10-16 23:28:48'),(14,'empre1234',NULL,0,'empresa7','','','empresa@gmail.com',0,1,'2018-10-16 23:30:05'),(15,'empre1234',NULL,0,'empresa8','','','empresa@gmail.com',0,1,'2018-10-16 23:32:40'),(16,'pbkdf2_sha256$24000$3MSf3WR1imMI$lgPIyoGasSH3yVn+Ely9MOwUvfHYuHXCujjlUFT/h9Q=','2018-10-17 00:35:34',0,'empresa9','','','empresa@gmail.com',0,1,'2018-10-16 23:36:05'),(17,'pbkdf2_sha256$24000$P6WBYcgj4LBe$KuEWIVhfU31XE+E3dIEVMUsL5X9sXLMOGC8A/c0lUDc=','2018-10-22 19:04:37',0,'postulante6','','','postulante@gmail.com',0,1,'2018-10-16 23:37:44'),(18,'pbkdf2_sha256$24000$fgaP5rBLk3So$9GL/63PaJuzUd9pywvGAanJ4DNOSUr6lVSlDBWs3cFQ=','2018-10-17 15:12:07',0,'empresa10','','','empresa@gmail.com',0,1,'2018-10-17 13:51:50'),(19,'pbkdf2_sha256$24000$k193tKYcohN4$NnSVOQYDt9YxRsR8nj1wnXor7ff32voLhJUOsVhF1v4=',NULL,0,'empresa11','','','empresa@gmail.com',0,1,'2018-10-17 13:52:20'),(20,'pbkdf2_sha256$24000$HuzuRTsaMtVw$xEdIUYtONlJURYdNRogK4hYIBo9jRhlibPxpEglbnl4=',NULL,0,'empresa12','','','empresa12@gmail.com',0,1,'2018-10-17 14:12:04'),(21,'pbkdf2_sha256$24000$ir2k9Zzw8z1F$FAe/b6XLMpYc8/R3jpLTiWj75b4D+C+yrBj4+5pSY+8=',NULL,0,'empresa13','','','empresa@gmail.com',0,1,'2018-10-17 14:13:51'),(22,'pbkdf2_sha256$24000$zqBNWV9DCmKq$GsjsGjo4B6znrEw8EsAX1Te5hgoxVtb1UA4gK/QiKL8=','2018-10-18 00:11:20',0,'empresa14','','','empresa@gmail.com',0,1,'2018-10-17 14:14:47'),(23,'pbkdf2_sha256$24000$EiwMtYMMAVy7$/MDwy3xuxJ32d17eBzGQ+PqUKUP7xSDsl24benVVM+Q=',NULL,0,'empresa15','','','empresa@gmail.com',0,1,'2018-10-17 14:15:41'),(24,'pbkdf2_sha256$24000$xtXhkKRKb2DD$YbP1AwNSu+phy/1VQx0tjtPSMov0UFksVCa5e+o7YdI=','2018-10-22 22:56:23',0,'empresa16','','','empresa@gmail.com',0,1,'2018-10-17 14:17:01'),(25,'pbkdf2_sha256$24000$E5w48RZTIect$DTQUjoJKINFaL+1rImUuPkZpCtHCiRcuzS98L4uEMV8=','2018-10-18 21:47:53',0,'empresa17','','','empresa@gmail.com',0,1,'2018-10-17 14:19:18'),(26,'pbkdf2_sha256$24000$J6ZIBUyPSsYg$0/n+Kndq6zHoAqtNKWwPmrtYOg3v717GdUmJ7yHxNis=',NULL,0,'empresa18','','','empresa27@gmail.com',0,1,'2018-10-17 14:22:37'),(27,'pbkdf2_sha256$24000$AgvugZoRmWKl$bEjj9Pk0kmDnEgKbaRBJR6Bh+Hepsn6y0mLKNv/jc1I=','2018-10-22 20:35:05',0,'postulante7','Alfredo','Figueroa','alfredo.figueroa.torres@gmail.com',0,1,'2018-10-17 16:09:49'),(28,'pbkdf2_sha256$24000$u657MH5CeobP$xK++s5gFOFVzjDRIFZzI9NVyxLOmN28214b9aR612z8=',NULL,0,'postulante8','Postulante','Postu','postulante@gmail.com',0,1,'2018-10-18 19:37:50');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (26,2,1),(1,3,1),(2,4,2),(4,5,1),(5,6,1),(6,7,2),(7,8,1),(8,9,2),(9,10,2),(10,11,1),(11,12,2),(12,13,2),(13,14,2),(14,15,2),(15,16,2),(16,17,1),(17,18,1),(18,19,2),(19,20,2),(20,21,2),(21,22,1),(22,23,2),(23,24,2),(24,25,2),(25,26,2),(27,27,1),(28,28,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `id_ciudad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de Ciudad',
  `desc_ciudad` varchar(45) NOT NULL COMMENT 'Descripción de la ciudad',
  `id_region` int(11) NOT NULL COMMENT 'Identificador FK de Región ',
  PRIMARY KEY (`id_ciudad`),
  KEY `id_region_idx` (`id_region`),
  CONSTRAINT `id_region` FOREIGN KEY (`id_region`) REFERENCES `region` (`id_region`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1 COMMENT='Tablas de Ciudades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (11,'Iquique  ',1),(14,'Tamarugal',1),(21,'Antofagasta',2),(22,'El Loa',2),(23,'Tocopilla  ',2),(31,'Copiapó  ',3),(32,'Chañaral  ',3),(33,'Huasco',3),(41,'Elqui',4),(42,'Choapa',4),(43,'Limari',4),(51,'Valparaíso  ',5),(52,'Isla de Pascua  ',5),(53,'Los Andes  ',5),(54,'Petorca',5),(55,'Quillota  ',5),(56,'San Antonio  ',5),(57,'San Felipe  ',5),(58,'Marga Marga',5),(61,'Cachapoal',6),(62,'Cardenal Caro',6),(63,'Colchagua',6),(71,'Talca',7),(72,'Cauquenes',7),(73,'Curico',7),(74,'Linares  ',7),(81,'Concepción  ',8),(82,'Arauco',8),(83,'Bío- Bío',8),(84,'Ñuble',8),(91,'Cautín',9),(92,'Malleco',9),(101,'Llanquihue',10),(102,'Chiloe',10),(103,'Osorno  ',10),(104,'Palena',10),(111,'Coihaique  ',11),(112,'Aisén  ',11),(113,'Capitan Prat',11),(114,'General Carrera',11),(121,'Magallanes',12),(122,'Antártica Chilena',12),(123,'Tierra del Fuego',12),(124,'Ultima Esperanza',12),(131,'Santiago  ',13),(132,'Cordillera',13),(133,'Chacabuco',13),(134,'Maipo',13),(135,'Melipilla',13),(136,'Talagante  ',13),(141,'Valdivia  ',14),(142,'Ranco',14),(151,'Arica  ',15),(152,'Parinacota',15);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comuna`
--

DROP TABLE IF EXISTS `comuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comuna` (
  `id_comuna` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de Comuna',
  `desc_comuna` varchar(45) NOT NULL COMMENT 'Descripción de Comuna',
  `id_ciudad` int(11) NOT NULL COMMENT 'Identificador FK de Ciudad',
  PRIMARY KEY (`id_comuna`),
  KEY `id_ciudad_idx` (`id_ciudad`),
  CONSTRAINT `id_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15203 DEFAULT CHARSET=latin1 COMMENT='Tabla de Comunas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comuna`
--

LOCK TABLES `comuna` WRITE;
/*!40000 ALTER TABLE `comuna` DISABLE KEYS */;
INSERT INTO `comuna` VALUES (101,'Arica',151),(1101,'Iquique',11),(1107,'Alto Hospicio',11),(1401,'Pozo Almonte',14),(1402,'Camiña',14),(1403,'Colchane',14),(1404,'Huara',14),(1405,'Pica',14),(2101,'Antofagasta',21),(2102,'Mejillones',21),(2103,'Sierra Gorda',21),(2104,'Taltal',21),(2201,'Calama',22),(2202,'Ollagüe',22),(2203,'San Pedro de Atacama',22),(2301,'Tocopilla',23),(2302,'María Elena',23),(3101,'Copiapó',31),(3102,'Caldera',31),(3103,'Tierra Amarilla',31),(3201,'Chañaral',32),(3202,'Diego de Almagro',32),(3301,'Vallenar',33),(3302,'Alto del Carmen',33),(3303,'Freirina',33),(3304,'Huasco',33),(4101,'La Serena',41),(4102,'Coquimbo',41),(4103,'Andacollo',41),(4104,'La Higuera',41),(4105,'Paiguano',41),(4106,'Vicuña',41),(4201,'Illapel',42),(4202,'Canela',42),(4203,'Los Vilos',42),(4204,'Salamanca',42),(4301,'Ovalle',43),(4302,'Combarbalá',43),(4303,'Monte Patria',43),(4304,'Punitaqui',43),(4305,'Río Hurtado',43),(5101,'Valparaíso',51),(5102,'Casablanca',51),(5103,'Concón',51),(5104,'Juan Fernández',51),(5105,'Puchuncaví',51),(5107,'Quintero',51),(5109,'Viña del Mar',51),(5201,'Isla  de Pascua',52),(5301,'Los Andes',53),(5302,'Calle Larga',53),(5303,'Rinconada',53),(5304,'San Esteban',53),(5401,'La Ligua',54),(5402,'Cabildo',54),(5403,'Papudo',54),(5404,'Petorca',54),(5405,'Zapallar',54),(5501,'Quillota',55),(5502,'Calera',55),(5503,'Hijuelas',55),(5504,'La Cruz',55),(5506,'Nogales',55),(5601,'San Antonio',56),(5602,'Algarrobo',56),(5603,'Cartagena',56),(5604,'El Quisco',56),(5605,'El Tabo',56),(5606,'Santo Domingo',56),(5701,'San Felipe',57),(5702,'Catemu',57),(5703,'Llaillay',57),(5704,'Panquehue',57),(5705,'Putaendo',57),(5706,'Santa María',57),(5801,'Quilpué',58),(5802,'Limache',58),(5803,'Olmué',58),(5804,'Villa Alemana',58),(6101,'Rancagua',61),(6102,'Codegua',61),(6103,'Coinco',61),(6104,'Coltauco',61),(6105,'Doñihue',61),(6106,'Graneros',61),(6107,'Las Cabras',61),(6108,'Machalí',61),(6109,'Malloa',61),(6110,'Mostazal',61),(6111,'Olivar',61),(6112,'Peumo',61),(6113,'Pichidegua',61),(6114,'Quinta de Tilcoco',61),(6115,'Rengo',61),(6116,'Requínoa',61),(6117,'San Vicente',61),(6201,'Pichilemu',62),(6202,'La Estrella',62),(6203,'Litueche',62),(6204,'Marchihue',62),(6205,'Navidad',62),(6206,'Paredones',62),(6301,'San Fernando',63),(6302,'Chépica',63),(6303,'Chimbarongo',63),(6304,'Lolol',63),(6305,'Nancagua',63),(6306,'Palmilla',63),(6307,'Peralillo',63),(6308,'Placilla',63),(6309,'Pumanque',63),(6310,'Santa Cruz',63),(7101,'Talca',71),(7102,'Constitución',71),(7103,'Curepto',71),(7104,'Empedrado',71),(7105,'Maule',71),(7106,'Pelarco',71),(7107,'Pencahue',71),(7108,'Río Claro',71),(7109,'San Clemente',71),(7110,'San Rafael',71),(7201,'Cauquenes',72),(7202,'Chanco',72),(7203,'Pelluhue',72),(7301,'Curicó',73),(7302,'Hualañé',73),(7303,'Licantén',73),(7304,'Molina',73),(7305,'Rauco',73),(7306,'Romeral',73),(7307,'Sagrada Familia',73),(7308,'Teno',73),(7309,'Vichuquén',73),(7401,'Linares',74),(7402,'Colbún',74),(7403,'Longaví',74),(7404,'Parral',74),(7405,'Retiro',74),(7406,'San Javier',74),(7407,'Villa Alegre',74),(7408,'Yerbas Buenas',74),(8101,'Concepción',81),(8102,'Coronel',81),(8103,'Chiguayante',81),(8104,'Florida',81),(8105,'Hualqui',81),(8106,'Lota',81),(8107,'Penco',81),(8108,'San Pedro de la Paz',81),(8109,'Santa Juana',81),(8110,'Talcahuano',81),(8111,'Tomé',81),(8112,'Hualpén',81),(8201,'Lebu',82),(8202,'Arauco',82),(8203,'Cañete',82),(8204,'Contulmo',82),(8205,'Curanilahue',82),(8206,'Los Álamos',82),(8207,'Tirúa',82),(8301,'Los Ángeles',83),(8302,'Antuco',83),(8303,'Cabrero',83),(8304,'Laja',83),(8305,'Mulchén',83),(8306,'Nacimiento',83),(8307,'Negrete',83),(8308,'Quilaco',83),(8309,'Quilleco',83),(8310,'San Rosendo',83),(8311,'Santa Bárbara',83),(8312,'Tucapel',83),(8313,'Yumbel',83),(8314,'Alto Biobío',83),(8401,'Chillán',84),(8402,'Bulnes',84),(8403,'Cobquecura',84),(8404,'Coelemu',84),(8405,'Coihueco',84),(8406,'Chillán Viejo',84),(8407,'El Carmen',84),(8408,'Ninhue',84),(8409,'Ñiquén',84),(8410,'Pemuco',84),(8411,'Pinto',84),(8412,'Portezuelo',84),(8413,'Quillón',84),(8414,'Quirihue',84),(8415,'Ránquil',84),(8416,'San Carlos',84),(8417,'San Fabián',84),(8418,'San Ignacio',84),(8419,'San Nicolás',84),(8420,'Treguaco',84),(8421,'Yungay',84),(9101,'Temuco',91),(9102,'Carahue',91),(9103,'Cunco',91),(9104,'Curarrehue',91),(9105,'Freire',91),(9106,'Galvarino',91),(9107,'Gorbea',91),(9108,'Lautaro',91),(9109,'Loncoche',91),(9110,'Melipeuco',91),(9111,'Nueva Imperial',91),(9112,'Padre Las Casas',91),(9113,'Perquenco',91),(9114,'Pitrufquén',91),(9115,'Pucón',91),(9116,'Saavedra',91),(9117,'Teodoro Schmidt',91),(9118,'Toltén',91),(9119,'Vilcún',91),(9120,'Villarrica',91),(9121,'Cholchol',91),(9201,'Angol',92),(9202,'Collipulli',92),(9203,'Curacautín',92),(9204,'Ercilla',92),(9205,'Lonquimay',92),(9206,'Los Sauces',92),(9207,'Lumaco',92),(9208,'Purén',92),(9209,'Renaico',92),(9210,'Traiguén',92),(9211,'Victoria',92),(10101,'Puerto Montt',101),(10102,'Calbuco',101),(10103,'Cochamó',101),(10104,'Fresia',101),(10105,'Frutillar',101),(10106,'Los Muermos',101),(10107,'Llanquihue',101),(10108,'Maullín',101),(10109,'Puerto Varas',101),(10201,'Castro',102),(10202,'Ancud',102),(10203,'Chonchi',102),(10204,'Curaco de Vélez',102),(10205,'Dalcahue',102),(10206,'Puqueldón',102),(10207,'Queilén',102),(10208,'Quellón',102),(10209,'Quemchi',102),(10210,'Quinchao',102),(10301,'Osorno',103),(10302,'Puerto Octay',103),(10303,'Purranque',103),(10304,'Puyehue',103),(10305,'Río Negro',103),(10306,'San Juan de la Costa',103),(10307,'San Pablo',103),(10401,'Chaitén',104),(10402,'Futaleufú',104),(10403,'Hualaihué',104),(10404,'Palena',104),(11101,'Coihaique',111),(11102,'Lago Verde',111),(11201,'Aisén',112),(11202,'Cisnes',112),(11203,'Guaitecas',112),(11301,'Cochrane',113),(11302,'O\'Higgins',113),(11303,'Tortel',113),(11401,'Chile Chico',114),(11402,'Río Ibáñez',114),(12101,'Punta Arenas',121),(12102,'Laguna Blanca',121),(12103,'Río Verde',121),(12104,'San Gregorio',121),(12201,'Cabo de Hornos',122),(12202,'Antártica',122),(12301,'Porvenir',123),(12302,'Primavera',123),(12303,'Timaukel',123),(12401,'Natales',124),(12402,'Torres del Paine',124),(13101,'Santiago',131),(13102,'Cerrillos',131),(13103,'Cerro Navia',131),(13104,'Conchalí',131),(13105,'El Bosque',131),(13106,'Estación Central',131),(13107,'Huechuraba',131),(13108,'Independencia',131),(13109,'La Cisterna',131),(13110,'La Florida',131),(13111,'La Granja',131),(13112,'La Pintana',131),(13113,'La Reina',131),(13114,'Las Condes',131),(13115,'Lo Barnechea',131),(13116,'Lo Espejo',131),(13117,'Lo Prado',131),(13118,'Macul',131),(13119,'Maipú',131),(13120,'Ñuñoa',131),(13121,'Pedro Aguirre Cerda',131),(13122,'Peñalolén',131),(13123,'Providencia',131),(13124,'Pudahuel',131),(13125,'Quilicura',131),(13126,'Quinta Normal',131),(13127,'Recoleta',131),(13128,'Renca',131),(13129,'San Joaquín',131),(13130,'San Miguel',131),(13131,'San Ramón',131),(13132,'Vitacura',131),(13201,'Puente Alto',132),(13202,'Pirque',132),(13203,'San José de Maipo',132),(13301,'Colina',133),(13302,'Lampa',133),(13303,'Tiltil',133),(13401,'San Bernardo',134),(13402,'Buin',134),(13403,'Calera de Tango',134),(13404,'Paine',134),(13501,'Melipilla',135),(13502,'Alhué',135),(13503,'Curacaví',135),(13504,'María Pinto',135),(13505,'San Pedro',135),(13601,'Talagante',136),(13602,'El Monte',136),(13603,'Isla de Maipo',136),(13604,'Padre Hurtado',136),(13605,'Peñaflor',136),(14101,'Valdivia',141),(14102,'Corral',141),(14103,'Lanco',141),(14104,'Los Lagos',141),(14105,'Máfil',141),(14106,'Mariquina',141),(14107,'Paillaco',141),(14108,'Panguipulli',141),(14201,'La Unión',142),(14202,'Futrono',142),(14203,'Lago Ranco',142),(14204,'Río Bueno',142),(15102,'Camarones',151),(15201,'Putre',152),(15202,'General Lagos',152);
/*!40000 ALTER TABLE `comuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curriculum` (
  `id_curriculum` int(11) NOT NULL COMMENT 'Identificador de Currículum',
  `path_curriculum` varchar(250) NOT NULL COMMENT 'Ubicación del Currículum en el servidor',
  PRIMARY KEY (`id_curriculum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de Currículums';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de Dirección',
  `desc_direccion` varchar(250) NOT NULL COMMENT 'Descripción de Dirección',
  `numero` int(11) NOT NULL COMMENT 'Número de Dirección',
  `id_comuna` int(11) NOT NULL COMMENT 'Identificador FK de Comuna',
  `desc_block_depto` varchar(45) DEFAULT NULL COMMENT 'Block o Depto o Villa',
  `user_ptr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `id_comuna_idx` (`id_comuna`),
  KEY `id_user_direccion_idx` (`user_ptr_id`),
  CONSTRAINT `id_comuna` FOREIGN KEY (`id_comuna`) REFERENCES `comuna` (`id_comuna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Tabla de Direcciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Avda del Ponrte',123,101,'',0),(2,'Calle 4',234,2203,'',0),(3,'Calle 2',123,2203,'Casas',0),(4,'Calle Nueva',234,2301,'Villa Poop',0),(5,'Lalalalalal',124,2203,'',0),(6,'jpipoiou',3443,2203,'',0),(7,'CAlle migrante',123,5701,'Villa Poop',0),(8,'Calle 4',124,2202,'Villa Poop',NULL);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-10-12 12:24:36','1','migrante',2,'Changed first_name and last_name.',4,1),(2,'2018-10-16 14:21:35','1','postulante',1,'Added.',3,2),(3,'2018-10-16 14:23:27','2','empresa',1,'Added.',3,2),(4,'2018-10-16 14:27:44','3','postulante',1,'Added.',4,2),(5,'2018-10-16 14:28:03','3','postulante',2,'Changed groups.',4,2),(6,'2018-10-16 14:47:25','4','empresa',1,'Added.',4,2),(7,'2018-10-16 14:47:34','4','empresa',2,'Changed groups.',4,2),(8,'2018-10-16 14:59:10','3','postulante',2,'Changed password.',4,2),(9,'2018-10-16 22:54:30','5','postulante2',2,'Changed groups.',4,2),(10,'2018-10-16 22:54:42','5','postulante2',2,'Changed groups.',4,2),(11,'2018-10-16 23:53:25','2','Calle 4',2,'No fields changed.',31,2),(12,'2018-10-16 23:53:29','3','Calle 2',2,'No fields changed.',31,2),(13,'2018-10-16 23:53:33','1','Avda del Ponrte',2,'No fields changed.',31,2),(14,'2018-10-17 00:35:08','16','empresa9',2,'Changed rut_empresa.',27,2),(15,'2018-10-17 15:21:55','2','alfredo',2,'Changed groups.',4,2),(16,'2018-10-17 15:59:04','11','postulante5',2,'Changed rut_postulante.',28,2),(17,'2018-10-17 16:02:42','11','postulante5',2,'Changed first_name.',28,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(25,'adumor','idioma'),(7,'anuncios','anuncio'),(8,'anuncios','estadopostulacion'),(9,'anuncios','postulacion'),(10,'anuncios','tipoanuncio'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(29,'direcciones','ciudad'),(30,'direcciones','comuna'),(31,'direcciones','direccion'),(32,'direcciones','region'),(6,'sessions','session'),(11,'usuarios','curriculum'),(12,'usuarios','documentos'),(13,'usuarios','documentoslinkusuarios'),(27,'usuarios','empresa'),(14,'usuarios','nacionalidad'),(15,'usuarios','oficiolinkusuario'),(16,'usuarios','oficios'),(28,'usuarios','postulante'),(17,'usuarios','profesion'),(18,'usuarios','profesionlinkusuario'),(19,'usuarios','tipodocumento'),(20,'usuarios','tipousuario'),(21,'usuarios','usuarios');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-10-11 00:44:00'),(2,'auth','0001_initial','2018-10-11 00:44:00'),(3,'admin','0001_initial','2018-10-11 00:44:00'),(4,'admin','0002_logentry_remove_auto_add','2018-10-11 00:44:00'),(5,'contenttypes','0002_remove_content_type_name','2018-10-11 00:44:00'),(6,'auth','0002_alter_permission_name_max_length','2018-10-11 00:44:00'),(7,'auth','0003_alter_user_email_max_length','2018-10-11 00:44:01'),(8,'auth','0004_alter_user_username_opts','2018-10-11 00:44:01'),(9,'auth','0005_alter_user_last_login_null','2018-10-11 00:44:01'),(10,'auth','0006_require_contenttypes_0002','2018-10-11 00:44:01'),(11,'auth','0007_alter_validators_add_error_messages','2018-10-11 00:44:01'),(12,'sessions','0001_initial','2018-10-11 00:44:01'),(13,'direcciones','0001_initial','2018-10-13 01:46:05'),(14,'anuncios','0001_initial','2018-10-18 15:05:30'),(15,'anuncios','0002_auto_20181018_1359','2018-10-18 17:38:04'),(16,'anuncios','0003_auto_20181021_0822','2018-10-21 11:22:49');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('flognv6hvtot3zq9v3v1mb1vby14kli7','Yzc3MDhkMTc4MGYwOGIzNGEzODU5ZGVmMjNhZGU1ODA5NmZiYzJkYTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4NjMyMDZmMTJkNDllYTE5NzViM2EwMTI3YzRmZGE0NGIxNzRjMWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNSJ9','2018-11-01 21:47:53'),('gupubdbky1g8wqv0ajuihpyathklsssl','MmY5YmZlNDRlNzdlNjdjM2FjNDkwY2Q1ZWQwOTJmN2E5NDljODgwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU0NjUyNzgwNjVjMjNkZGVmODQ3M2NmNGI4YmIwOTlmMTI4MDI1ZDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNCJ9','2018-11-05 22:56:23'),('rxewu7angf5du3f0zq92gyqhfdvqqy52','Yzc3MDhkMTc4MGYwOGIzNGEzODU5ZGVmMjNhZGU1ODA5NmZiYzJkYTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4NjMyMDZmMTJkNDllYTE5NzViM2EwMTI3YzRmZGE0NGIxNzRjMWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNSJ9','2018-11-01 14:34:12');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentos`
--

DROP TABLE IF EXISTS `documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentos` (
  `id_documento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de Documento',
  `desc_documento` varchar(250) NOT NULL COMMENT 'Descripción del Documento',
  `path_documento` varchar(250) NOT NULL COMMENT 'Ubicación del documento en el servidor',
  `id_tipo_documento` int(11) NOT NULL COMMENT 'Identificador FK del tipo de documento',
  PRIMARY KEY (`id_documento`),
  KEY `id_tipo_documento_idx` (`id_tipo_documento`),
  CONSTRAINT `id_tipo_documento` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id_tipo_documento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de documentos anexos de usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos`
--

LOCK TABLES `documentos` WRITE;
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentos_link_usuarios`
--

DROP TABLE IF EXISTS `documentos_link_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentos_link_usuarios` (
  `id_doc_link_us` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador Tabla Link de Documentos y Usuario',
  `id_documento` int(11) NOT NULL COMMENT 'Identificador FK tabla Documento',
  `id_usuario` int(11) NOT NULL COMMENT 'Identificador FK tabla Usuario',
  `desc_doc_link_us` varchar(45) NOT NULL COMMENT 'Detalles documento',
  PRIMARY KEY (`id_doc_link_us`),
  KEY `id_documento_link_idx` (`id_documento`),
  KEY `id_usuario_link_idx` (`id_usuario`),
  CONSTRAINT `id_documento_link` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id_documento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_usuario_link` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de link entre documento y usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos_link_usuarios`
--

LOCK TABLES `documentos_link_usuarios` WRITE;
/*!40000 ALTER TABLE `documentos_link_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentos_link_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_postulacion`
--

DROP TABLE IF EXISTS `estado_postulacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_postulacion` (
  `id_estado_postulacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del Estado de Postulación',
  `desc_estado_postulacion` varchar(45) NOT NULL COMMENT 'Descripción dle estado de postulación',
  PRIMARY KEY (`id_estado_postulacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Tabla con estados de postulaciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_postulacion`
--

LOCK TABLES `estado_postulacion` WRITE;
/*!40000 ALTER TABLE `estado_postulacion` DISABLE KEYS */;
INSERT INTO `estado_postulacion` VALUES (0,'Inactiva'),(1,'Activa'),(2,'En Proceso'),(3,'Finalizada');
/*!40000 ALTER TABLE `estado_postulacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idioma` (
  `id_idioma` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de Idioma',
  `desc_idioma` varchar(45) NOT NULL COMMENT 'Descripción de Idioma',
  PRIMARY KEY (`id_idioma`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1 COMMENT='Tabla de listado de idiomas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (1,'Afrikaans'),(2,'Albanés'),(3,'Alemán'),(4,'Amharico'),(5,'Arabe'),(6,'Armenio'),(7,'Bengali'),(8,'Bieloruso'),(9,'Birmanés'),(10,'Bulgaro'),(11,'Catalan'),(12,'Checo'),(13,'Chino'),(14,'Coreano'),(15,'Croata'),(16,'Danés'),(17,'Dari'),(18,'Dzongkha'),(19,'Escocés'),(20,'Eslovaco'),(21,'Esloveniano'),(22,'Español'),(23,'Esperanto'),(24,'Estoniano'),(25,'Faroese'),(26,'Farsi'),(27,'Finlandés'),(28,'Francés'),(29,'Gaelico'),(30,'Galese'),(31,'Gallego'),(32,'Griego'),(33,'Hebreo'),(34,'Hindi'),(35,'Holandés'),(36,'Hungaro'),(37,'Inglés'),(38,'Indonesio'),(39,'Inuktitut (Eskimo)'),(40,'Islandico'),(41,'Italiano'),(42,'Japonés'),(43,'Khmer'),(44,'Kurdo'),(45,'Lao'),(46,'Laponico'),(47,'Latviano'),(48,'Lituano'),(49,'Macedonio'),(50,'Malayés'),(51,'Maltés'),(52,'Nepali'),(53,'Noruego'),(54,'Pashto'),(55,'Polaco'),(56,'Portugués'),(57,'Rumano'),(58,'Ruso'),(59,'Serbio'),(60,'Somali'),(61,'Suahili'),(62,'Sueco'),(63,'Tagalog-Filipino'),(64,'Tajik'),(65,'Tamil'),(66,'Tailandés'),(67,'Tibetano'),(68,'Tigrinia'),(69,'Tonganés'),(70,'Turco'),(71,'Turkmenistano'),(72,'Ucraniano'),(73,'Urdu'),(74,'Uzbekistano'),(75,'Vasco'),(76,'Vietnamés');
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacionalidad`
--

DROP TABLE IF EXISTS `nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nacionalidad` (
  `id_nacion` int(11) NOT NULL COMMENT 'Identificador de Nacionalidad',
  `desc_nacion` varchar(100) NOT NULL COMMENT 'Descripción de nacionalidad',
  PRIMARY KEY (`id_nacion`),
  UNIQUE KEY `id_nacion_UNIQUE` (`id_nacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de nacionalidades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidad`
--

LOCK TABLES `nacionalidad` WRITE;
/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
INSERT INTO `nacionalidad` VALUES (1,'Chileno');
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oficio_link_usuario`
--

DROP TABLE IF EXISTS `oficio_link_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oficio_link_usuario` (
  `id_of_link_us` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de tabla',
  `id_oficios` int(11) NOT NULL COMMENT 'Identificador FK de Oficios',
  `id_usuario` int(11) NOT NULL COMMENT 'Identificador FK de Usuarios',
  PRIMARY KEY (`id_of_link_us`),
  KEY `id_oficios_idx` (`id_oficios`),
  KEY `id_usuarios_idx` (`id_usuario`),
  CONSTRAINT `id_oficios_link` FOREIGN KEY (`id_oficios`) REFERENCES `oficios` (`id_oficios`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_usuarios_link` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de link entre oficio y usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oficio_link_usuario`
--

LOCK TABLES `oficio_link_usuario` WRITE;
/*!40000 ALTER TABLE `oficio_link_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `oficio_link_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oficios`
--

DROP TABLE IF EXISTS `oficios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oficios` (
  `id_oficios` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de Oficios',
  `desc_oficios` varchar(45) NOT NULL COMMENT 'Descripción de Oficios',
  PRIMARY KEY (`id_oficios`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla con listado de oficios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oficios`
--

LOCK TABLES `oficios` WRITE;
/*!40000 ALTER TABLE `oficios` DISABLE KEYS */;
/*!40000 ALTER TABLE `oficios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulacion`
--

DROP TABLE IF EXISTS `postulacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postulacion` (
  `id_postulacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de Postulación',
  `fecha_postulacion` datetime NOT NULL COMMENT 'Fecha de la postulación',
  `id_usuario_postulante` int(11) NOT NULL COMMENT 'Identificador FK del usuario postulante',
  `id_anuncio` int(11) NOT NULL COMMENT 'Identificador FK del Anuncio',
  `id_estado_postulacion` int(11) NOT NULL COMMENT 'Identificador FK del Estado de Postulación',
  `fecha_cambio_postulacion` datetime NOT NULL COMMENT 'Fecha de cambios en la postulación',
  PRIMARY KEY (`id_postulacion`),
  KEY `id_anuncio_idx` (`id_anuncio`),
  KEY `id_estado_postulacion_idx` (`id_estado_postulacion`),
  KEY `id_usuario_postulante` (`id_usuario_postulante`),
  CONSTRAINT `id_anuncio` FOREIGN KEY (`id_anuncio`) REFERENCES `anuncio` (`id_anuncio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_estado_postulacion` FOREIGN KEY (`id_estado_postulacion`) REFERENCES `estado_postulacion` (`id_estado_postulacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_usuario_postulante` FOREIGN KEY (`id_usuario_postulante`) REFERENCES `usuarios_postulante` (`user_ptr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COMMENT='Tabla con postulaciones a empleos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulacion`
--

LOCK TABLES `postulacion` WRITE;
/*!40000 ALTER TABLE `postulacion` DISABLE KEYS */;
INSERT INTO `postulacion` VALUES (4,'2018-10-22 15:28:12',27,1,1,'2018-10-22 15:28:12'),(5,'2018-10-22 15:28:59',27,3,1,'2018-10-22 15:28:59'),(6,'2018-10-22 15:29:40',27,2,1,'2018-10-22 15:29:57'),(7,'2018-10-22 15:30:18',27,3,1,'2018-10-22 15:30:39'),(8,'2018-10-22 15:31:04',27,2,1,'2018-10-22 15:31:04'),(9,'2018-10-22 17:04:50',27,1,1,'2018-10-22 17:04:50'),(10,'2018-10-22 17:41:04',27,1,1,'2018-10-22 17:41:04'),(11,'2018-10-22 18:47:53',27,1,1,'2018-10-22 18:47:53'),(12,'2018-10-22 19:04:48',17,2,1,'2018-10-22 19:04:48'),(13,'2018-10-22 22:16:06',27,2,1,'2018-10-22 22:16:06');
/*!40000 ALTER TABLE `postulacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesion`
--

DROP TABLE IF EXISTS `profesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesion` (
  `id_profesion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de Profesión',
  `desc_profesion` varchar(45) NOT NULL COMMENT 'Descripción de profesión',
  PRIMARY KEY (`id_profesion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de Profesiones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesion`
--

LOCK TABLES `profesion` WRITE;
/*!40000 ALTER TABLE `profesion` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesion_link_usuario`
--

DROP TABLE IF EXISTS `profesion_link_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesion_link_usuario` (
  `id_prof_link_us` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de tabla',
  `id_profesion` int(11) NOT NULL COMMENT 'Identificador FK de profesion',
  `id_usuario` int(11) NOT NULL COMMENT 'Identificador FK de Usuario',
  PRIMARY KEY (`id_prof_link_us`),
  KEY `id_profesion_link_idx` (`id_profesion`),
  KEY `id_usuario_link_idx` (`id_usuario`),
  CONSTRAINT `id_profesion_link` FOREIGN KEY (`id_profesion`) REFERENCES `profesion` (`id_profesion`),
  CONSTRAINT `id_usuario_link_prof` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla de link entre profesion y usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesion_link_usuario`
--

LOCK TABLES `profesion_link_usuario` WRITE;
/*!40000 ALTER TABLE `profesion_link_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesion_link_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id_region` int(11) NOT NULL COMMENT 'Identificador de Región',
  `desc_region` varchar(45) NOT NULL COMMENT 'Descripción de Region',
  PRIMARY KEY (`id_region`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla con listado de regiones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'De Tarapacá'),(2,'De Antofagasta'),(3,'De Atacama'),(4,'De Coquimbo'),(5,'De Valparaíso'),(6,'Del Libertador B. O\'Higgins'),(7,'Del Maule'),(8,'Del Bíobío'),(9,'De La Araucanía'),(10,'De Los Lagos'),(11,'De Aisén del Gral. C. Ibáñez del Campo'),(12,'De Magallanes y de La Antártica Chilena'),(13,'Metropolitana de Santiago'),(14,'De Los Ríos'),(15,'De Arica y Parinacota');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_anuncio`
--

DROP TABLE IF EXISTS `tipo_anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_anuncio` (
  `id_tipo_anuncio` int(11) NOT NULL COMMENT 'Identificador del Tipo de Anuncio',
  `desc_tipo_anuncio` varchar(45) NOT NULL COMMENT 'Descripción del Tipo de Anuncio',
  PRIMARY KEY (`id_tipo_anuncio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla con tipos de anuncios publicados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_anuncio`
--

LOCK TABLES `tipo_anuncio` WRITE;
/*!40000 ALTER TABLE `tipo_anuncio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del tipo de documento',
  `desc_tipo_documento` varchar(50) NOT NULL COMMENT 'Descripción dle Tipo de Documento',
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla con tipos de documentos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documento`
--

LOCK TABLES `tipo_documento` WRITE;
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL COMMENT 'Identificador del Tipo de Usuario',
  `desc_tipo_usuario` varchar(45) NOT NULL COMMENT 'Descripción del Tipo de Usuario',
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tablas con tipos de usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Postulante'),(2,'Empresa'),(3,'Administrador');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de Usuario',
  `rut_usuario` varchar(10) DEFAULT NULL COMMENT 'Rut del usuario',
  `status_usuario` tinyint(4) DEFAULT NULL COMMENT 'Estado del usuario, Activo o Inactivo',
  `nombre_usuario` varchar(45) DEFAULT NULL COMMENT 'Nombre del Usuario',
  `segnombre_usuario` varchar(45) DEFAULT NULL COMMENT 'Segundo Nombre del Usuario',
  `ape_paterno_usuario` varchar(45) DEFAULT NULL COMMENT 'Apellido Paterno del Usuario',
  `ape_materno_usuario` varchar(45) DEFAULT NULL COMMENT 'Apellido Materno del Usuario',
  `sexo_usuario` tinyint(4) DEFAULT NULL COMMENT 'Sexo del Usuario',
  `email_usuario` varchar(45) NOT NULL COMMENT 'Email del Usuario',
  `fono_cel_usuario` varchar(45) DEFAULT NULL COMMENT 'Teléfono celular del usuario',
  `fono_casa_usuario` varchar(45) DEFAULT NULL COMMENT 'Teléfono de casa del usuario',
  `id_tipo_usuario` int(11) NOT NULL COMMENT 'Identificador FK de Tipo de Usuario',
  `id_curriculum` int(11) DEFAULT NULL COMMENT 'Identificador FK de Currículum',
  `id_direccion` int(11) DEFAULT NULL COMMENT 'Identificador FK de Dirección',
  `id_nacion` int(11) DEFAULT NULL,
  `fecha_creacion_usuario` datetime NOT NULL COMMENT 'Fecha de Creación del Usuario',
  `fecha_modificacion_usuario` datetime NOT NULL COMMENT 'Fecha de Modificación del Usuario',
  `nick_usuario` varchar(45) DEFAULT NULL COMMENT 'Username del sistema del usuario',
  `password_usuario` varchar(256) NOT NULL COMMENT 'Clave para usar en el sistema del usuario',
  `foto_path_usuario` varchar(45) DEFAULT NULL COMMENT 'Ubicación de la foto del usuario',
  PRIMARY KEY (`id_usuario`),
  KEY `id_tipo_usuario_idx` (`id_tipo_usuario`),
  KEY `id_curriculum_idx` (`id_curriculum`),
  KEY `id_direccion_idx` (`id_direccion`),
  KEY `id_nacion_idx` (`id_nacion`),
  CONSTRAINT `id_curriculum` FOREIGN KEY (`id_curriculum`) REFERENCES `curriculum` (`id_curriculum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_direccion` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_nacion` FOREIGN KEY (`id_nacion`) REFERENCES `nacionalidad` (`id_nacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_tipo_usuario` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Tablas con usuarios del sistemas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'11111',1,'admin',NULL,'admin',NULL,1,'alfredo.figueroa.torres@gmail.com','3',NULL,3,NULL,1,NULL,'2018-09-06 00:00:00','2018-09-06 00:00:00','admin','admin',NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alfredo.figueroa.torres@gmail.com',NULL,NULL,1,NULL,NULL,NULL,'2018-10-04 12:50:58','2018-10-04 12:50:58',NULL,'fito1982',NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pepepe',NULL,NULL,2,NULL,NULL,NULL,'2018-10-04 12:54:17','2018-10-04 12:54:17',NULL,'fjoasdj',NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alfredo.figueroa.torres@gmail.com',NULL,NULL,3,NULL,NULL,NULL,'2018-10-04 13:03:12','2018-10-04 13:03:12',NULL,'sdasd',NULL),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'amorcita@poto.cl',NULL,NULL,1,NULL,NULL,NULL,'2018-10-11 00:46:19','2018-10-11 00:46:19',NULL,'chuchuchuc',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_empresa`
--

DROP TABLE IF EXISTS `usuarios_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_empresa` (
  `user_ptr_id` int(11) NOT NULL,
  `rut_empresa` varchar(10) DEFAULT NULL,
  `razon_social` varchar(45) DEFAULT NULL,
  `logo_path` varchar(45) DEFAULT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `fono_empresa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_ptr_id`),
  KEY `usuarios_empresa_id_direccion_4fd17c69_fk_direccion_id_direccion` (`id_direccion`),
  CONSTRAINT `usuarios_empresa_id_direccion_4fd17c69_fk_direccion_id_direccion` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`),
  CONSTRAINT `usuarios_empresa_user_ptr_id_1211de07_fk_auth_user_id` FOREIGN KEY (`user_ptr_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_empresa`
--

LOCK TABLES `usuarios_empresa` WRITE;
/*!40000 ALTER TABLE `usuarios_empresa` DISABLE KEYS */;
INSERT INTO `usuarios_empresa` VALUES (7,NULL,NULL,NULL,NULL,NULL),(9,NULL,NULL,NULL,NULL,NULL),(10,NULL,NULL,NULL,NULL,NULL),(12,NULL,NULL,NULL,NULL,NULL),(13,NULL,NULL,NULL,NULL,NULL),(14,NULL,NULL,NULL,NULL,NULL),(15,NULL,NULL,NULL,NULL,NULL),(16,'12222222-1','Alfredo','',4,'1221'),(19,NULL,NULL,NULL,NULL,NULL),(20,NULL,NULL,NULL,NULL,NULL),(21,NULL,NULL,NULL,NULL,NULL),(23,NULL,NULL,NULL,NULL,NULL),(24,'','Empresa trucha','',6,''),(25,'13213213-5','Migrante Empresa','',7,'3424324'),(26,'13233242-2','Empresa Inc 27','',2,'998343434');
/*!40000 ALTER TABLE `usuarios_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_postulante`
--

DROP TABLE IF EXISTS `usuarios_postulante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_postulante` (
  `user_ptr_id` int(11) NOT NULL,
  `rut_postulante` varchar(10) DEFAULT NULL,
  `segnombre_usuario` varchar(45) DEFAULT NULL,
  `ape_materno_usuario` varchar(45) DEFAULT NULL,
  `sexo_usuario` int(11) DEFAULT NULL,
  `fono_cel_usuario` varchar(45) DEFAULT NULL,
  `fono_casa_usuario` varchar(45) DEFAULT NULL,
  `id_curriculum` int(11) DEFAULT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `id_nacion` int(11) DEFAULT NULL,
  `foto_path_usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_ptr_id`),
  KEY `usuarios_post_id_curriculum_dc572c4c_fk_curriculum_id_curriculum` (`id_curriculum`),
  KEY `usuarios_postula_id_direccion_30175849_fk_direccion_id_direccion` (`id_direccion`),
  KEY `usuarios_postulante_id_nacion_d18f8abb_fk_nacionalidad_id_nacion` (`id_nacion`),
  CONSTRAINT `usuarios_post_id_curriculum_dc572c4c_fk_curriculum_id_curriculum` FOREIGN KEY (`id_curriculum`) REFERENCES `curriculum` (`id_curriculum`),
  CONSTRAINT `usuarios_postula_id_direccion_30175849_fk_direccion_id_direccion` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`),
  CONSTRAINT `usuarios_postulante_id_nacion_d18f8abb_fk_nacionalidad_id_nacion` FOREIGN KEY (`id_nacion`) REFERENCES `nacionalidad` (`id_nacion`),
  CONSTRAINT `usuarios_postulante_user_ptr_id_378b1226_fk_auth_user_id` FOREIGN KEY (`user_ptr_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_postulante`
--

LOCK TABLES `usuarios_postulante` WRITE;
/*!40000 ALTER TABLE `usuarios_postulante` DISABLE KEYS */;
INSERT INTO `usuarios_postulante` VALUES (5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'1212121212','','',NULL,'','',NULL,NULL,NULL,''),(17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'','Alfredo','Torres',NULL,'0998454516','0998454516',NULL,2,1,''),(28,'123123213','','Postur',NULL,'231123123','',NULL,6,1,'');
/*!40000 ALTER TABLE `usuarios_postulante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-23  2:10:47
