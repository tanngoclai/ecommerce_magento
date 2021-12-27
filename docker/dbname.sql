-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: magento
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `admin_analytics_usage_version_log`
--

DROP TABLE IF EXISTS `admin_analytics_usage_version_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_analytics_usage_version_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `last_viewed_in_version` varchar(50) NOT NULL COMMENT 'Viewer last viewed on product version',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ADMIN_ANALYTICS_USAGE_VERSION_LOG_LAST_VIEWED_IN_VERSION` (`last_viewed_in_version`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Admin Notification Viewer Log Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_analytics_usage_version_log`
--

LOCK TABLES `admin_analytics_usage_version_log` WRITE;
/*!40000 ALTER TABLE `admin_analytics_usage_version_log` DISABLE KEYS */;
INSERT INTO `admin_analytics_usage_version_log` VALUES (1,'2.4.3');
/*!40000 ALTER TABLE `admin_analytics_usage_version_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_passwords`
--

DROP TABLE IF EXISTS `admin_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_passwords` (
  `password_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Password ID',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `expires` int unsigned NOT NULL DEFAULT '0' COMMENT 'Deprecated',
  `last_updated` int unsigned NOT NULL DEFAULT '0' COMMENT 'Last Updated',
  PRIMARY KEY (`password_id`),
  KEY `ADMIN_PASSWORDS_USER_ID` (`user_id`),
  CONSTRAINT `ADMIN_PASSWORDS_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Admin Passwords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_passwords`
--

LOCK TABLES `admin_passwords` WRITE;
/*!40000 ALTER TABLE `admin_passwords` DISABLE KEYS */;
INSERT INTO `admin_passwords` VALUES (1,1,'0514faea72ddd7ff85421c1e264c9a2db17ca252d1230cbe7afa6ccc8b7a9588:zAMSx9vEn4gWr8BIDvNFS51h9NrxEoj9:3_32_2_67108864',0,1635605271);
/*!40000 ALTER TABLE `admin_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_system_messages`
--

DROP TABLE IF EXISTS `admin_system_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_system_messages` (
  `identity` varchar(100) NOT NULL COMMENT 'Message ID',
  `severity` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  PRIMARY KEY (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin System Messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_system_messages`
--

LOCK TABLES `admin_system_messages` WRITE;
/*!40000 ALTER TABLE `admin_system_messages` DISABLE KEYS */;
INSERT INTO `admin_system_messages` VALUES ('da332d712f3215b9b94bfa268c398323',2,'2021-10-30 15:08:17');
/*!40000 ALTER TABLE `admin_system_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(255) NOT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'User Created Time',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'User Login Number',
  `reload_acl_flag` smallint NOT NULL DEFAULT '0' COMMENT 'Reload ACL',
  `is_active` smallint NOT NULL DEFAULT '1' COMMENT 'User Is Active',
  `extra` text COMMENT 'User Extra Data',
  `rp_token` text COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  `interface_locale` varchar(16) NOT NULL DEFAULT 'en_US' COMMENT 'Backend interface locale',
  `failures_num` smallint DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Expiration Lock Dates',
  `refresh_token` text COMMENT 'Email connector refresh token',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Admin User Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'admin','admin','admin@admin.com','admin','0514faea72ddd7ff85421c1e264c9a2db17ca252d1230cbe7afa6ccc8b7a9588:zAMSx9vEn4gWr8BIDvNFS51h9NrxEoj9:3_32_2_67108864','2021-10-30 14:47:51','2021-10-31 16:51:31','2021-10-31 16:51:31',10,0,1,'{\"configState\":{\"general_country\":\"1\",\"general_locale\":\"0\",\"general_store_information\":\"0\",\"general_single_store_mode\":\"0\",\"general_region\":\"1\",\"currency_options\":\"1\"}}',NULL,NULL,'en_US',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_expiration`
--

DROP TABLE IF EXISTS `admin_user_expiration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user_expiration` (
  `user_id` int unsigned NOT NULL COMMENT 'User ID',
  `expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'User Expiration Date',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `ADMIN_USER_EXPIRATION_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin User expiration dates table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_expiration`
--

LOCK TABLES `admin_user_expiration` WRITE;
/*!40000 ALTER TABLE `admin_user_expiration` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_expiration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_session`
--

DROP TABLE IF EXISTS `admin_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user_session` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `session_id` varchar(128) NOT NULL COMMENT 'Session ID value',
  `user_id` int unsigned DEFAULT NULL COMMENT 'Admin User ID',
  `status` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Current Session status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `ADMIN_USER_SESSION_SESSION_ID` (`session_id`),
  KEY `ADMIN_USER_SESSION_USER_ID` (`user_id`),
  CONSTRAINT `ADMIN_USER_SESSION_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COMMENT='Admin User sessions table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_session`
--

LOCK TABLES `admin_user_session` WRITE;
/*!40000 ALTER TABLE `admin_user_session` DISABLE KEYS */;
INSERT INTO `admin_user_session` VALUES (1,'ke5pfhf4b75lolp2kb2cifh929',1,2,'2021-10-30 15:08:10','2021-10-30 15:17:35','42.113.121.219'),(2,'r3d88gj8m618s3qqscoovft56m',1,1,'2021-10-30 15:17:35','2021-10-30 15:18:53','14.162.140.173'),(3,'ip9n34ghi5cfv90iiina51m9c8',1,1,'2021-10-30 15:34:17','2021-10-30 15:34:17','14.228.162.25'),(4,'m8fr964hkgepr7pgbq8qup0750',1,1,'2021-10-30 15:50:03','2021-10-30 15:54:21','14.228.162.25'),(5,'860c3ub9t3jov1c11dar320773',1,1,'2021-10-31 06:54:23','2021-10-31 06:54:52','14.228.162.25'),(6,'nv2780e95n6kap65r0gja4duoc',1,1,'2021-10-31 08:12:12','2021-10-31 08:28:22','113.191.89.1'),(7,'p98dgm6sih964cvt9a2ot7q5eo',1,1,'2021-10-31 08:49:08','2021-10-31 08:49:37','113.191.89.1'),(8,'euip987pie491eda9avukotn37',1,1,'2021-10-31 13:19:37','2021-10-31 13:38:13','113.191.89.1'),(9,'i1o82rase0j40a5s7btrfnsu5r',1,1,'2021-10-31 15:38:15','2021-10-31 16:13:15','113.191.89.1'),(10,'eqcfjmiod37ul3uuaeg8a618so',1,1,'2021-10-31 16:51:31','2021-10-31 17:18:44','113.191.89.1');
/*!40000 ALTER TABLE `admin_user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminnotification_inbox`
--

DROP TABLE IF EXISTS `adminnotification_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminnotification_inbox` (
  `notification_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Notification ID',
  `severity` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification read',
  `is_remove` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification might be removed',
  PRIMARY KEY (`notification_id`),
  KEY `ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Adminnotification Inbox';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminnotification_inbox`
--

LOCK TABLES `adminnotification_inbox` WRITE;
/*!40000 ALTER TABLE `adminnotification_inbox` DISABLE KEYS */;
INSERT INTO `adminnotification_inbox` VALUES (1,4,'2021-10-30 14:47:48','Disable Notice','To improve performance, collecting statistics for the Magento Report module is disabled by default. \nYou can enable it in System Config.','',0,0);
/*!40000 ALTER TABLE `adminnotification_inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adobe_stock_asset`
--

DROP TABLE IF EXISTS `adobe_stock_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adobe_stock_asset` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `media_gallery_id` int unsigned DEFAULT NULL COMMENT 'Media gallery ID',
  `category_id` int unsigned DEFAULT NULL COMMENT 'Category ID',
  `creator_id` int unsigned DEFAULT NULL COMMENT 'Creator ID',
  `is_licensed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Is Licensed',
  `creation_date` varchar(255) DEFAULT NULL COMMENT 'Creation Date',
  PRIMARY KEY (`id`),
  KEY `ADOBE_STOCK_ASSET_MEDIA_GALLERY_ID_MEDIA_GALLERY_ASSET_ID` (`media_gallery_id`),
  KEY `ADOBE_STOCK_ASSET_ID` (`id`),
  KEY `ADOBE_STOCK_ASSET_CATEGORY_ID` (`category_id`),
  KEY `ADOBE_STOCK_ASSET_CREATOR_ID` (`creator_id`),
  CONSTRAINT `ADOBE_STOCK_ASSET_CATEGORY_ID_ADOBE_STOCK_CATEGORY_ID` FOREIGN KEY (`category_id`) REFERENCES `adobe_stock_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ADOBE_STOCK_ASSET_CREATOR_ID_ADOBE_STOCK_CREATOR_ID` FOREIGN KEY (`creator_id`) REFERENCES `adobe_stock_creator` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ADOBE_STOCK_ASSET_MEDIA_GALLERY_ID_MEDIA_GALLERY_ASSET_ID` FOREIGN KEY (`media_gallery_id`) REFERENCES `media_gallery_asset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Adobe Stock Asset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adobe_stock_asset`
--

LOCK TABLES `adobe_stock_asset` WRITE;
/*!40000 ALTER TABLE `adobe_stock_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `adobe_stock_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adobe_stock_category`
--

DROP TABLE IF EXISTS `adobe_stock_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adobe_stock_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  PRIMARY KEY (`id`),
  KEY `ADOBE_STOCK_CATEGORY_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Adobe Stock Category';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adobe_stock_category`
--

LOCK TABLES `adobe_stock_category` WRITE;
/*!40000 ALTER TABLE `adobe_stock_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `adobe_stock_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adobe_stock_creator`
--

DROP TABLE IF EXISTS `adobe_stock_creator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adobe_stock_creator` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Asset creator''s name',
  PRIMARY KEY (`id`),
  KEY `ADOBE_STOCK_CREATOR_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Adobe Stock Creator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adobe_stock_creator`
--

LOCK TABLES `adobe_stock_creator` WRITE;
/*!40000 ALTER TABLE `adobe_stock_creator` DISABLE KEYS */;
/*!40000 ALTER TABLE `adobe_stock_creator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adobe_user_profile`
--

DROP TABLE IF EXISTS `adobe_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adobe_user_profile` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `admin_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Admin User Id',
  `name` varchar(255) NOT NULL COMMENT 'Display Name',
  `email` varchar(255) NOT NULL COMMENT 'user profile email',
  `image` varchar(255) NOT NULL COMMENT 'user profile avatar',
  `account_type` varchar(255) DEFAULT NULL COMMENT 'Account Type',
  `access_token` text COMMENT 'Access Token',
  `refresh_token` text COMMENT 'Refresh Token',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `access_token_expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Access Token Expires At',
  PRIMARY KEY (`id`),
  KEY `ADOBE_USER_PROFILE_ADMIN_USER_ID_ADMIN_USER_USER_ID` (`admin_user_id`),
  KEY `ADOBE_USER_PROFILE_ID` (`id`),
  CONSTRAINT `ADOBE_USER_PROFILE_ADMIN_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Adobe IMS User Profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adobe_user_profile`
--

LOCK TABLES `adobe_user_profile` WRITE;
/*!40000 ALTER TABLE `adobe_user_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `adobe_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amazon_customer`
--

DROP TABLE IF EXISTS `amazon_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amazon_customer` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `customer_id` int unsigned NOT NULL COMMENT 'Customer_id',
  `amazon_id` varchar(255) NOT NULL COMMENT 'Amazon_id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_CUSTOMER_CUSTOMER_ID_AMAZON_ID` (`customer_id`,`amazon_id`),
  UNIQUE KEY `AMAZON_CUSTOMER_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `AMAZON_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='amazon_customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amazon_customer`
--

LOCK TABLES `amazon_customer` WRITE;
/*!40000 ALTER TABLE `amazon_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `amazon_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amazon_pending_authorization`
--

DROP TABLE IF EXISTS `amazon_pending_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amazon_pending_authorization` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `order_id` int unsigned NOT NULL COMMENT 'Order_id',
  `payment_id` int unsigned NOT NULL COMMENT 'Payment_id',
  `authorization_id` varchar(255) DEFAULT NULL COMMENT 'Authorization_id',
  `created_at` datetime NOT NULL COMMENT 'Created_at',
  `updated_at` datetime DEFAULT NULL COMMENT 'Updated_at',
  `processed` smallint unsigned DEFAULT '0' COMMENT 'Initial authorization processed',
  `capture` smallint unsigned DEFAULT '0' COMMENT 'Initial authorization has capture',
  `capture_id` varchar(255) DEFAULT NULL COMMENT 'Initial authorization capture id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_E6CCA08713FB32BB136A56837009C371` (`order_id`,`payment_id`,`authorization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='amazon_pending_authorization';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amazon_pending_authorization`
--

LOCK TABLES `amazon_pending_authorization` WRITE;
/*!40000 ALTER TABLE `amazon_pending_authorization` DISABLE KEYS */;
/*!40000 ALTER TABLE `amazon_pending_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amazon_pending_capture`
--

DROP TABLE IF EXISTS `amazon_pending_capture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amazon_pending_capture` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `capture_id` varchar(255) NOT NULL COMMENT 'Capture_id',
  `created_at` datetime NOT NULL COMMENT 'Created_at',
  `order_id` int unsigned NOT NULL COMMENT 'order id',
  `payment_id` int unsigned NOT NULL COMMENT 'payment id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_PENDING_CAPTURE_ORDER_ID_PAYMENT_ID_CAPTURE_ID` (`order_id`,`payment_id`,`capture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='amazon_pending_capture';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amazon_pending_capture`
--

LOCK TABLES `amazon_pending_capture` WRITE;
/*!40000 ALTER TABLE `amazon_pending_capture` DISABLE KEYS */;
/*!40000 ALTER TABLE `amazon_pending_capture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amazon_pending_refund`
--

DROP TABLE IF EXISTS `amazon_pending_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amazon_pending_refund` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `refund_id` varchar(255) NOT NULL COMMENT 'Refund_id',
  `created_at` datetime NOT NULL COMMENT 'Created_at',
  `order_id` int unsigned NOT NULL COMMENT 'Order_id',
  `payment_id` int unsigned NOT NULL COMMENT 'Payment_id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_PENDING_REFUND_ORDER_ID_PAYMENT_ID_REFUND_ID` (`order_id`,`payment_id`,`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='amazon_pending_refund';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amazon_pending_refund`
--

LOCK TABLES `amazon_pending_refund` WRITE;
/*!40000 ALTER TABLE `amazon_pending_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `amazon_pending_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amazon_quote`
--

DROP TABLE IF EXISTS `amazon_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amazon_quote` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `quote_id` int unsigned NOT NULL COMMENT 'Quote ID',
  `amazon_order_reference_id` varchar(255) NOT NULL COMMENT 'Amazon Order Reference ID',
  `sandbox_simulation_reference` varchar(255) DEFAULT NULL COMMENT 'Sandbox simulation reference',
  `confirmed` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Quote confirmed with Amazon',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_QUOTE_QUOTE_ID` (`quote_id`),
  CONSTRAINT `AMAZON_QUOTE_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='amazon_quote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amazon_quote`
--

LOCK TABLES `amazon_quote` WRITE;
/*!40000 ALTER TABLE `amazon_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `amazon_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amazon_sales_order`
--

DROP TABLE IF EXISTS `amazon_sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amazon_sales_order` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `amazon_order_reference_id` varchar(255) NOT NULL COMMENT 'Amazon Order Reference ID',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_SALES_ORDER_ORDER_ID` (`order_id`),
  CONSTRAINT `AMAZON_SALES_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='amazon_sales_order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amazon_sales_order`
--

LOCK TABLES `amazon_sales_order` WRITE;
/*!40000 ALTER TABLE `amazon_sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `amazon_sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorization_role`
--

DROP TABLE IF EXISTS `authorization_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorization_role` (
  `role_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Role ID',
  `tree_level` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Role Tree Level',
  `sort_order` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `user_type` varchar(16) DEFAULT NULL COMMENT 'User Type',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name',
  PRIMARY KEY (`role_id`),
  KEY `AUTHORIZATION_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `AUTHORIZATION_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='Admin Role Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorization_role`
--

LOCK TABLES `authorization_role` WRITE;
/*!40000 ALTER TABLE `authorization_role` DISABLE KEYS */;
INSERT INTO `authorization_role` VALUES (1,0,1,1,'G',0,'2','Administrators'),(2,1,2,0,'U',1,'2','admin');
/*!40000 ALTER TABLE `authorization_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorization_rule`
--

DROP TABLE IF EXISTS `authorization_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorization_rule` (
  `rule_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule ID',
  `role_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `AUTHORIZATION_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `AUTHORIZATION_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`),
  CONSTRAINT `AUTHORIZATION_RULE_ROLE_ID_AUTHORIZATION_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `authorization_role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Admin Rule Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorization_rule`
--

LOCK TABLES `authorization_rule` WRITE;
/*!40000 ALTER TABLE `authorization_rule` DISABLE KEYS */;
INSERT INTO `authorization_rule` VALUES (1,1,'Magento_Backend::all',NULL,'allow');
/*!40000 ALTER TABLE `authorization_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `braintree_credit_prices`
--

DROP TABLE IF EXISTS `braintree_credit_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `braintree_credit_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Row ID',
  `product_id` int unsigned NOT NULL COMMENT 'Product Id',
  `term` int NOT NULL COMMENT 'Credit Term',
  `monthly_payment` decimal(12,2) NOT NULL COMMENT 'Monthly Payment',
  `instalment_rate` decimal(12,2) NOT NULL COMMENT 'Instalment Rate',
  `cost_of_purchase` decimal(12,2) NOT NULL COMMENT 'Cost of purchase',
  `total_inc_interest` decimal(12,2) NOT NULL COMMENT 'Total Inc Interest',
  PRIMARY KEY (`id`),
  UNIQUE KEY `BRAINTREE_CREDIT_PRICES_PRODUCT_ID_TERM` (`product_id`,`term`),
  KEY `BRAINTREE_CREDIT_PRICES_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Braintree credit rates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `braintree_credit_prices`
--

LOCK TABLES `braintree_credit_prices` WRITE;
/*!40000 ALTER TABLE `braintree_credit_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `braintree_credit_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `braintree_transaction_details`
--

DROP TABLE IF EXISTS `braintree_transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `braintree_transaction_details` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `order_id` int unsigned NOT NULL COMMENT 'Order Id',
  `transaction_source` varchar(12) DEFAULT NULL COMMENT 'Transaction Source',
  PRIMARY KEY (`entity_id`),
  KEY `BRAINTREE_TRANSACTION_DETAILS_ORDER_ID` (`order_id`),
  CONSTRAINT `BRAINTREE_TRANSACTION_DETAILS_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Braintree transaction details table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `braintree_transaction_details`
--

LOCK TABLES `braintree_transaction_details` WRITE;
/*!40000 ALTER TABLE `braintree_transaction_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `braintree_transaction_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob COMMENT 'Cache Data',
  `create_time` int DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int DEFAULT NULL COMMENT 'Cache Expiration Time',
  PRIMARY KEY (`id`),
  KEY `CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_tag`
--

DROP TABLE IF EXISTS `cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id',
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tag Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_tag`
--

LOCK TABLES `cache_tag` WRITE;
/*!40000 ALTER TABLE `cache_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_log`
--

DROP TABLE IF EXISTS `captcha_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  `count` int unsigned NOT NULL DEFAULT '0' COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Count Login Attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_log`
--

LOCK TABLES `captcha_log` WRITE;
/*!40000 ALTER TABLE `captcha_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `captcha_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity`
--

DROP TABLE IF EXISTS `catalog_category_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_entity` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int NOT NULL COMMENT 'Position',
  `level` int NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int NOT NULL COMMENT 'Child Count',
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  KEY `CATALOG_CATEGORY_ENTITY_PATH` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity`
--

LOCK TABLES `catalog_category_entity` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity` DISABLE KEYS */;
INSERT INTO `catalog_category_entity` VALUES (1,3,0,'2021-10-30 14:47:44','2021-10-31 08:28:39','1',0,0,6),(2,3,1,'2021-10-30 14:47:44','2021-10-31 08:28:39','1/2',1,1,5),(3,3,2,'2021-10-31 08:26:51','2021-10-31 08:26:51','1/2/3',1,2,0),(4,3,2,'2021-10-31 08:27:25','2021-10-31 08:27:25','1/2/4',2,2,0),(5,3,2,'2021-10-31 08:27:54','2021-10-31 08:27:54','1/2/5',3,2,0),(6,3,2,'2021-10-31 08:28:18','2021-10-31 08:28:18','1/2/6',4,2,0),(7,3,2,'2021-10-31 08:28:39','2021-10-31 08:28:39','1/2/7',5,2,0);
/*!40000 ALTER TABLE `catalog_category_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_category_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_entity_datetime` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DTIME_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_datetime`
--

LOCK TABLES `catalog_category_entity_datetime` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_category_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_entity_decimal` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(20,6) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DEC_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_decimal`
--

LOCK TABLES `catalog_category_entity_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_int`
--

DROP TABLE IF EXISTS `catalog_category_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_entity_int` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_INT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_int`
--

LOCK TABLES `catalog_category_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_int` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_int` VALUES (1,69,0,1,1),(2,69,0,2,1),(3,46,0,2,1),(4,46,0,3,1),(5,54,0,3,1),(6,69,0,3,1),(7,70,0,3,0),(8,71,0,3,0),(9,46,0,4,1),(10,54,0,4,1),(11,69,0,4,1),(12,70,0,4,0),(13,71,0,4,0),(14,46,0,5,1),(15,54,0,5,1),(16,69,0,5,1),(17,70,0,5,0),(18,71,0,5,0),(19,46,0,6,1),(20,54,0,6,1),(21,69,0,6,1),(22,70,0,6,0),(23,71,0,6,0),(24,46,0,7,1),(25,54,0,7,1),(26,69,0,7,1),(27,70,0,7,0),(28,71,0,7,0);
/*!40000 ALTER TABLE `catalog_category_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_text`
--

DROP TABLE IF EXISTS `catalog_category_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_entity_text` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` mediumtext COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_TEXT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_text`
--

LOCK TABLES `catalog_category_entity_text` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_category_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_entity_varchar` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_VCHR_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_varchar`
--

LOCK TABLES `catalog_category_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_varchar` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_varchar` VALUES (1,45,0,1,'Root Catalog'),(2,52,0,2,'PRODUCTS'),(3,45,0,2,'Default Category'),(4,45,0,3,'Xe mô hình'),(5,52,0,3,'PRODUCTS'),(6,63,0,3,'category-full-width'),(7,121,0,3,'xe-mo-hinh'),(8,122,0,3,'xe-mo-hinh'),(9,45,0,4,'LEGO'),(10,52,0,4,'PRODUCTS'),(11,63,0,4,'category-full-width'),(12,121,0,4,'lego'),(13,122,0,4,'lego'),(14,45,0,5,'Búp bê thời trang'),(15,52,0,5,'PRODUCTS'),(16,63,0,5,'category-full-width'),(17,121,0,5,'bup-be-th-i-trang'),(18,122,0,5,'bup-be-th-i-trang'),(19,45,0,6,'Thú bông'),(20,52,0,6,'PRODUCTS'),(21,63,0,6,'category-full-width'),(22,121,0,6,'thu-bong'),(23,122,0,6,'thu-bong'),(24,45,0,7,'Đồ chơi giáo dục'),(25,52,0,7,'PRODUCTS'),(26,63,0,7,'category-full-width'),(27,121,0,7,'d-choi-giao-d-c'),(28,122,0,7,'d-choi-giao-d-c');
/*!40000 ALTER TABLE `catalog_category_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product`
--

DROP TABLE IF EXISTS `catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product` (
  `entity_id` int NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`entity_id`,`category_id`,`product_id`),
  UNIQUE KEY `CATALOG_CATEGORY_PRODUCT_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_CTGR_PRD_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product To Category Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product`
--

LOCK TABLES `catalog_category_product` WRITE;
/*!40000 ALTER TABLE `catalog_category_product` DISABLE KEYS */;
INSERT INTO `catalog_category_product` VALUES (1,3,1,0),(2,3,2,0),(3,3,3,0),(4,3,9,0),(5,3,8,0),(6,3,7,0),(7,3,6,0),(8,3,5,0),(9,3,4,0),(10,3,10,0),(11,4,11,0),(12,4,12,0),(13,4,13,0),(14,4,14,0),(15,4,15,0),(16,4,16,0),(17,4,17,0),(18,4,18,0),(19,4,19,0),(20,4,20,0),(21,5,21,0),(22,5,22,0),(23,5,23,0),(24,5,24,0),(25,5,25,0),(26,5,26,0),(27,5,27,0),(28,5,28,0),(29,5,29,0),(30,5,30,0),(31,6,31,0),(32,6,32,0),(33,6,33,0),(34,6,34,0),(35,6,35,0),(36,6,36,0),(37,6,37,0),(38,6,38,0),(39,6,39,0),(40,6,40,0),(41,7,41,0),(42,7,42,0),(43,7,43,0),(44,7,44,0),(45,7,45,0),(46,7,46,0),(47,7,47,0),(48,7,48,0),(49,7,49,0),(50,7,50,0);
/*!40000 ALTER TABLE `catalog_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index`
--

DROP TABLE IF EXISTS `catalog_category_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product_index` (
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Product Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index`
--

LOCK TABLES `catalog_category_product_index` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_replica`
--

DROP TABLE IF EXISTS `catalog_category_product_index_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product_index_replica` (
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Product Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_replica`
--

LOCK TABLES `catalog_category_product_index_replica` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_store1`
--

DROP TABLE IF EXISTS `catalog_category_product_index_store1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product_index_store1` (
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Category Id',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `position` int DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `visibility` smallint unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_STORE1_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_216E521C8AD125E066D2B0BAB4A08412` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Product Index Store1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_store1`
--

LOCK TABLES `catalog_category_product_index_store1` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_store1` DISABLE KEYS */;
INSERT INTO `catalog_category_product_index_store1` VALUES (2,1,0,1,1,4),(2,2,0,1,1,4),(2,3,0,1,1,4),(2,4,0,1,1,4),(2,5,0,1,1,4),(2,6,0,1,1,4),(2,7,0,1,1,4),(2,8,0,1,1,4),(2,9,0,1,1,4),(2,10,0,1,1,4),(2,11,0,1,1,4),(2,12,0,1,1,4),(2,13,0,1,1,4),(2,14,0,1,1,4),(2,15,0,1,1,4),(2,16,0,1,1,4),(2,17,0,1,1,4),(2,18,0,1,1,4),(2,19,0,1,1,4),(2,20,0,1,1,4),(2,21,0,1,1,4),(2,22,0,1,1,4),(2,23,0,1,1,4),(2,24,0,1,1,4),(2,25,0,1,1,4),(2,26,0,1,1,4),(2,27,0,1,1,4),(2,28,0,1,1,4),(2,29,0,1,1,4),(2,30,0,1,1,4),(2,31,0,1,1,4),(2,32,0,1,1,4),(2,33,0,1,1,4),(2,34,0,1,1,4),(2,35,0,1,1,4),(2,36,0,1,1,4),(2,37,0,1,1,4),(2,38,0,1,1,4),(2,39,0,1,1,4),(2,40,0,1,1,4),(2,41,0,1,1,4),(2,42,0,1,1,4),(2,43,0,1,1,4),(2,44,0,1,1,4),(2,45,0,1,1,4),(2,46,0,1,1,4),(2,47,0,1,1,4),(2,48,0,1,1,4),(2,49,0,1,1,4),(2,50,0,1,1,4),(3,1,0,1,1,4),(3,2,0,1,1,4),(3,3,0,1,1,4),(3,4,0,1,1,4),(3,5,0,1,1,4),(3,6,0,1,1,4),(3,7,0,1,1,4),(3,8,0,1,1,4),(3,9,0,1,1,4),(3,10,0,1,1,4),(4,11,0,1,1,4),(4,12,0,1,1,4),(4,13,0,1,1,4),(4,14,0,1,1,4),(4,15,0,1,1,4),(4,16,0,1,1,4),(4,17,0,1,1,4),(4,18,0,1,1,4),(4,19,0,1,1,4),(4,20,0,1,1,4),(5,21,0,1,1,4),(5,22,0,1,1,4),(5,23,0,1,1,4),(5,24,0,1,1,4),(5,25,0,1,1,4),(5,26,0,1,1,4),(5,27,0,1,1,4),(5,28,0,1,1,4),(5,29,0,1,1,4),(5,30,0,1,1,4),(6,31,0,1,1,4),(6,32,0,1,1,4),(6,33,0,1,1,4),(6,34,0,1,1,4),(6,35,0,1,1,4),(6,36,0,1,1,4),(6,37,0,1,1,4),(6,38,0,1,1,4),(6,39,0,1,1,4),(6,40,0,1,1,4),(7,41,0,1,1,4),(7,42,0,1,1,4),(7,43,0,1,1,4),(7,44,0,1,1,4),(7,45,0,1,1,4),(7,46,0,1,1,4),(7,47,0,1,1,4),(7,48,0,1,1,4),(7,49,0,1,1,4),(7,50,0,1,1,4);
/*!40000 ALTER TABLE `catalog_category_product_index_store1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_store1_replica`
--

DROP TABLE IF EXISTS `catalog_category_product_index_store1_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product_index_store1_replica` (
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Category Id',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `position` int DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `visibility` smallint unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `IDX_4B965DC45C352D6E4C9DC0FF50B1FCF5` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_47AB760CD6A893ACEA69A9C2E0112C60` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Product Index Store1 Replica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_store1_replica`
--

LOCK TABLES `catalog_category_product_index_store1_replica` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_store1_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_store1_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_product_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category_product_index_tmp` (
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Product Indexer temporary table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_tmp`
--

LOCK TABLES `catalog_category_product_index_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_compare_item`
--

DROP TABLE IF EXISTS `catalog_compare_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_compare_item` (
  `catalog_compare_item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID',
  `visitor_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `list_id` int unsigned DEFAULT NULL COMMENT 'List ID',
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `CATALOG_COMPARE_ITEM_LIST_ID_CATALOG_COMPARE_LIST_LIST_ID` (`list_id`),
  KEY `CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_LIST_ID_CATALOG_COMPARE_LIST_LIST_ID` FOREIGN KEY (`list_id`) REFERENCES `catalog_compare_list` (`list_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Compare Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_compare_item`
--

LOCK TABLES `catalog_compare_item` WRITE;
/*!40000 ALTER TABLE `catalog_compare_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_compare_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_compare_list`
--

DROP TABLE IF EXISTS `catalog_compare_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_compare_list` (
  `list_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare List ID',
  `list_id_mask` varchar(32) DEFAULT NULL COMMENT 'Masked ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  PRIMARY KEY (`list_id`),
  UNIQUE KEY `CATALOG_COMPARE_LIST_CUSTOMER_ID` (`customer_id`),
  KEY `CATALOG_COMPARE_LIST_LIST_ID_MASK` (`list_id_mask`),
  CONSTRAINT `CATALOG_COMPARE_LIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Compare List with hash Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_compare_list`
--

LOCK TABLES `catalog_compare_list` WRITE;
/*!40000 ALTER TABLE `catalog_compare_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_compare_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_eav_attribute`
--

DROP TABLE IF EXISTS `catalog_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_eav_attribute` (
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Global',
  `is_visible` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `is_searchable` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable',
  `is_filterable` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable',
  `is_comparable` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Comparable',
  `is_visible_on_front` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Sorting',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible In Advanced Search',
  `position` int NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_wysiwyg_enabled` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Promo Rules',
  `is_required_in_admin_store` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Required In Admin Store',
  `is_used_in_grid` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `search_weight` float NOT NULL DEFAULT '1' COMMENT 'Search Weight',
  `is_pagebuilder_enabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is PageBuilder Enabled',
  `additional_data` text COMMENT 'Additional swatch attributes data',
  PRIMARY KEY (`attribute_id`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`),
  CONSTRAINT `CATALOG_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog EAV Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_eav_attribute`
--

LOCK TABLES `catalog_eav_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_eav_attribute` DISABLE KEYS */;
INSERT INTO `catalog_eav_attribute` VALUES (45,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(46,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(47,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,1,0,0,0,0,0,1,0,NULL),(48,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(49,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(50,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(51,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(52,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(53,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(54,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(55,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(56,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(57,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(58,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(59,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(60,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(61,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(62,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(63,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(64,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(65,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(66,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(67,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\Available',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(68,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\DefaultSortby',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(69,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(70,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(71,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(72,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Pricestep',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(73,NULL,0,1,1,0,0,0,0,0,0,1,1,NULL,1,0,0,0,0,0,0,0,5,0,NULL),(74,NULL,1,1,1,0,1,0,0,0,0,0,0,NULL,1,0,0,0,0,0,0,0,6,0,NULL),(75,NULL,0,1,1,0,1,0,1,0,0,0,0,NULL,1,0,1,0,0,0,0,0,1,1,NULL),(76,NULL,0,1,1,0,1,0,1,0,0,1,0,NULL,1,0,1,0,0,1,0,0,1,0,NULL),(77,NULL,1,1,1,1,0,0,0,0,0,1,1,'simple,virtual,downloadable,bundle,configurable',1,0,0,0,0,0,0,0,1,0,NULL),(78,NULL,1,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,1,0,1,1,0,NULL),(79,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,1,0,0,1,0,NULL),(80,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,1,0,0,1,0,NULL),(81,NULL,1,1,0,0,0,0,0,0,0,0,0,'simple,virtual,downloadable',0,0,0,0,0,1,0,1,1,0,NULL),(82,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Weight',1,1,0,0,0,0,0,0,0,0,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,1,0,1,1,0,NULL),(83,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple,configurable',1,0,0,0,0,1,0,1,1,0,NULL),(84,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,0,NULL),(85,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,0,NULL),(86,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,0,NULL),(87,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(88,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(89,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(90,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(91,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(92,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,virtual,downloadable,bundle',0,0,0,0,0,0,0,0,1,0,NULL),(93,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple,virtual,configurable',1,0,0,0,0,1,0,1,1,0,NULL),(94,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,0,1,0,NULL),(95,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,0,1,0,NULL),(96,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(97,'Magento\\Framework\\Data\\Form\\Element\\Hidden',2,1,1,0,0,0,0,0,0,1,0,NULL,0,0,0,0,1,0,0,0,1,0,NULL),(98,NULL,0,0,0,0,0,0,0,0,0,0,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,0,0,0,1,0,NULL),(99,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,1,0,0,0,1,0,NULL),(100,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,0,NULL),(101,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,0,NULL),(102,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,0,NULL),(103,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(104,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,0,NULL),(105,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Category',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(106,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(107,NULL,1,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(108,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(109,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(110,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(111,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(112,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(113,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(114,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,bundle,grouped,configurable',0,0,0,0,0,1,0,1,1,0,NULL),(115,'Magento\\CatalogInventory\\Block\\Adminhtml\\Form\\Field\\Stock',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(116,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,0,NULL),(117,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(118,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(119,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type',1,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,1,0,1,1,0,NULL),(120,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type\\Price',2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,0,0,0,1,0,NULL),(121,NULL,0,1,1,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(122,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(123,NULL,0,1,1,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,1,1,0,NULL),(124,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(125,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,0,0,0,0,0,0,0,1,0,NULL),(126,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0,0,0,0,0,1,0,NULL),(127,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0,0,0,0,0,1,0,NULL),(128,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,0,0,0,0,0,0,0,1,0,NULL),(129,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,0,NULL),(130,NULL,1,1,0,0,0,0,0,0,0,0,0,'bundle',0,0,0,0,0,0,0,0,1,0,NULL),(131,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,0,NULL),(132,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,0,NULL),(133,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,0,NULL),(134,'Magento\\GiftMessage\\Block\\Adminhtml\\Product\\Helper\\Form\\Config',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,0,NULL),(135,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,0,NULL),(136,NULL,2,1,1,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,1,0,1,1,0,NULL);
/*!40000 ALTER TABLE `catalog_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_option`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_bundle_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `required` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Required',
  `position` int unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`),
  CONSTRAINT `CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_option`
--

LOCK TABLES `catalog_product_bundle_option` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_option_value`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_bundle_option_value` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `option_id` int unsigned NOT NULL COMMENT 'Option ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `parent_product_id` int unsigned NOT NULL COMMENT 'Parent Product ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_BNDL_OPT_VAL_OPT_ID_PARENT_PRD_ID_STORE_ID` (`option_id`,`parent_product_id`,`store_id`),
  CONSTRAINT `CAT_PRD_BNDL_OPT_VAL_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Option Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_option_value`
--

LOCK TABLES `catalog_product_bundle_option_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_price_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_price_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_bundle_price_index` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  `min_price` decimal(20,6) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) NOT NULL COMMENT 'Max Price',
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Price Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_price_index`
--

LOCK TABLES `catalog_product_bundle_price_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_price_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_price_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_selection`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_bundle_selection` (
  `selection_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Selection ID',
  `option_id` int unsigned NOT NULL COMMENT 'Option ID',
  `parent_product_id` int unsigned NOT NULL COMMENT 'Parent Product ID',
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `position` int unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_default` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `selection_price_type` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint NOT NULL DEFAULT '0' COMMENT 'Selection Can Change Qty',
  PRIMARY KEY (`selection_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Selection';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_selection`
--

LOCK TABLES `catalog_product_bundle_selection` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_selection_price`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_bundle_selection_price` (
  `selection_id` int unsigned NOT NULL COMMENT 'Selection ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `selection_price_type` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Selection Price Value',
  `parent_product_id` int unsigned NOT NULL COMMENT 'Parent Product ID',
  PRIMARY KEY (`selection_id`,`parent_product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DCF37523AA05D770A70AA4ED7C2616E4` FOREIGN KEY (`selection_id`) REFERENCES `catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Selection Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_selection_price`
--

LOCK TABLES `catalog_product_bundle_selection_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_selection_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_selection_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_stock_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_stock_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_bundle_stock_index` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint unsigned NOT NULL COMMENT 'Stock ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `stock_status` smallint DEFAULT '0' COMMENT 'Stock Status',
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Stock Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_stock_index`
--

LOCK TABLES `catalog_product_bundle_stock_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_stock_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_stock_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) NOT NULL COMMENT 'SKU',
  `has_options` smallint NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `CATALOG_PRODUCT_ENTITY_SKU` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity`
--

LOCK TABLES `catalog_product_entity` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity` DISABLE KEYS */;
INSERT INTO `catalog_product_entity` VALUES (1,4,'simple','Trạm cứu hỏa Bworld & xe Land Rover Defender',0,0,'2021-10-31 13:21:47','2021-10-31 13:21:47'),(2,4,'simple','Mô hình xe mô tô 1:12 dòng Ducati Diavel Carbon',0,0,'2021-10-31 13:24:31','2021-10-31 13:24:31'),(3,4,'simple','Mô hình xe hơi trớn Porsche 911 (992) Carrera 4S',0,0,'2021-10-31 13:27:33','2021-10-31 13:27:33'),(4,4,'simple','Xe biến hình sói tuyết dũng mãnh',0,0,'2021-10-31 13:29:07','2021-10-31 13:36:47'),(5,4,'simple','Combo xe buýt du lịch - xe taxi',0,0,'2021-10-31 13:30:03','2021-10-31 13:36:36'),(6,4,'simple','Xe tải nhiều ngăn - Cảnh sát',0,0,'2021-10-31 13:31:40','2021-10-31 13:36:24'),(7,4,'simple','Xe cứu hộ cơ bản Paw Patrol - Rubble',0,0,'2021-10-31 13:32:28','2021-10-31 13:36:17'),(8,4,'simple','Xe cứu hộ cơ bản Paw Patrol - Skye',0,0,'2021-10-31 13:33:16','2021-10-31 13:35:37'),(9,4,'simple','Xe cứu hộ quyền năng Paw Patrol',0,0,'2021-10-31 13:34:13','2021-10-31 13:34:54'),(10,4,'simple','Đồ chơi dạng mô hình theo tỷ lệ thu nhỏ 1:16 xe xúc đào tổng',0,0,'2021-10-31 13:37:40','2021-10-31 13:37:40'),(11,4,'simple','Tàu Tuần Tra Cảnh Sát',0,0,'2021-10-31 15:42:41','2021-10-31 15:42:41'),(12,4,'simple','Câu chuyện phiêu lưu của Ariel, Belle, Cinderella và Tiana',0,0,'2021-10-31 15:44:10','2021-10-31 15:44:10'),(13,4,'simple','Lâu đài băng giá',0,0,'2021-10-31 15:45:15','2021-10-31 15:45:15'),(14,4,'simple','Lớp Học Môn Biến Hình',0,0,'2021-10-31 15:46:14','2021-10-31 15:46:14'),(15,4,'simple','Lớp Học Môn Độc Dược',0,0,'2021-10-31 15:47:32','2021-10-31 15:47:32'),(16,4,'simple','Chuồng Ngựa',0,0,'2021-10-31 15:51:33','2021-10-31 15:51:33'),(17,4,'simple','Cổng Đổ Nát',0,0,'2021-10-31 15:52:32','2021-10-31 15:52:32'),(18,4,'simple','Tòa Tháp Chọc Trời',0,0,'2021-10-31 15:53:34','2021-10-31 15:53:34'),(19,4,'simple','Nhà Cây Hiện Đại',0,0,'2021-10-31 15:55:15','2021-10-31 15:55:15'),(20,4,'simple','Khu Rừng Rậm Ma Quái',0,0,'2021-10-31 15:56:08','2021-10-31 15:56:08'),(21,4,'simple','Búp bê LOL phiên bản confetti - bữa tiệc sinh nhật',0,0,'2021-10-31 16:02:44','2021-10-31 16:02:44'),(22,4,'simple','Cô nàng búp bê thời trang OMG - Sweets ngọt ngào',0,0,'2021-10-31 16:03:59','2021-10-31 16:03:59'),(23,4,'simple','Cô nàng búp bê thời trang OMG - Spicy cá tính',0,0,'2021-10-31 16:04:46','2021-10-31 16:04:46'),(24,4,'simple','Cô nàng búp bê thời trang OMG - Sunshine tỏa sáng',0,0,'2021-10-31 16:05:30','2021-10-31 16:05:30'),(25,4,'simple','Cô nàng búp bê thời trang OMG - Moon light mộng mơ',0,0,'2021-10-31 16:06:13','2021-10-31 16:06:13'),(26,4,'simple','Công chúa Ariel đổi màu kỳ diệu',0,0,'2021-10-31 16:06:57','2021-10-31 16:06:57'),(27,4,'simple','Công chúa Royal Shimmer Rapunzel',0,0,'2021-10-31 16:07:30','2021-10-31 16:07:30'),(28,4,'simple','Công chúa Rapunzel với mái tóc dài 45cm',0,0,'2021-10-31 16:08:21','2021-10-31 16:08:21'),(29,4,'simple','Công chúa Ariel và chiếc váy diệu kỳ',0,0,'2021-10-31 16:09:19','2021-10-31 16:09:19'),(30,4,'simple','Búp bê thời trang - Rock Tee / Skirt',0,0,'2021-10-31 16:10:06','2021-10-31 16:10:06'),(31,4,'simple','Trứng Rồng Huyền Bí',0,0,'2021-10-31 17:00:23','2021-10-31 17:00:23'),(32,4,'simple','Pony bông 30 cm- Rainbow Dash',0,0,'2021-10-31 17:02:25','2021-10-31 17:02:25'),(33,4,'simple','Pony bông 30 cm - Spike',0,0,'2021-10-31 17:03:03','2021-10-31 17:03:03'),(34,4,'simple','Pony bông 30 cm- Rainbow Dash Sea Pony',0,0,'2021-10-31 17:03:45','2021-10-31 17:03:45'),(35,4,'simple','Pony Bông - Chiến Binh Cầu Vồng',0,0,'2021-10-31 17:04:34','2021-10-31 17:04:34'),(36,4,'simple','Pinkie Pie với mái tóc suôn mượt',0,0,'2021-10-31 17:05:11','2021-10-31 17:05:11'),(37,4,'simple','Hộp quà Present Pets chó đốm nhanh nhẹn',0,0,'2021-10-31 17:05:59','2021-10-31 17:05:59'),(38,4,'simple','Hộp quà Present Pets - Yorkies lém lỉnh',0,0,'2021-10-31 17:06:38','2021-10-31 17:06:38'),(39,4,'simple','Hộp quà Present Pets - Poodles ngọt ngào',0,0,'2021-10-31 17:07:13','2021-10-31 17:07:13'),(40,4,'simple','Hộp quà Present Pets cún cưng Beagle đáng yêu',0,0,'2021-10-31 17:08:02','2021-10-31 17:08:02'),(41,4,'simple','Combo bột nặn mini 4 màu + bộ PD đầu đời',0,0,'2021-10-31 17:09:18','2021-10-31 17:09:18'),(42,4,'simple','Combo Bộ khuôn thú cưng đáng yêu và bột nặn 6 màu lấp lánh',0,0,'2021-10-31 17:09:57','2021-10-31 17:09:57'),(43,4,'simple','Khám phá núi lửa nham thạch cùng khủng long T-Rex',0,0,'2021-10-31 17:10:35','2021-10-31 17:10:35'),(44,4,'simple','Khủng long T-Rex và quả trứng bí ẩn',0,0,'2021-10-31 17:13:39','2021-10-31 17:13:39'),(45,4,'simple','Bữa tiệc BBQ',0,0,'2021-10-31 17:15:10','2021-10-31 17:15:10'),(46,4,'simple','Chảo bếp thần kì',0,0,'2021-10-31 17:15:54','2021-10-31 17:15:54'),(47,4,'simple','Que kem 7 màu',0,0,'2021-10-31 17:16:35','2021-10-31 17:16:35'),(48,4,'simple','Đồ chơi phóng banh vui nhộn',0,0,'2021-10-31 17:17:18','2021-10-31 17:17:18'),(49,4,'simple','Xe cứu thương đa năng',0,0,'2021-10-31 17:18:14','2021-10-31 17:18:14'),(50,4,'simple','Bữa tiệc nhạc nước câu vịt - Màu xanh',0,0,'2021-10-31 17:18:47','2021-10-31 17:18:47');
/*!40000 ALTER TABLE `catalog_product_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_product_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_datetime` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_datetime`
--

LOCK TABLES `catalog_product_entity_datetime` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_product_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_decimal` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(20,6) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_decimal`
--

LOCK TABLES `catalog_product_entity_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_decimal` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_decimal` VALUES (1,77,0,1,1999000.000000),(2,77,0,2,195000.000000),(3,77,0,3,139000.000000),(4,77,0,4,79000.000000),(5,77,0,5,379000.000000),(6,77,0,6,399000.000000),(7,77,0,7,329000.000000),(8,77,0,8,329000.000000),(9,77,0,9,499000.000000),(10,77,0,10,1299000.000000),(11,77,0,11,1599000.000000),(12,77,0,12,669000.000000),(13,77,0,13,6999000.000000),(14,77,0,14,899000.000000),(15,77,0,15,899000.000000),(16,77,0,16,799000.000000),(17,77,0,17,1299000.000000),(18,77,0,18,2399000.000000),(19,77,0,19,4799000.000000),(20,77,0,20,1699000.000000),(21,77,0,21,499000.000000),(22,77,0,22,1119000.000000),(23,77,0,23,1119000.000000),(24,77,0,24,783000.000000),(25,77,0,25,783000.000000),(26,77,0,26,899000.000000),(27,77,0,27,489000.000000),(28,77,0,28,503000.000000),(29,77,0,29,399000.000000),(30,77,0,30,295000.000000),(31,77,0,31,189000.000000),(32,77,0,32,281000.000000),(33,77,0,33,281000.000000),(34,77,0,34,281000.000000),(35,77,0,35,209000.000000),(36,77,0,36,179000.000000),(37,77,0,37,1699000.000000),(38,77,0,38,1699000.000000),(39,77,0,39,1699000.000000),(40,77,0,40,1699000.000000),(41,77,0,41,89000.000000),(42,77,0,42,199000.000000),(43,77,0,43,584000.000000),(44,77,0,44,799000.000000),(45,77,0,45,699000.000000),(46,77,0,46,469000.000000),(47,77,0,47,379000.000000),(48,77,0,48,659000.000000),(49,77,0,49,300000.000000),(50,77,0,50,249000.000000);
/*!40000 ALTER TABLE `catalog_product_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_gallery` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `position` int NOT NULL DEFAULT '0' COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_gallery`
--

LOCK TABLES `catalog_product_entity_gallery` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_int`
--

DROP TABLE IF EXISTS `catalog_product_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_int` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID_STORE_ID_VALUE` (`attribute_id`,`store_id`,`value`),
  CONSTRAINT `CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_int`
--

LOCK TABLES `catalog_product_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_int` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_int` VALUES (1,97,0,1,1),(2,136,0,1,2),(3,99,0,1,4),(4,97,0,2,1),(5,136,0,2,2),(6,99,0,2,4),(7,97,0,3,1),(8,136,0,3,2),(9,99,0,3,4),(10,97,0,4,1),(11,136,0,4,2),(12,99,0,4,4),(13,97,0,5,1),(14,136,0,5,2),(15,99,0,5,4),(16,97,0,6,1),(17,136,0,6,2),(18,99,0,6,4),(19,97,0,7,1),(20,136,0,7,2),(21,99,0,7,4),(22,97,0,8,1),(23,136,0,8,2),(24,99,0,8,4),(25,97,0,9,1),(26,136,0,9,2),(27,99,0,9,4),(28,97,0,10,1),(29,136,0,10,2),(30,99,0,10,4),(31,97,0,11,1),(32,136,0,11,2),(33,99,0,11,4),(34,97,0,12,1),(35,136,0,12,2),(36,99,0,12,4),(37,97,0,13,1),(38,136,0,13,2),(39,99,0,13,4),(40,97,0,14,1),(41,136,0,14,2),(42,99,0,14,4),(43,97,0,15,1),(44,136,0,15,2),(45,99,0,15,4),(46,97,0,16,1),(47,136,0,16,2),(48,99,0,16,4),(49,97,0,17,1),(50,136,0,17,2),(51,99,0,17,4),(52,97,0,18,1),(53,136,0,18,2),(54,99,0,18,4),(55,97,0,19,1),(56,136,0,19,2),(57,99,0,19,4),(58,97,0,20,1),(59,136,0,20,2),(60,99,0,20,4),(61,97,0,21,1),(62,136,0,21,2),(63,99,0,21,4),(64,97,0,22,1),(65,136,0,22,2),(66,99,0,22,4),(67,97,0,23,1),(68,136,0,23,2),(69,99,0,23,4),(70,97,0,24,1),(71,136,0,24,2),(72,99,0,24,4),(73,97,0,25,1),(74,136,0,25,2),(75,99,0,25,4),(76,97,0,26,1),(77,136,0,26,2),(78,99,0,26,4),(79,97,0,27,1),(80,136,0,27,2),(81,99,0,27,4),(82,97,0,28,1),(83,136,0,28,2),(84,99,0,28,4),(85,97,0,29,1),(86,136,0,29,2),(87,99,0,29,4),(88,97,0,30,1),(89,136,0,30,2),(90,99,0,30,4),(91,97,0,31,1),(92,136,0,31,2),(93,99,0,31,4),(94,97,0,32,1),(95,136,0,32,2),(96,99,0,32,4),(97,97,0,33,1),(98,136,0,33,2),(99,99,0,33,4),(100,97,0,34,1),(101,136,0,34,2),(102,99,0,34,4),(103,97,0,35,1),(104,136,0,35,2),(105,99,0,35,4),(106,97,0,36,1),(107,136,0,36,2),(108,99,0,36,4),(109,97,0,37,1),(110,136,0,37,2),(111,99,0,37,4),(112,97,0,38,1),(113,136,0,38,2),(114,99,0,38,4),(115,97,0,39,1),(116,136,0,39,2),(117,99,0,39,4),(118,97,0,40,1),(119,136,0,40,2),(120,99,0,40,4),(121,97,0,41,1),(122,136,0,41,2),(123,99,0,41,4),(124,97,0,42,1),(125,136,0,42,2),(126,99,0,42,4),(127,97,0,43,1),(128,136,0,43,2),(129,99,0,43,4),(130,97,0,44,1),(131,136,0,44,2),(132,99,0,44,4),(133,97,0,45,1),(134,136,0,45,2),(135,99,0,45,4),(136,97,0,46,1),(137,136,0,46,2),(138,99,0,46,4),(139,97,0,47,1),(140,136,0,47,2),(141,99,0,47,4),(142,97,0,48,1),(143,136,0,48,2),(144,99,0,48,4),(145,97,0,49,1),(146,136,0,49,2),(147,99,0,49,4),(148,97,0,50,1),(149,136,0,50,2),(150,99,0,50,4);
/*!40000 ALTER TABLE `catalog_product_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_media_gallery` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  `media_type` varchar(32) NOT NULL DEFAULT 'image' COMMENT 'Media entry type',
  `disabled` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility status',
  PRIMARY KEY (`value_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Media Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery`
--

LOCK TABLES `catalog_product_entity_media_gallery` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_media_gallery` VALUES (1,90,'/b/r/bru62701-tiki-th.jpg','image',0),(2,90,'/b/r/bruder-bru62701_1_.jpg','image',0),(3,90,'/1/1/11023_4_.jpg','image',0),(4,90,'/1/1/11023_2_.jpg','image',0),(5,90,'/1/7/17113y_1_.jpg','image',0),(6,90,'/1/7/17113y_2_.jpg','image',0),(7,90,'/v/n/vn463875a-01-tiki-at.jpg','image',0),(8,90,'/v/n/vn463875a-01_1_.jpg','image',0),(9,90,'/c/b/cb-911a-560c_1_.jpg','image',0),(10,90,'/c/b/cb-911a-560c_2_.jpg','image',0),(11,90,'/v/t/vt02g_1_.jpg','image',0),(12,90,'/v/t/vt02g_2_.jpg','image',0),(13,90,'/6/0/6061794-tiki-th.jpg','image',0),(14,90,'/m/y/mykingdom-6061794_2_.jpg','image',0),(15,90,'/6/0/6061800-tiki-th.jpg','image',0),(16,90,'/m/y/mykingdom-6061800_4_.jpg','image',0),(17,90,'/6/0/6053026_1_.jpeg','image',0),(18,90,'/6/0/6053026_1_.jpg','image',0),(19,90,'/b/r/bruder-bru02428_1_.jpg','image',0),(20,90,'/b/r/bruder-bru02428_2_.jpg','image',0),(21,90,'/0/9/09_14.jpg','image',0),(22,90,'/0/1/01_14.jpg','image',0),(23,90,'/m/y/mykingdom-43193_1_.jpg','image',0),(24,90,'/m/y/mykingdom-43193_2_.jpg','image',0),(25,90,'/m/y/mykingdom-43197_1_.jpg','image',0),(26,90,'/m/y/mykingdom-43197_2_.jpg','image',0),(27,90,'/0/9/09_71.jpg','image',0),(28,90,'/0/1/01_71.jpg','image',0),(29,90,'/0/9/09_87.jpg','image',0),(30,90,'/0/1/01_88.jpg','image',0),(31,90,'/2/1/21171_1_.jpg','image',0),(32,90,'/2/1/21171_2_.jpg','image',0),(33,90,'/2/1/21172_1_.jpg','image',0),(34,90,'/2/1/21172_8_.jpg','image',0),(35,90,'/2/1/21173_1_.jpg','image',0),(36,90,'/2/1/21173_8_.jpg','image',0),(37,90,'/2/1/21174_2_.jpg','image',0),(38,90,'/2/1/21174_9_.jpg','image',0),(39,90,'/2/1/21176_1_.jpg','image',0),(40,90,'/2/1/21176_2_.jpg','image',0),(41,90,'/m/y/mykingdom-576440euc_1_.jpg','image',0),(42,90,'/m/y/mykingdom-576440euc_10_.jpg','image',0),(43,90,'/5/7/572763euc_1_.jpg','image',0),(44,90,'/5/7/572763euc_2_.jpg','image',0),(45,90,'/5/7/572770euc_1_.jpg','image',0),(46,90,'/5/7/572770euc_3_.jpg','image',0),(47,90,'/m/y/mykingdom-572787euc_1_.jpg','image',0),(48,90,'/m/y/mykingdom-572787euc_6_.jpg','image',0),(49,90,'/m/y/mykingdom-572794euc_1_.jpg','image',0),(50,90,'/m/y/mykingdom-572794euc_7_.jpg','image',0),(51,90,'/f/0/f0399_1_.jpg','image',0),(52,90,'/f/0/f0399_2_.jpg','image',0),(53,90,'/f/0/f0896_1_.jpg','image',0),(54,90,'/f/0/f0896_5_.jpg','image',0),(55,90,'/f/1/f1057_1_.jpg','image',0),(56,90,'/f/1/f1057_2_.jpg','image',0),(57,90,'/m/y/mykingdom-f1250_1_.jpg','image',0),(58,90,'/m/y/mykingdom-f1250_2_.jpg','image',0),(59,90,'/g/r/grb47-fbr37_3_.jpg','image',0),(60,90,'/g/r/grb47_fbr37_2.jpg','image',0),(61,90,'/6/0/6054907_3.jpg','image',0),(62,90,'/6/0/6054907_1.jpg','image',0),(63,90,'/b/9/b9817_c0114_1.jpg','image',0),(64,90,'/b/9/b9817_c0114_2.jpg','image',0),(65,90,'/b/9/b9817_c1064_1.jpg','image',0),(66,90,'/b/9/b9817_c1064_2.jpg','image',0),(67,90,'/b/9/b9817_c2965_1.jpg','image',0),(68,90,'/b/9/b9817_c2965_2.jpg','image',0),(69,90,'/b/9/b9820_c2709_1.jpg','image',0),(70,90,'/b/9/b9820_c2709_1.jpeg','image',0),(71,90,'/e/0/e0032_e0434_3.jpg','image',0),(72,90,'/e/0/e0032_e0434_3_1.jpg','image',0),(73,90,'/6/0/6060232_2.jpg','image',0),(74,90,'/6/0/6060232_3.jpg','image',0),(75,90,'/m/y/mykingdom-6061363_1_.jpg','image',0),(76,90,'/m/y/mykingdom-6061363_2_.jpg','image',0),(77,90,'/m/y/mykingdom-6061372_1_.jpg','image',0),(78,90,'/m/y/mykingdom-6061372_2_.jpg','image',0),(79,90,'/6/0/60551197_1.jpg','image',0),(80,90,'/6/0/60551197_2.jpg','image',0),(81,90,'/c/b/cb23241-e0801-1.jpg','image',0),(82,90,'/c/b/cbe2124-a5417-1.jpg','image',0),(83,90,'/f/1/f1500_1.jpg','image',0),(84,90,'/f/1/f1504-tiki-th.jpg','image',0),(85,90,'/f/0/f0652_2.jpg','image',0),(86,90,'/f/0/f0652_1.jpg','image',0),(87,90,'/f/1/f1279_1.jpg','image',0),(88,90,'/f/1/f1279_2.jpg','image',0),(89,90,'/m/y/mykingdom-e6642_2_.jpg','image',0),(90,90,'/e/6/e6642-tiki-th.jpg','image',0),(91,90,'/6/5/651274-tiki-th.jpg','image',0),(92,90,'/m/y/mykingdom-651274_1_.jpg','image',0),(93,90,'/8/3/836-mykingdom.jpg','image',0),(94,90,'/8/8/889-191-tiki-at.jpg','image',0),(95,90,'/8/8/889-191_3_.png','image',0);
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery_value`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_media_gallery_value` (
  `value_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Value ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int unsigned DEFAULT NULL COMMENT 'Position',
  `disabled` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Disabled',
  `record_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Record ID',
  PRIMARY KEY (`record_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_VALUE_ID` (`value_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_VAL_ID_STORE_ID` (`entity_id`,`value_id`,`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Media Gallery Attribute Value Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery_value`
--

LOCK TABLES `catalog_product_entity_media_gallery_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_media_gallery_value` VALUES (1,0,1,NULL,1,0,1),(2,0,1,NULL,2,0,2),(3,0,2,NULL,1,0,3),(4,0,2,NULL,2,0,4),(5,0,3,NULL,1,0,5),(6,0,3,NULL,2,0,6),(17,0,9,NULL,1,0,19),(18,0,9,NULL,2,0,20),(15,0,8,NULL,1,0,21),(16,0,8,NULL,2,0,22),(13,0,7,NULL,1,0,23),(14,0,7,NULL,2,0,24),(11,0,6,NULL,1,0,25),(12,0,6,NULL,2,0,26),(9,0,5,NULL,1,0,27),(10,0,5,NULL,2,0,28),(7,0,4,NULL,1,0,29),(8,0,4,NULL,2,0,30),(19,0,10,NULL,1,0,31),(20,0,10,NULL,2,0,32),(21,0,11,NULL,1,0,33),(22,0,11,NULL,2,0,34),(23,0,12,NULL,1,0,35),(24,0,12,NULL,2,0,36),(25,0,13,NULL,1,0,37),(26,0,13,NULL,2,0,38),(27,0,14,NULL,1,0,39),(28,0,14,NULL,2,0,40),(29,0,15,NULL,1,0,41),(30,0,15,NULL,2,0,42),(31,0,16,NULL,1,0,43),(32,0,16,NULL,2,0,44),(33,0,17,NULL,1,0,45),(34,0,17,NULL,2,0,46),(35,0,18,NULL,1,0,47),(36,0,18,NULL,2,0,48),(37,0,19,NULL,1,0,49),(38,0,19,NULL,2,0,50),(39,0,20,NULL,1,0,51),(40,0,20,NULL,2,0,52),(41,0,21,NULL,1,0,53),(42,0,21,NULL,2,0,54),(43,0,22,NULL,1,0,55),(44,0,22,NULL,2,0,56),(45,0,23,NULL,1,0,57),(46,0,23,NULL,2,0,58),(47,0,24,NULL,1,0,59),(48,0,24,NULL,2,0,60),(49,0,25,NULL,1,0,61),(50,0,25,NULL,2,0,62),(51,0,26,NULL,1,0,63),(52,0,26,NULL,2,0,64),(53,0,27,NULL,1,0,65),(54,0,27,NULL,2,0,66),(55,0,28,NULL,1,0,67),(56,0,28,NULL,2,0,68),(57,0,29,NULL,1,0,69),(58,0,29,NULL,2,0,70),(59,0,30,NULL,1,0,71),(60,0,30,NULL,2,0,72),(61,0,31,NULL,1,0,73),(62,0,31,NULL,2,0,74),(63,0,32,NULL,1,0,75),(64,0,32,NULL,2,0,76),(65,0,33,NULL,1,0,77),(66,0,33,NULL,2,0,78),(67,0,34,NULL,1,0,79),(68,0,34,NULL,2,0,80),(69,0,35,NULL,1,0,81),(70,0,35,NULL,2,0,82),(71,0,36,NULL,1,0,83),(72,0,36,NULL,2,0,84),(73,0,37,NULL,1,0,85),(74,0,37,NULL,2,0,86),(75,0,38,NULL,1,0,87),(76,0,38,NULL,2,0,88),(77,0,39,NULL,1,0,89),(78,0,39,NULL,2,0,90),(79,0,40,NULL,1,0,91),(80,0,40,NULL,2,0,92),(81,0,41,NULL,1,0,93),(82,0,42,NULL,1,0,94),(83,0,43,NULL,1,0,95),(84,0,44,NULL,1,0,96),(85,0,45,NULL,1,0,97),(86,0,45,NULL,2,0,98),(87,0,46,NULL,1,0,99),(88,0,46,NULL,2,0,100),(89,0,47,NULL,1,0,101),(90,0,47,NULL,2,0,102),(91,0,48,NULL,1,0,103),(92,0,48,NULL,2,0,104),(93,0,49,NULL,1,0,105),(94,0,50,NULL,1,0,106),(95,0,50,NULL,2,0,107);
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery_value_to_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value_to_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_media_gallery_value_to_entity` (
  `value_id` int unsigned NOT NULL COMMENT 'Value media Entry ID',
  `entity_id` int unsigned NOT NULL COMMENT 'Product Entity ID',
  PRIMARY KEY (`value_id`,`entity_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` (`entity_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A6C6C8FAA386736921D3A7C4B50B1185` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Link Media value to Product entity table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery_value_to_entity`
--

LOCK TABLES `catalog_product_entity_media_gallery_value_to_entity` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value_to_entity` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_media_gallery_value_to_entity` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4),(9,5),(10,5),(11,6),(12,6),(13,7),(14,7),(15,8),(16,8),(17,9),(18,9),(19,10),(20,10),(21,11),(22,11),(23,12),(24,12),(25,13),(26,13),(27,14),(28,14),(29,15),(30,15),(31,16),(32,16),(33,17),(34,17),(35,18),(36,18),(37,19),(38,19),(39,20),(40,20),(41,21),(42,21),(43,22),(44,22),(45,23),(46,23),(47,24),(48,24),(49,25),(50,25),(51,26),(52,26),(53,27),(54,27),(55,28),(56,28),(57,29),(58,29),(59,30),(60,30),(61,31),(62,31),(63,32),(64,32),(65,33),(66,33),(67,34),(68,34),(69,35),(70,35),(71,36),(72,36),(73,37),(74,37),(75,38),(76,38),(77,39),(78,39),(79,40),(80,40),(81,41),(82,42),(83,43),(84,44),(85,45),(86,45),(87,46),(88,46),(89,47),(90,47),(91,48),(92,48),(93,49),(94,50),(95,50);
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value_to_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery_value_video`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_media_gallery_value_video` (
  `value_id` int unsigned NOT NULL COMMENT 'Media Entity ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `provider` varchar(32) DEFAULT NULL COMMENT 'Video provider ID',
  `url` text COMMENT 'Video URL',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text COMMENT 'Page Meta Description',
  `metadata` text COMMENT 'Video meta data',
  PRIMARY KEY (`value_id`,`store_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6FDF205946906B0E653E60AA769899F8` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Video Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery_value_video`
--

LOCK TABLES `catalog_product_entity_media_gallery_value_video` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_text`
--

DROP TABLE IF EXISTS `catalog_product_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_text` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` mediumtext COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TEXT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_text`
--

LOCK TABLES `catalog_product_entity_text` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_text` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_text` VALUES (1,85,0,1,'Trạm cứu hỏa Bworld & xe Land Rover Defender'),(2,85,0,2,'Mô hình xe mô tô 1:12 dòng Ducati Diavel Carbon'),(3,85,0,3,'Mô hình xe hơi trớn Porsche 911 (992) Carrera 4S'),(4,85,0,4,'Xe biến hình sói tuyết dũng mãnh'),(5,85,0,5,'Combo xe buýt du lịch - xe taxi'),(6,85,0,6,'Xe tải nhiều ngăn - Cảnh sát'),(7,85,0,7,'Xe cứu hộ cơ bản Paw Patrol - Rubble'),(8,85,0,8,'Xe cứu hộ cơ bản Paw Patrol - Skye'),(9,85,0,9,'Xe cứu hộ quyền năng Paw Patrol'),(10,85,0,10,'Đồ chơi dạng mô hình theo tỷ lệ thu nhỏ 1:16 xe xúc đào tổng'),(11,85,0,11,'Tàu Tuần Tra Cảnh Sát'),(12,85,0,12,'Câu chuyện phiêu lưu của Ariel, Belle, Cinderella và Tiana'),(13,85,0,13,'Lâu đài băng giá'),(14,85,0,14,'Lớp Học Môn Biến Hình'),(15,85,0,15,'Lớp Học Môn Độc Dược'),(16,85,0,16,'Chuồng Ngựa'),(17,85,0,17,'Cổng Đổ Nát'),(18,85,0,18,'Tòa Tháp Chọc Trời'),(19,85,0,19,'Nhà Cây Hiện Đại'),(20,85,0,20,'Khu Rừng Rậm Ma Quái'),(21,85,0,21,'Búp bê LOL phiên bản confetti - bữa tiệc sinh nhật'),(22,85,0,22,'Cô nàng búp bê thời trang OMG - Sweets ngọt ngào'),(23,85,0,23,'Cô nàng búp bê thời trang OMG - Spicy cá tính'),(24,85,0,24,'Cô nàng búp bê thời trang OMG - Sunshine tỏa sáng'),(25,85,0,25,'Cô nàng búp bê thời trang OMG - Moon light mộng mơ'),(26,85,0,26,'Công chúa Ariel đổi màu kỳ diệu'),(27,85,0,27,'Công chúa Royal Shimmer Rapunzel'),(28,85,0,28,'Công chúa Rapunzel với mái tóc dài 45cm'),(29,85,0,29,'Công chúa Ariel và chiếc váy diệu kỳ'),(30,85,0,30,'Búp bê thời trang - Rock Tee / Skirt'),(31,85,0,31,'Trứng Rồng Huyền Bí'),(32,85,0,32,'Pony bông 30 cm- Rainbow Dash'),(33,85,0,33,'Pony bông 30 cm - Spike'),(34,85,0,34,'Pony bông 30 cm- Rainbow Dash Sea Pony'),(35,85,0,35,'Pony Bông - Chiến Binh Cầu Vồng'),(36,85,0,36,'Pinkie Pie với mái tóc suôn mượt'),(37,85,0,37,'Hộp quà Present Pets chó đốm nhanh nhẹn'),(38,85,0,38,'Hộp quà Present Pets - Yorkies lém lỉnh'),(39,85,0,39,'Hộp quà Present Pets - Poodles ngọt ngào'),(40,85,0,40,'Hộp quà Present Pets cún cưng Beagle đáng yêu'),(41,85,0,41,'Combo bột nặn mini 4 màu + bộ PD đầu đời'),(42,85,0,42,'Combo Bộ khuôn thú cưng đáng yêu và bột nặn 6 màu lấp lánh'),(43,85,0,43,'Khám phá núi lửa nham thạch cùng khủng long T-Rex'),(44,85,0,44,'Khủng long T-Rex và quả trứng bí ẩn'),(45,85,0,45,'Bữa tiệc BBQ'),(46,85,0,46,'Chảo bếp thần kì'),(47,85,0,47,'Que kem 7 màu'),(48,85,0,48,'Đồ chơi phóng banh vui nhộn'),(49,85,0,49,'Xe cứu thương đa năng'),(50,85,0,50,'Bữa tiệc nhạc nước câu vịt - Màu xanh');
/*!40000 ALTER TABLE `catalog_product_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_entity_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_tier_price` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'QTY',
  `value` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Value',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `percentage_value` decimal(5,2) DEFAULT NULL COMMENT 'Percentage value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_E8AB433B9ACB00343ABB312AD2FAB087` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Tier Price Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_tier_price`
--

LOCK TABLES `catalog_product_entity_tier_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_product_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_entity_varchar` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=825 DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_varchar`
--

LOCK TABLES `catalog_product_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_varchar` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_varchar` VALUES (1,134,0,1,'2'),(2,87,0,1,'/b/r/bru62701-tiki-th.jpg'),(3,86,0,1,'Trạm cứu hỏa Bworld & xe Land Rover Defender '),(4,84,0,1,'Trạm cứu hỏa Bworld & xe Land Rover Defender'),(5,120,0,1,'0'),(6,73,0,1,'Trạm cứu hỏa Bworld & xe Land Rover Defender'),(7,106,0,1,'container2'),(8,104,0,1,'product-full-width'),(9,88,0,1,'/b/r/bru62701-tiki-th.jpg'),(10,135,0,1,'/b/r/bru62701-tiki-th.jpg'),(11,89,0,1,'/b/r/bru62701-tiki-th.jpg'),(12,123,0,1,'tr-m-c-u-h-a-bworld-xe-land-rover-defender'),(17,134,0,2,'2'),(18,87,0,2,'/1/1/11023_4_.jpg'),(19,86,0,2,'Mô hình xe mô tô 1:12 dòng Ducati Diavel Carbon '),(20,84,0,2,'Mô hình xe mô tô 1:12 dòng Ducati Diavel Carbon'),(21,120,0,2,'0'),(22,73,0,2,'Mô hình xe mô tô 1:12 dòng Ducati Diavel Carbon'),(23,106,0,2,'container2'),(24,104,0,2,'product-full-width'),(25,88,0,2,'/1/1/11023_4_.jpg'),(26,135,0,2,'/1/1/11023_4_.jpg'),(27,89,0,2,'/1/1/11023_4_.jpg'),(28,123,0,2,'mo-hinh-xe-mo-to-1-12-dong-ducati-diavel-carbon'),(33,134,0,3,'2'),(34,87,0,3,'/1/7/17113y_1_.jpg'),(35,86,0,3,'Mô hình xe hơi trớn Porsche 911 (992) Carrera 4S '),(36,84,0,3,'Mô hình xe hơi trớn Porsche 911 (992) Carrera 4S'),(37,120,0,3,'0'),(38,73,0,3,'Mô hình xe hơi trớn Porsche 911 (992) Carrera 4S'),(39,106,0,3,'container2'),(40,104,0,3,'product-full-width'),(41,88,0,3,'/1/7/17113y_1_.jpg'),(42,135,0,3,'/1/7/17113y_1_.jpg'),(43,89,0,3,'/1/7/17113y_1_.jpg'),(44,123,0,3,'mo-hinh-xe-hoi-tr-n-porsche-911-992-carrera-4s'),(49,134,0,4,'2'),(50,87,0,4,'/v/n/vn463875a-01-tiki-at.jpg'),(51,86,0,4,'Xe biến hình sói tuyết dũng mãnh '),(52,84,0,4,'Xe biến hình sói tuyết dũng mãnh'),(53,120,0,4,'0'),(54,73,0,4,'Xe biến hình sói tuyết dũng mãnh'),(55,106,0,4,'container2'),(56,104,0,4,'product-full-width'),(57,88,0,4,'/v/n/vn463875a-01-tiki-at.jpg'),(58,135,0,4,'/v/n/vn463875a-01-tiki-at.jpg'),(59,89,0,4,'/v/n/vn463875a-01-tiki-at.jpg'),(60,123,0,4,'xe-bi-n-hinh-soi-tuy-t-dung-m-nh'),(65,134,0,5,'2'),(66,87,0,5,'/c/b/cb-911a-560c_1_.jpg'),(67,86,0,5,'Combo xe buýt du lịch - xe taxi '),(68,84,0,5,'Combo xe buýt du lịch - xe taxi'),(69,120,0,5,'0'),(70,73,0,5,'Combo xe buýt du lịch - xe taxi'),(71,106,0,5,'container2'),(72,104,0,5,'product-full-width'),(73,88,0,5,'/c/b/cb-911a-560c_1_.jpg'),(74,135,0,5,'/c/b/cb-911a-560c_1_.jpg'),(75,89,0,5,'/c/b/cb-911a-560c_1_.jpg'),(76,123,0,5,'combo-xe-buyt-du-l-ch-xe-taxi'),(81,134,0,6,'2'),(82,87,0,6,'/v/t/vt02g_1_.jpg'),(83,86,0,6,'Xe tải nhiều ngăn - Cảnh sát '),(84,84,0,6,'Xe tải nhiều ngăn - Cảnh sát'),(85,120,0,6,'0'),(86,73,0,6,'Xe tải nhiều ngăn - Cảnh sát'),(87,106,0,6,'container2'),(88,104,0,6,'product-full-width'),(89,88,0,6,'/v/t/vt02g_1_.jpg'),(90,135,0,6,'/v/t/vt02g_1_.jpg'),(91,89,0,6,'/v/t/vt02g_1_.jpg'),(92,123,0,6,'xe-t-i-nhi-u-ngan-c-nh-sat'),(97,134,0,7,'2'),(98,87,0,7,'/6/0/6061794-tiki-th.jpg'),(99,86,0,7,'Xe cứu hộ cơ bản Paw Patrol - Rubble '),(100,84,0,7,'Xe cứu hộ cơ bản Paw Patrol - Rubble'),(101,120,0,7,'0'),(102,73,0,7,'Xe cứu hộ cơ bản Paw Patrol - Rubble'),(103,106,0,7,'container2'),(104,104,0,7,'product-full-width'),(105,88,0,7,'/6/0/6061794-tiki-th.jpg'),(106,135,0,7,'/6/0/6061794-tiki-th.jpg'),(107,89,0,7,'/6/0/6061794-tiki-th.jpg'),(108,123,0,7,'xe-c-u-h-co-b-n-paw-patrol-rubble'),(113,134,0,8,'2'),(114,87,0,8,'/6/0/6061800-tiki-th.jpg'),(115,86,0,8,'Xe cứu hộ cơ bản Paw Patrol - Skye '),(116,84,0,8,'Xe cứu hộ cơ bản Paw Patrol - Skye'),(117,120,0,8,'0'),(118,73,0,8,'Xe cứu hộ cơ bản Paw Patrol - Skye'),(119,106,0,8,'container2'),(120,104,0,8,'product-full-width'),(121,88,0,8,'/6/0/6061800-tiki-th.jpg'),(122,135,0,8,'/6/0/6061800-tiki-th.jpg'),(123,89,0,8,'/6/0/6061800-tiki-th.jpg'),(124,123,0,8,'xe-c-u-h-co-b-n-paw-patrol-skye'),(129,134,0,9,'2'),(130,87,0,9,'/6/0/6053026_1_.jpeg'),(131,86,0,9,'Xe cứu hộ quyền năng Paw Patrol '),(132,84,0,9,'Xe cứu hộ quyền năng Paw Patrol'),(133,120,0,9,'0'),(134,73,0,9,'Xe cứu hộ quyền năng Paw Patrol'),(135,106,0,9,'container2'),(136,104,0,9,'product-full-width'),(137,88,0,9,'/6/0/6053026_1_.jpeg'),(138,135,0,9,'/6/0/6053026_1_.jpeg'),(139,89,0,9,'/6/0/6053026_1_.jpeg'),(140,123,0,9,'xe-c-u-h-quy-n-nang-paw-patrol'),(169,134,0,10,'2'),(170,87,0,10,'/b/r/bruder-bru02428_1_.jpg'),(171,86,0,10,'Đồ chơi dạng mô hình theo tỷ lệ thu nhỏ 1:16 xe xúc đào tổng '),(172,84,0,10,'Đồ chơi dạng mô hình theo tỷ lệ thu nhỏ 1:16 xe xúc đào tổng'),(173,120,0,10,'0'),(174,73,0,10,'Đồ chơi dạng mô hình theo tỷ lệ thu nhỏ 1:16 xe xúc đào tổng'),(175,106,0,10,'container2'),(176,104,0,10,'product-full-width'),(177,88,0,10,'/b/r/bruder-bru02428_1_.jpg'),(178,135,0,10,'/b/r/bruder-bru02428_1_.jpg'),(179,89,0,10,'/b/r/bruder-bru02428_1_.jpg'),(180,123,0,10,'d-choi-d-ng-mo-hinh-theo-t-l-thu-nh-1-16-xe-xuc-dao-t-ng'),(185,134,0,11,'2'),(186,87,0,11,'/0/9/09_14.jpg'),(187,86,0,11,'Tàu Tuần Tra Cảnh Sát '),(188,84,0,11,'Tàu Tuần Tra Cảnh Sát'),(189,120,0,11,'0'),(190,73,0,11,'Tàu Tuần Tra Cảnh Sát'),(191,106,0,11,'container2'),(192,104,0,11,'product-full-width'),(193,88,0,11,'/0/9/09_14.jpg'),(194,135,0,11,'/0/9/09_14.jpg'),(195,89,0,11,'/0/9/09_14.jpg'),(196,123,0,11,'tau-tu-n-tra-c-nh-sat'),(201,134,0,12,'2'),(202,87,0,12,'/m/y/mykingdom-43193_1_.jpg'),(203,86,0,12,'Câu chuyện phiêu lưu của Ariel, Belle, Cinderella và Tiana '),(204,84,0,12,'Câu chuyện phiêu lưu của Ariel, Belle, Cinderella và Tiana'),(205,120,0,12,'0'),(206,73,0,12,'Câu chuyện phiêu lưu của Ariel, Belle, Cinderella và Tiana'),(207,106,0,12,'container2'),(208,104,0,12,'product-full-width'),(209,88,0,12,'/m/y/mykingdom-43193_1_.jpg'),(210,135,0,12,'/m/y/mykingdom-43193_1_.jpg'),(211,89,0,12,'/m/y/mykingdom-43193_1_.jpg'),(212,123,0,12,'cau-chuy-n-phieu-luu-c-a-ariel-belle-cinderella-va-tiana'),(217,134,0,13,'2'),(218,87,0,13,'/m/y/mykingdom-43197_1_.jpg'),(219,86,0,13,'Lâu đài băng giá '),(220,84,0,13,'Lâu đài băng giá'),(221,120,0,13,'0'),(222,73,0,13,'Lâu đài băng giá'),(223,106,0,13,'container2'),(224,104,0,13,'product-full-width'),(225,88,0,13,'/m/y/mykingdom-43197_1_.jpg'),(226,135,0,13,'/m/y/mykingdom-43197_1_.jpg'),(227,89,0,13,'/m/y/mykingdom-43197_1_.jpg'),(228,123,0,13,'lau-dai-bang-gia'),(233,134,0,14,'2'),(234,87,0,14,'/0/9/09_71.jpg'),(235,86,0,14,'Lớp Học Môn Biến Hình '),(236,84,0,14,'Lớp Học Môn Biến Hình'),(237,120,0,14,'0'),(238,73,0,14,'Lớp Học Môn Biến Hình'),(239,106,0,14,'container2'),(240,104,0,14,'product-full-width'),(241,88,0,14,'/0/9/09_71.jpg'),(242,135,0,14,'/0/9/09_71.jpg'),(243,89,0,14,'/0/9/09_71.jpg'),(244,123,0,14,'l-p-h-c-mon-bi-n-hinh'),(249,134,0,15,'2'),(250,87,0,15,'/0/9/09_87.jpg'),(251,86,0,15,'Lớp Học Môn Độc Dược '),(252,84,0,15,'Lớp Học Môn Độc Dược'),(253,120,0,15,'0'),(254,73,0,15,'Lớp Học Môn Độc Dược'),(255,106,0,15,'container2'),(256,104,0,15,'product-full-width'),(257,88,0,15,'/0/9/09_87.jpg'),(258,135,0,15,'/0/9/09_87.jpg'),(259,89,0,15,'/0/9/09_87.jpg'),(260,123,0,15,'l-p-h-c-mon-d-c-du-c'),(265,134,0,16,'2'),(266,87,0,16,'/2/1/21171_1_.jpg'),(267,86,0,16,'Chuồng Ngựa '),(268,84,0,16,'Chuồng Ngựa'),(269,120,0,16,'0'),(270,73,0,16,'Chuồng Ngựa'),(271,106,0,16,'container2'),(272,104,0,16,'product-full-width'),(273,88,0,16,'/2/1/21171_1_.jpg'),(274,135,0,16,'/2/1/21171_1_.jpg'),(275,89,0,16,'/2/1/21171_1_.jpg'),(276,123,0,16,'chu-ng-ng-a'),(281,134,0,17,'2'),(282,87,0,17,'/2/1/21172_1_.jpg'),(283,86,0,17,'Cổng Đổ Nát '),(284,84,0,17,'Cổng Đổ Nát'),(285,120,0,17,'0'),(286,73,0,17,'Cổng Đổ Nát'),(287,106,0,17,'container2'),(288,104,0,17,'product-full-width'),(289,88,0,17,'/2/1/21172_1_.jpg'),(290,135,0,17,'/2/1/21172_1_.jpg'),(291,89,0,17,'/2/1/21172_1_.jpg'),(292,123,0,17,'c-ng-d-nat'),(297,134,0,18,'2'),(298,87,0,18,'/2/1/21173_1_.jpg'),(299,86,0,18,'Tòa Tháp Chọc Trời '),(300,84,0,18,'Tòa Tháp Chọc Trời'),(301,120,0,18,'0'),(302,73,0,18,'Tòa Tháp Chọc Trời'),(303,106,0,18,'container2'),(304,104,0,18,'product-full-width'),(305,88,0,18,'/2/1/21173_1_.jpg'),(306,135,0,18,'/2/1/21173_1_.jpg'),(307,89,0,18,'/2/1/21173_1_.jpg'),(308,123,0,18,'toa-thap-ch-c-tr-i'),(313,134,0,19,'2'),(314,87,0,19,'/2/1/21174_2_.jpg'),(315,86,0,19,'Nhà Cây Hiện Đại '),(316,84,0,19,'Nhà Cây Hiện Đại'),(317,120,0,19,'0'),(318,73,0,19,'Nhà Cây Hiện Đại'),(319,106,0,19,'container2'),(320,104,0,19,'product-full-width'),(321,88,0,19,'/2/1/21174_2_.jpg'),(322,135,0,19,'/2/1/21174_2_.jpg'),(323,89,0,19,'/2/1/21174_2_.jpg'),(324,123,0,19,'nha-cay-hi-n-d-i'),(329,134,0,20,'2'),(330,87,0,20,'/2/1/21176_1_.jpg'),(331,86,0,20,'Khu Rừng Rậm Ma Quái '),(332,84,0,20,'Khu Rừng Rậm Ma Quái'),(333,120,0,20,'0'),(334,73,0,20,'Khu Rừng Rậm Ma Quái'),(335,106,0,20,'container2'),(336,104,0,20,'product-full-width'),(337,88,0,20,'/2/1/21176_1_.jpg'),(338,135,0,20,'/2/1/21176_1_.jpg'),(339,89,0,20,'/2/1/21176_1_.jpg'),(340,123,0,20,'khu-r-ng-r-m-ma-quai'),(345,134,0,21,'2'),(346,87,0,21,'/m/y/mykingdom-576440euc_1_.jpg'),(347,86,0,21,'Búp bê LOL phiên bản confetti - bữa tiệc sinh nhật '),(348,84,0,21,'Búp bê LOL phiên bản confetti - bữa tiệc sinh nhật'),(349,120,0,21,'0'),(350,73,0,21,'Búp bê LOL phiên bản confetti - bữa tiệc sinh nhật'),(351,106,0,21,'container2'),(352,104,0,21,'product-full-width'),(353,88,0,21,'/m/y/mykingdom-576440euc_1_.jpg'),(354,135,0,21,'/m/y/mykingdom-576440euc_1_.jpg'),(355,89,0,21,'/m/y/mykingdom-576440euc_1_.jpg'),(356,123,0,21,'bup-be-lol-phien-b-n-confetti-b-a-ti-c-sinh-nh-t'),(361,134,0,22,'2'),(362,87,0,22,'/5/7/572763euc_1_.jpg'),(363,86,0,22,'Cô nàng búp bê thời trang OMG - Sweets ngọt ngào '),(364,84,0,22,'Cô nàng búp bê thời trang OMG - Sweets ngọt ngào'),(365,120,0,22,'0'),(366,73,0,22,'Cô nàng búp bê thời trang OMG - Sweets ngọt ngào'),(367,106,0,22,'container2'),(368,104,0,22,'product-full-width'),(369,88,0,22,'/5/7/572763euc_1_.jpg'),(370,135,0,22,'/5/7/572763euc_1_.jpg'),(371,89,0,22,'/5/7/572763euc_1_.jpg'),(372,123,0,22,'co-nang-bup-be-th-i-trang-omg-sweets-ng-t-ngao'),(377,134,0,23,'2'),(378,87,0,23,'/5/7/572770euc_1_.jpg'),(379,86,0,23,'Cô nàng búp bê thời trang OMG - Spicy cá tính '),(380,84,0,23,'Cô nàng búp bê thời trang OMG - Spicy cá tính'),(381,120,0,23,'0'),(382,73,0,23,'Cô nàng búp bê thời trang OMG - Spicy cá tính'),(383,106,0,23,'container2'),(384,104,0,23,'product-full-width'),(385,88,0,23,'/5/7/572770euc_1_.jpg'),(386,135,0,23,'/5/7/572770euc_1_.jpg'),(387,89,0,23,'/5/7/572770euc_1_.jpg'),(388,123,0,23,'co-nang-bup-be-th-i-trang-omg-spicy-ca-tinh'),(393,134,0,24,'2'),(394,87,0,24,'/m/y/mykingdom-572787euc_1_.jpg'),(395,86,0,24,'Cô nàng búp bê thời trang OMG - Sunshine tỏa sáng '),(396,84,0,24,'Cô nàng búp bê thời trang OMG - Sunshine tỏa sáng'),(397,120,0,24,'0'),(398,73,0,24,'Cô nàng búp bê thời trang OMG - Sunshine tỏa sáng'),(399,106,0,24,'container2'),(400,104,0,24,'product-full-width'),(401,88,0,24,'/m/y/mykingdom-572787euc_1_.jpg'),(402,135,0,24,'/m/y/mykingdom-572787euc_1_.jpg'),(403,89,0,24,'/m/y/mykingdom-572787euc_1_.jpg'),(404,123,0,24,'co-nang-bup-be-th-i-trang-omg-sunshine-t-a-sang'),(409,134,0,25,'2'),(410,87,0,25,'/m/y/mykingdom-572794euc_1_.jpg'),(411,86,0,25,'Cô nàng búp bê thời trang OMG - Moon light mộng mơ '),(412,84,0,25,'Cô nàng búp bê thời trang OMG - Moon light mộng mơ'),(413,120,0,25,'0'),(414,73,0,25,'Cô nàng búp bê thời trang OMG - Moon light mộng mơ'),(415,106,0,25,'container2'),(416,104,0,25,'product-full-width'),(417,88,0,25,'/m/y/mykingdom-572794euc_1_.jpg'),(418,135,0,25,'/m/y/mykingdom-572794euc_1_.jpg'),(419,89,0,25,'/m/y/mykingdom-572794euc_1_.jpg'),(420,123,0,25,'co-nang-bup-be-th-i-trang-omg-moon-light-m-ng-mo'),(425,134,0,26,'2'),(426,87,0,26,'/f/0/f0399_1_.jpg'),(427,86,0,26,'Công chúa Ariel đổi màu kỳ diệu '),(428,84,0,26,'Công chúa Ariel đổi màu kỳ diệu'),(429,120,0,26,'0'),(430,73,0,26,'Công chúa Ariel đổi màu kỳ diệu'),(431,106,0,26,'container2'),(432,104,0,26,'product-full-width'),(433,88,0,26,'/f/0/f0399_1_.jpg'),(434,135,0,26,'/f/0/f0399_1_.jpg'),(435,89,0,26,'/f/0/f0399_1_.jpg'),(436,123,0,26,'cong-chua-ariel-d-i-mau-k-di-u'),(441,134,0,27,'2'),(442,87,0,27,'/f/0/f0896_1_.jpg'),(443,86,0,27,'Công chúa Royal Shimmer Rapunzel '),(444,84,0,27,'Công chúa Royal Shimmer Rapunzel'),(445,120,0,27,'0'),(446,73,0,27,'Công chúa Royal Shimmer Rapunzel'),(447,106,0,27,'container2'),(448,104,0,27,'product-full-width'),(449,88,0,27,'/f/0/f0896_1_.jpg'),(450,135,0,27,'/f/0/f0896_1_.jpg'),(451,89,0,27,'/f/0/f0896_1_.jpg'),(452,123,0,27,'cong-chua-royal-shimmer-rapunzel'),(457,134,0,28,'2'),(458,87,0,28,'/f/1/f1057_1_.jpg'),(459,86,0,28,'Công chúa Rapunzel với mái tóc dài 45cm '),(460,84,0,28,'Công chúa Rapunzel với mái tóc dài 45cm'),(461,120,0,28,'0'),(462,73,0,28,'Công chúa Rapunzel với mái tóc dài 45cm'),(463,106,0,28,'container2'),(464,104,0,28,'product-full-width'),(465,88,0,28,'/f/1/f1057_1_.jpg'),(466,135,0,28,'/f/1/f1057_1_.jpg'),(467,89,0,28,'/f/1/f1057_1_.jpg'),(468,123,0,28,'cong-chua-rapunzel-v-i-mai-toc-dai-45cm'),(473,134,0,29,'2'),(474,87,0,29,'/m/y/mykingdom-f1250_1_.jpg'),(475,86,0,29,'Công chúa Ariel và chiếc váy diệu kỳ '),(476,84,0,29,'Công chúa Ariel và chiếc váy diệu kỳ'),(477,120,0,29,'0'),(478,73,0,29,'Công chúa Ariel và chiếc váy diệu kỳ'),(479,106,0,29,'container2'),(480,104,0,29,'product-full-width'),(481,88,0,29,'/m/y/mykingdom-f1250_1_.jpg'),(482,135,0,29,'/m/y/mykingdom-f1250_1_.jpg'),(483,89,0,29,'/m/y/mykingdom-f1250_1_.jpg'),(484,123,0,29,'cong-chua-ariel-va-chi-c-vay-di-u-k'),(489,134,0,30,'2'),(490,87,0,30,'/g/r/grb47-fbr37_3_.jpg'),(491,86,0,30,'Búp bê thời trang - Rock Tee / Skirt '),(492,84,0,30,'Búp bê thời trang - Rock Tee / Skirt'),(493,120,0,30,'0'),(494,73,0,30,'Búp bê thời trang - Rock Tee / Skirt'),(495,106,0,30,'container2'),(496,104,0,30,'product-full-width'),(497,88,0,30,'/g/r/grb47-fbr37_3_.jpg'),(498,135,0,30,'/g/r/grb47-fbr37_3_.jpg'),(499,89,0,30,'/g/r/grb47-fbr37_3_.jpg'),(500,123,0,30,'bup-be-th-i-trang-rock-tee-skirt'),(505,134,0,31,'2'),(506,87,0,31,'/6/0/6054907_3.jpg'),(507,86,0,31,'Trứng Rồng Huyền Bí '),(508,84,0,31,'Trứng Rồng Huyền Bí'),(509,120,0,31,'0'),(510,73,0,31,'Trứng Rồng Huyền Bí'),(511,106,0,31,'container2'),(512,104,0,31,'product-full-width'),(513,88,0,31,'/6/0/6054907_3.jpg'),(514,135,0,31,'/6/0/6054907_3.jpg'),(515,89,0,31,'/6/0/6054907_3.jpg'),(516,123,0,31,'tr-ng-r-ng-huy-n-bi'),(521,134,0,32,'2'),(522,87,0,32,'/b/9/b9817_c0114_1.jpg'),(523,86,0,32,'Pony bông 30 cm- Rainbow Dash '),(524,84,0,32,'Pony bông 30 cm- Rainbow Dash'),(525,120,0,32,'0'),(526,73,0,32,'Pony bông 30 cm- Rainbow Dash'),(527,106,0,32,'container2'),(528,104,0,32,'product-full-width'),(529,88,0,32,'/b/9/b9817_c0114_1.jpg'),(530,135,0,32,'/b/9/b9817_c0114_1.jpg'),(531,89,0,32,'/b/9/b9817_c0114_1.jpg'),(532,123,0,32,'pony-bong-30-cm-rainbow-dash'),(537,134,0,33,'2'),(538,87,0,33,'/b/9/b9817_c1064_1.jpg'),(539,86,0,33,'Pony bông 30 cm - Spike '),(540,84,0,33,'Pony bông 30 cm - Spike'),(541,120,0,33,'0'),(542,73,0,33,'Pony bông 30 cm - Spike'),(543,106,0,33,'container2'),(544,104,0,33,'product-full-width'),(545,88,0,33,'/b/9/b9817_c1064_1.jpg'),(546,135,0,33,'/b/9/b9817_c1064_1.jpg'),(547,89,0,33,'/b/9/b9817_c1064_1.jpg'),(548,123,0,33,'pony-bong-30-cm-spike'),(553,134,0,34,'2'),(554,87,0,34,'/b/9/b9817_c2965_1.jpg'),(555,86,0,34,'Pony bông 30 cm- Rainbow Dash Sea Pony '),(556,84,0,34,'Pony bông 30 cm- Rainbow Dash Sea Pony'),(557,120,0,34,'0'),(558,73,0,34,'Pony bông 30 cm- Rainbow Dash Sea Pony'),(559,106,0,34,'container2'),(560,104,0,34,'product-full-width'),(561,88,0,34,'/b/9/b9817_c2965_1.jpg'),(562,135,0,34,'/b/9/b9817_c2965_1.jpg'),(563,89,0,34,'/b/9/b9817_c2965_1.jpg'),(564,123,0,34,'pony-bong-30-cm-rainbow-dash-sea-pony'),(569,134,0,35,'2'),(570,87,0,35,'/b/9/b9820_c2709_1.jpg'),(571,86,0,35,'Pony Bông - Chiến Binh Cầu Vồng '),(572,84,0,35,'Pony Bông - Chiến Binh Cầu Vồng'),(573,120,0,35,'0'),(574,73,0,35,'Pony Bông - Chiến Binh Cầu Vồng'),(575,106,0,35,'container2'),(576,104,0,35,'product-full-width'),(577,88,0,35,'/b/9/b9820_c2709_1.jpg'),(578,135,0,35,'/b/9/b9820_c2709_1.jpg'),(579,89,0,35,'/b/9/b9820_c2709_1.jpg'),(580,123,0,35,'pony-bong-chi-n-binh-c-u-v-ng'),(585,134,0,36,'2'),(586,87,0,36,'/e/0/e0032_e0434_3.jpg'),(587,86,0,36,'Pinkie Pie với mái tóc suôn mượt '),(588,84,0,36,'Pinkie Pie với mái tóc suôn mượt'),(589,120,0,36,'0'),(590,73,0,36,'Pinkie Pie với mái tóc suôn mượt'),(591,106,0,36,'container2'),(592,104,0,36,'product-full-width'),(593,88,0,36,'/e/0/e0032_e0434_3.jpg'),(594,135,0,36,'/e/0/e0032_e0434_3.jpg'),(595,89,0,36,'/e/0/e0032_e0434_3.jpg'),(596,123,0,36,'pinkie-pie-v-i-mai-toc-suon-mu-t'),(601,134,0,37,'2'),(602,87,0,37,'/6/0/6060232_2.jpg'),(603,86,0,37,'Hộp quà Present Pets chó đốm nhanh nhẹn '),(604,84,0,37,'Hộp quà Present Pets chó đốm nhanh nhẹn'),(605,120,0,37,'0'),(606,73,0,37,'Hộp quà Present Pets chó đốm nhanh nhẹn'),(607,106,0,37,'container2'),(608,104,0,37,'product-full-width'),(609,88,0,37,'/6/0/6060232_2.jpg'),(610,135,0,37,'/6/0/6060232_2.jpg'),(611,89,0,37,'/6/0/6060232_2.jpg'),(612,123,0,37,'h-p-qua-present-pets-cho-d-m-nhanh-nh-n'),(617,134,0,38,'2'),(618,87,0,38,'/m/y/mykingdom-6061363_1_.jpg'),(619,86,0,38,'Hộp quà Present Pets - Yorkies lém lỉnh '),(620,84,0,38,'Hộp quà Present Pets - Yorkies lém lỉnh'),(621,120,0,38,'0'),(622,73,0,38,'Hộp quà Present Pets - Yorkies lém lỉnh'),(623,106,0,38,'container2'),(624,104,0,38,'product-full-width'),(625,88,0,38,'/m/y/mykingdom-6061363_1_.jpg'),(626,135,0,38,'/m/y/mykingdom-6061363_1_.jpg'),(627,89,0,38,'/m/y/mykingdom-6061363_1_.jpg'),(628,123,0,38,'h-p-qua-present-pets-yorkies-lem-l-nh'),(633,134,0,39,'2'),(634,87,0,39,'/m/y/mykingdom-6061372_1_.jpg'),(635,86,0,39,'Hộp quà Present Pets - Poodles ngọt ngào '),(636,84,0,39,'Hộp quà Present Pets - Poodles ngọt ngào'),(637,120,0,39,'0'),(638,73,0,39,'Hộp quà Present Pets - Poodles ngọt ngào'),(639,106,0,39,'container2'),(640,104,0,39,'product-full-width'),(641,88,0,39,'/m/y/mykingdom-6061372_1_.jpg'),(642,135,0,39,'/m/y/mykingdom-6061372_1_.jpg'),(643,89,0,39,'/m/y/mykingdom-6061372_1_.jpg'),(644,123,0,39,'h-p-qua-present-pets-poodles-ng-t-ngao'),(649,134,0,40,'2'),(650,87,0,40,'/6/0/60551197_1.jpg'),(651,86,0,40,'Hộp quà Present Pets cún cưng Beagle đáng yêu '),(652,84,0,40,'Hộp quà Present Pets cún cưng Beagle đáng yêu'),(653,120,0,40,'0'),(654,73,0,40,'Hộp quà Present Pets cún cưng Beagle đáng yêu'),(655,106,0,40,'container2'),(656,104,0,40,'product-full-width'),(657,88,0,40,'/6/0/60551197_1.jpg'),(658,135,0,40,'/6/0/60551197_1.jpg'),(659,89,0,40,'/6/0/60551197_1.jpg'),(660,123,0,40,'h-p-qua-present-pets-cun-cung-beagle-dang-yeu'),(665,134,0,41,'2'),(666,87,0,41,'/c/b/cb23241-e0801-1.jpg'),(667,86,0,41,'Combo bột nặn mini 4 màu + bộ PD đầu đời '),(668,84,0,41,'Combo bột nặn mini 4 màu + bộ PD đầu đời'),(669,120,0,41,'0'),(670,73,0,41,'Combo bột nặn mini 4 màu + bộ PD đầu đời'),(671,106,0,41,'container2'),(672,104,0,41,'product-full-width'),(673,88,0,41,'/c/b/cb23241-e0801-1.jpg'),(674,135,0,41,'/c/b/cb23241-e0801-1.jpg'),(675,89,0,41,'/c/b/cb23241-e0801-1.jpg'),(676,123,0,41,'combo-b-t-n-n-mini-4-mau-b-pd-d-u-d-i'),(681,134,0,42,'2'),(682,87,0,42,'/c/b/cbe2124-a5417-1.jpg'),(683,86,0,42,'Combo Bộ khuôn thú cưng đáng yêu và bột nặn 6 màu lấp lánh '),(684,84,0,42,'Combo Bộ khuôn thú cưng đáng yêu và bột nặn 6 màu lấp lánh'),(685,120,0,42,'0'),(686,73,0,42,'Combo Bộ khuôn thú cưng đáng yêu và bột nặn 6 màu lấp lánh'),(687,106,0,42,'container2'),(688,104,0,42,'product-full-width'),(689,88,0,42,'/c/b/cbe2124-a5417-1.jpg'),(690,135,0,42,'/c/b/cbe2124-a5417-1.jpg'),(691,89,0,42,'/c/b/cbe2124-a5417-1.jpg'),(692,123,0,42,'combo-b-khuon-thu-cung-dang-yeu-va-b-t-n-n-6-mau-l-p-lanh'),(697,134,0,43,'2'),(698,87,0,43,'/f/1/f1500_1.jpg'),(699,86,0,43,'Khám phá núi lửa nham thạch cùng khủng long T-Rex '),(700,84,0,43,'Khám phá núi lửa nham thạch cùng khủng long T-Rex'),(701,120,0,43,'0'),(702,73,0,43,'Khám phá núi lửa nham thạch cùng khủng long T-Rex'),(703,106,0,43,'container2'),(704,104,0,43,'product-full-width'),(705,88,0,43,'/f/1/f1500_1.jpg'),(706,135,0,43,'/f/1/f1500_1.jpg'),(707,89,0,43,'/f/1/f1500_1.jpg'),(708,123,0,43,'kham-pha-nui-l-a-nham-th-ch-cung-kh-ng-long-t-rex'),(713,134,0,44,'2'),(714,87,0,44,'/f/1/f1504-tiki-th.jpg'),(715,86,0,44,'Khủng long T-Rex và quả trứng bí ẩn '),(716,84,0,44,'Khủng long T-Rex và quả trứng bí ẩn'),(717,120,0,44,'0'),(718,73,0,44,'Khủng long T-Rex và quả trứng bí ẩn'),(719,106,0,44,'container2'),(720,104,0,44,'product-full-width'),(721,88,0,44,'/f/1/f1504-tiki-th.jpg'),(722,135,0,44,'/f/1/f1504-tiki-th.jpg'),(723,89,0,44,'/f/1/f1504-tiki-th.jpg'),(724,123,0,44,'kh-ng-long-t-rex-va-qu-tr-ng-bi-n'),(729,134,0,45,'2'),(730,87,0,45,'/f/0/f0652_2.jpg'),(731,86,0,45,'Bữa tiệc BBQ '),(732,84,0,45,'Bữa tiệc BBQ'),(733,120,0,45,'0'),(734,73,0,45,'Bữa tiệc BBQ'),(735,106,0,45,'container2'),(736,104,0,45,'product-full-width'),(737,88,0,45,'/f/0/f0652_2.jpg'),(738,135,0,45,'/f/0/f0652_2.jpg'),(739,89,0,45,'/f/0/f0652_2.jpg'),(740,123,0,45,'b-a-ti-c-bbq'),(745,134,0,46,'2'),(746,87,0,46,'/f/1/f1279_1.jpg'),(747,86,0,46,'Chảo bếp thần kì '),(748,84,0,46,'Chảo bếp thần kì'),(749,120,0,46,'0'),(750,73,0,46,'Chảo bếp thần kì'),(751,106,0,46,'container2'),(752,104,0,46,'product-full-width'),(753,88,0,46,'/f/1/f1279_1.jpg'),(754,135,0,46,'/f/1/f1279_1.jpg'),(755,89,0,46,'/f/1/f1279_1.jpg'),(756,123,0,46,'ch-o-b-p-th-n-ki'),(761,134,0,47,'2'),(762,87,0,47,'/m/y/mykingdom-e6642_2_.jpg'),(763,86,0,47,'Que kem 7 màu '),(764,84,0,47,'Que kem 7 màu'),(765,120,0,47,'0'),(766,73,0,47,'Que kem 7 màu'),(767,106,0,47,'container2'),(768,104,0,47,'product-full-width'),(769,88,0,47,'/m/y/mykingdom-e6642_2_.jpg'),(770,135,0,47,'/m/y/mykingdom-e6642_2_.jpg'),(771,89,0,47,'/m/y/mykingdom-e6642_2_.jpg'),(772,123,0,47,'que-kem-7-mau'),(777,134,0,48,'2'),(778,87,0,48,'/6/5/651274-tiki-th.jpg'),(779,86,0,48,'Đồ chơi phóng banh vui nhộn '),(780,84,0,48,'Đồ chơi phóng banh vui nhộn'),(781,120,0,48,'0'),(782,73,0,48,'Đồ chơi phóng banh vui nhộn'),(783,106,0,48,'container2'),(784,104,0,48,'product-full-width'),(785,88,0,48,'/6/5/651274-tiki-th.jpg'),(786,135,0,48,'/6/5/651274-tiki-th.jpg'),(787,89,0,48,'/6/5/651274-tiki-th.jpg'),(788,123,0,48,'d-choi-phong-banh-vui-nh-n'),(793,134,0,49,'2'),(794,87,0,49,'/8/3/836-mykingdom.jpg'),(795,86,0,49,'Xe cứu thương đa năng '),(796,84,0,49,'Xe cứu thương đa năng'),(797,120,0,49,'0'),(798,73,0,49,'Xe cứu thương đa năng'),(799,106,0,49,'container2'),(800,104,0,49,'product-full-width'),(801,88,0,49,'/8/3/836-mykingdom.jpg'),(802,135,0,49,'/8/3/836-mykingdom.jpg'),(803,89,0,49,'/8/3/836-mykingdom.jpg'),(804,123,0,49,'xe-c-u-thuong-da-nang'),(809,134,0,50,'2'),(810,87,0,50,'/8/8/889-191-tiki-at.jpg'),(811,86,0,50,'Bữa tiệc nhạc nước câu vịt - Màu xanh '),(812,84,0,50,'Bữa tiệc nhạc nước câu vịt - Màu xanh'),(813,120,0,50,'0'),(814,73,0,50,'Bữa tiệc nhạc nước câu vịt - Màu xanh'),(815,106,0,50,'container2'),(816,104,0,50,'product-full-width'),(817,88,0,50,'/8/8/889-191-tiki-at.jpg'),(818,135,0,50,'/8/8/889-191-tiki-at.jpg'),(819,89,0,50,'/8/8/889-191-tiki-at.jpg'),(820,123,0,50,'b-a-ti-c-nh-c-nu-c-cau-v-t-mau-xanh');
/*!40000 ALTER TABLE `catalog_product_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_frontend_action`
--

DROP TABLE IF EXISTS `catalog_product_frontend_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_frontend_action` (
  `action_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Action ID',
  `type_id` varchar(64) NOT NULL COMMENT 'Type of product action',
  `visitor_id` int unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `added_at` bigint NOT NULL COMMENT 'Added At',
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_VISITOR_ID_PRODUCT_ID_TYPE_ID` (`visitor_id`,`product_id`,`type_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_CUSTOMER_ID_PRODUCT_ID_TYPE_ID` (`customer_id`,`product_id`,`type_id`),
  KEY `CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_FRONTEND_ACTION_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Frontend Action Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_frontend_action`
--

LOCK TABLES `catalog_product_frontend_action` WRITE;
/*!40000 ALTER TABLE `catalog_product_frontend_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_frontend_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav`
--

DROP TABLE IF EXISTS `catalog_product_index_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` int unsigned NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav`
--

LOCK TABLES `catalog_product_index_eav` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav` DISABLE KEYS */;
INSERT INTO `catalog_product_index_eav` VALUES (1,99,1,4,1),(2,99,1,4,2),(3,99,1,4,3),(4,99,1,4,4),(5,99,1,4,5),(6,99,1,4,6),(7,99,1,4,7),(8,99,1,4,8),(9,99,1,4,9),(10,99,1,4,10),(11,99,1,4,11),(12,99,1,4,12),(13,99,1,4,13),(14,99,1,4,14),(15,99,1,4,15),(16,99,1,4,16),(17,99,1,4,17),(18,99,1,4,18),(19,99,1,4,19),(20,99,1,4,20),(21,99,1,4,21),(22,99,1,4,22),(23,99,1,4,23),(24,99,1,4,24),(25,99,1,4,25),(26,99,1,4,26),(27,99,1,4,27),(28,99,1,4,28),(29,99,1,4,29),(30,99,1,4,30),(31,99,1,4,31),(32,99,1,4,32),(33,99,1,4,33),(34,99,1,4,34),(35,99,1,4,35),(36,99,1,4,36),(37,99,1,4,37),(38,99,1,4,38),(39,99,1,4,39),(40,99,1,4,40),(41,99,1,4,41),(42,99,1,4,42),(43,99,1,4,43),(44,99,1,4,44),(45,99,1,4,45),(46,99,1,4,46),(47,99,1,4,47),(48,99,1,4,48),(49,99,1,4,49),(50,99,1,4,50);
/*!40000 ALTER TABLE `catalog_product_index_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav_decimal` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Decimal Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal`
--

LOCK TABLES `catalog_product_index_eav_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav_decimal_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Decimal Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal_idx`
--

LOCK TABLES `catalog_product_index_eav_decimal_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal_replica`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav_decimal_replica` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Decimal Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal_replica`
--

LOCK TABLES `catalog_product_index_eav_decimal_replica` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal_tmp`
--

LOCK TABLES `catalog_product_index_eav_decimal_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` int unsigned NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_idx`
--

LOCK TABLES `catalog_product_index_eav_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_replica`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav_replica` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` int unsigned NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_replica`
--

LOCK TABLES `catalog_product_index_eav_replica` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_eav_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` int unsigned NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_tmp`
--

LOCK TABLES `catalog_product_index_eav_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price`
--

DROP TABLE IF EXISTS `catalog_product_index_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price`
--

LOCK TABLES `catalog_product_index_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_bundle_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price_type` smallint unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(20,6) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(20,6) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_idx`
--

LOCK TABLES `catalog_product_index_price_bundle_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Opt Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_opt_idx`
--

LOCK TABLES `catalog_product_index_price_bundle_opt_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Opt Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_opt_tmp`
--

LOCK TABLES `catalog_product_index_price_bundle_opt_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_sel_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `selection_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Selection ID',
  `group_type` smallint unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Sel Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_sel_idx`
--

LOCK TABLES `catalog_product_index_price_bundle_sel_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_sel_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `selection_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Selection ID',
  `group_type` smallint unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Sel Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_sel_tmp`
--

LOCK TABLES `catalog_product_index_price_bundle_sel_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_bundle_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price_type` smallint unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(20,6) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(20,6) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_tmp`
--

LOCK TABLES `catalog_product_index_price_bundle_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_agr_idx`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Config Option Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_idx`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Config Option Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_tmp`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_downlod_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_downlod_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Minimum price',
  `max_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Indexer Table for price of downloadable products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_downlod_idx`
--

LOCK TABLES `catalog_product_index_price_downlod_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_downlod_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_downlod_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Minimum price',
  `max_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary Indexer Table for price of downloadable products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_downlod_tmp`
--

LOCK TABLES `catalog_product_index_price_downlod_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_final_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_final_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Final Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_final_idx`
--

LOCK TABLES `catalog_product_index_price_final_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_final_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_final_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_final_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_final_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Final Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_final_tmp`
--

LOCK TABLES `catalog_product_index_price_final_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_final_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_final_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_idx`
--

LOCK TABLES `catalog_product_index_price_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_opt_agr_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_agr_idx`
--

LOCK TABLES `catalog_product_index_price_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_agr_tmp`
--

LOCK TABLES `catalog_product_index_price_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_opt_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Option Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_idx`
--

LOCK TABLES `catalog_product_index_price_opt_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_opt_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Option Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_tmp`
--

LOCK TABLES `catalog_product_index_price_opt_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_replica`
--

DROP TABLE IF EXISTS `catalog_product_index_price_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_replica` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_replica`
--

LOCK TABLES `catalog_product_index_price_replica` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_price_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_TMP_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_TMP_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_tmp`
--

LOCK TABLES `catalog_product_index_price_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_index_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_tier_price` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Tier Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_tier_price`
--

LOCK TABLES `catalog_product_index_tier_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_website`
--

DROP TABLE IF EXISTS `catalog_product_index_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_index_website` (
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `default_store_id` smallint unsigned NOT NULL COMMENT 'Default store ID for website',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT '1' COMMENT 'Rate',
  PRIMARY KEY (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`),
  CONSTRAINT `CAT_PRD_IDX_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Website Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_website`
--

LOCK TABLES `catalog_product_index_website` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_website` DISABLE KEYS */;
INSERT INTO `catalog_product_index_website` VALUES (1,1,'2021-11-01',1);
/*!40000 ALTER TABLE `catalog_product_index_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link`
--

DROP TABLE IF EXISTS `catalog_product_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_link` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `linked_product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Linked Product ID',
  `link_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_LINK_LINK_TYPE_ID_PRODUCT_ID_LINKED_PRODUCT_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`),
  CONSTRAINT `CAT_PRD_LNK_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_LNK_LNKED_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product To Product Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link`
--

LOCK TABLES `catalog_product_link` WRITE;
/*!40000 ALTER TABLE `catalog_product_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Link Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute`
--

LOCK TABLES `catalog_product_link_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute` DISABLE KEYS */;
INSERT INTO `catalog_product_link_attribute` VALUES (1,1,'position','int'),(2,4,'position','int'),(3,5,'position','int'),(4,3,'position','int'),(5,3,'qty','decimal');
/*!40000 ALTER TABLE `catalog_product_link_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute_decimal`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_link_attribute_decimal` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int unsigned NOT NULL COMMENT 'Link ID',
  `value` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_DEC_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AB2EFA9A14F7BCF1D5400056203D14B6` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Link Decimal Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute_decimal`
--

LOCK TABLES `catalog_product_link_attribute_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute_int`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_link_attribute_int` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int unsigned NOT NULL COMMENT 'Link ID',
  `value` int NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_INT_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D6D878F8BA2A4282F8DDED7E6E3DE35C` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Link Integer Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute_int`
--

LOCK TABLES `catalog_product_link_attribute_int` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute_varchar`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_link_attribute_varchar` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Product Link Attribute ID',
  `link_id` int unsigned NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_VCHR_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DEE9C4DA61CFCC01DFCF50F0D79CEA51` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Link Varchar Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute_varchar`
--

LOCK TABLES `catalog_product_link_attribute_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_type`
--

DROP TABLE IF EXISTS `catalog_product_link_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_link_type` (
  `link_type_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Link Type Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_type`
--

LOCK TABLES `catalog_product_link_type` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_type` DISABLE KEYS */;
INSERT INTO `catalog_product_link_type` VALUES (1,'relation'),(3,'super'),(4,'up_sell'),(5,'cross_sell');
/*!40000 ALTER TABLE `catalog_product_link_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option`
--

DROP TABLE IF EXISTS `catalog_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint NOT NULL DEFAULT '1' COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int unsigned DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint unsigned DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint unsigned DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_OPT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option`
--

LOCK TABLES `catalog_product_option` WRITE;
/*!40000 ALTER TABLE `catalog_product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_price`
--

DROP TABLE IF EXISTS `catalog_product_option_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_option_price` (
  `option_price_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_OPT_PRICE_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_price`
--

LOCK TABLES `catalog_product_option_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_title`
--

DROP TABLE IF EXISTS `catalog_product_option_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_option_title` (
  `option_title_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_OPT_TTL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_title`
--

LOCK TABLES `catalog_product_option_title` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_type_price`
--

DROP TABLE IF EXISTS `catalog_product_option_type_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_option_type_price` (
  `option_type_price_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID',
  `option_type_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B523E3378E8602F376CC415825576B7F` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Type Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_type_price`
--

LOCK TABLES `catalog_product_option_type_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_type_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_type_title`
--

DROP TABLE IF EXISTS `catalog_product_option_type_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_option_type_title` (
  `option_type_title_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID',
  `option_type_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C085B9CF2C2A302E8043FDEA1937D6A2` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Type Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_type_title`
--

LOCK TABLES `catalog_product_option_type_title` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_type_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_type_value`
--

DROP TABLE IF EXISTS `catalog_product_option_type_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_option_type_value` (
  `option_type_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`),
  CONSTRAINT `CAT_PRD_OPT_TYPE_VAL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Type Value Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_type_value`
--

LOCK TABLES `catalog_product_option_type_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_type_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_relation`
--

DROP TABLE IF EXISTS `catalog_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_relation` (
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int unsigned NOT NULL COMMENT 'Child ID',
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`),
  CONSTRAINT `CAT_PRD_RELATION_CHILD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_RELATION_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Relation Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_relation`
--

LOCK TABLES `catalog_product_relation` WRITE;
/*!40000 ALTER TABLE `catalog_product_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_attribute`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_super_attribute` (
  `product_super_attribute_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `position` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`product_super_attribute_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`),
  CONSTRAINT `CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Super Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_attribute`
--

LOCK TABLES `catalog_product_super_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_attribute_label`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_super_attribute_label` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `use_default` smallint unsigned DEFAULT '0' COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_309442281DF7784210ED82B2CC51E5D5` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Super Attribute Label Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_attribute_label`
--

LOCK TABLES `catalog_product_super_attribute_label` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_link`
--

DROP TABLE IF EXISTS `catalog_product_super_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_super_link` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  KEY `CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`),
  CONSTRAINT `CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_SPR_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Super Link Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_link`
--

LOCK TABLES `catalog_product_super_link` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_website`
--

DROP TABLE IF EXISTS `catalog_product_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product_website` (
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_WS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product To Website Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_website`
--

LOCK TABLES `catalog_product_website` WRITE;
/*!40000 ALTER TABLE `catalog_product_website` DISABLE KEYS */;
INSERT INTO `catalog_product_website` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1);
/*!40000 ALTER TABLE `catalog_product_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_url_rewrite_product_category`
--

DROP TABLE IF EXISTS `catalog_url_rewrite_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_url_rewrite_product_category` (
  `url_rewrite_id` int unsigned NOT NULL COMMENT 'url_rewrite_id',
  `category_id` int unsigned NOT NULL COMMENT 'category_id',
  `product_id` int unsigned NOT NULL COMMENT 'product_id',
  PRIMARY KEY (`url_rewrite_id`),
  KEY `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  KEY `CATALOG_URL_REWRITE_PRODUCT_CATEGORY_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BB79E64705D7F17FE181F23144528FC8` FOREIGN KEY (`url_rewrite_id`) REFERENCES `url_rewrite` (`url_rewrite_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='url_rewrite_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_url_rewrite_product_category`
--

LOCK TABLES `catalog_url_rewrite_product_category` WRITE;
/*!40000 ALTER TABLE `catalog_url_rewrite_product_category` DISABLE KEYS */;
INSERT INTO `catalog_url_rewrite_product_category` VALUES (11,3,1),(13,3,2),(15,3,3),(33,3,4),(31,3,5),(29,3,6),(27,3,7),(25,3,8),(23,3,9),(35,3,10),(37,4,11),(39,4,12),(41,4,13),(43,4,14),(45,4,15),(47,4,16),(49,4,17),(51,4,18),(53,4,19),(55,4,20),(57,5,21),(59,5,22),(61,5,23),(63,5,24),(65,5,25),(67,5,26),(69,5,27),(71,5,28),(73,5,29),(75,5,30),(77,6,31),(79,6,32),(81,6,33),(83,6,34),(85,6,35),(87,6,36),(89,6,37),(91,6,38),(93,6,39),(95,6,40),(97,7,41),(99,7,42),(101,7,43),(103,7,44),(105,7,45),(107,7,46),(109,7,47),(111,7,48),(113,7,49),(115,7,50);
/*!40000 ALTER TABLE `catalog_url_rewrite_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock`
--

DROP TABLE IF EXISTS `cataloginventory_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cataloginventory_stock` (
  `stock_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Stock ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name',
  PRIMARY KEY (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock`
--

LOCK TABLES `cataloginventory_stock` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock` DISABLE KEYS */;
INSERT INTO `cataloginventory_stock` VALUES (1,0,'Default');
/*!40000 ALTER TABLE `cataloginventory_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_item`
--

DROP TABLE IF EXISTS `cataloginventory_stock_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cataloginventory_stock_item` (
  `item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `stock_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Stock ID',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Min Qty',
  `use_config_min_qty` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Qty Decimal',
  `backorders` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Backorders',
  `use_config_backorders` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID` (`product_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID_PRODUCT_ID` (`website_id`,`product_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`),
  CONSTRAINT `CATINV_STOCK_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATINV_STOCK_ITEM_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_item`
--

LOCK TABLES `cataloginventory_stock_item` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_item` DISABLE KEYS */;
INSERT INTO `cataloginventory_stock_item` VALUES (1,1,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 13:21:48',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(2,2,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 13:24:31',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(3,3,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 13:27:33',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(4,4,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 13:36:47',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(5,5,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 13:36:36',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(6,6,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 13:36:24',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(7,7,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 13:36:17',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(8,8,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 13:35:37',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(9,9,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 13:34:54',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(10,10,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 13:37:40',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(11,11,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 15:42:42',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(12,12,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 15:44:10',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(13,13,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 15:45:15',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(14,14,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 15:46:14',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(15,15,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 15:47:32',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(16,16,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 15:51:33',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(17,17,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 15:52:32',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(18,18,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 15:53:34',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(19,19,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 15:55:15',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(20,20,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 15:56:08',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(21,21,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 16:02:44',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(22,22,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 16:03:59',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(23,23,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 16:04:46',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(24,24,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 16:05:30',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(25,25,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 16:06:13',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(26,26,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 16:06:57',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(27,27,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 16:07:30',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(28,28,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 16:08:21',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(29,29,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 16:09:19',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(30,30,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 16:10:06',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(31,31,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:00:23',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(32,32,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:02:25',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(33,33,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:03:04',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(34,34,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:03:45',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(35,35,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:04:34',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(36,36,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:05:12',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(37,37,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:05:59',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(38,38,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:06:38',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(39,39,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:07:13',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(40,40,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:08:02',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(41,41,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:09:18',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(42,42,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:09:58',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(43,43,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:10:35',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(44,44,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:13:39',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(45,45,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:15:10',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(46,46,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:15:54',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(47,47,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:16:35',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(48,48,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:17:18',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(49,49,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:18:15',1.0000,1,1,1,1,1,1.0000,1,0,0,0),(50,50,1,0.0000,0.0000,1,0,0,1,1.0000,1,10000.0000,1,0,'2021-10-31 17:18:47',1.0000,1,1,1,1,1,1.0000,1,0,0,0);
/*!40000 ALTER TABLE `cataloginventory_stock_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cataloginventory_stock_status` (
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint unsigned NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status`
--

LOCK TABLES `cataloginventory_stock_status` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status` DISABLE KEYS */;
INSERT INTO `cataloginventory_stock_status` VALUES (1,0,1,0.0000,0),(2,0,1,0.0000,0),(3,0,1,0.0000,0),(4,0,1,0.0000,0),(5,0,1,0.0000,0),(6,0,1,0.0000,0),(7,0,1,0.0000,0),(8,0,1,0.0000,0),(9,0,1,0.0000,0),(10,0,1,0.0000,0),(11,0,1,0.0000,0),(12,0,1,0.0000,0),(13,0,1,0.0000,0),(14,0,1,0.0000,0),(15,0,1,0.0000,0),(16,0,1,0.0000,0),(17,0,1,0.0000,0),(18,0,1,0.0000,0),(19,0,1,0.0000,0),(20,0,1,0.0000,0),(21,0,1,0.0000,0),(22,0,1,0.0000,0),(23,0,1,0.0000,0),(24,0,1,0.0000,0),(25,0,1,0.0000,0),(26,0,1,0.0000,0),(27,0,1,0.0000,0),(28,0,1,0.0000,0),(29,0,1,0.0000,0),(30,0,1,0.0000,0),(31,0,1,0.0000,0),(32,0,1,0.0000,0),(33,0,1,0.0000,0),(34,0,1,0.0000,0),(35,0,1,0.0000,0),(36,0,1,0.0000,0),(37,0,1,0.0000,0),(38,0,1,0.0000,0),(39,0,1,0.0000,0),(40,0,1,0.0000,0),(41,0,1,0.0000,0),(42,0,1,0.0000,0),(43,0,1,0.0000,0),(44,0,1,0.0000,0),(45,0,1,0.0000,0),(46,0,1,0.0000,0),(47,0,1,0.0000,0),(48,0,1,0.0000,0),(49,0,1,0.0000,0),(50,0,1,0.0000,0);
/*!40000 ALTER TABLE `cataloginventory_stock_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status_idx`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cataloginventory_stock_status_idx` (
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint unsigned NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock Status Indexer Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status_idx`
--

LOCK TABLES `cataloginventory_stock_status_idx` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `cataloginventory_stock_status_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status_replica`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cataloginventory_stock_status_replica` (
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint unsigned NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status_replica`
--

LOCK TABLES `cataloginventory_stock_status_replica` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `cataloginventory_stock_status_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status_tmp`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cataloginventory_stock_status_tmp` (
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint unsigned NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock Status Indexer Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status_tmp`
--

LOCK TABLES `cataloginventory_stock_status_tmp` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `cataloginventory_stock_status_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule`
--

DROP TABLE IF EXISTS `catalogrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule` (
  `rule_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `is_active` smallint NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Discount Amount',
  PRIMARY KEY (`rule_id`),
  KEY `CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule`
--

LOCK TABLES `catalogrule` WRITE;
/*!40000 ALTER TABLE `catalogrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_customer_group`
--

DROP TABLE IF EXISTS `catalogrule_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_customer_group` (
  `rule_id` int unsigned NOT NULL COMMENT 'Rule ID',
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CATALOGRULE_CUSTOMER_GROUP_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `CATRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Rules To Customer Groups Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_customer_group`
--

LOCK TABLES `catalogrule_customer_group` WRITE;
/*!40000 ALTER TABLE `catalogrule_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_group_website`
--

DROP TABLE IF EXISTS `catalogrule_group_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_group_website` (
  `rule_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Group Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_group_website`
--

LOCK TABLES `catalogrule_group_website` WRITE;
/*!40000 ALTER TABLE `catalogrule_group_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_group_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_group_website_replica`
--

DROP TABLE IF EXISTS `catalogrule_group_website_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_group_website_replica` (
  `rule_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Group Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_group_website_replica`
--

LOCK TABLES `catalogrule_group_website_replica` WRITE;
/*!40000 ALTER TABLE `catalogrule_group_website_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_group_website_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_product`
--

DROP TABLE IF EXISTS `catalogrule_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_product` (
  `rule_product_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product ID',
  `rule_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `from_time` int unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Action Amount',
  `action_stop` smallint NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `UNQ_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_product`
--

LOCK TABLES `catalogrule_product` WRITE;
/*!40000 ALTER TABLE `catalogrule_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_product_price`
--

DROP TABLE IF EXISTS `catalogrule_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_product_price` (
  `rule_product_price_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `rule_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Rule Price',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Product Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_product_price`
--

LOCK TABLES `catalogrule_product_price` WRITE;
/*!40000 ALTER TABLE `catalogrule_product_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_product_price_replica`
--

DROP TABLE IF EXISTS `catalogrule_product_price_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_product_price_replica` (
  `rule_product_price_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `rule_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Rule Price',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Product Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_product_price_replica`
--

LOCK TABLES `catalogrule_product_price_replica` WRITE;
/*!40000 ALTER TABLE `catalogrule_product_price_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_product_price_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_product_replica`
--

DROP TABLE IF EXISTS `catalogrule_product_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_product_replica` (
  `rule_product_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product ID',
  `rule_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `from_time` int unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Action Amount',
  `action_stop` smallint NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `UNQ_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_product_replica`
--

LOCK TABLES `catalogrule_product_replica` WRITE;
/*!40000 ALTER TABLE `catalogrule_product_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_product_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_website`
--

DROP TABLE IF EXISTS `catalogrule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogrule_website` (
  `rule_id` int unsigned NOT NULL COMMENT 'Rule ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CATALOGRULE_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOGRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Rules To Websites Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_website`
--

LOCK TABLES `catalogrule_website` WRITE;
/*!40000 ALTER TABLE `catalogrule_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogsearch_recommendations`
--

DROP TABLE IF EXISTS `catalogsearch_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogsearch_recommendations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `query_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Query ID',
  `relation_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Relation ID',
  PRIMARY KEY (`id`),
  KEY `CATALOGSEARCH_RECOMMENDATIONS_QUERY_ID_SEARCH_QUERY_QUERY_ID` (`query_id`),
  KEY `CATALOGSEARCH_RECOMMENDATIONS_RELATION_ID_SEARCH_QUERY_QUERY_ID` (`relation_id`),
  CONSTRAINT `CATALOGSEARCH_RECOMMENDATIONS_QUERY_ID_SEARCH_QUERY_QUERY_ID` FOREIGN KEY (`query_id`) REFERENCES `search_query` (`query_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOGSEARCH_RECOMMENDATIONS_RELATION_ID_SEARCH_QUERY_QUERY_ID` FOREIGN KEY (`relation_id`) REFERENCES `search_query` (`query_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Advanced Search Recommendations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogsearch_recommendations`
--

LOCK TABLES `catalogsearch_recommendations` WRITE;
/*!40000 ALTER TABLE `catalogsearch_recommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogsearch_recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_agreement`
--

DROP TABLE IF EXISTS `checkout_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout_agreement` (
  `agreement_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text COMMENT 'Checkbox Text',
  `is_active` smallint NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `is_html` smallint NOT NULL DEFAULT '0' COMMENT 'Is Html',
  `mode` smallint NOT NULL DEFAULT '0' COMMENT 'Applied mode',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Checkout Agreement';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_agreement`
--

LOCK TABLES `checkout_agreement` WRITE;
/*!40000 ALTER TABLE `checkout_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_agreement_store`
--

DROP TABLE IF EXISTS `checkout_agreement_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout_agreement_store` (
  `agreement_id` int unsigned NOT NULL COMMENT 'Agreement ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`agreement_id`,`store_id`),
  KEY `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CHKT_AGRT_STORE_AGRT_ID_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Checkout Agreement Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_agreement_store`
--

LOCK TABLES `checkout_agreement_store` WRITE;
/*!40000 ALTER TABLE `checkout_agreement_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_agreement_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_block`
--

DROP TABLE IF EXISTS `cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_block` (
  `block_id` smallint NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext COMMENT 'Block Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Block Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Block Modification Time',
  `is_active` smallint NOT NULL DEFAULT '1' COMMENT 'Is Block Active',
  PRIMARY KEY (`block_id`),
  FULLTEXT KEY `CMS_BLOCK_TITLE_IDENTIFIER_CONTENT` (`title`,`identifier`,`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CMS Block Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_block`
--

LOCK TABLES `cms_block` WRITE;
/*!40000 ALTER TABLE `cms_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_block_store`
--

DROP TABLE IF EXISTS `cms_block_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_block_store` (
  `block_id` smallint NOT NULL,
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `CMS_BLOCK_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CMS_BLOCK_STORE_BLOCK_ID_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE,
  CONSTRAINT `CMS_BLOCK_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CMS Block To Store Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_block_store`
--

LOCK TABLES `cms_block_store` WRITE;
/*!40000 ALTER TABLE `cms_block_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_block_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_page` (
  `page_id` smallint NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `meta_keywords` text COMMENT 'Page Meta Keywords',
  `meta_description` text COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext COMMENT 'Page Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Page Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Page Modification Time',
  `is_active` smallint NOT NULL DEFAULT '1' COMMENT 'Is Page Active',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Page Sort Order',
  `layout_update_xml` text COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text COMMENT 'Page Custom Layout Update Content',
  `layout_update_selected` varchar(128) DEFAULT NULL COMMENT 'Page Custom Layout File',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'Page Meta Title',
  PRIMARY KEY (`page_id`),
  KEY `CMS_PAGE_IDENTIFIER` (`identifier`),
  FULLTEXT KEY `CMS_PAGE_TITLE_META_KEYWORDS_META_DESCRIPTION_IDENTIFIER_CONTENT` (`title`,`meta_keywords`,`meta_description`,`identifier`,`content`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='CMS Page Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` VALUES (1,'404 Not Found','2columns-right','Page keywords','Page description','no-route','Whoops, our bad...','<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a> <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li></ul></dd></dl>\r\n','2021-10-30 14:47:43','2021-10-30 14:47:43',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Home page','1column',NULL,NULL,'home','Home Page','<p>CMS homepage content goes here.</p>\r\n','2021-10-30 14:47:43','2021-10-30 14:47:48',1,0,'<!--\n    <referenceContainer name=\"right\">\n        <referenceBlock name=\"catalog.compare.sidebar\" remove=\"true\" />\n    </referenceContainer>-->',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Enable Cookies','1column',NULL,NULL,'enable-cookies','What are Cookies?','<div class=\"enable-cookies cms-content\">\r\n<p>\"Cookies\" are little pieces of data we send when you visit our store. Cookies help us get to know you better and personalize your experience. Plus they help protect you and other shoppers from fraud.</p>\r\n<p style=\"margin-bottom: 20px;\">Set your browser to accept cookies so you can buy items, save items, and receive customized recommendations. Here’s how:</p>\r\n<ul>\r\n<li><a href=\"https://support.google.com/accounts/answer/61416?hl=en\" target=\"_blank\">Google Chrome</a></li>\r\n<li><a href=\"http://windows.microsoft.com/en-us/internet-explorer/delete-manage-cookies\" target=\"_blank\">Internet Explorer</a></li>\r\n<li><a href=\"http://support.apple.com/kb/PH19214\" target=\"_blank\">Safari</a></li>\r\n<li><a href=\"https://support.mozilla.org/en-US/kb/enable-and-disable-cookies-website-preferences\" target=\"_blank\">Mozilla/Firefox</a></li>\r\n</ul>\r\n</div>','2021-10-30 14:47:43','2021-10-30 14:47:43',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Privacy and Cookie Policy','1column',NULL,NULL,'privacy-policy-cookie-restriction-mode','Privacy and Cookie Policy','<div class=\"privacy-policy cms-content\">\n    <div class=\"message info\">\n        <span>\n            Please replace this text with you Privacy Policy.\n            Please add any additional cookies your website uses below (e.g. Google Analytics).\n        </span>\n    </div>\n    <p>\n        This privacy policy sets out how this website (hereafter \"the Store\") uses and protects any information that\n        you give the Store while using this website. The Store is committed to ensuring that your privacy is protected.\n        Should we ask you to provide certain information by which you can be identified when using this website, then\n        you can be assured that it will only be used in accordance with this privacy statement. The Store may change\n        this policy from time to time by updating this page. You should check this page from time to time to ensure\n        that you are happy with any changes.\n    </p>\n    <h2>What we collect</h2>\n    <p>We may collect the following information:</p>\n    <ul>\n        <li>name</li>\n        <li>contact information including email address</li>\n        <li>demographic information such as postcode, preferences and interests</li>\n        <li>other information relevant to customer surveys and/or offers</li>\n    </ul>\n    <p>\n        For the exhaustive list of cookies we collect see the <a href=\"#list\">List of cookies we collect</a> section.\n    </p>\n    <h2>What we do with the information we gather</h2>\n    <p>\n        We require this information to understand your needs and provide you with a better service,\n        and in particular for the following reasons:\n    </p>\n    <ul>\n        <li>Internal record keeping.</li>\n        <li>We may use the information to improve our products and services.</li>\n        <li>\n            We may periodically send promotional emails about new products, special offers or other information which we\n            think you may find interesting using the email address which you have provided.\n        </li>\n        <li>\n            From time to time, we may also use your information to contact you for market research purposes.\n            We may contact you by email, phone, fax or mail. We may use the information to customise the website\n            according to your interests.\n        </li>\n    </ul>\n    <h2>Security</h2>\n    <p>\n        We are committed to ensuring that your information is secure. In order to prevent unauthorised access or\n        disclosure, we have put in place suitable physical, electronic and managerial procedures to safeguard and\n        secure the information we collect online.\n    </p>\n    <h2>How we use cookies</h2>\n    <p>\n        A cookie is a small file which asks permission to be placed on your computer\'s hard drive.\n        Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n        a particular site. Cookies allow web applications to respond to you as an individual. The web application\n        can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n        your preferences.\n    </p>\n    <p>\n        We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page\n        traffic and improve our website in order to tailor it to customer needs. We only use this information for\n        statistical analysis purposes and then the data is removed from the system.\n    </p>\n    <p>\n        Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find\n        useful and which you do not. A cookie in no way gives us access to your computer or any information about you,\n        other than the data you choose to share with us. You can choose to accept or decline cookies.\n        Most web browsers automatically accept cookies, but you can usually modify your browser setting\n        to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n    </p>\n    <h2>Links to other websites</h2>\n    <p>\n        Our website may contain links to other websites of interest. However, once you have used these links\n        to leave our site, you should note that we do not have any control over that other website.\n        Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n        visiting such sites and such sites are not governed by this privacy statement.\n        You should exercise caution and look at the privacy statement applicable to the website in question.\n    </p>\n    <h2>Controlling your personal information</h2>\n    <p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n    <ul>\n        <li>\n            whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n            that you do not want the information to be used by anybody for direct marketing purposes\n        </li>\n        <li>\n            if you have previously agreed to us using your personal information for direct marketing purposes,\n            you may change your mind at any time by letting us know using our Contact Us information\n        </li>\n    </ul>\n    <p>\n        We will not sell, distribute or lease your personal information to third parties unless we have your permission\n        or are required by law to do so. We may use your personal information to send you promotional information\n        about third parties which we think you may find interesting if you tell us that you wish this to happen.\n    </p>\n    <p>\n        You may request details of personal information which we hold about you under the Data Protection Act 1998.\n        A small fee will be payable. If you would like a copy of the information held on you please email us this\n        request using our Contact Us information.\n    </p>\n    <p>\n        If you believe that any information we are holding on you is incorrect or incomplete,\n        please write to or email us as soon as possible, at the above address.\n        We will promptly correct any information found to be incorrect.\n    </p>\n    <h2><a name=\"list\"></a>List of cookies we collect</h2>\n    <p>The table below lists the cookies we collect and what information they store.</p>\n    <table class=\"data-table data-table-definition-list\">\n        <thead>\n        <tr>\n            <th>Cookie Name</th>\n            <th>Cookie Description</th>\n        </tr>\n        </thead>\n        <tbody>\n            <tr>\n                <th>FORM_KEY</th>\n                <td>Stores randomly generated key used to prevent forged requests.</td>\n            </tr>\n            <tr>\n                <th>PHPSESSID</th>\n                <td>Your session ID on the server.</td>\n            </tr>\n            <tr>\n                <th>GUEST-VIEW</th>\n                <td>Allows guests to view and edit their orders.</td>\n            </tr>\n            <tr>\n                <th>PERSISTENT_SHOPPING_CART</th>\n                <td>A link to information about your cart and viewing history, if you have asked for this.</td>\n            </tr>\n            <tr>\n                <th>STF</th>\n                <td>Information on products you have emailed to friends.</td>\n            </tr>\n            <tr>\n                <th>STORE</th>\n                <td>The store view or language you have selected.</td>\n            </tr>\n            <tr>\n                <th>USER_ALLOWED_SAVE_COOKIE</th>\n                <td>Indicates whether a customer allowed to use cookies.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-SESSID</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE-SECTION-INVALIDATION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-TIMEOUT</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>SECTION-DATA-IDS</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>PRIVATE_CONTENT_VERSION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>X-MAGENTO-VARY</th>\n                <td>Facilitates caching of content on the server to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-FILE-VERSION</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-STORAGE</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n        </tbody>\n    </table>\n</div>','2021-10-30 14:47:43','2021-10-30 14:47:43',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_store`
--

DROP TABLE IF EXISTS `cms_page_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_page_store` (
  `page_id` smallint NOT NULL COMMENT 'Entity ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `CMS_PAGE_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CMS_PAGE_STORE_PAGE_ID_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE,
  CONSTRAINT `CMS_PAGE_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CMS Page To Store Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_store`
--

LOCK TABLES `cms_page_store` WRITE;
/*!40000 ALTER TABLE `cms_page_store` DISABLE KEYS */;
INSERT INTO `cms_page_store` VALUES (1,0),(2,0),(3,0),(4,0);
/*!40000 ALTER TABLE `cms_page_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config_data`
--

DROP TABLE IF EXISTS `core_config_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_config_data` (
  `config_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Config ID',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int NOT NULL DEFAULT '0' COMMENT 'Config Scope ID',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COMMENT='Config Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config_data`
--

LOCK TABLES `core_config_data` WRITE;
/*!40000 ALTER TABLE `core_config_data` DISABLE KEYS */;
INSERT INTO `core_config_data` VALUES (1,'default',0,'yotpo/module_info/yotpo_installation_date','2021-10-30','2021-10-30 14:07:47'),(2,'default',0,'yotpo/sync_settings/orders_sync_start_date','2021-10-30','2021-10-30 14:07:47'),(3,'default',0,'web/seo/use_rewrites','1','2021-10-30 14:47:38'),(4,'default',0,'web/unsecure/base_url','http://ec2-18-136-195-83.ap-southeast-1.compute.amazonaws.com/','2021-10-30 14:47:38'),(5,'default',0,'general/locale/code','vi_VN','2021-10-30 14:47:38'),(6,'default',0,'general/locale/timezone','Asia/Ho_Chi_Minh','2021-10-30 15:12:11'),(7,'default',0,'currency/options/base','VND','2021-10-30 14:47:38'),(8,'default',0,'currency/options/default','VND','2021-10-30 14:47:38'),(9,'default',0,'currency/options/allow','VND','2021-10-30 14:47:38'),(10,'default',0,'general/region/display_all','1','2021-10-30 14:47:39'),(11,'default',0,'general/region/state_required','VN','2021-10-30 15:12:11'),(12,'default',0,'catalog/category/root_id','2','2021-10-30 14:47:44'),(13,'default',0,'analytics/subscription/enabled','1','2021-10-30 14:47:48'),(14,'default',0,'crontab/default/jobs/analytics_subscribe/schedule/cron_expr','0 * * * *','2021-10-30 14:47:48'),(15,'default',0,'crontab/default/jobs/analytics_collect_data/schedule/cron_expr','00 02 * * *','2021-10-30 14:47:48'),(16,'default',0,'msp_securitysuite_recaptcha/frontend/enabled','0','2021-10-30 14:47:49'),(17,'default',0,'msp_securitysuite_recaptcha/backend/enabled','0','2021-10-30 14:47:49'),(18,'default',0,'connector_dynamic_content/external_dynamic_content_urls/passcode','5tNZzto8MVBu8mzgBOfRDUfwbtsr84Fb','2021-10-30 14:47:49'),(19,'default',0,'connector_developer_settings/system_alerts/user_roles','1','2021-10-30 14:47:49'),(20,'default',0,'admin/usage/enabled','0','2021-10-30 15:08:39'),(21,'default',0,'general/country/default','VN','2021-10-30 15:12:11'),(22,'default',0,'general/country/destinations',NULL,'2021-10-30 15:12:11'),(23,'default',0,'general/store_information/name',NULL,'2021-10-30 15:12:11'),(24,'default',0,'general/store_information/phone',NULL,'2021-10-30 15:12:11'),(25,'default',0,'general/store_information/hours',NULL,'2021-10-30 15:12:11'),(26,'default',0,'general/store_information/country_id',NULL,'2021-10-30 15:12:11'),(27,'default',0,'general/store_information/region_id',NULL,'2021-10-30 15:12:11'),(28,'default',0,'general/store_information/postcode',NULL,'2021-10-30 15:12:11'),(29,'default',0,'general/store_information/city',NULL,'2021-10-30 15:12:11'),(30,'default',0,'general/store_information/street_line1',NULL,'2021-10-30 15:12:11'),(31,'default',0,'general/store_information/street_line2',NULL,'2021-10-30 15:12:11'),(32,'default',0,'general/store_information/merchant_vat_number',NULL,'2021-10-30 15:12:11'),(33,'default',0,'general/single_store_mode/enabled','0','2021-10-30 15:12:12');
/*!40000 ALTER TABLE `core_config_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_schedule`
--

DROP TABLE IF EXISTS `cron_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cron_schedule` (
  `schedule_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Schedule ID',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At',
  PRIMARY KEY (`schedule_id`),
  KEY `CRON_SCHEDULE_JOB_CODE_STATUS_SCHEDULED_AT` (`job_code`,`status`,`scheduled_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cron Schedule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_schedule`
--

LOCK TABLES `cron_schedule` WRITE;
/*!40000 ALTER TABLE `cron_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity`
--

DROP TABLE IF EXISTS `customer_address_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address_entity` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `parent_id` int unsigned DEFAULT NULL COMMENT 'Parent ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `country_id` varchar(255) NOT NULL COMMENT 'Country',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `firstname` varchar(255) NOT NULL COMMENT 'First Name',
  `lastname` varchar(255) NOT NULL COMMENT 'Last Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Zip/Postal Code',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `region` varchar(255) DEFAULT NULL COMMENT 'State/Province',
  `region_id` int unsigned DEFAULT NULL COMMENT 'State/Province',
  `street` text NOT NULL COMMENT 'Street Address',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `telephone` varchar(255) NOT NULL COMMENT 'Phone Number',
  `vat_id` varchar(255) DEFAULT NULL COMMENT 'VAT number',
  `vat_is_valid` int unsigned DEFAULT NULL COMMENT 'VAT number validity',
  `vat_request_date` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request date',
  `vat_request_id` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request ID',
  `vat_request_success` int unsigned DEFAULT NULL COMMENT 'VAT number validation request success',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`),
  CONSTRAINT `CUSTOMER_ADDRESS_ENTITY_PARENT_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity`
--

LOCK TABLES `customer_address_entity` WRITE;
/*!40000 ALTER TABLE `customer_address_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_datetime`
--

DROP TABLE IF EXISTS `customer_address_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address_entity_datetime` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity Datetime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_datetime`
--

LOCK TABLES `customer_address_entity_datetime` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_decimal`
--

DROP TABLE IF EXISTS `customer_address_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address_entity_decimal` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_DEC_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity Decimal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_decimal`
--

LOCK TABLES `customer_address_entity_decimal` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_int`
--

DROP TABLE IF EXISTS `customer_address_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address_entity_int` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_INT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity Int';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_int`
--

LOCK TABLES `customer_address_entity_int` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_text`
--

DROP TABLE IF EXISTS `customer_address_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address_entity_text` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_text`
--

LOCK TABLES `customer_address_entity_text` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `customer_address_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address_entity_varchar` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_varchar`
--

LOCK TABLES `customer_address_entity_varchar` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_eav_attribute`
--

DROP TABLE IF EXISTS `customer_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_eav_attribute` (
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `is_visible` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Multiline Count',
  `validate_rules` text COMMENT 'Validate Rules',
  `is_system` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  `is_used_in_grid` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `is_searchable_in_grid` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable in Grid',
  PRIMARY KEY (`attribute_id`),
  KEY `CUSTOMER_EAV_ATTRIBUTE_SORT_ORDER` (`sort_order`),
  CONSTRAINT `CUSTOMER_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Eav Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_eav_attribute`
--

LOCK TABLES `customer_eav_attribute` WRITE;
/*!40000 ALTER TABLE `customer_eav_attribute` DISABLE KEYS */;
INSERT INTO `customer_eav_attribute` VALUES (1,1,NULL,0,NULL,1,10,NULL,1,1,1,0),(2,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(3,1,NULL,0,NULL,1,20,NULL,1,1,0,1),(4,0,NULL,0,NULL,0,30,NULL,0,0,0,0),(5,1,'trim',0,'{\"max_text_length\":255,\"min_text_length\":1}',1,40,NULL,0,0,0,0),(6,0,'trim',0,NULL,0,50,NULL,0,0,0,0),(7,1,'trim',0,'{\"max_text_length\":255,\"min_text_length\":1}',1,60,NULL,0,0,0,0),(8,0,NULL,0,NULL,0,70,NULL,0,0,0,0),(9,1,NULL,0,'{\"input_validation\":\"email\"}',1,80,NULL,1,1,1,1),(10,1,NULL,0,NULL,1,25,NULL,1,1,1,0),(11,0,'date',0,'{\"input_validation\":\"date\"}',0,90,NULL,1,1,1,0),(12,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(13,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(14,0,NULL,0,'{\"input_validation\":\"date\"}',1,0,NULL,0,0,0,0),(15,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(16,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(17,0,NULL,0,'{\"max_text_length\":255}',0,100,NULL,1,1,0,1),(18,0,NULL,0,NULL,1,0,NULL,1,1,1,0),(19,0,NULL,0,NULL,0,0,NULL,1,1,1,0),(20,0,NULL,0,'[]',0,110,NULL,1,1,1,0),(21,1,NULL,0,NULL,1,28,NULL,0,0,0,0),(22,0,NULL,0,NULL,0,10,NULL,0,0,0,0),(23,1,'trim',0,'{\"max_text_length\":255,\"min_text_length\":1}',1,20,NULL,1,0,0,1),(24,0,'trim',0,NULL,0,30,NULL,0,0,0,0),(25,1,'trim',0,'{\"max_text_length\":255,\"min_text_length\":1}',1,40,NULL,1,0,0,1),(26,0,NULL,0,NULL,0,50,NULL,0,0,0,0),(27,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,60,NULL,1,0,0,1),(28,1,NULL,3,'{\"max_text_length\":255,\"min_text_length\":1}',1,70,NULL,1,0,0,1),(29,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,100,NULL,1,0,0,1),(30,1,NULL,0,NULL,1,80,NULL,1,1,1,0),(31,1,NULL,0,NULL,1,90,NULL,1,1,0,1),(32,1,NULL,0,NULL,1,90,NULL,0,0,0,0),(33,1,NULL,0,'[]',1,110,'Magento\\Customer\\Model\\Attribute\\Data\\Postcode',1,1,1,1),(34,1,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',1,120,NULL,1,1,1,1),(35,0,NULL,0,'{\"max_text_length\":255,\"min_text_length\":1}',0,130,NULL,1,0,0,1),(36,1,NULL,0,NULL,1,140,NULL,0,0,0,0),(37,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(38,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(39,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(40,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(41,0,NULL,0,NULL,0,0,NULL,0,0,0,0),(42,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(43,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(44,0,NULL,0,NULL,1,0,NULL,0,0,0,0);
/*!40000 ALTER TABLE `customer_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_eav_attribute_website`
--

DROP TABLE IF EXISTS `customer_eav_attribute_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_eav_attribute_website` (
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `is_visible` smallint unsigned DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint unsigned DEFAULT NULL COMMENT 'Is Required',
  `default_value` text COMMENT 'Default Value',
  `multiline_count` smallint unsigned DEFAULT NULL COMMENT 'Multiline Count',
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSTR_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_EAV_ATTR_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Eav Attribute Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_eav_attribute_website`
--

LOCK TABLES `customer_eav_attribute_website` WRITE;
/*!40000 ALTER TABLE `customer_eav_attribute_website` DISABLE KEYS */;
INSERT INTO `customer_eav_attribute_website` VALUES (1,1,NULL,NULL,NULL,NULL),(3,1,NULL,NULL,NULL,NULL),(5,1,NULL,NULL,NULL,NULL),(6,1,NULL,NULL,NULL,NULL),(7,1,NULL,NULL,NULL,NULL),(9,1,NULL,NULL,NULL,NULL),(10,1,NULL,NULL,NULL,NULL),(11,1,NULL,NULL,NULL,NULL),(17,1,NULL,NULL,NULL,NULL),(18,1,NULL,NULL,NULL,NULL),(19,1,NULL,NULL,NULL,NULL),(20,1,NULL,NULL,NULL,NULL),(21,1,NULL,NULL,NULL,NULL),(23,1,NULL,NULL,NULL,NULL),(24,1,NULL,NULL,NULL,NULL),(25,1,NULL,NULL,NULL,NULL),(27,1,NULL,NULL,NULL,NULL),(28,1,NULL,NULL,NULL,NULL),(29,1,NULL,NULL,NULL,NULL),(30,1,NULL,NULL,NULL,NULL),(31,1,NULL,NULL,NULL,NULL),(32,1,NULL,NULL,NULL,NULL),(33,1,NULL,NULL,NULL,NULL),(34,1,NULL,NULL,NULL,NULL),(35,1,NULL,NULL,NULL,NULL),(36,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `customer_eav_attribute_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity`
--

DROP TABLE IF EXISTS `customer_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_entity` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `website_id` smallint unsigned DEFAULT NULL COMMENT 'Website ID',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Group ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `store_id` smallint unsigned DEFAULT '0' COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `disable_auto_group_change` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Disable automatic group change based on VAT ID',
  `created_in` varchar(255) DEFAULT NULL COMMENT 'Created From',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'First Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name/Initial',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Last Name',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth',
  `password_hash` varchar(128) DEFAULT NULL COMMENT 'Password_hash',
  `rp_token` varchar(128) DEFAULT NULL COMMENT 'Reset password token',
  `rp_token_created_at` datetime DEFAULT NULL COMMENT 'Reset password token creation time',
  `default_billing` int unsigned DEFAULT NULL COMMENT 'Default Billing Address',
  `default_shipping` int unsigned DEFAULT NULL COMMENT 'Default Shipping Address',
  `taxvat` varchar(50) DEFAULT NULL COMMENT 'Tax/VAT Number',
  `confirmation` varchar(64) DEFAULT NULL COMMENT 'Is Confirmed',
  `gender` smallint unsigned DEFAULT NULL COMMENT 'Gender',
  `failures_num` smallint DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock Expiration Date',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  KEY `CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`),
  KEY `CUSTOMER_ENTITY_FIRSTNAME` (`firstname`),
  KEY `CUSTOMER_ENTITY_LASTNAME` (`lastname`),
  CONSTRAINT `CUSTOMER_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `CUSTOMER_ENTITY_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity`
--

LOCK TABLES `customer_entity` WRITE;
/*!40000 ALTER TABLE `customer_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_datetime`
--

DROP TABLE IF EXISTS `customer_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_entity_datetime` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity Datetime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_datetime`
--

LOCK TABLES `customer_entity_datetime` WRITE;
/*!40000 ALTER TABLE `customer_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_decimal`
--

DROP TABLE IF EXISTS `customer_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_entity_decimal` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity Decimal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_decimal`
--

LOCK TABLES `customer_entity_decimal` WRITE;
/*!40000 ALTER TABLE `customer_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_int`
--

DROP TABLE IF EXISTS `customer_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_entity_int` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_INT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity Int';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_int`
--

LOCK TABLES `customer_entity_int` WRITE;
/*!40000 ALTER TABLE `customer_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_text`
--

DROP TABLE IF EXISTS `customer_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_entity_text` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_TEXT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_text`
--

LOCK TABLES `customer_entity_text` WRITE;
/*!40000 ALTER TABLE `customer_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_varchar`
--

DROP TABLE IF EXISTS `customer_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_entity_varchar` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_varchar`
--

LOCK TABLES `customer_entity_varchar` WRITE;
/*!40000 ALTER TABLE `customer_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_form_attribute`
--

DROP TABLE IF EXISTS `customer_form_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Form Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_form_attribute`
--

LOCK TABLES `customer_form_attribute` WRITE;
/*!40000 ALTER TABLE `customer_form_attribute` DISABLE KEYS */;
INSERT INTO `customer_form_attribute` VALUES ('adminhtml_customer',1),('adminhtml_customer',3),('adminhtml_customer',4),('customer_account_create',4),('customer_account_edit',4),('adminhtml_customer',5),('customer_account_create',5),('customer_account_edit',5),('adminhtml_customer',6),('customer_account_create',6),('customer_account_edit',6),('adminhtml_customer',7),('customer_account_create',7),('customer_account_edit',7),('adminhtml_customer',8),('customer_account_create',8),('customer_account_edit',8),('adminhtml_checkout',9),('adminhtml_customer',9),('customer_account_create',9),('customer_account_edit',9),('adminhtml_checkout',10),('adminhtml_customer',10),('adminhtml_checkout',11),('adminhtml_customer',11),('customer_account_create',11),('customer_account_edit',11),('adminhtml_checkout',17),('adminhtml_customer',17),('customer_account_create',17),('customer_account_edit',17),('adminhtml_customer',19),('customer_account_create',19),('customer_account_edit',19),('adminhtml_checkout',20),('adminhtml_customer',20),('customer_account_create',20),('customer_account_edit',20),('adminhtml_customer',21),('adminhtml_customer_address',22),('customer_address_edit',22),('customer_register_address',22),('adminhtml_customer_address',23),('customer_address_edit',23),('customer_register_address',23),('adminhtml_customer_address',24),('customer_address_edit',24),('customer_register_address',24),('adminhtml_customer_address',25),('customer_address_edit',25),('customer_register_address',25),('adminhtml_customer_address',26),('customer_address_edit',26),('customer_register_address',26),('adminhtml_customer_address',27),('customer_address_edit',27),('customer_register_address',27),('adminhtml_customer_address',28),('customer_address_edit',28),('customer_register_address',28),('adminhtml_customer_address',29),('customer_address_edit',29),('customer_register_address',29),('adminhtml_customer_address',30),('customer_address_edit',30),('customer_register_address',30),('adminhtml_customer_address',31),('customer_address_edit',31),('customer_register_address',31),('adminhtml_customer_address',32),('customer_address_edit',32),('customer_register_address',32),('adminhtml_customer_address',33),('customer_address_edit',33),('customer_register_address',33),('adminhtml_customer_address',34),('customer_address_edit',34),('customer_register_address',34),('adminhtml_customer_address',35),('customer_address_edit',35),('customer_register_address',35),('adminhtml_customer_address',36),('customer_address_edit',36),('customer_register_address',36);
/*!40000 ALTER TABLE `customer_form_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_grid_flat`
--

DROP TABLE IF EXISTS `customer_grid_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_grid_flat` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `name` text COMMENT 'Name',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` int DEFAULT NULL COMMENT 'Group_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created_at',
  `website_id` int DEFAULT NULL COMMENT 'Website_id',
  `confirmation` varchar(255) DEFAULT NULL COMMENT 'Confirmation',
  `created_in` text COMMENT 'Created_in',
  `dob` date DEFAULT NULL COMMENT 'Dob',
  `gender` int DEFAULT NULL COMMENT 'Gender',
  `taxvat` varchar(255) DEFAULT NULL COMMENT 'Taxvat',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock_expires',
  `shipping_full` text COMMENT 'Shipping_full',
  `billing_full` text COMMENT 'Billing_full',
  `billing_firstname` varchar(255) DEFAULT NULL COMMENT 'Billing_firstname',
  `billing_lastname` varchar(255) DEFAULT NULL COMMENT 'Billing_lastname',
  `billing_telephone` varchar(255) DEFAULT NULL COMMENT 'Billing_telephone',
  `billing_postcode` varchar(255) DEFAULT NULL COMMENT 'Billing_postcode',
  `billing_country_id` varchar(255) DEFAULT NULL COMMENT 'Billing_country_id',
  `billing_region` varchar(255) DEFAULT NULL COMMENT 'Billing_region',
  `billing_region_id` int DEFAULT NULL COMMENT 'Billing_region_id',
  `billing_street` varchar(255) DEFAULT NULL COMMENT 'Billing_street',
  `billing_city` varchar(255) DEFAULT NULL COMMENT 'Billing_city',
  `billing_fax` varchar(255) DEFAULT NULL COMMENT 'Billing_fax',
  `billing_vat_id` varchar(255) DEFAULT NULL COMMENT 'Billing_vat_id',
  `billing_company` varchar(255) DEFAULT NULL COMMENT 'Billing_company',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_GRID_FLAT_GROUP_ID` (`group_id`),
  KEY `CUSTOMER_GRID_FLAT_CREATED_AT` (`created_at`),
  KEY `CUSTOMER_GRID_FLAT_WEBSITE_ID` (`website_id`),
  KEY `CUSTOMER_GRID_FLAT_CONFIRMATION` (`confirmation`),
  KEY `CUSTOMER_GRID_FLAT_DOB` (`dob`),
  KEY `CUSTOMER_GRID_FLAT_GENDER` (`gender`),
  KEY `CUSTOMER_GRID_FLAT_BILLING_COUNTRY_ID` (`billing_country_id`),
  FULLTEXT KEY `FTI_8746F705702DD5F6D45B8C7CE7FE9F2F` (`name`,`email`,`created_in`,`taxvat`,`shipping_full`,`billing_full`,`billing_firstname`,`billing_lastname`,`billing_telephone`,`billing_postcode`,`billing_region`,`billing_city`,`billing_fax`,`billing_company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='customer_grid_flat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_grid_flat`
--

LOCK TABLES `customer_grid_flat` WRITE;
/*!40000 ALTER TABLE `customer_grid_flat` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_grid_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_group` (
  `customer_group_id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Tax Class ID',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Customer Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_group`
--

LOCK TABLES `customer_group` WRITE;
/*!40000 ALTER TABLE `customer_group` DISABLE KEYS */;
INSERT INTO `customer_group` VALUES (0,'NOT LOGGED IN',3),(1,'General',3),(2,'Wholesale',3),(3,'Retailer',3);
/*!40000 ALTER TABLE `customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_group_excluded_website`
--

DROP TABLE IF EXISTS `customer_group_excluded_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_group_excluded_website` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Excluded Website ID from Customer Group',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_GROUP_EXCLUDED_WEBSITE_CUSTOMER_GROUP_ID_WEBSITE_ID` (`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Excluded Websites From Customer Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_group_excluded_website`
--

LOCK TABLES `customer_group_excluded_website` WRITE;
/*!40000 ALTER TABLE `customer_group_excluded_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_group_excluded_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_log`
--

DROP TABLE IF EXISTS `customer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_log` (
  `log_id` int NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `customer_id` int NOT NULL COMMENT 'Customer ID',
  `last_login_at` timestamp NULL DEFAULT NULL COMMENT 'Last Login Time',
  `last_logout_at` timestamp NULL DEFAULT NULL COMMENT 'Last Logout Time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `CUSTOMER_LOG_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Log Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_log`
--

LOCK TABLES `customer_log` WRITE;
/*!40000 ALTER TABLE `customer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_visitor`
--

DROP TABLE IF EXISTS `customer_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_visitor` (
  `visitor_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `customer_id` int DEFAULT NULL COMMENT 'Customer ID',
  `session_id` varchar(64) DEFAULT NULL COMMENT 'Session ID',
  `last_visit_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Visit Time',
  PRIMARY KEY (`visitor_id`),
  KEY `CUSTOMER_VISITOR_CUSTOMER_ID` (`customer_id`),
  KEY `CUSTOMER_VISITOR_LAST_VISIT_AT` (`last_visit_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Visitor Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_visitor`
--

LOCK TABLES `customer_visitor` WRITE;
/*!40000 ALTER TABLE `customer_visitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design_change`
--

DROP TABLE IF EXISTS `design_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `design_change` (
  `design_change_id` int NOT NULL AUTO_INCREMENT COMMENT 'Design Change ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity',
  PRIMARY KEY (`design_change_id`),
  KEY `DESIGN_CHANGE_STORE_ID` (`store_id`),
  CONSTRAINT `DESIGN_CHANGE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Design Changes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design_change`
--

LOCK TABLES `design_change` WRITE;
/*!40000 ALTER TABLE `design_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `design_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design_config_grid_flat`
--

DROP TABLE IF EXISTS `design_config_grid_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `design_config_grid_flat` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `store_website_id` int DEFAULT NULL COMMENT 'Store_website_id',
  `store_group_id` int DEFAULT NULL COMMENT 'Store_group_id',
  `store_id` int DEFAULT NULL COMMENT 'Store_id',
  `theme_theme_id` varchar(255) DEFAULT NULL COMMENT 'Theme_theme_id',
  PRIMARY KEY (`entity_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_WEBSITE_ID` (`store_website_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_GROUP_ID` (`store_group_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_ID` (`store_id`),
  FULLTEXT KEY `DESIGN_CONFIG_GRID_FLAT_THEME_THEME_ID` (`theme_theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='design_config_grid_flat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design_config_grid_flat`
--

LOCK TABLES `design_config_grid_flat` WRITE;
/*!40000 ALTER TABLE `design_config_grid_flat` DISABLE KEYS */;
INSERT INTO `design_config_grid_flat` VALUES (0,NULL,NULL,NULL,''),(1,1,NULL,NULL,''),(2,1,1,1,'');
/*!40000 ALTER TABLE `design_config_grid_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country`
--

DROP TABLE IF EXISTS `directory_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directory_country` (
  `country_id` varchar(2) NOT NULL COMMENT 'Country ID in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Directory Country';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country`
--

LOCK TABLES `directory_country` WRITE;
/*!40000 ALTER TABLE `directory_country` DISABLE KEYS */;
INSERT INTO `directory_country` VALUES ('AD','AD','AND'),('AE','AE','ARE'),('AF','AF','AFG'),('AG','AG','ATG'),('AI','AI','AIA'),('AL','AL','ALB'),('AM','AM','ARM'),('AN','AN','ANT'),('AO','AO','AGO'),('AQ','AQ','ATA'),('AR','AR','ARG'),('AS','AS','ASM'),('AT','AT','AUT'),('AU','AU','AUS'),('AW','AW','ABW'),('AX','AX','ALA'),('AZ','AZ','AZE'),('BA','BA','BIH'),('BB','BB','BRB'),('BD','BD','BGD'),('BE','BE','BEL'),('BF','BF','BFA'),('BG','BG','BGR'),('BH','BH','BHR'),('BI','BI','BDI'),('BJ','BJ','BEN'),('BL','BL','BLM'),('BM','BM','BMU'),('BN','BN','BRN'),('BO','BO','BOL'),('BQ','BQ','BES'),('BR','BR','BRA'),('BS','BS','BHS'),('BT','BT','BTN'),('BV','BV','BVT'),('BW','BW','BWA'),('BY','BY','BLR'),('BZ','BZ','BLZ'),('CA','CA','CAN'),('CC','CC','CCK'),('CD','CD','COD'),('CF','CF','CAF'),('CG','CG','COG'),('CH','CH','CHE'),('CI','CI','CIV'),('CK','CK','COK'),('CL','CL','CHL'),('CM','CM','CMR'),('CN','CN','CHN'),('CO','CO','COL'),('CR','CR','CRI'),('CU','CU','CUB'),('CV','CV','CPV'),('CW','CW','CUW'),('CX','CX','CXR'),('CY','CY','CYP'),('CZ','CZ','CZE'),('DE','DE','DEU'),('DJ','DJ','DJI'),('DK','DK','DNK'),('DM','DM','DMA'),('DO','DO','DOM'),('DZ','DZ','DZA'),('EC','EC','ECU'),('EE','EE','EST'),('EG','EG','EGY'),('EH','EH','ESH'),('ER','ER','ERI'),('ES','ES','ESP'),('ET','ET','ETH'),('FI','FI','FIN'),('FJ','FJ','FJI'),('FK','FK','FLK'),('FM','FM','FSM'),('FO','FO','FRO'),('FR','FR','FRA'),('GA','GA','GAB'),('GB','GB','GBR'),('GD','GD','GRD'),('GE','GE','GEO'),('GF','GF','GUF'),('GG','GG','GGY'),('GH','GH','GHA'),('GI','GI','GIB'),('GL','GL','GRL'),('GM','GM','GMB'),('GN','GN','GIN'),('GP','GP','GLP'),('GQ','GQ','GNQ'),('GR','GR','GRC'),('GS','GS','SGS'),('GT','GT','GTM'),('GU','GU','GUM'),('GW','GW','GNB'),('GY','GY','GUY'),('HK','HK','HKG'),('HM','HM','HMD'),('HN','HN','HND'),('HR','HR','HRV'),('HT','HT','HTI'),('HU','HU','HUN'),('ID','ID','IDN'),('IE','IE','IRL'),('IL','IL','ISR'),('IM','IM','IMN'),('IN','IN','IND'),('IO','IO','IOT'),('IQ','IQ','IRQ'),('IR','IR','IRN'),('IS','IS','ISL'),('IT','IT','ITA'),('JE','JE','JEY'),('JM','JM','JAM'),('JO','JO','JOR'),('JP','JP','JPN'),('KE','KE','KEN'),('KG','KG','KGZ'),('KH','KH','KHM'),('KI','KI','KIR'),('KM','KM','COM'),('KN','KN','KNA'),('KP','KP','PRK'),('KR','KR','KOR'),('KW','KW','KWT'),('KY','KY','CYM'),('KZ','KZ','KAZ'),('LA','LA','LAO'),('LB','LB','LBN'),('LC','LC','LCA'),('LI','LI','LIE'),('LK','LK','LKA'),('LR','LR','LBR'),('LS','LS','LSO'),('LT','LT','LTU'),('LU','LU','LUX'),('LV','LV','LVA'),('LY','LY','LBY'),('MA','MA','MAR'),('MC','MC','MCO'),('MD','MD','MDA'),('ME','ME','MNE'),('MF','MF','MAF'),('MG','MG','MDG'),('MH','MH','MHL'),('MK','MK','MKD'),('ML','ML','MLI'),('MM','MM','MMR'),('MN','MN','MNG'),('MO','MO','MAC'),('MP','MP','MNP'),('MQ','MQ','MTQ'),('MR','MR','MRT'),('MS','MS','MSR'),('MT','MT','MLT'),('MU','MU','MUS'),('MV','MV','MDV'),('MW','MW','MWI'),('MX','MX','MEX'),('MY','MY','MYS'),('MZ','MZ','MOZ'),('NA','NA','NAM'),('NC','NC','NCL'),('NE','NE','NER'),('NF','NF','NFK'),('NG','NG','NGA'),('NI','NI','NIC'),('NL','NL','NLD'),('NO','NO','NOR'),('NP','NP','NPL'),('NR','NR','NRU'),('NU','NU','NIU'),('NZ','NZ','NZL'),('OM','OM','OMN'),('PA','PA','PAN'),('PE','PE','PER'),('PF','PF','PYF'),('PG','PG','PNG'),('PH','PH','PHL'),('PK','PK','PAK'),('PL','PL','POL'),('PM','PM','SPM'),('PN','PN','PCN'),('PS','PS','PSE'),('PT','PT','PRT'),('PW','PW','PLW'),('PY','PY','PRY'),('QA','QA','QAT'),('RE','RE','REU'),('RO','RO','ROU'),('RS','RS','SRB'),('RU','RU','RUS'),('RW','RW','RWA'),('SA','SA','SAU'),('SB','SB','SLB'),('SC','SC','SYC'),('SD','SD','SDN'),('SE','SE','SWE'),('SG','SG','SGP'),('SH','SH','SHN'),('SI','SI','SVN'),('SJ','SJ','SJM'),('SK','SK','SVK'),('SL','SL','SLE'),('SM','SM','SMR'),('SN','SN','SEN'),('SO','SO','SOM'),('SR','SR','SUR'),('ST','ST','STP'),('SV','SV','SLV'),('SX','SX','SXM'),('SY','SY','SYR'),('SZ','SZ','SWZ'),('TC','TC','TCA'),('TD','TD','TCD'),('TF','TF','ATF'),('TG','TG','TGO'),('TH','TH','THA'),('TJ','TJ','TJK'),('TK','TK','TKL'),('TL','TL','TLS'),('TM','TM','TKM'),('TN','TN','TUN'),('TO','TO','TON'),('TR','TR','TUR'),('TT','TT','TTO'),('TV','TV','TUV'),('TW','TW','TWN'),('TZ','TZ','TZA'),('UA','UA','UKR'),('UG','UG','UGA'),('UM','UM','UMI'),('US','US','USA'),('UY','UY','URY'),('UZ','UZ','UZB'),('VA','VA','VAT'),('VC','VC','VCT'),('VE','VE','VEN'),('VG','VG','VGB'),('VI','VI','VIR'),('VN','VN','VNM'),('VU','VU','VUT'),('WF','WF','WLF'),('WS','WS','WSM'),('XK','XK','XKX'),('YE','YE','YEM'),('YT','YT','MYT'),('ZA','ZA','ZAF'),('ZM','ZM','ZMB'),('ZW','ZW','ZWE');
/*!40000 ALTER TABLE `directory_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country_format`
--

DROP TABLE IF EXISTS `directory_country_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directory_country_format` (
  `country_format_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Country Format ID',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country ID in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format',
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Directory Country Format';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country_format`
--

LOCK TABLES `directory_country_format` WRITE;
/*!40000 ALTER TABLE `directory_country_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `directory_country_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country_region`
--

DROP TABLE IF EXISTS `directory_country_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directory_country_region` (
  `region_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Region ID',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country ID in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8mb3 COMMENT='Directory Country Region';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country_region`
--

LOCK TABLES `directory_country_region` WRITE;
/*!40000 ALTER TABLE `directory_country_region` DISABLE KEYS */;
INSERT INTO `directory_country_region` VALUES (1,'US','AL','Alabama'),(2,'US','AK','Alaska'),(3,'US','AS','American Samoa'),(4,'US','AZ','Arizona'),(5,'US','AR','Arkansas'),(6,'US','AE','Armed Forces Africa'),(7,'US','AA','Armed Forces Americas'),(8,'US','AE','Armed Forces Canada'),(9,'US','AE','Armed Forces Europe'),(10,'US','AE','Armed Forces Middle East'),(11,'US','AP','Armed Forces Pacific'),(12,'US','CA','California'),(13,'US','CO','Colorado'),(14,'US','CT','Connecticut'),(15,'US','DE','Delaware'),(16,'US','DC','District of Columbia'),(17,'US','FM','Federated States Of Micronesia'),(18,'US','FL','Florida'),(19,'US','GA','Georgia'),(20,'US','GU','Guam'),(21,'US','HI','Hawaii'),(22,'US','ID','Idaho'),(23,'US','IL','Illinois'),(24,'US','IN','Indiana'),(25,'US','IA','Iowa'),(26,'US','KS','Kansas'),(27,'US','KY','Kentucky'),(28,'US','LA','Louisiana'),(29,'US','ME','Maine'),(30,'US','MH','Marshall Islands'),(31,'US','MD','Maryland'),(32,'US','MA','Massachusetts'),(33,'US','MI','Michigan'),(34,'US','MN','Minnesota'),(35,'US','MS','Mississippi'),(36,'US','MO','Missouri'),(37,'US','MT','Montana'),(38,'US','NE','Nebraska'),(39,'US','NV','Nevada'),(40,'US','NH','New Hampshire'),(41,'US','NJ','New Jersey'),(42,'US','NM','New Mexico'),(43,'US','NY','New York'),(44,'US','NC','North Carolina'),(45,'US','ND','North Dakota'),(46,'US','MP','Northern Mariana Islands'),(47,'US','OH','Ohio'),(48,'US','OK','Oklahoma'),(49,'US','OR','Oregon'),(50,'US','PW','Palau'),(51,'US','PA','Pennsylvania'),(52,'US','PR','Puerto Rico'),(53,'US','RI','Rhode Island'),(54,'US','SC','South Carolina'),(55,'US','SD','South Dakota'),(56,'US','TN','Tennessee'),(57,'US','TX','Texas'),(58,'US','UT','Utah'),(59,'US','VT','Vermont'),(60,'US','VI','Virgin Islands'),(61,'US','VA','Virginia'),(62,'US','WA','Washington'),(63,'US','WV','West Virginia'),(64,'US','WI','Wisconsin'),(65,'US','WY','Wyoming'),(66,'CA','AB','Alberta'),(67,'CA','BC','British Columbia'),(68,'CA','MB','Manitoba'),(69,'CA','NL','Newfoundland and Labrador'),(70,'CA','NB','New Brunswick'),(71,'CA','NS','Nova Scotia'),(72,'CA','NT','Northwest Territories'),(73,'CA','NU','Nunavut'),(74,'CA','ON','Ontario'),(75,'CA','PE','Prince Edward Island'),(76,'CA','QC','Quebec'),(77,'CA','SK','Saskatchewan'),(78,'CA','YT','Yukon Territory'),(79,'DE','NDS','Niedersachsen'),(80,'DE','BAW','Baden-Württemberg'),(81,'DE','BAY','Bayern'),(82,'DE','BER','Berlin'),(83,'DE','BRG','Brandenburg'),(84,'DE','BRE','Bremen'),(85,'DE','HAM','Hamburg'),(86,'DE','HES','Hessen'),(87,'DE','MEC','Mecklenburg-Vorpommern'),(88,'DE','NRW','Nordrhein-Westfalen'),(89,'DE','RHE','Rheinland-Pfalz'),(90,'DE','SAR','Saarland'),(91,'DE','SAS','Sachsen'),(92,'DE','SAC','Sachsen-Anhalt'),(93,'DE','SCN','Schleswig-Holstein'),(94,'DE','THE','Thüringen'),(95,'AT','WI','Wien'),(96,'AT','NO','Niederösterreich'),(97,'AT','OO','Oberösterreich'),(98,'AT','SB','Salzburg'),(99,'AT','KN','Kärnten'),(100,'AT','ST','Steiermark'),(101,'AT','TI','Tirol'),(102,'AT','BL','Burgenland'),(103,'AT','VB','Vorarlberg'),(104,'CH','AG','Aargau'),(105,'CH','AI','Appenzell Innerrhoden'),(106,'CH','AR','Appenzell Ausserrhoden'),(107,'CH','BE','Bern'),(108,'CH','BL','Basel-Landschaft'),(109,'CH','BS','Basel-Stadt'),(110,'CH','FR','Freiburg'),(111,'CH','GE','Genf'),(112,'CH','GL','Glarus'),(113,'CH','GR','Graubünden'),(114,'CH','JU','Jura'),(115,'CH','LU','Luzern'),(116,'CH','NE','Neuenburg'),(117,'CH','NW','Nidwalden'),(118,'CH','OW','Obwalden'),(119,'CH','SG','St. Gallen'),(120,'CH','SH','Schaffhausen'),(121,'CH','SO','Solothurn'),(122,'CH','SZ','Schwyz'),(123,'CH','TG','Thurgau'),(124,'CH','TI','Tessin'),(125,'CH','UR','Uri'),(126,'CH','VD','Waadt'),(127,'CH','VS','Wallis'),(128,'CH','ZG','Zug'),(129,'CH','ZH','Zürich'),(130,'ES','A Coruсa','A Coruña'),(131,'ES','Alava','Alava'),(132,'ES','Albacete','Albacete'),(133,'ES','Alicante','Alicante'),(134,'ES','Almeria','Almeria'),(135,'ES','Asturias','Asturias'),(136,'ES','Avila','Avila'),(137,'ES','Badajoz','Badajoz'),(138,'ES','Baleares','Baleares'),(139,'ES','Barcelona','Barcelona'),(140,'ES','Burgos','Burgos'),(141,'ES','Caceres','Caceres'),(142,'ES','Cadiz','Cadiz'),(143,'ES','Cantabria','Cantabria'),(144,'ES','Castellon','Castellon'),(145,'ES','Ceuta','Ceuta'),(146,'ES','Ciudad Real','Ciudad Real'),(147,'ES','Cordoba','Cordoba'),(148,'ES','Cuenca','Cuenca'),(149,'ES','Girona','Girona'),(150,'ES','Granada','Granada'),(151,'ES','Guadalajara','Guadalajara'),(152,'ES','Guipuzcoa','Guipuzcoa'),(153,'ES','Huelva','Huelva'),(154,'ES','Huesca','Huesca'),(155,'ES','Jaen','Jaen'),(156,'ES','La Rioja','La Rioja'),(157,'ES','Las Palmas','Las Palmas'),(158,'ES','Leon','Leon'),(159,'ES','Lleida','Lleida'),(160,'ES','Lugo','Lugo'),(161,'ES','Madrid','Madrid'),(162,'ES','Malaga','Malaga'),(163,'ES','Melilla','Melilla'),(164,'ES','Murcia','Murcia'),(165,'ES','Navarra','Navarra'),(166,'ES','Ourense','Ourense'),(167,'ES','Palencia','Palencia'),(168,'ES','Pontevedra','Pontevedra'),(169,'ES','Salamanca','Salamanca'),(170,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,'ES','Segovia','Segovia'),(172,'ES','Sevilla','Sevilla'),(173,'ES','Soria','Soria'),(174,'ES','Tarragona','Tarragona'),(175,'ES','Teruel','Teruel'),(176,'ES','Toledo','Toledo'),(177,'ES','Valencia','Valencia'),(178,'ES','Valladolid','Valladolid'),(179,'ES','Vizcaya','Vizcaya'),(180,'ES','Zamora','Zamora'),(181,'ES','Zaragoza','Zaragoza'),(182,'FR','1','Ain'),(183,'FR','2','Aisne'),(184,'FR','3','Allier'),(185,'FR','4','Alpes-de-Haute-Provence'),(186,'FR','5','Hautes-Alpes'),(187,'FR','6','Alpes-Maritimes'),(188,'FR','7','Ardèche'),(189,'FR','8','Ardennes'),(190,'FR','9','Ariège'),(191,'FR','10','Aube'),(192,'FR','11','Aude'),(193,'FR','12','Aveyron'),(194,'FR','13','Bouches-du-Rhône'),(195,'FR','14','Calvados'),(196,'FR','15','Cantal'),(197,'FR','16','Charente'),(198,'FR','17','Charente-Maritime'),(199,'FR','18','Cher'),(200,'FR','19','Corrèze'),(201,'FR','2A','Corse-du-Sud'),(202,'FR','2B','Haute-Corse'),(203,'FR','21','Côte-d\'Or'),(204,'FR','22','Côtes-d\'Armor'),(205,'FR','23','Creuse'),(206,'FR','24','Dordogne'),(207,'FR','25','Doubs'),(208,'FR','26','Drôme'),(209,'FR','27','Eure'),(210,'FR','28','Eure-et-Loir'),(211,'FR','29','Finistère'),(212,'FR','30','Gard'),(213,'FR','31','Haute-Garonne'),(214,'FR','32','Gers'),(215,'FR','33','Gironde'),(216,'FR','34','Hérault'),(217,'FR','35','Ille-et-Vilaine'),(218,'FR','36','Indre'),(219,'FR','37','Indre-et-Loire'),(220,'FR','38','Isère'),(221,'FR','39','Jura'),(222,'FR','40','Landes'),(223,'FR','41','Loir-et-Cher'),(224,'FR','42','Loire'),(225,'FR','43','Haute-Loire'),(226,'FR','44','Loire-Atlantique'),(227,'FR','45','Loiret'),(228,'FR','46','Lot'),(229,'FR','47','Lot-et-Garonne'),(230,'FR','48','Lozère'),(231,'FR','49','Maine-et-Loire'),(232,'FR','50','Manche'),(233,'FR','51','Marne'),(234,'FR','52','Haute-Marne'),(235,'FR','53','Mayenne'),(236,'FR','54','Meurthe-et-Moselle'),(237,'FR','55','Meuse'),(238,'FR','56','Morbihan'),(239,'FR','57','Moselle'),(240,'FR','58','Nièvre'),(241,'FR','59','Nord'),(242,'FR','60','Oise'),(243,'FR','61','Orne'),(244,'FR','62','Pas-de-Calais'),(245,'FR','63','Puy-de-Dôme'),(246,'FR','64','Pyrénées-Atlantiques'),(247,'FR','65','Hautes-Pyrénées'),(248,'FR','66','Pyrénées-Orientales'),(249,'FR','67','Bas-Rhin'),(250,'FR','68','Haut-Rhin'),(251,'FR','69','Rhône'),(252,'FR','70','Haute-Saône'),(253,'FR','71','Saône-et-Loire'),(254,'FR','72','Sarthe'),(255,'FR','73','Savoie'),(256,'FR','74','Haute-Savoie'),(257,'FR','75','Paris'),(258,'FR','76','Seine-Maritime'),(259,'FR','77','Seine-et-Marne'),(260,'FR','78','Yvelines'),(261,'FR','79','Deux-Sèvres'),(262,'FR','80','Somme'),(263,'FR','81','Tarn'),(264,'FR','82','Tarn-et-Garonne'),(265,'FR','83','Var'),(266,'FR','84','Vaucluse'),(267,'FR','85','Vendée'),(268,'FR','86','Vienne'),(269,'FR','87','Haute-Vienne'),(270,'FR','88','Vosges'),(271,'FR','89','Yonne'),(272,'FR','90','Territoire-de-Belfort'),(273,'FR','91','Essonne'),(274,'FR','92','Hauts-de-Seine'),(275,'FR','93','Seine-Saint-Denis'),(276,'FR','94','Val-de-Marne'),(277,'FR','95','Val-d\'Oise'),(278,'RO','AB','Alba'),(279,'RO','AR','Arad'),(280,'RO','AG','Argeş'),(281,'RO','BC','Bacău'),(282,'RO','BH','Bihor'),(283,'RO','BN','Bistriţa-Năsăud'),(284,'RO','BT','Botoşani'),(285,'RO','BV','Braşov'),(286,'RO','BR','Brăila'),(287,'RO','B','Bucureşti'),(288,'RO','BZ','Buzău'),(289,'RO','CS','Caraş-Severin'),(290,'RO','CL','Călăraşi'),(291,'RO','CJ','Cluj'),(292,'RO','CT','Constanţa'),(293,'RO','CV','Covasna'),(294,'RO','DB','Dâmboviţa'),(295,'RO','DJ','Dolj'),(296,'RO','GL','Galaţi'),(297,'RO','GR','Giurgiu'),(298,'RO','GJ','Gorj'),(299,'RO','HR','Harghita'),(300,'RO','HD','Hunedoara'),(301,'RO','IL','Ialomiţa'),(302,'RO','IS','Iaşi'),(303,'RO','IF','Ilfov'),(304,'RO','MM','Maramureş'),(305,'RO','MH','Mehedinţi'),(306,'RO','MS','Mureş'),(307,'RO','NT','Neamţ'),(308,'RO','OT','Olt'),(309,'RO','PH','Prahova'),(310,'RO','SM','Satu-Mare'),(311,'RO','SJ','Sălaj'),(312,'RO','SB','Sibiu'),(313,'RO','SV','Suceava'),(314,'RO','TR','Teleorman'),(315,'RO','TM','Timiş'),(316,'RO','TL','Tulcea'),(317,'RO','VS','Vaslui'),(318,'RO','VL','Vâlcea'),(319,'RO','VN','Vrancea'),(320,'FI','Lappi','Lappi'),(321,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa'),(322,'FI','Kainuu','Kainuu'),(323,'FI','Pohjois-Karjala','Pohjois-Karjala'),(324,'FI','Pohjois-Savo','Pohjois-Savo'),(325,'FI','Etelä-Savo','Etelä-Savo'),(326,'FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa'),(327,'FI','Pohjanmaa','Pohjanmaa'),(328,'FI','Pirkanmaa','Pirkanmaa'),(329,'FI','Satakunta','Satakunta'),(330,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa'),(331,'FI','Keski-Suomi','Keski-Suomi'),(332,'FI','Varsinais-Suomi','Varsinais-Suomi'),(333,'FI','Etelä-Karjala','Etelä-Karjala'),(334,'FI','Päijät-Häme','Päijät-Häme'),(335,'FI','Kanta-Häme','Kanta-Häme'),(336,'FI','Uusimaa','Uusimaa'),(337,'FI','Itä-Uusimaa','Itä-Uusimaa'),(338,'FI','Kymenlaakso','Kymenlaakso'),(339,'FI','Ahvenanmaa','Ahvenanmaa'),(340,'EE','EE-37','Harjumaa'),(341,'EE','EE-39','Hiiumaa'),(342,'EE','EE-44','Ida-Virumaa'),(343,'EE','EE-49','Jõgevamaa'),(344,'EE','EE-51','Järvamaa'),(345,'EE','EE-57','Läänemaa'),(346,'EE','EE-59','Lääne-Virumaa'),(347,'EE','EE-65','Põlvamaa'),(348,'EE','EE-67','Pärnumaa'),(349,'EE','EE-70','Raplamaa'),(350,'EE','EE-74','Saaremaa'),(351,'EE','EE-78','Tartumaa'),(352,'EE','EE-82','Valgamaa'),(353,'EE','EE-84','Viljandimaa'),(354,'EE','EE-86','Võrumaa'),(355,'LV','LV-DGV','Daugavpils'),(356,'LV','LV-JEL','Jelgava'),(357,'LV','Jēkabpils','Jēkabpils'),(358,'LV','LV-JUR','Jūrmala'),(359,'LV','LV-LPX','Liepāja'),(360,'LV','LV-LE','Liepājas novads'),(361,'LV','LV-REZ','Rēzekne'),(362,'LV','LV-RIX','Rīga'),(363,'LV','LV-RI','Rīgas novads'),(364,'LV','Valmiera','Valmiera'),(365,'LV','LV-VEN','Ventspils'),(366,'LV','Aglonas novads','Aglonas novads'),(367,'LV','LV-AI','Aizkraukles novads'),(368,'LV','Aizputes novads','Aizputes novads'),(369,'LV','Aknīstes novads','Aknīstes novads'),(370,'LV','Alojas novads','Alojas novads'),(371,'LV','Alsungas novads','Alsungas novads'),(372,'LV','LV-AL','Alūksnes novads'),(373,'LV','Amatas novads','Amatas novads'),(374,'LV','Apes novads','Apes novads'),(375,'LV','Auces novads','Auces novads'),(376,'LV','Babītes novads','Babītes novads'),(377,'LV','Baldones novads','Baldones novads'),(378,'LV','Baltinavas novads','Baltinavas novads'),(379,'LV','LV-BL','Balvu novads'),(380,'LV','LV-BU','Bauskas novads'),(381,'LV','Beverīnas novads','Beverīnas novads'),(382,'LV','Brocēnu novads','Brocēnu novads'),(383,'LV','Burtnieku novads','Burtnieku novads'),(384,'LV','Carnikavas novads','Carnikavas novads'),(385,'LV','Cesvaines novads','Cesvaines novads'),(386,'LV','Ciblas novads','Ciblas novads'),(387,'LV','LV-CE','Cēsu novads'),(388,'LV','Dagdas novads','Dagdas novads'),(389,'LV','LV-DA','Daugavpils novads'),(390,'LV','LV-DO','Dobeles novads'),(391,'LV','Dundagas novads','Dundagas novads'),(392,'LV','Durbes novads','Durbes novads'),(393,'LV','Engures novads','Engures novads'),(394,'LV','Garkalnes novads','Garkalnes novads'),(395,'LV','Grobiņas novads','Grobiņas novads'),(396,'LV','LV-GU','Gulbenes novads'),(397,'LV','Iecavas novads','Iecavas novads'),(398,'LV','Ikšķiles novads','Ikšķiles novads'),(399,'LV','Ilūkstes novads','Ilūkstes novads'),(400,'LV','Inčukalna novads','Inčukalna novads'),(401,'LV','Jaunjelgavas novads','Jaunjelgavas novads'),(402,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads'),(403,'LV','Jaunpils novads','Jaunpils novads'),(404,'LV','LV-JL','Jelgavas novads'),(405,'LV','LV-JK','Jēkabpils novads'),(406,'LV','Kandavas novads','Kandavas novads'),(407,'LV','Kokneses novads','Kokneses novads'),(408,'LV','Krimuldas novads','Krimuldas novads'),(409,'LV','Krustpils novads','Krustpils novads'),(410,'LV','LV-KR','Krāslavas novads'),(411,'LV','LV-KU','Kuldīgas novads'),(412,'LV','Kārsavas novads','Kārsavas novads'),(413,'LV','Lielvārdes novads','Lielvārdes novads'),(414,'LV','LV-LM','Limbažu novads'),(415,'LV','Lubānas novads','Lubānas novads'),(416,'LV','LV-LU','Ludzas novads'),(417,'LV','Līgatnes novads','Līgatnes novads'),(418,'LV','Līvānu novads','Līvānu novads'),(419,'LV','LV-MA','Madonas novads'),(420,'LV','Mazsalacas novads','Mazsalacas novads'),(421,'LV','Mālpils novads','Mālpils novads'),(422,'LV','Mārupes novads','Mārupes novads'),(423,'LV','Naukšēnu novads','Naukšēnu novads'),(424,'LV','Neretas novads','Neretas novads'),(425,'LV','Nīcas novads','Nīcas novads'),(426,'LV','LV-OG','Ogres novads'),(427,'LV','Olaines novads','Olaines novads'),(428,'LV','Ozolnieku novads','Ozolnieku novads'),(429,'LV','LV-PR','Preiļu novads'),(430,'LV','Priekules novads','Priekules novads'),(431,'LV','Priekuļu novads','Priekuļu novads'),(432,'LV','Pārgaujas novads','Pārgaujas novads'),(433,'LV','Pāvilostas novads','Pāvilostas novads'),(434,'LV','Pļaviņu novads','Pļaviņu novads'),(435,'LV','Raunas novads','Raunas novads'),(436,'LV','Riebiņu novads','Riebiņu novads'),(437,'LV','Rojas novads','Rojas novads'),(438,'LV','Ropažu novads','Ropažu novads'),(439,'LV','Rucavas novads','Rucavas novads'),(440,'LV','Rugāju novads','Rugāju novads'),(441,'LV','Rundāles novads','Rundāles novads'),(442,'LV','LV-RE','Rēzeknes novads'),(443,'LV','Rūjienas novads','Rūjienas novads'),(444,'LV','Salacgrīvas novads','Salacgrīvas novads'),(445,'LV','Salas novads','Salas novads'),(446,'LV','Salaspils novads','Salaspils novads'),(447,'LV','LV-SA','Saldus novads'),(448,'LV','Saulkrastu novads','Saulkrastu novads'),(449,'LV','Siguldas novads','Siguldas novads'),(450,'LV','Skrundas novads','Skrundas novads'),(451,'LV','Skrīveru novads','Skrīveru novads'),(452,'LV','Smiltenes novads','Smiltenes novads'),(453,'LV','Stopiņu novads','Stopiņu novads'),(454,'LV','Strenču novads','Strenču novads'),(455,'LV','Sējas novads','Sējas novads'),(456,'LV','LV-TA','Talsu novads'),(457,'LV','LV-TU','Tukuma novads'),(458,'LV','Tērvetes novads','Tērvetes novads'),(459,'LV','Vaiņodes novads','Vaiņodes novads'),(460,'LV','LV-VK','Valkas novads'),(461,'LV','LV-VM','Valmieras novads'),(462,'LV','Varakļānu novads','Varakļānu novads'),(463,'LV','Vecpiebalgas novads','Vecpiebalgas novads'),(464,'LV','Vecumnieku novads','Vecumnieku novads'),(465,'LV','LV-VE','Ventspils novads'),(466,'LV','Viesītes novads','Viesītes novads'),(467,'LV','Viļakas novads','Viļakas novads'),(468,'LV','Viļānu novads','Viļānu novads'),(469,'LV','Vārkavas novads','Vārkavas novads'),(470,'LV','Zilupes novads','Zilupes novads'),(471,'LV','Ādažu novads','Ādažu novads'),(472,'LV','Ērgļu novads','Ērgļu novads'),(473,'LV','Ķeguma novads','Ķeguma novads'),(474,'LV','Ķekavas novads','Ķekavas novads'),(475,'LT','LT-AL','Alytaus Apskritis'),(476,'LT','LT-KU','Kauno Apskritis'),(477,'LT','LT-KL','Klaipėdos Apskritis'),(478,'LT','LT-MR','Marijampolės Apskritis'),(479,'LT','LT-PN','Panevėžio Apskritis'),(480,'LT','LT-SA','Šiaulių Apskritis'),(481,'LT','LT-TA','Tauragės Apskritis'),(482,'LT','LT-TE','Telšių Apskritis'),(483,'LT','LT-UT','Utenos Apskritis'),(484,'LT','LT-VL','Vilniaus Apskritis'),(485,'BR','AC','Acre'),(486,'BR','AL','Alagoas'),(487,'BR','AP','Amapá'),(488,'BR','AM','Amazonas'),(489,'BR','BA','Bahia'),(490,'BR','CE','Ceará'),(491,'BR','ES','Espírito Santo'),(492,'BR','GO','Goiás'),(493,'BR','MA','Maranhão'),(494,'BR','MT','Mato Grosso'),(495,'BR','MS','Mato Grosso do Sul'),(496,'BR','MG','Minas Gerais'),(497,'BR','PA','Pará'),(498,'BR','PB','Paraíba'),(499,'BR','PR','Paraná'),(500,'BR','PE','Pernambuco'),(501,'BR','PI','Piauí'),(502,'BR','RJ','Rio de Janeiro'),(503,'BR','RN','Rio Grande do Norte'),(504,'BR','RS','Rio Grande do Sul'),(505,'BR','RO','Rondônia'),(506,'BR','RR','Roraima'),(507,'BR','SC','Santa Catarina'),(508,'BR','SP','São Paulo'),(509,'BR','SE','Sergipe'),(510,'BR','TO','Tocantins'),(511,'BR','DF','Distrito Federal'),(512,'AL','AL-01','Berat'),(513,'AL','AL-09','Dibër'),(514,'AL','AL-02','Durrës'),(515,'AL','AL-03','Elbasan'),(516,'AL','AL-04','Fier'),(517,'AL','AL-05','Gjirokastër'),(518,'AL','AL-06','Korçë'),(519,'AL','AL-07','Kukës'),(520,'AL','AL-08','Lezhë'),(521,'AL','AL-10','Shkodër'),(522,'AL','AL-11','Tiranë'),(523,'AL','AL-12','Vlorë'),(524,'AR','AR-C','Ciudad Autónoma de Buenos Aires'),(525,'AR','AR-B','Buenos Aires'),(526,'AR','AR-K','Catamarca'),(527,'AR','AR-H','Chaco'),(528,'AR','AR-U','Chubut'),(529,'AR','AR-X','Córdoba'),(530,'AR','AR-W','Corrientes'),(531,'AR','AR-E','Entre Ríos'),(532,'AR','AR-P','Formosa'),(533,'AR','AR-Y','Jujuy'),(534,'AR','AR-L','La Pampa'),(535,'AR','AR-F','La Rioja'),(536,'AR','AR-M','Mendoza'),(537,'AR','AR-N','Misiones'),(538,'AR','AR-Q','Neuquén'),(539,'AR','AR-R','Río Negro'),(540,'AR','AR-A','Salta'),(541,'AR','AR-J','San Juan'),(542,'AR','AR-D','San Luis'),(543,'AR','AR-Z','Santa Cruz'),(544,'AR','AR-S','Santa Fe'),(545,'AR','AR-G','Santiago del Estero'),(546,'AR','AR-V','Tierra del Fuego'),(547,'AR','AR-T','Tucumán'),(548,'HR','HR-01','Zagrebačka županija'),(549,'HR','HR-02','Krapinsko-zagorska županija'),(550,'HR','HR-03','Sisačko-moslavačka županija'),(551,'HR','HR-04','Karlovačka županija'),(552,'HR','HR-05','Varaždinska županija'),(553,'HR','HR-06','Koprivničko-križevačka županija'),(554,'HR','HR-07','Bjelovarsko-bilogorska županija'),(555,'HR','HR-08','Primorsko-goranska županija'),(556,'HR','HR-09','Ličko-senjska županija'),(557,'HR','HR-10','Virovitičko-podravska županija'),(558,'HR','HR-11','Požeško-slavonska županija'),(559,'HR','HR-12','Brodsko-posavska županija'),(560,'HR','HR-13','Zadarska županija'),(561,'HR','HR-14','Osječko-baranjska županija'),(562,'HR','HR-15','Šibensko-kninska županija'),(563,'HR','HR-16','Vukovarsko-srijemska županija'),(564,'HR','HR-17','Splitsko-dalmatinska županija'),(565,'HR','HR-18','Istarska županija'),(566,'HR','HR-19','Dubrovačko-neretvanska županija'),(567,'HR','HR-20','Međimurska županija'),(568,'HR','HR-21','Grad Zagreb'),(569,'IN','AN','Andaman and Nicobar Islands'),(570,'IN','AP','Andhra Pradesh'),(571,'IN','AR','Arunachal Pradesh'),(572,'IN','AS','Assam'),(573,'IN','BR','Bihar'),(574,'IN','CH','Chandigarh'),(575,'IN','CT','Chhattisgarh'),(576,'IN','DN','Dadra and Nagar Haveli'),(577,'IN','DD','Daman and Diu'),(578,'IN','DL','Delhi'),(579,'IN','GA','Goa'),(580,'IN','GJ','Gujarat'),(581,'IN','HR','Haryana'),(582,'IN','HP','Himachal Pradesh'),(583,'IN','JK','Jammu and Kashmir'),(584,'IN','JH','Jharkhand'),(585,'IN','KA','Karnataka'),(586,'IN','KL','Kerala'),(587,'IN','LD','Lakshadweep'),(588,'IN','MP','Madhya Pradesh'),(589,'IN','MH','Maharashtra'),(590,'IN','MN','Manipur'),(591,'IN','ML','Meghalaya'),(592,'IN','MZ','Mizoram'),(593,'IN','NL','Nagaland'),(594,'IN','OR','Odisha'),(595,'IN','PY','Puducherry'),(596,'IN','PB','Punjab'),(597,'IN','RJ','Rajasthan'),(598,'IN','SK','Sikkim'),(599,'IN','TN','Tamil Nadu'),(600,'IN','TG','Telangana'),(601,'IN','TR','Tripura'),(602,'IN','UP','Uttar Pradesh'),(603,'IN','UT','Uttarakhand'),(604,'IN','WB','West Bengal'),(605,'AU','ACT','Australian Capital Territory'),(606,'AU','NSW','New South Wales'),(607,'AU','VIC','Victoria'),(608,'AU','QLD','Queensland'),(609,'AU','SA','South Australia'),(610,'AU','TAS','Tasmania'),(611,'AU','WA','Western Australia'),(612,'AU','NT','Northern Territory'),(613,'BE','VAN','Antwerpen'),(614,'BE','WBR','Brabant wallon'),(615,'BE','BRU','Brussels-Capital Region'),(616,'BE','WHT','Hainaut'),(617,'BE','VLI','Limburg'),(618,'BE','WLG','Liège'),(619,'BE','WLX','Luxembourg'),(620,'BE','WNA','Namur'),(621,'BE','VOV','Oost-Vlaanderen'),(622,'BE','VBR','Vlaams-Brabant'),(623,'BE','VWV','West-Vlaanderen'),(624,'BO','BO-C','Cochabamba'),(625,'BO','BO-H','Chuquisaca'),(626,'BO','BO-B','El Beni'),(627,'BO','BO-L','La Paz'),(628,'BO','BO-O','Oruro'),(629,'BO','BO-N','Pando'),(630,'BO','BO-P','Potosí'),(631,'BO','BO-S','Santa Cruz'),(632,'BO','BO-T','Tarija'),(633,'BG','BG-01','Blagoevgrad'),(634,'BG','BG-02','Burgas'),(635,'BG','BG-03','Varna'),(636,'BG','BG-04','Veliko Tarnovo'),(637,'BG','BG-05','Vidin'),(638,'BG','BG-06','Vratsa'),(639,'BG','BG-07','Gabrovo'),(640,'BG','BG-08','Dobrich'),(641,'BG','BG-09','Kardzhali'),(642,'BG','BG-10','Kyustendil'),(643,'BG','BG-11','Lovech'),(644,'BG','BG-12','Montana'),(645,'BG','BG-13','Pazardzhik'),(646,'BG','BG-14','Pernik'),(647,'BG','BG-15','Pleven'),(648,'BG','BG-16','Plovdiv'),(649,'BG','BG-17','Razgrad'),(650,'BG','BG-18','Ruse'),(651,'BG','BG-19','Silistra'),(652,'BG','BG-20','Sliven'),(653,'BG','BG-21','Smolyan'),(654,'BG','BG-22','Sofia City'),(655,'BG','BG-23','Sofia Province'),(656,'BG','BG-24','Stara Zagora'),(657,'BG','BG-25','Targovishte'),(658,'BG','BG-26','Haskovo'),(659,'BG','BG-27','Shumen'),(660,'BG','BG-28','Yambol'),(661,'CL','CL-AI','Aisén del General Carlos Ibañez del Campo'),(662,'CL','CL-AN','Antofagasta'),(663,'CL','CL-AP','Arica y Parinacota'),(664,'CL','CL-AR','La Araucanía'),(665,'CL','CL-AT','Atacama'),(666,'CL','CL-BI','Biobío'),(667,'CL','CL-CO','Coquimbo'),(668,'CL','CL-LI','Libertador General Bernardo O\'Higgins'),(669,'CL','CL-LL','Los Lagos'),(670,'CL','CL-LR','Los Ríos'),(671,'CL','CL-MA','Magallanes'),(672,'CL','CL-ML','Maule'),(673,'CL','CL-NB','Ñuble'),(674,'CL','CL-RM','Región Metropolitana de Santiago'),(675,'CL','CL-TA','Tarapacá'),(676,'CL','CL-VS','Valparaíso'),(677,'CN','CN-AH','Anhui Sheng'),(678,'CN','CN-BJ','Beijing Shi'),(679,'CN','CN-CQ','Chongqing Shi'),(680,'CN','CN-FJ','Fujian Sheng'),(681,'CN','CN-GS','Gansu Sheng'),(682,'CN','CN-GD','Guangdong Sheng'),(683,'CN','CN-GX','Guangxi Zhuangzu Zizhiqu'),(684,'CN','CN-GZ','Guizhou Sheng'),(685,'CN','CN-HI','Hainan Sheng'),(686,'CN','CN-HE','Hebei Sheng'),(687,'CN','CN-HL','Heilongjiang Sheng'),(688,'CN','CN-HA','Henan Sheng'),(689,'CN','CN-HK','Hong Kong SAR'),(690,'CN','CN-HB','Hubei Sheng'),(691,'CN','CN-HN','Hunan Sheng'),(692,'CN','CN-JS','Jiangsu Sheng'),(693,'CN','CN-JX','Jiangxi Sheng'),(694,'CN','CN-JL','Jilin Sheng'),(695,'CN','CN-LN','Liaoning Sheng'),(696,'CN','CN-MO','Macao SAR'),(697,'CN','CN-NM','Nei Mongol Zizhiqu'),(698,'CN','CN-NX','Ningxia Huizi Zizhiqu'),(699,'CN','CN-QH','Qinghai Sheng'),(700,'CN','CN-SN','Shaanxi Sheng'),(701,'CN','CN-SD','Shandong Sheng'),(702,'CN','CN-SH','Shanghai Shi'),(703,'CN','CN-SX','Shanxi Sheng'),(704,'CN','CN-SC','Sichuan Sheng'),(705,'CN','CN-TW','Taiwan Sheng'),(706,'CN','CN-TJ','Tianjin Shi'),(707,'CN','CN-XJ','Xinjiang Uygur Zizhiqu'),(708,'CN','CN-XZ','Xizang Zizhiqu'),(709,'CN','CN-YN','Yunnan Sheng'),(710,'CN','CN-ZJ','Zhejiang Sheng'),(711,'CO','CO-AMA','Amazonas'),(712,'CO','CO-ANT','Antioquia'),(713,'CO','CO-ARA','Arauca'),(714,'CO','CO-ATL','Atlántico'),(715,'CO','CO-BOL','Bolívar'),(716,'CO','CO-BOY','Boyacá'),(717,'CO','CO-CAL','Caldas'),(718,'CO','CO-CAQ','Caquetá'),(719,'CO','CO-CAS','Casanare'),(720,'CO','CO-CAU','Cauca'),(721,'CO','CO-CES','Cesar'),(722,'CO','CO-CHO','Chocó'),(723,'CO','CO-COR','Córdoba'),(724,'CO','CO-CUN','Cundinamarca'),(725,'CO','CO-GUA','Guainía'),(726,'CO','CO-GUV','Guaviare'),(727,'CO','CO-HUL','Huila'),(728,'CO','CO-LAG','La Guajira'),(729,'CO','CO-MAG','Magdalena'),(730,'CO','CO-MET','Meta'),(731,'CO','CO-NAR','Nariño'),(732,'CO','CO-NSA','Norte de Santander'),(733,'CO','CO-PUT','Putumayo'),(734,'CO','CO-QUI','Quindío'),(735,'CO','CO-RIS','Risaralda'),(736,'CO','CO-SAP','San Andrés y Providencia'),(737,'CO','CO-SAN','Santander'),(738,'CO','CO-SUC','Sucre'),(739,'CO','CO-TOL','Tolima'),(740,'CO','CO-VAC','Valle del Cauca'),(741,'CO','CO-VAU','Vaupés'),(742,'CO','CO-VID','Vichada'),(743,'DK','DK-84','Hovedstaden'),(744,'DK','DK-82','Midtjylland'),(745,'DK','DK-81','Nordjylland'),(746,'DK','DK-85','Sjælland'),(747,'DK','DK-83','Syddanmark'),(748,'EC','EC-A','Azuay'),(749,'EC','EC-B','Bolívar'),(750,'EC','EC-F','Cañar'),(751,'EC','EC-C','Carchi'),(752,'EC','EC-H','Chimborazo'),(753,'EC','EC-X','Cotopaxi'),(754,'EC','EC-O','El Oro'),(755,'EC','EC-E','Esmeraldas'),(756,'EC','EC-W','Galápagos'),(757,'EC','EC-G','Guayas'),(758,'EC','EC-I','Imbabura'),(759,'EC','EC-L','Loja'),(760,'EC','EC-R','Los Ríos'),(761,'EC','EC-M','Manabí'),(762,'EC','EC-S','Morona Santiago'),(763,'EC','EC-N','Napo'),(764,'EC','EC-D','Orellana'),(765,'EC','EC-Y','Pastaza'),(766,'EC','EC-P','Pichincha'),(767,'EC','EC-SE','Santa Elena'),(768,'EC','EC-SD','Santo Domingo de los Tsáchilas'),(769,'EC','EC-U','Sucumbíos'),(770,'EC','EC-T','Tungurahua'),(771,'EC','EC-Z','Zamora Chinchipe'),(772,'GR','GR-A','Anatolikí Makedonía kai Thráki'),(773,'GR','GR-I','Attikí'),(774,'GR','GR-G','Dytikí Elláda'),(775,'GR','GR-C','Dytikí Makedonía'),(776,'GR','GR-F','Ionía Nísia'),(777,'GR','GR-D','Ípeiros'),(778,'GR','GR-B','Kentrikí Makedonía'),(779,'GR','GR-M','Kríti'),(780,'GR','GR-L','Nótio Aigaío'),(781,'GR','GR-J','Pelopónnisos'),(782,'GR','GR-H','Stereá Elláda'),(783,'GR','GR-E','Thessalía'),(784,'GR','GR-K','Vóreio Aigaío'),(785,'GR','GR-69','Ágion Óros'),(786,'GY','GY-BA','Barima-Waini'),(787,'GY','GY-CU','Cuyuni-Mazaruni'),(788,'GY','GY-DE','Demerara-Mahaica'),(789,'GY','GY-EB','East Berbice-Corentyne'),(790,'GY','GY-ES','Essequibo Islands-West Demerara'),(791,'GY','GY-MA','Mahaica-Berbice'),(792,'GY','GY-PM','Pomeroon-Supenaam'),(793,'GY','GY-PT','Potaro-Siparuni'),(794,'GY','GY-UD','Upper Demerara-Berbice'),(795,'GY','GY-UT','Upper Takutu-Upper Essequibo'),(796,'IS','IS-01','Höfuðborgarsvæði'),(797,'IS','IS-02','Suðurnes'),(798,'IS','IS-03','Vesturland'),(799,'IS','IS-04','Vestfirðir'),(800,'IS','IS-05','Norðurland vestra'),(801,'IS','IS-06','Norðurland eystra'),(802,'IS','IS-07','Austurland'),(803,'IS','IS-08','Suðurland'),(804,'IT','AG','Agrigento'),(805,'IT','AL','Alessandria'),(806,'IT','AN','Ancona'),(807,'IT','AO','Aosta'),(808,'IT','AQ','L\'Aquila'),(809,'IT','AR','Arezzo'),(810,'IT','AP','Ascoli-Piceno'),(811,'IT','AT','Asti'),(812,'IT','AV','Avellino'),(813,'IT','BA','Bari'),(814,'IT','BT','Barletta-Andria-Trani'),(815,'IT','BL','Belluno'),(816,'IT','BN','Benevento'),(817,'IT','BG','Bergamo'),(818,'IT','BI','Biella'),(819,'IT','BO','Bologna'),(820,'IT','BZ','Bolzano'),(821,'IT','BS','Brescia'),(822,'IT','BR','Brindisi'),(823,'IT','CA','Cagliari'),(824,'IT','CL','Caltanissetta'),(825,'IT','CB','Campobasso'),(826,'IT','CI','Carbonia Iglesias'),(827,'IT','CE','Caserta'),(828,'IT','CT','Catania'),(829,'IT','CZ','Catanzaro'),(830,'IT','CH','Chieti'),(831,'IT','CO','Como'),(832,'IT','CS','Cosenza'),(833,'IT','CR','Cremona'),(834,'IT','KR','Crotone'),(835,'IT','CN','Cuneo'),(836,'IT','EN','Enna'),(837,'IT','FM','Fermo'),(838,'IT','FE','Ferrara'),(839,'IT','FI','Firenze'),(840,'IT','FG','Foggia'),(841,'IT','FC','Forli-Cesena'),(842,'IT','FR','Frosinone'),(843,'IT','GE','Genova'),(844,'IT','GO','Gorizia'),(845,'IT','GR','Grosseto'),(846,'IT','IM','Imperia'),(847,'IT','IS','Isernia'),(848,'IT','SP','La-Spezia'),(849,'IT','LT','Latina'),(850,'IT','LE','Lecce'),(851,'IT','LC','Lecco'),(852,'IT','LI','Livorno'),(853,'IT','LO','Lodi'),(854,'IT','LU','Lucca'),(855,'IT','MC','Macerata'),(856,'IT','MN','Mantova'),(857,'IT','MS','Massa-Carrara'),(858,'IT','MT','Matera'),(859,'IT','VS','Medio Campidano'),(860,'IT','ME','Messina'),(861,'IT','MI','Milano'),(862,'IT','MO','Modena'),(863,'IT','MB','Monza-Brianza'),(864,'IT','NA','Napoli'),(865,'IT','NO','Novara'),(866,'IT','NU','Nuoro'),(867,'IT','OG','Ogliastra'),(868,'IT','OT','Olbia Tempio'),(869,'IT','OR','Oristano'),(870,'IT','PD','Padova'),(871,'IT','PA','Palermo'),(872,'IT','PR','Parma'),(873,'IT','PV','Pavia'),(874,'IT','PG','Perugia'),(875,'IT','PU','Pesaro-Urbino'),(876,'IT','PE','Pescara'),(877,'IT','PC','Piacenza'),(878,'IT','PI','Pisa'),(879,'IT','PT','Pistoia'),(880,'IT','PN','Pordenone'),(881,'IT','PZ','Potenza'),(882,'IT','PO','Prato'),(883,'IT','RG','Ragusa'),(884,'IT','RA','Ravenna'),(885,'IT','RC','Reggio-Calabria'),(886,'IT','RE','Reggio-Emilia'),(887,'IT','RI','Rieti'),(888,'IT','RN','Rimini'),(889,'IT','RM','Roma'),(890,'IT','RO','Rovigo'),(891,'IT','SA','Salerno'),(892,'IT','SS','Sassari'),(893,'IT','SV','Savona'),(894,'IT','SI','Siena'),(895,'IT','SR','Siracusa'),(896,'IT','SO','Sondrio'),(897,'IT','TA','Taranto'),(898,'IT','TE','Teramo'),(899,'IT','TR','Terni'),(900,'IT','TO','Torino'),(901,'IT','TP','Trapani'),(902,'IT','TN','Trento'),(903,'IT','TV','Treviso'),(904,'IT','TS','Trieste'),(905,'IT','UD','Udine'),(906,'IT','VA','Varese'),(907,'IT','VE','Venezia'),(908,'IT','VB','Verbania'),(909,'IT','VC','Vercelli'),(910,'IT','VR','Verona'),(911,'IT','VV','Vibo-Valentia'),(912,'IT','VI','Vicenza'),(913,'IT','VT','Viterbo'),(914,'MX','AGU','Aguascalientes'),(915,'MX','BCN','Baja California'),(916,'MX','BCS','Baja California Sur'),(917,'MX','CAM','Campeche'),(918,'MX','CHP','Chiapas'),(919,'MX','CHH','Chihuahua'),(920,'MX','CMX','Ciudad de México'),(921,'MX','COA','Coahuila'),(922,'MX','COL','Colima'),(923,'MX','DUR','Durango'),(924,'MX','MEX','Estado de México'),(925,'MX','GUA','Guanajuato'),(926,'MX','GRO','Guerrero'),(927,'MX','HID','Hidalgo'),(928,'MX','JAL','Jalisco'),(929,'MX','MIC','Michoacán'),(930,'MX','MOR','Morelos'),(931,'MX','NAY','Nayarit'),(932,'MX','NLE','Nuevo León'),(933,'MX','OAX','Oaxaca'),(934,'MX','PUE','Puebla'),(935,'MX','QUE','Querétaro'),(936,'MX','ROO','Quintana Roo'),(937,'MX','SLP','San Luis Potosí'),(938,'MX','SIN','Sinaloa'),(939,'MX','SON','Sonora'),(940,'MX','TAB','Tabasco'),(941,'MX','TAM','Tamaulipas'),(942,'MX','TLA','Tlaxcala'),(943,'MX','VER','Veracruz'),(944,'MX','YUC','Yucatán'),(945,'MX','ZAC','Zacatecas'),(946,'PY','PY-ASU','Asunción'),(947,'PY','PY-16','Alto Paraguay'),(948,'PY','PY-10','Alto Paraná'),(949,'PY','PY-13','Amambay'),(950,'PY','PY-19','Boquerón'),(951,'PY','PY-5','Caaguazú'),(952,'PY','PY-6','Caazapá'),(953,'PY','PY-14','Canindeyú'),(954,'PY','PY-11','Central'),(955,'PY','PY-1','Concepción'),(956,'PY','PY-3','Cordillera'),(957,'PY','PY-4','Guairá'),(958,'PY','PY-7','Itapúa'),(959,'PY','PY-8','Misiones'),(960,'PY','PY-12','Ñeembucú'),(961,'PY','PY-9','Paraguarí'),(962,'PY','PY-15','Presidente Hayes'),(963,'PY','PY-2','San Pedro'),(964,'PE','PE-LMA','Municipalidad Metropolitana de Lima'),(965,'PE','PE-AMA','Amazonas'),(966,'PE','PE-ANC','Ancash'),(967,'PE','PE-APU','Apurímac'),(968,'PE','PE-ARE','Arequipa'),(969,'PE','PE-AYA','Ayacucho'),(970,'PE','PE-CAJ','Cajamarca'),(971,'PE','PE-CUS','Cusco'),(972,'PE','PE-CAL','El Callao'),(973,'PE','PE-HUV','Huancavelica'),(974,'PE','PE-HUC','Huánuco'),(975,'PE','PE-ICA','Ica'),(976,'PE','PE-JUN','Junín'),(977,'PE','PE-LAL','La Libertad'),(978,'PE','PE-LAM','Lambayeque'),(979,'PE','PE-LIM','Lima'),(980,'PE','PE-LOR','Loreto'),(981,'PE','PE-MDD','Madre de Dios'),(982,'PE','PE-MOQ','Moquegua'),(983,'PE','PE-PAS','Pasco'),(984,'PE','PE-PIU','Piura'),(985,'PE','PE-PUN','Puno'),(986,'PE','PE-SAM','San Martín'),(987,'PE','PE-TAC','Tacna'),(988,'PE','PE-TUM','Tumbes'),(989,'PE','PE-UCA','Ucayali'),(990,'PL','PL-02','dolnośląskie'),(991,'PL','PL-04','kujawsko-pomorskie'),(992,'PL','PL-06','lubelskie'),(993,'PL','PL-08','lubuskie'),(994,'PL','PL-10','łódzkie'),(995,'PL','PL-12','małopolskie'),(996,'PL','PL-14','mazowieckie'),(997,'PL','PL-16','opolskie'),(998,'PL','PL-18','podkarpackie'),(999,'PL','PL-20','podlaskie'),(1000,'PL','PL-22','pomorskie'),(1001,'PL','PL-24','śląskie'),(1002,'PL','PL-26','świętokrzyskie'),(1003,'PL','PL-28','warmińsko-mazurskie'),(1004,'PL','PL-30','wielkopolskie'),(1005,'PL','PL-32','zachodniopomorskie'),(1006,'PT','PT-01','Aveiro'),(1007,'PT','PT-02','Beja'),(1008,'PT','PT-03','Braga'),(1009,'PT','PT-04','Bragança'),(1010,'PT','PT-05','Castelo Branco'),(1011,'PT','PT-06','Coimbra'),(1012,'PT','PT-07','Évora'),(1013,'PT','PT-08','Faro'),(1014,'PT','PT-09','Guarda'),(1015,'PT','PT-10','Leiria'),(1016,'PT','PT-11','Lisboa'),(1017,'PT','PT-12','Portalegre'),(1018,'PT','PT-13','Porto'),(1019,'PT','PT-14','Santarém'),(1020,'PT','PT-15','Setúbal'),(1021,'PT','PT-16','Viana do Castelo'),(1022,'PT','PT-17','Vila Real'),(1023,'PT','PT-18','Viseu'),(1024,'PT','PT-20','Região Autónoma dos Açores'),(1025,'PT','PT-30','Região Autónoma da Madeira'),(1026,'SR','SR-BR','Brokopondo'),(1027,'SR','SR-CM','Commewijne'),(1028,'SR','SR-CR','Coronie'),(1029,'SR','SR-MA','Marowijne'),(1030,'SR','SR-NI','Nickerie'),(1031,'SR','SR-PR','Para'),(1032,'SR','SR-PM','Paramaribo'),(1033,'SR','SR-SA','Saramacca'),(1034,'SR','SR-SI','Sipaliwini'),(1035,'SR','SR-WA','Wanica'),(1036,'SE','SE-K','Blekinge län'),(1037,'SE','SE-W','Dalarnas län'),(1038,'SE','SE-I','Gotlands län'),(1039,'SE','SE-X','Gävleborgs län'),(1040,'SE','SE-N','Hallands län'),(1041,'SE','SE-Z','Jämtlands län'),(1042,'SE','SE-F','Jönköpings län'),(1043,'SE','SE-H','Kalmar län'),(1044,'SE','SE-G','Kronobergs län'),(1045,'SE','SE-BD','Norrbottens län'),(1046,'SE','SE-M','Skåne län'),(1047,'SE','SE-AB','Stockholms län'),(1048,'SE','SE-D','Södermanlands län'),(1049,'SE','SE-C','Uppsala län'),(1050,'SE','SE-S','Värmlands län'),(1051,'SE','SE-AC','Västerbottens län'),(1052,'SE','SE-Y','Västernorrlands län'),(1053,'SE','SE-U','Västmanlands län'),(1054,'SE','SE-O','Västra Götalands län'),(1055,'SE','SE-T','Örebro län'),(1056,'SE','SE-E','Östergötlands län'),(1057,'UY','UY-AR','Artigas'),(1058,'UY','UY-CA','Canelones'),(1059,'UY','UY-CL','Cerro Largo'),(1060,'UY','UY-CO','Colonia'),(1061,'UY','UY-DU','Durazno'),(1062,'UY','UY-FS','Flores'),(1063,'UY','UY-FD','Florida'),(1064,'UY','UY-LA','Lavalleja'),(1065,'UY','UY-MA','Maldonado'),(1066,'UY','UY-MO','Montevideo'),(1067,'UY','UY-PA','Paysandu'),(1068,'UY','UY-RN','Río Negro'),(1069,'UY','UY-RV','Rivera'),(1070,'UY','UY-RO','Rocha'),(1071,'UY','UY-SA','Salto'),(1072,'UY','UY-SJ','San José'),(1073,'UY','UY-SO','Soriano'),(1074,'UY','UY-TA','Tacuarembó'),(1075,'UY','UY-TT','Treinta y Tres'),(1076,'VE','VE-W','Dependencias Federales'),(1077,'VE','VE-A','Distrito Capital'),(1078,'VE','VE-Z','Amazonas'),(1079,'VE','VE-B','Anzoátegui'),(1080,'VE','VE-C','Apure'),(1081,'VE','VE-D','Aragua'),(1082,'VE','VE-E','Barinas'),(1083,'VE','VE-F','Bolívar'),(1084,'VE','VE-G','Carabobo'),(1085,'VE','VE-H','Cojedes'),(1086,'VE','VE-Y','Delta Amacuro'),(1087,'VE','VE-I','Falcón'),(1088,'VE','VE-J','Guárico'),(1089,'VE','VE-K','Lara'),(1090,'VE','VE-L','Mérida'),(1091,'VE','VE-M','Miranda'),(1092,'VE','VE-N','Monagas'),(1093,'VE','VE-O','Nueva Esparta'),(1094,'VE','VE-P','Portuguesa'),(1095,'VE','VE-R','Sucre'),(1096,'VE','VE-S','Táchira'),(1097,'VE','VE-T','Trujillo'),(1098,'VE','VE-X','Vargas'),(1099,'VE','VE-U','Yaracuy'),(1100,'VE','VE-V','Zulia');
/*!40000 ALTER TABLE `directory_country_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country_region_name`
--

DROP TABLE IF EXISTS `directory_country_region_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directory_country_region_name` (
  `locale` varchar(16) NOT NULL COMMENT 'Locale',
  `region_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Region ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`),
  CONSTRAINT `DIR_COUNTRY_REGION_NAME_REGION_ID_DIR_COUNTRY_REGION_REGION_ID` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Directory Country Region Name';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country_region_name`
--

LOCK TABLES `directory_country_region_name` WRITE;
/*!40000 ALTER TABLE `directory_country_region_name` DISABLE KEYS */;
INSERT INTO `directory_country_region_name` VALUES ('en_US',1,'Alabama'),('en_US',2,'Alaska'),('en_US',3,'American Samoa'),('en_US',4,'Arizona'),('en_US',5,'Arkansas'),('en_US',6,'Armed Forces Africa'),('en_US',7,'Armed Forces Americas'),('en_US',8,'Armed Forces Canada'),('en_US',9,'Armed Forces Europe'),('en_US',10,'Armed Forces Middle East'),('en_US',11,'Armed Forces Pacific'),('en_US',12,'California'),('en_US',13,'Colorado'),('en_US',14,'Connecticut'),('en_US',15,'Delaware'),('en_US',16,'District of Columbia'),('en_US',17,'Federated States Of Micronesia'),('en_US',18,'Florida'),('en_US',19,'Georgia'),('en_US',20,'Guam'),('en_US',21,'Hawaii'),('en_US',22,'Idaho'),('en_US',23,'Illinois'),('en_US',24,'Indiana'),('en_US',25,'Iowa'),('en_US',26,'Kansas'),('en_US',27,'Kentucky'),('en_US',28,'Louisiana'),('en_US',29,'Maine'),('en_US',30,'Marshall Islands'),('en_US',31,'Maryland'),('en_US',32,'Massachusetts'),('en_US',33,'Michigan'),('en_US',34,'Minnesota'),('en_US',35,'Mississippi'),('en_US',36,'Missouri'),('en_US',37,'Montana'),('en_US',38,'Nebraska'),('en_US',39,'Nevada'),('en_US',40,'New Hampshire'),('en_US',41,'New Jersey'),('en_US',42,'New Mexico'),('en_US',43,'New York'),('en_US',44,'North Carolina'),('en_US',45,'North Dakota'),('en_US',46,'Northern Mariana Islands'),('en_US',47,'Ohio'),('en_US',48,'Oklahoma'),('en_US',49,'Oregon'),('en_US',50,'Palau'),('en_US',51,'Pennsylvania'),('en_US',52,'Puerto Rico'),('en_US',53,'Rhode Island'),('en_US',54,'South Carolina'),('en_US',55,'South Dakota'),('en_US',56,'Tennessee'),('en_US',57,'Texas'),('en_US',58,'Utah'),('en_US',59,'Vermont'),('en_US',60,'Virgin Islands'),('en_US',61,'Virginia'),('en_US',62,'Washington'),('en_US',63,'West Virginia'),('en_US',64,'Wisconsin'),('en_US',65,'Wyoming'),('en_US',66,'Alberta'),('en_US',67,'British Columbia'),('en_US',68,'Manitoba'),('en_US',69,'Newfoundland and Labrador'),('en_US',70,'New Brunswick'),('en_US',71,'Nova Scotia'),('en_US',72,'Northwest Territories'),('en_US',73,'Nunavut'),('en_US',74,'Ontario'),('en_US',75,'Prince Edward Island'),('en_US',76,'Quebec'),('en_US',77,'Saskatchewan'),('en_US',78,'Yukon Territory'),('en_US',79,'Niedersachsen'),('en_US',80,'Baden-Württemberg'),('en_US',81,'Bayern'),('en_US',82,'Berlin'),('en_US',83,'Brandenburg'),('en_US',84,'Bremen'),('en_US',85,'Hamburg'),('en_US',86,'Hessen'),('en_US',87,'Mecklenburg-Vorpommern'),('en_US',88,'Nordrhein-Westfalen'),('en_US',89,'Rheinland-Pfalz'),('en_US',90,'Saarland'),('en_US',91,'Sachsen'),('en_US',92,'Sachsen-Anhalt'),('en_US',93,'Schleswig-Holstein'),('en_US',94,'Thüringen'),('en_US',95,'Wien'),('en_US',96,'Niederösterreich'),('en_US',97,'Oberösterreich'),('en_US',98,'Salzburg'),('en_US',99,'Kärnten'),('en_US',100,'Steiermark'),('en_US',101,'Tirol'),('en_US',102,'Burgenland'),('en_US',103,'Vorarlberg'),('en_US',104,'Aargau'),('en_US',105,'Appenzell Innerrhoden'),('en_US',106,'Appenzell Ausserrhoden'),('en_US',107,'Bern'),('en_US',108,'Basel-Landschaft'),('en_US',109,'Basel-Stadt'),('en_US',110,'Freiburg'),('en_US',111,'Genf'),('en_US',112,'Glarus'),('en_US',113,'Graubünden'),('en_US',114,'Jura'),('en_US',115,'Luzern'),('en_US',116,'Neuenburg'),('en_US',117,'Nidwalden'),('en_US',118,'Obwalden'),('en_US',119,'St. Gallen'),('en_US',120,'Schaffhausen'),('en_US',121,'Solothurn'),('en_US',122,'Schwyz'),('en_US',123,'Thurgau'),('en_US',124,'Tessin'),('en_US',125,'Uri'),('en_US',126,'Waadt'),('en_US',127,'Wallis'),('en_US',128,'Zug'),('en_US',129,'Zürich'),('en_US',130,'A Coruña'),('en_US',131,'Alava'),('en_US',132,'Albacete'),('en_US',133,'Alicante'),('en_US',134,'Almeria'),('en_US',135,'Asturias'),('en_US',136,'Avila'),('en_US',137,'Badajoz'),('en_US',138,'Baleares'),('en_US',139,'Barcelona'),('en_US',140,'Burgos'),('en_US',141,'Caceres'),('en_US',142,'Cadiz'),('en_US',143,'Cantabria'),('en_US',144,'Castellon'),('en_US',145,'Ceuta'),('en_US',146,'Ciudad Real'),('en_US',147,'Cordoba'),('en_US',148,'Cuenca'),('en_US',149,'Girona'),('en_US',150,'Granada'),('en_US',151,'Guadalajara'),('en_US',152,'Guipuzcoa'),('en_US',153,'Huelva'),('en_US',154,'Huesca'),('en_US',155,'Jaen'),('en_US',156,'La Rioja'),('en_US',157,'Las Palmas'),('en_US',158,'Leon'),('en_US',159,'Lleida'),('en_US',160,'Lugo'),('en_US',161,'Madrid'),('en_US',162,'Malaga'),('en_US',163,'Melilla'),('en_US',164,'Murcia'),('en_US',165,'Navarra'),('en_US',166,'Ourense'),('en_US',167,'Palencia'),('en_US',168,'Pontevedra'),('en_US',169,'Salamanca'),('en_US',170,'Santa Cruz de Tenerife'),('en_US',171,'Segovia'),('en_US',172,'Sevilla'),('en_US',173,'Soria'),('en_US',174,'Tarragona'),('en_US',175,'Teruel'),('en_US',176,'Toledo'),('en_US',177,'Valencia'),('en_US',178,'Valladolid'),('en_US',179,'Vizcaya'),('en_US',180,'Zamora'),('en_US',181,'Zaragoza'),('en_US',182,'Ain'),('en_US',183,'Aisne'),('en_US',184,'Allier'),('en_US',185,'Alpes-de-Haute-Provence'),('en_US',186,'Hautes-Alpes'),('en_US',187,'Alpes-Maritimes'),('en_US',188,'Ardèche'),('en_US',189,'Ardennes'),('en_US',190,'Ariège'),('en_US',191,'Aube'),('en_US',192,'Aude'),('en_US',193,'Aveyron'),('en_US',194,'Bouches-du-Rhône'),('en_US',195,'Calvados'),('en_US',196,'Cantal'),('en_US',197,'Charente'),('en_US',198,'Charente-Maritime'),('en_US',199,'Cher'),('en_US',200,'Corrèze'),('en_US',201,'Corse-du-Sud'),('en_US',202,'Haute-Corse'),('en_US',203,'Côte-d\'Or'),('en_US',204,'Côtes-d\'Armor'),('en_US',205,'Creuse'),('en_US',206,'Dordogne'),('en_US',207,'Doubs'),('en_US',208,'Drôme'),('en_US',209,'Eure'),('en_US',210,'Eure-et-Loir'),('en_US',211,'Finistère'),('en_US',212,'Gard'),('en_US',213,'Haute-Garonne'),('en_US',214,'Gers'),('en_US',215,'Gironde'),('en_US',216,'Hérault'),('en_US',217,'Ille-et-Vilaine'),('en_US',218,'Indre'),('en_US',219,'Indre-et-Loire'),('en_US',220,'Isère'),('en_US',221,'Jura'),('en_US',222,'Landes'),('en_US',223,'Loir-et-Cher'),('en_US',224,'Loire'),('en_US',225,'Haute-Loire'),('en_US',226,'Loire-Atlantique'),('en_US',227,'Loiret'),('en_US',228,'Lot'),('en_US',229,'Lot-et-Garonne'),('en_US',230,'Lozère'),('en_US',231,'Maine-et-Loire'),('en_US',232,'Manche'),('en_US',233,'Marne'),('en_US',234,'Haute-Marne'),('en_US',235,'Mayenne'),('en_US',236,'Meurthe-et-Moselle'),('en_US',237,'Meuse'),('en_US',238,'Morbihan'),('en_US',239,'Moselle'),('en_US',240,'Nièvre'),('en_US',241,'Nord'),('en_US',242,'Oise'),('en_US',243,'Orne'),('en_US',244,'Pas-de-Calais'),('en_US',245,'Puy-de-Dôme'),('en_US',246,'Pyrénées-Atlantiques'),('en_US',247,'Hautes-Pyrénées'),('en_US',248,'Pyrénées-Orientales'),('en_US',249,'Bas-Rhin'),('en_US',250,'Haut-Rhin'),('en_US',251,'Rhône'),('en_US',252,'Haute-Saône'),('en_US',253,'Saône-et-Loire'),('en_US',254,'Sarthe'),('en_US',255,'Savoie'),('en_US',256,'Haute-Savoie'),('en_US',257,'Paris'),('en_US',258,'Seine-Maritime'),('en_US',259,'Seine-et-Marne'),('en_US',260,'Yvelines'),('en_US',261,'Deux-Sèvres'),('en_US',262,'Somme'),('en_US',263,'Tarn'),('en_US',264,'Tarn-et-Garonne'),('en_US',265,'Var'),('en_US',266,'Vaucluse'),('en_US',267,'Vendée'),('en_US',268,'Vienne'),('en_US',269,'Haute-Vienne'),('en_US',270,'Vosges'),('en_US',271,'Yonne'),('en_US',272,'Territoire-de-Belfort'),('en_US',273,'Essonne'),('en_US',274,'Hauts-de-Seine'),('en_US',275,'Seine-Saint-Denis'),('en_US',276,'Val-de-Marne'),('en_US',277,'Val-d\'Oise'),('en_US',278,'Alba'),('en_US',279,'Arad'),('en_US',280,'Argeş'),('en_US',281,'Bacău'),('en_US',282,'Bihor'),('en_US',283,'Bistriţa-Năsăud'),('en_US',284,'Botoşani'),('en_US',285,'Braşov'),('en_US',286,'Brăila'),('en_US',287,'Bucureşti'),('en_US',288,'Buzău'),('en_US',289,'Caraş-Severin'),('en_US',290,'Călăraşi'),('en_US',291,'Cluj'),('en_US',292,'Constanţa'),('en_US',293,'Covasna'),('en_US',294,'Dâmboviţa'),('en_US',295,'Dolj'),('en_US',296,'Galaţi'),('en_US',297,'Giurgiu'),('en_US',298,'Gorj'),('en_US',299,'Harghita'),('en_US',300,'Hunedoara'),('en_US',301,'Ialomiţa'),('en_US',302,'Iaşi'),('en_US',303,'Ilfov'),('en_US',304,'Maramureş'),('en_US',305,'Mehedinţi'),('en_US',306,'Mureş'),('en_US',307,'Neamţ'),('en_US',308,'Olt'),('en_US',309,'Prahova'),('en_US',310,'Satu-Mare'),('en_US',311,'Sălaj'),('en_US',312,'Sibiu'),('en_US',313,'Suceava'),('en_US',314,'Teleorman'),('en_US',315,'Timiş'),('en_US',316,'Tulcea'),('en_US',317,'Vaslui'),('en_US',318,'Vâlcea'),('en_US',319,'Vrancea'),('en_US',320,'Lappi'),('en_US',321,'Pohjois-Pohjanmaa'),('en_US',322,'Kainuu'),('en_US',323,'Pohjois-Karjala'),('en_US',324,'Pohjois-Savo'),('en_US',325,'Etelä-Savo'),('en_US',326,'Etelä-Pohjanmaa'),('en_US',327,'Pohjanmaa'),('en_US',328,'Pirkanmaa'),('en_US',329,'Satakunta'),('en_US',330,'Keski-Pohjanmaa'),('en_US',331,'Keski-Suomi'),('en_US',332,'Varsinais-Suomi'),('en_US',333,'Etelä-Karjala'),('en_US',334,'Päijät-Häme'),('en_US',335,'Kanta-Häme'),('en_US',336,'Uusimaa'),('en_US',337,'Itä-Uusimaa'),('en_US',338,'Kymenlaakso'),('en_US',339,'Ahvenanmaa'),('en_US',340,'Harjumaa'),('en_US',341,'Hiiumaa'),('en_US',342,'Ida-Virumaa'),('en_US',343,'Jõgevamaa'),('en_US',344,'Järvamaa'),('en_US',345,'Läänemaa'),('en_US',346,'Lääne-Virumaa'),('en_US',347,'Põlvamaa'),('en_US',348,'Pärnumaa'),('en_US',349,'Raplamaa'),('en_US',350,'Saaremaa'),('en_US',351,'Tartumaa'),('en_US',352,'Valgamaa'),('en_US',353,'Viljandimaa'),('en_US',354,'Võrumaa'),('en_US',355,'Daugavpils'),('en_US',356,'Jelgava'),('en_US',357,'Jēkabpils'),('en_US',358,'Jūrmala'),('en_US',359,'Liepāja'),('en_US',360,'Liepājas novads'),('en_US',361,'Rēzekne'),('en_US',362,'Rīga'),('en_US',363,'Rīgas novads'),('en_US',364,'Valmiera'),('en_US',365,'Ventspils'),('en_US',366,'Aglonas novads'),('en_US',367,'Aizkraukles novads'),('en_US',368,'Aizputes novads'),('en_US',369,'Aknīstes novads'),('en_US',370,'Alojas novads'),('en_US',371,'Alsungas novads'),('en_US',372,'Alūksnes novads'),('en_US',373,'Amatas novads'),('en_US',374,'Apes novads'),('en_US',375,'Auces novads'),('en_US',376,'Babītes novads'),('en_US',377,'Baldones novads'),('en_US',378,'Baltinavas novads'),('en_US',379,'Balvu novads'),('en_US',380,'Bauskas novads'),('en_US',381,'Beverīnas novads'),('en_US',382,'Brocēnu novads'),('en_US',383,'Burtnieku novads'),('en_US',384,'Carnikavas novads'),('en_US',385,'Cesvaines novads'),('en_US',386,'Ciblas novads'),('en_US',387,'Cēsu novads'),('en_US',388,'Dagdas novads'),('en_US',389,'Daugavpils novads'),('en_US',390,'Dobeles novads'),('en_US',391,'Dundagas novads'),('en_US',392,'Durbes novads'),('en_US',393,'Engures novads'),('en_US',394,'Garkalnes novads'),('en_US',395,'Grobiņas novads'),('en_US',396,'Gulbenes novads'),('en_US',397,'Iecavas novads'),('en_US',398,'Ikšķiles novads'),('en_US',399,'Ilūkstes novads'),('en_US',400,'Inčukalna novads'),('en_US',401,'Jaunjelgavas novads'),('en_US',402,'Jaunpiebalgas novads'),('en_US',403,'Jaunpils novads'),('en_US',404,'Jelgavas novads'),('en_US',405,'Jēkabpils novads'),('en_US',406,'Kandavas novads'),('en_US',407,'Kokneses novads'),('en_US',408,'Krimuldas novads'),('en_US',409,'Krustpils novads'),('en_US',410,'Krāslavas novads'),('en_US',411,'Kuldīgas novads'),('en_US',412,'Kārsavas novads'),('en_US',413,'Lielvārdes novads'),('en_US',414,'Limbažu novads'),('en_US',415,'Lubānas novads'),('en_US',416,'Ludzas novads'),('en_US',417,'Līgatnes novads'),('en_US',418,'Līvānu novads'),('en_US',419,'Madonas novads'),('en_US',420,'Mazsalacas novads'),('en_US',421,'Mālpils novads'),('en_US',422,'Mārupes novads'),('en_US',423,'Naukšēnu novads'),('en_US',424,'Neretas novads'),('en_US',425,'Nīcas novads'),('en_US',426,'Ogres novads'),('en_US',427,'Olaines novads'),('en_US',428,'Ozolnieku novads'),('en_US',429,'Preiļu novads'),('en_US',430,'Priekules novads'),('en_US',431,'Priekuļu novads'),('en_US',432,'Pārgaujas novads'),('en_US',433,'Pāvilostas novads'),('en_US',434,'Pļaviņu novads'),('en_US',435,'Raunas novads'),('en_US',436,'Riebiņu novads'),('en_US',437,'Rojas novads'),('en_US',438,'Ropažu novads'),('en_US',439,'Rucavas novads'),('en_US',440,'Rugāju novads'),('en_US',441,'Rundāles novads'),('en_US',442,'Rēzeknes novads'),('en_US',443,'Rūjienas novads'),('en_US',444,'Salacgrīvas novads'),('en_US',445,'Salas novads'),('en_US',446,'Salaspils novads'),('en_US',447,'Saldus novads'),('en_US',448,'Saulkrastu novads'),('en_US',449,'Siguldas novads'),('en_US',450,'Skrundas novads'),('en_US',451,'Skrīveru novads'),('en_US',452,'Smiltenes novads'),('en_US',453,'Stopiņu novads'),('en_US',454,'Strenču novads'),('en_US',455,'Sējas novads'),('en_US',456,'Talsu novads'),('en_US',457,'Tukuma novads'),('en_US',458,'Tērvetes novads'),('en_US',459,'Vaiņodes novads'),('en_US',460,'Valkas novads'),('en_US',461,'Valmieras novads'),('en_US',462,'Varakļānu novads'),('en_US',463,'Vecpiebalgas novads'),('en_US',464,'Vecumnieku novads'),('en_US',465,'Ventspils novads'),('en_US',466,'Viesītes novads'),('en_US',467,'Viļakas novads'),('en_US',468,'Viļānu novads'),('en_US',469,'Vārkavas novads'),('en_US',470,'Zilupes novads'),('en_US',471,'Ādažu novads'),('en_US',472,'Ērgļu novads'),('en_US',473,'Ķeguma novads'),('en_US',474,'Ķekavas novads'),('en_US',475,'Alytaus Apskritis'),('en_US',476,'Kauno Apskritis'),('en_US',477,'Klaipėdos Apskritis'),('en_US',478,'Marijampolės Apskritis'),('en_US',479,'Panevėžio Apskritis'),('en_US',480,'Šiaulių Apskritis'),('en_US',481,'Tauragės Apskritis'),('en_US',482,'Telšių Apskritis'),('en_US',483,'Utenos Apskritis'),('en_US',484,'Vilniaus Apskritis'),('en_US',485,'Acre'),('en_US',486,'Alagoas'),('en_US',487,'Amapá'),('en_US',488,'Amazonas'),('en_US',489,'Bahia'),('en_US',490,'Ceará'),('en_US',491,'Espírito Santo'),('en_US',492,'Goiás'),('en_US',493,'Maranhão'),('en_US',494,'Mato Grosso'),('en_US',495,'Mato Grosso do Sul'),('en_US',496,'Minas Gerais'),('en_US',497,'Pará'),('en_US',498,'Paraíba'),('en_US',499,'Paraná'),('en_US',500,'Pernambuco'),('en_US',501,'Piauí'),('en_US',502,'Rio de Janeiro'),('en_US',503,'Rio Grande do Norte'),('en_US',504,'Rio Grande do Sul'),('en_US',505,'Rondônia'),('en_US',506,'Roraima'),('en_US',507,'Santa Catarina'),('en_US',508,'São Paulo'),('en_US',509,'Sergipe'),('en_US',510,'Tocantins'),('en_US',511,'Distrito Federal'),('en_US',512,'Berat'),('en_US',513,'Dibër'),('en_US',514,'Durrës'),('en_US',515,'Elbasan'),('en_US',516,'Fier'),('en_US',517,'Gjirokastër'),('en_US',518,'Korçë'),('en_US',519,'Kukës'),('en_US',520,'Lezhë'),('en_US',521,'Shkodër'),('en_US',522,'Tiranë'),('en_US',523,'Vlorë'),('en_US',524,'Ciudad Autónoma de Buenos Aires'),('en_US',525,'Buenos Aires'),('en_US',526,'Catamarca'),('en_US',527,'Chaco'),('en_US',528,'Chubut'),('en_US',529,'Córdoba'),('en_US',530,'Corrientes'),('en_US',531,'Entre Ríos'),('en_US',532,'Formosa'),('en_US',533,'Jujuy'),('en_US',534,'La Pampa'),('en_US',535,'La Rioja'),('en_US',536,'Mendoza'),('en_US',537,'Misiones'),('en_US',538,'Neuquén'),('en_US',539,'Río Negro'),('en_US',540,'Salta'),('en_US',541,'San Juan'),('en_US',542,'San Luis'),('en_US',543,'Santa Cruz'),('en_US',544,'Santa Fe'),('en_US',545,'Santiago del Estero'),('en_US',546,'Tierra del Fuego'),('en_US',547,'Tucumán'),('en_US',548,'Zagrebačka županija'),('en_US',549,'Krapinsko-zagorska županija'),('en_US',550,'Sisačko-moslavačka županija'),('en_US',551,'Karlovačka županija'),('en_US',552,'Varaždinska županija'),('en_US',553,'Koprivničko-križevačka županija'),('en_US',554,'Bjelovarsko-bilogorska županija'),('en_US',555,'Primorsko-goranska županija'),('en_US',556,'Ličko-senjska županija'),('en_US',557,'Virovitičko-podravska županija'),('en_US',558,'Požeško-slavonska županija'),('en_US',559,'Brodsko-posavska županija'),('en_US',560,'Zadarska županija'),('en_US',561,'Osječko-baranjska županija'),('en_US',562,'Šibensko-kninska županija'),('en_US',563,'Vukovarsko-srijemska županija'),('en_US',564,'Splitsko-dalmatinska županija'),('en_US',565,'Istarska županija'),('en_US',566,'Dubrovačko-neretvanska županija'),('en_US',567,'Međimurska županija'),('en_US',568,'Grad Zagreb'),('en_US',569,'Andaman and Nicobar Islands'),('en_US',570,'Andhra Pradesh'),('en_US',571,'Arunachal Pradesh'),('en_US',572,'Assam'),('en_US',573,'Bihar'),('en_US',574,'Chandigarh'),('en_US',575,'Chhattisgarh'),('en_US',576,'Dadra and Nagar Haveli'),('en_US',577,'Daman and Diu'),('en_US',578,'Delhi'),('en_US',579,'Goa'),('en_US',580,'Gujarat'),('en_US',581,'Haryana'),('en_US',582,'Himachal Pradesh'),('en_US',583,'Jammu and Kashmir'),('en_US',584,'Jharkhand'),('en_US',585,'Karnataka'),('en_US',586,'Kerala'),('en_US',587,'Lakshadweep'),('en_US',588,'Madhya Pradesh'),('en_US',589,'Maharashtra'),('en_US',590,'Manipur'),('en_US',591,'Meghalaya'),('en_US',592,'Mizoram'),('en_US',593,'Nagaland'),('en_US',594,'Odisha'),('en_US',595,'Puducherry'),('en_US',596,'Punjab'),('en_US',597,'Rajasthan'),('en_US',598,'Sikkim'),('en_US',599,'Tamil Nadu'),('en_US',600,'Telangana'),('en_US',601,'Tripura'),('en_US',602,'Uttar Pradesh'),('en_US',603,'Uttarakhand'),('en_US',604,'West Bengal'),('en_US',605,'Australian Capital Territory'),('en_US',606,'New South Wales'),('en_US',607,'Victoria'),('en_US',608,'Queensland'),('en_US',609,'South Australia'),('en_US',610,'Tasmania'),('en_US',611,'Western Australia'),('en_US',612,'Northern Territory'),('en_US',613,'Antwerpen'),('en_US',614,'Brabant wallon'),('en_US',615,'Brussels-Capital Region'),('en_US',616,'Hainaut'),('en_US',617,'Limburg'),('en_US',618,'Liège'),('en_US',619,'Luxembourg'),('en_US',620,'Namur'),('en_US',621,'Oost-Vlaanderen'),('en_US',622,'Vlaams-Brabant'),('en_US',623,'West-Vlaanderen'),('en_US',624,'Cochabamba'),('en_US',625,'Chuquisaca'),('en_US',626,'El Beni'),('en_US',627,'La Paz'),('en_US',628,'Oruro'),('en_US',629,'Pando'),('en_US',630,'Potosí'),('en_US',631,'Santa Cruz'),('en_US',632,'Tarija'),('en_US',633,'Blagoevgrad'),('en_US',634,'Burgas'),('en_US',635,'Varna'),('en_US',636,'Veliko Tarnovo'),('en_US',637,'Vidin'),('en_US',638,'Vratsa'),('en_US',639,'Gabrovo'),('en_US',640,'Dobrich'),('en_US',641,'Kardzhali'),('en_US',642,'Kyustendil'),('en_US',643,'Lovech'),('en_US',644,'Montana'),('en_US',645,'Pazardzhik'),('en_US',646,'Pernik'),('en_US',647,'Pleven'),('en_US',648,'Plovdiv'),('en_US',649,'Razgrad'),('en_US',650,'Ruse'),('en_US',651,'Silistra'),('en_US',652,'Sliven'),('en_US',653,'Smolyan'),('en_US',654,'Sofia City'),('en_US',655,'Sofia Province'),('en_US',656,'Stara Zagora'),('en_US',657,'Targovishte'),('en_US',658,'Haskovo'),('en_US',659,'Shumen'),('en_US',660,'Yambol'),('en_US',661,'Aisén del General Carlos Ibañez del Campo'),('en_US',662,'Antofagasta'),('en_US',663,'Arica y Parinacota'),('en_US',664,'La Araucanía'),('en_US',665,'Atacama'),('en_US',666,'Biobío'),('en_US',667,'Coquimbo'),('en_US',668,'Libertador General Bernardo O\'Higgins'),('en_US',669,'Los Lagos'),('en_US',670,'Los Ríos'),('en_US',671,'Magallanes'),('en_US',672,'Maule'),('en_US',673,'Ñuble'),('en_US',674,'Región Metropolitana de Santiago'),('en_US',675,'Tarapacá'),('en_US',676,'Valparaíso'),('en_US',677,'Anhui Sheng'),('en_US',678,'Beijing Shi'),('en_US',679,'Chongqing Shi'),('en_US',680,'Fujian Sheng'),('en_US',681,'Gansu Sheng'),('en_US',682,'Guangdong Sheng'),('en_US',683,'Guangxi Zhuangzu Zizhiqu'),('en_US',684,'Guizhou Sheng'),('en_US',685,'Hainan Sheng'),('en_US',686,'Hebei Sheng'),('en_US',687,'Heilongjiang Sheng'),('en_US',688,'Henan Sheng'),('en_US',689,'Hong Kong SAR'),('en_US',690,'Hubei Sheng'),('en_US',691,'Hunan Sheng'),('en_US',692,'Jiangsu Sheng'),('en_US',693,'Jiangxi Sheng'),('en_US',694,'Jilin Sheng'),('en_US',695,'Liaoning Sheng'),('en_US',696,'Macao SAR'),('en_US',697,'Nei Mongol Zizhiqu'),('en_US',698,'Ningxia Huizi Zizhiqu'),('en_US',699,'Qinghai Sheng'),('en_US',700,'Shaanxi Sheng'),('en_US',701,'Shandong Sheng'),('en_US',702,'Shanghai Shi'),('en_US',703,'Shanxi Sheng'),('en_US',704,'Sichuan Sheng'),('en_US',705,'Taiwan Sheng'),('en_US',706,'Tianjin Shi'),('en_US',707,'Xinjiang Uygur Zizhiqu'),('en_US',708,'Xizang Zizhiqu'),('en_US',709,'Yunnan Sheng'),('en_US',710,'Zhejiang Sheng'),('en_US',711,'Amazonas'),('en_US',712,'Antioquia'),('en_US',713,'Arauca'),('en_US',714,'Atlántico'),('en_US',715,'Bolívar'),('en_US',716,'Boyacá'),('en_US',717,'Caldas'),('en_US',718,'Caquetá'),('en_US',719,'Casanare'),('en_US',720,'Cauca'),('en_US',721,'Cesar'),('en_US',722,'Chocó'),('en_US',723,'Córdoba'),('en_US',724,'Cundinamarca'),('en_US',725,'Guainía'),('en_US',726,'Guaviare'),('en_US',727,'Huila'),('en_US',728,'La Guajira'),('en_US',729,'Magdalena'),('en_US',730,'Meta'),('en_US',731,'Nariño'),('en_US',732,'Norte de Santander'),('en_US',733,'Putumayo'),('en_US',734,'Quindío'),('en_US',735,'Risaralda'),('en_US',736,'San Andrés y Providencia'),('en_US',737,'Santander'),('en_US',738,'Sucre'),('en_US',739,'Tolima'),('en_US',740,'Valle del Cauca'),('en_US',741,'Vaupés'),('en_US',742,'Vichada'),('en_US',743,'Hovedstaden'),('en_US',744,'Midtjylland'),('en_US',745,'Nordjylland'),('en_US',746,'Sjælland'),('en_US',747,'Syddanmark'),('en_US',748,'Azuay'),('en_US',749,'Bolívar'),('en_US',750,'Cañar'),('en_US',751,'Carchi'),('en_US',752,'Chimborazo'),('en_US',753,'Cotopaxi'),('en_US',754,'El Oro'),('en_US',755,'Esmeraldas'),('en_US',756,'Galápagos'),('en_US',757,'Guayas'),('en_US',758,'Imbabura'),('en_US',759,'Loja'),('en_US',760,'Los Ríos'),('en_US',761,'Manabí'),('en_US',762,'Morona Santiago'),('en_US',763,'Napo'),('en_US',764,'Orellana'),('en_US',765,'Pastaza'),('en_US',766,'Pichincha'),('en_US',767,'Santa Elena'),('en_US',768,'Santo Domingo de los Tsáchilas'),('en_US',769,'Sucumbíos'),('en_US',770,'Tungurahua'),('en_US',771,'Zamora Chinchipe'),('en_US',772,'Anatolikí Makedonía kai Thráki'),('en_US',773,'Attikí'),('en_US',774,'Dytikí Elláda'),('en_US',775,'Dytikí Makedonía'),('en_US',776,'Ionía Nísia'),('en_US',777,'Ípeiros'),('en_US',778,'Kentrikí Makedonía'),('en_US',779,'Kríti'),('en_US',780,'Nótio Aigaío'),('en_US',781,'Pelopónnisos'),('en_US',782,'Stereá Elláda'),('en_US',783,'Thessalía'),('en_US',784,'Vóreio Aigaío'),('en_US',785,'Ágion Óros'),('en_US',786,'Barima-Waini'),('en_US',787,'Cuyuni-Mazaruni'),('en_US',788,'Demerara-Mahaica'),('en_US',789,'East Berbice-Corentyne'),('en_US',790,'Essequibo Islands-West Demerara'),('en_US',791,'Mahaica-Berbice'),('en_US',792,'Pomeroon-Supenaam'),('en_US',793,'Potaro-Siparuni'),('en_US',794,'Upper Demerara-Berbice'),('en_US',795,'Upper Takutu-Upper Essequibo'),('en_US',796,'Höfuðborgarsvæði'),('en_US',797,'Suðurnes'),('en_US',798,'Vesturland'),('en_US',799,'Vestfirðir'),('en_US',800,'Norðurland vestra'),('en_US',801,'Norðurland eystra'),('en_US',802,'Austurland'),('en_US',803,'Suðurland'),('en_US',804,'Agrigento'),('en_US',805,'Alessandria'),('en_US',806,'Ancona'),('en_US',807,'Aosta'),('en_US',808,'L\'Aquila'),('en_US',809,'Arezzo'),('en_US',810,'Ascoli-Piceno'),('en_US',811,'Asti'),('en_US',812,'Avellino'),('en_US',813,'Bari'),('en_US',814,'Barletta-Andria-Trani'),('en_US',815,'Belluno'),('en_US',816,'Benevento'),('en_US',817,'Bergamo'),('en_US',818,'Biella'),('en_US',819,'Bologna'),('en_US',820,'Bolzano'),('en_US',821,'Brescia'),('en_US',822,'Brindisi'),('en_US',823,'Cagliari'),('en_US',824,'Caltanissetta'),('en_US',825,'Campobasso'),('en_US',826,'Carbonia Iglesias'),('en_US',827,'Caserta'),('en_US',828,'Catania'),('en_US',829,'Catanzaro'),('en_US',830,'Chieti'),('en_US',831,'Como'),('en_US',832,'Cosenza'),('en_US',833,'Cremona'),('en_US',834,'Crotone'),('en_US',835,'Cuneo'),('en_US',836,'Enna'),('en_US',837,'Fermo'),('en_US',838,'Ferrara'),('en_US',839,'Firenze'),('en_US',840,'Foggia'),('en_US',841,'Forli-Cesena'),('en_US',842,'Frosinone'),('en_US',843,'Genova'),('en_US',844,'Gorizia'),('en_US',845,'Grosseto'),('en_US',846,'Imperia'),('en_US',847,'Isernia'),('en_US',848,'La-Spezia'),('en_US',849,'Latina'),('en_US',850,'Lecce'),('en_US',851,'Lecco'),('en_US',852,'Livorno'),('en_US',853,'Lodi'),('en_US',854,'Lucca'),('en_US',855,'Macerata'),('en_US',856,'Mantova'),('en_US',857,'Massa-Carrara'),('en_US',858,'Matera'),('en_US',859,'Medio Campidano'),('en_US',860,'Messina'),('en_US',861,'Milano'),('en_US',862,'Modena'),('en_US',863,'Monza-Brianza'),('en_US',864,'Napoli'),('en_US',865,'Novara'),('en_US',866,'Nuoro'),('en_US',867,'Ogliastra'),('en_US',868,'Olbia Tempio'),('en_US',869,'Oristano'),('en_US',870,'Padova'),('en_US',871,'Palermo'),('en_US',872,'Parma'),('en_US',873,'Pavia'),('en_US',874,'Perugia'),('en_US',875,'Pesaro-Urbino'),('en_US',876,'Pescara'),('en_US',877,'Piacenza'),('en_US',878,'Pisa'),('en_US',879,'Pistoia'),('en_US',880,'Pordenone'),('en_US',881,'Potenza'),('en_US',882,'Prato'),('en_US',883,'Ragusa'),('en_US',884,'Ravenna'),('en_US',885,'Reggio-Calabria'),('en_US',886,'Reggio-Emilia'),('en_US',887,'Rieti'),('en_US',888,'Rimini'),('en_US',889,'Roma'),('en_US',890,'Rovigo'),('en_US',891,'Salerno'),('en_US',892,'Sassari'),('en_US',893,'Savona'),('en_US',894,'Siena'),('en_US',895,'Siracusa'),('en_US',896,'Sondrio'),('en_US',897,'Taranto'),('en_US',898,'Teramo'),('en_US',899,'Terni'),('en_US',900,'Torino'),('en_US',901,'Trapani'),('en_US',902,'Trento'),('en_US',903,'Treviso'),('en_US',904,'Trieste'),('en_US',905,'Udine'),('en_US',906,'Varese'),('en_US',907,'Venezia'),('en_US',908,'Verbania'),('en_US',909,'Vercelli'),('en_US',910,'Verona'),('en_US',911,'Vibo-Valentia'),('en_US',912,'Vicenza'),('en_US',913,'Viterbo'),('en_US',914,'Aguascalientes'),('en_US',915,'Baja California'),('en_US',916,'Baja California Sur'),('en_US',917,'Campeche'),('en_US',918,'Chiapas'),('en_US',919,'Chihuahua'),('en_US',920,'Ciudad de México'),('en_US',921,'Coahuila'),('en_US',922,'Colima'),('en_US',923,'Durango'),('en_US',924,'Estado de México'),('en_US',925,'Guanajuato'),('en_US',926,'Guerrero'),('en_US',927,'Hidalgo'),('en_US',928,'Jalisco'),('en_US',929,'Michoacán'),('en_US',930,'Morelos'),('en_US',931,'Nayarit'),('en_US',932,'Nuevo León'),('en_US',933,'Oaxaca'),('en_US',934,'Puebla'),('en_US',935,'Querétaro'),('en_US',936,'Quintana Roo'),('en_US',937,'San Luis Potosí'),('en_US',938,'Sinaloa'),('en_US',939,'Sonora'),('en_US',940,'Tabasco'),('en_US',941,'Tamaulipas'),('en_US',942,'Tlaxcala'),('en_US',943,'Veracruz'),('en_US',944,'Yucatán'),('en_US',945,'Zacatecas'),('en_US',946,'Asunción'),('en_US',947,'Alto Paraguay'),('en_US',948,'Alto Paraná'),('en_US',949,'Amambay'),('en_US',950,'Boquerón'),('en_US',951,'Caaguazú'),('en_US',952,'Caazapá'),('en_US',953,'Canindeyú'),('en_US',954,'Central'),('en_US',955,'Concepción'),('en_US',956,'Cordillera'),('en_US',957,'Guairá'),('en_US',958,'Itapúa'),('en_US',959,'Misiones'),('en_US',960,'Ñeembucú'),('en_US',961,'Paraguarí'),('en_US',962,'Presidente Hayes'),('en_US',963,'San Pedro'),('en_US',964,'Municipalidad Metropolitana de Lima'),('en_US',965,'Amazonas'),('en_US',966,'Ancash'),('en_US',967,'Apurímac'),('en_US',968,'Arequipa'),('en_US',969,'Ayacucho'),('en_US',970,'Cajamarca'),('en_US',971,'Cusco'),('en_US',972,'El Callao'),('en_US',973,'Huancavelica'),('en_US',974,'Huánuco'),('en_US',975,'Ica'),('en_US',976,'Junín'),('en_US',977,'La Libertad'),('en_US',978,'Lambayeque'),('en_US',979,'Lima'),('en_US',980,'Loreto'),('en_US',981,'Madre de Dios'),('en_US',982,'Moquegua'),('en_US',983,'Pasco'),('en_US',984,'Piura'),('en_US',985,'Puno'),('en_US',986,'San Martín'),('en_US',987,'Tacna'),('en_US',988,'Tumbes'),('en_US',989,'Ucayali'),('en_US',990,'dolnośląskie'),('en_US',991,'kujawsko-pomorskie'),('en_US',992,'lubelskie'),('en_US',993,'lubuskie'),('en_US',994,'łódzkie'),('en_US',995,'małopolskie'),('en_US',996,'mazowieckie'),('en_US',997,'opolskie'),('en_US',998,'podkarpackie'),('en_US',999,'podlaskie'),('en_US',1000,'pomorskie'),('en_US',1001,'śląskie'),('en_US',1002,'świętokrzyskie'),('en_US',1003,'warmińsko-mazurskie'),('en_US',1004,'wielkopolskie'),('en_US',1005,'zachodniopomorskie'),('en_US',1006,'Aveiro'),('en_US',1007,'Beja'),('en_US',1008,'Braga'),('en_US',1009,'Bragança'),('en_US',1010,'Castelo Branco'),('en_US',1011,'Coimbra'),('en_US',1012,'Évora'),('en_US',1013,'Faro'),('en_US',1014,'Guarda'),('en_US',1015,'Leiria'),('en_US',1016,'Lisboa'),('en_US',1017,'Portalegre'),('en_US',1018,'Porto'),('en_US',1019,'Santarém'),('en_US',1020,'Setúbal'),('en_US',1021,'Viana do Castelo'),('en_US',1022,'Vila Real'),('en_US',1023,'Viseu'),('en_US',1024,'Região Autónoma dos Açores'),('en_US',1025,'Região Autónoma da Madeira'),('en_US',1026,'Brokopondo'),('en_US',1027,'Commewijne'),('en_US',1028,'Coronie'),('en_US',1029,'Marowijne'),('en_US',1030,'Nickerie'),('en_US',1031,'Para'),('en_US',1032,'Paramaribo'),('en_US',1033,'Saramacca'),('en_US',1034,'Sipaliwini'),('en_US',1035,'Wanica'),('en_US',1036,'Blekinge län'),('en_US',1037,'Dalarnas län'),('en_US',1038,'Gotlands län'),('en_US',1039,'Gävleborgs län'),('en_US',1040,'Hallands län'),('en_US',1041,'Jämtlands län'),('en_US',1042,'Jönköpings län'),('en_US',1043,'Kalmar län'),('en_US',1044,'Kronobergs län'),('en_US',1045,'Norrbottens län'),('en_US',1046,'Skåne län'),('en_US',1047,'Stockholms län'),('en_US',1048,'Södermanlands län'),('en_US',1049,'Uppsala län'),('en_US',1050,'Värmlands län'),('en_US',1051,'Västerbottens län'),('en_US',1052,'Västernorrlands län'),('en_US',1053,'Västmanlands län'),('en_US',1054,'Västra Götalands län'),('en_US',1055,'Örebro län'),('en_US',1056,'Östergötlands län'),('en_US',1057,'Artigas'),('en_US',1058,'Canelones'),('en_US',1059,'Cerro Largo'),('en_US',1060,'Colonia'),('en_US',1061,'Durazno'),('en_US',1062,'Flores'),('en_US',1063,'Florida'),('en_US',1064,'Lavalleja'),('en_US',1065,'Maldonado'),('en_US',1066,'Montevideo'),('en_US',1067,'Paysandu'),('en_US',1068,'Río Negro'),('en_US',1069,'Rivera'),('en_US',1070,'Rocha'),('en_US',1071,'Salto'),('en_US',1072,'San José'),('en_US',1073,'Soriano'),('en_US',1074,'Tacuarembó'),('en_US',1075,'Treinta y Tres'),('en_US',1076,'Dependencias Federales'),('en_US',1077,'Distrito Capital'),('en_US',1078,'Amazonas'),('en_US',1079,'Anzoátegui'),('en_US',1080,'Apure'),('en_US',1081,'Aragua'),('en_US',1082,'Barinas'),('en_US',1083,'Bolívar'),('en_US',1084,'Carabobo'),('en_US',1085,'Cojedes'),('en_US',1086,'Delta Amacuro'),('en_US',1087,'Falcón'),('en_US',1088,'Guárico'),('en_US',1089,'Lara'),('en_US',1090,'Mérida'),('en_US',1091,'Miranda'),('en_US',1092,'Monagas'),('en_US',1093,'Nueva Esparta'),('en_US',1094,'Portuguesa'),('en_US',1095,'Sucre'),('en_US',1096,'Táchira'),('en_US',1097,'Trujillo'),('en_US',1098,'Vargas'),('en_US',1099,'Yaracuy'),('en_US',1100,'Zulia');
/*!40000 ALTER TABLE `directory_country_region_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_currency_rate`
--

DROP TABLE IF EXISTS `directory_currency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' COMMENT 'Currency Conversion Rate',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Directory Currency Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_currency_rate`
--

LOCK TABLES `directory_currency_rate` WRITE;
/*!40000 ALTER TABLE `directory_currency_rate` DISABLE KEYS */;
INSERT INTO `directory_currency_rate` VALUES ('EUR','EUR',1.000000000000),('EUR','USD',1.415000000000),('USD','EUR',0.706700000000),('USD','USD',1.000000000000);
/*!40000 ALTER TABLE `directory_currency_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link`
--

DROP TABLE IF EXISTS `downloadable_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_link` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  `number_of_downloads` int DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  PRIMARY KEY (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`),
  CONSTRAINT `DOWNLOADABLE_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Link Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link`
--

LOCK TABLES `downloadable_link` WRITE;
/*!40000 ALTER TABLE `downloadable_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_price`
--

DROP TABLE IF EXISTS `downloadable_link_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_link_price` (
  `price_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Price ID',
  `link_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Price',
  PRIMARY KEY (`price_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `DOWNLOADABLE_LINK_PRICE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Link Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_price`
--

LOCK TABLES `downloadable_link_price` WRITE;
/*!40000 ALTER TABLE `downloadable_link_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_link_purchased` (
  `purchased_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID',
  `order_id` int unsigned DEFAULT '0' COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of modification',
  `customer_id` int unsigned DEFAULT '0' COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title',
  PRIMARY KEY (`purchased_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `DL_LNK_PURCHASED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Link Purchased Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased`
--

LOCK TABLES `downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased_item`
--

DROP TABLE IF EXISTS `downloadable_link_purchased_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_link_purchased_item` (
  `item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `purchased_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Purchased ID',
  `order_item_id` int unsigned DEFAULT '0' COMMENT 'Order Item ID',
  `product_id` int unsigned DEFAULT '0' COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads used',
  `link_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`),
  CONSTRAINT `DL_LNK_PURCHASED_ITEM_ORDER_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`order_item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE SET NULL,
  CONSTRAINT `DL_LNK_PURCHASED_ITEM_PURCHASED_ID_DL_LNK_PURCHASED_PURCHASED_ID` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Link Purchased Item Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased_item`
--

LOCK TABLES `downloadable_link_purchased_item` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_title`
--

DROP TABLE IF EXISTS `downloadable_link_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_link_title` (
  `title_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `link_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `DOWNLOADABLE_LINK_TITLE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_LINK_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Link Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_title`
--

LOCK TABLES `downloadable_link_title` WRITE;
/*!40000 ALTER TABLE `downloadable_link_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_sample`
--

DROP TABLE IF EXISTS `downloadable_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_sample` (
  `sample_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sample ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`sample_id`),
  KEY `DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`),
  CONSTRAINT `DOWNLOADABLE_SAMPLE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Sample Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_sample`
--

LOCK TABLES `downloadable_sample` WRITE;
/*!40000 ALTER TABLE `downloadable_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_sample_title`
--

DROP TABLE IF EXISTS `downloadable_sample_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_sample_title` (
  `title_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `sample_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sample ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `DL_SAMPLE_TTL_SAMPLE_ID_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Sample Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_sample_title`
--

LOCK TABLES `downloadable_sample_title` WRITE;
/*!40000 ALTER TABLE `downloadable_sample_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_sample_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute`
--

DROP TABLE IF EXISTS `eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_attribute` (
  `attribute_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_code` varchar(255) NOT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`),
  KEY `EAV_ATTRIBUTE_FRONTEND_INPUT_ENTITY_TYPE_ID_IS_USER_DEFINED` (`frontend_input`,`entity_type_id`,`is_user_defined`),
  CONSTRAINT `EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute`
--

LOCK TABLES `eav_attribute` WRITE;
/*!40000 ALTER TABLE `eav_attribute` DISABLE KEYS */;
INSERT INTO `eav_attribute` VALUES (1,1,'website_id',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Website','static',NULL,NULL,'select','Associate to Website',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Website',1,0,NULL,0,NULL),(2,1,'store_id',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Store','static',NULL,NULL,'select','Create In',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Store',1,0,NULL,0,NULL),(3,1,'created_in',NULL,NULL,'static',NULL,NULL,'text','Created From',NULL,NULL,0,0,NULL,0,NULL),(4,1,'prefix',NULL,NULL,'static',NULL,NULL,'text','Name Prefix',NULL,NULL,0,0,NULL,0,NULL),(5,1,'firstname',NULL,NULL,'static',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(6,1,'middlename',NULL,NULL,'static',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(7,1,'lastname',NULL,NULL,'static',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(8,1,'suffix',NULL,NULL,'static',NULL,NULL,'text','Name Suffix',NULL,NULL,0,0,NULL,0,NULL),(9,1,'email',NULL,NULL,'static',NULL,NULL,'text','Email',NULL,NULL,1,0,NULL,0,NULL),(10,1,'group_id',NULL,NULL,'static',NULL,NULL,'select','Group',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Group',1,0,NULL,0,NULL),(11,1,'dob',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','static',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime','date','Date of Birth',NULL,NULL,0,0,NULL,0,NULL),(12,1,'password_hash',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Password','static',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(13,1,'rp_token',NULL,NULL,'static',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(14,1,'rp_token_created_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,0,0,NULL,0,NULL),(15,1,'default_billing',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Billing','static',NULL,NULL,'text','Default Billing Address',NULL,NULL,0,0,NULL,0,NULL),(16,1,'default_shipping',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Shipping','static',NULL,NULL,'text','Default Shipping Address',NULL,NULL,0,0,NULL,0,NULL),(17,1,'taxvat',NULL,NULL,'static',NULL,NULL,'text','Tax/VAT Number',NULL,NULL,0,0,NULL,0,NULL),(18,1,'confirmation',NULL,NULL,'static',NULL,NULL,'text','Is Confirmed',NULL,NULL,0,0,NULL,0,NULL),(19,1,'created_at',NULL,NULL,'static',NULL,NULL,'date','Created At',NULL,NULL,0,0,NULL,0,NULL),(20,1,'gender',NULL,NULL,'static',NULL,NULL,'select','Gender',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table',0,0,NULL,0,NULL),(21,1,'disable_auto_group_change','Magento\\Customer\\Model\\Attribute','Magento\\Customer\\Model\\Attribute\\Backend\\Data\\Boolean','static',NULL,NULL,'boolean','Disable Automatic Group Change Based on VAT ID',NULL,NULL,0,0,NULL,0,NULL),(22,2,'prefix',NULL,NULL,'static',NULL,NULL,'text','Name Prefix',NULL,NULL,0,0,NULL,0,NULL),(23,2,'firstname',NULL,NULL,'static',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(24,2,'middlename',NULL,NULL,'static',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(25,2,'lastname',NULL,NULL,'static',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(26,2,'suffix',NULL,NULL,'static',NULL,NULL,'text','Name Suffix',NULL,NULL,0,0,NULL,0,NULL),(27,2,'company',NULL,NULL,'static',NULL,NULL,'text','Company',NULL,NULL,0,0,NULL,0,NULL),(28,2,'street',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\DefaultBackend','static',NULL,NULL,'multiline','Street Address',NULL,NULL,1,0,NULL,0,NULL),(29,2,'city',NULL,NULL,'static',NULL,NULL,'text','City',NULL,NULL,1,0,NULL,0,NULL),(30,2,'country_id',NULL,NULL,'static',NULL,NULL,'select','Country',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Country',1,0,NULL,0,NULL),(31,2,'region',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Backend\\Region','static',NULL,NULL,'text','State/Province',NULL,NULL,0,0,NULL,0,NULL),(32,2,'region_id',NULL,NULL,'static',NULL,NULL,'hidden','State/Province',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Region',0,0,NULL,0,NULL),(33,2,'postcode',NULL,NULL,'static',NULL,NULL,'text','Zip/Postal Code',NULL,NULL,0,0,NULL,0,NULL),(34,2,'telephone',NULL,NULL,'static',NULL,NULL,'text','Phone Number',NULL,NULL,1,0,NULL,0,NULL),(35,2,'fax',NULL,NULL,'static',NULL,NULL,'text','Fax',NULL,NULL,0,0,NULL,0,NULL),(36,2,'vat_id','Magento\\Customer\\Model\\Attribute',NULL,'static',NULL,NULL,'text','VAT Number',NULL,NULL,0,0,NULL,0,NULL),(37,2,'vat_is_valid',NULL,NULL,'static',NULL,NULL,'text','VAT number validity',NULL,NULL,0,0,NULL,0,NULL),(38,2,'vat_request_id',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request ID',NULL,NULL,0,0,NULL,0,NULL),(39,2,'vat_request_date',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request date',NULL,NULL,0,0,NULL,0,NULL),(40,2,'vat_request_success',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request success',NULL,NULL,0,0,NULL,0,NULL),(41,1,'updated_at',NULL,NULL,'static',NULL,NULL,'date','Updated At',NULL,NULL,0,0,NULL,0,NULL),(42,1,'failures_num',NULL,NULL,'static',NULL,NULL,'hidden','Failures Number',NULL,NULL,0,0,NULL,0,NULL),(43,1,'first_failure',NULL,NULL,'static',NULL,NULL,'date','First Failure Date',NULL,NULL,0,0,NULL,0,NULL),(44,1,'lock_expires',NULL,NULL,'static',NULL,NULL,'date','Failures Number',NULL,NULL,0,0,NULL,0,NULL),(45,3,'name',NULL,NULL,'varchar',NULL,NULL,'text','Name',NULL,NULL,1,0,NULL,0,NULL),(46,3,'is_active',NULL,NULL,'int',NULL,NULL,'select','Is Active',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',1,0,NULL,0,NULL),(47,3,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),(48,3,'image',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Image','varchar',NULL,NULL,'image','Image',NULL,NULL,0,0,NULL,0,NULL),(49,3,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Page Title',NULL,NULL,0,0,NULL,0,NULL),(50,3,'meta_keywords',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(51,3,'meta_description',NULL,NULL,'text',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,NULL),(52,3,'display_mode',NULL,NULL,'varchar',NULL,NULL,'select','Display Mode',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Mode',0,0,NULL,0,NULL),(53,3,'landing_page',NULL,NULL,'int',NULL,NULL,'select','CMS Block',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Page',0,0,NULL,0,NULL),(54,3,'is_anchor',NULL,NULL,'int',NULL,NULL,'select','Is Anchor',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,'1',0,NULL),(55,3,'path',NULL,NULL,'static',NULL,NULL,'text','Path',NULL,NULL,0,0,NULL,0,NULL),(56,3,'position',NULL,NULL,'static',NULL,NULL,'text','Position',NULL,NULL,0,0,NULL,0,NULL),(57,3,'all_children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(58,3,'path_in_store',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(59,3,'children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(60,3,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','Custom Design',NULL,'Magento\\Theme\\Model\\Theme\\Source\\Theme',0,0,NULL,0,NULL),(61,3,'custom_design_from','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime','date','Active From',NULL,NULL,0,0,NULL,0,NULL),(62,3,'custom_design_to',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(63,3,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Page Layout',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(64,3,'custom_layout_update',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate','text',NULL,NULL,'textarea','Custom Layout Update',NULL,NULL,0,0,NULL,0,NULL),(65,3,'level',NULL,NULL,'static',NULL,NULL,'text','Level',NULL,NULL,0,0,NULL,0,NULL),(66,3,'children_count',NULL,NULL,'static',NULL,NULL,'text','Children Count',NULL,NULL,0,0,NULL,0,NULL),(67,3,'available_sort_by',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby','text',NULL,NULL,'multiselect','Available Product Listing Sort By',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',1,0,NULL,0,NULL),(68,3,'default_sort_by',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby','varchar',NULL,NULL,'select','Default Product Listing Sort By',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',1,0,NULL,0,NULL),(69,3,'include_in_menu',NULL,NULL,'int',NULL,NULL,'select','Include in Navigation Menu',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',1,0,'1',0,NULL),(70,3,'custom_use_parent_settings',NULL,NULL,'int',NULL,NULL,'select','Use Parent Category Settings',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(71,3,'custom_apply_to_products',NULL,NULL,'int',NULL,NULL,'select','Apply To Products',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(72,3,'filter_price_range',NULL,NULL,'decimal',NULL,NULL,'text','Layered Navigation Price Step',NULL,NULL,0,0,NULL,0,NULL),(73,4,'name','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute',NULL,'varchar',NULL,NULL,'text','Product Name','validate-length maximum-length-255',NULL,1,0,NULL,0,NULL),(74,4,'sku','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Sku','static',NULL,NULL,'text','SKU','validate-length maximum-length-64',NULL,1,0,NULL,1,NULL),(75,4,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),(76,4,'short_description',NULL,NULL,'text',NULL,NULL,'textarea','Short Description',NULL,NULL,0,0,NULL,0,NULL),(77,4,'price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Price',NULL,NULL,1,0,NULL,0,NULL),(78,4,'special_price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Special Price',NULL,NULL,0,0,NULL,0,NULL),(79,4,'special_from_date',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Special Price From Date',NULL,NULL,0,0,NULL,0,NULL),(80,4,'special_to_date',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Special Price To Date',NULL,NULL,0,0,NULL,0,NULL),(81,4,'cost',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Cost',NULL,NULL,0,1,NULL,0,NULL),(82,4,'weight',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Weight','decimal',NULL,NULL,'weight','Weight',NULL,NULL,0,0,NULL,0,NULL),(83,4,'manufacturer',NULL,NULL,'int',NULL,NULL,'select','Manufacturer',NULL,NULL,0,1,NULL,0,NULL),(84,4,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Meta Title',NULL,NULL,0,0,NULL,0,NULL),(85,4,'meta_keyword',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(86,4,'meta_description',NULL,NULL,'varchar',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,'Maximum 255 chars. Meta Description should optimally be between 150-160 characters'),(87,4,'image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Base',NULL,NULL,0,0,NULL,0,NULL),(88,4,'small_image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Small',NULL,NULL,0,0,NULL,0,NULL),(89,4,'thumbnail',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Thumbnail',NULL,NULL,0,0,NULL,0,NULL),(90,4,'media_gallery',NULL,NULL,'static',NULL,NULL,'gallery','Media Gallery',NULL,NULL,0,0,NULL,0,NULL),(91,4,'old_id',NULL,NULL,'int',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(92,4,'tier_price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Tierprice','decimal',NULL,NULL,'text','Tier Price',NULL,NULL,0,0,NULL,0,NULL),(93,4,'color',NULL,NULL,'int',NULL,NULL,'select','Color',NULL,NULL,0,1,NULL,0,NULL),(94,4,'news_from_date',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Set Product as New from Date',NULL,NULL,0,0,NULL,0,NULL),(95,4,'news_to_date',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Set Product as New to Date',NULL,NULL,0,0,NULL,0,NULL),(96,4,'gallery',NULL,NULL,'varchar',NULL,NULL,'gallery','Image Gallery',NULL,NULL,0,0,NULL,0,NULL),(97,4,'status',NULL,NULL,'int',NULL,NULL,'select','Enable Product',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Status',0,0,'1',0,NULL),(98,4,'minimal_price',NULL,NULL,'decimal',NULL,NULL,'price','Minimal Price',NULL,NULL,0,0,NULL,0,NULL),(99,4,'visibility',NULL,NULL,'int',NULL,NULL,'select','Visibility',NULL,'Magento\\Catalog\\Model\\Product\\Visibility',0,0,'4',0,NULL),(100,4,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','New Theme',NULL,'Magento\\Theme\\Model\\Theme\\Source\\Theme',0,0,NULL,0,NULL),(101,4,'custom_design_from',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Active From',NULL,NULL,0,0,NULL,0,NULL),(102,4,'custom_design_to',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(103,4,'custom_layout_update',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate','text',NULL,NULL,'textarea','Layout Update XML',NULL,NULL,0,0,NULL,0,NULL),(104,4,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Layout',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(105,4,'category_ids',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Category','static',NULL,NULL,'text','Categories',NULL,NULL,0,0,NULL,0,NULL),(106,4,'options_container',NULL,NULL,'varchar',NULL,NULL,'select','Display Product Options In',NULL,'Magento\\Catalog\\Model\\Entity\\Product\\Attribute\\Design\\Options\\Container',0,0,'container2',0,NULL),(107,4,'required_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(108,4,'has_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(109,4,'image_label',NULL,NULL,'varchar',NULL,NULL,'text','Image Label',NULL,NULL,0,0,NULL,0,NULL),(110,4,'small_image_label',NULL,NULL,'varchar',NULL,NULL,'text','Small Image Label',NULL,NULL,0,0,NULL,0,NULL),(111,4,'thumbnail_label',NULL,NULL,'varchar',NULL,NULL,'text','Thumbnail Label',NULL,NULL,0,0,NULL,0,NULL),(112,4,'created_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,1,0,NULL,0,NULL),(113,4,'updated_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,1,0,NULL,0,NULL),(114,4,'country_of_manufacture',NULL,NULL,'varchar',NULL,NULL,'select','Country of Manufacture',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Countryofmanufacture',0,0,NULL,0,NULL),(115,4,'quantity_and_stock_status',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Stock','int',NULL,NULL,'select','Quantity',NULL,'Magento\\CatalogInventory\\Model\\Source\\Stock',0,0,'1',0,NULL),(116,4,'custom_layout',NULL,NULL,'varchar',NULL,NULL,'select','New Layout',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(117,4,'custom_layout_update_file',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\LayoutUpdate','varchar',NULL,NULL,'select','Custom Layout Update',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\LayoutUpdate',0,0,NULL,0,NULL),(118,3,'custom_layout_update_file',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\LayoutUpdate','varchar',NULL,NULL,'select','Custom Layout Update',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\LayoutUpdate',0,0,NULL,0,NULL),(119,4,'msrp',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Minimum Advertised Price',NULL,NULL,0,0,NULL,0,NULL),(120,4,'msrp_display_actual_price_type',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean','varchar',NULL,NULL,'select','Display Actual Price',NULL,'Magento\\Msrp\\Model\\Product\\Attribute\\Source\\Type\\Price',0,0,'0',0,NULL),(121,3,'url_key',NULL,NULL,'varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),(122,3,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(123,4,'url_key',NULL,NULL,'varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),(124,4,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(125,4,'links_purchased_separately',NULL,NULL,'int',NULL,NULL,NULL,'Links can be purchased separately',NULL,NULL,1,0,NULL,0,NULL),(126,4,'samples_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Samples title',NULL,NULL,1,0,NULL,0,NULL),(127,4,'links_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Links title',NULL,NULL,1,0,NULL,0,NULL),(128,4,'links_exist',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL),(129,4,'price_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic Price',NULL,NULL,1,0,'0',0,NULL),(130,4,'sku_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic SKU',NULL,NULL,1,0,'0',0,NULL),(131,4,'weight_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic Weight',NULL,NULL,1,0,'0',0,NULL),(132,4,'price_view',NULL,NULL,'int',NULL,NULL,'select','Price View',NULL,'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Price\\View',1,0,NULL,0,NULL),(133,4,'shipment_type',NULL,NULL,'int',NULL,NULL,'select','Ship Bundle Items',NULL,'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Shipment\\Type',1,0,'0',0,NULL),(134,4,'gift_message_available',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean','varchar',NULL,NULL,'select','Allow Gift Message',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(135,4,'swatch_image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Swatch',NULL,NULL,0,0,NULL,0,NULL),(136,4,'tax_class_id',NULL,NULL,'int',NULL,NULL,'select','Tax Class',NULL,'Magento\\Tax\\Model\\TaxClass\\Source\\Product',0,0,'2',0,NULL);
/*!40000 ALTER TABLE `eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_group`
--

DROP TABLE IF EXISTS `eav_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_attribute_group` (
  `attribute_group_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group ID',
  `attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_id` smallint unsigned DEFAULT '0' COMMENT 'Default ID',
  `attribute_group_code` varchar(255) NOT NULL COMMENT 'Attribute Group Code',
  `tab_group_code` varchar(255) DEFAULT NULL COMMENT 'Tab Group Code',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_CODE` (`attribute_set_id`,`attribute_group_code`),
  UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  CONSTRAINT `EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_group`
--

LOCK TABLES `eav_attribute_group` WRITE;
/*!40000 ALTER TABLE `eav_attribute_group` DISABLE KEYS */;
INSERT INTO `eav_attribute_group` VALUES (1,1,'General',1,1,'general',NULL),(2,2,'General',1,1,'general',NULL),(3,3,'General',10,1,'general',NULL),(4,3,'General Information',2,0,'general-information',NULL),(5,3,'Display Settings',20,0,'display-settings',NULL),(6,3,'Custom Design',30,0,'custom-design',NULL),(7,4,'Product Details',10,1,'product-details','basic'),(8,4,'Advanced Pricing',40,0,'advanced-pricing','advanced'),(9,4,'Search Engine Optimization',30,0,'search-engine-optimization','basic'),(10,4,'Images',20,0,'image-management','basic'),(11,4,'Design',50,0,'design','advanced'),(12,4,'Autosettings',60,0,'autosettings','advanced'),(13,4,'Content',15,0,'content','basic'),(14,4,'Schedule Design Update',55,0,'schedule-design-update','advanced'),(15,5,'General',1,1,'general',NULL),(16,6,'General',1,1,'general',NULL),(17,7,'General',1,1,'general',NULL),(18,8,'General',1,1,'general',NULL),(19,4,'Bundle Items',16,0,'bundle-items',NULL),(20,4,'Gift Options',61,0,'gift-options',NULL);
/*!40000 ALTER TABLE `eav_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_label`
--

DROP TABLE IF EXISTS `eav_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_attribute_label` (
  `attribute_label_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`attribute_label_id`),
  KEY `EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  KEY `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`),
  CONSTRAINT `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_label`
--

LOCK TABLES `eav_attribute_label` WRITE;
/*!40000 ALTER TABLE `eav_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_option`
--

DROP TABLE IF EXISTS `eav_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_attribute_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `sort_order` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_option`
--

LOCK TABLES `eav_attribute_option` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option` DISABLE KEYS */;
INSERT INTO `eav_attribute_option` VALUES (1,20,0),(2,20,1),(3,20,3);
/*!40000 ALTER TABLE `eav_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_option_swatch`
--

DROP TABLE IF EXISTS `eav_attribute_option_swatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_attribute_option_swatch` (
  `swatch_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Swatch ID',
  `option_id` int unsigned NOT NULL COMMENT 'Option ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `type` smallint unsigned NOT NULL COMMENT 'Swatch type: 0 - text, 1 - visual color, 2 - visual image',
  `value` varchar(255) DEFAULT NULL COMMENT 'Swatch Value',
  PRIMARY KEY (`swatch_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_OPTION_ID` (`store_id`,`option_id`),
  KEY `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_SWATCH_SWATCH_ID` (`swatch_id`),
  CONSTRAINT `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Magento Swatches table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_option_swatch`
--

LOCK TABLES `eav_attribute_option_swatch` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option_swatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_attribute_option_swatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_option_value`
--

DROP TABLE IF EXISTS `eav_attribute_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_attribute_option_value` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ATTR_OPT_VAL_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute Option Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_option_value`
--

LOCK TABLES `eav_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option_value` DISABLE KEYS */;
INSERT INTO `eav_attribute_option_value` VALUES (1,1,0,'Male'),(2,2,0,'Female'),(3,3,0,'Not Specified');
/*!40000 ALTER TABLE `eav_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_set`
--

DROP TABLE IF EXISTS `eav_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_attribute_set` (
  `attribute_set_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`),
  CONSTRAINT `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute Set';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_set`
--

LOCK TABLES `eav_attribute_set` WRITE;
/*!40000 ALTER TABLE `eav_attribute_set` DISABLE KEYS */;
INSERT INTO `eav_attribute_set` VALUES (1,1,'Default',2),(2,2,'Default',2),(3,3,'Default',1),(4,4,'Default',1),(5,5,'Default',1),(6,6,'Default',1),(7,7,'Default',1),(8,8,'Default',1);
/*!40000 ALTER TABLE `eav_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity`
--

DROP TABLE IF EXISTS `eav_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Entity Active',
  PRIMARY KEY (`entity_id`),
  KEY `EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity`
--

LOCK TABLES `eav_entity` WRITE;
/*!40000 ALTER TABLE `eav_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_attribute`
--

DROP TABLE IF EXISTS `eav_entity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_attribute` (
  `entity_attribute_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `attribute_group_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Group ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTT_ATTR_ATTR_GROUP_ID_EAV_ATTR_GROUP_ATTR_GROUP_ID` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_attribute`
--

LOCK TABLES `eav_entity_attribute` WRITE;
/*!40000 ALTER TABLE `eav_entity_attribute` DISABLE KEYS */;
INSERT INTO `eav_entity_attribute` VALUES (1,1,1,1,1,10),(2,1,1,1,2,20),(3,1,1,1,3,20),(4,1,1,1,4,30),(5,1,1,1,5,40),(6,1,1,1,6,50),(7,1,1,1,7,60),(8,1,1,1,8,70),(9,1,1,1,9,80),(10,1,1,1,10,25),(11,1,1,1,11,90),(12,1,1,1,12,81),(13,1,1,1,13,115),(14,1,1,1,14,120),(15,1,1,1,15,82),(16,1,1,1,16,83),(17,1,1,1,17,100),(18,1,1,1,18,0),(19,1,1,1,19,0),(20,1,1,1,20,110),(21,1,1,1,21,28),(22,2,2,2,22,10),(23,2,2,2,23,20),(24,2,2,2,24,30),(25,2,2,2,25,40),(26,2,2,2,26,50),(27,2,2,2,27,60),(28,2,2,2,28,70),(29,2,2,2,29,100),(30,2,2,2,30,80),(31,2,2,2,31,90),(32,2,2,2,32,90),(33,2,2,2,33,110),(34,2,2,2,34,120),(35,2,2,2,35,130),(36,2,2,2,36,140),(37,2,2,2,37,132),(38,2,2,2,38,133),(39,2,2,2,39,134),(40,2,2,2,40,135),(41,1,1,1,41,87),(42,1,1,1,42,100),(43,1,1,1,43,110),(44,1,1,1,44,120),(45,3,3,4,45,1),(46,3,3,4,46,2),(47,3,3,4,47,4),(48,3,3,4,48,5),(49,3,3,4,49,6),(50,3,3,4,50,7),(51,3,3,4,51,8),(52,3,3,5,52,10),(53,3,3,5,53,20),(54,3,3,5,54,30),(55,3,3,4,55,12),(56,3,3,4,56,13),(57,3,3,4,57,14),(58,3,3,4,58,15),(59,3,3,4,59,16),(60,3,3,6,60,10),(61,3,3,6,61,30),(62,3,3,6,62,40),(63,3,3,6,63,50),(64,3,3,6,64,60),(65,3,3,4,65,24),(66,3,3,4,66,25),(67,3,3,5,67,40),(68,3,3,5,68,50),(69,3,3,4,69,10),(70,3,3,6,70,5),(71,3,3,6,71,6),(72,3,3,5,72,51),(73,4,4,7,73,10),(74,4,4,7,74,20),(75,4,4,13,75,110),(76,4,4,13,76,100),(77,4,4,7,77,30),(78,4,4,8,78,3),(79,4,4,8,79,4),(80,4,4,8,80,5),(81,4,4,8,81,6),(82,4,4,7,82,70),(83,4,4,9,84,20),(84,4,4,9,85,30),(85,4,4,9,86,40),(86,4,4,10,87,1),(87,4,4,10,88,2),(88,4,4,10,89,3),(89,4,4,10,90,4),(90,4,4,7,91,6),(91,4,4,8,92,7),(92,4,4,7,94,90),(93,4,4,7,95,100),(94,4,4,10,96,5),(95,4,4,7,97,5),(96,4,4,8,98,8),(97,4,4,7,99,80),(98,4,4,14,100,40),(99,4,4,14,101,20),(100,4,4,14,102,30),(101,4,4,11,103,10),(102,4,4,11,104,5),(103,4,4,7,105,80),(104,4,4,11,106,6),(105,4,4,7,107,14),(106,4,4,7,108,15),(107,4,4,7,109,16),(108,4,4,7,110,17),(109,4,4,7,111,18),(110,4,4,7,112,19),(111,4,4,7,113,20),(112,4,4,7,114,110),(113,4,4,7,115,60),(114,4,4,14,116,50),(115,4,4,11,117,51),(116,3,3,6,118,51),(117,4,4,8,119,9),(118,4,4,8,120,10),(119,3,3,4,121,3),(120,3,3,4,122,17),(121,4,4,9,123,10),(122,4,4,7,124,11),(123,4,4,7,125,111),(124,4,4,7,126,112),(125,4,4,7,127,113),(126,4,4,7,128,114),(127,4,4,7,129,31),(128,4,4,7,130,21),(129,4,4,7,131,71),(130,4,4,8,132,11),(131,4,4,19,133,1),(132,4,4,20,134,10),(133,4,4,10,135,3),(134,4,4,7,136,40);
/*!40000 ALTER TABLE `eav_entity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_datetime`
--

DROP TABLE IF EXISTS `eav_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_datetime` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_DATETIME_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_datetime`
--

LOCK TABLES `eav_entity_datetime` WRITE;
/*!40000 ALTER TABLE `eav_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_decimal`
--

DROP TABLE IF EXISTS `eav_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_decimal` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_decimal`
--

LOCK TABLES `eav_entity_decimal` WRITE;
/*!40000 ALTER TABLE `eav_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_int`
--

DROP TABLE IF EXISTS `eav_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_int` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int NOT NULL DEFAULT '0' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_INT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_INT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_int`
--

LOCK TABLES `eav_entity_int` WRITE;
/*!40000 ALTER TABLE `eav_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_store`
--

DROP TABLE IF EXISTS `eav_entity_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_store` (
  `entity_store_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Store ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented ID',
  PRIMARY KEY (`entity_store_id`),
  KEY `EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_STORE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_store`
--

LOCK TABLES `eav_entity_store` WRITE;
/*!40000 ALTER TABLE `eav_entity_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_text`
--

DROP TABLE IF EXISTS `eav_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_text` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text NOT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `EAV_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_text`
--

LOCK TABLES `eav_entity_text` WRITE;
/*!40000 ALTER TABLE `eav_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_type`
--

DROP TABLE IF EXISTS `eav_entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Type ID',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity ID Field',
  `is_data_sharing` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set ID',
  `increment_model` varchar(255) DEFAULT NULL COMMENT 'Increment Model',
  `increment_per_store` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint unsigned NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT NULL COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection',
  PRIMARY KEY (`entity_type_id`),
  KEY `EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_type`
--

LOCK TABLES `eav_entity_type` WRITE;
/*!40000 ALTER TABLE `eav_entity_type` DISABLE KEYS */;
INSERT INTO `eav_entity_type` VALUES (1,'customer','Magento\\Customer\\Model\\ResourceModel\\Customer','Magento\\Customer\\Model\\Attribute','customer_entity',NULL,NULL,1,'default',1,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',0,8,'0','customer_eav_attribute','Magento\\Customer\\Model\\ResourceModel\\Attribute\\Collection'),(2,'customer_address','Magento\\Customer\\Model\\ResourceModel\\Address','Magento\\Customer\\Model\\Attribute','customer_address_entity',NULL,NULL,1,'default',2,NULL,0,8,'0','customer_eav_attribute','Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Collection'),(3,'catalog_category','Magento\\Catalog\\Model\\ResourceModel\\Category','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','catalog_category_entity',NULL,NULL,1,'default',3,NULL,0,8,'0','catalog_eav_attribute','Magento\\Catalog\\Model\\ResourceModel\\Category\\Attribute\\Collection'),(4,'catalog_product','Magento\\Catalog\\Model\\ResourceModel\\Product','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','catalog_product_entity',NULL,NULL,1,'default',4,NULL,0,8,'0','catalog_eav_attribute','Magento\\Catalog\\Model\\ResourceModel\\Product\\Attribute\\Collection'),(5,'order','Magento\\Sales\\Model\\ResourceModel\\Order',NULL,'sales_order',NULL,NULL,1,'default',5,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(6,'invoice','Magento\\Sales\\Model\\ResourceModel\\Order\\Invoice',NULL,'sales_invoice',NULL,NULL,1,'default',6,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(7,'creditmemo','Magento\\Sales\\Model\\ResourceModel\\Order\\Creditmemo',NULL,'sales_creditmemo',NULL,NULL,1,'default',7,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(8,'shipment','Magento\\Sales\\Model\\ResourceModel\\Order\\Shipment',NULL,'sales_shipment',NULL,NULL,1,'default',8,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL);
/*!40000 ALTER TABLE `eav_entity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_varchar`
--

DROP TABLE IF EXISTS `eav_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_entity_varchar` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_varchar`
--

LOCK TABLES `eav_entity_varchar` WRITE;
/*!40000 ALTER TABLE `eav_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_element`
--

DROP TABLE IF EXISTS `eav_form_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_form_element` (
  `element_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Element ID',
  `type_id` smallint unsigned NOT NULL COMMENT 'Type ID',
  `fieldset_id` smallint unsigned DEFAULT NULL COMMENT 'Fieldset ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  KEY `EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  KEY `EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_FORM_ELEMENT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_ELEMENT_FIELDSET_ID_EAV_FORM_FIELDSET_FIELDSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL,
  CONSTRAINT `EAV_FORM_ELEMENT_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COMMENT='Eav Form Element';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_element`
--

LOCK TABLES `eav_form_element` WRITE;
/*!40000 ALTER TABLE `eav_form_element` DISABLE KEYS */;
INSERT INTO `eav_form_element` VALUES (1,1,NULL,23,0),(2,1,NULL,25,1),(3,1,NULL,27,2),(4,1,NULL,9,3),(5,1,NULL,28,4),(6,1,NULL,29,5),(7,1,NULL,31,6),(8,1,NULL,33,7),(9,1,NULL,30,8),(10,1,NULL,34,9),(11,1,NULL,35,10),(12,2,NULL,23,0),(13,2,NULL,25,1),(14,2,NULL,27,2),(15,2,NULL,9,3),(16,2,NULL,28,4),(17,2,NULL,29,5),(18,2,NULL,31,6),(19,2,NULL,33,7),(20,2,NULL,30,8),(21,2,NULL,34,9),(22,2,NULL,35,10),(23,3,NULL,23,0),(24,3,NULL,25,1),(25,3,NULL,27,2),(26,3,NULL,28,3),(27,3,NULL,29,4),(28,3,NULL,31,5),(29,3,NULL,33,6),(30,3,NULL,30,7),(31,3,NULL,34,8),(32,3,NULL,35,9),(33,4,NULL,23,0),(34,4,NULL,25,1),(35,4,NULL,27,2),(36,4,NULL,28,3),(37,4,NULL,29,4),(38,4,NULL,31,5),(39,4,NULL,33,6),(40,4,NULL,30,7),(41,4,NULL,34,8),(42,4,NULL,35,9);
/*!40000 ALTER TABLE `eav_form_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_fieldset`
--

DROP TABLE IF EXISTS `eav_form_fieldset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_form_fieldset` (
  `fieldset_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Fieldset ID',
  `type_id` smallint unsigned NOT NULL COMMENT 'Type ID',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`),
  CONSTRAINT `EAV_FORM_FIELDSET_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Form Fieldset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_fieldset`
--

LOCK TABLES `eav_form_fieldset` WRITE;
/*!40000 ALTER TABLE `eav_form_fieldset` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_form_fieldset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_fieldset_label`
--

DROP TABLE IF EXISTS `eav_form_fieldset_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_form_fieldset_label` (
  `fieldset_id` smallint unsigned NOT NULL COMMENT 'Fieldset ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_FORM_FIELDSET_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_FSET_LBL_FSET_ID_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Form Fieldset Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_fieldset_label`
--

LOCK TABLES `eav_form_fieldset_label` WRITE;
/*!40000 ALTER TABLE `eav_form_fieldset_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_form_fieldset_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_type`
--

DROP TABLE IF EXISTS `eav_form_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_form_type` (
  `type_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type ID',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  KEY `EAV_FORM_TYPE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_FORM_TYPE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='Eav Form Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_type`
--

LOCK TABLES `eav_form_type` WRITE;
/*!40000 ALTER TABLE `eav_form_type` DISABLE KEYS */;
INSERT INTO `eav_form_type` VALUES (1,'checkout_onepage_register','checkout_onepage_register',1,'',0),(2,'checkout_onepage_register_guest','checkout_onepage_register_guest',1,'',0),(3,'checkout_onepage_billing_address','checkout_onepage_billing_address',1,'',0),(4,'checkout_onepage_shipping_address','checkout_onepage_shipping_address',1,'',0);
/*!40000 ALTER TABLE `eav_form_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_type_entity`
--

DROP TABLE IF EXISTS `eav_form_type_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eav_form_type_entity` (
  `type_id` smallint unsigned NOT NULL COMMENT 'Type ID',
  `entity_type_id` smallint unsigned NOT NULL COMMENT 'Entity Type ID',
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  CONSTRAINT `EAV_FORM_TYPE_ENTITY_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_TYPE_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Form Type Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_type_entity`
--

LOCK TABLES `eav_form_type_entity` WRITE;
/*!40000 ALTER TABLE `eav_form_type_entity` DISABLE KEYS */;
INSERT INTO `eav_form_type_entity` VALUES (1,1),(2,1),(1,2),(2,2),(3,2),(4,2);
/*!40000 ALTER TABLE `eav_form_type_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_abandoned_cart`
--

DROP TABLE IF EXISTS `email_abandoned_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_abandoned_cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `quote_id` int unsigned DEFAULT NULL COMMENT 'Quote Id',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'Email',
  `status` varchar(255) NOT NULL DEFAULT '' COMMENT 'Contact Status',
  `is_active` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Quote Active',
  `quote_updated_at` timestamp NULL DEFAULT NULL COMMENT 'Quote updated at',
  `abandoned_cart_number` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Abandoned Cart number',
  `items_count` smallint unsigned DEFAULT '0' COMMENT 'Quote items count',
  `items_ids` varchar(255) DEFAULT NULL COMMENT 'Quote item ids',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated at',
  PRIMARY KEY (`id`),
  KEY `EMAIL_ABANDONED_CART_QUOTE_ID` (`quote_id`),
  KEY `EMAIL_ABANDONED_CART_STORE_ID` (`store_id`),
  KEY `EMAIL_ABANDONED_CART_CUSTOMER_ID` (`customer_id`),
  KEY `EMAIL_ABANDONED_CART_EMAIL` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Abandoned Carts Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_abandoned_cart`
--

LOCK TABLES `email_abandoned_cart` WRITE;
/*!40000 ALTER TABLE `email_abandoned_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_abandoned_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_automation`
--

DROP TABLE IF EXISTS `email_automation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_automation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `automation_type` varchar(255) DEFAULT NULL COMMENT 'Automation Type',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Automation Type',
  `enrolment_status` varchar(255) NOT NULL COMMENT 'Enrolment Status',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `type_id` varchar(255) DEFAULT NULL COMMENT 'Type ID',
  `program_id` varchar(255) DEFAULT NULL COMMENT 'Program ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website Id',
  `message` varchar(255) NOT NULL COMMENT 'Message',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `EMAIL_AUTOMATION_AUTOMATION_TYPE` (`automation_type`),
  KEY `EMAIL_AUTOMATION_ENROLMENT_STATUS` (`enrolment_status`),
  KEY `EMAIL_AUTOMATION_TYPE_ID` (`type_id`),
  KEY `EMAIL_AUTOMATION_EMAIL` (`email`),
  KEY `EMAIL_AUTOMATION_PROGRAM_ID` (`program_id`),
  KEY `EMAIL_AUTOMATION_CREATED_AT` (`created_at`),
  KEY `EMAIL_AUTOMATION_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_AUTOMATION_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Automation Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_automation`
--

LOCK TABLES `email_automation` WRITE;
/*!40000 ALTER TABLE `email_automation` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_automation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_campaign`
--

DROP TABLE IF EXISTS `email_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_campaign` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `campaign_id` int unsigned NOT NULL COMMENT 'Campaign ID',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'Contact Email',
  `customer_id` int unsigned NOT NULL COMMENT 'Customer ID',
  `sent_at` timestamp NULL DEFAULT NULL COMMENT 'Send Date',
  `order_increment_id` varchar(50) NOT NULL COMMENT 'Order Increment ID',
  `quote_id` int unsigned NOT NULL COMMENT 'Sales Quote ID',
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT 'Error Message',
  `checkout_method` varchar(255) NOT NULL DEFAULT '' COMMENT 'Checkout Method Used',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `event_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Event Name',
  `send_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Send Id',
  `send_status` smallint NOT NULL DEFAULT '0' COMMENT 'Campaign send status',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `EMAIL_CAMPAIGN_STORE_ID` (`store_id`),
  KEY `EMAIL_CAMPAIGN_CAMPAIGN_ID` (`campaign_id`),
  KEY `EMAIL_CAMPAIGN_EMAIL` (`email`),
  KEY `EMAIL_CAMPAIGN_SEND_ID` (`send_id`),
  KEY `EMAIL_CAMPAIGN_SEND_STATUS` (`send_status`),
  KEY `EMAIL_CAMPAIGN_CREATED_AT` (`created_at`),
  KEY `EMAIL_CAMPAIGN_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_CAMPAIGN_SENT_AT` (`sent_at`),
  KEY `EMAIL_CAMPAIGN_EVENT_NAME` (`event_name`),
  KEY `EMAIL_CAMPAIGN_MESSAGE` (`message`),
  KEY `EMAIL_CAMPAIGN_QUOTE_ID` (`quote_id`),
  KEY `EMAIL_CAMPAIGN_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `EMAIL_CAMPAIGN_STORE_ID_CORE/STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Connector Campaigns';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_campaign`
--

LOCK TABLES `email_campaign` WRITE;
/*!40000 ALTER TABLE `email_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_catalog`
--

DROP TABLE IF EXISTS `email_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_catalog` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `product_id` int unsigned NOT NULL COMMENT 'Product Id',
  `processed` smallint unsigned NOT NULL COMMENT 'Product processed',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  `last_imported_at` timestamp NULL DEFAULT NULL COMMENT 'Last imported date',
  PRIMARY KEY (`id`),
  KEY `EMAIL_CATALOG_PRODUCT_ID` (`product_id`),
  KEY `EMAIL_CATALOG_PROCESSED` (`processed`),
  KEY `EMAIL_CATALOG_CREATED_AT` (`created_at`),
  KEY `EMAIL_CATALOG_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_CATALOG_LAST_IMPORTED_AT` (`last_imported_at`),
  CONSTRAINT `EMAIL_CATALOG_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COMMENT='Connector Catalog';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_catalog`
--

LOCK TABLES `email_catalog` WRITE;
/*!40000 ALTER TABLE `email_catalog` DISABLE KEYS */;
INSERT INTO `email_catalog` VALUES (1,1,0,'2021-10-31 13:21:59','2021-10-31 13:21:59',NULL),(2,2,0,'2021-10-31 13:24:33','2021-10-31 13:24:33',NULL),(3,3,0,'2021-10-31 13:27:33','2021-10-31 13:27:33',NULL),(4,4,0,'2021-10-31 13:29:07','2021-10-31 13:36:51',NULL),(5,5,0,'2021-10-31 13:30:06','2021-10-31 13:36:37',NULL),(6,6,0,'2021-10-31 13:31:41','2021-10-31 13:36:28',NULL),(7,7,0,'2021-10-31 13:32:28','2021-10-31 13:36:17',NULL),(8,8,0,'2021-10-31 13:33:17','2021-10-31 13:35:38',NULL),(9,9,0,'2021-10-31 13:34:15','2021-10-31 13:34:57',NULL),(10,10,0,'2021-10-31 13:37:41','2021-10-31 13:37:41',NULL),(11,11,0,'2021-10-31 15:42:50','2021-10-31 15:42:50',NULL),(12,12,0,'2021-10-31 15:44:13','2021-10-31 15:44:13',NULL),(13,13,0,'2021-10-31 15:45:17','2021-10-31 15:45:17',NULL),(14,14,0,'2021-10-31 15:46:15','2021-10-31 15:46:15',NULL),(15,15,0,'2021-10-31 15:47:32','2021-10-31 15:47:32',NULL),(16,16,0,'2021-10-31 15:51:36','2021-10-31 15:51:36',NULL),(17,17,0,'2021-10-31 15:52:33','2021-10-31 15:52:33',NULL),(18,18,0,'2021-10-31 15:53:34','2021-10-31 15:53:34',NULL),(19,19,0,'2021-10-31 15:55:16','2021-10-31 15:55:16',NULL),(20,20,0,'2021-10-31 15:56:10','2021-10-31 15:56:10',NULL),(21,21,0,'2021-10-31 16:02:49','2021-10-31 16:02:49',NULL),(22,22,0,'2021-10-31 16:03:59','2021-10-31 16:03:59',NULL),(23,23,0,'2021-10-31 16:04:47','2021-10-31 16:04:47',NULL),(24,24,0,'2021-10-31 16:05:31','2021-10-31 16:05:31',NULL),(25,25,0,'2021-10-31 16:06:17','2021-10-31 16:06:17',NULL),(26,26,0,'2021-10-31 16:06:58','2021-10-31 16:06:58',NULL),(27,27,0,'2021-10-31 16:07:30','2021-10-31 16:07:30',NULL),(28,28,0,'2021-10-31 16:08:23','2021-10-31 16:08:23',NULL),(29,29,0,'2021-10-31 16:09:20','2021-10-31 16:09:20',NULL),(30,30,0,'2021-10-31 16:10:08','2021-10-31 16:10:08',NULL),(31,31,0,'2021-10-31 17:00:35','2021-10-31 17:00:35',NULL),(32,32,0,'2021-10-31 17:02:26','2021-10-31 17:02:26',NULL),(33,33,0,'2021-10-31 17:03:04','2021-10-31 17:03:04',NULL),(34,34,0,'2021-10-31 17:03:47','2021-10-31 17:03:47',NULL),(35,35,0,'2021-10-31 17:04:34','2021-10-31 17:04:34',NULL),(36,36,0,'2021-10-31 17:05:12','2021-10-31 17:05:12',NULL),(37,37,0,'2021-10-31 17:05:59','2021-10-31 17:05:59',NULL),(38,38,0,'2021-10-31 17:06:38','2021-10-31 17:06:38',NULL),(39,39,0,'2021-10-31 17:07:13','2021-10-31 17:07:13',NULL),(40,40,0,'2021-10-31 17:08:05','2021-10-31 17:08:05',NULL),(41,41,0,'2021-10-31 17:09:18','2021-10-31 17:09:18',NULL),(42,42,0,'2021-10-31 17:09:58','2021-10-31 17:09:58',NULL),(43,43,0,'2021-10-31 17:10:37','2021-10-31 17:10:37',NULL),(44,44,0,'2021-10-31 17:13:41','2021-10-31 17:13:41',NULL),(45,45,0,'2021-10-31 17:15:10','2021-10-31 17:15:10',NULL),(46,46,0,'2021-10-31 17:15:54','2021-10-31 17:15:54',NULL),(47,47,0,'2021-10-31 17:16:35','2021-10-31 17:16:35',NULL),(48,48,0,'2021-10-31 17:17:21','2021-10-31 17:17:21',NULL),(49,49,0,'2021-10-31 17:18:15','2021-10-31 17:18:15',NULL),(50,50,0,'2021-10-31 17:18:47','2021-10-31 17:18:47',NULL);
/*!40000 ALTER TABLE `email_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_contact`
--

DROP TABLE IF EXISTS `email_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_contact` (
  `email_contact_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `is_guest` smallint unsigned DEFAULT NULL COMMENT 'Is Guest',
  `contact_id` varchar(15) DEFAULT NULL COMMENT 'Connector Contact ID',
  `customer_id` int unsigned NOT NULL COMMENT 'Customer ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'Customer Email',
  `is_subscriber` smallint unsigned DEFAULT NULL COMMENT 'Is Subscriber',
  `subscriber_status` smallint unsigned DEFAULT NULL COMMENT 'Subscriber status',
  `email_imported` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Imported',
  `subscriber_imported` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Subscriber Imported',
  `suppressed` smallint unsigned DEFAULT NULL COMMENT 'Is Suppressed',
  `last_subscribed_at` timestamp NULL DEFAULT NULL COMMENT 'Last time user subscribed',
  PRIMARY KEY (`email_contact_id`),
  KEY `EMAIL_CONTACT_EMAIL_CONTACT_ID` (`email_contact_id`),
  KEY `EMAIL_CONTACT_IS_GUEST` (`is_guest`),
  KEY `EMAIL_CONTACT_CUSTOMER_ID` (`customer_id`),
  KEY `EMAIL_CONTACT_WEBSITE_ID` (`website_id`),
  KEY `EMAIL_CONTACT_IS_SUBSCRIBER` (`is_subscriber`),
  KEY `EMAIL_CONTACT_SUBSCRIBER_STATUS` (`subscriber_status`),
  KEY `EMAIL_CONTACT_EMAIL_IMPORTED` (`email_imported`),
  KEY `EMAIL_CONTACT_SUBSCRIBER_IMPORTED` (`subscriber_imported`),
  KEY `EMAIL_CONTACT_SUPPRESSED` (`suppressed`),
  KEY `EMAIL_CONTACT_EMAIL` (`email`),
  KEY `EMAIL_CONTACT_CONTACT_ID` (`contact_id`),
  CONSTRAINT `EMAIL_CONTACT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Connector Contacts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_contact`
--

LOCK TABLES `email_contact` WRITE;
/*!40000 ALTER TABLE `email_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_contact_consent`
--

DROP TABLE IF EXISTS `email_contact_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_contact_consent` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `email_contact_id` int unsigned DEFAULT NULL COMMENT 'Email Contact Id',
  `consent_url` varchar(255) DEFAULT NULL COMMENT 'Contact consent url',
  `consent_datetime` datetime DEFAULT NULL COMMENT 'Contact consent datetime',
  `consent_ip` varchar(255) DEFAULT NULL COMMENT 'Contact consent ip',
  `consent_user_agent` varchar(255) DEFAULT NULL COMMENT 'Contact consent user agent',
  PRIMARY KEY (`id`),
  KEY `EMAIL_CONTACT_CONSENT_EMAIL_CONTACT_ID` (`email_contact_id`),
  CONSTRAINT `FK_17E9EA0C469163E550BC6B732AC49FDB` FOREIGN KEY (`email_contact_id`) REFERENCES `email_contact` (`email_contact_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Email contact consent table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_contact_consent`
--

LOCK TABLES `email_contact_consent` WRITE;
/*!40000 ALTER TABLE `email_contact_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_contact_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_coupon_attribute`
--

DROP TABLE IF EXISTS `email_coupon_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_coupon_attribute` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `salesrule_coupon_id` int unsigned NOT NULL COMMENT 'Coupon ID',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `expires_at` timestamp NULL DEFAULT NULL COMMENT 'Coupon expiration date',
  PRIMARY KEY (`id`),
  KEY `EMAIL_COUPON_ATTRIBUTE_COUPON_ID` (`salesrule_coupon_id`),
  KEY `EMAIL_COUPON_ATTRIBUTE_EMAIL` (`email`),
  CONSTRAINT `EMAIL_COUPON_ATTRIBUTE_COUPON_ID_SALESRULE_COUPON_COUPON_ID` FOREIGN KEY (`salesrule_coupon_id`) REFERENCES `salesrule_coupon` (`coupon_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Dotdigital coupon attributes table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_coupon_attribute`
--

LOCK TABLES `email_coupon_attribute` WRITE;
/*!40000 ALTER TABLE `email_coupon_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_coupon_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_failed_auth`
--

DROP TABLE IF EXISTS `email_failed_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_failed_auth` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `failures_num` int unsigned DEFAULT NULL COMMENT 'Number of fails',
  `first_attempt_date` datetime DEFAULT NULL COMMENT 'First attempt date',
  `last_attempt_date` datetime DEFAULT NULL COMMENT 'Last attempt date',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `store_id` int unsigned DEFAULT NULL COMMENT 'Store Id',
  PRIMARY KEY (`id`),
  KEY `EMAIL_AUTH_EDC_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Email Failed Auth Table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_failed_auth`
--

LOCK TABLES `email_failed_auth` WRITE;
/*!40000 ALTER TABLE `email_failed_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_failed_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_importer`
--

DROP TABLE IF EXISTS `email_importer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_importer` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `import_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'Import Type',
  `website_id` smallint NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `import_status` smallint NOT NULL DEFAULT '0' COMMENT 'Import Status',
  `import_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Import Id',
  `import_data` mediumblob NOT NULL COMMENT 'Import Data',
  `import_mode` varchar(255) NOT NULL DEFAULT '' COMMENT 'Import Mode',
  `import_file` text NOT NULL COMMENT 'Import File',
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT 'Error Message',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  `import_started` timestamp NULL DEFAULT NULL COMMENT 'Import Started',
  `import_finished` timestamp NULL DEFAULT NULL COMMENT 'Import Finished',
  PRIMARY KEY (`id`),
  KEY `EMAIL_IMPORTER_IMPORT_TYPE` (`import_type`),
  KEY `EMAIL_IMPORTER_WEBSITE_ID` (`website_id`),
  KEY `EMAIL_IMPORTER_IMPORT_STATUS` (`import_status`),
  KEY `EMAIL_IMPORTER_IMPORT_MODE` (`import_mode`),
  KEY `EMAIL_IMPORTER_CREATED_AT` (`created_at`),
  KEY `EMAIL_IMPORTER_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_IMPORTER_IMPORT_ID` (`import_id`),
  KEY `EMAIL_IMPORTER_IMPORT_STARTED` (`import_started`),
  KEY `EMAIL_IMPORTER_IMPORT_FINISHED` (`import_finished`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Email Importer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_importer`
--

LOCK TABLES `email_importer` WRITE;
/*!40000 ALTER TABLE `email_importer` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_importer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_order`
--

DROP TABLE IF EXISTS `email_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_order` (
  `email_order_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `order_status` varchar(255) NOT NULL COMMENT 'Order Status',
  `quote_id` int unsigned NOT NULL COMMENT 'Sales Quote ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `email_imported` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Order Imported',
  `modified` smallint unsigned DEFAULT NULL COMMENT 'Is Order Modified',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`email_order_id`),
  KEY `EMAIL_ORDER_STORE_ID` (`store_id`),
  KEY `EMAIL_ORDER_QUOTE_ID` (`quote_id`),
  KEY `EMAIL_ORDER_EMAIL_IMPORTED` (`email_imported`),
  KEY `EMAIL_ORDER_ORDER_STATUS` (`order_status`),
  KEY `EMAIL_ORDER_MODIFIED` (`modified`),
  KEY `EMAIL_ORDER_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_ORDER_CREATED_AT` (`created_at`),
  KEY `EMAIL_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` (`order_id`),
  CONSTRAINT `EMAIL_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EMAIL_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Transactional Order Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_order`
--

LOCK TABLES `email_order` WRITE;
/*!40000 ALTER TABLE `email_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_review`
--

DROP TABLE IF EXISTS `email_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_review` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `review_id` int unsigned NOT NULL COMMENT 'Review Id',
  `customer_id` int unsigned NOT NULL COMMENT 'Customer ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store Id',
  `review_imported` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Review Imported',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `EMAIL_REVIEW_REVIEW_ID` (`review_id`),
  KEY `EMAIL_REVIEW_CUSTOMER_ID` (`customer_id`),
  KEY `EMAIL_REVIEW_STORE_ID` (`store_id`),
  KEY `EMAIL_REVIEW_REVIEW_IMPORTED` (`review_imported`),
  KEY `EMAIL_REVIEW_CREATED_AT` (`created_at`),
  KEY `EMAIL_REVIEW_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Connector Reviews';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_review`
--

LOCK TABLES `email_review` WRITE;
/*!40000 ALTER TABLE `email_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_rules`
--

DROP TABLE IF EXISTS `email_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Rule Name',
  `website_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `type` smallint NOT NULL DEFAULT '0' COMMENT 'Rule Type',
  `status` smallint NOT NULL DEFAULT '0' COMMENT 'Status',
  `combination` smallint NOT NULL DEFAULT '1' COMMENT 'Rule Condition',
  `conditions` blob NOT NULL COMMENT 'Rule Conditions',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Connector Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_rules`
--

LOCK TABLES `email_rules` WRITE;
/*!40000 ALTER TABLE `email_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_sms_order_queue`
--

DROP TABLE IF EXISTS `email_sms_order_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_sms_order_queue` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Type ID',
  `order_id` smallint unsigned NOT NULL COMMENT 'Order ID',
  `phone_number` varchar(255) DEFAULT NULL COMMENT 'Phone number',
  `email` varchar(255) DEFAULT NULL COMMENT 'Customer email',
  `additional_data` text COMMENT 'Additional data',
  `status` smallint DEFAULT NULL COMMENT 'Status',
  `content` text COMMENT 'Message content',
  `message_id` varchar(255) DEFAULT NULL COMMENT 'Message ID',
  `message` text COMMENT 'Delivery message',
  `sent_at` timestamp NULL DEFAULT NULL COMMENT 'Sent at date',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update time',
  PRIMARY KEY (`id`),
  KEY `EMAIL_SMS_ORDER_QUEUE_WEBSITE_ID` (`website_id`),
  KEY `EMAIL_SMS_ORDER_QUEUE_STORE_ID` (`store_id`),
  CONSTRAINT `EMAIL_SMS_ORDER_QUEUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EMAIL_SMS_ORDER_QUEUE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Dotdigital SMS order queue table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_sms_order_queue`
--

LOCK TABLES `email_sms_order_queue` WRITE;
/*!40000 ALTER TABLE `email_sms_order_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_sms_order_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_template` (
  `template_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text COMMENT 'Templste Styles',
  `template_type` int unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of Template Creation',
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text COMMENT 'Original Template Variables',
  `is_legacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Should the template render in legacy mode',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  KEY `EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Email Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_template`
--

LOCK TABLES `email_template` WRITE;
/*!40000 ALTER TABLE `email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_wishlist`
--

DROP TABLE IF EXISTS `email_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_wishlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `wishlist_id` int unsigned NOT NULL COMMENT 'Wishlist Id',
  `item_count` int unsigned NOT NULL COMMENT 'Item Count',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store Id',
  `wishlist_imported` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Wishlist Imported',
  `wishlist_modified` smallint unsigned DEFAULT NULL COMMENT 'Wishlist Modified [deprecated]',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `EMAIL_WISHLIST_WISHLIST_ID` (`wishlist_id`),
  KEY `EMAIL_WISHLIST_ITEM_COUNT` (`item_count`),
  KEY `EMAIL_WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `EMAIL_WISHLIST_WISHLIST_MODIFIED` (`wishlist_modified`),
  KEY `EMAIL_WISHLIST_WISHLIST_IMPORTED` (`wishlist_imported`),
  KEY `EMAIL_WISHLIST_CREATED_AT` (`created_at`),
  KEY `EMAIL_WISHLIST_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_WISHLIST_STORE_ID` (`store_id`),
  CONSTRAINT `EMAIL_WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EMAIL_WISHLIST_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Connector Wishlist';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_wishlist`
--

LOCK TABLES `email_wishlist` WRITE;
/*!40000 ALTER TABLE `email_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flag`
--

DROP TABLE IF EXISTS `flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flag` (
  `flag_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Flag State',
  `flag_data` mediumtext COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Last Flag Update',
  PRIMARY KEY (`flag_id`),
  KEY `FLAG_LAST_UPDATE` (`last_update`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='Flag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag`
--

LOCK TABLES `flag` WRITE;
/*!40000 ALTER TABLE `flag` DISABLE KEYS */;
INSERT INTO `flag` VALUES (1,'analytics_link_attempts_reverse_counter',0,'24','2021-10-30 14:47:48'),(2,'report_order_aggregated',0,NULL,'2021-10-31 16:51:38'),(3,'report_tax_aggregated',0,NULL,'2021-10-31 16:51:38'),(4,'report_shipping_aggregated',0,NULL,'2021-10-31 16:51:38'),(5,'report_invoiced_aggregated',0,NULL,'2021-10-31 16:51:39'),(6,'report_refunded_aggregated',0,NULL,'2021-10-31 16:51:39'),(7,'report_coupons_aggregated',0,NULL,'2021-10-31 16:51:39'),(8,'report_bestsellers_aggregated',0,NULL,'2021-10-31 16:51:39'),(9,'report_product_viewed_aggregated',0,NULL,'2021-10-31 16:51:39');
/*!40000 ALTER TABLE `flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_message`
--

DROP TABLE IF EXISTS `gift_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gift_message` (
  `gift_message_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage ID',
  `customer_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Registrant',
  `message` text COMMENT 'Message',
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Gift Message';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_message`
--

LOCK TABLES `gift_message` WRITE;
/*!40000 ALTER TABLE `gift_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `googleoptimizer_code`
--

DROP TABLE IF EXISTS `googleoptimizer_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `googleoptimizer_code` (
  `code_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Google experiment code ID',
  `entity_id` int unsigned NOT NULL COMMENT 'Optimized entity ID product ID or catalog ID',
  `entity_type` varchar(50) DEFAULT NULL COMMENT 'Optimized entity type',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `experiment_script` text COMMENT 'Google experiment script',
  PRIMARY KEY (`code_id`),
  UNIQUE KEY `GOOGLEOPTIMIZER_CODE_STORE_ID_ENTITY_ID_ENTITY_TYPE` (`store_id`,`entity_id`,`entity_type`),
  CONSTRAINT `GOOGLEOPTIMIZER_CODE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Google Experiment code';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `googleoptimizer_code`
--

LOCK TABLES `googleoptimizer_code` WRITE;
/*!40000 ALTER TABLE `googleoptimizer_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `googleoptimizer_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_history`
--

DROP TABLE IF EXISTS `import_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_history` (
  `history_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'History record ID',
  `started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Started at',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `imported_file` varchar(255) DEFAULT NULL COMMENT 'Imported file',
  `execution_time` varchar(255) DEFAULT NULL COMMENT 'Execution time',
  `summary` varchar(255) DEFAULT NULL COMMENT 'Summary',
  `error_file` varchar(255) NOT NULL COMMENT 'Imported file with errors',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Import history table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_history`
--

LOCK TABLES `import_history` WRITE;
/*!40000 ALTER TABLE `import_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importexport_importdata`
--

DROP TABLE IF EXISTS `importexport_importdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `importexport_importdata` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext COMMENT 'Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Import Data Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importexport_importdata`
--

LOCK TABLES `importexport_importdata` WRITE;
/*!40000 ALTER TABLE `importexport_importdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `importexport_importdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexer_state`
--

DROP TABLE IF EXISTS `indexer_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indexer_state` (
  `state_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Indexer State ID',
  `indexer_id` varchar(255) DEFAULT NULL COMMENT 'Indexer ID',
  `status` varchar(16) DEFAULT 'invalid' COMMENT 'Indexer Status',
  `updated` datetime DEFAULT NULL COMMENT 'Indexer Status',
  `hash_config` varchar(32) NOT NULL COMMENT 'Hash of indexer config',
  PRIMARY KEY (`state_id`),
  KEY `INDEXER_STATE_INDEXER_ID` (`indexer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='Indexer State';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexer_state`
--

LOCK TABLES `indexer_state` WRITE;
/*!40000 ALTER TABLE `indexer_state` DISABLE KEYS */;
INSERT INTO `indexer_state` VALUES (1,'design_config_grid','valid','2021-10-30 14:57:02','37d429bfa7920fb228ec635acfc737c7'),(2,'customer_grid','valid','2021-10-30 14:47:50','c29450692caded4b38545d53791f0da1'),(3,'catalog_category_product','invalid','2021-10-30 14:47:43','dc571b8dc95eaf7fcfcfe46489390455'),(4,'catalog_product_category','invalid','2021-10-30 14:47:43','925d983439bb1584bb5a1cb95b0a527c'),(5,'catalogrule_rule','invalid','2021-10-30 14:47:43','659e13f8199be1308efa6e556d4f7ef0'),(6,'catalog_product_attribute','invalid','2021-10-30 14:47:43','3719edb998f8384d5a4578f6261d474e'),(7,'cataloginventory_stock','invalid','2021-10-30 14:47:43','f7cf55ff3b49526c31668b4e90b8c292'),(8,'inventory','invalid','2021-10-30 14:47:43','4ef931e4cbc7cdc828716a88434b2237'),(9,'catalogrule_product','invalid','2021-10-30 14:47:43','6cb960911059686b907acae2ba67f3de'),(10,'catalog_product_price','invalid','2021-10-30 14:47:43','ff7297fb5a067f3eb484c383b97b6466'),(11,'catalogsearch_fulltext','invalid','2021-10-30 14:47:43','fdf984efb3b897ad80318e9856fa921c');
/*!40000 ALTER TABLE `indexer_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integration`
--

DROP TABLE IF EXISTS `integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration` (
  `integration_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Integration ID',
  `name` varchar(255) NOT NULL COMMENT 'Integration name is displayed in the admin interface',
  `email` varchar(255) NOT NULL COMMENT 'Email address of the contact person',
  `endpoint` varchar(255) DEFAULT NULL COMMENT 'Endpoint for posting consumer credentials',
  `status` smallint unsigned NOT NULL COMMENT 'Integration status',
  `consumer_id` int unsigned DEFAULT NULL COMMENT 'Oauth consumer',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `setup_type` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Integration type - manual or config file',
  `identity_link_url` varchar(255) DEFAULT NULL COMMENT 'Identity linking Url',
  PRIMARY KEY (`integration_id`),
  UNIQUE KEY `INTEGRATION_NAME` (`name`),
  UNIQUE KEY `INTEGRATION_CONSUMER_ID` (`consumer_id`),
  CONSTRAINT `INTEGRATION_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='integration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integration`
--

LOCK TABLES `integration` WRITE;
/*!40000 ALTER TABLE `integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_geoname`
--

DROP TABLE IF EXISTS `inventory_geoname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_geoname` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'entity id',
  `country_code` varchar(64) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `city` varchar(180) NOT NULL,
  `region` varchar(100) NOT NULL,
  `province` varchar(64) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_geoname`
--

LOCK TABLES `inventory_geoname` WRITE;
/*!40000 ALTER TABLE `inventory_geoname` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_geoname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_low_stock_notification_configuration`
--

DROP TABLE IF EXISTS `inventory_low_stock_notification_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_low_stock_notification_configuration` (
  `source_code` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `notify_stock_qty` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`source_code`,`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_low_stock_notification_configuration`
--

LOCK TABLES `inventory_low_stock_notification_configuration` WRITE;
/*!40000 ALTER TABLE `inventory_low_stock_notification_configuration` DISABLE KEYS */;
INSERT INTO `inventory_low_stock_notification_configuration` VALUES ('default','Bữa tiệc BBQ',NULL),('default','Bữa tiệc nhạc nước câu vịt - Màu xanh',NULL),('default','Búp bê LOL phiên bản confetti - bữa tiệc sinh nhật',NULL),('default','Búp bê thời trang - Rock Tee / Skirt',NULL),('default','Câu chuyện phiêu lưu của Ariel, Belle, Cinderella và Tiana',NULL),('default','Chảo bếp thần kì',NULL),('default','Chuồng Ngựa',NULL),('default','Cô nàng búp bê thời trang OMG - Moon light mộng mơ',NULL),('default','Cô nàng búp bê thời trang OMG - Spicy cá tính',NULL),('default','Cô nàng búp bê thời trang OMG - Sunshine tỏa sáng',NULL),('default','Cô nàng búp bê thời trang OMG - Sweets ngọt ngào',NULL),('default','Combo Bộ khuôn thú cưng đáng yêu và bột nặn 6 màu lấp lánh',NULL),('default','Combo bột nặn mini 4 màu + bộ PD đầu đời',NULL),('default','Combo xe buýt du lịch - xe taxi',NULL),('default','Công chúa Ariel và chiếc váy diệu kỳ',NULL),('default','Công chúa Ariel đổi màu kỳ diệu',NULL),('default','Công chúa Rapunzel với mái tóc dài 45cm',NULL),('default','Công chúa Royal Shimmer Rapunzel',NULL),('default','Cổng Đổ Nát',NULL),('default','Hộp quà Present Pets - Poodles ngọt ngào',NULL),('default','Hộp quà Present Pets - Yorkies lém lỉnh',NULL),('default','Hộp quà Present Pets chó đốm nhanh nhẹn',NULL),('default','Hộp quà Present Pets cún cưng Beagle đáng yêu',NULL),('default','Khám phá núi lửa nham thạch cùng khủng long T-Rex',NULL),('default','Khu Rừng Rậm Ma Quái',NULL),('default','Khủng long T-Rex và quả trứng bí ẩn',NULL),('default','Lâu đài băng giá',NULL),('default','Lớp Học Môn Biến Hình',NULL),('default','Lớp Học Môn Độc Dược',NULL),('default','Mô hình xe hơi trớn Porsche 911 (992) Carrera 4S',NULL),('default','Mô hình xe mô tô 1:12 dòng Ducati Diavel Carbon',NULL),('default','Nhà Cây Hiện Đại',NULL),('default','Pinkie Pie với mái tóc suôn mượt',NULL),('default','Pony Bông - Chiến Binh Cầu Vồng',NULL),('default','Pony bông 30 cm - Spike',NULL),('default','Pony bông 30 cm- Rainbow Dash',NULL),('default','Pony bông 30 cm- Rainbow Dash Sea Pony',NULL),('default','Que kem 7 màu',NULL),('default','Tàu Tuần Tra Cảnh Sát',NULL),('default','Tòa Tháp Chọc Trời',NULL),('default','Trạm cứu hỏa Bworld & xe Land Rover Defender',NULL),('default','Trứng Rồng Huyền Bí',NULL),('default','Xe biến hình sói tuyết dũng mãnh',NULL),('default','Xe cứu hộ cơ bản Paw Patrol - Rubble',NULL),('default','Xe cứu hộ cơ bản Paw Patrol - Skye',NULL),('default','Xe cứu hộ quyền năng Paw Patrol',NULL),('default','Xe cứu thương đa năng',NULL),('default','Xe tải nhiều ngăn - Cảnh sát',NULL),('default','Đồ chơi dạng mô hình theo tỷ lệ thu nhỏ 1:16 xe xúc đào tổng',NULL),('default','Đồ chơi phóng banh vui nhộn',NULL);
/*!40000 ALTER TABLE `inventory_low_stock_notification_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_order_notification`
--

DROP TABLE IF EXISTS `inventory_order_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_order_notification` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Order ID',
  `notification_sent` smallint NOT NULL COMMENT 'Has Notification Been Sent For Order',
  `send_notification` smallint NOT NULL COMMENT 'Should Notification Be Send For Order',
  PRIMARY KEY (`order_id`),
  CONSTRAINT `INVENTORY_ORDER_NOTIFICATION_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_order_notification`
--

LOCK TABLES `inventory_order_notification` WRITE;
/*!40000 ALTER TABLE `inventory_order_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_order_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_pickup_location_order`
--

DROP TABLE IF EXISTS `inventory_pickup_location_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_pickup_location_order` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Order ID',
  `pickup_location_code` varchar(255) NOT NULL COMMENT 'Pickup Location Code',
  PRIMARY KEY (`order_id`),
  CONSTRAINT `INVENTORY_PICKUP_LOCATION_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_pickup_location_order`
--

LOCK TABLES `inventory_pickup_location_order` WRITE;
/*!40000 ALTER TABLE `inventory_pickup_location_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_pickup_location_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_pickup_location_quote_address`
--

DROP TABLE IF EXISTS `inventory_pickup_location_quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_pickup_location_quote_address` (
  `address_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Quote Address ID',
  `pickup_location_code` varchar(255) NOT NULL COMMENT 'Pickup Location Code',
  PRIMARY KEY (`address_id`),
  CONSTRAINT `INV_PICKUP_LOCATION_QUOTE_ADDR_ADDR_ID_QUOTE_ADDR_ADDR_ID` FOREIGN KEY (`address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_pickup_location_quote_address`
--

LOCK TABLES `inventory_pickup_location_quote_address` WRITE;
/*!40000 ALTER TABLE `inventory_pickup_location_quote_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_pickup_location_quote_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_reservation`
--

DROP TABLE IF EXISTS `inventory_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_reservation` (
  `reservation_id` int unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int unsigned NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `metadata` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `INVENTORY_RESERVATION_STOCK_ID_SKU_QUANTITY` (`stock_id`,`sku`,`quantity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_reservation`
--

LOCK TABLES `inventory_reservation` WRITE;
/*!40000 ALTER TABLE `inventory_reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_shipment_source`
--

DROP TABLE IF EXISTS `inventory_shipment_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_shipment_source` (
  `shipment_id` int unsigned NOT NULL,
  `source_code` varchar(255) NOT NULL,
  PRIMARY KEY (`shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_shipment_source`
--

LOCK TABLES `inventory_shipment_source` WRITE;
/*!40000 ALTER TABLE `inventory_shipment_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_shipment_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_source`
--

DROP TABLE IF EXISTS `inventory_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_source` (
  `source_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enabled` smallint unsigned NOT NULL DEFAULT '1',
  `description` text,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `country_id` varchar(2) NOT NULL,
  `region_id` int unsigned DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `use_default_carrier_config` smallint unsigned NOT NULL DEFAULT '1',
  `is_pickup_location_active` tinyint(1) NOT NULL DEFAULT '0',
  `frontend_name` varchar(255) DEFAULT '',
  `frontend_description` text,
  PRIMARY KEY (`source_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_source`
--

LOCK TABLES `inventory_source` WRITE;
/*!40000 ALTER TABLE `inventory_source` DISABLE KEYS */;
INSERT INTO `inventory_source` VALUES ('default','Default Source',1,'Default Source',0.000000,0.000000,'US',NULL,NULL,NULL,NULL,'00000',NULL,NULL,NULL,NULL,1,0,'',NULL);
/*!40000 ALTER TABLE `inventory_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_source_carrier_link`
--

DROP TABLE IF EXISTS `inventory_source_carrier_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_source_carrier_link` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT,
  `source_code` varchar(255) NOT NULL,
  `carrier_code` varchar(255) NOT NULL,
  `position` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  KEY `INV_SOURCE_CARRIER_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` (`source_code`),
  CONSTRAINT `INV_SOURCE_CARRIER_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_source_carrier_link`
--

LOCK TABLES `inventory_source_carrier_link` WRITE;
/*!40000 ALTER TABLE `inventory_source_carrier_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_source_carrier_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_source_item`
--

DROP TABLE IF EXISTS `inventory_source_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_source_item` (
  `source_item_id` int unsigned NOT NULL AUTO_INCREMENT,
  `source_code` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `status` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`source_item_id`),
  UNIQUE KEY `INVENTORY_SOURCE_ITEM_SOURCE_CODE_SKU` (`source_code`,`sku`),
  KEY `INVENTORY_SOURCE_ITEM_SKU_SOURCE_CODE_QUANTITY` (`sku`,`source_code`,`quantity`),
  CONSTRAINT `INVENTORY_SOURCE_ITEM_SOURCE_CODE_INVENTORY_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_source_item`
--

LOCK TABLES `inventory_source_item` WRITE;
/*!40000 ALTER TABLE `inventory_source_item` DISABLE KEYS */;
INSERT INTO `inventory_source_item` VALUES (1,'default','Trạm cứu hỏa Bworld & xe Land Rover Defender',0.0000,1),(2,'default','Mô hình xe mô tô 1:12 dòng Ducati Diavel Carbon',0.0000,1),(3,'default','Mô hình xe hơi trớn Porsche 911 (992) Carrera 4S',0.0000,1),(4,'default','Xe biến hình sói tuyết dũng mãnh',0.0000,0),(5,'default','Combo xe buýt du lịch - xe taxi',0.0000,0),(6,'default','Xe tải nhiều ngăn - Cảnh sát',0.0000,0),(7,'default','Xe cứu hộ cơ bản Paw Patrol - Rubble',0.0000,0),(8,'default','Xe cứu hộ cơ bản Paw Patrol - Skye',0.0000,0),(9,'default','Xe cứu hộ quyền năng Paw Patrol',0.0000,0),(22,'default','Đồ chơi dạng mô hình theo tỷ lệ thu nhỏ 1:16 xe xúc đào tổng',0.0000,1),(23,'default','Tàu Tuần Tra Cảnh Sát',0.0000,1),(24,'default','Câu chuyện phiêu lưu của Ariel, Belle, Cinderella và Tiana',0.0000,1),(25,'default','Lâu đài băng giá',0.0000,1),(26,'default','Lớp Học Môn Biến Hình',0.0000,1),(27,'default','Lớp Học Môn Độc Dược',0.0000,1),(28,'default','Chuồng Ngựa',0.0000,1),(29,'default','Cổng Đổ Nát',0.0000,1),(30,'default','Tòa Tháp Chọc Trời',0.0000,1),(31,'default','Nhà Cây Hiện Đại',0.0000,1),(32,'default','Khu Rừng Rậm Ma Quái',0.0000,1),(33,'default','Búp bê LOL phiên bản confetti - bữa tiệc sinh nhật',0.0000,1),(34,'default','Cô nàng búp bê thời trang OMG - Sweets ngọt ngào',0.0000,1),(35,'default','Cô nàng búp bê thời trang OMG - Spicy cá tính',0.0000,1),(36,'default','Cô nàng búp bê thời trang OMG - Sunshine tỏa sáng',0.0000,1),(37,'default','Cô nàng búp bê thời trang OMG - Moon light mộng mơ',0.0000,1),(38,'default','Công chúa Ariel đổi màu kỳ diệu',0.0000,1),(39,'default','Công chúa Royal Shimmer Rapunzel',0.0000,1),(40,'default','Công chúa Rapunzel với mái tóc dài 45cm',0.0000,1),(41,'default','Công chúa Ariel và chiếc váy diệu kỳ',0.0000,1),(42,'default','Búp bê thời trang - Rock Tee / Skirt',0.0000,1),(43,'default','Trứng Rồng Huyền Bí',0.0000,1),(44,'default','Pony bông 30 cm- Rainbow Dash',0.0000,1),(45,'default','Pony bông 30 cm - Spike',0.0000,1),(46,'default','Pony bông 30 cm- Rainbow Dash Sea Pony',0.0000,1),(47,'default','Pony Bông - Chiến Binh Cầu Vồng',0.0000,1),(48,'default','Pinkie Pie với mái tóc suôn mượt',0.0000,1),(49,'default','Hộp quà Present Pets chó đốm nhanh nhẹn',0.0000,1),(50,'default','Hộp quà Present Pets - Yorkies lém lỉnh',0.0000,1),(51,'default','Hộp quà Present Pets - Poodles ngọt ngào',0.0000,1),(52,'default','Hộp quà Present Pets cún cưng Beagle đáng yêu',0.0000,1),(53,'default','Combo bột nặn mini 4 màu + bộ PD đầu đời',0.0000,1),(54,'default','Combo Bộ khuôn thú cưng đáng yêu và bột nặn 6 màu lấp lánh',0.0000,1),(55,'default','Khám phá núi lửa nham thạch cùng khủng long T-Rex',0.0000,1),(56,'default','Khủng long T-Rex và quả trứng bí ẩn',0.0000,1),(57,'default','Bữa tiệc BBQ',0.0000,1),(58,'default','Chảo bếp thần kì',0.0000,1),(59,'default','Que kem 7 màu',0.0000,1),(60,'default','Đồ chơi phóng banh vui nhộn',0.0000,1),(61,'default','Xe cứu thương đa năng',0.0000,1),(62,'default','Bữa tiệc nhạc nước câu vịt - Màu xanh',0.0000,1);
/*!40000 ALTER TABLE `inventory_source_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_source_stock_link`
--

DROP TABLE IF EXISTS `inventory_source_stock_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_source_stock_link` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int unsigned NOT NULL,
  `source_code` varchar(255) NOT NULL,
  `priority` smallint unsigned NOT NULL,
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_SOURCE_CODE` (`stock_id`,`source_code`),
  KEY `INV_SOURCE_STOCK_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` (`source_code`),
  KEY `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_PRIORITY` (`stock_id`,`priority`),
  CONSTRAINT `INV_SOURCE_STOCK_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE,
  CONSTRAINT `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_INVENTORY_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `inventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_source_stock_link`
--

LOCK TABLES `inventory_source_stock_link` WRITE;
/*!40000 ALTER TABLE `inventory_source_stock_link` DISABLE KEYS */;
INSERT INTO `inventory_source_stock_link` VALUES (1,1,'default',1);
/*!40000 ALTER TABLE `inventory_source_stock_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_stock`
--

DROP TABLE IF EXISTS `inventory_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_stock` (
  `stock_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_stock`
--

LOCK TABLES `inventory_stock` WRITE;
/*!40000 ALTER TABLE `inventory_stock` DISABLE KEYS */;
INSERT INTO `inventory_stock` VALUES (1,'Default Stock');
/*!40000 ALTER TABLE `inventory_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `inventory_stock_1`
--

DROP TABLE IF EXISTS `inventory_stock_1`;
/*!50001 DROP VIEW IF EXISTS `inventory_stock_1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `inventory_stock_1` AS SELECT 
 1 AS `product_id`,
 1 AS `website_id`,
 1 AS `stock_id`,
 1 AS `quantity`,
 1 AS `is_salable`,
 1 AS `sku`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `inventory_stock_sales_channel`
--

DROP TABLE IF EXISTS `inventory_stock_sales_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_stock_sales_channel` (
  `type` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `stock_id` int unsigned NOT NULL,
  PRIMARY KEY (`type`,`code`),
  KEY `INVENTORY_STOCK_SALES_CHANNEL_STOCK_ID_INVENTORY_STOCK_STOCK_ID` (`stock_id`),
  CONSTRAINT `INVENTORY_STOCK_SALES_CHANNEL_STOCK_ID_INVENTORY_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `inventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_stock_sales_channel`
--

LOCK TABLES `inventory_stock_sales_channel` WRITE;
/*!40000 ALTER TABLE `inventory_stock_sales_channel` DISABLE KEYS */;
INSERT INTO `inventory_stock_sales_channel` VALUES ('website','base',1);
/*!40000 ALTER TABLE `inventory_stock_sales_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klarna_core_order`
--

DROP TABLE IF EXISTS `klarna_core_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klarna_core_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `klarna_order_id` varchar(255) DEFAULT NULL COMMENT 'Klarna Order Id',
  `session_id` varchar(255) DEFAULT NULL COMMENT 'Session Id',
  `reservation_id` varchar(255) DEFAULT NULL COMMENT 'Reservation Id',
  `order_id` int unsigned NOT NULL COMMENT 'Order Id',
  `is_acknowledged` smallint NOT NULL DEFAULT '0' COMMENT 'Is Acknowledged',
  PRIMARY KEY (`id`),
  KEY `KLARNA_CORE_ORDER_IS_ACKNOWLEDGED` (`is_acknowledged`),
  KEY `KLARNA_CORE_ORDER_ORDER_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Klarna Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klarna_core_order`
--

LOCK TABLES `klarna_core_order` WRITE;
/*!40000 ALTER TABLE `klarna_core_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `klarna_core_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klarna_logs`
--

DROP TABLE IF EXISTS `klarna_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klarna_logs` (
  `log_id` smallint NOT NULL AUTO_INCREMENT COMMENT 'Log Id',
  `status` varchar(255) NOT NULL COMMENT 'Status',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action',
  `klarna_id` varchar(255) DEFAULT NULL COMMENT 'Klarna Id',
  `increment_id` varchar(255) DEFAULT NULL COMMENT 'Increment Id',
  `url` varchar(255) NOT NULL COMMENT 'Url',
  `method` varchar(255) NOT NULL COMMENT 'Method',
  `service` varchar(255) NOT NULL COMMENT 'Service',
  `request` text COMMENT 'Request',
  `response` text COMMENT 'Response',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created at',
  PRIMARY KEY (`log_id`),
  KEY `KLARNA_LOGS_KLARNA_ID` (`klarna_id`),
  FULLTEXT KEY `KLARNA_LOGS_ACTION_KLARNA_ID_INCREMENT_ID_URL` (`action`,`klarna_id`,`increment_id`,`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Klarna Logs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klarna_logs`
--

LOCK TABLES `klarna_logs` WRITE;
/*!40000 ALTER TABLE `klarna_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `klarna_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klarna_payments_quote`
--

DROP TABLE IF EXISTS `klarna_payments_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klarna_payments_quote` (
  `payments_quote_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payments Id',
  `session_id` varchar(255) DEFAULT NULL COMMENT 'Klarna Session Id',
  `client_token` text COMMENT 'Klarna Client Token',
  `authorization_token` varchar(255) DEFAULT NULL COMMENT 'Authorization Token',
  `is_active` smallint NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `quote_id` int unsigned NOT NULL COMMENT 'Quote Id',
  `payment_methods` varchar(255) DEFAULT NULL COMMENT 'Payment Method Categories',
  `payment_method_info` text COMMENT 'Payment Method Category Info',
  PRIMARY KEY (`payments_quote_id`),
  KEY `KLARNA_PAYMENTS_QUOTE_QUOTE_ID` (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Klarna Payments Quote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klarna_payments_quote`
--

LOCK TABLES `klarna_payments_quote` WRITE;
/*!40000 ALTER TABLE `klarna_payments_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `klarna_payments_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout_link`
--

DROP TABLE IF EXISTS `layout_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layout_link` (
  `layout_link_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `theme_id` int unsigned NOT NULL COMMENT 'Theme ID',
  `layout_update_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update ID',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Defines whether Layout Update is Temporary',
  PRIMARY KEY (`layout_link_id`),
  KEY `LAYOUT_LINK_THEME_ID_THEME_THEME_ID` (`theme_id`),
  KEY `LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`),
  KEY `LAYOUT_LINK_STORE_ID_THEME_ID_LAYOUT_UPDATE_ID_IS_TEMPORARY` (`store_id`,`theme_id`,`layout_update_id`,`is_temporary`),
  CONSTRAINT `LAYOUT_LINK_LAYOUT_UPDATE_ID_LAYOUT_UPDATE_LAYOUT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `layout_update` (`layout_update_id`) ON DELETE CASCADE,
  CONSTRAINT `LAYOUT_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `LAYOUT_LINK_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Layout Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout_link`
--

LOCK TABLES `layout_link` WRITE;
/*!40000 ALTER TABLE `layout_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `layout_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout_update`
--

DROP TABLE IF EXISTS `layout_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layout_update` (
  `layout_update_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Layout Update ID',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text COMMENT 'Xml',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp',
  PRIMARY KEY (`layout_update_id`),
  KEY `LAYOUT_UPDATE_HANDLE` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Layout Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout_update`
--

LOCK TABLES `layout_update` WRITE;
/*!40000 ALTER TABLE `layout_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `layout_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_as_customer`
--

DROP TABLE IF EXISTS `login_as_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_as_customer` (
  `secret` varchar(64) NOT NULL COMMENT 'Login Secret',
  `customer_id` int NOT NULL COMMENT 'Customer ID',
  `admin_id` int NOT NULL COMMENT 'Admin ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  PRIMARY KEY (`secret`),
  KEY `LOGIN_AS_CUSTOMER_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Magento Login as Customer Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_as_customer`
--

LOCK TABLES `login_as_customer` WRITE;
/*!40000 ALTER TABLE `login_as_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_as_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_as_customer_assistance_allowed`
--

DROP TABLE IF EXISTS `login_as_customer_assistance_allowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_as_customer_assistance_allowed` (
  `customer_id` int unsigned NOT NULL COMMENT 'Customer ID',
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `LOGIN_AS_CSTR_ASSISTANCE_ALLOWED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Magento Login as Customer Assistance Allowed Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_as_customer_assistance_allowed`
--

LOCK TABLES `login_as_customer_assistance_allowed` WRITE;
/*!40000 ALTER TABLE `login_as_customer_assistance_allowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_as_customer_assistance_allowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_acknowledged_bulk`
--

DROP TABLE IF EXISTS `magento_acknowledged_bulk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magento_acknowledged_bulk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Internal ID',
  `bulk_uuid` varbinary(39) DEFAULT NULL COMMENT 'Related Bulk UUID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MAGENTO_ACKNOWLEDGED_BULK_BULK_UUID` (`bulk_uuid`),
  CONSTRAINT `MAGENTO_ACKNOWLEDGED_BULK_BULK_UUID_MAGENTO_BULK_UUID` FOREIGN KEY (`bulk_uuid`) REFERENCES `magento_bulk` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Bulk that was viewed by user from notification area';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_acknowledged_bulk`
--

LOCK TABLES `magento_acknowledged_bulk` WRITE;
/*!40000 ALTER TABLE `magento_acknowledged_bulk` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_acknowledged_bulk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_bulk`
--

DROP TABLE IF EXISTS `magento_bulk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magento_bulk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Bulk Internal ID (must not be exposed)',
  `uuid` varbinary(39) DEFAULT NULL COMMENT 'Bulk UUID (can be exposed to reference bulk entity)',
  `user_id` int unsigned DEFAULT NULL COMMENT 'ID of the WebAPI user that performed an action',
  `user_type` int DEFAULT NULL COMMENT 'Which type of user',
  `description` varchar(255) DEFAULT NULL COMMENT 'Bulk Description',
  `operation_count` int unsigned NOT NULL COMMENT 'Total number of operations scheduled within this bulk',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Bulk start time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MAGENTO_BULK_UUID` (`uuid`),
  KEY `MAGENTO_BULK_USER_ID` (`user_id`),
  KEY `MAGENTO_BULK_START_TIME` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Bulk entity that represents set of related asynchronous operations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_bulk`
--

LOCK TABLES `magento_bulk` WRITE;
/*!40000 ALTER TABLE `magento_bulk` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_bulk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_login_as_customer_log`
--

DROP TABLE IF EXISTS `magento_login_as_customer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magento_login_as_customer_log` (
  `log_id` int NOT NULL AUTO_INCREMENT COMMENT 'Log Id',
  `time` timestamp NULL DEFAULT NULL COMMENT 'Event Date',
  `user_id` int unsigned DEFAULT NULL COMMENT 'User Id',
  `user_name` varchar(40) DEFAULT NULL COMMENT 'User Name',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer Id',
  `customer_email` varchar(40) DEFAULT NULL COMMENT 'Customer email',
  PRIMARY KEY (`log_id`),
  KEY `MAGENTO_LOGIN_AS_CUSTOMER_LOG_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Login as Customer Logging';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_login_as_customer_log`
--

LOCK TABLES `magento_login_as_customer_log` WRITE;
/*!40000 ALTER TABLE `magento_login_as_customer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_login_as_customer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magento_operation`
--

DROP TABLE IF EXISTS `magento_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magento_operation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Operation ID',
  `operation_key` int unsigned DEFAULT NULL COMMENT 'Operation Key',
  `bulk_uuid` varbinary(39) DEFAULT NULL COMMENT 'Related Bulk UUID',
  `topic_name` varchar(255) DEFAULT NULL COMMENT 'Name of the related message queue topic',
  `serialized_data` blob COMMENT 'Data (serialized) required to perform an operation',
  `result_serialized_data` blob COMMENT 'Result data (serialized) after perform an operation',
  `status` smallint DEFAULT '0' COMMENT 'Operation status (OPEN | COMPLETE | RETRIABLY_FAILED | NOT_RETRIABLY_FAILED)',
  `error_code` smallint DEFAULT NULL COMMENT 'Code of the error that appeared during operation execution (used to aggregate related failed operations)',
  `result_message` varchar(255) DEFAULT NULL COMMENT 'Operation result message',
  PRIMARY KEY (`id`),
  KEY `MAGENTO_OPERATION_BULK_UUID_ERROR_CODE` (`bulk_uuid`,`error_code`),
  CONSTRAINT `MAGENTO_OPERATION_BULK_UUID_MAGENTO_BULK_UUID` FOREIGN KEY (`bulk_uuid`) REFERENCES `magento_bulk` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Operation entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magento_operation`
--

LOCK TABLES `magento_operation` WRITE;
/*!40000 ALTER TABLE `magento_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `magento_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_content_asset`
--

DROP TABLE IF EXISTS `media_content_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_content_asset` (
  `asset_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `entity_type` varchar(255) NOT NULL COMMENT 'Content type',
  `entity_id` varchar(255) NOT NULL COMMENT 'Content entity id',
  `field` varchar(255) NOT NULL COMMENT 'Content field',
  PRIMARY KEY (`entity_type`,`entity_id`,`field`,`asset_id`),
  KEY `MEDIA_CONTENT_ASSET_ASSET_ID` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Relation between media content and media asset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_content_asset`
--

LOCK TABLES `media_content_asset` WRITE;
/*!40000 ALTER TABLE `media_content_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_content_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_gallery_asset`
--

DROP TABLE IF EXISTS `media_gallery_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_gallery_asset` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `path` text COMMENT 'Path',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `source` varchar(255) DEFAULT NULL COMMENT 'Source',
  `hash` varchar(255) DEFAULT NULL COMMENT 'File hash',
  `content_type` varchar(255) DEFAULT NULL COMMENT 'Content Type',
  `width` int unsigned NOT NULL DEFAULT '0' COMMENT 'Width',
  `height` int unsigned NOT NULL DEFAULT '0' COMMENT 'Height',
  `size` int unsigned NOT NULL COMMENT 'Asset file size in bytes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`id`),
  KEY `MEDIA_GALLERY_ASSET_ID` (`id`),
  FULLTEXT KEY `MEDIA_GALLERY_ASSET_TITLE` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Media Gallery Asset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_gallery_asset`
--

LOCK TABLES `media_gallery_asset` WRITE;
/*!40000 ALTER TABLE `media_gallery_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_gallery_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_gallery_asset_keyword`
--

DROP TABLE IF EXISTS `media_gallery_asset_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_gallery_asset_keyword` (
  `keyword_id` int unsigned NOT NULL COMMENT 'Keyword Id',
  `asset_id` int unsigned NOT NULL COMMENT 'Asset ID',
  PRIMARY KEY (`keyword_id`,`asset_id`),
  KEY `MEDIA_GALLERY_ASSET_KEYWORD_ASSET_ID` (`asset_id`),
  KEY `MEDIA_GALLERY_ASSET_KEYWORD_KEYWORD_ID` (`keyword_id`),
  CONSTRAINT `MEDIA_GALLERY_ASSET_KEYWORD_ASSET_ID_MEDIA_GALLERY_ASSET_ID` FOREIGN KEY (`asset_id`) REFERENCES `media_gallery_asset` (`id`) ON DELETE CASCADE,
  CONSTRAINT `MEDIA_GALLERY_ASSET_KEYWORD_KEYWORD_ID_MEDIA_GALLERY_KEYWORD_ID` FOREIGN KEY (`keyword_id`) REFERENCES `media_gallery_keyword` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Media Gallery Asset Keyword';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_gallery_asset_keyword`
--

LOCK TABLES `media_gallery_asset_keyword` WRITE;
/*!40000 ALTER TABLE `media_gallery_asset_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_gallery_asset_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_gallery_keyword`
--

DROP TABLE IF EXISTS `media_gallery_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_gallery_keyword` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Keyword ID',
  `keyword` varchar(255) NOT NULL COMMENT 'Keyword',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MEDIA_GALLERY_KEYWORD_KEYWORD` (`keyword`),
  KEY `MEDIA_GALLERY_KEYWORD_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Media Gallery Keyword';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_gallery_keyword`
--

LOCK TABLES `media_gallery_keyword` WRITE;
/*!40000 ALTER TABLE `media_gallery_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_gallery_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mview_state`
--

DROP TABLE IF EXISTS `mview_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mview_state` (
  `state_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'View State ID',
  `view_id` varchar(255) DEFAULT NULL COMMENT 'View ID',
  `mode` varchar(16) DEFAULT 'disabled' COMMENT 'View Mode',
  `status` varchar(16) DEFAULT 'idle' COMMENT 'View Status',
  `updated` datetime DEFAULT NULL COMMENT 'View updated time',
  `version_id` int unsigned DEFAULT NULL COMMENT 'View Version ID',
  PRIMARY KEY (`state_id`),
  KEY `MVIEW_STATE_VIEW_ID` (`view_id`),
  KEY `MVIEW_STATE_MODE` (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='View State';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mview_state`
--

LOCK TABLES `mview_state` WRITE;
/*!40000 ALTER TABLE `mview_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `mview_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_problem`
--

DROP TABLE IF EXISTS `newsletter_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_problem` (
  `problem_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Problem ID',
  `subscriber_id` int unsigned DEFAULT NULL COMMENT 'Subscriber ID',
  `queue_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Queue ID',
  `problem_error_code` int unsigned DEFAULT '0' COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text',
  PRIMARY KEY (`problem_id`),
  KEY `NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`),
  CONSTRAINT `NEWSLETTER_PROBLEM_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `NLTTR_PROBLEM_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Problems';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_problem`
--

LOCK TABLES `newsletter_problem` WRITE;
/*!40000 ALTER TABLE `newsletter_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_queue`
--

DROP TABLE IF EXISTS `newsletter_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_queue` (
  `queue_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue ID',
  `template_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Template ID',
  `newsletter_type` int DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text COMMENT 'Newsletter Text',
  `newsletter_styles` text COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At',
  PRIMARY KEY (`queue_id`),
  KEY `NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`),
  CONSTRAINT `NEWSLETTER_QUEUE_TEMPLATE_ID_NEWSLETTER_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `newsletter_template` (`template_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_queue`
--

LOCK TABLES `newsletter_queue` WRITE;
/*!40000 ALTER TABLE `newsletter_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_queue_link`
--

DROP TABLE IF EXISTS `newsletter_queue_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_queue_link` (
  `queue_link_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Link ID',
  `queue_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Queue ID',
  `subscriber_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Subscriber ID',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At',
  PRIMARY KEY (`queue_link_id`),
  KEY `NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`),
  CONSTRAINT `NEWSLETTER_QUEUE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `NLTTR_QUEUE_LNK_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Queue Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_queue_link`
--

LOCK TABLES `newsletter_queue_link` WRITE;
/*!40000 ALTER TABLE `newsletter_queue_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_queue_store_link`
--

DROP TABLE IF EXISTS `newsletter_queue_store_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_queue_store_link` (
  `queue_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Queue ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`),
  CONSTRAINT `NEWSLETTER_QUEUE_STORE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `NEWSLETTER_QUEUE_STORE_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Queue Store Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_queue_store_link`
--

LOCK TABLES `newsletter_queue_store_link` WRITE;
/*!40000 ALTER TABLE `newsletter_queue_store_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue_store_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_subscriber`
--

DROP TABLE IF EXISTS `newsletter_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_subscriber` (
  `subscriber_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Subscriber ID',
  `store_id` smallint unsigned DEFAULT '0' COMMENT 'Store ID',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int NOT NULL DEFAULT '0' COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code',
  PRIMARY KEY (`subscriber_id`),
  KEY `NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  KEY `NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`),
  KEY `NEWSLETTER_SUBSCRIBER_SUBSCRIBER_EMAIL` (`subscriber_email`),
  CONSTRAINT `NEWSLETTER_SUBSCRIBER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Subscriber';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_subscriber`
--

LOCK TABLES `newsletter_subscriber` WRITE;
/*!40000 ALTER TABLE `newsletter_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_template`
--

DROP TABLE IF EXISTS `newsletter_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_template` (
  `template_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text COMMENT 'Template Text',
  `template_styles` text COMMENT 'Template Styles',
  `template_type` int unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint unsigned DEFAULT '1' COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  `is_legacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Should the template render in legacy mode',
  PRIMARY KEY (`template_id`),
  KEY `NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  KEY `NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_template`
--

LOCK TABLES `newsletter_template` WRITE;
/*!40000 ALTER TABLE `newsletter_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_consumer`
--

DROP TABLE IF EXISTS `oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_consumer` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(32) NOT NULL COMMENT 'Secret code',
  `callback_url` text COMMENT 'Callback URL',
  `rejected_callback_url` text NOT NULL COMMENT 'Rejected callback URL',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `OAUTH_CONSUMER_KEY` (`key`),
  UNIQUE KEY `OAUTH_CONSUMER_SECRET` (`secret`),
  KEY `OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  KEY `OAUTH_CONSUMER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='OAuth Consumers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_consumer`
--

LOCK TABLES `oauth_consumer` WRITE;
/*!40000 ALTER TABLE `oauth_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_nonce`
--

DROP TABLE IF EXISTS `oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int unsigned NOT NULL COMMENT 'Nonce Timestamp',
  `consumer_id` int unsigned NOT NULL COMMENT 'Consumer ID',
  PRIMARY KEY (`nonce`,`consumer_id`),
  KEY `OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` (`consumer_id`),
  KEY `OAUTH_NONCE_TIMESTAMP` (`timestamp`),
  CONSTRAINT `OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='OAuth Nonce';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_nonce`
--

LOCK TABLES `oauth_nonce` WRITE;
/*!40000 ALTER TABLE `oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_token`
--

DROP TABLE IF EXISTS `oauth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_token` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `consumer_id` int unsigned DEFAULT NULL COMMENT 'Oauth Consumer ID',
  `admin_id` int unsigned DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(32) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` text NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token revoked',
  `authorized` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token authorized',
  `user_type` int DEFAULT NULL COMMENT 'User type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Token creation timestamp',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `OAUTH_TOKEN_TOKEN` (`token`),
  KEY `OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` (`admin_id`),
  KEY `OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`),
  KEY `OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`),
  CONSTRAINT `OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `OAUTH_TOKEN_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='OAuth Tokens';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_token`
--

LOCK TABLES `oauth_token` WRITE;
/*!40000 ALTER TABLE `oauth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_token_request_log`
--

DROP TABLE IF EXISTS `oauth_token_request_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_token_request_log` (
  `log_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `user_name` varchar(255) NOT NULL COMMENT 'Customer email or admin login',
  `user_type` smallint unsigned NOT NULL COMMENT 'User type (admin or customer)',
  `failures_count` smallint unsigned DEFAULT '0' COMMENT 'Number of failed authentication attempts in a row',
  `lock_expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Lock expiration time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `OAUTH_TOKEN_REQUEST_LOG_USER_NAME_USER_TYPE` (`user_name`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Log of token request authentication failures.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_token_request_log`
--

LOCK TABLES `oauth_token_request_log` WRITE;
/*!40000 ALTER TABLE `oauth_token_request_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_token_request_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagebuilder_template`
--

DROP TABLE IF EXISTS `pagebuilder_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagebuilder_template` (
  `template_id` int NOT NULL AUTO_INCREMENT COMMENT 'Template ID Auto Increment',
  `name` varchar(1024) NOT NULL COMMENT 'Template Name',
  `preview_image` varchar(1024) DEFAULT NULL COMMENT 'Template Preview Image',
  `template` longtext NOT NULL COMMENT 'Master Format HTML',
  `created_for` varchar(255) DEFAULT NULL COMMENT 'Created For',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`template_id`),
  FULLTEXT KEY `PAGEBUILDER_TEMPLATE_NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Page Builder Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagebuilder_template`
--

LOCK TABLES `pagebuilder_template` WRITE;
/*!40000 ALTER TABLE `pagebuilder_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagebuilder_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_request_event`
--

DROP TABLE IF EXISTS `password_reset_request_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_request_event` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `request_type` smallint unsigned NOT NULL COMMENT 'Type of the event under a security control',
  `account_reference` varchar(255) DEFAULT NULL COMMENT 'An identifier for existing account or another target',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp when the event occurs',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `PASSWORD_RESET_REQUEST_EVENT_ACCOUNT_REFERENCE` (`account_reference`),
  KEY `PASSWORD_RESET_REQUEST_EVENT_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Password Reset Request Event under a security control';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_request_event`
--

LOCK TABLES `password_reset_request_event` WRITE;
/*!40000 ALTER TABLE `password_reset_request_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_request_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patch_list`
--

DROP TABLE IF EXISTS `patch_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patch_list` (
  `patch_id` int NOT NULL AUTO_INCREMENT COMMENT 'Patch Auto Increment',
  `patch_name` varchar(1024) NOT NULL COMMENT 'Patch Class Name',
  PRIMARY KEY (`patch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb3 COMMENT='List of data/schema patches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patch_list`
--

LOCK TABLES `patch_list` WRITE;
/*!40000 ALTER TABLE `patch_list` DISABLE KEYS */;
INSERT INTO `patch_list` VALUES (1,'Magento\\Store\\Setup\\Patch\\Schema\\InitializeStoresAndWebsites'),(2,'Magento\\Catalog\\Setup\\Patch\\Schema\\EnableSegmentation'),(3,'Magento\\Bundle\\Setup\\Patch\\Schema\\UpdateBundleRelatedSchema'),(4,'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\CreateLegacyStockStatusView'),(5,'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\InitializeDefaultStock'),(6,'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\UpdateInventorySourceItem'),(7,'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\ReindexDefaultSource'),(8,'Magento\\InventorySales\\Setup\\Patch\\Schema\\InitializeWebsiteDefaultSock'),(9,'Magento\\Review\\Setup\\Patch\\Schema\\AddUniqueConstraintToReviewEntitySummary'),(10,'Temando\\ShippingRemover\\Setup\\Patch\\Schema\\EmptyTablesRemoval'),(11,'Magento\\Store\\Setup\\Patch\\Data\\DisableSid'),(12,'Magento\\Store\\Setup\\Patch\\Data\\UpdateStoreGroupCodes'),(13,'Magento\\Directory\\Setup\\Patch\\Data\\InitializeDirectoryData'),(14,'Magento\\Directory\\Setup\\Patch\\Data\\AddCountriesCaribbeanCuracaoKosovoSintMaarten'),(15,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForAlbania'),(16,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForArgentina'),(17,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForCroatia'),(18,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForIndia'),(19,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForAustralia'),(20,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForBelgium'),(21,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForBolivia'),(22,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForBulgaria'),(23,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForChile'),(24,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForChina'),(25,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForColombia'),(26,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForDenmark'),(27,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForEcuador'),(28,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForGreece'),(29,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForGuyana'),(30,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForIceland'),(31,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForItaly'),(32,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForMexico'),(33,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForParaguay'),(34,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForPeru'),(35,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForPoland'),(36,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForPortugal'),(37,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForSuriname'),(38,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForSweden'),(39,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForUruguay'),(40,'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForVenezuela'),(41,'Magento\\Theme\\Setup\\Patch\\Data\\RegisterThemes'),(42,'Magento\\Theme\\Setup\\Patch\\Data\\ConvertSerializedData'),(43,'Magento\\Config\\Setup\\Patch\\Data\\UnsetTinymce3'),(44,'Magento\\Config\\Setup\\Patch\\Data\\UpdateClassAliases'),(45,'Magento\\Authorization\\Setup\\Patch\\Data\\InitializeAuthRoles'),(46,'Magento\\Eav\\Setup\\Patch\\Data\\InitializeAttributeModels'),(47,'Magento\\Customer\\Setup\\Patch\\Data\\DefaultCustomerGroupsAndAttributes'),(48,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAttributesMetadata'),(49,'Magento\\Customer\\Setup\\Patch\\Data\\AddNonSpecifiedGenderAttributeOption'),(50,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateIdentifierCustomerAttributesVisibility'),(51,'Magento\\Customer\\Setup\\Patch\\Data\\AddCustomerUpdatedAtAttribute'),(52,'Magento\\Customer\\Setup\\Patch\\Data\\UpgradePasswordHashAndAddress'),(53,'Magento\\Customer\\Setup\\Patch\\Data\\RemoveCheckoutRegisterAndUpdateAttributes'),(54,'Magento\\Customer\\Setup\\Patch\\Data\\AddSecurityTrackingAttributes'),(55,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateAutocompleteOnStorefrontConfigPath'),(56,'Magento\\Customer\\Setup\\Patch\\Data\\MigrateStoresAllowedCountriesToWebsite'),(57,'Magento\\Customer\\Setup\\Patch\\Data\\ConvertValidationRulesFromSerializedToJson'),(58,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAddressAttributesSortOrder'),(59,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateVATNumber'),(60,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAttributeInputFilters'),(61,'Magento\\Customer\\Setup\\Patch\\Data\\UpdateDefaultCustomerGroupInConfig'),(62,'Magento\\Indexer\\Setup\\Patch\\Data\\InitializeIndexerState'),(63,'Magento\\Cms\\Setup\\Patch\\Data\\CreateDefaultPages'),(64,'Magento\\Cms\\Setup\\Patch\\Data\\UpdatePrivacyPolicyPage'),(65,'Magento\\Cms\\Setup\\Patch\\Data\\ConvertWidgetConditionsToJson'),(66,'Magento\\Catalog\\Setup\\Patch\\Data\\InstallDefaultCategories'),(67,'Magento\\Catalog\\Setup\\Patch\\Data\\SetNewResourceModelsPaths'),(68,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateDefaultAttributeValue'),(69,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateMediaAttributesBackendTypes'),(70,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductAttributes'),(71,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductMetaDescription'),(72,'Magento\\Catalog\\Setup\\Patch\\Data\\ChangePriceAttributeDefaultScope'),(73,'Magento\\Catalog\\Setup\\Patch\\Data\\DisallowUsingHtmlForProductName'),(74,'Magento\\Catalog\\Setup\\Patch\\Data\\EnableDirectiveParsing'),(75,'Magento\\Catalog\\Setup\\Patch\\Data\\EnableSegmentation'),(76,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateCustomLayoutAttributes'),(77,'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductDescriptionOrder'),(78,'Magento\\Catalog\\Setup\\Patch\\Data\\UpgradeWidgetData'),(79,'Magento\\Catalog\\Setup\\Patch\\Data\\UpgradeWebsiteAttributes'),(80,'Magento\\CatalogInventory\\Setup\\Patch\\Data\\CreateDefaultStock'),(81,'Magento\\CatalogInventory\\Setup\\Patch\\Data\\UpdateStockItemsWebsite'),(82,'Magento\\CatalogInventory\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(83,'Magento\\CatalogRule\\Setup\\Patch\\Data\\UpdateClassAliasesForCatalogRules'),(84,'Magento\\CatalogRule\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(85,'Magento\\Msrp\\Setup\\Patch\\Data\\InitializeMsrpAttributes'),(86,'Magento\\Msrp\\Setup\\Patch\\Data\\ChangeMsrpAttributeLabel'),(87,'Magento\\Msrp\\Setup\\Patch\\Data\\ChangePriceAttributeDefaultScope'),(88,'Magento\\CatalogSearch\\Setup\\Patch\\Data\\MySQLSearchRemovalNotification'),(89,'Magento\\CatalogSearch\\Setup\\Patch\\Data\\SetInitialSearchWeightForAttributes'),(90,'Magento\\CatalogUrlRewrite\\Setup\\Patch\\Data\\CreateUrlAttributes'),(91,'Magento\\CatalogUrlRewrite\\Setup\\Patch\\Data\\UpdateUrlKeyForProducts'),(92,'Magento\\CatalogUrlRewrite\\Setup\\Patch\\Data\\UpdateUrlKeySearchable'),(93,'Magento\\Quote\\Setup\\Patch\\Data\\InstallEntityTypes'),(94,'Magento\\Quote\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(95,'Magento\\Quote\\Setup\\Patch\\Data\\WishlistDataCleanUp'),(96,'Magento\\MediaGalleryUi\\Setup\\Patch\\Data\\AddMediaGalleryPermissions'),(97,'Magento\\User\\Setup\\Patch\\Data\\UpgradePasswordHashes'),(98,'Magento\\User\\Setup\\Patch\\Data\\UpgradeSerializedFields'),(99,'Magento\\Sales\\Setup\\Patch\\Data\\InstallOrderStatusesAndInitialSalesConfig'),(100,'Magento\\Sales\\Setup\\Patch\\Data\\UpdateEntityTypes'),(101,'Magento\\Sales\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(102,'Magento\\Sales\\Setup\\Patch\\Data\\FillQuoteAddressIdInSalesOrderAddress'),(103,'Magento\\Sales\\Setup\\Patch\\Data\\UpdateEntityTypeModelForInvoice'),(104,'Magento\\Sales\\Setup\\Patch\\Data\\WishlistDataCleanUp'),(105,'Magento\\Checkout\\Setup\\Patch\\Data\\PrepareInitialCheckoutConfiguration'),(106,'Magento\\Widget\\Setup\\Patch\\Data\\UpgradeModelInstanceClassAliases'),(107,'Magento\\Widget\\Setup\\Patch\\Data\\ConvertSerializedData'),(108,'Magento\\Integration\\Setup\\Patch\\Data\\RemoveInactiveTokens'),(109,'Magento\\Downloadable\\Setup\\Patch\\Data\\AddDownloadableHostsConfig'),(110,'Magento\\Downloadable\\Setup\\Patch\\Data\\InstallDownloadableAttributes'),(111,'Magento\\Downloadable\\Setup\\Patch\\Data\\UpdateLinksExistDefaultAttributeValue'),(112,'Magento\\Dhl\\Setup\\Patch\\Data\\PrepareShipmentDays'),(113,'Magento\\Bundle\\Setup\\Patch\\Data\\ApplyAttributesUpdate'),(114,'Magento\\Bundle\\Setup\\Patch\\Data\\UpdateBundleRelatedEntityTypes'),(115,'Magento\\Elasticsearch\\Setup\\Patch\\Data\\InvalidateIndex'),(116,'Magento\\Email\\Setup\\Patch\\Data\\FlagLegacyTemplates'),(117,'Magento\\EncryptionKey\\Setup\\Patch\\Data\\SodiumChachaPatch'),(118,'Magento\\Fedex\\Setup\\Patch\\Data\\ConfigureFedexDefaults'),(119,'Magento\\GiftMessage\\Setup\\Patch\\Data\\AddGiftMessageAttributes'),(120,'Magento\\GiftMessage\\Setup\\Patch\\Data\\MoveGiftMessageToGiftOptionsGroup'),(121,'Magento\\GiftMessage\\Setup\\Patch\\Data\\UpdateGiftMessageAttribute'),(122,'Magento\\GroupedProduct\\Setup\\Patch\\Data\\InitializeGroupedProductLinks'),(123,'Magento\\GroupedProduct\\Setup\\Patch\\Data\\UpdateProductRelations'),(124,'Magento\\Analytics\\Setup\\Patch\\Data\\PrepareInitialConfig'),(125,'Magento\\Analytics\\Setup\\Patch\\Data\\ActivateDataCollection'),(126,'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\InstallInitialConfigurableAttributes'),(127,'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\UpdateManufacturerAttribute'),(128,'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\UpdateTierPriceAttribute'),(129,'Magento\\InventoryLowQuantityNotification\\Setup\\Patch\\Data\\MigrateCatalogInventoryNotifyStockQuantityData'),(130,'Magento\\Reports\\Setup\\Patch\\Data\\InitializeReportEntityTypesAndPages'),(131,'Magento\\Reports\\Setup\\Patch\\Data\\ReportDisableNotification'),(132,'Magento\\Newsletter\\Setup\\Patch\\Data\\FlagLegacyTemplates'),(133,'Magento\\SalesRule\\Setup\\Patch\\Data\\PrepareRuleModelSerializedData'),(134,'Magento\\SalesRule\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(135,'Magento\\SalesRule\\Setup\\Patch\\Data\\FillSalesRuleProductAttributeTable'),(136,'Magento\\PageBuilder\\Setup\\Patch\\Data\\UpdateProductAttribute'),(137,'Magento\\PageBuilder\\Setup\\Patch\\Data\\UpgradePageBuilderStripStyles'),(138,'Magento\\Vault\\Setup\\Patch\\Data\\SetCreditCardAsDefaultTokenType'),(139,'Magento\\Paypal\\Setup\\Patch\\Data\\AddPaypalOrderStatuses'),(140,'Magento\\Paypal\\Setup\\Patch\\Data\\UpdateBmltoPayLater'),(141,'Magento\\Paypal\\Setup\\Patch\\Data\\UpdatePaypalCreditOption'),(142,'Magento\\Paypal\\Setup\\Patch\\Data\\UpdateSmartButtonLabel'),(143,'Magento\\Paypal\\Setup\\Patch\\Data\\UpdateSmartButtonSize'),(144,'Magento\\ReCaptchaMigration\\Setup\\Patch\\Data\\MigrateConfigToRecaptchaModules'),(145,'Magento\\Review\\Setup\\Patch\\Data\\InitReviewStatusesAndData'),(146,'Magento\\OfflineShipping\\Setup\\Patch\\Data\\UpdateQuoteShippingAddresses'),(147,'Magento\\OfflineShipping\\Setup\\Patch\\Data\\UpdateShippingTablerate'),(148,'Magento\\UrlRewrite\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),(149,'Magento\\Swatches\\Setup\\Patch\\Data\\AddSwatchImageAttribute'),(150,'Magento\\Swatches\\Setup\\Patch\\Data\\AddSwatchImageToDefaultAttribtueSet'),(151,'Magento\\Swatches\\Setup\\Patch\\Data\\UpdateAdminTextSwatchValues'),(152,'Magento\\Swatches\\Setup\\Patch\\Data\\ConvertAdditionalDataToJson'),(153,'Magento\\Tax\\Setup\\Patch\\Data\\AddTaxAttributeAndTaxClasses'),(154,'Magento\\Tax\\Setup\\Patch\\Data\\UpdateTaxClassAttributeVisibility'),(155,'Magento\\Tax\\Setup\\Patch\\Data\\UpdateTaxRegionId'),(156,'Magento\\SampleData\\Setup\\Patch\\Data\\ClearSampleDataState'),(157,'Magento\\Usps\\Setup\\Patch\\Data\\UpdateAllowedMethods'),(158,'Magento\\Weee\\Setup\\Patch\\Data\\InitQuoteAndOrderAttributes'),(159,'Magento\\CurrencySymbol\\Setup\\Patch\\Data\\ConvertSerializedCustomCurrencySymbolToJson'),(160,'Magento\\Wishlist\\Setup\\Patch\\Data\\ConvertSerializedData'),(161,'Magento\\Wishlist\\Setup\\Patch\\Data\\WishlistDataCleanUp'),(162,'Klarna\\Core\\Setup\\Patch\\Data\\UpdateKcoApiPathsInCoreConfig'),(163,'Klarna\\Core\\Setup\\Patch\\Data\\UpdateKlarnaApiVersionInCoreConfig'),(164,'Klarna\\Kp\\Setup\\Patch\\Data\\RemoveHtmlTag'),(165,'Klarna\\Kp\\Setup\\Patch\\Data\\ResetIsActive'),(166,'Temando\\ShippingRemover\\Setup\\Patch\\Data\\AttributesRemoval'),(167,'Temando\\ShippingRemover\\Setup\\Patch\\Data\\BookmarkCleaner'),(168,'Temando\\ShippingRemover\\Setup\\Patch\\Data\\ConfigRemoval'),(169,'Vertex\\Tax\\Setup\\Patch\\Data\\DetermineCurrentConfigForShippingOriginUse'),(170,'Vertex\\Tax\\Setup\\Patch\\Data\\EnableCacheType'),(171,'Vertex\\Tax\\Setup\\Patch\\Data\\ExpandDefaultTaxClassesPatch'),(172,'Vertex\\Tax\\Setup\\Patch\\Data\\MigrateCustomerCodeFromEav'),(173,'Vertex\\Tax\\Setup\\Patch\\Data\\UpdateCronConfiguration'),(174,'Vertex\\RequestLogging\\Setup\\Patch\\Data\\UpdateCronConfiguration');
/*!40000 ALTER TABLE `patch_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_billing_agreement`
--

DROP TABLE IF EXISTS `paypal_billing_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal_billing_agreement` (
  `agreement_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement ID',
  `customer_id` int unsigned NOT NULL COMMENT 'Customer ID',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference ID',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label',
  PRIMARY KEY (`agreement_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_STORE_ID` (`store_id`),
  CONSTRAINT `PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PAYPAL_BILLING_AGREEMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Billing Agreement';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_billing_agreement`
--

LOCK TABLES `paypal_billing_agreement` WRITE;
/*!40000 ALTER TABLE `paypal_billing_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_billing_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_billing_agreement_order`
--

DROP TABLE IF EXISTS `paypal_billing_agreement_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal_billing_agreement_order` (
  `agreement_id` int unsigned NOT NULL COMMENT 'Agreement ID',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  PRIMARY KEY (`agreement_id`,`order_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`),
  CONSTRAINT `PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PAYPAL_BILLING_AGRT_ORDER_AGRT_ID_PAYPAL_BILLING_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `paypal_billing_agreement` (`agreement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Billing Agreement Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_billing_agreement_order`
--

LOCK TABLES `paypal_billing_agreement_order` WRITE;
/*!40000 ALTER TABLE `paypal_billing_agreement_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_billing_agreement_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_cert`
--

DROP TABLE IF EXISTS `paypal_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal_cert` (
  `cert_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Cert ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `content` text COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`cert_id`),
  KEY `PAYPAL_CERT_WEBSITE_ID` (`website_id`),
  CONSTRAINT `PAYPAL_CERT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Paypal Certificate Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_cert`
--

LOCK TABLES `paypal_cert` WRITE;
/*!40000 ALTER TABLE `paypal_cert` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_cert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_payment_transaction`
--

DROP TABLE IF EXISTS `paypal_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal_payment_transaction` (
  `transaction_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn ID',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='PayPal Payflow Link Payment Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_payment_transaction`
--

LOCK TABLES `paypal_payment_transaction` WRITE;
/*!40000 ALTER TABLE `paypal_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_settlement_report`
--

DROP TABLE IF EXISTS `paypal_settlement_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal_settlement_report` (
  `report_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Report ID',
  `report_date` date DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account ID',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified',
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Paypal Settlement Report Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_settlement_report`
--

LOCK TABLES `paypal_settlement_report` WRITE;
/*!40000 ALTER TABLE `paypal_settlement_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_settlement_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_settlement_report_row`
--

DROP TABLE IF EXISTS `paypal_settlement_report_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal_settlement_report_row` (
  `row_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Row ID',
  `report_id` int unsigned NOT NULL COMMENT 'Report ID',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction ID',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice ID',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference ID',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference ID Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT NULL COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer ID',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  `store_id` varchar(50) DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`row_id`),
  KEY `PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`),
  CONSTRAINT `FK_E183E488F593E0DE10C6EBFFEBAC9B55` FOREIGN KEY (`report_id`) REFERENCES `paypal_settlement_report` (`report_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Paypal Settlement Report Row Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_settlement_report_row`
--

LOCK TABLES `paypal_settlement_report_row` WRITE;
/*!40000 ALTER TABLE `paypal_settlement_report_row` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_settlement_report_row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_session`
--

DROP TABLE IF EXISTS `persistent_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persistent_session` (
  `persistent_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Session ID',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `info` text COMMENT 'Session Data',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`persistent_id`),
  UNIQUE KEY `PERSISTENT_SESSION_KEY` (`key`),
  UNIQUE KEY `PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  KEY `PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` (`website_id`),
  KEY `PERSISTENT_SESSION_UPDATED_AT` (`updated_at`),
  CONSTRAINT `PERSISTENT_SESSION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Persistent Session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_session`
--

LOCK TABLES `persistent_session` WRITE;
/*!40000 ALTER TABLE `persistent_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistent_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_alert_price`
--

DROP TABLE IF EXISTS `product_alert_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_alert_price` (
  `alert_price_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert price ID',
  `customer_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Price amount',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `store_id` smallint unsigned DEFAULT '0' COMMENT 'Store ID',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert send count',
  `status` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_price_id`),
  KEY `PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  KEY `PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  KEY `PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `PRODUCT_ALERT_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `PRODUCT_ALERT_PRICE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_PRICE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Product Alert Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_alert_price`
--

LOCK TABLES `product_alert_price` WRITE;
/*!40000 ALTER TABLE `product_alert_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_alert_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_alert_stock`
--

DROP TABLE IF EXISTS `product_alert_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_alert_stock` (
  `alert_stock_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock ID',
  `customer_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `store_id` smallint unsigned DEFAULT '0' COMMENT 'Store ID',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Send Count',
  `status` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_stock_id`),
  KEY `PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  KEY `PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  KEY `PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`),
  KEY `PRODUCT_ALERT_STOCK_STORE_ID` (`store_id`),
  CONSTRAINT `PRODUCT_ALERT_STOCK_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_STOCK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_STOCK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_STOCK_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Product Alert Stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_alert_stock`
--

LOCK TABLES `product_alert_stock` WRITE;
/*!40000 ALTER TABLE `product_alert_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_alert_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Queue name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `QUEUE_NAME` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COMMENT='Table storing unique queues';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
INSERT INTO `queue` VALUES (17,'async.operations.all'),(15,'codegenerator'),(4,'export'),(10,'inventory.indexer.sourceItem'),(11,'inventory.indexer.stock'),(6,'inventory.mass.update'),(7,'inventory.reservations.cleanup'),(8,'inventory.reservations.update'),(9,'inventory.reservations.updateSalabilityStatus'),(5,'inventory.source.items.cleanup'),(12,'media.content.synchronization'),(13,'media.gallery.renditions.update'),(14,'media.gallery.synchronization'),(3,'media.storage.catalog.image.resize'),(1,'product_action_attribute.update'),(2,'product_action_attribute.website.update'),(16,'sales.rule.update.coupon.usage');
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_lock`
--

DROP TABLE IF EXISTS `queue_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue_lock` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Message ID',
  `message_code` varchar(255) NOT NULL DEFAULT '' COMMENT 'Message Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`id`),
  UNIQUE KEY `QUEUE_LOCK_MESSAGE_CODE` (`message_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Messages that were processed are inserted here to be locked.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_lock`
--

LOCK TABLES `queue_lock` WRITE;
/*!40000 ALTER TABLE `queue_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_message`
--

DROP TABLE IF EXISTS `queue_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue_message` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Message ID',
  `topic_name` varchar(255) DEFAULT NULL COMMENT 'Message topic',
  `body` longtext COMMENT 'Message body',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Queue messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_message`
--

LOCK TABLES `queue_message` WRITE;
/*!40000 ALTER TABLE `queue_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_message_status`
--

DROP TABLE IF EXISTS `queue_message_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue_message_status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Relation ID',
  `queue_id` int unsigned NOT NULL COMMENT 'Queue ID',
  `message_id` bigint unsigned NOT NULL COMMENT 'Message ID',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `status` smallint unsigned NOT NULL COMMENT 'Message status in particular queue',
  `number_of_trials` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Number of trials to processed failed message processing',
  PRIMARY KEY (`id`),
  UNIQUE KEY `QUEUE_MESSAGE_STATUS_QUEUE_ID_MESSAGE_ID` (`queue_id`,`message_id`),
  KEY `QUEUE_MESSAGE_STATUS_MESSAGE_ID_QUEUE_MESSAGE_ID` (`message_id`),
  KEY `QUEUE_MESSAGE_STATUS_STATUS_UPDATED_AT` (`status`,`updated_at`),
  CONSTRAINT `QUEUE_MESSAGE_STATUS_MESSAGE_ID_QUEUE_MESSAGE_ID` FOREIGN KEY (`message_id`) REFERENCES `queue_message` (`id`) ON DELETE CASCADE,
  CONSTRAINT `QUEUE_MESSAGE_STATUS_QUEUE_ID_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Relation table to keep associations between queues and messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_message_status`
--

LOCK TABLES `queue_message_status` WRITE;
/*!40000 ALTER TABLE `queue_message_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_message_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_poison_pill`
--

DROP TABLE IF EXISTS `queue_poison_pill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue_poison_pill` (
  `version` varchar(255) NOT NULL COMMENT 'Poison Pill version.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sequence table for poison pill versions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_poison_pill`
--

LOCK TABLES `queue_poison_pill` WRITE;
/*!40000 ALTER TABLE `queue_poison_pill` DISABLE KEYS */;
INSERT INTO `queue_poison_pill` VALUES ('version-617d60cc5c390');
/*!40000 ALTER TABLE `queue_poison_pill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote`
--

DROP TABLE IF EXISTS `quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint unsigned DEFAULT '1' COMMENT 'Is Active',
  `is_virtual` smallint unsigned DEFAULT '0' COMMENT 'Is Virtual',
  `is_multi_shipping` smallint unsigned DEFAULT '0' COMMENT 'Is Multi Shipping',
  `items_count` int unsigned DEFAULT '0' COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT '0.0000' COMMENT 'Items Qty',
  `orig_order_id` int unsigned DEFAULT '0' COMMENT 'Orig Order ID',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(20,4) DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `customer_tax_class_id` int unsigned DEFAULT NULL COMMENT 'Customer Tax Class ID',
  `customer_group_id` int unsigned DEFAULT '0' COMMENT 'Customer Group ID',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint unsigned DEFAULT '1' COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint unsigned DEFAULT '0' COMMENT 'Customer Is Guest',
  `remote_ip` varchar(45) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order ID',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int unsigned DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint NOT NULL DEFAULT '0' COMMENT 'Trigger Recollect',
  `ext_shipping_info` text COMMENT 'Ext Shipping Info',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `is_persistent` smallint unsigned DEFAULT '0' COMMENT 'Is Quote Persistent',
  PRIMARY KEY (`entity_id`),
  KEY `QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  KEY `QUOTE_STORE_ID` (`store_id`),
  CONSTRAINT `QUOTE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote`
--

LOCK TABLES `quote` WRITE;
/*!40000 ALTER TABLE `quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_address`
--

DROP TABLE IF EXISTS `quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote_address` (
  `address_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address ID',
  `quote_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quote ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `save_in_address_book` smallint DEFAULT '0' COMMENT 'Save In Address Book',
  `customer_address_id` int unsigned DEFAULT NULL COMMENT 'Customer Address ID',
  `address_type` varchar(10) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(40) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `region_id` int unsigned DEFAULT NULL COMMENT 'Region ID',
  `postcode` varchar(20) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(30) DEFAULT NULL COMMENT 'Country ID',
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `same_as_billing` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Same As Billing',
  `collect_shipping_rates` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(120) DEFAULT NULL,
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Weight',
  `subtotal` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal',
  `base_subtotal` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `grand_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `customer_notes` text COMMENT 'Customer Notes',
  `applied_taxes` text COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `vat_id` text COMMENT 'Vat ID',
  `vat_is_valid` smallint DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request ID',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint DEFAULT NULL COMMENT 'Vat Request Success',
  `validated_country_code` text COMMENT 'Validated Country Code',
  `validated_vat_number` text COMMENT 'Validated Vat Number',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `free_shipping` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  PRIMARY KEY (`address_id`),
  KEY `QUOTE_ADDRESS_QUOTE_ID` (`quote_id`),
  CONSTRAINT `QUOTE_ADDRESS_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_address`
--

LOCK TABLES `quote_address` WRITE;
/*!40000 ALTER TABLE `quote_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_address_item`
--

DROP TABLE IF EXISTS `quote_address_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote_address_item` (
  `address_item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Item ID',
  `parent_item_id` int unsigned DEFAULT NULL COMMENT 'Parent Item ID',
  `quote_address_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Address ID',
  `quote_item_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `super_product_id` int unsigned DEFAULT NULL COMMENT 'Super Product ID',
  `parent_product_id` int unsigned DEFAULT NULL COMMENT 'Parent Product ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `is_qty_decimal` int unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int unsigned DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `free_shipping` int unsigned DEFAULT NULL COMMENT 'Free Shipping',
  PRIMARY KEY (`address_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  KEY `QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `QUOTE_ADDR_ITEM_PARENT_ITEM_ID_QUOTE_ADDR_ITEM_ADDR_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `quote_address_item` (`address_item_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`quote_address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`quote_item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Address Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_address_item`
--

LOCK TABLES `quote_address_item` WRITE;
/*!40000 ALTER TABLE `quote_address_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_address_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_id_mask`
--

DROP TABLE IF EXISTS `quote_id_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote_id_mask` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `quote_id` int unsigned NOT NULL COMMENT 'Quote ID',
  `masked_id` varchar(32) DEFAULT NULL COMMENT 'Masked ID',
  PRIMARY KEY (`entity_id`,`quote_id`),
  KEY `QUOTE_ID_MASK_QUOTE_ID` (`quote_id`),
  KEY `QUOTE_ID_MASK_MASKED_ID` (`masked_id`),
  CONSTRAINT `QUOTE_ID_MASK_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Quote ID and masked ID mapping';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_id_mask`
--

LOCK TABLES `quote_id_mask` WRITE;
/*!40000 ALTER TABLE `quote_id_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_id_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_item`
--

DROP TABLE IF EXISTS `quote_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote_item` (
  `item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `quote_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quote ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `parent_item_id` int unsigned DEFAULT NULL COMMENT 'Parent Item ID',
  `is_virtual` smallint unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint unsigned DEFAULT '0' COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `free_shipping` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  KEY `QUOTE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `QUOTE_ITEM_PARENT_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ITEM_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_item`
--

LOCK TABLES `quote_item` WRITE;
/*!40000 ALTER TABLE `quote_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_item_option`
--

DROP TABLE IF EXISTS `quote_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote_item_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `item_id` int unsigned NOT NULL COMMENT 'Item ID',
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`),
  CONSTRAINT `QUOTE_ITEM_OPTION_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Item Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_item_option`
--

LOCK TABLES `quote_item_option` WRITE;
/*!40000 ALTER TABLE `quote_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_payment`
--

DROP TABLE IF EXISTS `quote_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote_payment` (
  `payment_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment ID',
  `quote_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quote ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last_4` varchar(255) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint unsigned DEFAULT '0' COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint unsigned DEFAULT '0' COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint unsigned DEFAULT '0' COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer ID',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation ID',
  PRIMARY KEY (`payment_id`),
  KEY `QUOTE_PAYMENT_QUOTE_ID` (`quote_id`),
  CONSTRAINT `QUOTE_PAYMENT_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_payment`
--

LOCK TABLES `quote_payment` WRITE;
/*!40000 ALTER TABLE `quote_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_shipping_rate`
--

DROP TABLE IF EXISTS `quote_shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote_shipping_rate` (
  `rate_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rate ID',
  `address_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Address ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text COMMENT 'Method Description',
  `price` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `error_message` text COMMENT 'Error Message',
  `method_title` text COMMENT 'Method Title',
  PRIMARY KEY (`rate_id`),
  KEY `QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`),
  CONSTRAINT `QUOTE_SHIPPING_RATE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Shipping Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_shipping_rate`
--

LOCK TABLES `quote_shipping_rate` WRITE;
/*!40000 ALTER TABLE `quote_shipping_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote_shipping_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `rating_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating ID',
  `entity_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Position On Storefront',
  `is_active` smallint NOT NULL DEFAULT '1' COMMENT 'Rating is active.',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `RATING_RATING_CODE` (`rating_code`),
  KEY `RATING_ENTITY_ID` (`entity_id`),
  CONSTRAINT `RATING_ENTITY_ID_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `rating_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,'Quality',0,1),(2,1,'Value',0,1),(3,1,'Price',0,1);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_entity`
--

DROP TABLE IF EXISTS `rating_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_entity` (
  `entity_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `RATING_ENTITY_ENTITY_CODE` (`entity_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Rating entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_entity`
--

LOCK TABLES `rating_entity` WRITE;
/*!40000 ALTER TABLE `rating_entity` DISABLE KEYS */;
INSERT INTO `rating_entity` VALUES (1,'product'),(2,'product_review'),(3,'review');
/*!40000 ALTER TABLE `rating_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_option`
--

DROP TABLE IF EXISTS `rating_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Option ID',
  `rating_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating ID',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Option Value',
  `position` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Ration option position on Storefront',
  PRIMARY KEY (`option_id`),
  KEY `RATING_OPTION_RATING_ID` (`rating_id`),
  CONSTRAINT `RATING_OPTION_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COMMENT='Rating options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_option`
--

LOCK TABLES `rating_option` WRITE;
/*!40000 ALTER TABLE `rating_option` DISABLE KEYS */;
INSERT INTO `rating_option` VALUES (1,1,'1',1,1),(2,1,'2',2,2),(3,1,'3',3,3),(4,1,'4',4,4),(5,1,'5',5,5),(6,2,'1',1,1),(7,2,'2',2,2),(8,2,'3',3,3),(9,2,'4',4,4),(10,2,'5',5,5),(11,3,'1',1,1),(12,3,'2',2,2),(13,3,'3',3,3),(14,3,'4',4,4),(15,3,'5',5,5);
/*!40000 ALTER TABLE `rating_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_option_vote`
--

DROP TABLE IF EXISTS `rating_option_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_option_vote` (
  `vote_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Vote option ID',
  `remote_ip` varchar(16) NOT NULL COMMENT 'Customer IP',
  `remote_ip_long` bigint NOT NULL DEFAULT '0' COMMENT 'Customer IP converted to long integer format',
  `customer_id` int unsigned DEFAULT '0' COMMENT 'Customer ID',
  `entity_pk_value` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `rating_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating ID',
  `review_id` bigint unsigned DEFAULT NULL COMMENT 'Review ID',
  `percent` smallint NOT NULL DEFAULT '0' COMMENT 'Percent amount',
  `value` smallint NOT NULL DEFAULT '0' COMMENT 'Vote option value',
  PRIMARY KEY (`vote_id`),
  KEY `RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` (`review_id`),
  KEY `RATING_OPTION_VOTE_OPTION_ID` (`option_id`),
  CONSTRAINT `RATING_OPTION_VOTE_OPTION_ID_RATING_OPTION_OPTION_ID` FOREIGN KEY (`option_id`) REFERENCES `rating_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating option values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_option_vote`
--

LOCK TABLES `rating_option_vote` WRITE;
/*!40000 ALTER TABLE `rating_option_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_option_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_option_vote_aggregated`
--

DROP TABLE IF EXISTS `rating_option_vote_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_option_vote_aggregated` (
  `primary_id` int NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation ID',
  `rating_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating ID',
  `entity_pk_value` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `vote_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'Vote dty',
  `vote_value_sum` int unsigned NOT NULL DEFAULT '0' COMMENT 'General vote sum',
  `percent` smallint NOT NULL DEFAULT '0' COMMENT 'Vote percent',
  `percent_approved` smallint DEFAULT '0' COMMENT 'Vote percent approved by admin',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  PRIMARY KEY (`primary_id`),
  KEY `RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  KEY `RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `RATING_OPTION_VOTE_AGGREGATED_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_OPTION_VOTE_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating vote aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_option_vote_aggregated`
--

LOCK TABLES `rating_option_vote_aggregated` WRITE;
/*!40000 ALTER TABLE `rating_option_vote_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_option_vote_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_store`
--

DROP TABLE IF EXISTS `rating_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_store` (
  `rating_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `RATING_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `RATING_STORE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_store`
--

LOCK TABLES `rating_store` WRITE;
/*!40000 ALTER TABLE `rating_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_title`
--

DROP TABLE IF EXISTS `rating_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_title` (
  `rating_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `RATING_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `RATING_TITLE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating Title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_title`
--

LOCK TABLES `rating_title` WRITE;
/*!40000 ALTER TABLE `rating_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release_notification_viewer_log`
--

DROP TABLE IF EXISTS `release_notification_viewer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `release_notification_viewer_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `viewer_id` int unsigned NOT NULL COMMENT 'Viewer admin user ID',
  `last_view_version` varchar(16) NOT NULL COMMENT 'Viewer last view on product version',
  PRIMARY KEY (`id`),
  UNIQUE KEY `RELEASE_NOTIFICATION_VIEWER_LOG_VIEWER_ID` (`viewer_id`),
  CONSTRAINT `RELEASE_NOTIFICATION_VIEWER_LOG_VIEWER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`viewer_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Release Notification Viewer Log Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release_notification_viewer_log`
--

LOCK TABLES `release_notification_viewer_log` WRITE;
/*!40000 ALTER TABLE `release_notification_viewer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `release_notification_viewer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_compared_product_index`
--

DROP TABLE IF EXISTS `report_compared_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_compared_product_index` (
  `index_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index ID',
  `visitor_id` int unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_CMPD_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_CMPD_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_COMPARED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reports Compared Product Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_compared_product_index`
--

LOCK TABLES `report_compared_product_index` WRITE;
/*!40000 ALTER TABLE `report_compared_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_compared_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_event`
--

DROP TABLE IF EXISTS `report_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_event` (
  `event_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event ID',
  `logged_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Logged At',
  `event_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type ID',
  `object_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Object ID',
  `subject_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Subject ID',
  `subtype` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Subtype',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`event_id`),
  KEY `REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  KEY `REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  KEY `REPORT_EVENT_OBJECT_ID` (`object_id`),
  KEY `REPORT_EVENT_SUBTYPE` (`subtype`),
  KEY `REPORT_EVENT_STORE_ID` (`store_id`),
  CONSTRAINT `REPORT_EVENT_EVENT_TYPE_ID_REPORT_EVENT_TYPES_EVENT_TYPE_ID` FOREIGN KEY (`event_type_id`) REFERENCES `report_event_types` (`event_type_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_EVENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reports Event Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_event`
--

LOCK TABLES `report_event` WRITE;
/*!40000 ALTER TABLE `report_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_event_types`
--

DROP TABLE IF EXISTS `report_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_event_types` (
  `event_type_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Type ID',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Login',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='Reports Event Type Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_event_types`
--

LOCK TABLES `report_event_types` WRITE;
/*!40000 ALTER TABLE `report_event_types` DISABLE KEYS */;
INSERT INTO `report_event_types` VALUES (1,'catalog_product_view',0),(2,'sendfriend_product',0),(3,'catalog_product_compare_add_product',0),(4,'checkout_cart_add_product',0),(5,'wishlist_add_product',0),(6,'wishlist_share',0);
/*!40000 ALTER TABLE `report_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_viewed_product_aggregated_daily`
--

DROP TABLE IF EXISTS `report_viewed_product_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_viewed_product_aggregated_daily` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Most Viewed Products Aggregated Daily';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_viewed_product_aggregated_daily`
--

LOCK TABLES `report_viewed_product_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_viewed_product_aggregated_monthly`
--

DROP TABLE IF EXISTS `report_viewed_product_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_viewed_product_aggregated_monthly` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Most Viewed Products Aggregated Monthly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_viewed_product_aggregated_monthly`
--

LOCK TABLES `report_viewed_product_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_viewed_product_aggregated_yearly`
--

DROP TABLE IF EXISTS `report_viewed_product_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_viewed_product_aggregated_yearly` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Most Viewed Products Aggregated Yearly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_viewed_product_aggregated_yearly`
--

LOCK TABLES `report_viewed_product_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_viewed_product_index`
--

DROP TABLE IF EXISTS `report_viewed_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_viewed_product_index` (
  `index_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index ID',
  `visitor_id` int unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reports Viewed Product Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_viewed_product_index`
--

LOCK TABLES `report_viewed_product_index` WRITE;
/*!40000 ALTER TABLE `report_viewed_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_viewed_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_counts`
--

DROP TABLE IF EXISTS `reporting_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporting_counts` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'Item Reported',
  `count` int unsigned DEFAULT NULL COMMENT 'Count Value',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reporting for all count related events generated via the cron job';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_counts`
--

LOCK TABLES `reporting_counts` WRITE;
/*!40000 ALTER TABLE `reporting_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_module_status`
--

DROP TABLE IF EXISTS `reporting_module_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporting_module_status` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Module ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Module Name',
  `active` varchar(255) DEFAULT NULL COMMENT 'Module Active Status',
  `setup_version` varchar(255) DEFAULT NULL COMMENT 'Module Version',
  `state` varchar(255) DEFAULT NULL COMMENT 'Module State',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Module Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_module_status`
--

LOCK TABLES `reporting_module_status` WRITE;
/*!40000 ALTER TABLE `reporting_module_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_module_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_orders`
--

DROP TABLE IF EXISTS `reporting_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporting_orders` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `total` decimal(20,4) unsigned DEFAULT NULL,
  `total_base` decimal(20,4) unsigned DEFAULT NULL,
  `item_count` int unsigned NOT NULL COMMENT 'Line Item Count',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reporting for all orders';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_orders`
--

LOCK TABLES `reporting_orders` WRITE;
/*!40000 ALTER TABLE `reporting_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_system_updates`
--

DROP TABLE IF EXISTS `reporting_system_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporting_system_updates` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'Update Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reporting for system updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_system_updates`
--

LOCK TABLES `reporting_system_updates` WRITE;
/*!40000 ALTER TABLE `reporting_system_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_system_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_users`
--

DROP TABLE IF EXISTS `reporting_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporting_users` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'User Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reporting for user actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_users`
--

LOCK TABLES `reporting_users` WRITE;
/*!40000 ALTER TABLE `reporting_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Review create date',
  `entity_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `entity_pk_value` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `status_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Status code',
  PRIMARY KEY (`review_id`),
  KEY `REVIEW_ENTITY_ID` (`entity_id`),
  KEY `REVIEW_STATUS_ID` (`status_id`),
  KEY `REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`),
  CONSTRAINT `REVIEW_ENTITY_ID_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `review_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_STATUS_ID_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `review_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review base information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_detail`
--

DROP TABLE IF EXISTS `review_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_detail` (
  `detail_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review detail ID',
  `review_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Review ID',
  `store_id` smallint unsigned DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  PRIMARY KEY (`detail_id`),
  KEY `REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  KEY `REVIEW_DETAIL_STORE_ID` (`store_id`),
  KEY `REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `REVIEW_DETAIL_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `REVIEW_DETAIL_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_DETAIL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review detail information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_detail`
--

LOCK TABLES `review_detail` WRITE;
/*!40000 ALTER TABLE `review_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_entity`
--

DROP TABLE IF EXISTS `review_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_entity` (
  `entity_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review entity ID',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Review entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_entity`
--

LOCK TABLES `review_entity` WRITE;
/*!40000 ALTER TABLE `review_entity` DISABLE KEYS */;
INSERT INTO `review_entity` VALUES (1,'product'),(2,'customer'),(3,'category');
/*!40000 ALTER TABLE `review_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_entity_summary`
--

DROP TABLE IF EXISTS `review_entity_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_entity_summary` (
  `primary_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity ID',
  `entity_pk_value` bigint NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `entity_type` smallint NOT NULL DEFAULT '0' COMMENT 'Entity type ID',
  `reviews_count` smallint NOT NULL DEFAULT '0' COMMENT 'Qty of reviews',
  `rating_summary` smallint NOT NULL DEFAULT '0' COMMENT 'Summarized rating',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  PRIMARY KEY (`primary_id`),
  UNIQUE KEY `REVIEW_ENTITY_SUMMARY_ENTITY_PK_VALUE_STORE_ID_ENTITY_TYPE` (`entity_pk_value`,`store_id`,`entity_type`),
  KEY `REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`),
  CONSTRAINT `REVIEW_ENTITY_SUMMARY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review aggregates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_entity_summary`
--

LOCK TABLES `review_entity_summary` WRITE;
/*!40000 ALTER TABLE `review_entity_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_entity_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_status`
--

DROP TABLE IF EXISTS `review_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_status` (
  `status_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Status ID',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Review statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_status`
--

LOCK TABLES `review_status` WRITE;
/*!40000 ALTER TABLE `review_status` DISABLE KEYS */;
INSERT INTO `review_status` VALUES (1,'Approved'),(2,'Pending'),(3,'Not Approved');
/*!40000 ALTER TABLE `review_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_store`
--

DROP TABLE IF EXISTS `review_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_store` (
  `review_id` bigint unsigned NOT NULL COMMENT 'Review ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `REVIEW_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `REVIEW_STORE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_store`
--

LOCK TABLES `review_store` WRITE;
/*!40000 ALTER TABLE `review_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_bestsellers_aggregated_daily`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_bestsellers_aggregated_daily` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Bestsellers Aggregated Daily';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_bestsellers_aggregated_daily`
--

LOCK TABLES `sales_bestsellers_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_bestsellers_aggregated_monthly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_bestsellers_aggregated_monthly` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Bestsellers Aggregated Monthly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_bestsellers_aggregated_monthly`
--

LOCK TABLES `sales_bestsellers_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_bestsellers_aggregated_yearly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_bestsellers_aggregated_yearly` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Bestsellers Aggregated Yearly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_bestsellers_aggregated_yearly`
--

LOCK TABLES `sales_bestsellers_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_creditmemo`
--

DROP TABLE IF EXISTS `sales_creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_creditmemo` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `email_sent` smallint unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint unsigned DEFAULT NULL COMMENT 'Send Email',
  `creditmemo_status` int DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int DEFAULT NULL COMMENT 'Shipping Address ID',
  `billing_address_id` int DEFAULT NULL COMMENT 'Billing Address ID',
  `invoice_id` int DEFAULT NULL COMMENT 'Invoice ID',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_CREDITMEMO_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_CREDITMEMO_STORE_ID` (`store_id`),
  KEY `SALES_CREDITMEMO_ORDER_ID` (`order_id`),
  KEY `SALES_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `SALES_CREDITMEMO_STATE` (`state`),
  KEY `SALES_CREDITMEMO_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_UPDATED_AT` (`updated_at`),
  KEY `SALES_CREDITMEMO_SEND_EMAIL` (`send_email`),
  KEY `SALES_CREDITMEMO_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_CREDITMEMO_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_CREDITMEMO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Creditmemo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_creditmemo`
--

LOCK TABLES `sales_creditmemo` WRITE;
/*!40000 ALTER TABLE `sales_creditmemo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_creditmemo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_creditmemo_comment`
--

DROP TABLE IF EXISTS `sales_creditmemo_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_creditmemo_comment` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` int DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_CREDITMEMO_COMMENT_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_creditmemo` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Creditmemo Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_creditmemo_comment`
--

LOCK TABLES `sales_creditmemo_comment` WRITE;
/*!40000 ALTER TABLE `sales_creditmemo_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_creditmemo_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_creditmemo_grid`
--

DROP TABLE IF EXISTS `sales_creditmemo_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_creditmemo_grid` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `state` int DEFAULT NULL COMMENT 'Status',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order Status',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` smallint DEFAULT NULL COMMENT 'Customer Group ID',
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(20,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `order_base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Order Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_CREDITMEMO_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_CREDITMEMO_GRID_STATE` (`state`),
  KEY `SALES_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_STATUS` (`order_status`),
  KEY `SALES_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `SALES_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_BASE_GRAND_TOTAL` (`order_base_grand_total`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_ID` (`order_id`),
  FULLTEXT KEY `FTI_32B7BA885941A8254EE84AE650ABDC86` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Creditmemo Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_creditmemo_grid`
--

LOCK TABLES `sales_creditmemo_grid` WRITE;
/*!40000 ALTER TABLE `sales_creditmemo_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_creditmemo_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_creditmemo_item`
--

DROP TABLE IF EXISTS `sales_creditmemo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_creditmemo_item` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int DEFAULT NULL COMMENT 'Product ID',
  `order_item_id` int DEFAULT NULL COMMENT 'Order Item ID',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax in the creditmemo item over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_CREDITMEMO_ITEM_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_creditmemo` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Creditmemo Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_creditmemo_item`
--

LOCK TABLES `sales_creditmemo_item` WRITE;
/*!40000 ALTER TABLE `sales_creditmemo_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_creditmemo_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoice`
--

DROP TABLE IF EXISTS `sales_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_invoice` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int DEFAULT NULL COMMENT 'Billing Address ID',
  `is_used_for_refund` smallint unsigned DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `email_sent` smallint unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint unsigned DEFAULT NULL COMMENT 'Send Email',
  `can_void_flag` smallint unsigned DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int DEFAULT NULL COMMENT 'Shipping Address ID',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction ID',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_INVOICE_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_INVOICE_STORE_ID` (`store_id`),
  KEY `SALES_INVOICE_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_INVOICE_ORDER_ID` (`order_id`),
  KEY `SALES_INVOICE_STATE` (`state`),
  KEY `SALES_INVOICE_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_UPDATED_AT` (`updated_at`),
  KEY `SALES_INVOICE_SEND_EMAIL` (`send_email`),
  KEY `SALES_INVOICE_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_INVOICE_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_INVOICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Invoice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoice`
--

LOCK TABLES `sales_invoice` WRITE;
/*!40000 ALTER TABLE `sales_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoice_comment`
--

DROP TABLE IF EXISTS `sales_invoice_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_invoice_comment` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` smallint unsigned DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_INVOICE_COMMENT_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_invoice` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Invoice Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoice_comment`
--

LOCK TABLES `sales_invoice_comment` WRITE;
/*!40000 ALTER TABLE `sales_invoice_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoice_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoice_grid`
--

DROP TABLE IF EXISTS `sales_invoice_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_invoice_grid` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `state` int DEFAULT NULL COMMENT 'State',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int DEFAULT NULL,
  `payment_method` varchar(128) DEFAULT NULL COMMENT 'Payment Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(20,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_INVOICE_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_INVOICE_GRID_STORE_ID` (`store_id`),
  KEY `SALES_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_INVOICE_GRID_ORDER_ID` (`order_id`),
  KEY `SALES_INVOICE_GRID_STATE` (`state`),
  KEY `SALES_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_INVOICE_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_INVOICE_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_INVOICE_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  FULLTEXT KEY `FTI_95D9C924DD6A8734EB8B5D01D60F90DE` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Invoice Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoice_grid`
--

LOCK TABLES `sales_invoice_grid` WRITE;
/*!40000 ALTER TABLE `sales_invoice_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoice_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoice_item`
--

DROP TABLE IF EXISTS `sales_invoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_invoice_item` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(20,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int DEFAULT NULL COMMENT 'Product ID',
  `order_item_id` int DEFAULT NULL COMMENT 'Order Item ID',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax invoiced over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_INVOICE_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_INVOICE_ITEM_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_invoice` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Invoice Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoice_item`
--

LOCK TABLES `sales_invoice_item` WRITE;
/*!40000 ALTER TABLE `sales_invoice_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoice_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoiced_aggregated`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_invoiced_aggregated` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_INVOICED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Invoiced Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoiced_aggregated`
--

LOCK TABLES `sales_invoiced_aggregated` WRITE;
/*!40000 ALTER TABLE `sales_invoiced_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoiced_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoiced_aggregated_order`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_invoiced_aggregated_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_INVOICED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_INVOICED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Invoiced Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoiced_aggregated_order`
--

LOCK TABLES `sales_invoiced_aggregated_order` WRITE;
/*!40000 ALTER TABLE `sales_invoiced_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoiced_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order`
--

DROP TABLE IF EXISTS `sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint unsigned DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint unsigned DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint unsigned DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int DEFAULT NULL COMMENT 'Billing Address ID',
  `customer_group_id` int DEFAULT NULL,
  `edit_increment` int DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint unsigned DEFAULT NULL COMMENT 'Send Email',
  `forced_shipment_with_invoice` smallint unsigned DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int DEFAULT NULL COMMENT 'Quote Address ID',
  `quote_id` int DEFAULT NULL COMMENT 'Quote ID',
  `shipping_address_id` int DEFAULT NULL COMMENT 'Shipping Address ID',
  `adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(20,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(20,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(32) DEFAULT NULL COMMENT 'Increment ID',
  `applied_rule_ids` varchar(128) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(128) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(128) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(128) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(32) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(32) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(32) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(32) DEFAULT NULL COMMENT 'Ext Customer ID',
  `ext_order_id` varchar(32) DEFAULT NULL COMMENT 'Ext Order ID',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(32) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(32) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(32) DEFAULT NULL COMMENT 'Original Increment ID',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child ID',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real ID',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent ID',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real ID',
  `remote_ip` varchar(45) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(120) DEFAULT NULL,
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(255) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text COMMENT 'Customer Note',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `total_item_count` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Total Item Count',
  `customer_gender` int DEFAULT NULL COMMENT 'Customer Gender',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `paypal_ipn_customer_notified` int DEFAULT '0' COMMENT 'Paypal Ipn Customer Notified',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_ORDER_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_ORDER_STATUS` (`status`),
  KEY `SALES_ORDER_STATE` (`state`),
  KEY `SALES_ORDER_STORE_ID` (`store_id`),
  KEY `SALES_ORDER_CREATED_AT` (`created_at`),
  KEY `SALES_ORDER_CUSTOMER_ID` (`customer_id`),
  KEY `SALES_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  KEY `SALES_ORDER_QUOTE_ID` (`quote_id`),
  KEY `SALES_ORDER_UPDATED_AT` (`updated_at`),
  KEY `SALES_ORDER_SEND_EMAIL` (`send_email`),
  KEY `SALES_ORDER_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_ORDER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `SALES_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order`
--

LOCK TABLES `sales_order` WRITE;
/*!40000 ALTER TABLE `sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_address`
--

DROP TABLE IF EXISTS `sales_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_address` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned DEFAULT NULL COMMENT 'Parent ID',
  `customer_address_id` int DEFAULT NULL COMMENT 'Customer Address ID',
  `quote_address_id` int DEFAULT NULL COMMENT 'Quote Address ID',
  `region_id` int DEFAULT NULL COMMENT 'Region ID',
  `customer_id` int DEFAULT NULL COMMENT 'Customer ID',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Phone Number',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country ID',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text COMMENT 'Vat ID',
  `vat_is_valid` smallint DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request ID',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint DEFAULT NULL COMMENT 'Vat Request Success',
  `vertex_vat_country_code` varchar(255) DEFAULT NULL COMMENT 'Vertex Customer Vat Country',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_ADDRESS_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_ORDER_ADDRESS_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_address`
--

LOCK TABLES `sales_order_address` WRITE;
/*!40000 ALTER TABLE `sales_order_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_aggregated_created`
--

DROP TABLE IF EXISTS `sales_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_aggregated_created` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Aggregated Created';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_aggregated_created`
--

LOCK TABLES `sales_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `sales_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_aggregated_updated`
--

DROP TABLE IF EXISTS `sales_order_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_aggregated_updated` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_ORDER_AGGREGATED_UPDATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_aggregated_updated`
--

LOCK TABLES `sales_order_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `sales_order_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_grid`
--

DROP TABLE IF EXISTS `sales_order_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_grid` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group` varchar(255) DEFAULT NULL COMMENT 'Customer Group',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(20,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `payment_method` varchar(255) DEFAULT NULL COMMENT 'Payment Method',
  `total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Refunded',
  `pickup_location_code` varchar(255) DEFAULT NULL COMMENT 'Pickup Location Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_ORDER_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_ORDER_GRID_STATUS` (`status`),
  KEY `SALES_ORDER_GRID_STORE_ID` (`store_id`),
  KEY `SALES_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `SALES_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `SALES_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  KEY `SALES_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `SALES_ORDER_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_ORDER_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  KEY `SALES_ORDER_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_ORDER_GRID_PICKUP_LOCATION_CODE` (`pickup_location_code`),
  FULLTEXT KEY `FTI_65B9E9925EC58F0C7C2E2F6379C233E7` (`increment_id`,`billing_name`,`shipping_name`,`shipping_address`,`billing_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_grid`
--

LOCK TABLES `sales_order_grid` WRITE;
/*!40000 ALTER TABLE `sales_order_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_item`
--

DROP TABLE IF EXISTS `sales_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_item` (
  `item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Order ID',
  `parent_item_id` int unsigned DEFAULT NULL COMMENT 'Parent Item ID',
  `quote_item_id` int unsigned DEFAULT NULL COMMENT 'Quote Item ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` text COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `is_virtual` smallint unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Cost',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `original_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(20,4) DEFAULT '0.0000' COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Amount Refunded',
  `row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_invoiced` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item ID',
  `locked_do_invoice` smallint unsigned DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint unsigned DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `discount_tax_compensation_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Canceled',
  `tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `gift_message_available` int DEFAULT NULL COMMENT 'Gift Message Available',
  `free_shipping` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `SALES_ORDER_ITEM_ORDER_ID` (`order_id`),
  KEY `SALES_ORDER_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_ITEM_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_item`
--

LOCK TABLES `sales_order_item` WRITE;
/*!40000 ALTER TABLE `sales_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_payment`
--

DROP TABLE IF EXISTS `sales_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_payment` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `base_shipping_captured` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(20,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(20,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(20,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int DEFAULT NULL COMMENT 'Quote Payment ID',
  `additional_data` text COMMENT 'Additional Data',
  `cc_exp_month` varchar(12) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(12) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(128) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(128) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(32) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(32) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(32) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last_4` varchar(100) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_status_description` varchar(32) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(32) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(128) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(255) DEFAULT NULL COMMENT 'Last Trans ID',
  `cc_cid_status` varchar(32) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(128) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(32) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(32) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(4) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(4) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(32) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(32) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(32) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(32) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(32) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(32) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(128) DEFAULT NULL,
  `cc_trans_id` varchar(32) DEFAULT NULL COMMENT 'Cc Trans ID',
  `address_status` varchar(32) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text COMMENT 'Additional Information',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_PAYMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_ORDER_PAYMENT_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order Payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_payment`
--

LOCK TABLES `sales_order_payment` WRITE;
/*!40000 ALTER TABLE `sales_order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_status`
--

DROP TABLE IF EXISTS `sales_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_status`
--

LOCK TABLES `sales_order_status` WRITE;
/*!40000 ALTER TABLE `sales_order_status` DISABLE KEYS */;
INSERT INTO `sales_order_status` VALUES ('canceled','Canceled'),('closed','Closed'),('complete','Complete'),('fraud','Suspected Fraud'),('holded','On Hold'),('payment_review','Payment Review'),('paypal_canceled_reversal','PayPal Canceled Reversal'),('paypal_reversed','PayPal Reversed'),('pending','Pending'),('pending_payment','Pending Payment'),('pending_paypal','Pending PayPal'),('processing','Processing');
/*!40000 ALTER TABLE `sales_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_status_history`
--

DROP TABLE IF EXISTS `sales_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_status_history` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` int DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  KEY `SALES_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`),
  CONSTRAINT `SALES_ORDER_STATUS_HISTORY_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order Status History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_status_history`
--

LOCK TABLES `sales_order_status_history` WRITE;
/*!40000 ALTER TABLE `sales_order_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_status_label`
--

DROP TABLE IF EXISTS `sales_order_status_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`,`store_id`),
  KEY `SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_STATUS_LABEL_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_STATUS_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Status Label Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_status_label`
--

LOCK TABLES `sales_order_status_label` WRITE;
/*!40000 ALTER TABLE `sales_order_status_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_status_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_status_state`
--

DROP TABLE IF EXISTS `sales_order_status_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `visible_on_front` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Visible on front',
  PRIMARY KEY (`status`,`state`),
  CONSTRAINT `SALES_ORDER_STATUS_STATE_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_status_state`
--

LOCK TABLES `sales_order_status_state` WRITE;
/*!40000 ALTER TABLE `sales_order_status_state` DISABLE KEYS */;
INSERT INTO `sales_order_status_state` VALUES ('canceled','canceled',1,1),('closed','closed',1,1),('complete','complete',1,1),('fraud','payment_review',0,1),('fraud','processing',0,1),('holded','holded',1,1),('payment_review','payment_review',1,1),('pending','new',1,1),('pending_payment','pending_payment',1,0),('processing','processing',1,1);
/*!40000 ALTER TABLE `sales_order_status_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_tax`
--

DROP TABLE IF EXISTS `sales_order_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_tax` (
  `tax_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax ID',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(20,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int NOT NULL COMMENT 'Priority',
  `position` int NOT NULL COMMENT 'Position',
  `base_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Real Amount',
  PRIMARY KEY (`tax_id`),
  KEY `SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Tax Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_tax`
--

LOCK TABLES `sales_order_tax` WRITE;
/*!40000 ALTER TABLE `sales_order_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_tax_item`
--

DROP TABLE IF EXISTS `sales_order_tax_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_tax_item` (
  `tax_item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Item ID',
  `tax_id` int unsigned NOT NULL COMMENT 'Tax ID',
  `item_id` int unsigned DEFAULT NULL COMMENT 'Item ID',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item',
  `amount` decimal(20,4) NOT NULL COMMENT 'Tax amount for the item and tax rate',
  `base_amount` decimal(20,4) NOT NULL COMMENT 'Base tax amount for the item and tax rate',
  `real_amount` decimal(20,4) NOT NULL COMMENT 'Real tax amount for the item and tax rate',
  `real_base_amount` decimal(20,4) NOT NULL COMMENT 'Real base tax amount for the item and tax rate',
  `associated_item_id` int unsigned DEFAULT NULL COMMENT 'Id of the associated item',
  `taxable_item_type` varchar(32) NOT NULL COMMENT 'Type of the taxable item',
  PRIMARY KEY (`tax_item_id`),
  UNIQUE KEY `SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  KEY `SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` (`associated_item_id`),
  KEY `SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`),
  CONSTRAINT `SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`associated_item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_TAX_ITEM_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_TAX_ITEM_TAX_ID_SALES_ORDER_TAX_TAX_ID` FOREIGN KEY (`tax_id`) REFERENCES `sales_order_tax` (`tax_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Tax Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_tax_item`
--

LOCK TABLES `sales_order_tax_item` WRITE;
/*!40000 ALTER TABLE `sales_order_tax_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_tax_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_payment_transaction`
--

DROP TABLE IF EXISTS `sales_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_payment_transaction` (
  `transaction_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transaction ID',
  `parent_id` int unsigned DEFAULT NULL COMMENT 'Parent ID',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Order ID',
  `payment_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Payment ID',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn ID',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn ID',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Closed',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  KEY `SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  KEY `SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`),
  CONSTRAINT `FK_B99FF1A06402D725EBDB0F3A7ECD47A2` FOREIGN KEY (`parent_id`) REFERENCES `sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_PAYMENT_TRANSACTION_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_PAYMENT_TRANSACTION_PAYMENT_ID_SALES_ORDER_PAYMENT_ENTT_ID` FOREIGN KEY (`payment_id`) REFERENCES `sales_order_payment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Payment Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_payment_transaction`
--

LOCK TABLES `sales_payment_transaction` WRITE;
/*!40000 ALTER TABLE `sales_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_refunded_aggregated`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_refunded_aggregated` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(20,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_REFUNDED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Refunded Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_refunded_aggregated`
--

LOCK TABLES `sales_refunded_aggregated` WRITE;
/*!40000 ALTER TABLE `sales_refunded_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_refunded_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_refunded_aggregated_order`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_refunded_aggregated_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(20,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_REFUNDED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Refunded Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_refunded_aggregated_order`
--

LOCK TABLES `sales_refunded_aggregated_order` WRITE;
/*!40000 ALTER TABLE `sales_refunded_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_refunded_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_sequence_meta`
--

DROP TABLE IF EXISTS `sales_sequence_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_sequence_meta` (
  `meta_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `entity_type` varchar(32) NOT NULL COMMENT 'Prefix',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `sequence_table` varchar(64) NOT NULL COMMENT 'table for sequence',
  PRIMARY KEY (`meta_id`),
  UNIQUE KEY `SALES_SEQUENCE_META_ENTITY_TYPE_STORE_ID` (`entity_type`,`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='sales_sequence_meta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_sequence_meta`
--

LOCK TABLES `sales_sequence_meta` WRITE;
/*!40000 ALTER TABLE `sales_sequence_meta` DISABLE KEYS */;
INSERT INTO `sales_sequence_meta` VALUES (1,'order',0,'sequence_order_0'),(2,'invoice',0,'sequence_invoice_0'),(3,'creditmemo',0,'sequence_creditmemo_0'),(4,'shipment',0,'sequence_shipment_0'),(5,'order',1,'sequence_order_1'),(6,'invoice',1,'sequence_invoice_1'),(7,'creditmemo',1,'sequence_creditmemo_1'),(8,'shipment',1,'sequence_shipment_1');
/*!40000 ALTER TABLE `sales_sequence_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_sequence_profile`
--

DROP TABLE IF EXISTS `sales_sequence_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_sequence_profile` (
  `profile_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `meta_id` int unsigned NOT NULL COMMENT 'Meta_id',
  `prefix` varchar(32) DEFAULT NULL COMMENT 'Prefix',
  `suffix` varchar(32) DEFAULT NULL COMMENT 'Suffix',
  `start_value` int unsigned NOT NULL DEFAULT '1' COMMENT 'Start value for sequence',
  `step` int unsigned NOT NULL DEFAULT '1' COMMENT 'Step for sequence',
  `max_value` int unsigned NOT NULL COMMENT 'MaxValue for sequence',
  `warning_value` int unsigned NOT NULL COMMENT 'WarningValue for sequence',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'isActive flag',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `SALES_SEQUENCE_PROFILE_META_ID_PREFIX_SUFFIX` (`meta_id`,`prefix`,`suffix`),
  CONSTRAINT `SALES_SEQUENCE_PROFILE_META_ID_SALES_SEQUENCE_META_META_ID` FOREIGN KEY (`meta_id`) REFERENCES `sales_sequence_meta` (`meta_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='sales_sequence_profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_sequence_profile`
--

LOCK TABLES `sales_sequence_profile` WRITE;
/*!40000 ALTER TABLE `sales_sequence_profile` DISABLE KEYS */;
INSERT INTO `sales_sequence_profile` VALUES (1,1,NULL,NULL,1,1,4294967295,4294966295,1),(2,2,NULL,NULL,1,1,4294967295,4294966295,1),(3,3,NULL,NULL,1,1,4294967295,4294966295,1),(4,4,NULL,NULL,1,1,4294967295,4294966295,1),(5,5,NULL,NULL,1,1,4294967295,4294966295,1),(6,6,NULL,NULL,1,1,4294967295,4294966295,1),(7,7,NULL,NULL,1,1,4294967295,4294966295,1),(8,8,NULL,NULL,1,1,4294967295,4294966295,1);
/*!40000 ALTER TABLE `sales_sequence_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipment`
--

DROP TABLE IF EXISTS `sales_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_shipment` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint unsigned DEFAULT NULL COMMENT 'Send Email',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `customer_id` int DEFAULT NULL COMMENT 'Customer ID',
  `shipping_address_id` int DEFAULT NULL COMMENT 'Shipping Address ID',
  `billing_address_id` int DEFAULT NULL COMMENT 'Billing Address ID',
  `shipment_status` int DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `packages` text COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob COMMENT 'Shipping Label Content',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_SHIPMENT_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_SHIPMENT_STORE_ID` (`store_id`),
  KEY `SALES_SHIPMENT_TOTAL_QTY` (`total_qty`),
  KEY `SALES_SHIPMENT_ORDER_ID` (`order_id`),
  KEY `SALES_SHIPMENT_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_UPDATED_AT` (`updated_at`),
  KEY `SALES_SHIPMENT_SEND_EMAIL` (`send_email`),
  KEY `SALES_SHIPMENT_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_SHIPMENT_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_SHIPMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Shipment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipment`
--

LOCK TABLES `sales_shipment` WRITE;
/*!40000 ALTER TABLE `sales_shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipment_comment`
--

DROP TABLE IF EXISTS `sales_shipment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_shipment_comment` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` int DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_SHIPMENT_COMMENT_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Shipment Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipment_comment`
--

LOCK TABLES `sales_shipment_comment` WRITE;
/*!40000 ALTER TABLE `sales_shipment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipment_grid`
--

DROP TABLE IF EXISTS `sales_shipment_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_shipment_grid` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_increment_id` varchar(32) NOT NULL COMMENT 'Order Increment ID',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `order_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Order Increment ID',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `shipment_status` int DEFAULT NULL COMMENT 'Shipment Status',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `billing_name` varchar(128) DEFAULT NULL COMMENT 'Billing Name',
  `shipping_name` varchar(128) DEFAULT NULL COMMENT 'Shipping Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_SHIPMENT_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_SHIPMENT_GRID_STORE_ID` (`store_id`),
  KEY `SALES_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  KEY `SALES_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  KEY `SALES_SHIPMENT_GRID_ORDER_STATUS` (`order_status`),
  KEY `SALES_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `SALES_SHIPMENT_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_SHIPMENT_GRID_ORDER_ID` (`order_id`),
  FULLTEXT KEY `FTI_086B40C8955F167B8EA76653437879B4` (`increment_id`,`order_increment_id`,`shipping_name`,`customer_name`,`customer_email`,`billing_address`,`shipping_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Shipment Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipment_grid`
--

LOCK TABLES `sales_shipment_grid` WRITE;
/*!40000 ALTER TABLE `sales_shipment_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipment_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipment_item`
--

DROP TABLE IF EXISTS `sales_shipment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_shipment_item` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `row_total` decimal(20,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(20,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int DEFAULT NULL COMMENT 'Product ID',
  `order_item_id` int DEFAULT NULL COMMENT 'Order Item ID',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_SHIPMENT_ITEM_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Shipment Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipment_item`
--

LOCK TABLES `sales_shipment_item` WRITE;
/*!40000 ALTER TABLE `sales_shipment_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipment_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipment_track`
--

DROP TABLE IF EXISTS `sales_shipment_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_shipment_track` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `track_number` text COMMENT 'Number',
  `description` text COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  KEY `SALES_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  KEY `SALES_SHIPMENT_TRACK_CREATED_AT` (`created_at`),
  CONSTRAINT `SALES_SHIPMENT_TRACK_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Shipment Track';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipment_track`
--

LOCK TABLES `sales_shipment_track` WRITE;
/*!40000 ALTER TABLE `sales_shipment_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipment_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipping_aggregated`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_shipping_aggregated` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_SHPP_AGGRED_PERIOD_STORE_ID_ORDER_STS_SHPP_DESCRIPTION` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_SHIPPING_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Shipping Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipping_aggregated`
--

LOCK TABLES `sales_shipping_aggregated` WRITE;
/*!40000 ALTER TABLE `sales_shipping_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipping_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipping_aggregated_order`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_shipping_aggregated_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_C05FAE47282EEA68654D0924E946761F` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Shipping Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipping_aggregated_order`
--

LOCK TABLES `sales_shipping_aggregated_order` WRITE;
/*!40000 ALTER TABLE `sales_shipping_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipping_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule`
--

DROP TABLE IF EXISTS `salesrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesrule` (
  `rule_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `uses_per_customer` int NOT NULL DEFAULT '0' COMMENT 'Uses Per Customer',
  `is_active` smallint NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `is_advanced` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Advanced',
  `product_ids` text COMMENT 'Product Ids',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int unsigned NOT NULL DEFAULT '0' COMMENT 'Discount Step',
  `apply_to_shipping` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Apply To Shipping',
  `times_used` int unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `is_rss` smallint NOT NULL DEFAULT '0' COMMENT 'Is Rss',
  `coupon_type` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Coupon Type',
  `use_auto_generation` smallint NOT NULL DEFAULT '0' COMMENT 'Use Auto Generation',
  `uses_per_coupon` int NOT NULL DEFAULT '0' COMMENT 'User Per Coupon',
  `simple_free_shipping` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Simple Free Shipping',
  PRIMARY KEY (`rule_id`),
  KEY `SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule`
--

LOCK TABLES `salesrule` WRITE;
/*!40000 ALTER TABLE `salesrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon`
--

DROP TABLE IF EXISTS `salesrule_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesrule_coupon` (
  `coupon_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Coupon ID',
  `rule_id` int unsigned NOT NULL COMMENT 'Rule ID',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int unsigned DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int unsigned DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `expiration_date` datetime DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint unsigned DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Coupon Code Creation Date',
  `type` smallint DEFAULT '0' COMMENT 'Coupon Code Type',
  `generated_by_dotmailer` smallint DEFAULT NULL COMMENT '1 = Generated by dotmailer',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `SALESRULE_COUPON_CODE` (`code`),
  UNIQUE KEY `SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  KEY `SALESRULE_COUPON_RULE_ID` (`rule_id`),
  CONSTRAINT `SALESRULE_COUPON_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Coupon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon`
--

LOCK TABLES `salesrule_coupon` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon_aggregated`
--

DROP TABLE IF EXISTS `salesrule_coupon_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesrule_coupon_aggregated` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALESRULE_COUPON_AGGRED_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `SALESRULE_COUPON_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Coupon Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon_aggregated`
--

LOCK TABLES `salesrule_coupon_aggregated` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon_aggregated_order`
--

DROP TABLE IF EXISTS `salesrule_coupon_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesrule_coupon_aggregated_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_1094D1FBBCBB11704A29DEF3ACC37D2B` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`),
  CONSTRAINT `SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Coupon Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon_aggregated_order`
--

LOCK TABLES `salesrule_coupon_aggregated_order` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon_aggregated_updated`
--

DROP TABLE IF EXISTS `salesrule_coupon_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesrule_coupon_aggregated_updated` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_7196FA120A4F0F84E1B66605E87E213E` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Coupon Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon_aggregated_updated`
--

LOCK TABLES `salesrule_coupon_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon_usage`
--

DROP TABLE IF EXISTS `salesrule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesrule_coupon_usage` (
  `coupon_id` int unsigned NOT NULL COMMENT 'Coupon ID',
  `customer_id` int unsigned NOT NULL COMMENT 'Customer ID',
  `times_used` int unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `SALESRULE_COUPON_USAGE_COUPON_ID_SALESRULE_COUPON_COUPON_ID` FOREIGN KEY (`coupon_id`) REFERENCES `salesrule_coupon` (`coupon_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_COUPON_USAGE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Coupon Usage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon_usage`
--

LOCK TABLES `salesrule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_customer`
--

DROP TABLE IF EXISTS `salesrule_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesrule_customer` (
  `rule_customer_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer ID',
  `rule_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `customer_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `times_used` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`rule_customer_id`),
  KEY `SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  KEY `SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`),
  CONSTRAINT `SALESRULE_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_CUSTOMER_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_customer`
--

LOCK TABLES `salesrule_customer` WRITE;
/*!40000 ALTER TABLE `salesrule_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_customer_group`
--

DROP TABLE IF EXISTS `salesrule_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesrule_customer_group` (
  `rule_id` int unsigned NOT NULL COMMENT 'Rule ID',
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `SALESRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_CUSTOMER_GROUP_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Rules To Customer Groups Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_customer_group`
--

LOCK TABLES `salesrule_customer_group` WRITE;
/*!40000 ALTER TABLE `salesrule_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_label`
--

DROP TABLE IF EXISTS `salesrule_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesrule_label` (
  `label_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Label ID',
  `rule_id` int unsigned NOT NULL COMMENT 'Rule ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  KEY `SALESRULE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `SALESRULE_LABEL_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_label`
--

LOCK TABLES `salesrule_label` WRITE;
/*!40000 ALTER TABLE `salesrule_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_product_attribute`
--

DROP TABLE IF EXISTS `salesrule_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesrule_product_attribute` (
  `rule_id` int unsigned NOT NULL COMMENT 'Rule ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `SALESRULE_PRD_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_PRD_ATTR_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_PRODUCT_ATTRIBUTE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Product Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_product_attribute`
--

LOCK TABLES `salesrule_product_attribute` WRITE;
/*!40000 ALTER TABLE `salesrule_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_website`
--

DROP TABLE IF EXISTS `salesrule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesrule_website` (
  `rule_id` int unsigned NOT NULL COMMENT 'Rule ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `SALESRULE_WEBSITE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Rules To Websites Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_website`
--

LOCK TABLES `salesrule_website` WRITE;
/*!40000 ALTER TABLE `salesrule_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_query`
--

DROP TABLE IF EXISTS `search_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_query` (
  `query_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int unsigned NOT NULL DEFAULT '0' COMMENT 'Num results',
  `popularity` int unsigned NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `display_in_terms` smallint NOT NULL DEFAULT '1' COMMENT 'Display in terms',
  `is_active` smallint DEFAULT '1' COMMENT 'Active status',
  `is_processed` smallint DEFAULT '0' COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated at',
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID` (`query_text`,`store_id`),
  KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  KEY `SEARCH_QUERY_STORE_ID` (`store_id`),
  KEY `SEARCH_QUERY_IS_PROCESSED` (`is_processed`),
  KEY `SEARCH_QUERY_STORE_ID_POPULARITY` (`store_id`,`popularity`),
  CONSTRAINT `SEARCH_QUERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Search query table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_query`
--

LOCK TABLES `search_query` WRITE;
/*!40000 ALTER TABLE `search_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_synonyms`
--

DROP TABLE IF EXISTS `search_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_synonyms` (
  `group_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Synonyms Group ID',
  `synonyms` text NOT NULL COMMENT 'list of synonyms making up this group',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID - identifies the store view these synonyms belong to',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID - identifies the website ID these synonyms belong to',
  PRIMARY KEY (`group_id`),
  KEY `SEARCH_SYNONYMS_STORE_ID` (`store_id`),
  KEY `SEARCH_SYNONYMS_WEBSITE_ID` (`website_id`),
  FULLTEXT KEY `SEARCH_SYNONYMS_SYNONYMS` (`synonyms`),
  CONSTRAINT `SEARCH_SYNONYMS_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `SEARCH_SYNONYMS_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='table storing various synonyms groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_synonyms`
--

LOCK TABLES `search_synonyms` WRITE;
/*!40000 ALTER TABLE `search_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendfriend_log`
--

DROP TABLE IF EXISTS `sendfriend_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sendfriend_log` (
  `log_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `ip` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Customer IP address',
  `time` int unsigned NOT NULL DEFAULT '0' COMMENT 'Log time',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`log_id`),
  KEY `SENDFRIEND_LOG_IP` (`ip`),
  KEY `SENDFRIEND_LOG_TIME` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Send to friend function log storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendfriend_log`
--

LOCK TABLES `sendfriend_log` WRITE;
/*!40000 ALTER TABLE `sendfriend_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendfriend_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_creditmemo_0`
--

DROP TABLE IF EXISTS `sequence_creditmemo_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequence_creditmemo_0` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_creditmemo_0`
--

LOCK TABLES `sequence_creditmemo_0` WRITE;
/*!40000 ALTER TABLE `sequence_creditmemo_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_creditmemo_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_creditmemo_1`
--

DROP TABLE IF EXISTS `sequence_creditmemo_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequence_creditmemo_1` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_creditmemo_1`
--

LOCK TABLES `sequence_creditmemo_1` WRITE;
/*!40000 ALTER TABLE `sequence_creditmemo_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_creditmemo_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_invoice_0`
--

DROP TABLE IF EXISTS `sequence_invoice_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequence_invoice_0` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_invoice_0`
--

LOCK TABLES `sequence_invoice_0` WRITE;
/*!40000 ALTER TABLE `sequence_invoice_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_invoice_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_invoice_1`
--

DROP TABLE IF EXISTS `sequence_invoice_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequence_invoice_1` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_invoice_1`
--

LOCK TABLES `sequence_invoice_1` WRITE;
/*!40000 ALTER TABLE `sequence_invoice_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_invoice_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_order_0`
--

DROP TABLE IF EXISTS `sequence_order_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequence_order_0` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_order_0`
--

LOCK TABLES `sequence_order_0` WRITE;
/*!40000 ALTER TABLE `sequence_order_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_order_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_order_1`
--

DROP TABLE IF EXISTS `sequence_order_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequence_order_1` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_order_1`
--

LOCK TABLES `sequence_order_1` WRITE;
/*!40000 ALTER TABLE `sequence_order_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_order_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_shipment_0`
--

DROP TABLE IF EXISTS `sequence_shipment_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequence_shipment_0` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_shipment_0`
--

LOCK TABLES `sequence_shipment_0` WRITE;
/*!40000 ALTER TABLE `sequence_shipment_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_shipment_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_shipment_1`
--

DROP TABLE IF EXISTS `sequence_shipment_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequence_shipment_1` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_shipment_1`
--

LOCK TABLES `sequence_shipment_1` WRITE;
/*!40000 ALTER TABLE `sequence_shipment_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_shipment_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int unsigned NOT NULL DEFAULT '0' COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Database Sessions Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setup_module`
--

DROP TABLE IF EXISTS `setup_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setup_module` (
  `module` varchar(50) NOT NULL COMMENT 'Module',
  `schema_version` varchar(50) DEFAULT NULL COMMENT 'Schema Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version',
  PRIMARY KEY (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Module versions registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setup_module`
--

LOCK TABLES `setup_module` WRITE;
/*!40000 ALTER TABLE `setup_module` DISABLE KEYS */;
INSERT INTO `setup_module` VALUES ('Amazon_Core','4.2.1','4.2.1'),('Amazon_Login','4.2.1','4.2.1'),('Amazon_Payment','4.2.1','4.2.1'),('Dotdigitalgroup_Chat','1.5.0','1.5.0'),('Dotdigitalgroup_Email','4.12.0','4.12.0'),('Dotdigitalgroup_Sms','1.1.1','1.1.1'),('Klarna_Core','6.2.2','6.2.2'),('Klarna_Kp','7.3.2','7.3.2'),('Klarna_KpGraphQl','0.9.3','0.9.3'),('Klarna_Onsitemessaging','1.0.5','1.0.5'),('Klarna_Ordermanagement','6.2.2','6.2.2'),('Magento_ComposerRootUpdatePlugin','0.1.0','0.1.0'),('Magento_GoogleShoppingAds','4.0.1','4.0.1'),('Magento_Securitytxt','1.0.0','1.0.0'),('PayPal_Braintree','4.0.3','4.0.3'),('Vertex_AddressValidation','100.5.0','100.5.0'),('Yotpo_Yotpo','3.2.0','3.2.0');
/*!40000 ALTER TABLE `setup_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_tablerate`
--

DROP TABLE IF EXISTS `shipping_tablerate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_tablerate` (
  `pk` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `website_id` int NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int NOT NULL DEFAULT '0' COMMENT 'Destination Region ID',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(30) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Cost',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `UNQ_D60821CDB2AFACEE1566CFC02D0D4CAA` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Shipping Tablerate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_tablerate`
--

LOCK TABLES `shipping_tablerate` WRITE;
/*!40000 ALTER TABLE `shipping_tablerate` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_tablerate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitemap`
--

DROP TABLE IF EXISTS `sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitemap` (
  `sitemap_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sitemap ID',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  PRIMARY KEY (`sitemap_id`),
  KEY `SITEMAP_STORE_ID` (`store_id`),
  CONSTRAINT `SITEMAP_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='XML Sitemap';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemap`
--

LOCK TABLES `sitemap` WRITE;
/*!40000 ALTER TABLE `sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Store ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `group_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Group ID',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store Sort Order',
  `is_active` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store Activity',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `STORE_CODE` (`code`),
  KEY `STORE_WEBSITE_ID` (`website_id`),
  KEY `STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  KEY `STORE_GROUP_ID` (`group_id`),
  CONSTRAINT `STORE_GROUP_ID_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `store_group` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `STORE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (0,'admin',0,0,'Admin',0,1),(1,'default',1,1,'Default Store View',0,1);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_group`
--

DROP TABLE IF EXISTS `store_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_group` (
  `group_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Group ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Root Category ID',
  `default_store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Default Store ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Store group unique code',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `STORE_GROUP_CODE` (`code`),
  KEY `STORE_GROUP_WEBSITE_ID` (`website_id`),
  KEY `STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`),
  CONSTRAINT `STORE_GROUP_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Store Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_group`
--

LOCK TABLES `store_group` WRITE;
/*!40000 ALTER TABLE `store_group` DISABLE KEYS */;
INSERT INTO `store_group` VALUES (0,0,'Default',0,0,'default'),(1,1,'Main Website Store',2,1,'main_website_store');
/*!40000 ALTER TABLE `store_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_website`
--

DROP TABLE IF EXISTS `store_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_website` (
  `website_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Website ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_group_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Default Group ID',
  `is_default` smallint unsigned DEFAULT '0' COMMENT 'Defines Is Website Default',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `STORE_WEBSITE_CODE` (`code`),
  KEY `STORE_WEBSITE_SORT_ORDER` (`sort_order`),
  KEY `STORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Websites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_website`
--

LOCK TABLES `store_website` WRITE;
/*!40000 ALTER TABLE `store_website` DISABLE KEYS */;
INSERT INTO `store_website` VALUES (0,'admin','Admin',0,0,0),(1,'base','Main Website',0,1,1);
/*!40000 ALTER TABLE `store_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation`
--

DROP TABLE IF EXISTS `tax_calculation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_calculation` (
  `tax_calculation_id` int NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation ID',
  `tax_calculation_rate_id` int NOT NULL COMMENT 'Tax Calculation Rate ID',
  `tax_calculation_rule_id` int NOT NULL COMMENT 'Tax Calculation Rule ID',
  `customer_tax_class_id` smallint NOT NULL COMMENT 'Customer Tax Class ID',
  `product_tax_class_id` smallint NOT NULL COMMENT 'Product Tax Class ID',
  PRIMARY KEY (`tax_calculation_id`),
  KEY `TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  KEY `TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  KEY `TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  KEY `TAX_CALC_TAX_CALC_RATE_ID_CSTR_TAX_CLASS_ID_PRD_TAX_CLASS_ID` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`),
  CONSTRAINT `TAX_CALC_TAX_CALC_RATE_ID_TAX_CALC_RATE_TAX_CALC_RATE_ID` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALC_TAX_CALC_RULE_ID_TAX_CALC_RULE_TAX_CALC_RULE_ID` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALCULATION_PRODUCT_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Calculation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation`
--

LOCK TABLES `tax_calculation` WRITE;
/*!40000 ALTER TABLE `tax_calculation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_calculation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation_rate`
--

DROP TABLE IF EXISTS `tax_calculation_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_calculation_rate` (
  `tax_calculation_rate_id` int NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate ID',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country ID',
  `tax_region_id` int NOT NULL COMMENT 'Tax Region ID',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int unsigned DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int unsigned DEFAULT NULL COMMENT 'Zip To',
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `TAX_CALCULATION_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `IDX_CA799F1E2CB843495F601E56C84A626D` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='Tax Calculation Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation_rate`
--

LOCK TABLES `tax_calculation_rate` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rate` DISABLE KEYS */;
INSERT INTO `tax_calculation_rate` VALUES (1,'US',12,'*','US-CA-*-Rate 1',8.2500,NULL,NULL,NULL),(2,'US',43,'*','US-NY-*-Rate 1',8.3750,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tax_calculation_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation_rate_title`
--

DROP TABLE IF EXISTS `tax_calculation_rate_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title ID',
  `tax_calculation_rate_id` int NOT NULL COMMENT 'Tax Calculation Rate ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  KEY `TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_37FB965F786AD5897BB3AE90470C42AB` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALCULATION_RATE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Calculation Rate Title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation_rate_title`
--

LOCK TABLES `tax_calculation_rate_title` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rate_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_calculation_rate_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation_rule`
--

DROP TABLE IF EXISTS `tax_calculation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_calculation_rule` (
  `tax_calculation_rule_id` int NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int NOT NULL COMMENT 'Priority',
  `position` int NOT NULL COMMENT 'Position',
  `calculate_subtotal` int NOT NULL COMMENT 'Calculate off subtotal option',
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `TAX_CALCULATION_RULE_PRIORITY_POSITION` (`priority`,`position`),
  KEY `TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Calculation Rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation_rule`
--

LOCK TABLES `tax_calculation_rule` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_calculation_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_class` (
  `class_id` smallint NOT NULL AUTO_INCREMENT COMMENT 'Class ID',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='Tax Class';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_class`
--

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
INSERT INTO `tax_class` VALUES (2,'Taxable Goods','PRODUCT'),(3,'Retail Customer','CUSTOMER'),(4,'Refund Adjustments','PRODUCT'),(5,'Gift Options','PRODUCT'),(6,'Order Gift Wrapping','PRODUCT'),(7,'Item Gift Wrapping','PRODUCT'),(8,'Printed Gift Card','PRODUCT'),(9,'Reward Points','PRODUCT');
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_order_aggregated_created`
--

DROP TABLE IF EXISTS `tax_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_order_aggregated_created` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TAX_ORDER_AGGRED_CREATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `TAX_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Order Aggregation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_order_aggregated_created`
--

LOCK TABLES `tax_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `tax_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_order_aggregated_updated`
--

DROP TABLE IF EXISTS `tax_order_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_order_aggregated_updated` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TAX_ORDER_AGGRED_UPDATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `TAX_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Order Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_order_aggregated_updated`
--

LOCK TABLES `tax_order_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `tax_order_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_order_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme` (
  `theme_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme identifier',
  `parent_id` int DEFAULT NULL COMMENT 'Parent ID',
  `theme_path` varchar(255) DEFAULT NULL COMMENT 'Theme Path',
  `theme_title` varchar(255) NOT NULL COMMENT 'Theme Title',
  `preview_image` varchar(255) DEFAULT NULL COMMENT 'Preview Image',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Theme Featured',
  `area` varchar(255) NOT NULL COMMENT 'Theme Area',
  `type` smallint NOT NULL COMMENT 'Theme type: 0:physical, 1:virtual, 2:staging',
  `code` text COMMENT 'Full theme code, including package',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Core theme';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` VALUES (1,NULL,'Magento/blank','Magento Blank','preview_image_617d5b0eb94f0.jpeg',0,'frontend',0,'Magento/blank'),(2,NULL,'Magento/backend','Magento 2 backend',NULL,0,'adminhtml',0,'Magento/backend'),(3,1,'Magento/luma','Magento Luma','preview_image_617d5b0eccdda.jpeg',0,'frontend',0,'Magento/luma');
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_file`
--

DROP TABLE IF EXISTS `theme_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_file` (
  `theme_files_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme files identifier',
  `theme_id` int unsigned NOT NULL COMMENT 'Theme ID',
  `file_path` varchar(255) DEFAULT NULL COMMENT 'Relative path to file',
  `file_type` varchar(32) NOT NULL COMMENT 'File Type',
  `content` longtext NOT NULL COMMENT 'File Content',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Temporary File',
  PRIMARY KEY (`theme_files_id`),
  KEY `THEME_FILE_THEME_ID_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `THEME_FILE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Core theme files';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_file`
--

LOCK TABLES `theme_file` WRITE;
/*!40000 ALTER TABLE `theme_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `theme_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translation`
--

DROP TABLE IF EXISTS `translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translation` (
  `key_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key ID of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  `crc_string` bigint NOT NULL DEFAULT '1591228201' COMMENT 'Translation String CRC32 Hash',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `TRANSLATION_STORE_ID_LOCALE_CRC_STRING_STRING` (`store_id`,`locale`,`crc_string`,`string`),
  CONSTRAINT `TRANSLATION_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Translations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translation`
--

LOCK TABLES `translation` WRITE;
/*!40000 ALTER TABLE `translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ui_bookmark`
--

DROP TABLE IF EXISTS `ui_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ui_bookmark` (
  `bookmark_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Bookmark identifier',
  `user_id` int unsigned NOT NULL COMMENT 'User ID',
  `namespace` varchar(255) NOT NULL COMMENT 'Bookmark namespace',
  `identifier` varchar(255) NOT NULL COMMENT 'Bookmark Identifier',
  `current` smallint NOT NULL COMMENT 'Mark current bookmark per user and identifier',
  `title` varchar(255) DEFAULT NULL COMMENT 'Bookmark title',
  `config` longtext COMMENT 'Bookmark config',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Bookmark created at',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Bookmark updated at',
  PRIMARY KEY (`bookmark_id`),
  KEY `UI_BOOKMARK_USER_ID_NAMESPACE_IDENTIFIER` (`user_id`,`namespace`,`identifier`),
  CONSTRAINT `UI_BOOKMARK_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='Bookmark';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ui_bookmark`
--

LOCK TABLES `ui_bookmark` WRITE;
/*!40000 ALTER TABLE `ui_bookmark` DISABLE KEYS */;
INSERT INTO `ui_bookmark` VALUES (1,1,'product_listing','default',1,'Default View','{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"entity_id\":{\"visible\":true,\"sorting\":\"asc\"},\"name\":{\"visible\":true,\"sorting\":false},\"sku\":{\"visible\":true,\"sorting\":false},\"price\":{\"visible\":true,\"sorting\":false},\"websites\":{\"visible\":true,\"sorting\":false},\"qty\":{\"visible\":true,\"sorting\":false},\"short_description\":{\"visible\":false,\"sorting\":false},\"special_price\":{\"visible\":false,\"sorting\":false},\"cost\":{\"visible\":false,\"sorting\":false},\"weight\":{\"visible\":false,\"sorting\":false},\"meta_title\":{\"visible\":false,\"sorting\":false},\"meta_keyword\":{\"visible\":false,\"sorting\":false},\"meta_description\":{\"visible\":false,\"sorting\":false},\"msrp\":{\"visible\":false,\"sorting\":false},\"url_key\":{\"visible\":false,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"type_id\":{\"visible\":true,\"sorting\":false},\"attribute_set_id\":{\"visible\":true,\"sorting\":false},\"visibility\":{\"visible\":true,\"sorting\":false},\"status\":{\"visible\":true,\"sorting\":false},\"manufacturer\":{\"visible\":false,\"sorting\":false},\"color\":{\"visible\":false,\"sorting\":false},\"custom_design\":{\"visible\":false,\"sorting\":false},\"page_layout\":{\"visible\":false,\"sorting\":false},\"country_of_manufacture\":{\"visible\":false,\"sorting\":false},\"custom_layout\":{\"visible\":false,\"sorting\":false},\"gift_message_available\":{\"visible\":false,\"sorting\":false},\"tax_class_id\":{\"visible\":false,\"sorting\":false},\"salable_quantity\":{\"visible\":true,\"sorting\":false},\"thumbnail\":{\"visible\":true,\"sorting\":false},\"special_from_date\":{\"visible\":false,\"sorting\":false},\"special_to_date\":{\"visible\":false,\"sorting\":false},\"news_from_date\":{\"visible\":false,\"sorting\":false},\"news_to_date\":{\"visible\":false,\"sorting\":false},\"custom_design_from\":{\"visible\":false,\"sorting\":false},\"custom_design_to\":{\"visible\":false,\"sorting\":false}},\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"search\":{\"value\":\"\"},\"displayMode\":\"grid\",\"positions\":{\"ids\":0,\"entity_id\":1,\"thumbnail\":2,\"name\":3,\"type_id\":4,\"attribute_set_id\":5,\"sku\":6,\"price\":7,\"qty\":8,\"salable_quantity\":9,\"visibility\":10,\"status\":11,\"websites\":12,\"short_description\":13,\"special_price\":14,\"special_from_date\":15,\"special_to_date\":16,\"cost\":17,\"weight\":18,\"manufacturer\":19,\"meta_title\":20,\"meta_keyword\":21,\"meta_description\":22,\"color\":23,\"news_from_date\":24,\"news_to_date\":25,\"custom_design\":26,\"custom_design_from\":27,\"custom_design_to\":28,\"page_layout\":29,\"country_of_manufacture\":30,\"custom_layout\":31,\"msrp\":32,\"url_key\":33,\"gift_message_available\":34,\"tax_class_id\":35,\"actions\":36}},\"value\":\"Default View\"}}}','2021-10-30 15:18:18','2021-10-30 15:18:18'),(2,1,'product_listing','current',0,NULL,'{\"current\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"entity_id\":{\"visible\":true,\"sorting\":\"asc\"},\"name\":{\"visible\":true,\"sorting\":false},\"sku\":{\"visible\":true,\"sorting\":false},\"price\":{\"visible\":true,\"sorting\":false},\"websites\":{\"visible\":true,\"sorting\":false},\"qty\":{\"visible\":true,\"sorting\":false},\"short_description\":{\"visible\":false,\"sorting\":false},\"special_price\":{\"visible\":false,\"sorting\":false},\"cost\":{\"visible\":false,\"sorting\":false},\"weight\":{\"visible\":false,\"sorting\":false},\"meta_title\":{\"visible\":false,\"sorting\":false},\"meta_keyword\":{\"visible\":false,\"sorting\":false},\"meta_description\":{\"visible\":false,\"sorting\":false},\"msrp\":{\"visible\":false,\"sorting\":false},\"url_key\":{\"visible\":false,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"type_id\":{\"visible\":true,\"sorting\":false},\"attribute_set_id\":{\"visible\":true,\"sorting\":false},\"visibility\":{\"visible\":true,\"sorting\":false},\"status\":{\"visible\":true,\"sorting\":false},\"manufacturer\":{\"visible\":false,\"sorting\":false},\"color\":{\"visible\":false,\"sorting\":false},\"custom_design\":{\"visible\":false,\"sorting\":false},\"page_layout\":{\"visible\":false,\"sorting\":false},\"country_of_manufacture\":{\"visible\":false,\"sorting\":false},\"custom_layout\":{\"visible\":false,\"sorting\":false},\"gift_message_available\":{\"visible\":false,\"sorting\":false},\"tax_class_id\":{\"visible\":false,\"sorting\":false},\"salable_quantity\":{\"visible\":true,\"sorting\":false},\"thumbnail\":{\"visible\":true,\"sorting\":false},\"special_from_date\":{\"visible\":false,\"sorting\":false},\"special_to_date\":{\"visible\":false,\"sorting\":false},\"news_from_date\":{\"visible\":false,\"sorting\":false},\"news_to_date\":{\"visible\":false,\"sorting\":false},\"custom_design_from\":{\"visible\":false,\"sorting\":false},\"custom_design_to\":{\"visible\":false,\"sorting\":false}},\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"search\":{\"value\":\"\"},\"displayMode\":\"grid\",\"positions\":{\"ids\":0,\"entity_id\":1,\"thumbnail\":2,\"name\":3,\"type_id\":4,\"attribute_set_id\":5,\"sku\":6,\"price\":7,\"qty\":8,\"salable_quantity\":9,\"visibility\":10,\"status\":11,\"websites\":12,\"short_description\":13,\"special_price\":14,\"special_from_date\":15,\"special_to_date\":16,\"cost\":17,\"weight\":18,\"manufacturer\":19,\"meta_title\":20,\"meta_keyword\":21,\"meta_description\":22,\"color\":23,\"news_from_date\":24,\"news_to_date\":25,\"custom_design\":26,\"custom_design_from\":27,\"custom_design_to\":28,\"page_layout\":29,\"country_of_manufacture\":30,\"custom_layout\":31,\"msrp\":32,\"url_key\":33,\"gift_message_available\":34,\"tax_class_id\":35,\"actions\":36}}}','2021-10-30 15:18:19','2021-10-30 15:18:19');
/*!40000 ALTER TABLE `ui_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_rewrite`
--

DROP TABLE IF EXISTS `url_rewrite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `url_rewrite` (
  `url_rewrite_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rewrite ID',
  `entity_type` varchar(32) NOT NULL COMMENT 'Entity type code',
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `redirect_type` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Redirect Type',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description',
  `is_autogenerated` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is rewrite generated automatically flag',
  `metadata` varchar(255) DEFAULT NULL COMMENT 'Meta data for url rewrite',
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  KEY `URL_REWRITE_TARGET_PATH` (`target_path`),
  KEY `URL_REWRITE_STORE_ID_ENTITY_ID` (`store_id`,`entity_id`),
  KEY `URL_REWRITE_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb3 COMMENT='Url Rewrites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_rewrite`
--

LOCK TABLES `url_rewrite` WRITE;
/*!40000 ALTER TABLE `url_rewrite` DISABLE KEYS */;
INSERT INTO `url_rewrite` VALUES (1,'cms-page',1,'no-route','cms/page/view/page_id/1',0,1,NULL,1,NULL),(2,'cms-page',2,'home','cms/page/view/page_id/2',0,1,NULL,1,NULL),(3,'cms-page',3,'enable-cookies','cms/page/view/page_id/3',0,1,NULL,1,NULL),(4,'cms-page',4,'privacy-policy-cookie-restriction-mode','cms/page/view/page_id/4',0,1,NULL,1,NULL),(5,'category',3,'xe-mo-hinh.html','catalog/category/view/id/3',0,1,NULL,1,NULL),(6,'category',4,'lego.html','catalog/category/view/id/4',0,1,NULL,1,NULL),(7,'category',5,'bup-be-th-i-trang.html','catalog/category/view/id/5',0,1,NULL,1,NULL),(8,'category',6,'thu-bong.html','catalog/category/view/id/6',0,1,NULL,1,NULL),(9,'category',7,'d-choi-giao-d-c.html','catalog/category/view/id/7',0,1,NULL,1,NULL),(10,'product',1,'tr-m-c-u-h-a-bworld-xe-land-rover-defender.html','catalog/product/view/id/1',0,1,NULL,1,NULL),(11,'product',1,'xe-mo-hinh/tr-m-c-u-h-a-bworld-xe-land-rover-defender.html','catalog/product/view/id/1/category/3',0,1,NULL,1,'{\"category_id\":\"3\"}'),(12,'product',2,'mo-hinh-xe-mo-to-1-12-dong-ducati-diavel-carbon.html','catalog/product/view/id/2',0,1,NULL,1,NULL),(13,'product',2,'xe-mo-hinh/mo-hinh-xe-mo-to-1-12-dong-ducati-diavel-carbon.html','catalog/product/view/id/2/category/3',0,1,NULL,1,'{\"category_id\":\"3\"}'),(14,'product',3,'mo-hinh-xe-hoi-tr-n-porsche-911-992-carrera-4s.html','catalog/product/view/id/3',0,1,NULL,1,NULL),(15,'product',3,'xe-mo-hinh/mo-hinh-xe-hoi-tr-n-porsche-911-992-carrera-4s.html','catalog/product/view/id/3/category/3',0,1,NULL,1,'{\"category_id\":\"3\"}'),(22,'product',9,'xe-c-u-h-quy-n-nang-paw-patrol.html','catalog/product/view/id/9',0,1,NULL,1,NULL),(23,'product',9,'xe-mo-hinh/xe-c-u-h-quy-n-nang-paw-patrol.html','catalog/product/view/id/9/category/3',0,1,NULL,1,'{\"category_id\":\"3\"}'),(24,'product',8,'xe-c-u-h-co-b-n-paw-patrol-skye.html','catalog/product/view/id/8',0,1,NULL,1,NULL),(25,'product',8,'xe-mo-hinh/xe-c-u-h-co-b-n-paw-patrol-skye.html','catalog/product/view/id/8/category/3',0,1,NULL,1,'{\"category_id\":\"3\"}'),(26,'product',7,'xe-c-u-h-co-b-n-paw-patrol-rubble.html','catalog/product/view/id/7',0,1,NULL,1,NULL),(27,'product',7,'xe-mo-hinh/xe-c-u-h-co-b-n-paw-patrol-rubble.html','catalog/product/view/id/7/category/3',0,1,NULL,1,'{\"category_id\":\"3\"}'),(28,'product',6,'xe-t-i-nhi-u-ngan-c-nh-sat.html','catalog/product/view/id/6',0,1,NULL,1,NULL),(29,'product',6,'xe-mo-hinh/xe-t-i-nhi-u-ngan-c-nh-sat.html','catalog/product/view/id/6/category/3',0,1,NULL,1,'{\"category_id\":\"3\"}'),(30,'product',5,'combo-xe-buyt-du-l-ch-xe-taxi.html','catalog/product/view/id/5',0,1,NULL,1,NULL),(31,'product',5,'xe-mo-hinh/combo-xe-buyt-du-l-ch-xe-taxi.html','catalog/product/view/id/5/category/3',0,1,NULL,1,'{\"category_id\":\"3\"}'),(32,'product',4,'xe-bi-n-hinh-soi-tuy-t-dung-m-nh.html','catalog/product/view/id/4',0,1,NULL,1,NULL),(33,'product',4,'xe-mo-hinh/xe-bi-n-hinh-soi-tuy-t-dung-m-nh.html','catalog/product/view/id/4/category/3',0,1,NULL,1,'{\"category_id\":\"3\"}'),(34,'product',10,'d-choi-d-ng-mo-hinh-theo-t-l-thu-nh-1-16-xe-xuc-dao-t-ng.html','catalog/product/view/id/10',0,1,NULL,1,NULL),(35,'product',10,'xe-mo-hinh/d-choi-d-ng-mo-hinh-theo-t-l-thu-nh-1-16-xe-xuc-dao-t-ng.html','catalog/product/view/id/10/category/3',0,1,NULL,1,'{\"category_id\":\"3\"}'),(36,'product',11,'tau-tu-n-tra-c-nh-sat.html','catalog/product/view/id/11',0,1,NULL,1,NULL),(37,'product',11,'lego/tau-tu-n-tra-c-nh-sat.html','catalog/product/view/id/11/category/4',0,1,NULL,1,'{\"category_id\":\"4\"}'),(38,'product',12,'cau-chuy-n-phieu-luu-c-a-ariel-belle-cinderella-va-tiana.html','catalog/product/view/id/12',0,1,NULL,1,NULL),(39,'product',12,'lego/cau-chuy-n-phieu-luu-c-a-ariel-belle-cinderella-va-tiana.html','catalog/product/view/id/12/category/4',0,1,NULL,1,'{\"category_id\":\"4\"}'),(40,'product',13,'lau-dai-bang-gia.html','catalog/product/view/id/13',0,1,NULL,1,NULL),(41,'product',13,'lego/lau-dai-bang-gia.html','catalog/product/view/id/13/category/4',0,1,NULL,1,'{\"category_id\":\"4\"}'),(42,'product',14,'l-p-h-c-mon-bi-n-hinh.html','catalog/product/view/id/14',0,1,NULL,1,NULL),(43,'product',14,'lego/l-p-h-c-mon-bi-n-hinh.html','catalog/product/view/id/14/category/4',0,1,NULL,1,'{\"category_id\":\"4\"}'),(44,'product',15,'l-p-h-c-mon-d-c-du-c.html','catalog/product/view/id/15',0,1,NULL,1,NULL),(45,'product',15,'lego/l-p-h-c-mon-d-c-du-c.html','catalog/product/view/id/15/category/4',0,1,NULL,1,'{\"category_id\":\"4\"}'),(46,'product',16,'chu-ng-ng-a.html','catalog/product/view/id/16',0,1,NULL,1,NULL),(47,'product',16,'lego/chu-ng-ng-a.html','catalog/product/view/id/16/category/4',0,1,NULL,1,'{\"category_id\":\"4\"}'),(48,'product',17,'c-ng-d-nat.html','catalog/product/view/id/17',0,1,NULL,1,NULL),(49,'product',17,'lego/c-ng-d-nat.html','catalog/product/view/id/17/category/4',0,1,NULL,1,'{\"category_id\":\"4\"}'),(50,'product',18,'toa-thap-ch-c-tr-i.html','catalog/product/view/id/18',0,1,NULL,1,NULL),(51,'product',18,'lego/toa-thap-ch-c-tr-i.html','catalog/product/view/id/18/category/4',0,1,NULL,1,'{\"category_id\":\"4\"}'),(52,'product',19,'nha-cay-hi-n-d-i.html','catalog/product/view/id/19',0,1,NULL,1,NULL),(53,'product',19,'lego/nha-cay-hi-n-d-i.html','catalog/product/view/id/19/category/4',0,1,NULL,1,'{\"category_id\":\"4\"}'),(54,'product',20,'khu-r-ng-r-m-ma-quai.html','catalog/product/view/id/20',0,1,NULL,1,NULL),(55,'product',20,'lego/khu-r-ng-r-m-ma-quai.html','catalog/product/view/id/20/category/4',0,1,NULL,1,'{\"category_id\":\"4\"}'),(56,'product',21,'bup-be-lol-phien-b-n-confetti-b-a-ti-c-sinh-nh-t.html','catalog/product/view/id/21',0,1,NULL,1,NULL),(57,'product',21,'bup-be-th-i-trang/bup-be-lol-phien-b-n-confetti-b-a-ti-c-sinh-nh-t.html','catalog/product/view/id/21/category/5',0,1,NULL,1,'{\"category_id\":\"5\"}'),(58,'product',22,'co-nang-bup-be-th-i-trang-omg-sweets-ng-t-ngao.html','catalog/product/view/id/22',0,1,NULL,1,NULL),(59,'product',22,'bup-be-th-i-trang/co-nang-bup-be-th-i-trang-omg-sweets-ng-t-ngao.html','catalog/product/view/id/22/category/5',0,1,NULL,1,'{\"category_id\":\"5\"}'),(60,'product',23,'co-nang-bup-be-th-i-trang-omg-spicy-ca-tinh.html','catalog/product/view/id/23',0,1,NULL,1,NULL),(61,'product',23,'bup-be-th-i-trang/co-nang-bup-be-th-i-trang-omg-spicy-ca-tinh.html','catalog/product/view/id/23/category/5',0,1,NULL,1,'{\"category_id\":\"5\"}'),(62,'product',24,'co-nang-bup-be-th-i-trang-omg-sunshine-t-a-sang.html','catalog/product/view/id/24',0,1,NULL,1,NULL),(63,'product',24,'bup-be-th-i-trang/co-nang-bup-be-th-i-trang-omg-sunshine-t-a-sang.html','catalog/product/view/id/24/category/5',0,1,NULL,1,'{\"category_id\":\"5\"}'),(64,'product',25,'co-nang-bup-be-th-i-trang-omg-moon-light-m-ng-mo.html','catalog/product/view/id/25',0,1,NULL,1,NULL),(65,'product',25,'bup-be-th-i-trang/co-nang-bup-be-th-i-trang-omg-moon-light-m-ng-mo.html','catalog/product/view/id/25/category/5',0,1,NULL,1,'{\"category_id\":\"5\"}'),(66,'product',26,'cong-chua-ariel-d-i-mau-k-di-u.html','catalog/product/view/id/26',0,1,NULL,1,NULL),(67,'product',26,'bup-be-th-i-trang/cong-chua-ariel-d-i-mau-k-di-u.html','catalog/product/view/id/26/category/5',0,1,NULL,1,'{\"category_id\":\"5\"}'),(68,'product',27,'cong-chua-royal-shimmer-rapunzel.html','catalog/product/view/id/27',0,1,NULL,1,NULL),(69,'product',27,'bup-be-th-i-trang/cong-chua-royal-shimmer-rapunzel.html','catalog/product/view/id/27/category/5',0,1,NULL,1,'{\"category_id\":\"5\"}'),(70,'product',28,'cong-chua-rapunzel-v-i-mai-toc-dai-45cm.html','catalog/product/view/id/28',0,1,NULL,1,NULL),(71,'product',28,'bup-be-th-i-trang/cong-chua-rapunzel-v-i-mai-toc-dai-45cm.html','catalog/product/view/id/28/category/5',0,1,NULL,1,'{\"category_id\":\"5\"}'),(72,'product',29,'cong-chua-ariel-va-chi-c-vay-di-u-k.html','catalog/product/view/id/29',0,1,NULL,1,NULL),(73,'product',29,'bup-be-th-i-trang/cong-chua-ariel-va-chi-c-vay-di-u-k.html','catalog/product/view/id/29/category/5',0,1,NULL,1,'{\"category_id\":\"5\"}'),(74,'product',30,'bup-be-th-i-trang-rock-tee-skirt.html','catalog/product/view/id/30',0,1,NULL,1,NULL),(75,'product',30,'bup-be-th-i-trang/bup-be-th-i-trang-rock-tee-skirt.html','catalog/product/view/id/30/category/5',0,1,NULL,1,'{\"category_id\":\"5\"}'),(76,'product',31,'tr-ng-r-ng-huy-n-bi.html','catalog/product/view/id/31',0,1,NULL,1,NULL),(77,'product',31,'thu-bong/tr-ng-r-ng-huy-n-bi.html','catalog/product/view/id/31/category/6',0,1,NULL,1,'{\"category_id\":\"6\"}'),(78,'product',32,'pony-bong-30-cm-rainbow-dash.html','catalog/product/view/id/32',0,1,NULL,1,NULL),(79,'product',32,'thu-bong/pony-bong-30-cm-rainbow-dash.html','catalog/product/view/id/32/category/6',0,1,NULL,1,'{\"category_id\":\"6\"}'),(80,'product',33,'pony-bong-30-cm-spike.html','catalog/product/view/id/33',0,1,NULL,1,NULL),(81,'product',33,'thu-bong/pony-bong-30-cm-spike.html','catalog/product/view/id/33/category/6',0,1,NULL,1,'{\"category_id\":\"6\"}'),(82,'product',34,'pony-bong-30-cm-rainbow-dash-sea-pony.html','catalog/product/view/id/34',0,1,NULL,1,NULL),(83,'product',34,'thu-bong/pony-bong-30-cm-rainbow-dash-sea-pony.html','catalog/product/view/id/34/category/6',0,1,NULL,1,'{\"category_id\":\"6\"}'),(84,'product',35,'pony-bong-chi-n-binh-c-u-v-ng.html','catalog/product/view/id/35',0,1,NULL,1,NULL),(85,'product',35,'thu-bong/pony-bong-chi-n-binh-c-u-v-ng.html','catalog/product/view/id/35/category/6',0,1,NULL,1,'{\"category_id\":\"6\"}'),(86,'product',36,'pinkie-pie-v-i-mai-toc-suon-mu-t.html','catalog/product/view/id/36',0,1,NULL,1,NULL),(87,'product',36,'thu-bong/pinkie-pie-v-i-mai-toc-suon-mu-t.html','catalog/product/view/id/36/category/6',0,1,NULL,1,'{\"category_id\":\"6\"}'),(88,'product',37,'h-p-qua-present-pets-cho-d-m-nhanh-nh-n.html','catalog/product/view/id/37',0,1,NULL,1,NULL),(89,'product',37,'thu-bong/h-p-qua-present-pets-cho-d-m-nhanh-nh-n.html','catalog/product/view/id/37/category/6',0,1,NULL,1,'{\"category_id\":\"6\"}'),(90,'product',38,'h-p-qua-present-pets-yorkies-lem-l-nh.html','catalog/product/view/id/38',0,1,NULL,1,NULL),(91,'product',38,'thu-bong/h-p-qua-present-pets-yorkies-lem-l-nh.html','catalog/product/view/id/38/category/6',0,1,NULL,1,'{\"category_id\":\"6\"}'),(92,'product',39,'h-p-qua-present-pets-poodles-ng-t-ngao.html','catalog/product/view/id/39',0,1,NULL,1,NULL),(93,'product',39,'thu-bong/h-p-qua-present-pets-poodles-ng-t-ngao.html','catalog/product/view/id/39/category/6',0,1,NULL,1,'{\"category_id\":\"6\"}'),(94,'product',40,'h-p-qua-present-pets-cun-cung-beagle-dang-yeu.html','catalog/product/view/id/40',0,1,NULL,1,NULL),(95,'product',40,'thu-bong/h-p-qua-present-pets-cun-cung-beagle-dang-yeu.html','catalog/product/view/id/40/category/6',0,1,NULL,1,'{\"category_id\":\"6\"}'),(96,'product',41,'combo-b-t-n-n-mini-4-mau-b-pd-d-u-d-i.html','catalog/product/view/id/41',0,1,NULL,1,NULL),(97,'product',41,'d-choi-giao-d-c/combo-b-t-n-n-mini-4-mau-b-pd-d-u-d-i.html','catalog/product/view/id/41/category/7',0,1,NULL,1,'{\"category_id\":\"7\"}'),(98,'product',42,'combo-b-khuon-thu-cung-dang-yeu-va-b-t-n-n-6-mau-l-p-lanh.html','catalog/product/view/id/42',0,1,NULL,1,NULL),(99,'product',42,'d-choi-giao-d-c/combo-b-khuon-thu-cung-dang-yeu-va-b-t-n-n-6-mau-l-p-lanh.html','catalog/product/view/id/42/category/7',0,1,NULL,1,'{\"category_id\":\"7\"}'),(100,'product',43,'kham-pha-nui-l-a-nham-th-ch-cung-kh-ng-long-t-rex.html','catalog/product/view/id/43',0,1,NULL,1,NULL),(101,'product',43,'d-choi-giao-d-c/kham-pha-nui-l-a-nham-th-ch-cung-kh-ng-long-t-rex.html','catalog/product/view/id/43/category/7',0,1,NULL,1,'{\"category_id\":\"7\"}'),(102,'product',44,'kh-ng-long-t-rex-va-qu-tr-ng-bi-n.html','catalog/product/view/id/44',0,1,NULL,1,NULL),(103,'product',44,'d-choi-giao-d-c/kh-ng-long-t-rex-va-qu-tr-ng-bi-n.html','catalog/product/view/id/44/category/7',0,1,NULL,1,'{\"category_id\":\"7\"}'),(104,'product',45,'b-a-ti-c-bbq.html','catalog/product/view/id/45',0,1,NULL,1,NULL),(105,'product',45,'d-choi-giao-d-c/b-a-ti-c-bbq.html','catalog/product/view/id/45/category/7',0,1,NULL,1,'{\"category_id\":\"7\"}'),(106,'product',46,'ch-o-b-p-th-n-ki.html','catalog/product/view/id/46',0,1,NULL,1,NULL),(107,'product',46,'d-choi-giao-d-c/ch-o-b-p-th-n-ki.html','catalog/product/view/id/46/category/7',0,1,NULL,1,'{\"category_id\":\"7\"}'),(108,'product',47,'que-kem-7-mau.html','catalog/product/view/id/47',0,1,NULL,1,NULL),(109,'product',47,'d-choi-giao-d-c/que-kem-7-mau.html','catalog/product/view/id/47/category/7',0,1,NULL,1,'{\"category_id\":\"7\"}'),(110,'product',48,'d-choi-phong-banh-vui-nh-n.html','catalog/product/view/id/48',0,1,NULL,1,NULL),(111,'product',48,'d-choi-giao-d-c/d-choi-phong-banh-vui-nh-n.html','catalog/product/view/id/48/category/7',0,1,NULL,1,'{\"category_id\":\"7\"}'),(112,'product',49,'xe-c-u-thuong-da-nang.html','catalog/product/view/id/49',0,1,NULL,1,NULL),(113,'product',49,'d-choi-giao-d-c/xe-c-u-thuong-da-nang.html','catalog/product/view/id/49/category/7',0,1,NULL,1,'{\"category_id\":\"7\"}'),(114,'product',50,'b-a-ti-c-nh-c-nu-c-cau-v-t-mau-xanh.html','catalog/product/view/id/50',0,1,NULL,1,NULL),(115,'product',50,'d-choi-giao-d-c/b-a-ti-c-nh-c-nu-c-cau-v-t-mau-xanh.html','catalog/product/view/id/50/category/7',0,1,NULL,1,'{\"category_id\":\"7\"}');
/*!40000 ALTER TABLE `url_rewrite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variable` (
  `variable_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable ID',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `VARIABLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable`
--

LOCK TABLES `variable` WRITE;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variable_value`
--

DROP TABLE IF EXISTS `variable_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variable_value` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Value ID',
  `variable_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Variable ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `plain_value` text COMMENT 'Plain Text Value',
  `html_value` text COMMENT 'Html Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  KEY `VARIABLE_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `VARIABLE_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `VARIABLE_VALUE_VARIABLE_ID_VARIABLE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `variable` (`variable_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Variable Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable_value`
--

LOCK TABLES `variable_value` WRITE;
/*!40000 ALTER TABLE `variable_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `variable_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vault_payment_token`
--

DROP TABLE IF EXISTS `vault_payment_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vault_payment_token` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `public_hash` varchar(128) NOT NULL COMMENT 'Hash code for using on frontend',
  `payment_method_code` varchar(128) NOT NULL COMMENT 'Payment method code',
  `type` varchar(128) NOT NULL COMMENT 'Type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `expires_at` timestamp NULL DEFAULT NULL COMMENT 'Expires At',
  `gateway_token` varchar(255) NOT NULL COMMENT 'Gateway Token',
  `details` text COMMENT 'Details',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `VAULT_PAYMENT_TOKEN_PUBLIC_HASH` (`public_hash`),
  UNIQUE KEY `VAULT_PAYMENT_TOKEN_PAYMENT_METHOD_CODE_CSTR_ID_GATEWAY_TOKEN` (`payment_method_code`,`customer_id`,`gateway_token`),
  KEY `VAULT_PAYMENT_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`),
  CONSTRAINT `VAULT_PAYMENT_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Vault tokens of payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vault_payment_token`
--

LOCK TABLES `vault_payment_token` WRITE;
/*!40000 ALTER TABLE `vault_payment_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `vault_payment_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vault_payment_token_order_payment_link`
--

DROP TABLE IF EXISTS `vault_payment_token_order_payment_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vault_payment_token_order_payment_link` (
  `order_payment_id` int unsigned NOT NULL COMMENT 'Order payment ID',
  `payment_token_id` int unsigned NOT NULL COMMENT 'Payment token ID',
  PRIMARY KEY (`order_payment_id`,`payment_token_id`),
  KEY `FK_4ED894655446D385894580BECA993862` (`payment_token_id`),
  CONSTRAINT `FK_4ED894655446D385894580BECA993862` FOREIGN KEY (`payment_token_id`) REFERENCES `vault_payment_token` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CF37B9D854256534BE23C818F6291CA2` FOREIGN KEY (`order_payment_id`) REFERENCES `sales_order_payment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Order payments to vault token';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vault_payment_token_order_payment_link`
--

LOCK TABLES `vault_payment_token_order_payment_link` WRITE;
/*!40000 ALTER TABLE `vault_payment_token_order_payment_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `vault_payment_token_order_payment_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertex_commodity_code_order_item`
--

DROP TABLE IF EXISTS `vertex_commodity_code_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertex_commodity_code_order_item` (
  `order_item_id` int unsigned NOT NULL COMMENT 'Item ID',
  `code` varchar(255) DEFAULT NULL COMMENT 'Commodity Code',
  `type` varchar(255) DEFAULT NULL COMMENT 'Commodity Type',
  PRIMARY KEY (`order_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Vertex Commodity Code';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertex_commodity_code_order_item`
--

LOCK TABLES `vertex_commodity_code_order_item` WRITE;
/*!40000 ALTER TABLE `vertex_commodity_code_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertex_commodity_code_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertex_commodity_code_product`
--

DROP TABLE IF EXISTS `vertex_commodity_code_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertex_commodity_code_product` (
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `code` varchar(255) DEFAULT NULL COMMENT 'Commodity Code',
  `type` varchar(255) DEFAULT NULL COMMENT 'Commodity Type',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Vertex Commodity Code';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertex_commodity_code_product`
--

LOCK TABLES `vertex_commodity_code_product` WRITE;
/*!40000 ALTER TABLE `vertex_commodity_code_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertex_commodity_code_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertex_custom_option_flex_field`
--

DROP TABLE IF EXISTS `vertex_custom_option_flex_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertex_custom_option_flex_field` (
  `entity_id` int NOT NULL AUTO_INCREMENT COMMENT 'Map Entity ID',
  `option_id` int NOT NULL COMMENT 'Customizable Option ID',
  `website_id` int NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `flex_field` int DEFAULT '0' COMMENT 'Customizable Option to Flex Field Map',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `VERTEX_CUSTOM_OPTION_FLEX_FIELD_OPTION_ID_WEBSITE_ID` (`option_id`,`website_id`),
  KEY `VERTEX_CUSTOM_OPTION_FLEX_FIELD_OPTION_ID` (`option_id`),
  KEY `VERTEX_CUSTOM_OPTION_FLEX_FIELD_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customizable Option to Flex Field Map';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertex_custom_option_flex_field`
--

LOCK TABLES `vertex_custom_option_flex_field` WRITE;
/*!40000 ALTER TABLE `vertex_custom_option_flex_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertex_custom_option_flex_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertex_customer_code`
--

DROP TABLE IF EXISTS `vertex_customer_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertex_customer_code` (
  `customer_id` int unsigned NOT NULL COMMENT 'Customer ID',
  `customer_code` text COMMENT 'Customer Code for Vertex',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Code for Vertex';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertex_customer_code`
--

LOCK TABLES `vertex_customer_code` WRITE;
/*!40000 ALTER TABLE `vertex_customer_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertex_customer_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertex_customer_country`
--

DROP TABLE IF EXISTS `vertex_customer_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertex_customer_country` (
  `customer_id` int unsigned NOT NULL COMMENT 'Customer ID',
  `customer_country` varchar(255) DEFAULT NULL COMMENT 'Customer Country',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Country associated to Customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertex_customer_country`
--

LOCK TABLES `vertex_customer_country` WRITE;
/*!40000 ALTER TABLE `vertex_customer_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertex_customer_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertex_invoice_sent`
--

DROP TABLE IF EXISTS `vertex_invoice_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertex_invoice_sent` (
  `invoice_id` int unsigned NOT NULL COMMENT 'Invoice ID',
  `sent_to_vertex` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Invoice has been logged in Vertex',
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertex_invoice_sent`
--

LOCK TABLES `vertex_invoice_sent` WRITE;
/*!40000 ALTER TABLE `vertex_invoice_sent` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertex_invoice_sent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertex_order_invoice_status`
--

DROP TABLE IF EXISTS `vertex_order_invoice_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertex_order_invoice_status` (
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `sent_to_vertex` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Invoice has been logged in Vertex',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Invoice has been logged in Vertex';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertex_order_invoice_status`
--

LOCK TABLES `vertex_order_invoice_status` WRITE;
/*!40000 ALTER TABLE `vertex_order_invoice_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertex_order_invoice_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertex_sales_creditmemo_item_invoice_text_code`
--

DROP TABLE IF EXISTS `vertex_sales_creditmemo_item_invoice_text_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertex_sales_creditmemo_item_invoice_text_code` (
  `item_id` int NOT NULL COMMENT 'Creditmemo Item ID',
  `invoice_text_code` varchar(100) NOT NULL COMMENT 'Invoice text code from Vertex',
  UNIQUE KEY `UNQ_4BC40DA748D7713ADA661D2DE1BCF161` (`item_id`,`invoice_text_code`),
  KEY `VERTEX_SALES_CREDITMEMO_ITEM_INVOICE_TEXT_CODE_ITEM_ID` (`item_id`),
  KEY `VERTEX_SALES_CREDITMEMO_ITEM_INVOICE_TEXT_CODE_INVOICE_TEXT_CODE` (`invoice_text_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Creditmemo text code from Vertex';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertex_sales_creditmemo_item_invoice_text_code`
--

LOCK TABLES `vertex_sales_creditmemo_item_invoice_text_code` WRITE;
/*!40000 ALTER TABLE `vertex_sales_creditmemo_item_invoice_text_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertex_sales_creditmemo_item_invoice_text_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertex_sales_creditmemo_item_tax_code`
--

DROP TABLE IF EXISTS `vertex_sales_creditmemo_item_tax_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertex_sales_creditmemo_item_tax_code` (
  `item_id` int NOT NULL COMMENT 'Creditmemo Item ID',
  `tax_code` varchar(100) NOT NULL COMMENT 'Invoice text code from Vertex',
  UNIQUE KEY `VERTEX_SALES_CREDITMEMO_ITEM_TAX_CODE_ITEM_ID_TAX_CODE` (`item_id`,`tax_code`),
  KEY `VERTEX_SALES_CREDITMEMO_ITEM_TAX_CODE_ITEM_ID` (`item_id`),
  KEY `VERTEX_SALES_CREDITMEMO_ITEM_TAX_CODE_TAX_CODE` (`tax_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Creditmemo tax code from Vertex';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertex_sales_creditmemo_item_tax_code`
--

LOCK TABLES `vertex_sales_creditmemo_item_tax_code` WRITE;
/*!40000 ALTER TABLE `vertex_sales_creditmemo_item_tax_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertex_sales_creditmemo_item_tax_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertex_sales_creditmemo_item_vertex_tax_code`
--

DROP TABLE IF EXISTS `vertex_sales_creditmemo_item_vertex_tax_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertex_sales_creditmemo_item_vertex_tax_code` (
  `item_id` int NOT NULL COMMENT 'Creditmemo Item ID',
  `vertex_tax_code` varchar(100) NOT NULL COMMENT 'Invoice text code from Vertex',
  UNIQUE KEY `UNQ_31D7AADB3412BC7E7C1C98D5CC3A5D46` (`item_id`,`vertex_tax_code`),
  KEY `VERTEX_SALES_CREDITMEMO_ITEM_VERTEX_TAX_CODE_ITEM_ID` (`item_id`),
  KEY `VERTEX_SALES_CREDITMEMO_ITEM_VERTEX_TAX_CODE_VERTEX_TAX_CODE` (`vertex_tax_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Creditmemo vertex tax code from Vertex';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertex_sales_creditmemo_item_vertex_tax_code`
--

LOCK TABLES `vertex_sales_creditmemo_item_vertex_tax_code` WRITE;
/*!40000 ALTER TABLE `vertex_sales_creditmemo_item_vertex_tax_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertex_sales_creditmemo_item_vertex_tax_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertex_sales_order_item_invoice_text_code`
--

DROP TABLE IF EXISTS `vertex_sales_order_item_invoice_text_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertex_sales_order_item_invoice_text_code` (
  `item_id` int unsigned NOT NULL COMMENT 'Order ID',
  `invoice_text_code` varchar(100) NOT NULL COMMENT 'Invoice text code from Vertex',
  UNIQUE KEY `UNQ_96F6BE3160A4185CEA4D866018EAF6DC` (`item_id`,`invoice_text_code`),
  KEY `VERTEX_SALES_ORDER_ITEM_INVOICE_TEXT_CODE_ITEM_ID` (`item_id`),
  KEY `VERTEX_SALES_ORDER_ITEM_INVOICE_TEXT_CODE_INVOICE_TEXT_CODE` (`invoice_text_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Invoice text code from Vertex';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertex_sales_order_item_invoice_text_code`
--

LOCK TABLES `vertex_sales_order_item_invoice_text_code` WRITE;
/*!40000 ALTER TABLE `vertex_sales_order_item_invoice_text_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertex_sales_order_item_invoice_text_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertex_sales_order_item_tax_code`
--

DROP TABLE IF EXISTS `vertex_sales_order_item_tax_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertex_sales_order_item_tax_code` (
  `item_id` int NOT NULL COMMENT 'Creditmemo Item ID',
  `tax_code` varchar(100) NOT NULL COMMENT 'Invoice text code from Vertex',
  UNIQUE KEY `VERTEX_SALES_ORDER_ITEM_TAX_CODE_ITEM_ID_TAX_CODE` (`item_id`,`tax_code`),
  KEY `VERTEX_SALES_ORDER_ITEM_TAX_CODE_ITEM_ID` (`item_id`),
  KEY `VERTEX_SALES_ORDER_ITEM_TAX_CODE_TAX_CODE` (`tax_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Invoice tax code from Vertex';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertex_sales_order_item_tax_code`
--

LOCK TABLES `vertex_sales_order_item_tax_code` WRITE;
/*!40000 ALTER TABLE `vertex_sales_order_item_tax_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertex_sales_order_item_tax_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertex_sales_order_item_vertex_tax_code`
--

DROP TABLE IF EXISTS `vertex_sales_order_item_vertex_tax_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertex_sales_order_item_vertex_tax_code` (
  `item_id` int NOT NULL COMMENT 'Creditmemo Item ID',
  `vertex_tax_code` varchar(100) NOT NULL COMMENT 'Invoice text code from Vertex',
  UNIQUE KEY `VERTEX_SALES_ORDER_ITEM_VERTEX_TAX_CODE_ITEM_ID_VERTEX_TAX_CODE` (`item_id`,`vertex_tax_code`),
  KEY `VERTEX_SALES_ORDER_ITEM_VERTEX_TAX_CODE_ITEM_ID` (`item_id`),
  KEY `VERTEX_SALES_ORDER_ITEM_VERTEX_TAX_CODE_VERTEX_TAX_CODE` (`vertex_tax_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Invoice Vertex tax code from Vertex';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertex_sales_order_item_vertex_tax_code`
--

LOCK TABLES `vertex_sales_order_item_vertex_tax_code` WRITE;
/*!40000 ALTER TABLE `vertex_sales_order_item_vertex_tax_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertex_sales_order_item_vertex_tax_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertex_taxrequest`
--

DROP TABLE IF EXISTS `vertex_taxrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertex_taxrequest` (
  `request_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Request Id',
  `request_type` varchar(255) NOT NULL COMMENT 'Request type',
  `quote_id` bigint NOT NULL COMMENT 'Quote Id',
  `order_id` bigint NOT NULL COMMENT 'Order Id',
  `total_tax` varchar(255) NOT NULL COMMENT 'Total Tax Amount',
  `source_path` varchar(255) NOT NULL COMMENT 'Source path controller_module_action',
  `tax_area_id` varchar(255) NOT NULL COMMENT 'Tax Jurisdictions Id',
  `sub_total` varchar(255) NOT NULL COMMENT 'Response Subtotal Amount',
  `total` varchar(255) NOT NULL COMMENT 'Response Total Amount',
  `lookup_result` varchar(255) NOT NULL COMMENT 'Tax Area Response Lookup Result',
  `request_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Request create date',
  `request_xml` text NOT NULL COMMENT 'Request XML',
  `response_xml` text NOT NULL COMMENT 'Response XML',
  `response_time` int unsigned NOT NULL COMMENT 'Milliseconds taken for Vertex API call to complete',
  `module_name` varchar(255) NOT NULL COMMENT 'Request module name',
  `module_version` varchar(255) NOT NULL COMMENT 'Request module version',
  PRIMARY KEY (`request_id`),
  UNIQUE KEY `VERTEX_TAXREQUEST_REQUEST_ID` (`request_id`),
  KEY `VERTEX_TAXREQUEST_REQUEST_TYPE` (`request_type`),
  KEY `VERTEX_TAXREQUEST_ORDER_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='The tax request table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertex_taxrequest`
--

LOCK TABLES `vertex_taxrequest` WRITE;
/*!40000 ALTER TABLE `vertex_taxrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertex_taxrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertex_vat_country_code`
--

DROP TABLE IF EXISTS `vertex_vat_country_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vertex_vat_country_code` (
  `address_id` int unsigned NOT NULL COMMENT 'Address ID',
  `customer_country` varchar(255) DEFAULT NULL COMMENT 'Customer Country',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Vat Country code associated to Order Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertex_vat_country_code`
--

LOCK TABLES `vertex_vat_country_code` WRITE;
/*!40000 ALTER TABLE `vertex_vat_country_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `vertex_vat_country_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weee_tax`
--

DROP TABLE IF EXISTS `weee_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weee_tax` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `state` int NOT NULL DEFAULT '0' COMMENT 'State',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  PRIMARY KEY (`value_id`),
  KEY `WEEE_TAX_WEBSITE_ID` (`website_id`),
  KEY `WEEE_TAX_ENTITY_ID` (`entity_id`),
  KEY `WEEE_TAX_COUNTRY` (`country`),
  KEY `WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `WEEE_TAX_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `WEEE_TAX_COUNTRY_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `directory_country` (`country_id`) ON DELETE CASCADE,
  CONSTRAINT `WEEE_TAX_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `WEEE_TAX_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Weee Tax';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weee_tax`
--

LOCK TABLES `weee_tax` WRITE;
/*!40000 ALTER TABLE `weee_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `weee_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget` (
  `widget_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Widget ID',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text COMMENT 'Parameters',
  PRIMARY KEY (`widget_id`),
  KEY `WIDGET_WIDGET_CODE` (`widget_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Preconfigured Widgets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--

LOCK TABLES `widget` WRITE;
/*!40000 ALTER TABLE `widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_instance`
--

DROP TABLE IF EXISTS `widget_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget_instance` (
  `instance_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Instance ID',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `theme_id` int unsigned NOT NULL COMMENT 'Theme ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text COMMENT 'Widget parameters',
  `sort_order` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  PRIMARY KEY (`instance_id`),
  KEY `WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Instances of Widget for Package Theme';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_instance`
--

LOCK TABLES `widget_instance` WRITE;
/*!40000 ALTER TABLE `widget_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_instance_page`
--

DROP TABLE IF EXISTS `widget_instance_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget_instance_page` (
  `page_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Page ID',
  `instance_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Instance ID',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Container',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template',
  PRIMARY KEY (`page_id`),
  KEY `WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`),
  CONSTRAINT `WIDGET_INSTANCE_PAGE_INSTANCE_ID_WIDGET_INSTANCE_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `widget_instance` (`instance_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Instance of Widget on Page';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_instance_page`
--

LOCK TABLES `widget_instance_page` WRITE;
/*!40000 ALTER TABLE `widget_instance_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_instance_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_instance_page_layout`
--

DROP TABLE IF EXISTS `widget_instance_page_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget_instance_page_layout` (
  `page_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Page ID',
  `layout_update_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update ID',
  PRIMARY KEY (`layout_update_id`,`page_id`),
  KEY `WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`),
  CONSTRAINT `WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID_WIDGET_INSTANCE_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `widget_instance_page` (`page_id`) ON DELETE CASCADE,
  CONSTRAINT `WIDGET_INSTANCE_PAGE_LYT_LYT_UPDATE_ID_LYT_UPDATE_LYT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `layout_update` (`layout_update_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Layout updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_instance_page_layout`
--

LOCK TABLES `widget_instance_page_layout` WRITE;
/*!40000 ALTER TABLE `widget_instance_page_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_instance_page_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `wishlist_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `customer_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `shared` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date',
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `WISHLIST_SHARED` (`shared`),
  CONSTRAINT `WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Wishlist main Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_item`
--

DROP TABLE IF EXISTS `wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_item` (
  `wishlist_item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID',
  `wishlist_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Wishlist ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty',
  PRIMARY KEY (`wishlist_item_id`),
  KEY `WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  KEY `WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  KEY `WISHLIST_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `WISHLIST_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `WISHLIST_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `WISHLIST_ITEM_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Wishlist items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_item`
--

LOCK TABLES `wishlist_item` WRITE;
/*!40000 ALTER TABLE `wishlist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_item_option`
--

DROP TABLE IF EXISTS `wishlist_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_item_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `wishlist_item_id` int unsigned NOT NULL COMMENT 'Wishlist Item ID',
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `FK_A014B30B04B72DD0EAB3EECD779728D6` (`wishlist_item_id`),
  CONSTRAINT `FK_A014B30B04B72DD0EAB3EECD779728D6` FOREIGN KEY (`wishlist_item_id`) REFERENCES `wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Wishlist Item Option Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_item_option`
--

LOCK TABLES `wishlist_item_option` WRITE;
/*!40000 ALTER TABLE `wishlist_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yotpo_order_status_history`
--

DROP TABLE IF EXISTS `yotpo_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yotpo_order_status_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `order_id` int unsigned DEFAULT NULL COMMENT 'Order Id',
  `store_id` int unsigned DEFAULT NULL COMMENT 'Store Id',
  `old_status` varchar(32) DEFAULT NULL COMMENT 'Old Status',
  `new_status` varchar(32) DEFAULT NULL COMMENT 'New Status',
  `created_at` datetime DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='yotpo_order_status_history';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yotpo_order_status_history`
--

LOCK TABLES `yotpo_order_status_history` WRITE;
/*!40000 ALTER TABLE `yotpo_order_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `yotpo_order_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yotpo_rich_snippets`
--

DROP TABLE IF EXISTS `yotpo_rich_snippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yotpo_rich_snippets` (
  `rich_snippet_id` int NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `product_id` int NOT NULL COMMENT 'Product Id',
  `store_id` int NOT NULL COMMENT 'Store Id',
  `average_score` decimal(10,2) NOT NULL COMMENT 'Average Score',
  `reviews_count` float(10,0) NOT NULL COMMENT 'Reviews Count',
  `expiration_time` timestamp NOT NULL COMMENT 'Expiry Time',
  PRIMARY KEY (`rich_snippet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='yotpo_rich_snippets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yotpo_rich_snippets`
--

LOCK TABLES `yotpo_rich_snippets` WRITE;
/*!40000 ALTER TABLE `yotpo_rich_snippets` DISABLE KEYS */;
/*!40000 ALTER TABLE `yotpo_rich_snippets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yotpo_sync`
--

DROP TABLE IF EXISTS `yotpo_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yotpo_sync` (
  `sync_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `store_id` int unsigned DEFAULT NULL COMMENT 'Store Id',
  `entity_type` varchar(50) DEFAULT NULL COMMENT 'Entity Type',
  `entity_id` int unsigned DEFAULT NULL COMMENT 'Entity Id',
  `sync_flag` smallint DEFAULT '0' COMMENT 'Sync Flag',
  `sync_date` datetime NOT NULL COMMENT 'Sync Date',
  PRIMARY KEY (`sync_id`),
  UNIQUE KEY `YOTPO_SYNC_STORE_ID_ENTITY_TYPE_ENTITY_ID` (`store_id`,`entity_type`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='yotpo_sync';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yotpo_sync`
--

LOCK TABLES `yotpo_sync` WRITE;
/*!40000 ALTER TABLE `yotpo_sync` DISABLE KEYS */;
/*!40000 ALTER TABLE `yotpo_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `inventory_stock_1`
--

/*!50001 DROP VIEW IF EXISTS `inventory_stock_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`magento`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `inventory_stock_1` AS select distinct `legacy_stock_status`.`product_id` AS `product_id`,`legacy_stock_status`.`website_id` AS `website_id`,`legacy_stock_status`.`stock_id` AS `stock_id`,`legacy_stock_status`.`qty` AS `quantity`,`legacy_stock_status`.`stock_status` AS `is_salable`,`product`.`sku` AS `sku` from (`cataloginventory_stock_status` `legacy_stock_status` join `catalog_product_entity` `product` on((`legacy_stock_status`.`product_id` = `product`.`entity_id`))) */;
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

-- Dump completed on 2021-12-27 14:31:03
