-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: chat_app
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--
CREATE DATABASE IF NOT EXISTS chat_app;

USE chat_app;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add message',7,'add_message'),(26,'Can change message',7,'change_message'),(27,'Can delete message',7,'delete_message'),(28,'Can view message',7,'view_message'),(29,'Can add conversation',8,'add_conversation'),(30,'Can change conversation',8,'change_conversation'),(31,'Can delete conversation',8,'delete_conversation'),(32,'Can view conversation',8,'view_conversation');
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
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$f7l2Q8AKquZiC1dlc3u8D2$+lMaEBhhbhZ+02EaCVYvoAkvzfdfpNKvOFcwP9+IzH0=','2024-04-21 12:42:34.964749',1,'stauros','','','dim.vaiopoulos@gmail.com',1,1,'2024-04-18 10:14:29.000000'),(2,'pbkdf2_sha256$720000$DDnV9rVJqCQbKbDHAXwXNs$00QaMR4bL42ppohYCV01A+J3nNDWfWpEz2luPDnPcK0=','2024-04-21 09:59:14.448645',0,'test','','','test@gmail.com',0,1,'2024-04-18 11:38:49.000000'),(3,'pbkdf2_sha256$720000$lDCN2FrKcCUDP2T9Y9ervk$9ZwJpmlBj3uS58lxHmC6ysusLxsWVIMNgyzLaljS/LU=','2024-04-20 16:08:49.027650',0,'test2','','','',0,1,'2024-04-18 20:37:49.000000'),(23,'pbkdf2_sha256$720000$2kQCs5RRdxkie9nsVYaJxb$WgFTF1/NU0GgEr117hfvhErEDO/ZAyD7pjsz/HUPyGA=','2024-04-20 17:20:36.541170',0,'testaki2','testaki2','testaki2','testaki2@gmail.com',0,1,'2024-04-20 17:18:36.879004'),(24,'pbkdf2_sha256$720000$Ag72BiqmU9VZjfK1NTo8yy$P1Dv7BpduerzAwujGUFmqPvdKjzJ5L5GmKo9VwdiWrU=','2024-04-20 17:22:22.295877',0,'testaki','testaki','testaki','testaki@gmail.com',0,1,'2024-04-20 17:22:12.395119'),(25,'pbkdf2_sha256$720000$exRjUTKqZG3QimZajOvSjb$AWzypOuoEBnWf43xZi24pIlc/xopQ9V91cp/FJ1GPec=',NULL,0,'testing','testing','testing','testing@gmail.com',0,1,'2024-04-20 17:23:46.058228'),(26,'pbkdf2_sha256$720000$UMESzD1UWnbR815wwLWVT5$XTz9Cf7mXsuLzIihuby4Jb2rKmTjouZUYTLvoLArFf8=','2024-04-20 17:25:24.678204',0,'grafw','grafw','grafw','grafw@gmail.com',0,1,'2024-04-20 17:25:01.546437'),(27,'pbkdf2_sha256$720000$6DXCOee9thJNvwZlZxZ0XQ$bWpQr9CsP3xn8QbBs+RUgeDuEvPRpq/NhNbOg+Sj3ss=','2024-04-21 11:41:50.297451',0,'eleutheria','eleutheria','sideri','eleutheriasideri95@gmail.com',0,1,'2024-04-20 17:28:53.743107');
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
-- Table structure for table `chat_conversation`
--

DROP TABLE IF EXISTS `chat_conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_conversation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user1_id` int NOT NULL,
  `user2_id` int NOT NULL,
  `last_message_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_conversation_last_message_id_e5876cb9_fk_chat_message_id` (`last_message_id`),
  KEY `chat_conversation_user1_id_40866d67_fk_auth_user_id` (`user1_id`),
  KEY `chat_conversation_user2_id_be3cd90d_fk_auth_user_id` (`user2_id`),
  CONSTRAINT `chat_conversation_last_message_id_e5876cb9_fk_chat_message_id` FOREIGN KEY (`last_message_id`) REFERENCES `chat_message` (`id`),
  CONSTRAINT `chat_conversation_user1_id_40866d67_fk_auth_user_id` FOREIGN KEY (`user1_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `chat_conversation_user2_id_be3cd90d_fk_auth_user_id` FOREIGN KEY (`user2_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_conversation`
--

LOCK TABLES `chat_conversation` WRITE;
/*!40000 ALTER TABLE `chat_conversation` DISABLE KEYS */;
INSERT INTO `chat_conversation` VALUES (1,1,2,NULL),(2,3,2,NULL),(3,1,1,4),(4,1,3,NULL),(5,27,1,NULL);
/*!40000 ALTER TABLE `chat_conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `conversation_id` bigint NOT NULL,
  `sender_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_message_conversation_id_a1207bf4_fk_chat_conversation_id` (`conversation_id`),
  KEY `chat_message_sender_id_991c686c_fk_auth_user_id` (`sender_id`),
  CONSTRAINT `chat_message_conversation_id_a1207bf4_fk_chat_conversation_id` FOREIGN KEY (`conversation_id`) REFERENCES `chat_conversation` (`id`),
  CONSTRAINT `chat_message_sender_id_991c686c_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message`
--

LOCK TABLES `chat_message` WRITE;
/*!40000 ALTER TABLE `chat_message` DISABLE KEYS */;
INSERT INTO `chat_message` VALUES (1,'hey','2024-04-18 20:16:37.822037',1,1),(2,'hey test','2024-04-18 20:16:45.104780',1,2),(3,'456456','2024-04-18 20:40:36.418600',2,2),(4,'hjbgyujg','2024-04-18 20:40:43.884517',2,3),(5,'yo','2024-04-21 08:24:31.193789',3,1),(6,'how are you?','2024-04-21 09:44:14.010553',1,2),(7,'fine and you ?','2024-04-21 09:58:27.034525',1,1),(8,'fine mate','2024-04-21 09:59:26.091872',1,2),(9,'happy to hear that','2024-04-21 10:05:36.329480',1,1),(10,'what are we going to do today ?','2024-04-21 10:06:00.522249',1,2),(11,'dunno what do you want ?','2024-04-21 10:06:22.039763',1,1),(12,'let\'s go for coffee!!','2024-04-21 10:07:35.613890',1,2),(13,'Hi, Stavros','2024-04-21 11:42:22.146057',5,27),(14,'ewki','2024-04-21 11:43:12.601422',5,1),(15,'hey bebito','2024-04-21 11:43:25.216333',5,1),(16,'sending some more','2024-04-21 12:42:49.065476',1,1),(17,'and more','2024-04-21 12:43:46.284178',1,1);
/*!40000 ALTER TABLE `chat_message` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-04-18 11:31:14.565765','1','stauros',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1),(2,'2024-04-18 11:38:49.648475','2','test',1,'[{\"added\": {}}]',4,1),(3,'2024-04-18 11:39:00.278820','2','test',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1),(4,'2024-04-18 20:37:49.977988','3','test2',1,'[{\"added\": {}}]',4,1),(5,'2024-04-18 20:38:02.335427','3','test2',2,'[]',4,1),(6,'2024-04-20 17:21:38.287048','22','{\'username\': \'testaki\', \'password\': \'testaki\', \'first_name\': \'testaki\', \'last_name\': \'testaki\', \'email\': \'testaki@gmail.com\'}',3,'',4,1),(7,'2024-04-20 17:21:38.292894','21','<rest_framework.request.Request: POST \'/api/users/\'>',3,'',4,1),(8,'2024-04-20 17:21:38.296893','19','kanwtest',3,'',4,1),(9,'2024-04-20 17:21:38.302894','11','test10',3,'',4,1),(10,'2024-04-20 17:21:38.308843','12','test11',3,'',4,1),(11,'2024-04-20 17:21:38.313843','5','test3',3,'',4,1),(12,'2024-04-20 17:21:38.317847','4','test4',3,'',4,1),(13,'2024-04-20 17:21:38.322285','6','test5',3,'',4,1),(14,'2024-04-20 17:21:38.326827','7','test6',3,'',4,1),(15,'2024-04-20 17:21:38.330826','8','test7',3,'',4,1),(16,'2024-04-20 17:21:38.335826','9','test8',3,'',4,1),(17,'2024-04-20 17:21:38.339825','10','test9',3,'',4,1),(18,'2024-04-20 17:21:38.343936','20','testaki',3,'',4,1),(19,'2024-04-20 17:21:38.347935','13','testpsagmeno12',3,'',4,1),(20,'2024-04-20 17:21:38.351936','14','testpsagmeno13',3,'',4,1),(21,'2024-04-20 17:21:38.355936','15','testpsagmeno14',3,'',4,1),(22,'2024-04-20 17:21:38.359936','16','testpsagmeno15',3,'',4,1),(23,'2024-04-20 17:21:38.364045','17','testpsagmeno16',3,'',4,1),(24,'2024-04-20 17:21:38.368694','18','testpsagmeno17',3,'',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'chat','conversation'),(7,'chat','message'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-04-18 09:17:48.674058'),(2,'auth','0001_initial','2024-04-18 09:17:49.444083'),(3,'admin','0001_initial','2024-04-18 09:17:49.744984'),(4,'admin','0002_logentry_remove_auto_add','2024-04-18 09:17:49.752984'),(5,'admin','0003_logentry_add_action_flag_choices','2024-04-18 09:17:49.761982'),(6,'contenttypes','0002_remove_content_type_name','2024-04-18 09:17:49.864319'),(7,'auth','0002_alter_permission_name_max_length','2024-04-18 09:17:49.946899'),(8,'auth','0003_alter_user_email_max_length','2024-04-18 09:17:49.977861'),(9,'auth','0004_alter_user_username_opts','2024-04-18 09:17:49.993860'),(10,'auth','0005_alter_user_last_login_null','2024-04-18 09:17:50.078046'),(11,'auth','0006_require_contenttypes_0002','2024-04-18 09:17:50.083046'),(12,'auth','0007_alter_validators_add_error_messages','2024-04-18 09:17:50.091129'),(13,'auth','0008_alter_user_username_max_length','2024-04-18 09:17:50.183240'),(14,'auth','0009_alter_user_last_name_max_length','2024-04-18 09:17:50.262748'),(15,'auth','0010_alter_group_name_max_length','2024-04-18 09:17:50.287564'),(16,'auth','0011_update_proxy_permissions','2024-04-18 09:17:50.295560'),(17,'auth','0012_alter_user_first_name_max_length','2024-04-18 09:17:50.384140'),(18,'chat','0001_initial','2024-04-18 09:17:50.390909'),(19,'sessions','0001_initial','2024-04-18 09:17:50.448568'),(20,'chat','0002_initial','2024-04-18 09:18:23.016091');
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
INSERT INTO `django_session` VALUES ('08u3c4318y5iem7fk6rg6io7jl9mu4ib','e30:1rxrKp:dvp7CpfzD1_IcPM6ZowzilEZohxU9HxVVdZ_VTYCZ6k','2024-05-03 16:43:35.712316'),('0mo3jyz8coqyoq9xysfyqzx66r1lgddg','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxq3z:a_zVYz7CTJn-VHNEhYHF_bOpt3mIcwYmMWDx9JKkxsQ','2024-05-03 15:22:07.204917'),('175owlslvokk0102wwrngl9x5vte8j9i','e30:1rxrIH:zTWU4dMpHHlmexznlTjAmkW_xNQm5wk6YN4IDfwtUdc','2024-05-03 16:40:57.582700'),('3r6worzcqduvm1txs6sxvnon8nutrfo9','e30:1rxqpU:PnjCziqwi8OFjPtVJuolt_RCxKpFCp7k5RW_U7i37cM','2024-05-03 16:11:12.139260'),('3xcd63l07tihq52m95u2aokro0x6bklu','e30:1rxrN9:SotmBuDQmJ7uEKjtZg5BgKLaZ_wZic3PuRCOX2s4kZA','2024-05-03 16:45:59.541002'),('3zwcxtyucijb45fdcwolh3r9h07hkrhw','e30:1rxrSE:_oqhKICtcL537E1jCNlbTTJRJIBh0Ur1osw7rZd9O-o','2024-05-03 16:51:14.695807'),('6e6sv7p2xh04lh06c6rmlhr1xe5bw1xl','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxqZO:M_7pJY79EkDVORAkwqGu2TCqUieGMVxdpi6NLFpNjBA','2024-05-03 15:54:34.962549'),('6zdbm1lgdfoqjbhrfp7d7y6vm1b70fbx','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxqNG:pGuWLtpZIuLdvIYJ8mXcx2KodFk2heANcILakAlL7uA','2024-05-03 15:42:02.842837'),('7tblu8fiq4qqglxnsfaqbtryskz3oroq','e30:1rxqrJ:0zsMu_tumX0_IVmAlH71r9NSc_xs8-USGHqf_Gqn9IY','2024-05-03 16:13:05.931626'),('8g5e04td93d7rop9qg0l0emme1awr438','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxpp3:VDgKaR70uBjqxbRmNP5O3c92ce4PEPbT5dfUlUqdgh8','2024-05-03 15:06:41.688216'),('8o80e2x997uo1rfuinybt1s3ye914kml','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxpXB:q_mw9TfMfUvNUQgx5vxFMU3rGa712BPFnuFKdalDraI','2024-05-03 14:48:13.793458'),('bdp2yfq0wnn3do14m1bqzsl543rzwuhp','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxp6d:LzkeLSp-THPWMY-ZaSNrsQSzMjd5TGgR7FUtHUN7A_I','2024-05-03 14:20:47.210574'),('caeutftfb7u8mjsikuq4f1cjq2vn2l8c','e30:1rxqt0:TpnkCG4-dnaKvVvlMeoOHCiRSeGEvz9eY0RsSfzJmSw','2024-05-03 16:14:50.640845'),('ckhh8mlt0prtnmq9y7bu3p58bnrvxc12','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxp0x:GkeiBNIcfj3FqEvv76kTvGIPcewwptEUEsHKfmQFMW0','2024-05-03 14:14:55.613119'),('covb7fnufvub1cith7fw2066c5zvih9a','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxqar:F3dGlPc6WyjpoMgzTLh_qxh1nwADaR2qq1TYIbpSy78','2024-05-03 15:56:05.473302'),('di0y6vq199alisf0aqo19d7mv12pyi50','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxqYg:mXYLgzVcnHQQD8Lxza2Upce3fwk3PPgSMxpPwyHjArw','2024-05-03 15:53:50.006127'),('e4y8i1uo5hm5lsgqu13zt5qs6c0gt0d2','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxqLZ:5lJxr66tD0Vsp-KFPeeZ1lGo6jmMxljuV7-9IONmXTs','2024-05-03 15:40:17.864582'),('g68thmp1xvr47riwaj2tv733iava0lvi','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxqee:TSUOu4tvk-1loO2A_W6G4mG1ZCu3wcKthfHGi2vlPtg','2024-05-03 16:00:00.364654'),('glgvkuugnu0w0ux8o4l1f42yx5mf02sm','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxpr1:2caXGOoq4tUWkQALiQ5b8Kj3txpnDdV39LJ9Z8C-p3M','2024-05-03 15:08:43.510597'),('itv9ouj3hp4dp7haolgggk7czv5huks7','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxpo8:Gb7cWZiDXgNeu0jTtISsvSbGbJFz86OeaiZx0tjjUPo','2024-05-03 15:05:44.726956'),('la7ugi3b4s7p4cvkw30dirseofe194o1','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxvp1:kJa7_LiRAVE2X8myIHnEgWrdbuzp9Mx5FyegguagrMQ','2024-05-03 21:31:03.657862'),('lowaj6ew4owtjcihx0t7s3b2ho3c3a6v','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxpsj:HS2nTa7TvVktMoe-1Lp2IxYs6AKsQut3IS_uftfHZa0','2024-05-03 15:10:29.494602'),('pe082saztfsjal4y3y259r6087x5jufa','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxpru:iCg4hfl2kFDl9KW4zOmB988yuTAXemptZR7G6a6trpA','2024-05-03 15:09:38.448647'),('pe2zruri92v6yun8sgko4jb0hwwn96qb','e30:1rxrNa:eVrZDnz0EkJVSBhM5LEryUkmIR2a40Pp1UqfN9Lzsko','2024-05-03 16:46:26.028173'),('py6u2yp20krwjbp2yl7ctsugicy10ymh','e30:1rxrd5:PbXnInXqBh56v2Xb9LNwkXeiunIpm6-IPZjUdPbD1sg','2024-05-03 17:02:27.155556'),('pyg56oaj1olxbs7xngqzm9pzhxmms3bk','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxqM6:xpWmZ2soVIMk2n1f1YFGTnH5GyepAEt5DHrHCBd-aTQ','2024-05-03 15:40:50.261736'),('q77ma0p005igebwmir846zfrcifpj1k5','e30:1rxrIy:DowEwO38s61IKN0xEknMgEHPpkODpYUW7hod1irgGzg','2024-05-03 16:41:40.832586'),('q8znykfzm9k8r8ltwjsnwpikk76bl0j7','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxqV6:m7TE2Y9SYiWf1GwG8rvZ-eplCIy9kH49laidLT4EFO0','2024-05-03 15:50:08.309964'),('qqfpkfayvq2dhs5d3h336asy71nwzbyk','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxqhT:9-WkZo3Fn4_pNDNfZU9kPOFXOh4yy78QbeYkGjhe9fE','2024-05-03 16:02:55.704275'),('r1n92h0qxelux2o6tpqwv9bva2rxg3z9','e30:1rxrNu:V0htrjSssHJstMx7QFU7w30F7afKikyZtHtwdIEyqgY','2024-05-03 16:46:46.352802'),('ruatb4yucq0uyqm8xv85lkvtczs20lmj','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxvnj:vLnkqsBUKAcy3yb76xMcyX5IjCMvopzz4ILAsX-AzH8','2024-05-03 21:29:43.746206'),('tadim9ebeeu9ak69ouxlas74tvzvcmdg','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1ry4q9:qU3pVI-B7yY0rppZFziRvkz13S3DmU7n5iodc--FGzg','2024-05-04 07:08:49.388458'),('tfkmx26vkryaay2dfkeui1jfjpgkx417','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1ry6tz:Pb4semFOj7fWdthOkzA6BYbdVrXWafQ7QoSsu0Hpzq4','2024-05-04 09:20:55.051537'),('ubg6g5fhpi2hs8f1ddilonidur2hj5h6','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1ry3W6:HE72KbpWiCY4y7MlRu9HT2n0GBD5s9j0Tnhh_65qA4w','2024-05-04 05:44:02.061585'),('v7d1fhwkm6jzlc26ig3gefwxrd71pnhi','e30:1rxrKE:NB2xNbM4ou1ZbZZeTjTezaE6qf9_4buST1AoBZFRY5c','2024-05-03 16:42:58.001729'),('vt6qgfhtbcs29vrfkxn7601c4zy0p627','e30:1rxrLD:43wjKlZlOeSOVvLNkvYsFg9nFHeWqdx6DezQ3SlU_AE','2024-05-03 16:43:59.171989'),('x75ddehsq3lw13v70s2d1ur4bp2psq4g','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxpes:h67DdpzJz5QneINSc-SDH_Jmfk_wnLl2aNC83H20ucc','2024-05-03 14:56:10.699118'),('xs5iluu5x5mxvwaqv7v8vjn5gfdw2c4f','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1ry4J6:CkbMQ5UK0Z7BCpJM2eDD3tvA1ibXkNJxe6vVdIewbRM','2024-05-04 06:34:40.379758'),('yf6bazu7k183ae22tsr4ciygr2a2lxhf','e30:1rxr1x:73HsbwOnusengBE1PgQzEeWR3xuF1jb_4xyuU317aPQ','2024-05-03 16:24:05.497208'),('yubonlk814ew42e7ih9bu2t8dhnjbd77','e30:1rxrPk:2oD1GCtoX92Er3nbdqdIGKy5iZqx7PHr1EJpqu1l_RU','2024-05-03 16:48:40.328571'),('yxsgzpcnynsv946vo93xz4qpnaax9k9p','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxpDO:yBU33OHH0zcdSOh4HW-X9kXS0CHbCC4gdubNQLY0-HU','2024-05-03 14:27:46.797964'),('z4hpqad851no3m1zawbx8433vtmyomog','.eJxVjEsOwiAUAO_C2pAHFUhduvcM5H2oVA0kpV013l1JutDtzGR2FXFbc9xaWuIs6qKMOv0yQn6m0oU8sNyr5lrWZSbdE33Ypm9V0ut6tH-DjC33rYQAGAZGhsl5z-wHS2SIAiV3tjQ4A4HEgDUeRgEnMAKabwoTWaveH95NNzw:1rxs7V:CQG_rxkj8f4Y_lkv1WmLB7COZE7tSYO89PgTN2TJlU0','2024-05-03 17:33:53.241124'),('z5n8iq3p8cldq2zohi8t1yu5patyhxej','e30:1rxqqL:71WCxbGa9k7ncom6ghYLAo4YISrhtB38TmqXh1X4qj4','2024-05-03 16:12:05.667545');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-22 19:21:49
