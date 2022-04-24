-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for Linux (aarch64)
--
-- Host: mysql    Database: project
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fejymshufboncvkdqlkttprdekoschrwltpp` (`ownerId`),
  CONSTRAINT `fk_bjgezvreaanmbooauppxmoikweccvschrbfe` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fejymshufboncvkdqlkttprdekoschrwltpp` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fwetktjnaaspjhacdttqljuqhjrruwfnkxxz` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_asicjvsrlvebnccvgsgxuvmbrvffvdevvkwr` (`dateRead`),
  KEY `fk_nzaysijvmglrhhbwtpfymbvycoqhbuylzvqp` (`pluginId`),
  CONSTRAINT `fk_duqfnoxcgajcnsbwszenxvrujgbncfuowamh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nzaysijvmglrhhbwtpfymbvycoqhbuylzvqp` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assetindexdata_sessionId_volumeId_idx` (`volumeId`),
  KEY `assetindexdata_volumeId_idx` (`volumeId`),
  KEY `fk_mmlnihwnhhjdocifqnuesclhkgdqglvuclgq` (`sessionId`),
  CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mmlnihwnhhjdocifqnuesclhkgdqglvuclgq` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  KEY `assets_folderId_idx` (`folderId`),
  KEY `assets_volumeId_idx` (`volumeId`),
  KEY `assets_uploaderId_fk` (`uploaderId`),
  CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar_calendar_sites`
--

DROP TABLE IF EXISTS `calendar_calendar_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_calendar_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calendarId` int DEFAULT NULL,
  `siteId` int DEFAULT NULL,
  `enabledByDefault` tinyint(1) DEFAULT '1',
  `hasUrls` tinyint(1) DEFAULT '0',
  `uriFormat` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_calendar_sites_calendarId_siteId_unq_idx` (`calendarId`,`siteId`),
  KEY `calendar_calendar_sites_siteId_fk` (`siteId`),
  CONSTRAINT `calendar_calendar_sites_calendarId_fk` FOREIGN KEY (`calendarId`) REFERENCES `calendar_calendars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `calendar_calendar_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar_calendars`
--

DROP TABLE IF EXISTS `calendar_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_calendars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `handle` varchar(100) NOT NULL,
  `description` text,
  `color` varchar(10) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `titleLabel` varchar(255) DEFAULT 'Title',
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `descriptionFieldHandle` varchar(255) DEFAULT NULL,
  `locationFieldHandle` varchar(255) DEFAULT NULL,
  `icsHash` varchar(255) DEFAULT NULL,
  `icsTimezone` varchar(255) DEFAULT NULL,
  `allowRepeatingEvents` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`),
  UNIQUE KEY `calendar_calendars_name_unq_idx` (`name`),
  UNIQUE KEY `calendar_calendars_handle_unq_idx` (`handle`),
  UNIQUE KEY `calendar_calendars_icsHash_unq_idx` (`icsHash`),
  KEY `calendar_calendars_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `calendar_calendars_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar_events`
--

DROP TABLE IF EXISTS `calendar_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_events` (
  `internalId` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `calendarId` int DEFAULT NULL,
  `authorId` int DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `allDay` tinyint(1) DEFAULT NULL,
  `rrule` varchar(255) DEFAULT NULL,
  `freq` varchar(255) DEFAULT NULL,
  `interval` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  `until` datetime DEFAULT NULL,
  `byMonth` varchar(255) DEFAULT NULL,
  `byYearDay` varchar(255) DEFAULT NULL,
  `byMonthDay` varchar(255) DEFAULT NULL,
  `byDay` varchar(255) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`internalId`),
  UNIQUE KEY `calendar_events_id_unq_idx` (`id`),
  KEY `calendar_events_postDate_idx` (`postDate`),
  KEY `calendar_events_calendarId_idx` (`calendarId`),
  KEY `calendar_events_authorId_idx` (`authorId`),
  KEY `calendar_events_startDate_idx` (`startDate`),
  KEY `calendar_events_endDate_idx` (`endDate`),
  KEY `calendar_events_startDate_endDate_idx` (`startDate`,`endDate`),
  KEY `calendar_events_until_idx` (`until`),
  CONSTRAINT `calendar_events_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `calendar_events_calendarId_fk` FOREIGN KEY (`calendarId`) REFERENCES `calendar_calendars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `calendar_events_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar_exceptions`
--

DROP TABLE IF EXISTS `calendar_exceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_exceptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `eventId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `calendar_exceptions_exceptions_eventId_date_idx` (`eventId`,`date`),
  CONSTRAINT `calendar_exceptions_eventId_fk` FOREIGN KEY (`eventId`) REFERENCES `calendar_events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar_select_dates`
--

DROP TABLE IF EXISTS `calendar_select_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_select_dates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `eventId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `calendar_select_dates_select_dates_eventId_date_idx` (`eventId`,`date`),
  CONSTRAINT `calendar_select_dates_eventId_fk` FOREIGN KEY (`eventId`) REFERENCES `calendar_events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_groupId_idx` (`groupId`),
  KEY `categories_parentId_fk` (`parentId`),
  CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categorygroups_name_idx` (`name`),
  KEY `categorygroups_handle_idx` (`handle`),
  KEY `categorygroups_structureId_idx` (`structureId`),
  KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `categorygroups_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedattributes_siteId_fk` (`siteId`),
  KEY `changedattributes_userId_fk` (`userId`),
  CONSTRAINT `changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedfields_siteId_fk` (`siteId`),
  KEY `changedfields_fieldId_fk` (`fieldId`),
  KEY `changedfields_userId_fk` (`userId`),
  CONSTRAINT `changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_addresses`
--

DROP TABLE IF EXISTS `commerce_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `countryId` int DEFAULT NULL,
  `stateId` int DEFAULT NULL,
  `isStoreLocation` tinyint(1) NOT NULL DEFAULT '0',
  `attention` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `alternativePhone` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `notes` text,
  `businessName` varchar(255) DEFAULT NULL,
  `businessTaxId` varchar(255) DEFAULT NULL,
  `businessId` varchar(255) DEFAULT NULL,
  `stateName` varchar(255) DEFAULT NULL,
  `custom1` varchar(255) DEFAULT NULL,
  `custom2` varchar(255) DEFAULT NULL,
  `custom3` varchar(255) DEFAULT NULL,
  `custom4` varchar(255) DEFAULT NULL,
  `isEstimated` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tfteafobwxqdriixzgmrylwnpnaamzwfrjjd` (`countryId`),
  KEY `idx_keyhibwscvitxamfmigjmyhmcosuocqrlrhb` (`stateId`),
  KEY `idx_tjrkapgbgdurueuhghlvztodnqcjengtxnqp` (`isStoreLocation`),
  CONSTRAINT `fk_nrzlkjyqsyzznuweuornyxshhaxeisgvgzeb` FOREIGN KEY (`stateId`) REFERENCES `commerce_states` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pmzbgmvigidskppkpvvuhfephpxpcuxyhinl` FOREIGN KEY (`countryId`) REFERENCES `commerce_countries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_countries`
--

DROP TABLE IF EXISTS `commerce_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `iso` varchar(2) NOT NULL,
  `isStateRequired` tinyint(1) DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ybrywppncxxpysixukmwyjqjsahcxniakaby` (`name`),
  UNIQUE KEY `idx_nsagonuonzvxjyvemtrobtjathsuqggvbszq` (`iso`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_customer_discountuses`
--

DROP TABLE IF EXISTS `commerce_customer_discountuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_customer_discountuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discountId` int NOT NULL,
  `customerId` int NOT NULL,
  `uses` int unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xxirsmofnddeknbjcmqixgoowrfgsobkuhdx` (`customerId`,`discountId`),
  KEY `idx_sfknqzhusiosljbqnoxcpwifaqoexcziufyx` (`discountId`),
  CONSTRAINT `fk_brdlncpgontqmksmaaegzcjpjuyymlxfhvzj` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kdbiqhykeoomfdywbfwrxtxuroyzaftwvcuj` FOREIGN KEY (`customerId`) REFERENCES `commerce_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_customers`
--

DROP TABLE IF EXISTS `commerce_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `primaryBillingAddressId` int DEFAULT NULL,
  `primaryShippingAddressId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vwvtcdjntxgjjrqpoixlurmokbtuxarcqrza` (`userId`),
  KEY `idx_hccbezfubxoenngzawanxokiepizmxbsgiep` (`primaryBillingAddressId`),
  KEY `idx_dlittghypfpshwosvoifuhnmgucragzwbgfw` (`primaryShippingAddressId`),
  CONSTRAINT `fk_mwxoxwocervrxeworbvswsdlccrtzabdnvzx` FOREIGN KEY (`primaryShippingAddressId`) REFERENCES `commerce_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vkcvhtrpelvkjnlccebhustppgmkypvplqrw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yttiikuygnazdaputnyiiiehmimkbotxbylc` FOREIGN KEY (`primaryBillingAddressId`) REFERENCES `commerce_addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_customers_addresses`
--

DROP TABLE IF EXISTS `commerce_customers_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_customers_addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `addressId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zwfnkwvzdnqwrwgbvjjowgfsbvqmdkgnhtgg` (`customerId`,`addressId`),
  KEY `fk_tejwvlsohsgkvkxexnlnxgbiwtkomcqkcvdz` (`addressId`),
  CONSTRAINT `fk_frrfjdlsixorwfmsmhkahffwvhldpzrazvcp` FOREIGN KEY (`customerId`) REFERENCES `commerce_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tejwvlsohsgkvkxexnlnxgbiwtkomcqkcvdz` FOREIGN KEY (`addressId`) REFERENCES `commerce_addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_discount_categories`
--

DROP TABLE IF EXISTS `commerce_discount_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_discount_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discountId` int NOT NULL,
  `categoryId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_eylupwtawvdrzibkdxbkdagvdztfczkejaew` (`discountId`,`categoryId`),
  KEY `idx_gygdmmdpfwndczwvbvyflmbgcogemvakrsyv` (`categoryId`),
  CONSTRAINT `fk_wosplisoipqxqleaocabwbapqzqbzffjwsxw` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xjjuzxnwxoyfyqgrcsnhidnhqivwhitfokfe` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_discount_purchasables`
--

DROP TABLE IF EXISTS `commerce_discount_purchasables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_discount_purchasables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discountId` int NOT NULL,
  `purchasableId` int NOT NULL,
  `purchasableType` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xrsqwzetheumyvpqmucinwyuyorlapeymiyw` (`discountId`,`purchasableId`),
  KEY `idx_estzamjtfpaakdrzyjnvfwrlhxcziikjnppj` (`purchasableId`),
  CONSTRAINT `fk_bgojgrqznhqfshqrdhvmikobueftbynqlikg` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cbhlleaakybhcqlprgcosseevzczvpaxxcdd` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_discount_usergroups`
--

DROP TABLE IF EXISTS `commerce_discount_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_discount_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discountId` int NOT NULL,
  `userGroupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_reronkkckwajrjubmngilwepzqoxgcwokoyi` (`discountId`,`userGroupId`),
  KEY `idx_linivkrabazpwrdbevdyrhfhkzojjbylnhin` (`userGroupId`),
  CONSTRAINT `fk_ejvkihzpdybadnizidfpianvwyvjrtalpgcr` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wajmjhzvosnvwfmfbsxnlcxfwjkfpyoimhhl` FOREIGN KEY (`userGroupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_discounts`
--

DROP TABLE IF EXISTS `commerce_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_discounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `code` varchar(255) DEFAULT NULL,
  `perUserLimit` int unsigned NOT NULL DEFAULT '0',
  `perEmailLimit` int unsigned NOT NULL DEFAULT '0',
  `totalDiscountUses` int unsigned NOT NULL DEFAULT '0',
  `totalDiscountUseLimit` int unsigned NOT NULL DEFAULT '0',
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `purchaseTotal` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `purchaseQty` int NOT NULL DEFAULT '0',
  `maxPurchaseQty` int NOT NULL DEFAULT '0',
  `baseDiscount` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `baseDiscountType` enum('value','percentTotal','percentTotalDiscounted','percentItems','percentItemsDiscounted') NOT NULL DEFAULT 'value',
  `perItemDiscount` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `percentDiscount` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `percentageOffSubject` enum('original','discounted') NOT NULL,
  `excludeOnSale` tinyint(1) DEFAULT NULL,
  `hasFreeShippingForMatchingItems` tinyint(1) DEFAULT NULL,
  `hasFreeShippingForOrder` tinyint(1) DEFAULT NULL,
  `allPurchasables` tinyint(1) DEFAULT NULL,
  `allCategories` tinyint(1) DEFAULT NULL,
  `appliedTo` enum('matchingLineItems','allLineItems') NOT NULL DEFAULT 'matchingLineItems',
  `categoryRelationshipType` enum('element','sourceElement','targetElement') NOT NULL DEFAULT 'element',
  `orderConditionFormula` text,
  `enabled` tinyint(1) DEFAULT NULL,
  `stopProcessing` tinyint(1) DEFAULT NULL,
  `ignoreSales` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `userGroupsCondition` varchar(255) DEFAULT 'userGroupsAnyOrNone',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jbsniuyholpgdylbqsiyqjjtnizcevaphtbd` (`code`),
  KEY `idx_ftzktmjhnhcmeycezwqlsmwbusxvlxkraqxc` (`dateFrom`),
  KEY `idx_exvobdyficshxlqheekaegpvzixxvxdntbnm` (`dateTo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_donations`
--

DROP TABLE IF EXISTS `commerce_donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_donations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) NOT NULL,
  `availableForPurchase` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_daisrdihbgoaspxrfrtcdvffrxqpohbzleun` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_email_discountuses`
--

DROP TABLE IF EXISTS `commerce_email_discountuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_email_discountuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discountId` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `uses` int unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ktrwfkokyxclurjufwbfnubhrpnlmrtuqznn` (`email`,`discountId`),
  KEY `idx_lbudoeoylejnmrxavzjmadadalhyxlczyuck` (`discountId`),
  CONSTRAINT `fk_uhcwjasjqokongfrhyyvhtsrjkybyvilhtuo` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_emails`
--

DROP TABLE IF EXISTS `commerce_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `recipientType` enum('customer','custom') DEFAULT 'custom',
  `to` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `templatePath` varchar(255) NOT NULL,
  `plainTextTemplatePath` varchar(255) DEFAULT NULL,
  `pdfId` int DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_kgckjmgnqlkdunlpqddxmoqncunxhnmbjcxy` (`pdfId`),
  CONSTRAINT `fk_kgckjmgnqlkdunlpqddxmoqncunxhnmbjcxy` FOREIGN KEY (`pdfId`) REFERENCES `commerce_pdfs` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_gateways`
--

DROP TABLE IF EXISTS `commerce_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_gateways` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `settings` text,
  `paymentType` enum('authorize','purchase') NOT NULL DEFAULT 'purchase',
  `isFrontendEnabled` tinyint(1) DEFAULT NULL,
  `isArchived` tinyint(1) DEFAULT NULL,
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_megligqmclimrarxoriuidbdkwjxyqisfrrt` (`handle`),
  KEY `idx_wcczewnmhqbjkrsoelckdolswzqbskjbvqdh` (`isArchived`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_lineitems`
--

DROP TABLE IF EXISTS `commerce_lineitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_lineitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `purchasableId` int DEFAULT NULL,
  `taxCategoryId` int NOT NULL,
  `shippingCategoryId` int NOT NULL,
  `description` text,
  `options` text,
  `optionsSignature` varchar(255) NOT NULL,
  `price` decimal(14,4) unsigned NOT NULL,
  `saleAmount` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `salePrice` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `sku` varchar(255) DEFAULT NULL,
  `weight` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `height` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `length` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `width` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `subtotal` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `total` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `qty` int unsigned NOT NULL,
  `note` text,
  `privateNote` text,
  `snapshot` longtext,
  `lineItemStatusId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wnppqbckcfzburzrffptfpljdasujnmcbpaa` (`orderId`,`purchasableId`,`optionsSignature`),
  KEY `idx_lefzvtqzccizhogfzbpnsmdurbrdwgcydwbr` (`purchasableId`),
  KEY `idx_vizhutcwrtvdnzusvtselphfvaxgxoetjkkx` (`taxCategoryId`),
  KEY `idx_pvclkbxteoauzezlqzkasonjgrwrlgofzylh` (`shippingCategoryId`),
  CONSTRAINT `fk_abwhabsuftnqghugxuzxgtoyvyqiegqpwmvz` FOREIGN KEY (`purchasableId`) REFERENCES `elements` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_qqywxgcswjldqpokesuahggktwdwskehmcgx` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rwgnppghopbxddhkehlnysrszcyguuqtslta` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_xsqkodzrwpdylcionmzbsqdvctcemfwyjrff` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_lineitemstatuses`
--

DROP TABLE IF EXISTS `commerce_lineitemstatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_lineitemstatuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') NOT NULL DEFAULT 'green',
  `isArchived` tinyint(1) NOT NULL DEFAULT '0',
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderadjustments`
--

DROP TABLE IF EXISTS `commerce_orderadjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orderadjustments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `lineItemId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(14,4) NOT NULL,
  `included` tinyint(1) DEFAULT NULL,
  `isEstimated` tinyint(1) NOT NULL DEFAULT '0',
  `sourceSnapshot` longtext,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tlbumtmqavbygzmwufixhohenuojavqkdkqx` (`orderId`),
  CONSTRAINT `fk_ablanritntojmgmtryzqlnyksqonefkbibdq` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderhistories`
--

DROP TABLE IF EXISTS `commerce_orderhistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orderhistories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `customerId` int NOT NULL,
  `prevStatusId` int DEFAULT NULL,
  `newStatusId` int DEFAULT NULL,
  `message` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_awthiznswemttpitgvzocmiclrxegaueunya` (`orderId`),
  KEY `idx_gmkvxygudpkpcrhdtgwsfsheazdssbnughqp` (`prevStatusId`),
  KEY `idx_uvxefcariyejibtejymrauzzvglqoaaiahhn` (`newStatusId`),
  KEY `idx_xwiduocdfuloqpyhyvancswowyyhagipxfyy` (`customerId`),
  CONSTRAINT `fk_ggbdblhvkpibrfhoywthqonohyjjbwatdxss` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qxrevybfjeheiaqzwobaxgkerzjpkijbwflr` FOREIGN KEY (`newStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_uyyjrcaabftezxmmasurhustktgjeobevnzw` FOREIGN KEY (`customerId`) REFERENCES `commerce_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xzgnzqfaojshmvkqctdxgulrriaopdeyzzve` FOREIGN KEY (`prevStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_ordernotices`
--

DROP TABLE IF EXISTS `commerce_ordernotices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_ordernotices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `attribute` varchar(255) DEFAULT NULL,
  `message` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_irlruikrblolbhdmcmvmxumxnzeybepzbwyg` (`orderId`),
  CONSTRAINT `fk_hadpjihqvuxogjofptvprbwhhnkcnmkuduix` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orders`
--

DROP TABLE IF EXISTS `commerce_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orders` (
  `id` int NOT NULL,
  `billingAddressId` int DEFAULT NULL,
  `shippingAddressId` int DEFAULT NULL,
  `estimatedBillingAddressId` int DEFAULT NULL,
  `estimatedShippingAddressId` int DEFAULT NULL,
  `gatewayId` int DEFAULT NULL,
  `paymentSourceId` int DEFAULT NULL,
  `customerId` int DEFAULT NULL,
  `orderStatusId` int DEFAULT NULL,
  `number` varchar(32) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `couponCode` varchar(255) DEFAULT NULL,
  `itemTotal` decimal(14,4) DEFAULT '0.0000',
  `itemSubtotal` decimal(14,4) DEFAULT '0.0000',
  `total` decimal(14,4) DEFAULT '0.0000',
  `totalPrice` decimal(14,4) DEFAULT '0.0000',
  `totalPaid` decimal(14,4) DEFAULT '0.0000',
  `totalDiscount` decimal(14,4) DEFAULT '0.0000',
  `totalTax` decimal(14,4) DEFAULT '0.0000',
  `totalTaxIncluded` decimal(14,4) DEFAULT '0.0000',
  `totalShippingCost` decimal(14,4) DEFAULT '0.0000',
  `paidStatus` enum('paid','partial','unpaid','overPaid') DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `isCompleted` tinyint(1) DEFAULT NULL,
  `dateOrdered` datetime DEFAULT NULL,
  `datePaid` datetime DEFAULT NULL,
  `dateAuthorized` datetime DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `paymentCurrency` varchar(255) DEFAULT NULL,
  `lastIp` varchar(255) DEFAULT NULL,
  `orderLanguage` varchar(12) NOT NULL,
  `origin` enum('web','cp','remote') NOT NULL DEFAULT 'web',
  `message` text,
  `registerUserOnOrderComplete` tinyint(1) DEFAULT NULL,
  `recalculationMode` enum('all','none','adjustmentsOnly') NOT NULL DEFAULT 'all',
  `returnUrl` text,
  `cancelUrl` text,
  `shippingMethodHandle` varchar(255) DEFAULT NULL,
  `shippingMethodName` varchar(255) DEFAULT NULL,
  `orderSiteId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fyxngxsdywwknwvdcpnkjdgxlnngayotaaui` (`number`),
  KEY `idx_nqiodkrqkbrbtqwngnerfmfhapyhoecuvjne` (`reference`),
  KEY `idx_dujvmdeaorpjqhmtglhjmewuelnklsmxptur` (`billingAddressId`),
  KEY `idx_hghwlrujlefqjosuagvnzobgabjfyvlhdvws` (`shippingAddressId`),
  KEY `idx_ngbebsnuuscsoltftccspxguwpklweevtqum` (`gatewayId`),
  KEY `idx_kxqczjstrzmqbizbxhuusiotrlukdrbqayxf` (`customerId`),
  KEY `idx_uqlbfdvufcfxdwpispflxugwnfysrndmodqs` (`orderStatusId`),
  KEY `idx_nonposlykoyfwdogvbozwdkeghbtsmzxdbjq` (`email`),
  KEY `fk_umqghwfnfoealqdjijrczwnwzslhwyjqexoj` (`paymentSourceId`),
  KEY `fk_ggmtjoofoyvoguydodidtibjtgpmuicmpfqg` (`estimatedShippingAddressId`),
  KEY `fk_vplfhqdvyvtluczpbhvnineigefbxzmuxmne` (`estimatedBillingAddressId`),
  CONSTRAINT `fk_ehehlyjbzpyhusvfcpvrubltjyycskztwvno` FOREIGN KEY (`shippingAddressId`) REFERENCES `commerce_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ggmtjoofoyvoguydodidtibjtgpmuicmpfqg` FOREIGN KEY (`estimatedShippingAddressId`) REFERENCES `commerce_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pilgjvglzbpsxdscxlvdizmhaumhmqwzmpbg` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_umqghwfnfoealqdjijrczwnwzslhwyjqexoj` FOREIGN KEY (`paymentSourceId`) REFERENCES `commerce_paymentsources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vazxartvawbxylrheavhhoouykrcsuoukile` FOREIGN KEY (`customerId`) REFERENCES `commerce_customers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vplfhqdvyvtluczpbhvnineigefbxzmuxmne` FOREIGN KEY (`estimatedBillingAddressId`) REFERENCES `commerce_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xotxivpfgvmcczdlcbgdiyadbhusywhmtore` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yysbamgeylnfokgebwrsbybzxvunesqhmxqe` FOREIGN KEY (`billingAddressId`) REFERENCES `commerce_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zhgcpxxvdlgwyfgbnnxwqvwkshljtyrrfrkt` FOREIGN KEY (`orderStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderstatus_emails`
--

DROP TABLE IF EXISTS `commerce_orderstatus_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orderstatus_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderStatusId` int NOT NULL,
  `emailId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_inaoffklvicniozpqbxjbmznriaoxzmhsdwh` (`orderStatusId`),
  KEY `idx_gjooglyvpukyghscmskyumdwesvrcmsnirio` (`emailId`),
  CONSTRAINT `fk_ihndkfgbbwiiesamjtjloekbwevjdeejyeud` FOREIGN KEY (`emailId`) REFERENCES `commerce_emails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xfkjvinastolpicpdovaoqzxszpfklzdlzvk` FOREIGN KEY (`orderStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderstatuses`
--

DROP TABLE IF EXISTS `commerce_orderstatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orderstatuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') NOT NULL DEFAULT 'green',
  `description` varchar(255) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_paymentcurrencies`
--

DROP TABLE IF EXISTS `commerce_paymentcurrencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_paymentcurrencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `iso` varchar(3) NOT NULL,
  `primary` tinyint(1) NOT NULL DEFAULT '0',
  `rate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jdspahyxsgwlwmuwetmznqyiuqwgdqzgijbf` (`iso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_paymentsources`
--

DROP TABLE IF EXISTS `commerce_paymentsources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_paymentsources` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `gatewayId` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `response` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_frjafpwqgtuqzrivavfcalydcjqepjphxsah` (`gatewayId`),
  KEY `fk_ohtmvviupaublsokgbxslihcemtmblklobdf` (`userId`),
  CONSTRAINT `fk_frjafpwqgtuqzrivavfcalydcjqepjphxsah` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ohtmvviupaublsokgbxslihcemtmblklobdf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_pdfs`
--

DROP TABLE IF EXISTS `commerce_pdfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_pdfs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `templatePath` varchar(255) NOT NULL,
  `fileNameFormat` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yrhrhwhahitbcoerykznhpowqxdeaxwelfpb` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_plans`
--

DROP TABLE IF EXISTS `commerce_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gatewayId` int DEFAULT NULL,
  `planInformationId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `planData` text,
  `isArchived` tinyint(1) NOT NULL,
  `dateArchived` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `sortOrder` int DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_joiignzwookhezhlmywuudrprymwhaliilrv` (`handle`),
  KEY `idx_lashgihgbybpkgjaetwaajrgbcrehodfzebr` (`gatewayId`),
  KEY `idx_luubpwjkgrqcajdufjaagscjgsrnadoolmqr` (`reference`),
  KEY `fk_tastxaibhkkmqyblgkkpxmrrygopgdqhtmhd` (`planInformationId`),
  CONSTRAINT `fk_caoqvfmgilttgplykyzdecntiuviptqooxtj` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tastxaibhkkmqyblgkkpxmrrygopgdqhtmhd` FOREIGN KEY (`planInformationId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_products`
--

DROP TABLE IF EXISTS `commerce_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_products` (
  `id` int NOT NULL,
  `typeId` int DEFAULT NULL,
  `taxCategoryId` int NOT NULL,
  `shippingCategoryId` int NOT NULL,
  `defaultVariantId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `promotable` tinyint(1) DEFAULT NULL,
  `availableForPurchase` tinyint(1) DEFAULT NULL,
  `freeShipping` tinyint(1) DEFAULT NULL,
  `defaultSku` varchar(255) DEFAULT NULL,
  `defaultPrice` decimal(14,4) DEFAULT NULL,
  `defaultHeight` decimal(14,4) DEFAULT NULL,
  `defaultLength` decimal(14,4) DEFAULT NULL,
  `defaultWidth` decimal(14,4) DEFAULT NULL,
  `defaultWeight` decimal(14,4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_efqzwbsyisbalptwkpqnhuyxuhajmmwwcljw` (`typeId`),
  KEY `idx_dwreydcwtdvqugyzvmmoaxrvjyvkqegayeyx` (`postDate`),
  KEY `idx_crznvcbboqbflqnhnfdfnfzgyesifbfquofr` (`expiryDate`),
  KEY `idx_qdbkslwafydyogfdsaxcwgtuaczoxcolosqb` (`taxCategoryId`),
  KEY `idx_twzitorbcrhvjxmmcvqokseakibavdlldxdw` (`shippingCategoryId`),
  CONSTRAINT `fk_kyoxqsjdmjrjklhldwpwzgpxjpzupotaqemt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rynejyextuzboazpqmvozifkbhggxmehhedi` FOREIGN KEY (`typeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wtbkvtwgtmypzawurvahouxffmxsxtcnmdqw` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`),
  CONSTRAINT `fk_zzmstyupfmoigvdotgaqxyatvtmanjuosenw` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes`
--

DROP TABLE IF EXISTS `commerce_producttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_producttypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `variantFieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasDimensions` tinyint(1) DEFAULT NULL,
  `hasVariants` tinyint(1) DEFAULT NULL,
  `hasVariantTitleField` tinyint(1) DEFAULT NULL,
  `titleFormat` varchar(255) NOT NULL,
  `hasProductTitleField` tinyint(1) DEFAULT NULL,
  `productTitleFormat` varchar(255) DEFAULT NULL,
  `skuFormat` varchar(255) DEFAULT NULL,
  `descriptionFormat` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fknpxwupppymtiyjdbwqbpmojvkvaiephuvb` (`handle`),
  KEY `idx_bctrmmsitfnohqmugwpxgdljyktvvjbgqvfp` (`fieldLayoutId`),
  KEY `idx_fnikqkynncwzfdsdkuctepljjknotypboeiz` (`variantFieldLayoutId`),
  CONSTRAINT `fk_vzcqokoleuncaotclpzfctoysdftldrcrbyu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wywzwacrmymncyrlpufxuwalambwjvqklqih` FOREIGN KEY (`variantFieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes_shippingcategories`
--

DROP TABLE IF EXISTS `commerce_producttypes_shippingcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_producttypes_shippingcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productTypeId` int NOT NULL,
  `shippingCategoryId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qajdlpaxyvrkkktxhbbltadosxdutcefgjob` (`productTypeId`,`shippingCategoryId`),
  KEY `idx_bvzsfpsdvmjjfsgiuseizxccdmvsjusxddjj` (`shippingCategoryId`),
  CONSTRAINT `fk_pxpwinntdxrlmrhtojszdmchzidihewkiftf` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sydcpyocgzvjfjaairlfjglpdjyxygjnweyq` FOREIGN KEY (`productTypeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes_sites`
--

DROP TABLE IF EXISTS `commerce_producttypes_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_producttypes_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productTypeId` int NOT NULL,
  `siteId` int NOT NULL,
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `hasUrls` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lznoblxnjulqyaugidblglejjxhuugdlduje` (`productTypeId`,`siteId`),
  KEY `idx_pgrcvxjdjlaknswsjympsqygqhkaolsaxaha` (`siteId`),
  CONSTRAINT `fk_qmydqsyumojrxdwskqhgxexcfytgoauisucr` FOREIGN KEY (`productTypeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sjqhhzjgeduvqoxsuxuyyrugbofhskfcfmgo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes_taxcategories`
--

DROP TABLE IF EXISTS `commerce_producttypes_taxcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_producttypes_taxcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productTypeId` int NOT NULL,
  `taxCategoryId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qlauytbrberbqmnalorqpyqhkmwoqrxeiotq` (`productTypeId`,`taxCategoryId`),
  KEY `idx_tertuwfwmynyovbbsvxfjuzkcckjrodtemox` (`taxCategoryId`),
  CONSTRAINT `fk_eayssftqbpjokogeujysgreyswoipiylpmmm` FOREIGN KEY (`productTypeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ubphhebkcngzcehioljcwmhzckqewxtcifev` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_purchasables`
--

DROP TABLE IF EXISTS `commerce_purchasables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_purchasables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) NOT NULL,
  `price` decimal(14,4) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gjxmldthruunmqfeiacnwffgbumxhwfqctpi` (`sku`),
  CONSTRAINT `fk_rxwgrgxyjdiqzsxzmljnrswjzpubrgnmkakw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sale_categories`
--

DROP TABLE IF EXISTS `commerce_sale_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sale_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saleId` int NOT NULL,
  `categoryId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lfluqeblntpskbceamszimurasssmamtcjlu` (`saleId`,`categoryId`),
  KEY `idx_wvolzyqznmryvqgefjukgysvotvaukxnzeja` (`categoryId`),
  CONSTRAINT `fk_qqoawwwleempqqzvqhcvskuuxlbpegtivbiq` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ydklihqwycwsotvjusiqhkyhhxtzffiebddt` FOREIGN KEY (`saleId`) REFERENCES `commerce_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sale_purchasables`
--

DROP TABLE IF EXISTS `commerce_sale_purchasables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sale_purchasables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saleId` int NOT NULL,
  `purchasableId` int NOT NULL,
  `purchasableType` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uwazmoksgouesrrxkwvzcwqocfciwavrzkmm` (`saleId`,`purchasableId`),
  KEY `idx_icwurvfbnqksfbsxacwnpdwonwhbjldvgmds` (`purchasableId`),
  CONSTRAINT `fk_keyyisdrsbkimkhuxpzcxdztqtpxxkyixcgv` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nilsytoitbsrgzgwsrlwbprxsviagrgwsqwq` FOREIGN KEY (`saleId`) REFERENCES `commerce_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sale_usergroups`
--

DROP TABLE IF EXISTS `commerce_sale_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sale_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saleId` int NOT NULL,
  `userGroupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hwtmgvjnzgtiezchjxpetttixfbskleolbeg` (`saleId`,`userGroupId`),
  KEY `idx_fjgfphltecsiitpxgfllplhmdyrczjshsivk` (`userGroupId`),
  CONSTRAINT `fk_ltjmahxpqpbsrocbsddtvdgpvnaxmvhbakcw` FOREIGN KEY (`userGroupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nqkxszzerlvmdimntxydnqhjrwjfheakslug` FOREIGN KEY (`saleId`) REFERENCES `commerce_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sales`
--

DROP TABLE IF EXISTS `commerce_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `apply` enum('toPercent','toFlat','byPercent','byFlat') NOT NULL,
  `applyAmount` decimal(14,4) NOT NULL,
  `allGroups` tinyint(1) DEFAULT NULL,
  `allPurchasables` tinyint(1) DEFAULT NULL,
  `allCategories` tinyint(1) DEFAULT NULL,
  `categoryRelationshipType` enum('element','sourceElement','targetElement') NOT NULL DEFAULT 'element',
  `enabled` tinyint(1) DEFAULT NULL,
  `ignorePrevious` tinyint(1) DEFAULT NULL,
  `stopProcessing` tinyint(1) DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingcategories`
--

DROP TABLE IF EXISTS `commerce_shippingcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lmkvadfvtdzcvbpyoygmwpxfafeoiqpusmgg` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingmethods`
--

DROP TABLE IF EXISTS `commerce_shippingmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingmethods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `isLite` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_otgnsgkpbyneaizefuotjfqzwgoydnceanbw` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingrule_categories`
--

DROP TABLE IF EXISTS `commerce_shippingrule_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingrule_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shippingRuleId` int DEFAULT NULL,
  `shippingCategoryId` int DEFAULT NULL,
  `condition` enum('allow','disallow','require') NOT NULL,
  `perItemRate` decimal(14,4) DEFAULT NULL,
  `weightRate` decimal(14,4) DEFAULT NULL,
  `percentageRate` decimal(14,4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_smsovutsxoxexqymfmgzckxllgsmoqwewzsx` (`shippingRuleId`),
  KEY `idx_orgjbetplwwqzrzixvbuwrskyhrfhzkslavc` (`shippingCategoryId`),
  CONSTRAINT `fk_uqaachnnhzdnhbcmuqnmtkcpjqztgwvdhkxh` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wpgsmsxpsbozbfyxznyicjdiykgjqcxtkfux` FOREIGN KEY (`shippingRuleId`) REFERENCES `commerce_shippingrules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingrules`
--

DROP TABLE IF EXISTS `commerce_shippingrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingrules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shippingZoneId` int DEFAULT NULL,
  `methodId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `enabled` tinyint(1) DEFAULT NULL,
  `minQty` int NOT NULL DEFAULT '0',
  `maxQty` int NOT NULL DEFAULT '0',
  `minTotal` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `maxTotal` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `minWeight` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `maxWeight` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `baseRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `perItemRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `weightRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `percentageRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `minRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `maxRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `isLite` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `minMaxTotalType` enum('salePrice','salePriceWithDiscounts') NOT NULL DEFAULT 'salePrice',
  `orderConditionFormula` text,
  PRIMARY KEY (`id`),
  KEY `idx_jgwseiffigauicvygmvfyptxwyhcuicwrota` (`name`),
  KEY `idx_jjgddwuisnftfdswdnsapboeoahviquyvrqd` (`methodId`),
  KEY `idx_wovaxuedertujruzdqjmaiyrbuaxfpgkyekb` (`shippingZoneId`),
  CONSTRAINT `fk_lmiiwnkcqwnftpuzdrtxzxwpmyifavyxokri` FOREIGN KEY (`shippingZoneId`) REFERENCES `commerce_shippingzones` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xvtbobdicprvdssouyiydrvwypzvlcgbztcg` FOREIGN KEY (`methodId`) REFERENCES `commerce_shippingmethods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingzone_countries`
--

DROP TABLE IF EXISTS `commerce_shippingzone_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingzone_countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shippingZoneId` int NOT NULL,
  `countryId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pxsxkxmmxtzlhjxgzeckgmfmmbfmodhuzlmt` (`shippingZoneId`,`countryId`),
  KEY `idx_ppsevngzlitopbyynzpulvojoalbvoyqwtpt` (`shippingZoneId`),
  KEY `idx_adklcygkdascotjmcqajlihtkqaacxxwxvlj` (`countryId`),
  CONSTRAINT `fk_lawtxsktswlwxywfunkdpbjjoxmfwlmlxbbd` FOREIGN KEY (`countryId`) REFERENCES `commerce_countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zllbsutipmtmudpwryyaoztfwdkocimmldks` FOREIGN KEY (`shippingZoneId`) REFERENCES `commerce_shippingzones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingzone_states`
--

DROP TABLE IF EXISTS `commerce_shippingzone_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingzone_states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shippingZoneId` int NOT NULL,
  `stateId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_szkysdpolcxcmfuqizwrfycerwxrbwqxcdzz` (`shippingZoneId`,`stateId`),
  KEY `idx_idcghbppxgpwajxwhboexicjbwuqlldnmvus` (`shippingZoneId`),
  KEY `idx_abjiagckhevhdnevjetcvuttanycvehpfhos` (`stateId`),
  CONSTRAINT `fk_japievcyqjokbsbbshcojrumqvcgebuomsil` FOREIGN KEY (`stateId`) REFERENCES `commerce_states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xtgukmzrpmrssafynvjpucxcomuulvgypvwd` FOREIGN KEY (`shippingZoneId`) REFERENCES `commerce_shippingzones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingzones`
--

DROP TABLE IF EXISTS `commerce_shippingzones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_shippingzones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isCountryBased` tinyint(1) DEFAULT NULL,
  `zipCodeConditionFormula` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cfruxunialxlylzhivnxrqdbfkofqklhrzgr` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_states`
--

DROP TABLE IF EXISTS `commerce_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `countryId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fzdhnyogjgzlblbtxaoevvsscrvkfsxioudk` (`countryId`,`name`),
  UNIQUE KEY `idx_ckluocgiyiklbheioivayuzhrodnubrjfwpr` (`countryId`,`abbreviation`),
  KEY `idx_rrdjylwibyyztcijgowyjfulzupoxcrmefnj` (`countryId`),
  CONSTRAINT `fk_ecvremsvnwohuitbzoevfxqvpujgqwrtbgqf` FOREIGN KEY (`countryId`) REFERENCES `commerce_countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_subscriptions`
--

DROP TABLE IF EXISTS `commerce_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `planId` int DEFAULT NULL,
  `gatewayId` int DEFAULT NULL,
  `orderId` int DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `subscriptionData` text,
  `trialDays` int NOT NULL,
  `nextPaymentDate` datetime DEFAULT NULL,
  `hasStarted` tinyint(1) NOT NULL DEFAULT '1',
  `isSuspended` tinyint(1) NOT NULL DEFAULT '0',
  `dateSuspended` datetime DEFAULT NULL,
  `isCanceled` tinyint(1) NOT NULL,
  `dateCanceled` datetime DEFAULT NULL,
  `isExpired` tinyint(1) NOT NULL,
  `dateExpired` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_upmnylporcxshbywloirnzjedmncgoneweyx` (`reference`),
  KEY `idx_jhdvruzdynuzpownnlfwnjwtwucmxzjwezqm` (`userId`),
  KEY `idx_sxcvdukwqfzcbbaiewwinbikdzpzxjoruitz` (`planId`),
  KEY `idx_sgdcyclhwvnirzpaoewdcyphggntdvgugucg` (`gatewayId`),
  KEY `idx_qezdospijabumxgkytewzdtiaazuwpuzyphh` (`nextPaymentDate`),
  KEY `idx_mzxsadbtgkfkypyorgnhgxndqkmjqmucjntb` (`dateCreated`),
  KEY `idx_fbyravwdqxddhmchlmmenzkdzcyhplwplxhl` (`dateExpired`),
  KEY `fk_inyhvhdbnihajgrbbudwbyhhaqmvsqlwnulk` (`orderId`),
  CONSTRAINT `fk_dzgssfjpysqiicdavtxipjrwzutiuwfroveq` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_inyhvhdbnihajgrbbudwbyhhaqmvsqlwnulk` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rlekktyccloeiwubwztltyefcokiruzxhtce` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_vojbvjukyqbuipsduyrdgwzsjoruitucvgpu` FOREIGN KEY (`planId`) REFERENCES `commerce_plans` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_wbzfwzhjrhbbxyrmpnfivvtydvnhurkoyrws` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxcategories`
--

DROP TABLE IF EXISTS `commerce_taxcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_taxcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_upsbvgyhdpjkdjmawmeophbucczwdiezybdb` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxrates`
--

DROP TABLE IF EXISTS `commerce_taxrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_taxrates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taxZoneId` int DEFAULT NULL,
  `isEverywhere` tinyint(1) DEFAULT NULL,
  `taxCategoryId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `rate` decimal(14,10) NOT NULL,
  `include` tinyint(1) DEFAULT NULL,
  `removeIncluded` tinyint(1) DEFAULT NULL,
  `removeVatIncluded` tinyint(1) DEFAULT NULL,
  `isVat` tinyint(1) DEFAULT NULL,
  `taxable` enum('price','shipping','price_shipping','order_total_shipping','order_total_price') NOT NULL,
  `isLite` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pgrsawsjcukqvpcjcwcimtouxbuqdszmftus` (`taxZoneId`),
  KEY `idx_zxyclfygoyuevcesimalzbnvakerstnwqtxz` (`taxCategoryId`),
  CONSTRAINT `fk_kcwyfaujgbetxzqdtyfnmqfebwxipckobfpr` FOREIGN KEY (`taxZoneId`) REFERENCES `commerce_taxzones` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_yqphuemmfwvbuulkdxlewayioooqqjktudnx` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxzone_countries`
--

DROP TABLE IF EXISTS `commerce_taxzone_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_taxzone_countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taxZoneId` int NOT NULL,
  `countryId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wlstulxcrapnsboglpumcphrrltnsiqudghb` (`taxZoneId`,`countryId`),
  KEY `idx_myinjnkidzrxhaawwueavwvtbskzaxiitqlm` (`taxZoneId`),
  KEY `idx_gtagmxaghnfzifmylhqqcjqhfoqypittrvko` (`countryId`),
  CONSTRAINT `fk_aqrinuwdrxlnzadyejppwqwxixgfjhavifcv` FOREIGN KEY (`taxZoneId`) REFERENCES `commerce_taxzones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jqsugefhoblezzsopdygumjzqmnlktsxxwqb` FOREIGN KEY (`countryId`) REFERENCES `commerce_countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxzone_states`
--

DROP TABLE IF EXISTS `commerce_taxzone_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_taxzone_states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taxZoneId` int NOT NULL,
  `stateId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hyiqhqwmxlrtlqrmdrgrhtuswzvbffeamwnd` (`taxZoneId`,`stateId`),
  KEY `idx_elzhhwzogyvmywtruldujagbbrfmowsrdlct` (`taxZoneId`),
  KEY `idx_pjzfpzrpmmpaquoqhtefejkrfolvdyttbwjk` (`stateId`),
  CONSTRAINT `fk_qxzzewpekublsagnsrkobvuuyapzwwoidmme` FOREIGN KEY (`taxZoneId`) REFERENCES `commerce_taxzones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wbidpmpfxvcitafphqcpbmrxlecmeotrblfa` FOREIGN KEY (`stateId`) REFERENCES `commerce_states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxzones`
--

DROP TABLE IF EXISTS `commerce_taxzones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_taxzones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isCountryBased` tinyint(1) DEFAULT NULL,
  `zipCodeConditionFormula` text,
  `default` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qtfbthuowjzjcembrhkncxwrmvvipwowdmve` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_transactions`
--

DROP TABLE IF EXISTS `commerce_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `gatewayId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `type` enum('authorize','capture','purchase','refund') NOT NULL,
  `amount` decimal(14,4) DEFAULT NULL,
  `paymentAmount` decimal(14,4) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `paymentCurrency` varchar(255) DEFAULT NULL,
  `paymentRate` decimal(14,4) DEFAULT NULL,
  `status` enum('pending','redirect','success','failed','processing') NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `message` text,
  `note` mediumtext,
  `response` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ccoomkqvypppavsfwddjdhcfxhviylbzekxa` (`parentId`),
  KEY `idx_cfswmlcjvrmifzddqrvogndaufaulcefxvcw` (`gatewayId`),
  KEY `idx_zteuvperywwwemehokcnfwdpupwnhrgmsqjm` (`orderId`),
  KEY `idx_mptecayhgovdftsyoiqgixkzafbmtenbcwqj` (`userId`),
  CONSTRAINT `fk_ehohbepmkkactjslekwvmkqxqcfwukahlqiy` FOREIGN KEY (`parentId`) REFERENCES `commerce_transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fndwzzwzarpaweaadbynpuwpmznqelggipxt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kbuaxixabcbiwzcbvetwlognbufqlkpliumr` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_okjmcvjevvvftwljvbnnsheqzlflpuggzjqs` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_variants`
--

DROP TABLE IF EXISTS `commerce_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_variants` (
  `id` int NOT NULL,
  `productId` int DEFAULT NULL,
  `sku` varchar(255) NOT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `price` decimal(14,4) NOT NULL,
  `sortOrder` int DEFAULT NULL,
  `width` decimal(14,4) DEFAULT NULL,
  `height` decimal(14,4) DEFAULT NULL,
  `length` decimal(14,4) DEFAULT NULL,
  `weight` decimal(14,4) DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `hasUnlimitedStock` tinyint(1) DEFAULT NULL,
  `minQty` int DEFAULT NULL,
  `maxQty` int DEFAULT NULL,
  `deletedWithProduct` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_juvkxgthupbzamorpowgfrdwnjzvhkxsptka` (`sku`),
  KEY `idx_uygkztockcncqvychhgqplijsobbawrokbth` (`productId`),
  CONSTRAINT `fk_ipjnbnzzhbyoqrbknyekgchcxbhqjovcqzkm` FOREIGN KEY (`productId`) REFERENCES `commerce_products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sqlojqxgisdmbbptpfwjxsxfdbutbjpazhbm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `content_siteId_idx` (`siteId`),
  KEY `content_title_idx` (`title`),
  CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `drafts_creatorId_fk` (`creatorId`),
  KEY `drafts_sourceId_fk` (`canonicalId`),
  KEY `idx_tnitxhbukaspzkfjftipesmpqcpuatbycdqb` (`saved`),
  KEY `idx_wksdgnwwcprrhdybuwqhdkkcpapxouputaji` (`creatorId`,`provisional`),
  CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `elements_dateDeleted_idx` (`dateDeleted`),
  KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `elements_type_idx` (`type`),
  KEY `elements_enabled_idx` (`enabled`),
  KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  KEY `elements_draftId_fk` (`draftId`),
  KEY `elements_revisionId_fk` (`revisionId`),
  KEY `fk_jmmddvkfciskdcecdwwofnueiecdmkbghbsl` (`canonicalId`),
  KEY `idx_wayewwvxfooqldqvbosqyrygxqqgoyibbimu` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_xnirxnzmxodoccrkyjqqpkannwakaukgihsm` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jmmddvkfciskdcecdwwofnueiecdmkbghbsl` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `elements_sites_siteId_idx` (`siteId`),
  KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `elements_sites_enabled_idx` (`enabled`),
  KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entries_postDate_idx` (`postDate`),
  KEY `entries_expiryDate_idx` (`expiryDate`),
  KEY `entries_authorId_idx` (`authorId`),
  KEY `entries_sectionId_idx` (`sectionId`),
  KEY `entries_typeId_idx` (`typeId`),
  KEY `entries_parentId_fk` (`parentId`),
  CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oppwayyehjcqiufoxkjigprwuvchgwtmfwuq` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  KEY `entrytypes_sectionId_idx` (`sectionId`),
  KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `entrytypes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldgroups_name_idx` (`name`),
  KEY `idx_xkjrkcadnxgnxscxrnprbfrqhdsjkfbgbtnb` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  KEY `fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fields_groupId_idx` (`groupId`),
  KEY `fields_context_idx` (`context`),
  KEY `fields_handle_context_idx` (`handle`,`context`),
  CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `giftvoucher_codes`
--

DROP TABLE IF EXISTS `giftvoucher_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giftvoucher_codes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `voucherId` int DEFAULT NULL,
  `orderId` int DEFAULT NULL,
  `lineItemId` int DEFAULT NULL,
  `codeKey` varchar(255) NOT NULL,
  `originalAmount` decimal(12,2) NOT NULL,
  `currentAmount` decimal(12,2) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iabjurbvupsmwuuwquiqlrizdmzvoixevlww` (`codeKey`),
  KEY `idx_vofhjqemrccmpwkesprmakkwrsyeanwnsevn` (`voucherId`),
  KEY `idx_sertkrwwalwcwmhztwdozbospiazxttmnacm` (`orderId`),
  KEY `idx_cpzupoyixfwejatebthrraivcgtapdpqwvfz` (`lineItemId`),
  CONSTRAINT `fk_azskdtkjmqfrvdwvujooklhcnhjjvlxqoroq` FOREIGN KEY (`voucherId`) REFERENCES `giftvoucher_vouchers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_obniflbeuztvnoxqwnjtdyxpbblvjvketlpz` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vxpgdqwhivyxcopfrpvchtsqnqqylegnzjnx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zigjlahzowycvgtyppykihxiiznzqdrvjtdf` FOREIGN KEY (`lineItemId`) REFERENCES `commerce_lineitems` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `giftvoucher_redemptions`
--

DROP TABLE IF EXISTS `giftvoucher_redemptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giftvoucher_redemptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codeId` int DEFAULT NULL,
  `orderId` int DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gpammdyjtyxfqngcesuyfeakkfwceztegqva` (`codeId`),
  KEY `idx_fnpeogqqfirpmgyyfifldlxwtvwwffltcqxb` (`orderId`),
  CONSTRAINT `fk_ltbwwotgaarbnrposoxbafnbkttkqflnupny` FOREIGN KEY (`codeId`) REFERENCES `giftvoucher_codes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yyoitvjgjqslzileztpakeqwpskfktahxsjr` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `giftvoucher_vouchers`
--

DROP TABLE IF EXISTS `giftvoucher_vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giftvoucher_vouchers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeId` int DEFAULT NULL,
  `taxCategoryId` int NOT NULL,
  `shippingCategoryId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `promotable` tinyint(1) DEFAULT NULL,
  `availableForPurchase` tinyint(1) DEFAULT NULL,
  `sku` varchar(255) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `customAmount` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tmxnnltcisuvqzzzuopzlrgrmrjhdqhyfnpu` (`sku`),
  KEY `idx_smsasdkkgizrriqcqghykeejwksnwjdkqenp` (`typeId`),
  KEY `idx_tkxmiznuntumumbwuilwugyblnwzrbsnmtor` (`taxCategoryId`),
  KEY `idx_umrmydzempklhgsecoauferixdfwvschducl` (`shippingCategoryId`),
  CONSTRAINT `fk_bcdutiefflptxdyuvpldwfehfcqatchoozbm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kbgmnukphylhqepygyokqrkhsqglesdmgmog` FOREIGN KEY (`typeId`) REFERENCES `giftvoucher_vouchertypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_usousqzwkdqaevqghhsbnuimkxgedutarsxo` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`),
  CONSTRAINT `fk_vmtobvcsutuoyahdfuuhzkrffzlhfncpjqkg` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `giftvoucher_vouchertypes`
--

DROP TABLE IF EXISTS `giftvoucher_vouchertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giftvoucher_vouchertypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `skuFormat` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_serrxnwpmupvjuuebamwuowcgypejljwlaae` (`handle`),
  KEY `idx_tbilxdhtzwcxtdaytafdobhjqjpfplescgbh` (`fieldLayoutId`),
  CONSTRAINT `fk_zlvgirnmcdlrnwccbtxhbmxoyvfbylberhim` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `giftvoucher_vouchertypes_sites`
--

DROP TABLE IF EXISTS `giftvoucher_vouchertypes_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giftvoucher_vouchertypes_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `voucherTypeId` int NOT NULL,
  `siteId` int NOT NULL,
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `hasUrls` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nxwpyzqaljhziatehppqglfvuukwumomoclc` (`voucherTypeId`,`siteId`),
  KEY `idx_ejaeamvvyxlusgebgaulcdprrexpahjunbrg` (`siteId`),
  CONSTRAINT `fk_dbnuziujfviabrmdkhggbqbjfnhtiqyawffv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_keguxvdimiguvyggrzwywcjvbmzcpychhxoq` FOREIGN KEY (`voucherTypeId`) REFERENCES `giftvoucher_vouchertypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `globalsets_name_idx` (`name`),
  KEY `globalsets_handle_idx` (`handle`),
  KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `idx_kbsfxvgwekjokzzdnapzndgyfajbcqoayoje` (`sortOrder`),
  CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gqltokens_accessToken_unq_idx` (`accessToken`),
  UNIQUE KEY `gqltokens_name_unq_idx` (`name`),
  KEY `gqltokens_schemaId_fk` (`schemaId`),
  CONSTRAINT `gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wogjpsqiokglnmfrpjuxxjhxhbvijrsbbebf` (`assetId`,`format`,`transformString`),
  KEY `idx_dyoeefkwrqxjbipuqdalqpqrprbouitoxvyg` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransforms_name_idx` (`name`),
  KEY `assettransforms_handle_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `matrixblocks_ownerId_idx` (`primaryOwnerId`),
  KEY `matrixblocks_fieldId_idx` (`fieldId`),
  KEY `matrixblocks_typeId_idx` (`typeId`),
  CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_vopskhqhlxbncdjlgzudrgvcxxmneoeugoee` (`ownerId`),
  CONSTRAINT `fk_nvojvybysixaaabigejduxeexfuqemmjmjks` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vopskhqhlxbncdjlgzudrgvcxxmneoeugoee` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `matrixblocktypes_name_fieldId_idx` (`name`,`fieldId`),
  KEY `matrixblocktypes_handle_fieldId_idx` (`handle`,`fieldId`),
  CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_colorsswatches`
--

DROP TABLE IF EXISTS `matrixcontent_colorsswatches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_colorsswatches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_default_selected` tinyint(1) DEFAULT NULL,
  `field_default_accentColor` varchar(7) DEFAULT NULL,
  `field_default_primaryColor` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ogtukehfooowlgajrdiqvbkaarbhrmqxmxec` (`elementId`,`siteId`),
  KEY `fk_jvsrzbsoloqciphyijuvctnxgvreuaojbidz` (`siteId`),
  CONSTRAINT `fk_jvsrzbsoloqciphyijuvctnxgvreuaojbidz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_leqfgjgubwtowoeigddbjemupqawxgmopqkd` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_scoops`
--

DROP TABLE IF EXISTS `matrixcontent_scoops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_scoops` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_default_nuts_old` varchar(255) DEFAULT NULL,
  `field_default_notes` text,
  `field_default_nuts` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_abdmkrujxkcmhxjowkepdowhwszufxhaozsa` (`elementId`,`siteId`),
  KEY `fk_xrydsuamaovgiameiqjzkcnalnzufuggsane` (`siteId`),
  CONSTRAINT `fk_veviebiconfrttdffwsncswvztuovqtyvecv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xrydsuamaovgiameiqjzkcnalnzufuggsane` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `migrations_track_name_unq_idx` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=1310 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `relations_sourceId_idx` (`sourceId`),
  KEY `relations_targetId_idx` (`targetId`),
  KEY `relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `retour_redirects`
--

DROP TABLE IF EXISTS `retour_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retour_redirects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `siteId` int DEFAULT NULL,
  `associatedElementId` int NOT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `redirectSrcUrl` varchar(255) DEFAULT '',
  `redirectSrcUrlParsed` varchar(255) DEFAULT '',
  `redirectSrcMatch` varchar(32) DEFAULT 'pathonly',
  `redirectMatchType` varchar(32) DEFAULT 'exactmatch',
  `redirectDestUrl` varchar(255) DEFAULT '',
  `redirectHttpCode` int DEFAULT '301',
  `hitCount` int DEFAULT '1',
  `hitLastTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `retour_redirects_redirectSrcUrlParsed_idx` (`redirectSrcUrlParsed`),
  KEY `retour_redirects_redirectSrcUrl_idx` (`redirectSrcUrl`),
  KEY `retour_redirects_siteId_idx` (`siteId`),
  KEY `retour_redirects_associatedElementId_fk` (`associatedElementId`),
  CONSTRAINT `retour_redirects_associatedElementId_fk` FOREIGN KEY (`associatedElementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `retour_static_redirects`
--

DROP TABLE IF EXISTS `retour_static_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retour_static_redirects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `siteId` int DEFAULT NULL,
  `associatedElementId` int NOT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `redirectSrcUrl` varchar(255) DEFAULT '',
  `redirectSrcUrlParsed` varchar(255) DEFAULT '',
  `redirectSrcMatch` varchar(32) DEFAULT 'pathonly',
  `redirectMatchType` varchar(32) DEFAULT 'exactmatch',
  `redirectDestUrl` varchar(255) DEFAULT '',
  `redirectHttpCode` int DEFAULT '301',
  `hitCount` int DEFAULT '1',
  `hitLastTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `retour_static_redirects_redirectSrcUrlParsed_idx` (`redirectSrcUrlParsed`),
  KEY `retour_static_redirects_redirectSrcUrl_idx` (`redirectSrcUrl`),
  KEY `retour_static_redirects_siteId_idx` (`siteId`),
  CONSTRAINT `retour_static_redirects_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `retour_stats`
--

DROP TABLE IF EXISTS `retour_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retour_stats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `siteId` int DEFAULT NULL,
  `redirectSrcUrl` varchar(255) DEFAULT '',
  `referrerUrl` varchar(2000) DEFAULT '',
  `remoteIp` varchar(45) DEFAULT '',
  `userAgent` varchar(255) DEFAULT '',
  `exceptionMessage` varchar(255) DEFAULT '',
  `exceptionFilePath` varchar(255) DEFAULT '',
  `exceptionFileLine` int DEFAULT '0',
  `hitCount` int DEFAULT '1',
  `hitLastTime` datetime DEFAULT NULL,
  `handledByRetour` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `retour_stats_redirectSrcUrl_idx` (`redirectSrcUrl`),
  KEY `retour_stats_siteId_idx` (`siteId`),
  CONSTRAINT `retour_stats_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `revisions_sourceId_num_unq_idx` (`canonicalId`,`num`),
  KEY `revisions_creatorId_fk` (`creatorId`),
  CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sections_handle_idx` (`handle`),
  KEY `sections_name_idx` (`name`),
  KEY `sections_structureId_idx` (`structureId`),
  KEY `sections_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seomatic_metabundles`
--

DROP TABLE IF EXISTS `seomatic_metabundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seomatic_metabundles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `bundleVersion` varchar(255) NOT NULL DEFAULT '',
  `sourceBundleType` varchar(255) NOT NULL DEFAULT '',
  `sourceId` int DEFAULT NULL,
  `sourceName` varchar(255) NOT NULL DEFAULT '',
  `sourceHandle` varchar(255) NOT NULL DEFAULT '',
  `sourceType` varchar(64) NOT NULL DEFAULT '',
  `typeId` int DEFAULT NULL,
  `sourceTemplate` varchar(500) DEFAULT '',
  `sourceSiteId` int DEFAULT NULL,
  `sourceAltSiteSettings` text,
  `sourceDateUpdated` datetime NOT NULL,
  `metaGlobalVars` text,
  `metaSiteVars` text,
  `metaSitemapVars` text,
  `metaContainers` text,
  `redirectsContainer` text,
  `frontendTemplatesContainer` text,
  `metaBundleSettings` text,
  PRIMARY KEY (`id`),
  KEY `seomatic_metabundles_sourceBundleType_idx` (`sourceBundleType`),
  KEY `seomatic_metabundles_sourceId_idx` (`sourceId`),
  KEY `seomatic_metabundles_sourceSiteId_idx` (`sourceSiteId`),
  KEY `seomatic_metabundles_sourceHandle_idx` (`sourceHandle`),
  CONSTRAINT `seomatic_metabundles_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sessions_uid_idx` (`uid`),
  KEY `sessions_token_idx` (`token`),
  KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `sessions_userId_idx` (`userId`),
  CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sitegroups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sites_dateDeleted_idx` (`dateDeleted`),
  KEY `sites_handle_idx` (`handle`),
  KEY `sites_sortOrder_idx` (`sortOrder`),
  KEY `sites_groupId_fk` (`groupId`),
  CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sprig_playgrounds`
--

DROP TABLE IF EXISTS `sprig_playgrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sprig_playgrounds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `component` text,
  `variables` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `structureelements_root_idx` (`root`),
  KEY `structureelements_lft_idx` (`lft`),
  KEY `structureelements_rgt_idx` (`rgt`),
  KEY `structureelements_level_idx` (`level`),
  KEY `structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taggroups_name_idx` (`name`),
  KEY `taggroups_handle_idx` (`handle`),
  KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_groupId_idx` (`groupId`),
  CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unq_idx` (`token`),
  KEY `tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `usergroups_handle_idx` (`handle`),
  KEY `usergroups_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `photoId` int DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_verificationCode_idx` (`verificationCode`),
  KEY `users_email_idx` (`email`),
  KEY `users_username_idx` (`username`),
  KEY `users_photoId_fk` (`photoId`),
  KEY `idx_awyzmwycqscgbkisqbmbugfsncenzfvxpaon` (`active`),
  KEY `idx_czmewuhlmtkomojmlsmlszqjlhlnfiribvhj` (`locked`),
  KEY `idx_xfpqbmqsxhykifdrvjmcysasosxmggbngtar` (`pending`),
  KEY `idx_cvozmmawzudcukqrhnnsbryrvggmhrqkiqrp` (`suspended`),
  CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `volumefolders_parentId_idx` (`parentId`),
  KEY `volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `volumes_name_idx` (`name`),
  KEY `volumes_handle_idx` (`handle`),
  KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `volumes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webperf_data_samples`
--

DROP TABLE IF EXISTS `webperf_data_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webperf_data_samples` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `requestId` bigint DEFAULT NULL,
  `siteId` int DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `queryString` varchar(255) DEFAULT '',
  `dns` int DEFAULT NULL,
  `connect` int DEFAULT NULL,
  `firstByte` int DEFAULT NULL,
  `firstPaint` int DEFAULT NULL,
  `firstContentfulPaint` int DEFAULT NULL,
  `domInteractive` int DEFAULT NULL,
  `pageLoad` int DEFAULT NULL,
  `countryCode` varchar(2) DEFAULT NULL,
  `device` varchar(50) DEFAULT NULL,
  `browser` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `mobile` tinyint(1) DEFAULT NULL,
  `craftTotalMs` int DEFAULT NULL,
  `craftDbMs` int DEFAULT NULL,
  `craftDbCnt` int DEFAULT NULL,
  `craftTwigMs` int DEFAULT NULL,
  `craftTwigCnt` int DEFAULT NULL,
  `craftOtherMs` int DEFAULT NULL,
  `craftOtherCnt` int DEFAULT NULL,
  `craftTotalMemory` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qoibkandofdunwpgwdpibvoriqmnqkxwqtxt` (`url`),
  KEY `idx_nuliazqpqtekaoojmlurxmjeuhfcpnoykrvi` (`dateCreated`),
  KEY `idx_ddgfpibmukrbioxlkavfspyeucacrohtviue` (`requestId`),
  KEY `fk_mwkvhxwvjfleuiojnwdmcfcmtxmkciuzlauo` (`siteId`),
  CONSTRAINT `fk_mwkvhxwvjfleuiojnwdmcfcmtxmkciuzlauo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webperf_error_samples`
--

DROP TABLE IF EXISTS `webperf_error_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webperf_error_samples` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `requestId` bigint DEFAULT NULL,
  `siteId` int DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `queryString` varchar(255) DEFAULT '',
  `type` varchar(16) DEFAULT '',
  `pageErrors` text,
  PRIMARY KEY (`id`),
  KEY `idx_mhqulsuzypjhtpecdtycabnjqhnkjjitiuri` (`url`),
  KEY `idx_wxxwainyzmcttgdjywpwywyazeetivvfckiu` (`dateCreated`),
  KEY `idx_aefcgtggsndneokznihdmdcdmfaecgubvfkr` (`requestId`),
  KEY `fk_nuewomlrrdccthszctwhxlnbuimuucglgdka` (`siteId`),
  CONSTRAINT `fk_nuewomlrrdccthszctwhxlnbuimuucglgdka` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `widgets_userId_idx` (`userId`),
  CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-24  3:29:47
-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for Linux (aarch64)
--
-- Host: mysql    Database: project
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `announcements` VALUES (1,1,NULL,'Editor Slideouts','Double-click entries and other editable elements to try the new editor slideout interface.',1,NULL,'2021-12-31 19:55:04'),(2,1,NULL,'Streamlined Entry Publishing Flow','The entry publishing workflow is now [simpler and more intuitive](https://craftcms.com/knowledge-base/editing-entries).',1,NULL,'2021-12-31 19:55:04');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (23,1,1,1,'FHEDAt4X0AAFHBi.jpg','image',NULL,1024,1018,96026,NULL,0,0,'2021-12-31 20:00:02','2021-12-31 20:00:02','2021-12-31 20:00:02'),(25,1,1,1,'vanilla-scoop.jpg','image',NULL,820,868,270840,NULL,0,0,'2022-01-06 14:15:19','2022-01-06 14:15:19','2022-01-19 17:38:51'),(28,1,1,1,'chocolate-scoop.jpg','image',NULL,800,640,64471,NULL,0,0,'2022-01-06 14:17:05','2022-01-06 14:17:05','2022-01-19 17:38:33'),(31,1,1,1,'strawberry-scoop.png','image',NULL,500,400,176043,NULL,0,0,'2022-01-06 14:18:01','2022-01-06 14:18:01','2022-01-19 17:38:21');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `calendar_calendar_sites`
--

LOCK TABLES `calendar_calendar_sites` WRITE;
/*!40000 ALTER TABLE `calendar_calendar_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `calendar_calendar_sites` VALUES (1,1,1,1,NULL,NULL,NULL,'2022-01-15 20:48:13','2022-01-15 20:48:13','2c0c6fac-3e4f-4665-bffd-b22a0fbd76fc'),(2,1,2,1,NULL,NULL,NULL,'2022-01-15 20:48:13','2022-01-15 20:48:13','9effa89c-6cdf-47f6-b483-c9fef5a9f545');
/*!40000 ALTER TABLE `calendar_calendar_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `calendar_calendars`
--

LOCK TABLES `calendar_calendars` WRITE;
/*!40000 ALTER TABLE `calendar_calendars` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `calendar_calendars` VALUES (1,'Default','default','The default calendar','#72F501',NULL,NULL,'Title',1,NULL,NULL,NULL,'floating',1,'2022-01-15 20:48:13','2022-01-15 20:48:13','e4678105-3cb4-4a25-9f37-7f41ed338ff9');
/*!40000 ALTER TABLE `calendar_calendars` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `calendar_events`
--

LOCK TABLES `calendar_events` WRITE;
/*!40000 ALTER TABLE `calendar_events` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `calendar_events` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `calendar_exceptions`
--

LOCK TABLES `calendar_exceptions` WRITE;
/*!40000 ALTER TABLE `calendar_exceptions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `calendar_exceptions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `calendar_select_dates`
--

LOCK TABLES `calendar_select_dates` WRITE;
/*!40000 ALTER TABLE `calendar_select_dates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `calendar_select_dates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categories` VALUES (21,1,NULL,1,'2021-04-01 02:35:35','2021-04-01 02:35:35'),(22,1,NULL,1,'2021-04-01 02:35:44','2021-04-01 02:35:44');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categorygroups` VALUES (1,1,9,'Category','category','end','2021-04-01 02:35:21','2021-04-01 02:35:21','2022-01-19 17:36:03','1cc0f175-5212-4568-94a6-9598fce64b6c');
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categorygroups_sites` VALUES (1,1,1,1,'category/{slug}',NULL,'2021-04-01 02:35:21','2021-04-01 02:35:21','3282a3d5-150f-4c6e-a411-83853f570db1');
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (1,1,'email','2022-04-24 03:00:24',0,1),(1,1,'fieldLayoutId','2022-01-19 17:48:40',0,1),(1,1,'firstName','2021-03-15 14:57:00',0,1),(1,1,'lastName','2021-03-15 14:57:00',0,1),(1,1,'lastPasswordChangeDate','2021-03-15 14:57:00',0,1),(1,1,'password','2021-03-15 14:57:00',0,1),(2,1,'fieldLayoutId','2021-03-03 22:29:11',0,1),(24,1,'slug','2022-01-06 14:13:38',0,1),(24,1,'title','2022-01-06 14:13:38',0,1),(24,1,'uri','2022-01-06 14:13:38',0,1),(24,2,'slug','2022-01-06 14:13:38',1,1),(24,2,'title','2022-01-06 14:13:38',1,1),(24,2,'uri','2022-01-06 14:13:38',1,1),(27,1,'slug','2022-01-06 14:16:39',0,1),(27,1,'title','2022-01-06 14:16:39',0,1),(27,1,'uri','2022-01-06 14:16:39',0,1),(27,2,'slug','2022-01-06 14:16:39',1,1),(27,2,'title','2022-01-06 14:16:39',1,1),(27,2,'uri','2022-01-06 14:16:39',1,1),(30,1,'slug','2022-01-06 14:17:28',0,1),(30,1,'title','2022-01-06 14:17:28',0,1),(30,1,'uri','2022-01-06 14:17:28',0,1),(30,2,'slug','2022-01-06 14:17:28',1,1),(30,2,'title','2022-01-06 14:17:28',1,1),(30,2,'uri','2022-01-06 14:17:28',1,1),(33,1,'slug','2022-01-06 14:57:30',0,1),(33,1,'title','2022-01-06 14:57:30',0,1),(33,1,'uri','2022-01-06 14:57:30',0,1),(33,2,'slug','2022-01-06 14:57:30',1,1),(33,2,'uri','2022-01-06 14:57:30',1,1),(216,1,'slug','2022-01-22 03:50:27',0,1),(216,1,'title','2022-01-22 03:50:27',0,1),(216,1,'uri','2022-01-22 03:50:27',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (38,1,12,'2022-01-06 16:09:38',0,1),(38,1,13,'2022-01-06 16:09:38',0,1),(38,1,14,'2022-01-06 16:09:38',0,1),(38,2,12,'2022-01-06 16:09:38',1,1),(38,2,13,'2022-01-06 16:09:38',0,1),(38,2,14,'2022-01-06 16:09:38',1,1),(52,1,12,'2022-01-06 16:09:43',0,1),(52,1,13,'2022-01-06 16:09:43',0,1),(52,1,14,'2022-01-06 16:09:43',0,1),(52,2,12,'2022-01-06 16:09:43',1,1),(52,2,13,'2022-01-06 16:09:43',0,1),(52,2,14,'2022-01-06 16:09:43',1,1),(125,1,12,'2022-01-06 16:09:43',0,1),(125,1,13,'2022-01-06 16:09:43',0,1),(125,1,14,'2022-01-06 16:09:43',0,1),(125,2,12,'2022-01-06 16:09:43',1,1),(125,2,13,'2022-01-06 16:09:43',0,1),(125,2,14,'2022-01-06 16:09:43',1,1),(165,1,12,'2022-01-22 03:16:41',0,1),(165,1,13,'2022-01-22 03:16:41',0,1),(165,1,14,'2022-01-22 03:16:41',0,1),(165,2,12,'2022-01-06 17:45:46',1,1),(165,2,13,'2022-01-06 17:45:46',0,1),(165,2,14,'2022-01-06 17:45:46',1,1),(174,1,12,'2022-01-22 03:16:41',0,1),(174,1,13,'2022-01-22 03:16:41',0,1),(174,1,14,'2022-01-22 03:16:41',0,1),(174,2,12,'2022-01-06 17:45:46',1,1),(174,2,13,'2022-01-06 17:45:46',0,1),(174,2,14,'2022-01-06 17:45:46',1,1),(189,1,12,'2022-01-22 03:16:41',0,1),(189,1,13,'2022-01-22 03:16:41',0,1),(189,1,14,'2022-01-22 03:16:41',0,1),(239,1,19,'2022-01-22 18:54:52',0,1),(239,1,20,'2022-01-22 18:51:06',0,1),(239,1,21,'2022-01-22 18:51:06',0,1),(240,1,19,'2022-01-22 18:54:52',0,1),(240,1,20,'2022-01-22 18:51:06',0,1),(240,1,21,'2022-01-22 18:51:06',0,1),(241,1,19,'2022-01-22 18:54:52',0,1),(241,1,20,'2022-01-22 18:54:52',0,1),(241,1,21,'2022-01-22 18:54:52',0,1),(303,1,19,'2022-03-26 20:19:59',0,1),(304,1,19,'2022-03-26 20:19:59',0,1),(305,1,19,'2022-03-26 20:19:59',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_addresses`
--

LOCK TABLES `commerce_addresses` WRITE;
/*!40000 ALTER TABLE `commerce_addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_countries`
--

LOCK TABLES `commerce_countries` WRITE;
/*!40000 ALTER TABLE `commerce_countries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_countries` VALUES (1,'Afghanistan','AF',NULL,1,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','c5fd08eb-ca96-4fdf-8e39-a37b62adb9f6'),(2,'Aland Islands','AX',NULL,2,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','5036835c-e416-4c62-9901-c11b45305294'),(3,'Albania','AL',NULL,3,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','1a13624c-ff9c-4f5a-9c06-eba356c36b37'),(4,'Algeria','DZ',NULL,4,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','40d27081-fce0-429a-aca3-e26f6912bb94'),(5,'American Samoa','AS',NULL,5,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','7ce0a273-f6fe-402d-a3a1-cdeccd705a32'),(6,'Andorra','AD',NULL,6,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','dc1488fd-b237-469f-a106-5f68c67f02a1'),(7,'Angola','AO',NULL,7,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','d3e508fc-0cf3-4895-bc8e-9f92c2064768'),(8,'Anguilla','AI',NULL,8,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','bb99e91a-4379-4671-b252-215e2e563d0b'),(9,'Antarctica','AQ',NULL,9,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','1ec49c4f-1e2f-412f-a002-72bc9222ee30'),(10,'Antigua and Barbuda','AG',NULL,10,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','2a7dd00f-324f-47f5-9fbf-61d79efac220'),(11,'Argentina','AR',NULL,11,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','c11194e9-9927-46e8-a2b0-1b86c5e4c2e3'),(12,'Armenia','AM',NULL,12,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','57447769-634f-4fde-b66c-ee6b93f009db'),(13,'Aruba','AW',NULL,13,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','33786f9b-fee0-432a-81bb-05545e5b7f67'),(14,'Australia','AU',NULL,14,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','908a082e-e764-4e16-8f85-4120f3430530'),(15,'Austria','AT',NULL,15,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','948b8b03-8c68-4f52-a5c9-4f6d5de12602'),(16,'Azerbaijan','AZ',NULL,16,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','82ec47e2-1be2-409b-9a1d-427e5522708f'),(17,'Bahamas','BS',NULL,17,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','7c0b660e-cce4-4579-af10-b369e8a924af'),(18,'Bahrain','BH',NULL,18,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','42260cc2-b190-4077-a8d3-3ff3bdae3c63'),(19,'Bangladesh','BD',NULL,19,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','e8c2eee6-0efd-4fc0-8dba-869a9cd7464b'),(20,'Barbados','BB',NULL,20,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','0ce28aa8-99a0-4245-8c6c-973f6b3f14d6'),(21,'Belarus','BY',NULL,21,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','87df4ffa-982f-469f-8a23-13dee4bfc1d9'),(22,'Belgium','BE',NULL,22,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','dec626dd-5113-4a98-b6d4-48f7dd3a61fd'),(23,'Belize','BZ',NULL,23,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','cbc94ce0-53b3-4dd9-a359-742d6ec5848b'),(24,'Benin','BJ',NULL,24,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','1df608fd-d8fe-4603-b38b-ef5664a57466'),(25,'Bermuda','BM',NULL,25,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','2c0bfb59-cd28-46c1-9282-589e4c1ebbe4'),(26,'Bhutan','BT',NULL,26,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','bb810458-e2fe-4682-add8-abdb40daaca2'),(27,'Bolivia','BO',NULL,27,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','d051544e-d29c-4bb8-ac2f-9244c74c2fc0'),(28,'Bonaire, Sint Eustatius and Saba','BQ',NULL,28,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','6a4c773d-51a4-4cb0-967a-e11b707ed4f6'),(29,'Bosnia and Herzegovina','BA',NULL,29,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','a7497a78-3b0f-4c27-9a22-34bfa58f53b8'),(30,'Botswana','BW',NULL,30,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','fddc2069-673c-432a-9294-73d1c677afb9'),(31,'Bouvet Island','BV',NULL,31,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','e7a9d9d0-d3a3-4735-ad53-9190ae936683'),(32,'Brazil','BR',NULL,32,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','231ea02e-109e-47c1-8a63-3c2c8710f07e'),(33,'British Indian Ocean Territory','IO',NULL,33,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','7134544f-4794-4e99-833f-39322ae05d80'),(34,'Brunei Darussalam','BN',NULL,34,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','b74f55ad-40dd-4f14-b58e-65a8983d8e01'),(35,'Bulgaria','BG',NULL,35,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','14bbc024-7a0d-4517-877b-60e16a8ca28a'),(36,'Burkina Faso','BF',NULL,36,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','7501808c-37d8-4188-9a30-59c2297c88cc'),(37,'Burma (Myanmar)','MM',NULL,37,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','f965dcce-c257-4214-a0a5-8e53de08fdbb'),(38,'Burundi','BI',NULL,38,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','53664a0f-c0a5-4d2d-a445-d605c352e691'),(39,'Cambodia','KH',NULL,39,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','4db35af3-01f3-4414-82a3-9cf77a324bb2'),(40,'Cameroon','CM',NULL,40,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','2294d94b-3a5d-4406-a463-bd81de8e0430'),(41,'Canada','CA',NULL,41,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','848f0065-44ea-487a-9dc6-31bf86e77a68'),(42,'Cape Verde','CV',NULL,42,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','55fceb19-cf84-4d8f-b828-13c0c5bd6714'),(43,'Cayman Islands','KY',NULL,43,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','756025ec-0da2-4970-81ad-12a305679fd4'),(44,'Central African Republic','CF',NULL,44,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','16f701e8-ef15-46ba-9ffd-7de4f5e66e62'),(45,'Chad','TD',NULL,45,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','fe8e5d0e-2597-4538-9c2d-9d145ba7d455'),(46,'Chile','CL',NULL,46,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','5bc94133-4a3e-49c5-a127-d2590a52b697'),(47,'China','CN',NULL,47,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','1b5286b6-7511-44b6-96b7-671c4dc1bd5a'),(48,'Christmas Island','CX',NULL,48,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','308e5b9c-df09-4342-8356-1628460b8502'),(49,'Cocos (Keeling) Islands','CC',NULL,49,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','15716a88-0846-4020-8847-da360c49b655'),(50,'Colombia','CO',NULL,50,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','42546c9c-36d5-4e45-aebe-907df06e0757'),(51,'Comoros','KM',NULL,51,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','66a0b63f-64b7-4c5d-a66d-bb38492dd1c7'),(52,'Congo','CG',NULL,52,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','0380c8a4-fad2-438d-9a6d-ee1f12b9afc8'),(53,'Cook Islands','CK',NULL,53,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','df63f053-1436-4efa-b169-7531a4c16e8c'),(54,'Costa Rica','CR',NULL,54,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','a923140a-7b37-480b-82ae-5f9569ec7a9a'),(55,'Croatia (Hrvatska)','HR',NULL,55,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','1f842e5a-20e7-4a86-86cc-7a914f32cad2'),(56,'Cuba','CU',NULL,56,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','9473dc01-d1eb-4914-b3b0-d52b29075f16'),(57,'Curacao','CW',NULL,57,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','22c896ba-1359-4097-b072-7bacaeef9e7a'),(58,'Cyprus','CY',NULL,58,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','fc906783-cba1-4d41-8b3a-329081baa9bc'),(59,'Czech Republic','CZ',NULL,59,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','294f1626-7442-49d2-b463-8ed839beee8e'),(60,'Democratic Republic of Congo','CD',NULL,60,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','5d3a188a-0b8e-4dec-8889-b396e5cb63f8'),(61,'Denmark','DK',NULL,61,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','cd97330a-7ec6-4338-91e4-5c127ce8a1bb'),(62,'Djibouti','DJ',NULL,62,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','09061d37-7cd6-4981-8b7c-3f923edd8cb6'),(63,'Dominica','DM',NULL,63,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','010922ed-78c6-4a02-a4fc-441b8cd3c67e'),(64,'Dominican Republic','DO',NULL,64,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','75f61b47-6244-4c87-a945-068c58ff5769'),(65,'Ecuador','EC',NULL,65,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','add7d228-defa-40f1-b6e4-e05d2d7cf4ea'),(66,'Egypt','EG',NULL,66,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','53c92731-69fc-432b-8d32-30be85ab9d6d'),(67,'El Salvador','SV',NULL,67,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','3f8082f3-70f3-4805-a150-8ccef3e84c24'),(68,'Equatorial Guinea','GQ',NULL,68,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','7eef07c9-2985-4d58-88c0-ab214323a41b'),(69,'Eritrea','ER',NULL,69,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','1ddbd016-5e4c-491f-8543-3ede6518839d'),(70,'Estonia','EE',NULL,70,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','9db10f16-b9ee-47a9-be4b-e30755f9cba8'),(71,'Ethiopia','ET',NULL,71,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','7a208dab-e2e8-4f5d-8129-ddbfdffbac15'),(72,'Falkland Islands (Malvinas)','FK',NULL,72,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','95afb88d-7c04-46f8-9a21-91449e78185f'),(73,'Faroe Islands','FO',NULL,73,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','3946d67d-5593-418e-9bb8-801110db8d60'),(74,'Fiji','FJ',NULL,74,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','cb70e8b0-139f-4c01-b90a-a1cb81d12860'),(75,'Finland','FI',NULL,75,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','206fe0c0-19b1-4dc9-834f-d6b3083c6909'),(76,'France','FR',NULL,76,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','55763648-6772-4671-b337-4137aca0bf23'),(77,'French Guiana','GF',NULL,77,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','b03a77e5-4250-4f1d-8b05-a5c39aeaa2cb'),(78,'French Polynesia','PF',NULL,78,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','ff98e741-dc2f-4eae-9ad3-e4138e495f01'),(79,'French Southern Territories','TF',NULL,79,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','f4532139-473e-4ec8-bb70-52ae4f69b119'),(80,'Gabon','GA',NULL,80,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','e854de32-adb4-4043-93e6-709456356b42'),(81,'Gambia','GM',NULL,81,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','cbe8e395-b09b-4d41-b468-225c9125fcbc'),(82,'Georgia','GE',NULL,82,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','25c16180-5af8-4ebd-b278-1098cb0e6514'),(83,'Germany','DE',NULL,83,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','4f4a5a07-70a0-4918-bb2e-c16e37985cd1'),(84,'Ghana','GH',NULL,84,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','e01efb44-080d-4123-afd3-6fabe3a8176e'),(85,'Gibraltar','GI',NULL,85,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','e00f560f-85a1-4be9-adb1-43512124441e'),(86,'Greece','GR',NULL,86,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','d719cef9-8616-44e1-8085-7b18a00bb760'),(87,'Greenland','GL',NULL,87,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','449d87ed-12ac-4df8-98b7-0e8e81a748f6'),(88,'Grenada','GD',NULL,88,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','f8f48a90-de09-4777-b13c-47d403aeb607'),(89,'Guadeloupe','GP',NULL,89,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','a1d59ca7-ace4-48ef-ac55-806d41324c1a'),(90,'Guam','GU',NULL,90,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','fe23287f-67ad-4cbf-8896-36f136b774ae'),(91,'Guatemala','GT',NULL,91,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','88a36d61-1bf3-4b57-8ef5-ec7a826b8b78'),(92,'Guernsey','GG',NULL,92,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','b1bc0d11-9c8b-4a21-a722-d45d3979ae3d'),(93,'Guinea','GN',NULL,93,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','7eb7be9d-a3cf-48d1-8daa-42a61b89d23d'),(94,'Guinea-Bissau','GW',NULL,94,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','d840e87d-9ecf-4f3a-a6f9-2563edb84a88'),(95,'Guyana','GY',NULL,95,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','109f02a4-11ad-477a-a9a3-6501bfad7cb5'),(96,'Haiti','HT',NULL,96,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','956ba1e3-5ac1-41ac-af79-d607d70fcc46'),(97,'Heard and McDonald Islands','HM',NULL,97,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','dd2c0ecd-8adc-4c53-970a-e27beee5fecb'),(98,'Honduras','HN',NULL,98,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','f1c2737e-d9da-4e17-9d7a-a9caba848ef8'),(99,'Hong Kong','HK',NULL,99,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','a9791833-1aeb-47fa-a326-89e7b260aea5'),(100,'Hungary','HU',NULL,100,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','23dcce91-e425-43dc-83b7-ec231138c8be'),(101,'Iceland','IS',NULL,101,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','9c4326d5-4e71-4063-9d07-9d7f4e48620a'),(102,'India','IN',NULL,102,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','60157349-f966-4b0f-a9c0-38a4aef7cd3d'),(103,'Indonesia','ID',NULL,103,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','941162d5-e86f-4688-9255-427c9b8fb02b'),(104,'Iran','IR',NULL,104,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','0b1d4b7f-061b-4344-ae34-fbc193dea6fa'),(105,'Iraq','IQ',NULL,105,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','003d48d1-c489-4427-8125-11521f4eb33f'),(106,'Ireland','IE',NULL,106,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','4ce0d7a0-be23-4667-923b-7e6bf0768f9b'),(107,'Isle Of Man','IM',NULL,107,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','bfdee9d5-f143-4ae8-9362-841593ee249b'),(108,'Israel','IL',NULL,108,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','a7932cc9-b908-4d2a-8d84-9826fb2b2f1d'),(109,'Italy','IT',NULL,109,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','09db0350-fb12-42c5-8492-61fe25fd3c38'),(110,'Ivory Coast','CI',NULL,110,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','33dc207f-a7cd-4d07-9efa-713352d176ae'),(111,'Jamaica','JM',NULL,111,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','65837d33-341c-421d-9d52-9e805314217c'),(112,'Japan','JP',NULL,112,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','d12b2e96-3bf3-43c2-92b0-2dbc9b1ccb3e'),(113,'Jersey','JE',NULL,113,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','c33a7b01-21ad-43be-bc9f-eba84773a147'),(114,'Jordan','JO',NULL,114,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','094fecfb-bf50-4d2c-a865-6c6a29395e58'),(115,'Kazakhstan','KZ',NULL,115,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','0e306933-6ebb-4393-bb66-45e489c33a06'),(116,'Kenya','KE',NULL,116,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','345c86b4-bd29-440b-8774-6c1d457bc92a'),(117,'Kiribati','KI',NULL,117,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','770c9daa-7112-4a1a-a4a7-2aa5ee039930'),(118,'Korea (North)','KP',NULL,118,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','72e5fe8a-163a-4e78-8ed0-d910b1255588'),(119,'Korea (South)','KR',NULL,119,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','e52464fb-afe3-4721-a108-458dbee0cbf2'),(120,'Kuwait','KW',NULL,120,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','c9f0acba-62e4-471e-a5f9-b8da0ba77a8d'),(121,'Kyrgyzstan','KG',NULL,121,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','4d4a68db-c558-437a-abdb-ad7ee2e3531d'),(122,'Laos','LA',NULL,122,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','11551dd8-d2e5-4c04-af11-55336905a4da'),(123,'Latvia','LV',NULL,123,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','2c859659-6368-464c-aca3-5e1eb684ab8f'),(124,'Lebanon','LB',NULL,124,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','13aa73a1-10d1-4693-8d08-dd795a8bbd11'),(125,'Lesotho','LS',NULL,125,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','772c4fe9-cbf8-4533-b0bf-5e3f91cc5a00'),(126,'Liberia','LR',NULL,126,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','977f4548-e791-43bc-b0c3-b45afeede7c0'),(127,'Libya','LY',NULL,127,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','6d566594-3f82-448b-a415-041b18ecc18f'),(128,'Liechtenstein','LI',NULL,128,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','3be20882-4fd5-403b-acca-b6b4fc8c58cf'),(129,'Lithuania','LT',NULL,129,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','b7f2c695-bc94-4f00-874f-dd4b7a1783b4'),(130,'Luxembourg','LU',NULL,130,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','4feeba3c-3320-44c6-b4dc-5bcb4ec6149d'),(131,'Macau','MO',NULL,131,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','7d7a59f1-3b0e-4907-b662-61112305aac2'),(132,'Macedonia','MK',NULL,132,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','38a81c62-00eb-4faa-b634-c1485eeacf68'),(133,'Madagascar','MG',NULL,133,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','177c2e0d-46c8-4f15-bfe1-ca4a02874b17'),(134,'Malawi','MW',NULL,134,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','0e799fbd-ce16-4adb-bb36-de46bf59273f'),(135,'Malaysia','MY',NULL,135,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','55c44bad-b97b-4e3a-ac73-75f37f8058bb'),(136,'Maldives','MV',NULL,136,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','dc539a25-e9db-48b3-8ad8-df4d9d0e3865'),(137,'Mali','ML',NULL,137,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','c895b53f-d5d8-4c76-b150-f2a722fbbde8'),(138,'Malta','MT',NULL,138,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','bb6fd26d-f55c-446a-8aea-519629d590f3'),(139,'Marshall Islands','MH',NULL,139,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','673b4252-9f6d-43d7-9b82-32ba11944806'),(140,'Martinique','MQ',NULL,140,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','bcc129b2-c0ce-432f-88c5-f37afa409777'),(141,'Mauritania','MR',NULL,141,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','55266a2b-35e2-4d81-8029-a9b0fe38a03c'),(142,'Mauritius','MU',NULL,142,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','b8d45955-b87d-459d-aed2-5faa57f929da'),(143,'Mayotte','YT',NULL,143,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','5d4d56c4-9876-4f3d-8b52-f394f450aa52'),(144,'Mexico','MX',NULL,144,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','0e40a671-0dbc-4754-a728-31708d2b46ee'),(145,'Micronesia','FM',NULL,145,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','1162b8e6-1a79-41c9-bf2a-97c69760237a'),(146,'Moldova','MD',NULL,146,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','6e2fef3b-7177-4609-980b-56946f97f5bc'),(147,'Monaco','MC',NULL,147,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','2d4801a0-f35a-4b9a-8437-7930e568a114'),(148,'Mongolia','MN',NULL,148,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','c1e69876-11c6-4946-8f06-9db57815e472'),(149,'Montenegro','ME',NULL,149,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','d4b0a95c-5967-4d42-b6a3-015145aa7a78'),(150,'Montserrat','MS',NULL,150,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','e3514510-8006-4e91-9c2a-773cba586056'),(151,'Morocco','MA',NULL,151,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','c149c29a-4a6a-4ad5-82c6-157fb9cb3546'),(152,'Mozambique','MZ',NULL,152,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','6b5c4209-9320-43e2-89bc-ed0ebb7f3047'),(153,'Namibia','NA',NULL,153,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','469c341b-eae4-48a9-a276-ba2b0807d6b5'),(154,'Nauru','NR',NULL,154,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','c4211adb-0a9e-4437-9f54-04d91a7ccf50'),(155,'Nepal','NP',NULL,155,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','3a752d2c-eeb9-423f-8858-035c7f03a7f8'),(156,'Netherlands','NL',NULL,156,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','60b71219-8438-4194-b183-7237de9311c0'),(157,'New Caledonia','NC',NULL,157,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','ecb946d2-6bf5-4890-abb8-ca7c227edf52'),(158,'New Zealand','NZ',NULL,158,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','cc076cfd-e0aa-4d03-afdf-5735c0d8ba54'),(159,'Nicaragua','NI',NULL,159,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','ec502598-416b-465f-8877-5c8d789e0359'),(160,'Niger','NE',NULL,160,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','a5b99b62-7d3c-4c10-8a8b-22d8be3969f6'),(161,'Nigeria','NG',NULL,161,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','96423fb1-58e2-47c2-afa5-a1277ef1ada0'),(162,'Niue','NU',NULL,162,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','d9c6e1ef-2947-4bb1-b6b0-70b266c32b65'),(163,'Norfolk Island','NF',NULL,163,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','459364ce-d2b8-49c4-aef5-6435722e8bb8'),(164,'Northern Mariana Islands','MP',NULL,164,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','425754be-a2b3-4054-9ab6-053aeb8309e7'),(165,'Norway','NO',NULL,165,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','a75df2b1-f1e3-4f23-93cb-d39677993896'),(166,'Oman','OM',NULL,166,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','0a784417-0083-4bd2-93bf-9cf2362b3cef'),(167,'Pakistan','PK',NULL,167,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','7917436c-31aa-4fa1-afe2-46e4545767a1'),(168,'Palau','PW',NULL,168,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','a3e4007c-85d2-4092-a716-5837345af937'),(169,'Palestinian Territory, Occupied','PS',NULL,169,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','2c8a19ad-a779-4498-b5c4-c45cb71aab9b'),(170,'Panama','PA',NULL,170,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','35e3d8b7-f492-49fc-bbbc-7e53785ade7a'),(171,'Papua New Guinea','PG',NULL,171,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','c994c830-d762-461f-b36a-8ffb6235433b'),(172,'Paraguay','PY',NULL,172,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','8fe73717-2e38-4862-a3cf-0cbb4eba224e'),(173,'Peru','PE',NULL,173,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','a239b711-60e2-4ed1-a88f-df0e4ef98630'),(174,'Philippines','PH',NULL,174,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','bc91cbd9-e809-4756-b740-5a65ecabab39'),(175,'Pitcairn','PN',NULL,175,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','b0c77d5e-79ac-49bd-94d2-c04b519e4fa0'),(176,'Poland','PL',NULL,176,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','88203589-2baa-407a-a107-63274184f06a'),(177,'Portugal','PT',NULL,177,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','f6c575a9-1cf0-4484-b3f2-fc62d7342742'),(178,'Puerto Rico','PR',NULL,178,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','139bfcba-332c-4f69-9ec5-c5c04345c835'),(179,'Qatar','QA',NULL,179,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','cff4401a-c504-4363-8d8e-88ccecd6fbdd'),(180,'Republic of Serbia','RS',NULL,180,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','afe6205e-fb37-4098-8bd7-7155811a7966'),(181,'Reunion','RE',NULL,181,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','d71d5e00-defd-42b9-865f-24c9acdb2ef3'),(182,'Romania','RO',NULL,182,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','fb8e8fcf-d8c4-4f0b-8a44-446fd91a675b'),(183,'Russia','RU',NULL,183,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','1220820e-d0fe-4fb5-9141-1a018affc4dd'),(184,'Rwanda','RW',NULL,184,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','b1e3511b-1a7f-40b1-b711-5b2a4b4a6547'),(185,'S. Georgia and S. Sandwich Isls.','GS',NULL,185,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','496ee422-339e-426c-abc2-6e85de97633e'),(186,'Saint Barthelemy','BL',NULL,186,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','2721a1e4-eabb-415e-8073-b2b9856eb522'),(187,'Saint Kitts and Nevis','KN',NULL,187,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','80defbf1-5b6d-48c1-b14a-24c29218f4e3'),(188,'Saint Lucia','LC',NULL,188,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','522ace05-ce87-45c5-b602-9af20930806a'),(189,'Saint Martin (French part)','MF',NULL,189,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','6f574557-5eee-49c6-b087-9a7b6397e71c'),(190,'Saint Vincent and the Grenadines','VC',NULL,190,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','c86001c6-ac21-4a07-9db3-fe4bf9b9bbbb'),(191,'Samoa','WS',NULL,191,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','861a8745-942a-4785-9823-76a44c5b6490'),(192,'San Marino','SM',NULL,192,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','26de2af5-57aa-4064-9f30-c1cb64918355'),(193,'Sao Tome and Principe','ST',NULL,193,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','e381526d-47cf-45bb-b0d7-f7552eaa84a3'),(194,'Saudi Arabia','SA',NULL,194,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','8ed908d6-91f2-4a11-afa4-c69a94e55bc7'),(195,'Senegal','SN',NULL,195,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','7d36e1ea-b843-4baf-a605-76e87df89187'),(196,'Seychelles','SC',NULL,196,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','4e570929-deec-45b9-aea2-237b8f733a35'),(197,'Sierra Leone','SL',NULL,197,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','eb97c9cf-1330-4252-bad6-b7e6d1884b3c'),(198,'Singapore','SG',NULL,198,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','372cc664-072d-4de6-8023-3a936fc51bff'),(199,'Sint Maarten (Dutch part)','SX',NULL,199,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','af79e73a-a163-4532-9808-20e8f4cfdf8d'),(200,'Slovak Republic','SK',NULL,200,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','f7f3fe9e-6f85-4446-8096-b05346ae4bb5'),(201,'Slovenia','SI',NULL,201,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','9e933d1d-0e6f-466b-82ca-ef767fa90657'),(202,'Solomon Islands','SB',NULL,202,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','88695dcf-5d6b-45f7-abbd-017278d8db3c'),(203,'Somalia','SO',NULL,203,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','96cfe9d6-1100-4048-aafc-03908f70b608'),(204,'South Africa','ZA',NULL,204,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','84ab3571-856c-47c2-9f80-68943674effc'),(205,'South Sudan','SS',NULL,205,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','38f22e0e-3935-4432-8c7d-bffeb98722ef'),(206,'Spain','ES',NULL,206,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','1ffcd191-3434-4de9-b2df-c3c3b1b7a3d2'),(207,'Sri Lanka','LK',NULL,207,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','203b4ce1-2357-4b52-b320-9d502a5b9f08'),(208,'St. Helena','SH',NULL,208,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','3bd23065-401d-4789-b441-4920c36ae993'),(209,'St. Pierre and Miquelon','PM',NULL,209,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','5bc0a4c2-f1a2-43cb-a841-f3b77ec8b443'),(210,'Sudan','SD',NULL,210,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','98134a18-1095-4261-8533-838be40cca86'),(211,'Suriname','SR',NULL,211,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','7a112541-a9a5-491c-8db8-ccfdce1d6afc'),(212,'Svalbard and Jan Mayen Islands','SJ',NULL,212,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','dc3786b7-f565-47cb-b67c-438f101c8c56'),(213,'Swaziland','SZ',NULL,213,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','59cfbba8-6741-4907-a505-4feea38f642e'),(214,'Sweden','SE',NULL,214,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','1c895efd-1e78-4c3d-996e-0f5985cea4c2'),(215,'Switzerland','CH',NULL,215,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','254fa763-c210-4e7b-a8da-ab996eeb0f37'),(216,'Syria','SY',NULL,216,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','a969058f-d5a4-4c19-89e3-713e92308365'),(217,'Taiwan','TW',NULL,217,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','2eb7bf49-020d-4856-9a75-cd72983250b4'),(218,'Tajikistan','TJ',NULL,218,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','36acf98b-c0a6-49a7-840f-0f15e335d86c'),(219,'Tanzania','TZ',NULL,219,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','ef033ba1-3b2a-45fa-ac5a-68dd3f7de37c'),(220,'Thailand','TH',NULL,220,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','92ba86d0-fced-433d-b7fd-1da439dd4fca'),(221,'Timor-Leste','TL',NULL,221,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','9c6458ec-c994-4aa8-b094-959e643a60ee'),(222,'Togo','TG',NULL,222,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','641bbd37-3992-43d4-88ce-2c3f271fff63'),(223,'Tokelau','TK',NULL,223,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','fe958d90-ce6e-4124-9c2f-a6c9017a0588'),(224,'Tonga','TO',NULL,224,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','42ab1d75-47b0-498a-bffa-5e6a4bc922e2'),(225,'Trinidad and Tobago','TT',NULL,225,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','e01f0ced-cbbc-4c35-adf6-432a81be44bf'),(226,'Tunisia','TN',NULL,226,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','4e71a07e-7327-458b-aae2-2418135acdc5'),(227,'Turkey','TR',NULL,227,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','22e2359a-0732-4dfb-9728-5db1ef3235f7'),(228,'Turkmenistan','TM',NULL,228,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','ca895a28-2d38-4833-8679-a2d4c86ea029'),(229,'Turks and Caicos Islands','TC',NULL,229,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','bf6c8292-4b79-4a08-952e-ea0fa6ee41cc'),(230,'Tuvalu','TV',NULL,230,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','5ca4a4b0-0457-49f5-8f5d-309afc51136e'),(231,'Uganda','UG',NULL,231,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','638fbcf0-dfac-42b6-8b7b-35387f757912'),(232,'Ukraine','UA',NULL,232,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','ad9cc0c0-688f-4808-833a-8d1f3d9d6540'),(233,'United Arab Emirates','AE',NULL,233,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','2393773f-ddcd-4f18-bebc-485acc2a0116'),(234,'United Kingdom','GB',NULL,234,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','1dde270b-3397-4a44-be13-d2fcca392bf8'),(235,'United States Minor Outlying Islands','UM',NULL,235,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','fec0cc17-6267-4887-ba4d-da7d48cf8597'),(236,'United States','US',NULL,236,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','7ac1434f-12f5-46d6-b871-995bb3a13494'),(237,'Uruguay','UY',NULL,237,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','135fb786-a7c9-43c1-aa0a-42494133135c'),(238,'Uzbekistan','UZ',NULL,238,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','b6d8a8f6-ccaa-4953-bd69-9cdf3a8a1abf'),(239,'Vanuatu','VU',NULL,239,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','712dc568-9f14-4bc8-9b0b-03acd4430d19'),(240,'Vatican City State (Holy See)','VA',NULL,240,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','4962e3f0-2a85-4722-b970-3463d71bd79c'),(241,'Venezuela','VE',NULL,241,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','b5d65b94-3969-4719-9ad6-ca3897b021fa'),(242,'Viet Nam','VN',NULL,242,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','0f0af80a-20f7-4cf7-9347-40524441cee9'),(243,'Virgin Islands (British)','VG',NULL,243,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','2dbda479-251d-4b05-af22-c524281a3afd'),(244,'Virgin Islands (U.S.)','VI',NULL,244,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','21ef73b2-56f3-4a37-9da0-6ae9d970853a'),(245,'Wallis and Futuna Islands','WF',NULL,245,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','424d5c9d-37d7-4af4-89f6-dead4daab748'),(246,'Western Sahara','EH',NULL,246,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','2d2aa8e2-f9a8-45ca-a73b-55473a1bf8c1'),(247,'Yemen','YE',NULL,247,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','f2851dc9-8858-4480-9207-71157d539049'),(248,'Zambia','ZM',NULL,248,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','14dcad96-edde-4ed7-a40d-ffc6cc2d1f2d'),(249,'Zimbabwe','ZW',NULL,249,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','ebcfcd67-02e8-4d3d-95b3-1a2de96feea8');
/*!40000 ALTER TABLE `commerce_countries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_customer_discountuses`
--

LOCK TABLES `commerce_customer_discountuses` WRITE;
/*!40000 ALTER TABLE `commerce_customer_discountuses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_customer_discountuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_customers`
--

LOCK TABLES `commerce_customers` WRITE;
/*!40000 ALTER TABLE `commerce_customers` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_customers` VALUES (1,1,NULL,NULL,'2021-04-01 00:17:22','2021-04-01 00:17:22','987f185c-acfa-43fb-8d41-0ba52dd41e49');
/*!40000 ALTER TABLE `commerce_customers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_customers_addresses`
--

LOCK TABLES `commerce_customers_addresses` WRITE;
/*!40000 ALTER TABLE `commerce_customers_addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_customers_addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_discount_categories`
--

LOCK TABLES `commerce_discount_categories` WRITE;
/*!40000 ALTER TABLE `commerce_discount_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_discount_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_discount_purchasables`
--

LOCK TABLES `commerce_discount_purchasables` WRITE;
/*!40000 ALTER TABLE `commerce_discount_purchasables` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_discount_purchasables` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_discount_usergroups`
--

LOCK TABLES `commerce_discount_usergroups` WRITE;
/*!40000 ALTER TABLE `commerce_discount_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_discount_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_discounts`
--

LOCK TABLES `commerce_discounts` WRITE;
/*!40000 ALTER TABLE `commerce_discounts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_discounts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_donations`
--

LOCK TABLES `commerce_donations` WRITE;
/*!40000 ALTER TABLE `commerce_donations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_donations` VALUES (3,'DONATION-CC3',0,'2021-03-15 15:24:15','2021-03-15 15:24:15','6c437040-2f23-43ab-8e7d-83bfc53a021a');
/*!40000 ALTER TABLE `commerce_donations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_email_discountuses`
--

LOCK TABLES `commerce_email_discountuses` WRITE;
/*!40000 ALTER TABLE `commerce_email_discountuses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_email_discountuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_emails`
--

LOCK TABLES `commerce_emails` WRITE;
/*!40000 ALTER TABLE `commerce_emails` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_emails` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_gateways`
--

LOCK TABLES `commerce_gateways` WRITE;
/*!40000 ALTER TABLE `commerce_gateways` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_gateways` VALUES (1,'craft\\commerce\\gateways\\Dummy','Dummy','dummy',NULL,'purchase',1,0,NULL,99,'2021-03-15 15:24:16','2021-03-15 15:24:16','6a117ef0-054c-4147-acb6-6fe57d48c4ae');
/*!40000 ALTER TABLE `commerce_gateways` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_lineitems`
--

LOCK TABLES `commerce_lineitems` WRITE;
/*!40000 ALTER TABLE `commerce_lineitems` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_lineitems` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_lineitemstatuses`
--

LOCK TABLES `commerce_lineitemstatuses` WRITE;
/*!40000 ALTER TABLE `commerce_lineitemstatuses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_lineitemstatuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderadjustments`
--

LOCK TABLES `commerce_orderadjustments` WRITE;
/*!40000 ALTER TABLE `commerce_orderadjustments` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_orderadjustments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderhistories`
--

LOCK TABLES `commerce_orderhistories` WRITE;
/*!40000 ALTER TABLE `commerce_orderhistories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_orderhistories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_ordernotices`
--

LOCK TABLES `commerce_ordernotices` WRITE;
/*!40000 ALTER TABLE `commerce_ordernotices` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_ordernotices` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orders`
--

LOCK TABLES `commerce_orders` WRITE;
/*!40000 ALTER TABLE `commerce_orders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_orders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderstatus_emails`
--

LOCK TABLES `commerce_orderstatus_emails` WRITE;
/*!40000 ALTER TABLE `commerce_orderstatus_emails` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_orderstatus_emails` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderstatuses`
--

LOCK TABLES `commerce_orderstatuses` WRITE;
/*!40000 ALTER TABLE `commerce_orderstatuses` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_orderstatuses` VALUES (1,'New','new','green',NULL,NULL,99,1,'2021-03-15 15:24:16','2021-03-15 15:24:16','f923795f-139e-4b59-b27c-eaa0be4f847c');
/*!40000 ALTER TABLE `commerce_orderstatuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_paymentcurrencies`
--

LOCK TABLES `commerce_paymentcurrencies` WRITE;
/*!40000 ALTER TABLE `commerce_paymentcurrencies` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_paymentcurrencies` VALUES (1,'USD',1,1.0000,'2021-03-15 15:24:15','2021-03-15 15:24:15','11f95717-e061-4219-adea-b05ec031be5f');
/*!40000 ALTER TABLE `commerce_paymentcurrencies` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_paymentsources`
--

LOCK TABLES `commerce_paymentsources` WRITE;
/*!40000 ALTER TABLE `commerce_paymentsources` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_paymentsources` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_pdfs`
--

LOCK TABLES `commerce_pdfs` WRITE;
/*!40000 ALTER TABLE `commerce_pdfs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_pdfs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_plans`
--

LOCK TABLES `commerce_plans` WRITE;
/*!40000 ALTER TABLE `commerce_plans` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_plans` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_products`
--

LOCK TABLES `commerce_products` WRITE;
/*!40000 ALTER TABLE `commerce_products` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_products` VALUES (4,1,1,1,5,'2021-03-15 15:24:16',NULL,1,1,0,'ANT-001',20.0000,0.0000,0.0000,0.0000,0.0000,'2021-03-15 15:24:16','2021-03-15 15:24:21','00179010-57ba-4a8a-a9d6-620c1b3a6cac'),(6,1,1,1,7,'2021-03-15 15:24:16',NULL,1,1,0,'PSB-001',30.0000,0.0000,0.0000,0.0000,0.0000,'2021-03-15 15:24:16','2021-03-15 15:24:21','8e3e5961-d7eb-4b55-915d-a2f6246a8ade'),(8,1,1,1,9,'2021-03-15 15:24:16',NULL,1,1,0,'RRE-001',40.0000,0.0000,0.0000,0.0000,0.0000,'2021-03-15 15:24:16','2021-03-15 15:24:21','f1a2a46a-b542-4ddb-9838-020192cb1b3d'),(10,1,1,1,11,'2021-03-15 15:24:16',NULL,1,1,0,'TFA-001',50.0000,0.0000,0.0000,0.0000,0.0000,'2021-03-15 15:24:16','2021-03-15 15:24:21','b4a9d0a6-ba45-43ca-a3a2-bb10bcf8f4d5'),(12,1,1,1,13,'2021-03-15 15:24:16',NULL,1,1,0,'LKH-001',60.0000,0.0000,0.0000,0.0000,0.0000,'2021-03-15 15:24:16','2021-03-15 15:24:21','a3cd6bbf-6239-4eda-9469-0f8182aa93fa'),(14,1,1,1,15,'2021-03-15 15:24:16',NULL,1,1,0,'FDB-001',70.0000,0.0000,0.0000,0.0000,0.0000,'2021-03-15 15:24:16','2021-03-15 15:24:21','7b255844-afcd-41c1-97a9-5a907491dfeb');
/*!40000 ALTER TABLE `commerce_products` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes`
--

LOCK TABLES `commerce_producttypes` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_producttypes` VALUES (1,3,NULL,'Clothing','clothing',1,0,1,'{product.title}',1,'','','','2021-03-15 15:24:16','2021-03-15 15:24:16','407fe253-2ada-4a88-b1a4-fb6c2004cd9b');
/*!40000 ALTER TABLE `commerce_producttypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes_shippingcategories`
--

LOCK TABLES `commerce_producttypes_shippingcategories` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes_shippingcategories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_producttypes_shippingcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes_sites`
--

LOCK TABLES `commerce_producttypes_sites` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_producttypes_sites` VALUES (1,1,1,'shop/products/{slug}','shop/products/_product',1,'2021-03-15 15:24:16','2021-03-15 15:24:16','48930b4a-86f5-4a07-a19f-7950f77a9a97'),(2,1,2,'shop/products/{slug}','shop/products/_product',1,'2021-03-15 15:24:16','2021-03-15 15:24:16','799fbb49-ceae-47ae-81a9-516b724418b7');
/*!40000 ALTER TABLE `commerce_producttypes_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes_taxcategories`
--

LOCK TABLES `commerce_producttypes_taxcategories` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes_taxcategories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_producttypes_taxcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_purchasables`
--

LOCK TABLES `commerce_purchasables` WRITE;
/*!40000 ALTER TABLE `commerce_purchasables` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_purchasables` VALUES (3,'DONATION-CC3',0.0000,'Donation','2021-03-15 15:24:15','2021-03-15 15:24:15','1a0ab098-f27a-49aa-a337-dfdae887ca7d'),(5,'ANT-001',20.0000,'A New Toga','2021-03-15 15:24:16','2021-03-15 15:24:21','73264057-2687-4bba-8398-f114d12d9b90'),(7,'PSB-001',30.0000,'Parka With Stripes On Back','2021-03-15 15:24:16','2021-03-15 15:24:21','e57d56e9-0636-41a0-9ab2-17a81fcf5bbb'),(9,'RRE-001',40.0000,'Romper For A Red Eye','2021-03-15 15:24:16','2021-03-15 15:24:21','36c0fd4f-9802-4acd-b105-a3227904e4ed'),(11,'TFA-001',50.0000,'The Fleece Awakens','2021-03-15 15:24:16','2021-03-15 15:24:21','d8b920b2-c4ed-4b8a-86f6-0025e833efe1'),(13,'LKH-001',60.0000,'The Last Knee-High','2021-03-15 15:24:16','2021-03-15 15:24:21','a6671fad-f0da-4f4d-956e-2bcfee0eb38a'),(15,'FDB-001',70.0000,'Full-Size Dry Boxer','2021-03-15 15:24:16','2021-03-15 15:24:21','d1c8b184-8d42-4d13-b74c-e9c09f3ed763');
/*!40000 ALTER TABLE `commerce_purchasables` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sale_categories`
--

LOCK TABLES `commerce_sale_categories` WRITE;
/*!40000 ALTER TABLE `commerce_sale_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sale_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sale_purchasables`
--

LOCK TABLES `commerce_sale_purchasables` WRITE;
/*!40000 ALTER TABLE `commerce_sale_purchasables` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sale_purchasables` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sale_usergroups`
--

LOCK TABLES `commerce_sale_usergroups` WRITE;
/*!40000 ALTER TABLE `commerce_sale_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sale_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sales`
--

LOCK TABLES `commerce_sales` WRITE;
/*!40000 ALTER TABLE `commerce_sales` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sales` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingcategories`
--

LOCK TABLES `commerce_shippingcategories` WRITE;
/*!40000 ALTER TABLE `commerce_shippingcategories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_shippingcategories` VALUES (1,'General','general',NULL,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','be10562c-0b2f-4a6a-a7f5-58fb319bec36');
/*!40000 ALTER TABLE `commerce_shippingcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingmethods`
--

LOCK TABLES `commerce_shippingmethods` WRITE;
/*!40000 ALTER TABLE `commerce_shippingmethods` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_shippingmethods` VALUES (1,'Free Shipping','freeShipping',1,NULL,'2021-03-15 15:24:15','2021-03-15 15:24:15','6653ddfe-01e0-43d2-b243-19c23010c8bd');
/*!40000 ALTER TABLE `commerce_shippingmethods` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingrule_categories`
--

LOCK TABLES `commerce_shippingrule_categories` WRITE;
/*!40000 ALTER TABLE `commerce_shippingrule_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_shippingrule_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingrules`
--

LOCK TABLES `commerce_shippingrules` WRITE;
/*!40000 ALTER TABLE `commerce_shippingrules` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_shippingrules` VALUES (1,NULL,1,'Free Everywhere','All Countries, free shipping.',0,1,0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,'2021-03-15 15:24:15','2021-03-15 15:24:15','44d05ef5-eb54-4292-b582-3d474bd45191','salePrice',NULL);
/*!40000 ALTER TABLE `commerce_shippingrules` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingzone_countries`
--

LOCK TABLES `commerce_shippingzone_countries` WRITE;
/*!40000 ALTER TABLE `commerce_shippingzone_countries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_shippingzone_countries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingzone_states`
--

LOCK TABLES `commerce_shippingzone_states` WRITE;
/*!40000 ALTER TABLE `commerce_shippingzone_states` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_shippingzone_states` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingzones`
--

LOCK TABLES `commerce_shippingzones` WRITE;
/*!40000 ALTER TABLE `commerce_shippingzones` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_shippingzones` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_states`
--

LOCK TABLES `commerce_states` WRITE;
/*!40000 ALTER TABLE `commerce_states` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_states` VALUES (1,14,'Australian Capital Territory','ACT',1,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','43fb849f-3b98-4b8e-bef0-f31b466e58d4'),(2,14,'New South Wales','NSW',2,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','dcd5ebb4-0163-4bd5-bc80-d474a6d4d852'),(3,14,'Northern Territory','NT',3,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','5f01255e-0a6e-4c09-b617-b3ccc0d49d95'),(4,14,'Queensland','QLD',4,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','43369461-d0d6-40e4-be0e-73184ad83ccb'),(5,14,'South Australia','SA',5,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','f53d1e3c-0267-4b8e-b323-e81e9e5d4379'),(6,14,'Tasmania','TAS',6,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','31b3ec15-4ff2-4db0-850f-e17651f560f7'),(7,14,'Victoria','VIC',7,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','550c579f-9ca5-4d5c-84d0-1c3b3a970b30'),(8,14,'Western Australia','WA',8,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','784d98ac-539d-4e5b-9314-077e6983cf48'),(9,41,'Alberta','AB',1,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','76ff57a8-ab59-4427-9608-14ba03bd6f69'),(10,41,'British Columbia','BC',2,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','eb4750ff-800a-4507-b6cd-f87149565d38'),(11,41,'Manitoba','MB',3,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','e963d460-5508-457a-84bb-fbef5a85cc30'),(12,41,'New Brunswick','NB',4,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','bda188d2-1a84-41d1-8ec1-82b36ab65883'),(13,41,'Newfoundland and Labrador','NL',5,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','26264746-07de-4786-9c31-d7c16345e280'),(14,41,'Northwest Territories','NT',6,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','de3fbc57-7625-4006-a1f3-c7b33cae9b56'),(15,41,'Nova Scotia','NS',7,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','6ba235fe-5ebf-4f7c-96e1-9f4b1bde1d09'),(16,41,'Nunavut','NU',8,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','f49521d2-6557-404a-ba79-496ffbf6ed02'),(17,41,'Ontario','ON',9,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','1de02a8f-b841-47c4-b9bf-51af060374b1'),(18,41,'Prince Edward Island','PE',10,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','8050ebb4-83e4-41f3-8265-6f606fa143f6'),(19,41,'Quebec','QC',11,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','44794474-6670-44e6-809a-be6755de1f3b'),(20,41,'Saskatchewan','SK',12,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','26c28206-28be-4403-9b75-93481d1bf552'),(21,41,'Yukon','YT',13,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','fae7001c-314e-4b6f-a409-8d027f2bf417'),(22,236,'Alabama','AL',1,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','4ef34472-fdc6-4553-a0fa-8e392bb8f25d'),(23,236,'Alaska','AK',2,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','23727347-465c-40ed-b04a-f085ba562ff8'),(24,236,'Arizona','AZ',3,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','e8c250e3-2734-46e0-af56-9f028530cc9e'),(25,236,'Arkansas','AR',4,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','83da0737-79e6-4725-bf53-f614efd9fdbb'),(26,236,'California','CA',5,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','bf22ba0c-c81e-4418-879d-5b5b93645c6a'),(27,236,'Colorado','CO',6,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','74a3a801-5174-4c1b-af0c-cf0574cbf753'),(28,236,'Connecticut','CT',7,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','33f0a9de-0ad9-40b2-98ab-98e58ce622ab'),(29,236,'Delaware','DE',8,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','91156b65-f21d-4934-9131-0f27b46e9b61'),(30,236,'District of Columbia','DC',9,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','b331376b-fde4-40b1-9647-aabe3a3b4140'),(31,236,'Florida','FL',10,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','dc1b07d7-bc54-4861-8936-c97190481f6f'),(32,236,'Georgia','GA',11,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','464fc09b-7dcc-45a1-b421-c3a064c9303a'),(33,236,'Hawaii','HI',12,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','fe281885-0e5f-4734-af41-2778baeaae23'),(34,236,'Idaho','ID',13,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','33219f6a-b322-454d-8066-4872954f047e'),(35,236,'Illinois','IL',14,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','85de4322-4635-4328-99d5-4a111990edd8'),(36,236,'Indiana','IN',15,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','a325bb9e-374b-4c59-99c6-631d2dfc9477'),(37,236,'Iowa','IA',16,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','14b33ed4-c9a0-4581-babf-1c74997961d5'),(38,236,'Kansas','KS',17,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','913b893a-1d84-4989-bdd4-bf3205b0d6b0'),(39,236,'Kentucky','KY',18,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','755c0a5c-1834-41e7-9864-65792e4f3560'),(40,236,'Louisiana','LA',19,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','b2334e14-64c5-4413-b2cf-71dbca809222'),(41,236,'Maine','ME',20,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','977e85cb-6cf9-4953-b62e-51708e9f0512'),(42,236,'Maryland','MD',21,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','f3da3768-ce15-439e-b0df-530b164a6044'),(43,236,'Massachusetts','MA',22,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','47521db9-8aa7-45c2-a825-8e6bb6737276'),(44,236,'Michigan','MI',23,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','a695d383-a2d8-4eb1-be16-ed28189b496f'),(45,236,'Minnesota','MN',24,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','6a937388-ca1f-4dcb-8dd4-5ae7b1509db1'),(46,236,'Mississippi','MS',25,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','0892e4b9-3db4-4cb6-930f-29b55833616f'),(47,236,'Missouri','MO',26,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','5cf93175-480e-4a99-b3cf-6085393fade8'),(48,236,'Montana','MT',27,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','b0e4d214-c179-4ebb-b1fe-eb5fce8b09c1'),(49,236,'Nebraska','NE',28,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','905d1f47-3efa-4509-97b2-0787e9be9a67'),(50,236,'Nevada','NV',29,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','238ccd6a-9e0b-4203-a0ed-8356d22146bf'),(51,236,'New Hampshire','NH',30,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','bd7bac65-94cd-4b46-b763-568ceccac517'),(52,236,'New Jersey','NJ',31,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','54d93feb-ba3d-4a35-a5b1-00c4bbe791c1'),(53,236,'New Mexico','NM',32,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','1f4e6b8f-76a6-46c0-9f7f-18bb78795b21'),(54,236,'New York','NY',33,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','5b83a87f-9b8a-4208-b985-ea8bb5625f22'),(55,236,'North Carolina','NC',34,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','fd54e66d-df04-4fae-bde5-2dc7281f1ab8'),(56,236,'North Dakota','ND',35,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','94a88110-9ed8-4c60-8e69-915f55392fbe'),(57,236,'Ohio','OH',36,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','f66e5bfc-bc7a-4ff1-a879-25b385dc33b3'),(58,236,'Oklahoma','OK',37,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','0c15f968-f84e-4f0b-93b3-0342691c3814'),(59,236,'Oregon','OR',38,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','47454337-8307-4d94-bfb6-634131ccdb88'),(60,236,'Pennsylvania','PA',39,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','0817d46d-0e49-4fbd-bf35-6db9fa377842'),(61,236,'Rhode Island','RI',40,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','0debcca0-5cd1-405f-a618-2307a60c83e3'),(62,236,'South Carolina','SC',41,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','45b8ec5c-7c27-49b8-bbec-5e24bea58350'),(63,236,'South Dakota','SD',42,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','7b1a8197-44ef-4416-8911-56573d9eba4f'),(64,236,'Tennessee','TN',43,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','a036b7dd-5558-45be-bf35-6e798dc679b6'),(65,236,'Texas','TX',44,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','63b90cce-868f-4d98-b677-5053d4f76b1e'),(66,236,'Utah','UT',45,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','1a98a1be-b6a1-4a34-bc19-c0b0dc31106d'),(67,236,'Vermont','VT',46,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','277e8bb4-84b3-47b0-869f-02b279c6620f'),(68,236,'Virginia','VA',47,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','a9ccd87f-2b22-42c6-84d5-2aba5396cfd9'),(69,236,'Washington','WA',48,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','02b620e8-bdc4-4791-aacd-ae0b17463f60'),(70,236,'West Virginia','WV',49,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','cf2fe7b7-b490-46da-b575-49175f38b80a'),(71,236,'Wisconsin','WI',50,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','56f7135a-595a-456d-a0ba-ae4dc8881eb2'),(72,236,'Wyoming','WY',51,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','16989935-0609-46f7-9b3e-ddbea4930c6f');
/*!40000 ALTER TABLE `commerce_states` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_subscriptions`
--

LOCK TABLES `commerce_subscriptions` WRITE;
/*!40000 ALTER TABLE `commerce_subscriptions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxcategories`
--

LOCK TABLES `commerce_taxcategories` WRITE;
/*!40000 ALTER TABLE `commerce_taxcategories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_taxcategories` VALUES (1,'General','general',NULL,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','c0e9ddb3-5718-4a8a-a869-1d8605eefd99');
/*!40000 ALTER TABLE `commerce_taxcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxrates`
--

LOCK TABLES `commerce_taxrates` WRITE;
/*!40000 ALTER TABLE `commerce_taxrates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_taxrates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxzone_countries`
--

LOCK TABLES `commerce_taxzone_countries` WRITE;
/*!40000 ALTER TABLE `commerce_taxzone_countries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_taxzone_countries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxzone_states`
--

LOCK TABLES `commerce_taxzone_states` WRITE;
/*!40000 ALTER TABLE `commerce_taxzone_states` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_taxzone_states` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxzones`
--

LOCK TABLES `commerce_taxzones` WRITE;
/*!40000 ALTER TABLE `commerce_taxzones` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_taxzones` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_transactions`
--

LOCK TABLES `commerce_transactions` WRITE;
/*!40000 ALTER TABLE `commerce_transactions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_transactions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_variants`
--

LOCK TABLES `commerce_variants` WRITE;
/*!40000 ALTER TABLE `commerce_variants` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_variants` VALUES (5,4,'ANT-001',1,20.0000,1,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,'2021-03-15 15:24:16','2021-03-15 15:24:21','18e5ccd9-fb98-46c0-8ab9-d8e7fbff1d52'),(7,6,'PSB-001',1,30.0000,1,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,'2021-03-15 15:24:16','2021-03-15 15:24:21','6e623583-dfdc-4078-a34e-55e84eab0763'),(9,8,'RRE-001',1,40.0000,1,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,'2021-03-15 15:24:16','2021-03-15 15:24:21','b2ce7de5-0220-41e6-8fc5-76e3b3158a0c'),(11,10,'TFA-001',1,50.0000,1,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,'2021-03-15 15:24:16','2021-03-15 15:24:21','bee72da1-5f64-4bfd-a227-19eb47e5dccf'),(13,12,'LKH-001',1,60.0000,1,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,'2021-03-15 15:24:16','2021-03-15 15:24:21','1f3ac8da-e7d7-4911-b93b-619735fb2f94'),(15,14,'FDB-001',1,70.0000,1,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,'2021-03-15 15:24:16','2021-03-15 15:24:21','4d9ba583-588e-435e-8cec-8a461d3125c8');
/*!40000 ALTER TABLE `commerce_variants` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2020-03-27 13:22:43','2022-04-24 03:00:24','b77b0362-fbf0-45dd-a5d7-e1b0c971eb48'),(2,2,1,'Homepage','2020-03-27 13:38:49','2022-01-19 17:32:41','7fa40164-962a-4e1b-804a-245447006340'),(4,4,1,'A New Toga','2021-03-15 15:24:16','2021-03-15 15:24:21','7df96e57-107a-4aa7-b768-7ba4f0340abb'),(5,5,1,'A New Toga','2021-03-15 15:24:16','2021-03-15 15:24:21','b88e9a21-00e4-4a30-a5f5-4f32b9b684dc'),(6,4,2,'A New Toga','2021-03-15 15:24:16','2021-03-15 15:24:21','db321258-d8f1-4c17-a139-a55aa26d05ea'),(7,5,2,'A New Toga','2021-03-15 15:24:16','2021-03-15 15:24:21','dcbbeef9-5119-4ece-80a7-9fa312319e3c'),(8,6,1,'Parka With Stripes On Back','2021-03-15 15:24:16','2021-03-15 15:24:21','4ebb64c1-2a76-4e25-8fe0-94521ea9b2d1'),(9,7,1,'Parka With Stripes On Back','2021-03-15 15:24:16','2021-03-15 15:24:21','08b2eead-094d-4b85-97bc-af3dd3ab9a02'),(10,6,2,'Parka With Stripes On Back','2021-03-15 15:24:16','2021-03-15 15:24:21','1d10b92a-a77a-4dfc-a95c-9ec85107504b'),(11,7,2,'Parka With Stripes On Back','2021-03-15 15:24:16','2021-03-15 15:24:21','fd093eb5-9737-496c-84d1-2903c92b525f'),(12,8,1,'Romper For A Red Eye','2021-03-15 15:24:16','2021-03-15 15:24:21','8586816f-3b72-405e-9cca-0af3f1e58e68'),(13,9,1,'Romper For A Red Eye','2021-03-15 15:24:16','2021-03-15 15:24:21','2479a095-c556-4592-bc32-eeca2e23b63a'),(14,8,2,'Romper For A Red Eye','2021-03-15 15:24:16','2021-03-15 15:24:21','70478e88-c5f5-48ac-b8ac-b2fd5636e27b'),(15,9,2,'Romper For A Red Eye','2021-03-15 15:24:16','2021-03-15 15:24:21','0e8423ea-2f65-4b99-b13f-eb4004cb4f84'),(16,10,1,'The Fleece Awakens','2021-03-15 15:24:16','2021-03-15 15:24:21','d3f8934c-4ac9-4063-9c0d-c87c209a769b'),(17,11,1,'The Fleece Awakens','2021-03-15 15:24:16','2021-03-15 15:24:21','81b3af94-1fdc-4c80-8c46-caf8f1cc0bf4'),(18,10,2,'The Fleece Awakens','2021-03-15 15:24:16','2021-03-15 15:24:21','ffdfd8e6-7f8a-4f45-afe1-73dc278339b0'),(19,11,2,'The Fleece Awakens','2021-03-15 15:24:16','2021-03-15 15:24:21','7310b4a7-1ec3-4c9d-8584-31907c052a5c'),(20,12,1,'The Last Knee-High','2021-03-15 15:24:16','2021-03-15 15:24:21','7eb5caa9-e343-4398-813f-c5b77c42da0c'),(21,13,1,'The Last Knee-High','2021-03-15 15:24:16','2021-03-15 15:24:21','7ae9c9d1-96d2-43f7-9b06-ffc8e111a11a'),(22,12,2,'The Last Knee-High','2021-03-15 15:24:16','2021-03-15 15:24:21','d7682d0e-daaa-452f-a583-a155c05e6de7'),(23,13,2,'The Last Knee-High','2021-03-15 15:24:16','2021-03-15 15:24:21','abb292ed-d47f-438b-ade1-e821a4d67716'),(24,14,1,'Full-Size Dry Boxer','2021-03-15 15:24:16','2021-03-15 15:24:21','b1f90db4-8818-4622-9d82-75600be1049a'),(25,15,1,'Full-Size Dry Boxer','2021-03-15 15:24:16','2021-03-15 15:24:21','50f3d387-437b-492d-ab02-b291ce8a999d'),(26,14,2,'Full-Size Dry Boxer','2021-03-15 15:24:16','2021-03-15 15:24:21','c607b7c2-8e56-43f1-a4f2-2adff9317505'),(27,15,2,'Full-Size Dry Boxer','2021-03-15 15:24:16','2021-03-15 15:24:21','cba55962-d1ef-4151-9e97-a92ab7b7a5f7'),(30,17,1,'My first blog','2021-03-15 15:41:19','2022-01-19 17:32:42','e4c2f79d-0f9f-4e3b-8bdb-aca6526878b6'),(32,18,1,'My first blog','2021-03-15 15:41:19','2021-03-15 15:41:19','e84e777f-98c7-4cf7-b7cb-80a77833b218'),(33,18,2,'My first blog','2021-03-15 15:41:19','2021-03-15 15:41:19','8a3aaead-866b-416d-a8f4-12db80ad4f1e'),(34,19,1,NULL,'2021-03-15 15:55:30','2021-03-15 16:17:19','855856c1-048c-485c-aff8-d182d305d5c0'),(35,19,2,NULL,'2021-03-15 15:55:30','2021-03-15 16:17:19','e237f398-3087-4d0c-a281-0ec3ab25d3f6'),(36,20,1,'My first blog','2021-03-15 16:17:37','2021-03-15 16:17:37','5506cc52-6de9-405e-92ae-ff23a3ed6f86'),(37,20,2,'My first blog','2021-03-15 16:17:37','2021-03-15 16:17:37','6b7f8578-24eb-4928-8738-97805a747c17'),(38,21,1,'Puppies','2021-04-01 02:35:35','2021-04-01 02:35:35','dfb9075a-6ba9-4904-81dd-79b4adda4fd0'),(39,21,2,'Puppies','2021-04-01 02:35:35','2021-04-01 02:35:35','62dbcf58-01eb-441b-9c99-ecab0559dbbb'),(40,22,1,'Kitties','2021-04-01 02:35:44','2021-04-01 02:35:44','1f5f6c95-0339-484d-adc8-741217ccd0ca'),(41,22,2,'Kitties','2021-04-01 02:35:44','2021-04-01 02:35:44','1666d380-3f6f-485b-9d7b-2f688e67a050'),(42,23,1,'FHED At4 X0 AAFH Bi','2021-12-31 20:00:01','2021-12-31 20:00:01','ad59a7a6-79ed-4447-9558-af48f7a9cbf4'),(43,23,2,'FHED At4 X0 AAFH Bi','2021-12-31 20:00:02','2021-12-31 20:00:02','e2f1e22f-cb97-43ce-a9ca-30e32c014314'),(44,24,1,'Vanilla','2022-01-06 14:13:33','2022-04-24 01:05:21','14bb6f8d-102e-4165-a861-fe450dea9add'),(46,25,1,'Vanilla scoop','2022-01-06 14:15:19','2022-01-19 17:38:51','14227a8f-50da-45c8-b4fa-cf3c86420c17'),(48,26,1,'Vanilla','2022-01-06 14:16:07','2022-01-06 14:16:07','322cf638-79e3-471b-b923-2a7fce6b7476'),(49,26,2,'Vanilla','2022-01-06 14:16:07','2022-01-06 14:16:07','7b5bf69b-3ef3-4c9f-ae23-e6298c441283'),(50,27,1,'Chocolate','2022-01-06 14:16:34','2022-04-24 01:05:21','26d84037-48a1-4a08-85eb-ed4d8bdd5536'),(52,28,1,'Chocolate scoop','2022-01-06 14:17:05','2022-01-19 17:38:33','2224c97f-e18e-4cad-859d-c5068c08c5cb'),(54,29,1,'Chocolate','2022-01-06 14:17:18','2022-01-06 14:17:18','ff3bb565-eb22-4fc9-b85d-590b02a9a805'),(55,29,2,'Chocolate','2022-01-06 14:17:18','2022-01-06 14:17:18','70194cc4-5fc8-4a30-9751-65c6cd2435b0'),(56,30,1,'Strawberry','2022-01-06 14:17:22','2022-04-24 01:05:21','341dd8e0-e6a3-4f97-8d74-d76e7f0a024b'),(58,31,1,'Strawberry scoop','2022-01-06 14:18:01','2022-01-19 17:38:21','1f5219f4-99c6-4545-8d94-96a1d8d2e184'),(60,32,1,'Strawberry','2022-01-06 14:18:18','2022-01-06 14:18:18','6d8b4f46-2ffd-400c-8ad6-b01fc0cbad28'),(61,32,2,'Strawberry','2022-01-06 14:18:18','2022-01-06 14:18:18','c99e6d2a-8f4f-4d5a-82fe-27c3dc59feeb'),(62,33,1,'Some order','2022-01-06 14:47:19','2022-04-24 01:05:23','46c43a45-46d8-4c72-abca-44b9030d07e7'),(64,34,1,'Some order','2022-01-06 14:57:31','2022-01-06 14:57:31','b603ff12-4fe8-4fe0-85e9-ec8015e4f381'),(65,34,2,'Entry 34','2022-01-06 14:57:31','2022-01-06 14:57:31','9d14a1ec-1b97-47ac-b84f-51f0d163bf0b'),(68,39,1,'Some order','2022-01-06 14:58:59','2022-01-06 14:58:59','4b98a7fc-e8f2-4e8c-8680-d86a32b2c071'),(69,39,2,'Entry 35','2022-01-06 14:58:59','2022-01-06 14:58:59','62e06fbb-30d8-4be1-a228-be47693193ab'),(74,45,1,'Some order','2022-01-06 15:21:30','2022-01-06 15:21:30','c545dc38-8c24-4cb1-bbf0-2253534df860'),(75,45,2,'Entry 35','2022-01-06 15:21:30','2022-01-06 15:21:30','1040b840-546b-4141-bd77-2cbc7cd01c3d'),(78,53,1,'Some order','2022-01-06 15:26:16','2022-01-06 15:26:16','357bb0e6-b2a6-461c-bde1-945de5082856'),(79,53,2,'Entry 35','2022-01-06 15:26:16','2022-01-06 15:26:16','868031c5-f130-41f3-9868-41ae64f41888'),(82,59,1,'Some order','2022-01-06 15:26:24','2022-01-06 15:26:24','d2dbcd56-4d65-49a5-b267-32680a9e3274'),(83,59,2,'Entry 35','2022-01-06 15:26:24','2022-01-06 15:26:24','b6164c46-2b05-4f18-876c-513dfc13cfae'),(86,65,1,'Some order','2022-01-06 15:26:39','2022-01-06 15:26:39','1c198401-96c7-49cd-b4d7-66e6658311a0'),(87,65,2,'Entry 35','2022-01-06 15:26:39','2022-01-06 15:26:39','02308760-ded9-45f7-9ee5-fc94f0a3195b'),(90,71,1,'Some order','2022-01-06 15:34:41','2022-01-06 15:34:41','ea725c9c-6da1-4bd7-9101-12f50218c4d3'),(91,71,2,'Entry 35','2022-01-06 15:34:41','2022-01-06 15:34:41','66adda0c-dee4-4d8c-b2eb-e3ef58bd96e7'),(92,74,1,'Some order','2022-01-06 15:34:49','2022-01-06 15:34:49','0c572871-7a1c-46db-a4b6-ad86fe59758f'),(93,74,2,'Entry 35','2022-01-06 15:34:49','2022-01-06 15:34:49','8012c68d-00e5-439f-a5fe-a28ec9a1737d'),(96,80,1,'Some order','2022-01-06 15:38:44','2022-01-06 15:38:44','aebaec74-dbf3-4d26-84ae-ed1fc3f12047'),(97,80,2,'Entry 35','2022-01-06 15:38:44','2022-01-06 15:38:44','ee5853f7-5a44-41fb-b5f7-517cd2d43554'),(100,86,1,'Some order','2022-01-06 15:45:36','2022-01-06 15:45:36','4c5247e6-2588-4cd6-8855-abbbb1c6ed97'),(101,86,2,'Entry 35','2022-01-06 15:45:36','2022-01-06 15:45:36','96e43cc1-e466-41c8-af63-9ca84d8b3709'),(104,92,1,'Some order','2022-01-06 15:46:19','2022-01-06 15:46:19','9a4c95cd-6b6b-4f66-bec4-798a76d83bdf'),(105,92,2,'Entry 35','2022-01-06 15:46:19','2022-01-06 15:46:19','806db45e-b83d-44dd-a5b9-023104da83ff'),(108,98,1,'Some order','2022-01-06 15:55:36','2022-01-06 15:55:36','d486c14d-3560-4cd1-b127-6297509c99cd'),(109,98,2,'Entry 35','2022-01-06 15:55:36','2022-01-06 15:55:36','64b7985e-e12f-4848-8b33-ee6018d22575'),(114,107,1,'Some order','2022-01-06 15:56:50','2022-01-06 15:56:50','8e3d1762-2607-42d5-9bf1-3490de2cd11c'),(115,107,2,'Entry 35','2022-01-06 15:56:50','2022-01-06 15:56:50','c18a7694-bd99-488d-9976-7f37af0f2fbc'),(118,113,1,'Some order','2022-01-06 16:03:37','2022-01-06 16:03:37','a20694d8-5df0-4376-b99e-ae4b3c068770'),(119,113,2,'Entry 35','2022-01-06 16:03:37','2022-01-06 16:03:37','3e3fdf75-a45b-4061-a219-6bd0bf2b73b0'),(120,116,1,'Some order','2022-01-06 16:03:42','2022-01-06 16:03:42','2e58b154-3899-4de4-a081-6a5673c52032'),(121,116,2,'Entry 35','2022-01-06 16:03:42','2022-01-06 16:03:42','65430423-8a83-4a11-b929-cb4228b6e7bc'),(124,126,1,'Some order','2022-01-06 16:09:27','2022-01-06 16:09:27','591a4285-e39a-4734-a8a4-17cfea9f7b70'),(125,126,2,'Entry 35','2022-01-06 16:09:27','2022-01-06 16:09:27','31349143-0621-4e31-86a2-6894ddb7e902'),(128,134,1,'Some order','2022-01-06 16:09:38','2022-01-06 16:09:38','c41f6840-df3c-4bd4-ab78-221b0305e902'),(129,134,2,'Entry 35','2022-01-06 16:09:38','2022-01-06 16:09:38','d059c285-f5e5-4ce8-8d1f-7d700e652b40'),(132,142,1,'Some order','2022-01-06 16:09:43','2022-01-06 16:09:43','6839c5ae-fdcf-45c6-9a9d-6d31529bed65'),(133,142,2,'Entry 35','2022-01-06 16:09:43','2022-01-06 16:09:43','e2c442ba-146b-49b0-bcc2-ad5f0594ceb4'),(136,148,1,'Some order','2022-01-06 16:09:53','2022-01-06 16:09:53','2b1a1e9d-6040-445f-ba61-450aa18b3494'),(137,148,2,'Entry 35','2022-01-06 16:09:53','2022-01-06 16:09:53','dd7b0371-1f40-496b-bba6-d3bdc4702268'),(140,154,1,'Some order','2022-01-06 16:13:32','2022-01-06 16:13:32','9ad7bad9-fbf0-4d7e-a9e9-b2dd5983c4c5'),(141,154,2,'Entry 35','2022-01-06 16:13:32','2022-01-06 16:13:32','6937a5e5-3f46-4363-ad80-6782274f867a'),(144,158,1,'Some order','2022-01-06 16:13:55','2022-01-06 16:13:55','384de523-cf6e-435d-8632-4d683da707f9'),(145,158,2,'Entry 35','2022-01-06 16:13:55','2022-01-06 16:13:55','e3996619-8e04-470c-a7b9-16a1ee69520e'),(148,166,1,'Some order','2022-01-06 17:41:16','2022-01-06 17:41:16','00762475-2a47-42cf-9287-5b730cf349a5'),(149,166,2,'Entry 35','2022-01-06 17:41:16','2022-01-06 17:41:16','73d7c01a-9109-4bc5-bf53-f5b00e7ff264'),(152,175,1,'Some order','2022-01-06 17:41:50','2022-01-06 17:41:50','cb1d7fc4-c94b-431d-ac42-3f6b13ec4f41'),(153,175,2,'Entry 35','2022-01-06 17:41:50','2022-01-06 17:41:50','24c75988-fe5a-4cae-b73b-3be62ed95663'),(156,181,1,'Some order','2022-01-06 17:44:55','2022-01-06 17:44:55','2997b2e6-8327-468c-b3a8-a8a21d3f72a8'),(157,181,2,'Entry 35','2022-01-06 17:44:55','2022-01-06 17:44:55','654b0852-376c-45d6-90e6-fff8150a4d44'),(160,190,1,'Some order','2022-01-06 17:45:46','2022-01-06 17:45:46','95b3057e-ef42-4979-807c-dac2311b3cb1'),(161,190,2,'Entry 35','2022-01-06 17:45:46','2022-01-06 17:45:46','b1cc651b-0526-43bb-a22a-0c7b0353eeda'),(162,194,1,'Some order','2022-01-06 17:47:14','2022-01-06 17:47:14','03decffe-8741-4c68-9124-1ec9108d0d9d'),(163,194,2,'Entry 35','2022-01-06 17:47:14','2022-01-06 17:47:14','baf03067-6a37-45ac-b4f3-62a30cca184c'),(164,198,1,'My first blog','2022-01-18 15:42:04','2022-01-18 15:42:04','7ae2cb27-58ff-4c61-985b-096ab14feab4'),(165,198,2,'My first blog','2022-01-18 15:42:04','2022-01-18 15:42:04','95265479-dd2b-47af-b918-82e30ab832f4'),(166,199,1,'My first blog','2022-01-18 15:42:55','2022-01-18 15:42:55','d25710ae-16ed-4fee-80af-f8239bb243f8'),(167,199,2,'My first blog','2022-01-18 15:42:55','2022-01-18 15:42:55','cebc095e-c16e-46d8-b4ab-1b3326255d1e'),(169,204,1,'Some order','2022-01-22 03:05:59','2022-01-22 03:05:59','f0cf42f4-c271-4814-9610-040c05516b15'),(171,212,1,'Some order','2022-01-22 03:16:41','2022-01-22 03:16:41','227a39ab-0e86-41e1-a762-c69f37e30270'),(172,216,1,'Landing Page','2022-01-22 03:50:16','2022-04-24 01:05:22','c0f9cbfa-816e-4ae6-9cc1-993a8b6933fe'),(173,217,1,'Landing Page','2022-01-22 03:51:15','2022-01-22 03:51:15','0940d57d-d2e8-4c32-a021-0d4c31de9417'),(175,242,1,'Landing Page','2022-01-22 03:54:01','2022-01-22 03:54:01','82d4ac30-e7e0-4cd8-8fed-6cd1d27f37fc'),(177,250,1,'Landing Page','2022-01-22 05:06:24','2022-01-22 05:06:24','b945216a-4ae4-465d-83a9-c0078c444d30'),(179,258,1,'Landing Page','2022-01-22 05:07:21','2022-01-22 05:07:21','2a2f059d-5db3-482a-929b-952a37c14a51'),(181,266,1,'Landing Page','2022-01-22 05:07:29','2022-01-22 05:07:29','f5eb7a28-a817-4a42-b6f7-ea2780becbbd'),(183,274,1,'Landing Page','2022-01-22 05:08:21','2022-01-22 05:08:21','9129f6a5-381b-4025-8546-cfecb06ccf5f'),(185,282,1,'Landing Page','2022-01-22 05:21:59','2022-01-22 05:21:59','f953f9a6-fca8-42ac-a90a-fefb67946288'),(187,290,1,'Landing Page','2022-01-22 18:51:06','2022-01-22 18:51:06','dc5e0ccb-a2a7-4162-a8e7-75fb89d34e1e'),(189,298,1,'Landing Page','2022-01-22 18:54:52','2022-01-22 18:54:52','0e51cec6-74e9-4e57-adaa-de98ed473b73'),(190,302,1,'Landing Page','2022-01-23 00:08:26','2022-04-24 01:05:21','695feb95-558b-4418-9819-be79731eb6bd');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES (41,216,1,1,'Draft 1','',1,NULL,1);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,14,'craft\\elements\\User',1,0,'2020-03-27 13:22:43','2022-04-24 03:00:24',NULL,NULL,'9c39b369-6229-4753-83e1-afd4da7acf29'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2020-03-27 13:38:49','2022-01-19 17:32:39',NULL,'2022-01-19 17:33:35','7526d70b-8b45-4af6-b5b8-c56c6a44e34c'),(3,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Donation',1,0,'2021-03-15 15:24:15','2021-03-15 15:24:15',NULL,NULL,'526a5ea3-767b-4df7-8712-580157c88145'),(4,NULL,NULL,NULL,3,'craft\\commerce\\elements\\Product',1,0,'2021-03-15 15:24:16','2021-03-15 15:24:16',NULL,NULL,'7081584e-e3df-4024-9257-7f8e8ec95a28'),(5,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Variant',1,0,'2021-03-15 15:24:16','2021-03-15 15:24:21',NULL,NULL,'45269718-1004-4930-859b-07c56d970e17'),(6,NULL,NULL,NULL,3,'craft\\commerce\\elements\\Product',1,0,'2021-03-15 15:24:16','2021-03-15 15:24:16',NULL,NULL,'61078ac7-642e-4108-a552-fb0d0e45881d'),(7,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Variant',1,0,'2021-03-15 15:24:16','2021-03-15 15:24:21',NULL,NULL,'642ecb15-e397-4658-b878-22c399183f63'),(8,NULL,NULL,NULL,3,'craft\\commerce\\elements\\Product',1,0,'2021-03-15 15:24:16','2021-03-15 15:24:16',NULL,NULL,'c6b705ef-f5e8-4a57-9e37-efac1cf06d20'),(9,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Variant',1,0,'2021-03-15 15:24:16','2021-03-15 15:24:21',NULL,NULL,'a71ddf46-2c55-41c0-92de-fc0ddf3080fa'),(10,NULL,NULL,NULL,3,'craft\\commerce\\elements\\Product',1,0,'2021-03-15 15:24:16','2021-03-15 15:24:16',NULL,NULL,'6406a158-0467-4e91-8504-afa784805abe'),(11,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Variant',1,0,'2021-03-15 15:24:16','2021-03-15 15:24:21',NULL,NULL,'4131ac3a-b08d-4811-9909-ad9aaec47e99'),(12,NULL,NULL,NULL,3,'craft\\commerce\\elements\\Product',1,0,'2021-03-15 15:24:16','2021-03-15 15:24:16',NULL,NULL,'d909722a-a9ac-400a-83ae-c43cd44e7064'),(13,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Variant',1,0,'2021-03-15 15:24:16','2021-03-15 15:24:21',NULL,NULL,'8f5e64bc-8282-42a9-a462-e13aff72917d'),(14,NULL,NULL,NULL,3,'craft\\commerce\\elements\\Product',1,0,'2021-03-15 15:24:16','2021-03-15 15:24:16',NULL,NULL,'cc3c2113-f0bd-47d2-bad9-5a7c585228a9'),(15,NULL,NULL,NULL,NULL,'craft\\commerce\\elements\\Variant',1,0,'2021-03-15 15:24:16','2021-03-15 15:24:21',NULL,NULL,'e17cdcbf-cf0b-4ff5-9943-f04e7b8d821a'),(17,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2021-03-15 15:41:19','2022-01-18 15:42:55',NULL,'2022-01-19 17:33:38','251c74e8-9611-447e-a7a0-7c3e48dd315c'),(18,17,NULL,1,5,'craft\\elements\\Entry',1,0,'2021-03-15 15:41:19','2021-03-15 15:41:19',NULL,'2022-01-19 17:33:38','903b23f3-a446-4282-89bb-c18c3a2b8bec'),(19,NULL,NULL,NULL,6,'craft\\elements\\GlobalSet',1,0,'2021-03-15 15:55:30','2021-03-15 16:17:19',NULL,'2022-01-19 17:34:05','aa7c6968-88ec-4d2a-af47-d3c40b582a68'),(20,17,NULL,2,5,'craft\\elements\\Entry',1,0,'2021-03-15 16:17:36','2021-03-15 16:17:36',NULL,'2022-01-19 17:33:38','9e157ef9-368f-49aa-bff9-901e83da4e14'),(21,NULL,NULL,NULL,9,'craft\\elements\\Category',1,0,'2021-04-01 02:35:35','2021-04-01 02:35:35',NULL,'2022-01-19 17:36:03','0b5e2d02-58de-4965-b9c6-280dfecedd34'),(22,NULL,NULL,NULL,9,'craft\\elements\\Category',1,0,'2021-04-01 02:35:44','2021-04-01 02:35:44',NULL,'2022-01-19 17:36:03','8deb5a7a-2202-4eac-8415-2ef70a523974'),(23,NULL,NULL,NULL,7,'craft\\elements\\Asset',1,0,'2021-12-31 20:00:01','2021-12-31 20:00:01',NULL,'2022-01-19 17:34:23','48736f39-d032-4144-b908-af3362a8779e'),(24,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2022-01-06 14:13:33','2022-01-06 14:16:07',NULL,'2022-04-24 01:05:41','cfb5f137-517d-4431-9f91-ebc018be1fd4'),(25,NULL,NULL,NULL,7,'craft\\elements\\Asset',1,0,'2022-01-06 14:15:19','2022-01-19 17:38:51',NULL,'2022-04-24 02:56:01','f2734e74-e72f-480f-9142-2c5f79786304'),(26,24,NULL,3,11,'craft\\elements\\Entry',1,0,'2022-01-06 14:16:07','2022-01-06 14:16:07',NULL,'2022-04-24 01:05:41','b4408c36-c438-4884-b919-00cf3420c8cf'),(27,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2022-01-06 14:16:34','2022-01-06 14:17:18',NULL,'2022-04-24 01:05:41','71ad4c10-2e73-4fb5-a395-beb1a784817c'),(28,NULL,NULL,NULL,7,'craft\\elements\\Asset',1,0,'2022-01-06 14:17:05','2022-01-19 17:38:33',NULL,'2022-04-24 02:56:01','dc30ca8a-36f3-40fb-a622-5ca24af6053c'),(29,27,NULL,4,11,'craft\\elements\\Entry',1,0,'2022-01-06 14:17:18','2022-01-06 14:17:18',NULL,'2022-04-24 01:05:41','51873f9d-a237-4a6e-a46f-11f23bb5fa29'),(30,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2022-01-06 14:17:22','2022-01-06 14:18:18',NULL,'2022-04-24 01:05:41','f6865e06-2643-4e2c-89be-90277ac64805'),(31,NULL,NULL,NULL,7,'craft\\elements\\Asset',1,0,'2022-01-06 14:18:01','2022-01-19 17:38:21',NULL,'2022-04-24 02:56:01','e44b37bb-231e-4112-8e6d-2e525a7868bd'),(32,30,NULL,5,11,'craft\\elements\\Entry',1,0,'2022-01-06 14:18:18','2022-01-06 14:18:18',NULL,'2022-04-24 01:05:41','7ec8bfad-da05-44be-8af4-f8f9d9d7cfe3'),(33,NULL,NULL,NULL,13,'craft\\elements\\Entry',1,0,'2022-01-06 14:47:19','2022-01-22 03:16:41',NULL,'2022-04-24 01:05:42','ad70ace8-32d8-4a41-90f1-0cf6477aacde'),(34,33,NULL,6,13,'craft\\elements\\Entry',1,0,'2022-01-06 14:57:31','2022-01-06 14:57:31',NULL,'2022-04-24 01:05:42','1743af59-1288-44db-a0cd-c3f926c6124b'),(38,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 14:58:59','2022-01-06 16:09:38',NULL,'2022-01-06 16:09:43','4567c2d4-2315-4b5b-bcd4-cae78edead5b'),(39,33,NULL,7,13,'craft\\elements\\Entry',1,0,'2022-01-06 14:58:59','2022-01-06 14:58:59',NULL,'2022-04-24 01:05:42','6a4e13fb-ff4b-456a-b8ce-7314043df649'),(40,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 14:58:59','2022-01-06 14:58:59',NULL,NULL,'98922693-079b-4886-87ed-892db564e4b0'),(45,33,NULL,8,13,'craft\\elements\\Entry',1,0,'2022-01-06 15:21:30','2022-01-06 15:21:30',NULL,'2022-04-24 01:05:42','91500822-3e77-4e06-a174-4857caa44bcf'),(46,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:21:30','2022-01-06 15:21:30',NULL,NULL,'aaca9dea-998b-4fc2-b725-7d2c1bee135b'),(52,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:26:16','2022-01-06 16:09:43',NULL,'2022-01-06 16:09:53','98a46c35-8849-42de-9310-4c33b63a8737'),(53,33,NULL,9,13,'craft\\elements\\Entry',1,0,'2022-01-06 15:26:16','2022-01-06 15:26:16',NULL,'2022-04-24 01:05:42','0f813c00-2b8e-46aa-b217-bff4dbc4346f'),(54,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:26:16','2022-01-06 15:26:16',NULL,NULL,'e9ad26ef-80f4-4469-b85e-2fb0803f723c'),(55,52,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:26:16','2022-01-06 15:26:17',NULL,NULL,'22eddadb-5f63-49c5-80ab-be57d7400bb7'),(59,33,NULL,10,13,'craft\\elements\\Entry',1,0,'2022-01-06 15:26:24','2022-01-06 15:26:24',NULL,'2022-04-24 01:05:42','3e75b954-f944-4d6b-a94e-343798abce52'),(60,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:26:24','2022-01-06 15:26:24',NULL,NULL,'ab0388d3-8c5d-47b1-bfae-22697e5be898'),(61,52,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:26:24','2022-01-06 15:26:24',NULL,NULL,'a6ed75db-a2d9-424b-8a55-b91efea4ce90'),(65,33,NULL,11,13,'craft\\elements\\Entry',1,0,'2022-01-06 15:26:39','2022-01-06 15:26:39',NULL,'2022-04-24 01:05:42','df37cb68-f8ac-4f77-8a7c-0f6c33854907'),(66,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:26:39','2022-01-06 15:26:39',NULL,NULL,'26284ee0-31e7-4026-9c1a-3b1bd6264a31'),(67,52,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:26:39','2022-01-06 15:26:39',NULL,NULL,'57931f0b-9419-4410-9cea-36490665835e'),(71,33,NULL,12,13,'craft\\elements\\Entry',1,0,'2022-01-06 15:34:41','2022-01-06 15:34:41',NULL,'2022-04-24 01:05:42','ec47ee09-1503-4152-b947-5767faf6dec4'),(72,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:34:41','2022-01-06 15:34:41',NULL,NULL,'88d2971d-32b9-4e8e-9dde-0d52c1e246e6'),(73,52,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:34:41','2022-01-06 15:34:41',NULL,NULL,'c7a85b3f-2d5c-41da-9aaf-7e85fd761ebb'),(74,33,NULL,13,13,'craft\\elements\\Entry',1,0,'2022-01-06 15:34:49','2022-01-06 15:34:49',NULL,'2022-04-24 01:05:42','9a851726-b971-4a99-bbcd-5ad98d3e18ec'),(75,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:34:49','2022-01-06 15:34:49',NULL,NULL,'0323ae12-0222-459a-a9f7-ac5d0359c317'),(76,52,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:34:49','2022-01-06 15:34:49',NULL,NULL,'4de2aa5f-5306-49df-9cd0-5d5603222a76'),(80,33,NULL,14,13,'craft\\elements\\Entry',1,0,'2022-01-06 15:38:44','2022-01-06 15:38:44',NULL,'2022-04-24 01:05:42','eaf5d333-0d7d-4ddf-996c-cc5b8b0452a5'),(81,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:38:44','2022-01-06 15:38:44',NULL,NULL,'4dba98bc-3d10-4382-b890-07c8fb215769'),(82,52,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:38:44','2022-01-06 15:38:44',NULL,NULL,'160d27e4-a467-431a-bf99-dec441fbc53b'),(86,33,NULL,15,13,'craft\\elements\\Entry',1,0,'2022-01-06 15:45:36','2022-01-06 15:45:36',NULL,'2022-04-24 01:05:42','ef72ab77-d9be-4964-96dc-2914fe97f554'),(87,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:45:36','2022-01-06 15:45:36',NULL,NULL,'d834aa28-fab2-437e-889a-26a093fb9a7c'),(88,52,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:45:36','2022-01-06 15:45:36',NULL,NULL,'71e1149e-bf43-4aa3-8eeb-b9db86386d96'),(92,33,NULL,16,13,'craft\\elements\\Entry',1,0,'2022-01-06 15:46:19','2022-01-06 15:46:19',NULL,'2022-04-24 01:05:42','45504763-7f96-46e5-92ae-c4b97f7f5957'),(93,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:46:19','2022-01-06 15:46:19',NULL,NULL,'e8b05328-6e2d-4bb3-9940-795d5b5ffbd9'),(94,52,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:46:19','2022-01-06 15:46:19',NULL,NULL,'801f9369-e38a-4fe3-bfc7-ca88af29ca9e'),(98,33,NULL,17,13,'craft\\elements\\Entry',1,0,'2022-01-06 15:55:36','2022-01-06 15:55:36',NULL,'2022-04-24 01:05:42','b762537d-08cb-4664-8765-c97a4d0f1531'),(99,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:55:36','2022-01-06 15:55:36',NULL,NULL,'187db508-36f6-4e34-94a4-dcc57028d37d'),(100,52,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:55:36','2022-01-06 15:55:36',NULL,NULL,'13f0927e-8267-4239-9c14-8cff4ff6bcd7'),(107,33,NULL,18,13,'craft\\elements\\Entry',1,0,'2022-01-06 15:56:50','2022-01-06 15:56:50',NULL,'2022-04-24 01:05:42','2469cb49-f9cc-48a7-bdaf-64d708c94de2'),(108,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:56:50','2022-01-06 15:56:50',NULL,NULL,'8c50992d-0573-469a-b5c3-2537605acbf9'),(109,52,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 15:56:50','2022-01-06 15:56:50',NULL,NULL,'27d36def-3d3e-4b6b-a06a-2eba22f5c2ef'),(113,33,NULL,19,13,'craft\\elements\\Entry',1,0,'2022-01-06 16:03:37','2022-01-06 16:03:37',NULL,'2022-04-24 01:05:42','10773f55-da70-4472-a9d3-514552c2a467'),(114,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 16:03:37','2022-01-06 16:03:37',NULL,NULL,'5e2cf3b0-75cc-4f1d-bcae-01a221d81706'),(115,52,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 16:03:37','2022-01-06 16:03:37',NULL,NULL,'818bedb9-571c-4299-bec6-6b0a3541059f'),(116,33,NULL,20,13,'craft\\elements\\Entry',1,0,'2022-01-06 16:03:42','2022-01-06 16:03:42',NULL,'2022-04-24 01:05:42','b9ac2e9b-0d4a-4c2e-b861-9d25c85e31c8'),(117,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 16:03:42','2022-01-06 16:03:42',NULL,NULL,'c8982b62-c4d0-4218-b8e5-ea328e6e779a'),(118,52,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 16:03:42','2022-01-06 16:03:42',NULL,NULL,'1efd2c74-5d7f-4eed-89a4-0b7cc89c1acb'),(125,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 16:09:27','2022-01-06 16:09:43',NULL,'2022-01-06 16:09:53','6da53d63-cfe0-4512-861c-571487684812'),(126,33,NULL,21,13,'craft\\elements\\Entry',1,0,'2022-01-06 16:09:26','2022-01-06 16:09:27',NULL,'2022-04-24 01:05:42','2f5a3e78-7b25-4e22-a585-ff69a1e3ed59'),(127,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 16:09:27','2022-01-06 16:09:27',NULL,NULL,'ba80c937-fd29-433c-a1a1-58cf805e3fca'),(128,52,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 16:09:27','2022-01-06 16:09:27',NULL,NULL,'249a343e-bd90-475b-b861-a43e019adcd1'),(129,125,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 16:09:27','2022-01-06 16:09:27',NULL,NULL,'65ff0f2f-7e3c-45ec-91e9-a0c6ca2752d5'),(134,33,NULL,22,13,'craft\\elements\\Entry',1,0,'2022-01-06 16:09:38','2022-01-06 16:09:38',NULL,'2022-04-24 01:05:42','d148d562-686a-4dad-bf06-830d6ec542bb'),(135,52,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 16:09:38','2022-01-06 16:09:38',NULL,NULL,'cf4ea724-c60f-47ca-b7fa-9aac7c3fec79'),(136,38,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 16:09:38','2022-01-06 16:09:38',NULL,NULL,'bd5d1ad8-53c4-4068-93bc-2cd7f5382436'),(137,125,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 16:09:38','2022-01-06 16:09:38',NULL,NULL,'3e0053d3-8b42-4a3e-a685-56618ddbd01a'),(142,33,NULL,23,13,'craft\\elements\\Entry',1,0,'2022-01-06 16:09:43','2022-01-06 16:09:43',NULL,'2022-04-24 01:05:42','a919d6a1-7dfa-4d54-a47e-eb3bffaaa741'),(143,52,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 16:09:44','2022-01-06 16:09:44',NULL,NULL,'f8b214c7-0136-461d-b325-81fe624e52e0'),(144,125,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 16:09:44','2022-01-06 16:09:44',NULL,NULL,'f5db7c26-2701-492e-8b21-3fa477d60645'),(148,33,NULL,24,13,'craft\\elements\\Entry',1,0,'2022-01-06 16:09:53','2022-01-06 16:09:53',NULL,'2022-04-24 01:05:42','8720e585-8743-4cad-ad6f-7729a56eabea'),(153,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 16:13:32','2022-01-06 16:13:32',NULL,'2022-01-06 16:13:55','c7271c3f-5e3b-4873-9c60-35c5fb47faf4'),(154,33,NULL,25,13,'craft\\elements\\Entry',1,0,'2022-01-06 16:13:32','2022-01-06 16:13:32',NULL,'2022-04-24 01:05:42','28f4d2d8-c84f-481f-a4ea-feb32efe6fad'),(155,153,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 16:13:32','2022-01-06 16:13:32',NULL,NULL,'55ccc3e1-fe35-4318-889e-848a5b22cf52'),(158,33,NULL,26,13,'craft\\elements\\Entry',1,0,'2022-01-06 16:13:55','2022-01-06 16:13:55',NULL,'2022-04-24 01:05:42','aac7ed21-1dae-4a4d-8a1a-99d4d36a67eb'),(165,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 17:41:16','2022-04-24 01:05:23',NULL,'2022-04-24 01:05:41','26934aaa-dec4-4b04-ad0f-745c96d1cbd5'),(166,33,NULL,27,13,'craft\\elements\\Entry',1,0,'2022-01-06 17:41:16','2022-01-06 17:41:16',NULL,'2022-04-24 01:05:42','2408999f-d1a7-414d-bde8-45b90a529103'),(167,165,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 17:41:16','2022-01-06 17:41:16',NULL,NULL,'2d32067e-b566-4cef-89df-6ea75c1d0751'),(174,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 17:41:50','2022-04-24 01:05:23',NULL,'2022-04-24 01:05:41','a31f74bc-4dbf-4edf-9f83-58b6a9911a7f'),(175,33,NULL,28,13,'craft\\elements\\Entry',1,0,'2022-01-06 17:41:49','2022-01-06 17:41:50',NULL,'2022-04-24 01:05:42','4ee6f1c9-c85b-4d4e-913a-464d2e3b9b73'),(176,165,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 17:41:50','2022-01-06 17:41:50',NULL,NULL,'d2868f2b-ae9a-4fb4-9a19-7edd4ca778f4'),(177,174,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 17:41:50','2022-01-06 17:41:50',NULL,NULL,'ca2495a6-f65a-4e5e-8f54-c53c9d1f4ded'),(181,33,NULL,29,13,'craft\\elements\\Entry',1,0,'2022-01-06 17:44:55','2022-01-06 17:44:55',NULL,'2022-04-24 01:05:42','307da20d-bf21-4b14-9193-72b3e349085b'),(182,165,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 17:44:55','2022-01-06 17:44:55',NULL,NULL,'bfc0772b-2659-464c-8021-551ca3f41750'),(183,174,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 17:44:55','2022-01-06 17:44:55',NULL,NULL,'182764eb-67c7-4e08-9532-55f8e40e643a'),(189,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 17:45:46','2022-04-24 01:05:23',NULL,'2022-04-24 01:05:42','ef019970-7fbc-4b4f-a4fe-9dfe03e63d7a'),(190,33,NULL,30,13,'craft\\elements\\Entry',1,0,'2022-01-06 17:45:46','2022-01-06 17:45:46',NULL,'2022-04-24 01:05:42','25a723ba-0165-451c-92dc-ff4511fff981'),(191,174,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 17:45:46','2022-01-06 17:45:46',NULL,NULL,'f24861b6-c868-45a0-b157-ce9558a37b52'),(192,165,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 17:45:46','2022-01-06 17:45:46',NULL,NULL,'45c65b1a-6016-4ea2-ae6e-d793bb5a1c9f'),(193,189,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 17:45:46','2022-01-06 17:45:46',NULL,NULL,'cc42c2c4-3cc0-40f2-bb6f-40f633fa3e2b'),(194,33,NULL,31,13,'craft\\elements\\Entry',1,0,'2022-01-06 17:47:14','2022-01-06 17:47:14',NULL,'2022-04-24 01:05:42','7944e164-9bd6-42aa-9560-d7bc9511ed2f'),(195,174,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 17:47:14','2022-01-06 17:47:14',NULL,NULL,'46fa0ad2-5b14-4127-b298-0d7b67fb3d1e'),(196,165,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 17:47:14','2022-01-06 17:47:14',NULL,NULL,'ef445c7d-9f04-4da0-a539-768ae7816358'),(197,189,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-06 17:47:14','2022-01-06 17:47:14',NULL,NULL,'a826c547-a8ca-4293-9f10-f4e0f0025e05'),(198,17,NULL,32,5,'craft\\elements\\Entry',1,0,'2022-01-18 15:42:04','2022-01-18 15:42:04',NULL,'2022-01-19 17:33:38','4e80bd65-73d9-40fc-a2ac-8f72cd95e45a'),(199,17,NULL,33,5,'craft\\elements\\Entry',1,0,'2022-01-18 15:42:55','2022-01-18 15:42:55',NULL,'2022-01-19 17:33:38','498533a2-5fed-417d-955f-00508700e8a8'),(204,33,NULL,34,13,'craft\\elements\\Entry',1,0,'2022-01-22 03:05:59','2022-01-22 03:05:59',NULL,'2022-04-24 01:05:42','f09a2a5d-7ba9-4a86-a12a-adb30853bcde'),(205,174,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:05:59','2022-01-22 03:05:59',NULL,NULL,'03e22226-9ee3-4991-9503-5dad9a1f82ec'),(206,165,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:05:59','2022-01-22 03:05:59',NULL,NULL,'e0b63ae4-8dc7-4891-ba8c-bfd4949c2e07'),(207,189,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:05:59','2022-01-22 03:05:59',NULL,NULL,'2e430edd-1f53-4abb-bb10-b1621577997c'),(212,33,NULL,35,13,'craft\\elements\\Entry',1,0,'2022-01-22 03:16:41','2022-01-22 03:16:41',NULL,'2022-04-24 01:05:42','f412975e-c3e8-47d5-996d-5445ef10ff64'),(213,174,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:16:41','2022-01-22 03:16:41',NULL,NULL,'a584171b-0a93-46fe-b5c8-14e6b71e7e62'),(214,165,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:16:41','2022-01-22 03:16:41',NULL,NULL,'f5636569-4558-4749-821a-ab931692374d'),(215,189,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:16:41','2022-01-22 03:16:41',NULL,NULL,'077df8fe-000d-49e0-8f12-abe7f96e3a43'),(216,NULL,NULL,NULL,15,'craft\\elements\\Entry',1,0,'2022-01-22 03:50:16','2022-01-22 18:54:52',NULL,'2022-04-24 01:05:42','2f13b6be-a574-4a1c-a021-309b40cd1394'),(217,216,NULL,36,15,'craft\\elements\\Entry',1,0,'2022-01-22 03:51:15','2022-01-22 03:51:15',NULL,'2022-04-24 01:05:42','e2577dd6-128e-4dda-8d88-7d4942e0868c'),(219,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:52:24','2022-01-22 03:52:24',NULL,'2022-01-22 03:52:31','67d3115c-5bfc-4a2f-a004-9c180b515482'),(220,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:52:31','2022-01-22 03:52:31',NULL,'2022-01-22 03:52:36','d5be646a-cd2e-42ba-b96f-e81e6c40ee4a'),(221,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:52:36','2022-01-22 03:52:36',NULL,'2022-01-22 03:52:38','2ec9109d-dd81-4da3-bd8d-58b5f5710a22'),(222,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:52:38','2022-01-22 03:52:38',NULL,'2022-01-22 03:53:21','4b90a269-57b4-4857-af2d-b807e9db6837'),(223,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:52:38','2022-01-22 03:52:38',NULL,'2022-01-22 03:53:21','9355bf7a-cf2d-4190-bacc-ffa507561e1d'),(224,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:53:21','2022-01-22 03:53:21',NULL,'2022-01-22 03:53:26','b23bfe03-f2b7-44d2-b541-d7bc85fddf3c'),(225,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:53:21','2022-01-22 03:53:21',NULL,'2022-01-22 03:53:26','a7bfaccc-b6ad-463a-8be5-af3d0f26b519'),(226,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:53:26','2022-01-22 03:53:26',NULL,'2022-01-22 03:53:35','a07b51a0-7184-42f2-8086-032b9dbae705'),(227,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:53:26','2022-01-22 03:53:26',NULL,'2022-01-22 03:53:35','4091c6d7-743b-44f7-8cc5-e2db7ff86eac'),(228,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:53:35','2022-01-22 03:53:35',NULL,'2022-01-22 03:53:37','f52607c1-164f-4fe6-9a35-ab813b97b61b'),(229,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:53:35','2022-01-22 03:53:35',NULL,'2022-01-22 03:53:37','a9f308f8-c072-4799-9fa8-677d08464c48'),(230,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:53:37','2022-01-22 03:53:37',NULL,'2022-01-22 03:53:51','78955971-5733-4085-9a08-7d19ae273bce'),(231,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:53:37','2022-01-22 03:53:37',NULL,'2022-01-22 03:53:51','61c4fe00-c85f-4d51-a17e-e4ef70259131'),(232,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:53:37','2022-01-22 03:53:37',NULL,'2022-01-22 03:53:51','68b4e466-dc23-4a6f-b3ef-3123dd15ce92'),(233,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:53:51','2022-01-22 03:53:51',NULL,'2022-01-22 03:53:59','97c741a8-ead1-4175-8477-0da4bff7287b'),(234,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:53:51','2022-01-22 03:53:51',NULL,'2022-01-22 03:53:59','0f9bde64-0354-41a4-a263-d1b1bf12042a'),(235,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:53:51','2022-01-22 03:53:51',NULL,'2022-01-22 03:53:59','f4377c82-1277-4f32-950a-b7276f80f1d2'),(239,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:54:01','2022-04-24 01:05:22',NULL,'2022-04-24 01:05:42','de1cc1c4-1b8b-4b9f-8855-5212b2d2847c'),(240,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:54:01','2022-04-24 01:05:22',NULL,'2022-04-24 01:05:42','248c145f-d4c0-4720-be86-4c47fc7370cc'),(241,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:54:01','2022-04-24 01:05:22',NULL,'2022-04-24 01:05:42','4e5a9942-28bc-484f-aced-6ea9864bcf70'),(242,216,NULL,37,15,'craft\\elements\\Entry',1,0,'2022-01-22 03:54:01','2022-01-22 03:54:01',NULL,'2022-04-24 01:05:42','aed7f9a7-9726-4317-823a-e7a9b6d25b1c'),(243,239,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:54:01','2022-01-22 03:54:01',NULL,NULL,'e74d20a0-9680-4d3a-969c-f9a06d8deef9'),(244,240,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:54:01','2022-01-22 03:54:01',NULL,NULL,'dccede5d-f56b-44a1-a81b-0ef559aa1102'),(245,241,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 03:54:01','2022-01-22 03:54:01',NULL,NULL,'e7368886-a830-473a-ac6b-ce5d81e76fca'),(250,216,NULL,38,15,'craft\\elements\\Entry',1,0,'2022-01-22 05:06:24','2022-01-22 05:06:24',NULL,'2022-04-24 01:05:42','be2b4197-3ab0-484f-bcb6-2e1d819371c0'),(251,239,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 05:06:24','2022-01-22 05:06:24',NULL,NULL,'03c68cc2-6c33-4eec-85a7-0e71918c7268'),(252,240,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 05:06:24','2022-01-22 05:06:24',NULL,NULL,'0612b2ab-75f2-4351-b58b-8dc6d3831981'),(253,241,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 05:06:24','2022-01-22 05:06:24',NULL,NULL,'231d2ccb-6d27-4395-9864-3c4c0040dc64'),(258,216,NULL,39,15,'craft\\elements\\Entry',1,0,'2022-01-22 05:07:21','2022-01-22 05:07:21',NULL,'2022-04-24 01:05:42','665f5e1a-fc38-4c1e-a12f-4cec72e0d972'),(259,239,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 05:07:21','2022-01-22 05:07:21',NULL,NULL,'015dac20-9c16-4ff6-8611-9769c3f310d9'),(260,240,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 05:07:21','2022-01-22 05:07:21',NULL,NULL,'b43d1dbc-ee24-4cf1-bb43-bd2f24ba29e0'),(261,241,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 05:07:21','2022-01-22 05:07:21',NULL,NULL,'dc378a15-268a-49be-b11e-1a275130ffd9'),(266,216,NULL,40,15,'craft\\elements\\Entry',1,0,'2022-01-22 05:07:29','2022-01-22 05:07:29',NULL,'2022-04-24 01:05:42','b0dbb218-13ce-40cc-b345-cfa8566ec9bc'),(267,239,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 05:07:29','2022-01-22 05:07:29',NULL,NULL,'b1ee6112-b627-4421-9929-dac3ab7154b3'),(268,240,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 05:07:29','2022-01-22 05:07:29',NULL,NULL,'496c300a-9293-4c2b-a994-39bd096da22b'),(269,241,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 05:07:29','2022-01-22 05:07:29',NULL,NULL,'273f6f7e-0209-4aa3-b145-fe7d99f2caa2'),(274,216,NULL,41,15,'craft\\elements\\Entry',1,0,'2022-01-22 05:08:21','2022-01-22 05:08:21',NULL,'2022-04-24 01:05:42','3963d97a-c422-4722-9501-91dab365cd99'),(275,239,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 05:08:21','2022-01-22 05:08:21',NULL,NULL,'72c66732-671f-4f6c-bdfa-cbc84694e593'),(276,240,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 05:08:21','2022-01-22 05:08:21',NULL,NULL,'4898b852-304b-4f10-b87b-6c1386c4c4ee'),(277,241,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 05:08:21','2022-01-22 05:08:21',NULL,NULL,'1255d13b-683d-4afd-90a6-ff12655e5e43'),(282,216,NULL,42,15,'craft\\elements\\Entry',1,0,'2022-01-22 05:21:59','2022-01-22 05:21:59',NULL,'2022-04-24 01:05:42','bbee68b8-3ed1-4c17-83e3-0679a52008db'),(283,239,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 05:21:59','2022-01-22 05:21:59',NULL,NULL,'abb4ed11-4f4d-43fe-a7ec-7840d8480d0c'),(284,240,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 05:21:59','2022-01-22 05:21:59',NULL,NULL,'5154131c-cf6a-4923-955e-f882a52becaf'),(285,241,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 05:21:59','2022-01-22 05:21:59',NULL,NULL,'f7aaeacc-22f4-415c-8069-d44159207d78'),(290,216,NULL,43,15,'craft\\elements\\Entry',1,0,'2022-01-22 18:51:06','2022-01-22 18:51:06',NULL,'2022-04-24 01:05:42','e0ebff77-8b1e-4aa7-82e3-7e045c46f394'),(291,239,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 18:51:06','2022-01-22 18:51:06',NULL,NULL,'85b3ed82-2123-4b3c-9d16-a244901a474a'),(292,240,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 18:51:06','2022-01-22 18:51:06',NULL,NULL,'f46dc7c7-c9bd-4a7b-bc7b-e31f5749f894'),(293,241,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 18:51:06','2022-01-22 18:51:06',NULL,NULL,'7e3e30d2-3e0b-4357-942f-0ce137964dbc'),(298,216,NULL,44,15,'craft\\elements\\Entry',1,0,'2022-01-22 18:54:52','2022-01-22 18:54:52',NULL,'2022-04-24 01:05:42','931d5010-7be4-44fb-b8df-4dc83e0819bf'),(299,239,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 18:54:52','2022-01-22 18:54:52',NULL,NULL,'47ca18cd-75eb-4315-a7ed-8608b7adaaf1'),(300,240,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 18:54:52','2022-01-22 18:54:52',NULL,NULL,'26d5b5b2-a0e9-4e9f-b1b4-4ecc7fe523d4'),(301,241,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-22 18:54:52','2022-01-22 18:54:52',NULL,NULL,'856d758c-8054-492b-8e68-912295c4a787'),(302,216,41,NULL,15,'craft\\elements\\Entry',1,0,'2022-01-23 00:08:26','2022-03-26 20:19:59',NULL,'2022-04-24 01:05:42','3f1e0eb8-0da1-4346-90c9-1bbae23c8b6a'),(303,239,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-23 00:08:26','2022-04-24 01:05:21',NULL,NULL,'daaf04db-55f5-4c7f-a38a-95938a288822'),(304,240,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-23 00:08:26','2022-04-24 01:05:21',NULL,NULL,'4378e387-37db-42b8-8f7e-b1c973c80ec2'),(305,241,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2022-01-23 00:08:26','2022-04-24 01:05:21',NULL,NULL,'e833f47c-38e7-40d9-b6cf-08e009ec68da');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2020-03-27 13:22:43','2020-03-27 13:22:43','b03adee1-4d8e-41c3-bcab-890c732ef44d'),(2,2,1,'homepage','__home__',1,'2020-03-27 13:38:49','2020-03-27 13:38:49','40928c54-598c-421b-9a79-3605cfbbcc8b'),(4,3,1,NULL,NULL,1,'2021-03-15 15:24:15','2021-03-15 15:24:15','a61f7646-3787-4cc3-9daf-3475f78d6c3e'),(5,4,1,'ant-001','shop/products/ant-001',1,'2021-03-15 15:24:16','2021-03-15 15:24:20','6b386ce1-85e7-4598-8d63-754c9a8cd5b3'),(6,5,1,'ant-001',NULL,1,'2021-03-15 15:24:16','2021-03-15 15:24:16','8d337ed7-4895-4a25-a34d-93188989c8d2'),(7,4,2,'ant-001','shop/products/ant-001',1,'2021-03-15 15:24:16','2021-03-15 15:24:20','686befc9-91a8-450a-a6f6-694cd0f3360a'),(8,5,2,'ant-001',NULL,1,'2021-03-15 15:24:16','2021-03-15 15:24:16','5cb47b5e-d6e2-4014-b8de-ec121c0e94a3'),(9,6,1,'psb-001','shop/products/psb-001',1,'2021-03-15 15:24:16','2021-03-15 15:24:20','8f4800bd-b82f-45fc-b0c5-7e5cf3fbdd96'),(10,7,1,'psb-001',NULL,1,'2021-03-15 15:24:16','2021-03-15 15:24:16','9aa280fc-64a1-4ca2-8b7e-d0967fcb59b9'),(11,6,2,'psb-001','shop/products/psb-001',1,'2021-03-15 15:24:16','2021-03-15 15:24:20','e1f53b4e-b9ac-46d1-bd70-32a0f3949930'),(12,7,2,'psb-001',NULL,1,'2021-03-15 15:24:16','2021-03-15 15:24:16','e7fa30a7-09ab-40dc-8f2e-a6dab095794c'),(13,8,1,'rre-001','shop/products/rre-001',1,'2021-03-15 15:24:16','2021-03-15 15:24:20','7b9e5f9b-02db-4766-92dd-f194343d03de'),(14,9,1,'rre-001',NULL,1,'2021-03-15 15:24:16','2021-03-15 15:24:16','1f53e93c-1959-4d16-8965-0edaaa21d59b'),(15,8,2,'rre-001','shop/products/rre-001',1,'2021-03-15 15:24:16','2021-03-15 15:24:20','b6b41b1f-7271-4634-b846-6eb6beabe9ed'),(16,9,2,'rre-001',NULL,1,'2021-03-15 15:24:16','2021-03-15 15:24:16','dacad1bf-d166-4d23-a24f-4d9e164d8a0d'),(17,10,1,'tfa-001','shop/products/tfa-001',1,'2021-03-15 15:24:16','2021-03-15 15:24:20','8157cac0-7325-4e85-883d-f9fc771e7279'),(18,11,1,'tfa-001',NULL,1,'2021-03-15 15:24:16','2021-03-15 15:24:16','e2335aeb-76a3-4b6e-b319-41b93374a1c0'),(19,10,2,'tfa-001','shop/products/tfa-001',1,'2021-03-15 15:24:16','2021-03-15 15:24:20','e0f3240c-3359-4bfc-9dd8-268be0cbb622'),(20,11,2,'tfa-001',NULL,1,'2021-03-15 15:24:16','2021-03-15 15:24:16','9a01543b-dd90-4ca3-ae77-10ad166b1b4a'),(21,12,1,'lkh-001','shop/products/lkh-001',1,'2021-03-15 15:24:16','2021-03-15 15:24:20','2313ce7f-f021-4dc8-b703-e5f2659bee07'),(22,13,1,'lkh-001',NULL,1,'2021-03-15 15:24:16','2021-03-15 15:24:16','66168322-cd47-456d-b311-9d82e98e19c3'),(23,12,2,'lkh-001','shop/products/lkh-001',1,'2021-03-15 15:24:16','2021-03-15 15:24:20','7983a1e7-57c8-4a28-bce4-58415204e59d'),(24,13,2,'lkh-001',NULL,1,'2021-03-15 15:24:16','2021-03-15 15:24:16','1236004d-2c97-45f1-8d91-58913df68155'),(25,14,1,'fdb-001','shop/products/fdb-001',1,'2021-03-15 15:24:16','2021-03-15 15:24:20','c76617ea-9d23-43e7-8a4f-beee6c1c287a'),(26,15,1,'fdb-001',NULL,1,'2021-03-15 15:24:16','2021-03-15 15:24:16','93ca9c74-7665-42e6-ade5-4fbea4a22207'),(27,14,2,'fdb-001','shop/products/fdb-001',1,'2021-03-15 15:24:16','2021-03-15 15:24:20','bf3dedc6-8751-41c9-b950-908d0ff3dd78'),(28,15,2,'fdb-001',NULL,1,'2021-03-15 15:24:16','2021-03-15 15:24:16','7bc767c8-49af-4dd6-8810-6f964d1d0a97'),(31,17,1,'my-first-blog','blog/my-first-blog',1,'2021-03-15 15:41:19','2021-03-15 15:41:19','63a271a3-7312-4bec-b3e8-e7b86621e999'),(33,18,1,'my-first-blog','blog/my-first-blog',1,'2021-03-15 15:41:19','2021-03-15 15:41:19','4ee22583-ddef-491d-951e-9e8b12a7f98b'),(34,18,2,'my-first-blog','blog/my-first-blog',1,'2021-03-15 15:41:19','2021-03-15 15:41:19','85cd3c31-091d-4dab-addc-310ce17e129c'),(35,19,1,NULL,NULL,1,'2021-03-15 15:55:30','2021-03-15 15:55:30','cb7c4fe6-7ae8-4d1b-813c-932c555613a0'),(36,19,2,NULL,NULL,1,'2021-03-15 15:55:30','2021-03-15 15:55:30','0cbf45ed-ffae-4d47-93c6-8b5dfd332f57'),(37,20,1,'my-first-blog','blog/my-first-blog',1,'2021-03-15 16:17:37','2021-03-15 16:17:37','c73e9643-9ff4-4a8e-9955-e409b588e21b'),(38,20,2,'my-first-blog','blog/my-first-blog',1,'2021-03-15 16:17:37','2021-03-15 16:17:37','96bdf772-209b-4465-9ab0-4a132e5b1655'),(39,21,1,'puppies','category/puppies',1,'2021-04-01 02:35:35','2021-04-01 02:35:46','51530c40-112f-484f-addd-8abf4dfa39d6'),(40,21,2,'puppies','category/puppies',1,'2021-04-01 02:35:35','2021-04-01 02:35:46','5c01578e-7c8c-41de-8a01-58f5b38e7195'),(41,22,1,'kitties','category/kitties',1,'2021-04-01 02:35:44','2021-04-01 02:35:48','2373a4d8-4ee0-4e70-9cc3-6d3b6dd054c3'),(42,22,2,'kitties','category/kitties',1,'2021-04-01 02:35:44','2021-04-01 02:35:48','41ed619d-71c4-48fe-b548-b3d3d8373620'),(43,23,1,NULL,NULL,1,'2021-12-31 20:00:01','2021-12-31 20:00:01','b430eeba-0098-4336-8046-33bfcff92f01'),(44,23,2,NULL,NULL,1,'2021-12-31 20:00:02','2021-12-31 20:00:02','3648ee8e-aff4-4721-b219-ff58f64eb84a'),(45,24,1,'vanilla','flavors/vanilla',1,'2022-01-06 14:13:33','2022-01-06 14:13:38','6ce0e3f4-f18e-4b83-bba8-2b5830eb6ce4'),(47,25,1,NULL,NULL,1,'2022-01-06 14:15:19','2022-01-06 14:15:19','8d883d9f-5a87-4a30-b5e8-42768644c611'),(49,26,1,'vanilla','flavors/vanilla',1,'2022-01-06 14:16:07','2022-01-06 14:16:07','3cd8e24c-69d8-423d-800f-e78a9f511d09'),(50,26,2,'vanilla','flavors/vanilla',1,'2022-01-06 14:16:07','2022-01-06 14:16:07','b0c7c703-37fb-457b-bb4b-a2491c738ffe'),(51,27,1,'chocolate','flavors/chocolate',1,'2022-01-06 14:16:34','2022-01-06 14:16:39','a077996f-2c59-4679-97fd-cc6a8e7a537e'),(53,28,1,NULL,NULL,1,'2022-01-06 14:17:05','2022-01-06 14:17:05','15e8f07d-3fe4-4ec8-894a-9917fa951d26'),(55,29,1,'chocolate','flavors/chocolate',1,'2022-01-06 14:17:18','2022-01-06 14:17:18','3d8627e9-7b11-44ae-9894-7bdb306e4c8c'),(56,29,2,'chocolate','flavors/chocolate',1,'2022-01-06 14:17:18','2022-01-06 14:17:18','43ea8daf-1555-4d18-89ad-8bad5fc32128'),(57,30,1,'strawberry','flavors/strawberry',1,'2022-01-06 14:17:22','2022-01-06 14:17:28','d4b48ef6-212e-4fa5-86be-c024fa4d1ed7'),(59,31,1,NULL,NULL,1,'2022-01-06 14:18:01','2022-01-06 14:18:01','4a6e458a-1e67-4e82-a3f9-5c3a230249c7'),(61,32,1,'strawberry','flavors/strawberry',1,'2022-01-06 14:18:18','2022-01-06 14:18:18','6eb8069f-06c7-465e-b021-7f18a90711e1'),(62,32,2,'strawberry','flavors/strawberry',1,'2022-01-06 14:18:18','2022-01-06 14:18:18','9bde1e70-a84e-465b-a0e5-06252494ff2f'),(63,33,1,'some-order','orders/some-order',1,'2022-01-06 14:47:19','2022-01-06 14:57:30','26a5e992-ea3f-4c18-a60c-7e84eabdfc71'),(65,34,1,'some-order','orders/some-order',1,'2022-01-06 14:57:31','2022-01-06 14:57:31','b5771aa8-58fa-4678-aade-71a97c50b37f'),(66,34,2,'__temp_cfyrozefvlxbfuhhlmpfsmkzlmfbaotibnxi','orders/__temp_cfyrozefvlxbfuhhlmpfsmkzlmfbaotibnxi',1,'2022-01-06 14:57:31','2022-01-06 14:57:31','eb82a7e7-9f40-47e9-b638-23908c0146ed'),(73,38,1,NULL,NULL,1,'2022-01-06 14:58:59','2022-01-06 14:58:59','833efcb9-3d4c-44a3-946e-87a17748de60'),(74,38,2,NULL,NULL,1,'2022-01-06 14:58:59','2022-01-06 14:58:59','9dad11e3-fc7e-4876-ab5f-9cb24a45da18'),(75,39,1,'some-order','orders/some-order',1,'2022-01-06 14:58:59','2022-01-06 14:58:59','356bcda4-35e6-49eb-a572-37a3083be607'),(76,39,2,'entry-35','orders/entry-35',1,'2022-01-06 14:58:59','2022-01-06 14:58:59','149f93c4-b7e9-43cb-8a36-b8394f14140b'),(77,40,1,NULL,NULL,1,'2022-01-06 14:58:59','2022-01-06 14:58:59','8f3275e0-0605-4882-87af-f99707bee9e6'),(78,40,2,NULL,NULL,1,'2022-01-06 14:58:59','2022-01-06 14:58:59','b84c5107-f26d-4674-846a-f0f147add831'),(87,45,1,'some-order','orders/some-order',1,'2022-01-06 15:21:30','2022-01-06 15:21:30','31c6250c-0f52-48a8-9806-e9f9707893ba'),(88,45,2,'entry-35','orders/entry-35',1,'2022-01-06 15:21:30','2022-01-06 15:21:30','d257dae6-6abc-43e0-98d2-55bc58eb917f'),(89,46,1,NULL,NULL,1,'2022-01-06 15:21:30','2022-01-06 15:21:30','62d2ee46-af4e-46f2-b9eb-123c4f363719'),(90,46,2,NULL,NULL,1,'2022-01-06 15:21:30','2022-01-06 15:21:30','ddcacb76-9468-4705-8873-aabfbbed69be'),(101,52,1,NULL,NULL,1,'2022-01-06 15:26:16','2022-01-06 15:26:16','841c7665-e73a-4aca-abe8-a6f0acbd8c97'),(102,52,2,NULL,NULL,1,'2022-01-06 15:26:16','2022-01-06 15:26:16','db10bd99-04ad-4dc3-919c-ac62012e8208'),(103,53,1,'some-order','orders/some-order',1,'2022-01-06 15:26:16','2022-01-06 15:26:16','799d29dd-23f3-468d-ba32-f994b4cc236e'),(104,53,2,'entry-35','orders/entry-35',1,'2022-01-06 15:26:16','2022-01-06 15:26:16','591e9a0b-2a4a-4643-93df-0c27379d4271'),(105,54,1,NULL,NULL,1,'2022-01-06 15:26:16','2022-01-06 15:26:16','803da9e5-5175-4850-ab12-338dea64504e'),(106,54,2,NULL,NULL,1,'2022-01-06 15:26:16','2022-01-06 15:26:16','b447267a-cb0f-4bc6-8e38-5f3c2bd1af92'),(107,55,1,NULL,NULL,1,'2022-01-06 15:26:16','2022-01-06 15:26:16','baf202b9-c310-4461-9778-452520c3bf53'),(108,55,2,NULL,NULL,1,'2022-01-06 15:26:17','2022-01-06 15:26:17','9c3ef045-1160-4744-9c49-ff5cb1aacae9'),(115,59,1,'some-order','orders/some-order',1,'2022-01-06 15:26:24','2022-01-06 15:26:24','c6c3339a-ec66-40dd-9165-b197ad8303c4'),(116,59,2,'entry-35','orders/entry-35',1,'2022-01-06 15:26:24','2022-01-06 15:26:24','9b2f5d6e-5900-4483-8623-ad8eb8643651'),(117,60,1,NULL,NULL,1,'2022-01-06 15:26:24','2022-01-06 15:26:24','da42f979-984a-4a59-9878-989a239d2561'),(118,60,2,NULL,NULL,1,'2022-01-06 15:26:24','2022-01-06 15:26:24','2b111cf4-fbc1-4da2-a1a0-390c84891209'),(119,61,1,NULL,NULL,1,'2022-01-06 15:26:24','2022-01-06 15:26:24','8867b60e-a53d-4d0e-b747-8e0878d18658'),(120,61,2,NULL,NULL,1,'2022-01-06 15:26:24','2022-01-06 15:26:24','89b319be-b9b4-4cb7-a15c-e28814ac75ae'),(127,65,1,'some-order','orders/some-order',1,'2022-01-06 15:26:39','2022-01-06 15:26:39','b229d456-01f2-4644-95bc-34e7416fee99'),(128,65,2,'entry-35','orders/entry-35',1,'2022-01-06 15:26:39','2022-01-06 15:26:39','4df12718-e6dd-455d-b966-d863c3ef8d54'),(129,66,1,NULL,NULL,1,'2022-01-06 15:26:39','2022-01-06 15:26:39','5a021b4e-93be-4b04-ba49-02513e8e2cc6'),(130,66,2,NULL,NULL,1,'2022-01-06 15:26:39','2022-01-06 15:26:39','98119e8f-63cd-4570-92d1-fb7d2c5c3861'),(131,67,1,NULL,NULL,1,'2022-01-06 15:26:39','2022-01-06 15:26:39','2880a331-decf-4683-ba13-2cdc2c24a61c'),(132,67,2,NULL,NULL,1,'2022-01-06 15:26:39','2022-01-06 15:26:39','8d032a63-4815-44f6-a6fd-23aaaa6482c5'),(139,71,1,'some-order','orders/some-order',1,'2022-01-06 15:34:41','2022-01-06 15:34:41','0f4ea3ee-e519-4c43-b32b-13aeef8b8749'),(140,71,2,'entry-35','orders/entry-35',1,'2022-01-06 15:34:41','2022-01-06 15:34:41','cf18d93f-26aa-4ea0-8240-cb61c09be87f'),(141,72,1,NULL,NULL,1,'2022-01-06 15:34:41','2022-01-06 15:34:41','63acacb1-96a3-4f3f-84f4-0ac000e59853'),(142,72,2,NULL,NULL,1,'2022-01-06 15:34:41','2022-01-06 15:34:41','a5c26303-2192-4c80-a96e-972b1301eacf'),(143,73,1,NULL,NULL,1,'2022-01-06 15:34:41','2022-01-06 15:34:41','7b7935cf-5268-42c1-b0c9-aa4185b9ce5e'),(144,73,2,NULL,NULL,1,'2022-01-06 15:34:41','2022-01-06 15:34:41','51ca9aae-5df0-4f48-b0ab-fb4f1ae86d0c'),(145,74,1,'some-order','orders/some-order',1,'2022-01-06 15:34:49','2022-01-06 15:34:49','12437da8-9b87-4d40-8f3d-c1f18c60cf57'),(146,74,2,'entry-35','orders/entry-35',1,'2022-01-06 15:34:49','2022-01-06 15:34:49','bfbb2a8c-39fe-45f4-91c0-85c46bedbfff'),(147,75,1,NULL,NULL,1,'2022-01-06 15:34:49','2022-01-06 15:34:49','b09f7197-d5b6-4b04-9ea0-87ebf69e1dd3'),(148,75,2,NULL,NULL,1,'2022-01-06 15:34:49','2022-01-06 15:34:49','e5d045d6-6f35-47ff-94ef-f385d5b3ab6c'),(149,76,1,NULL,NULL,1,'2022-01-06 15:34:49','2022-01-06 15:34:49','469e0629-fb6e-4c00-8c3b-f4a6a69b9345'),(150,76,2,NULL,NULL,1,'2022-01-06 15:34:49','2022-01-06 15:34:49','d18f9615-5995-4359-890f-1c7eca805514'),(157,80,1,'some-order','orders/some-order',1,'2022-01-06 15:38:44','2022-01-06 15:38:44','da5d5b61-3081-4847-862d-641d9df651e2'),(158,80,2,'entry-35','orders/entry-35',1,'2022-01-06 15:38:44','2022-01-06 15:38:44','76408e61-34a8-4971-bd59-b517d74893c5'),(159,81,1,NULL,NULL,1,'2022-01-06 15:38:44','2022-01-06 15:38:44','e2d9af21-3f8f-4cf6-adae-b5d1758830a1'),(160,81,2,NULL,NULL,1,'2022-01-06 15:38:44','2022-01-06 15:38:44','71e49e8b-b922-4c70-a760-3fa03c881f80'),(161,82,1,NULL,NULL,1,'2022-01-06 15:38:44','2022-01-06 15:38:44','3de32a6f-496b-4b5e-8e80-02c371285f01'),(162,82,2,NULL,NULL,1,'2022-01-06 15:38:44','2022-01-06 15:38:44','616c916d-3c36-4f2b-b6b1-fe51e92cfed1'),(169,86,1,'some-order','orders/some-order',1,'2022-01-06 15:45:36','2022-01-06 15:45:36','c326c649-6141-4c6b-9687-5b1d8de6770f'),(170,86,2,'entry-35','orders/entry-35',1,'2022-01-06 15:45:36','2022-01-06 15:45:36','b95e8d82-80f4-4f54-997d-cad4eb1411b2'),(171,87,1,NULL,NULL,1,'2022-01-06 15:45:36','2022-01-06 15:45:36','71204773-61d2-45e2-b39d-f652b6a562d7'),(172,87,2,NULL,NULL,1,'2022-01-06 15:45:36','2022-01-06 15:45:36','97498af2-3552-40a6-8a36-ed0b66aae7b7'),(173,88,1,NULL,NULL,1,'2022-01-06 15:45:36','2022-01-06 15:45:36','587632e9-047c-4670-89c1-9611d59da702'),(174,88,2,NULL,NULL,1,'2022-01-06 15:45:36','2022-01-06 15:45:36','45a75c86-e47f-457a-bed3-79f296e8f5a4'),(181,92,1,'some-order','orders/some-order',1,'2022-01-06 15:46:19','2022-01-06 15:46:19','20d11858-36a1-4078-a8c9-36157d150ce4'),(182,92,2,'entry-35','orders/entry-35',1,'2022-01-06 15:46:19','2022-01-06 15:46:19','ceeaa98d-80b1-4caa-9786-506ca86f7fc3'),(183,93,1,NULL,NULL,1,'2022-01-06 15:46:19','2022-01-06 15:46:19','980a4d2e-5383-4fd4-bd99-4ceac23b631f'),(184,93,2,NULL,NULL,1,'2022-01-06 15:46:19','2022-01-06 15:46:19','6da11e15-36ba-44fc-98b7-03885f5693a2'),(185,94,1,NULL,NULL,1,'2022-01-06 15:46:19','2022-01-06 15:46:19','d6ea0317-7c80-427f-a0d7-92f68c83eb24'),(186,94,2,NULL,NULL,1,'2022-01-06 15:46:19','2022-01-06 15:46:19','94bddf86-7954-4195-b62f-3c0e1a7699f3'),(193,98,1,'some-order','orders/some-order',1,'2022-01-06 15:55:36','2022-01-06 15:55:36','ad935762-78a6-44f5-9da4-08125dcc6ccc'),(194,98,2,'entry-35','orders/entry-35',1,'2022-01-06 15:55:36','2022-01-06 15:55:36','27819988-d93f-4efb-b6f1-78ee6071b387'),(195,99,1,NULL,NULL,1,'2022-01-06 15:55:36','2022-01-06 15:55:36','fee1f715-d2b5-49b6-a164-f593f690de98'),(196,99,2,NULL,NULL,1,'2022-01-06 15:55:36','2022-01-06 15:55:36','f546f607-81f1-4909-ad8d-603715c79239'),(197,100,1,NULL,NULL,1,'2022-01-06 15:55:36','2022-01-06 15:55:36','833fe424-a242-4fcf-b627-12a85f748f8a'),(198,100,2,NULL,NULL,1,'2022-01-06 15:55:36','2022-01-06 15:55:36','27b31bdf-cfa8-4cf5-8ad2-1b18ca365448'),(211,107,1,'some-order','orders/some-order',1,'2022-01-06 15:56:50','2022-01-06 15:56:50','b47df674-8f85-4280-8c5b-a092e26a9980'),(212,107,2,'entry-35','orders/entry-35',1,'2022-01-06 15:56:50','2022-01-06 15:56:50','7370a2ae-89cb-46cc-9519-3eaf2dc9457f'),(213,108,1,NULL,NULL,1,'2022-01-06 15:56:50','2022-01-06 15:56:50','ba3b60de-e3b2-49b1-ab49-e35eb8a0c8a6'),(214,108,2,NULL,NULL,1,'2022-01-06 15:56:50','2022-01-06 15:56:50','2f66c37b-6541-4c06-b0a9-377ed44f0036'),(215,109,1,NULL,NULL,1,'2022-01-06 15:56:50','2022-01-06 15:56:50','8757a88b-6eab-49b2-a2fd-106dd46d9897'),(216,109,2,NULL,NULL,1,'2022-01-06 15:56:50','2022-01-06 15:56:50','933f6817-0e6f-49bd-8fc9-011700127e55'),(223,113,1,'some-order','orders/some-order',1,'2022-01-06 16:03:37','2022-01-06 16:03:37','35da3767-9711-45ad-9816-3691e5320bb6'),(224,113,2,'entry-35','orders/entry-35',1,'2022-01-06 16:03:37','2022-01-06 16:03:37','714be976-a653-4fe5-8888-34dee5e44464'),(225,114,1,NULL,NULL,1,'2022-01-06 16:03:37','2022-01-06 16:03:37','dd8b82ba-813c-4f60-8a23-a2fca1566107'),(226,114,2,NULL,NULL,1,'2022-01-06 16:03:37','2022-01-06 16:03:37','de9b5b90-b9e6-4a16-ada0-6e2e5657c4b1'),(227,115,1,NULL,NULL,1,'2022-01-06 16:03:37','2022-01-06 16:03:37','a4f8e920-e4f8-48a3-9b78-a93ff18a0fcc'),(228,115,2,NULL,NULL,1,'2022-01-06 16:03:37','2022-01-06 16:03:37','55f8d8e7-6bcd-4068-bf96-33dcef1cb178'),(229,116,1,'some-order','orders/some-order',1,'2022-01-06 16:03:42','2022-01-06 16:03:42','0304d9f9-2778-474d-b7ed-05f7791c6e53'),(230,116,2,'entry-35','orders/entry-35',1,'2022-01-06 16:03:42','2022-01-06 16:03:42','ab13a893-c14e-4635-8378-df48791a821a'),(231,117,1,NULL,NULL,1,'2022-01-06 16:03:42','2022-01-06 16:03:42','dbab5b81-c210-4cdb-b596-3125541d211f'),(232,117,2,NULL,NULL,1,'2022-01-06 16:03:42','2022-01-06 16:03:42','f0bbd7d3-6a68-4fd3-a75b-656319ac52a7'),(233,118,1,NULL,NULL,1,'2022-01-06 16:03:42','2022-01-06 16:03:42','9d35a922-6a7f-43f4-988b-581da34528e3'),(234,118,2,NULL,NULL,1,'2022-01-06 16:03:42','2022-01-06 16:03:42','16739d8a-c5b5-42f2-9009-04e057aaad00'),(247,125,1,NULL,NULL,1,'2022-01-06 16:09:27','2022-01-06 16:09:27','2feb3e76-8f78-49e0-83be-e68d5c1b8185'),(248,125,2,NULL,NULL,1,'2022-01-06 16:09:27','2022-01-06 16:09:27','aa26a340-9e10-4a5c-a268-c330e22bb8b9'),(249,126,1,'some-order','orders/some-order',1,'2022-01-06 16:09:27','2022-01-06 16:09:27','a02e1959-ca51-4a05-a6ca-131d0fd8faab'),(250,126,2,'entry-35','orders/entry-35',1,'2022-01-06 16:09:27','2022-01-06 16:09:27','4f15dc5e-0542-4e6e-80b3-59576d61ae76'),(251,127,1,NULL,NULL,1,'2022-01-06 16:09:27','2022-01-06 16:09:27','a7a70193-f5ce-4295-a5a8-051fdf5b9a98'),(252,127,2,NULL,NULL,1,'2022-01-06 16:09:27','2022-01-06 16:09:27','1add2182-db76-4349-b66f-884d84a1275d'),(253,128,1,NULL,NULL,1,'2022-01-06 16:09:27','2022-01-06 16:09:27','1ec1e183-c470-45e2-ac52-2a7803d2f7ae'),(254,128,2,NULL,NULL,1,'2022-01-06 16:09:27','2022-01-06 16:09:27','632a4dac-7dca-4090-a7c6-0f80b767dfc9'),(255,129,1,NULL,NULL,1,'2022-01-06 16:09:27','2022-01-06 16:09:27','6377a1b0-c089-4237-b897-5ae74e3ee16f'),(256,129,2,NULL,NULL,1,'2022-01-06 16:09:27','2022-01-06 16:09:27','7508b251-2f3e-4a60-98b5-5bc19319caed'),(265,134,1,'some-order','orders/some-order',1,'2022-01-06 16:09:38','2022-01-06 16:09:38','602e4944-fc23-4539-a031-7e6ef56ebb3f'),(266,134,2,'entry-35','orders/entry-35',1,'2022-01-06 16:09:38','2022-01-06 16:09:38','4ef91ff0-fa7f-488f-a13f-33c56a279c9e'),(267,135,1,NULL,NULL,1,'2022-01-06 16:09:38','2022-01-06 16:09:38','bca4d6ef-e91e-4e4f-baf9-a6b031b18116'),(268,135,2,NULL,NULL,1,'2022-01-06 16:09:38','2022-01-06 16:09:38','faa301e3-1f68-4f92-bceb-e88e83b33715'),(269,136,1,NULL,NULL,1,'2022-01-06 16:09:38','2022-01-06 16:09:38','efba4d4f-7e68-4f52-9bc6-e7f0e5c1b0b1'),(270,136,2,NULL,NULL,1,'2022-01-06 16:09:38','2022-01-06 16:09:38','c5cad60b-e9a5-4a79-af33-4df2e5ddf044'),(271,137,1,NULL,NULL,1,'2022-01-06 16:09:38','2022-01-06 16:09:38','daedd5c4-488c-44ce-9742-05436440522a'),(272,137,2,NULL,NULL,1,'2022-01-06 16:09:38','2022-01-06 16:09:38','f3b5aa66-6cf9-4f8a-94ed-6aaa5783174c'),(281,142,1,'some-order','orders/some-order',1,'2022-01-06 16:09:43','2022-01-06 16:09:43','3af6629c-1f7c-43d8-be85-9d78cdb1cd4d'),(282,142,2,'entry-35','orders/entry-35',1,'2022-01-06 16:09:43','2022-01-06 16:09:43','2fa7fc56-1cce-4944-8aac-d50be5c581e1'),(283,143,1,NULL,NULL,1,'2022-01-06 16:09:44','2022-01-06 16:09:44','31f07f92-3671-4f73-ba5e-78b4c7ff64aa'),(284,143,2,NULL,NULL,1,'2022-01-06 16:09:44','2022-01-06 16:09:44','ed43789f-2223-4782-bfed-861a719d0c87'),(285,144,1,NULL,NULL,1,'2022-01-06 16:09:44','2022-01-06 16:09:44','ce5e1a20-1908-4dcf-a2f0-3b15304c426a'),(286,144,2,NULL,NULL,1,'2022-01-06 16:09:44','2022-01-06 16:09:44','6b1efba0-5da0-4652-a9c7-f56971ba1919'),(293,148,1,'some-order','orders/some-order',1,'2022-01-06 16:09:53','2022-01-06 16:09:53','e8d1322b-12cf-40c4-b86e-bd7c516f85fb'),(294,148,2,'entry-35','orders/entry-35',1,'2022-01-06 16:09:53','2022-01-06 16:09:53','c4e14639-55b5-470c-aeda-c29c1147da6e'),(303,153,1,NULL,NULL,1,'2022-01-06 16:13:32','2022-01-06 16:13:32','25b347b7-90fa-405a-8b8b-20766c11ad17'),(304,153,2,NULL,NULL,1,'2022-01-06 16:13:32','2022-01-06 16:13:32','2754acf3-69de-4c23-8a95-bf650fcaa8a1'),(305,154,1,'some-order','orders/some-order',1,'2022-01-06 16:13:32','2022-01-06 16:13:32','0bdad536-e0fb-4e91-a572-b358dc0a7fad'),(306,154,2,'entry-35','orders/entry-35',1,'2022-01-06 16:13:32','2022-01-06 16:13:32','02cb42ae-e71d-4b15-aa43-b1f1dc571f67'),(307,155,1,NULL,NULL,1,'2022-01-06 16:13:32','2022-01-06 16:13:32','1337d019-f421-4951-a798-65e8b5feede5'),(308,155,2,NULL,NULL,1,'2022-01-06 16:13:32','2022-01-06 16:13:32','09289658-a8f6-4004-a399-b4a5e620d604'),(313,158,1,'some-order','orders/some-order',1,'2022-01-06 16:13:55','2022-01-06 16:13:55','5f9125dc-a6a1-4fb8-963e-2746081c27c2'),(314,158,2,'entry-35','orders/entry-35',1,'2022-01-06 16:13:55','2022-01-06 16:13:55','1a420446-ee6e-407a-8e34-789d1c276d87'),(327,165,1,NULL,NULL,1,'2022-01-06 17:41:16','2022-01-06 17:41:16','e9851ff3-d210-47f5-acf0-b9329ee27503'),(329,166,1,'some-order','orders/some-order',1,'2022-01-06 17:41:16','2022-01-06 17:41:16','1ea0ff1e-ddf3-4e52-a0a9-9ff45b150126'),(330,166,2,'entry-35','orders/entry-35',1,'2022-01-06 17:41:16','2022-01-06 17:41:16','de33b9a1-6015-4f1f-981a-545b76e06599'),(331,167,1,NULL,NULL,1,'2022-01-06 17:41:16','2022-01-06 17:41:16','7e6ee422-b367-45c6-95f3-1aa7f09667d2'),(332,167,2,NULL,NULL,1,'2022-01-06 17:41:16','2022-01-06 17:41:16','745054e7-dd86-401a-9ebd-21508198df4b'),(345,174,1,NULL,NULL,1,'2022-01-06 17:41:50','2022-01-06 17:41:50','647ccaa4-9f32-41f5-900d-1c18c9b729de'),(347,175,1,'some-order','orders/some-order',1,'2022-01-06 17:41:50','2022-01-06 17:41:50','d25e882a-f824-4c47-b27d-b03d80a889d0'),(348,175,2,'entry-35','orders/entry-35',1,'2022-01-06 17:41:50','2022-01-06 17:41:50','11bd62e8-33c3-40dd-97b0-a44548dc4b43'),(349,176,1,NULL,NULL,1,'2022-01-06 17:41:50','2022-01-06 17:41:50','64b92458-3485-4006-9558-5a042856f48c'),(350,176,2,NULL,NULL,1,'2022-01-06 17:41:50','2022-01-06 17:41:50','b2af8ef3-670b-4085-92eb-454b6343bc21'),(351,177,1,NULL,NULL,1,'2022-01-06 17:41:50','2022-01-06 17:41:50','58369f19-2185-4af3-8af1-0953710e99d4'),(352,177,2,NULL,NULL,1,'2022-01-06 17:41:50','2022-01-06 17:41:50','b158ee35-2feb-4aa2-8c51-9f04080d1bae'),(359,181,1,'some-order','orders/some-order',1,'2022-01-06 17:44:55','2022-01-06 17:44:55','3672b498-ea09-4afa-8eff-13a95952c0a8'),(360,181,2,'entry-35','orders/entry-35',1,'2022-01-06 17:44:55','2022-01-06 17:44:55','aff20be3-3a8a-4677-a2ed-517040e206fc'),(361,182,1,NULL,NULL,1,'2022-01-06 17:44:55','2022-01-06 17:44:55','cd1b9c0f-d80c-491b-a2c6-ced3cd0935a6'),(362,182,2,NULL,NULL,1,'2022-01-06 17:44:55','2022-01-06 17:44:55','93d88abb-e297-4242-868f-005502f0392d'),(363,183,1,NULL,NULL,1,'2022-01-06 17:44:55','2022-01-06 17:44:55','c9fab20d-7434-4f6f-ae60-baabd62d207f'),(364,183,2,NULL,NULL,1,'2022-01-06 17:44:55','2022-01-06 17:44:55','90018072-abf7-49b7-9a2c-5fdc7c2ea3d3'),(375,189,1,NULL,NULL,1,'2022-01-06 17:45:46','2022-01-06 17:45:46','84c00834-610d-4dba-99f4-a1f6892aa8c2'),(377,190,1,'some-order','orders/some-order',1,'2022-01-06 17:45:46','2022-01-06 17:45:46','acd83e3b-ef77-432a-9a18-9548585e396e'),(378,190,2,'entry-35','orders/entry-35',1,'2022-01-06 17:45:46','2022-01-06 17:45:46','9d8c2cb4-cefa-4cbf-9db3-7d0b25205f3e'),(379,191,1,NULL,NULL,1,'2022-01-06 17:45:46','2022-01-06 17:45:46','2cd9ff00-b2fb-41db-9e4a-92699f197eb6'),(380,191,2,NULL,NULL,1,'2022-01-06 17:45:46','2022-01-06 17:45:46','24959caf-aa4e-4f45-9c87-432237992b75'),(381,192,1,NULL,NULL,1,'2022-01-06 17:45:46','2022-01-06 17:45:46','734229af-5dbb-42f0-a3cf-a48904af1d03'),(382,192,2,NULL,NULL,1,'2022-01-06 17:45:46','2022-01-06 17:45:46','684a6faa-f2a6-45eb-b434-e7e86d2e9372'),(383,193,1,NULL,NULL,1,'2022-01-06 17:45:46','2022-01-06 17:45:46','9d4c7c3a-0428-4d00-a0a3-9b1644a8a928'),(384,193,2,NULL,NULL,1,'2022-01-06 17:45:46','2022-01-06 17:45:46','a6debd24-156c-49f1-b01c-04e5c903da0f'),(385,194,1,'some-order','orders/some-order',1,'2022-01-06 17:47:14','2022-01-06 17:47:14','c437f6ed-8835-49f3-adf4-af787902deb5'),(386,194,2,'entry-35','orders/entry-35',1,'2022-01-06 17:47:14','2022-01-06 17:47:14','2b932d60-5600-4d98-8936-566c7c320c48'),(387,195,1,NULL,NULL,1,'2022-01-06 17:47:14','2022-01-06 17:47:14','cac50059-9b97-4381-a96f-35da35d93510'),(388,195,2,NULL,NULL,1,'2022-01-06 17:47:14','2022-01-06 17:47:14','e8554b4f-c63c-4710-8c4d-1a2264fa2287'),(389,196,1,NULL,NULL,1,'2022-01-06 17:47:14','2022-01-06 17:47:14','281b7807-4bf2-466a-a457-f3c2f80cbe4b'),(390,196,2,NULL,NULL,1,'2022-01-06 17:47:14','2022-01-06 17:47:14','d5aec697-f996-481e-9bfe-909365051679'),(391,197,1,NULL,NULL,1,'2022-01-06 17:47:14','2022-01-06 17:47:14','76ad47b2-d535-4876-9417-65f9a55e1596'),(392,197,2,NULL,NULL,1,'2022-01-06 17:47:14','2022-01-06 17:47:14','824b14b2-18c8-4946-82fa-3a2f0ae676f0'),(393,198,1,'my-first-blog','blog/my-first-blog',1,'2022-01-18 15:42:04','2022-01-18 15:42:04','49734ff0-89d5-4cda-a922-3fae3d61eb7d'),(394,198,2,'my-first-blog','blog/my-first-blog',1,'2022-01-18 15:42:04','2022-01-18 15:42:04','a55fc425-4670-44de-8036-b9471a677127'),(395,199,1,'my-first-blog','blog/my-first-blog',1,'2022-01-18 15:42:55','2022-01-18 15:42:55','b5fe3cc8-638d-47cf-b676-f6be5b84aef1'),(396,199,2,'my-first-blog','blog/my-first-blog',1,'2022-01-18 15:42:55','2022-01-18 15:42:55','56ca5071-7a28-4ea4-a6f3-034dbc31f810'),(401,204,1,'some-order','orders/some-order',1,'2022-01-22 03:05:59','2022-01-22 03:05:59','e4863393-a2d9-4a00-8799-d8a6eba53f84'),(402,205,1,NULL,NULL,1,'2022-01-22 03:05:59','2022-01-22 03:05:59','e7ed4c4e-d1fd-4a49-a549-0f2c3833dcee'),(403,206,1,NULL,NULL,1,'2022-01-22 03:05:59','2022-01-22 03:05:59','f9aea065-9f9f-4d8b-a958-5ad020c3bafd'),(404,207,1,NULL,NULL,1,'2022-01-22 03:05:59','2022-01-22 03:05:59','a018bd8e-566c-409f-bf58-ff511dba3395'),(409,212,1,'some-order','orders/some-order',1,'2022-01-22 03:16:41','2022-01-22 03:16:41','f1ee43f4-b659-4c52-84e3-34a9f4b91a29'),(410,213,1,NULL,NULL,1,'2022-01-22 03:16:41','2022-01-22 03:16:41','b797d3fe-ac1a-4fb5-b6f9-efcf595d3896'),(411,214,1,NULL,NULL,1,'2022-01-22 03:16:41','2022-01-22 03:16:41','31860c22-8e90-4f42-a864-e3af14549722'),(412,215,1,NULL,NULL,1,'2022-01-22 03:16:41','2022-01-22 03:16:41','08752ab2-eb10-4653-a47c-d009f0a2226f'),(413,216,1,'landing-page','pages/landing-page',1,'2022-01-22 03:50:16','2022-01-22 03:50:27','411fc8bf-3888-493b-8dc1-83e0ca8d7610'),(414,217,1,'landing-page','pages/landing-page',1,'2022-01-22 03:51:15','2022-01-22 03:51:15','b68248b6-3086-4d49-abc7-22496e646d1a'),(416,219,1,NULL,NULL,1,'2022-01-22 03:52:24','2022-01-22 03:52:24','8f8e2dc1-ac72-4ae2-be5e-213d225a13fa'),(417,220,1,NULL,NULL,1,'2022-01-22 03:52:31','2022-01-22 03:52:31','912b951b-5a14-47d5-ace7-0f790dbb349c'),(418,221,1,NULL,NULL,1,'2022-01-22 03:52:36','2022-01-22 03:52:36','e3e5ea97-d9ba-4f21-99dc-bd6d45b3b5e9'),(419,222,1,NULL,NULL,1,'2022-01-22 03:52:38','2022-01-22 03:52:38','f08480a7-b837-4ff0-9cd2-8cd4a7f69cb8'),(420,223,1,NULL,NULL,1,'2022-01-22 03:52:38','2022-01-22 03:52:38','57109fc1-8997-4743-94b6-590f169d0fcb'),(421,224,1,NULL,NULL,1,'2022-01-22 03:53:21','2022-01-22 03:53:21','1f73f3c3-0132-4e34-8556-d07aa820683e'),(422,225,1,NULL,NULL,1,'2022-01-22 03:53:21','2022-01-22 03:53:21','3b6bf707-f6e0-4966-a3d0-d58c6b4b9d2f'),(423,226,1,NULL,NULL,1,'2022-01-22 03:53:26','2022-01-22 03:53:26','d3561241-2886-4fdd-aecf-0ffa7a9d12c2'),(424,227,1,NULL,NULL,1,'2022-01-22 03:53:26','2022-01-22 03:53:26','bbbef08e-5263-4ace-9a38-02278fe4a855'),(425,228,1,NULL,NULL,1,'2022-01-22 03:53:35','2022-01-22 03:53:35','a3c097b2-36e1-4319-a0bf-e3647d48d6ea'),(426,229,1,NULL,NULL,1,'2022-01-22 03:53:35','2022-01-22 03:53:35','3bd616eb-6da4-463c-b756-13aff92b35d5'),(427,230,1,NULL,NULL,1,'2022-01-22 03:53:37','2022-01-22 03:53:37','b8e1f56d-5fb0-4b45-9aee-d44c1500898d'),(428,231,1,NULL,NULL,1,'2022-01-22 03:53:37','2022-01-22 03:53:37','9e294f0c-8c48-4088-a30a-25cfd62a8200'),(429,232,1,NULL,NULL,1,'2022-01-22 03:53:37','2022-01-22 03:53:37','3c8e24f3-6186-4003-97a0-b16c506b48af'),(430,233,1,NULL,NULL,1,'2022-01-22 03:53:51','2022-01-22 03:53:51','b0918866-78ed-4a97-9c75-83eeda4bccca'),(431,234,1,NULL,NULL,1,'2022-01-22 03:53:51','2022-01-22 03:53:51','b1591055-8230-4366-9739-a353b048b0f9'),(432,235,1,NULL,NULL,1,'2022-01-22 03:53:51','2022-01-22 03:53:51','ab0374a4-d55d-4001-88ed-05bf20d950eb'),(436,239,1,NULL,NULL,1,'2022-01-22 03:54:01','2022-01-22 03:54:01','fe114e83-4b70-47d4-bb95-7e3621f51455'),(437,240,1,NULL,NULL,1,'2022-01-22 03:54:01','2022-01-22 03:54:01','a32b06d9-bfb7-4385-974a-e7ef15698a38'),(438,241,1,NULL,NULL,1,'2022-01-22 03:54:01','2022-01-22 03:54:01','a1219ae1-4b98-4874-8029-a6d05f4b613f'),(439,242,1,'landing-page','pages/landing-page',1,'2022-01-22 03:54:01','2022-01-22 03:54:01','5f1c3d8a-1244-4df7-8e07-5b2623be66d1'),(440,243,1,NULL,NULL,1,'2022-01-22 03:54:01','2022-01-22 03:54:01','266b6a2d-4fd0-4240-86bc-e0f40ca35e28'),(441,244,1,NULL,NULL,1,'2022-01-22 03:54:01','2022-01-22 03:54:01','c5ad1ed1-2f54-4d22-88db-5475f4323613'),(442,245,1,NULL,NULL,1,'2022-01-22 03:54:01','2022-01-22 03:54:01','e68cc1f3-0061-482a-a382-e6cc69a41c8a'),(447,250,1,'landing-page','pages/landing-page',1,'2022-01-22 05:06:24','2022-01-22 05:06:24','b40a9196-816a-4cdb-b836-f73c67d4dbb9'),(448,251,1,NULL,NULL,1,'2022-01-22 05:06:24','2022-01-22 05:06:24','882e2adc-5c7c-4765-b7a1-d9f72a38ec03'),(449,252,1,NULL,NULL,1,'2022-01-22 05:06:24','2022-01-22 05:06:24','5f2aa6b7-435a-4049-ba10-fa573db4321e'),(450,253,1,NULL,NULL,1,'2022-01-22 05:06:24','2022-01-22 05:06:24','8ec2f5d4-3988-4a00-863d-fa97be1b5192'),(455,258,1,'landing-page','pages/landing-page',1,'2022-01-22 05:07:21','2022-01-22 05:07:21','698f6e1d-3a72-4c75-b97e-41e735e24e45'),(456,259,1,NULL,NULL,1,'2022-01-22 05:07:21','2022-01-22 05:07:21','5a5b9a52-da9d-4b12-8015-1840b05fa51f'),(457,260,1,NULL,NULL,1,'2022-01-22 05:07:21','2022-01-22 05:07:21','81fe814c-3cb6-4404-8151-7063b77234c1'),(458,261,1,NULL,NULL,1,'2022-01-22 05:07:21','2022-01-22 05:07:21','83c7394d-0b66-496c-9bd9-38e0e735794d'),(463,266,1,'landing-page','pages/landing-page',1,'2022-01-22 05:07:29','2022-01-22 05:07:29','4dc72a4a-e0b1-4e06-a898-5c85a286f5c1'),(464,267,1,NULL,NULL,1,'2022-01-22 05:07:29','2022-01-22 05:07:29','d47f6d17-14b6-4241-866b-dcf08a7464c4'),(465,268,1,NULL,NULL,1,'2022-01-22 05:07:29','2022-01-22 05:07:29','15b70126-de34-4500-9945-e404977b7f60'),(466,269,1,NULL,NULL,1,'2022-01-22 05:07:29','2022-01-22 05:07:29','69ce829e-c099-4450-be70-578788a54d53'),(471,274,1,'landing-page','pages/landing-page',1,'2022-01-22 05:08:21','2022-01-22 05:08:21','329b2eb4-2d7c-4228-8194-96e416bfe83d'),(472,275,1,NULL,NULL,1,'2022-01-22 05:08:21','2022-01-22 05:08:21','de201fa1-f561-4677-b569-5d1c531e5dd2'),(473,276,1,NULL,NULL,1,'2022-01-22 05:08:21','2022-01-22 05:08:21','54d1dc75-3cef-4d9e-ad97-1e0724eb103b'),(474,277,1,NULL,NULL,1,'2022-01-22 05:08:21','2022-01-22 05:08:21','aceece83-74e8-475b-ae92-27fbedd77329'),(479,282,1,'landing-page','pages/landing-page',1,'2022-01-22 05:21:59','2022-01-22 05:21:59','6e9a63ba-e753-444a-b093-5f25f93728a1'),(480,283,1,NULL,NULL,1,'2022-01-22 05:21:59','2022-01-22 05:21:59','fce8b647-3af3-4814-8397-d7195256f98b'),(481,284,1,NULL,NULL,1,'2022-01-22 05:21:59','2022-01-22 05:21:59','962c30dd-6839-40be-b8fe-8f9c16ba48b5'),(482,285,1,NULL,NULL,1,'2022-01-22 05:21:59','2022-01-22 05:21:59','3ab37930-aec4-4180-b49d-4923eab1f8aa'),(487,290,1,'landing-page','pages/landing-page',1,'2022-01-22 18:51:06','2022-01-22 18:51:06','f2009459-4c28-432d-acd0-0ef16dccaaf3'),(488,291,1,NULL,NULL,1,'2022-01-22 18:51:06','2022-01-22 18:51:06','21d0e4e7-9d8c-4a97-88d9-2a4607024fcc'),(489,292,1,NULL,NULL,1,'2022-01-22 18:51:06','2022-01-22 18:51:06','784bf650-b009-4b9a-accc-2e007666657a'),(490,293,1,NULL,NULL,1,'2022-01-22 18:51:06','2022-01-22 18:51:06','47be1df7-310e-4fbd-a9c3-3a1dec058075'),(495,298,1,'landing-page','pages/landing-page',1,'2022-01-22 18:54:52','2022-01-22 18:54:52','2df542d1-c2a8-4a10-9408-0e7f4603cea0'),(496,299,1,NULL,NULL,1,'2022-01-22 18:54:52','2022-01-22 18:54:52','a5f77372-ecf3-4ea5-b9bf-ae8339da8ac2'),(497,300,1,NULL,NULL,1,'2022-01-22 18:54:52','2022-01-22 18:54:52','1be1e1ff-4ea0-4b6a-9c88-4d25ce16a68a'),(498,301,1,NULL,NULL,1,'2022-01-22 18:54:52','2022-01-22 18:54:52','877c0646-537e-40ff-81f2-e666b163383a'),(499,302,1,'landing-page','pages/landing-page',1,'2022-01-23 00:08:26','2022-01-23 00:08:26','08c42a10-ee14-4da3-9811-74388d466be2'),(500,303,1,NULL,NULL,1,'2022-01-23 00:08:26','2022-01-23 00:08:26','29df3e51-9d87-4d29-8c71-a0ddd6653972'),(501,304,1,NULL,NULL,1,'2022-01-23 00:08:26','2022-01-23 00:08:26','5ad349f0-e32a-4ed5-9af1-cba462c71f97'),(502,305,1,NULL,NULL,1,'2022-01-23 00:08:26','2022-01-23 00:08:26','f462e78a-9679-46ba-b378-aa2aa89a7af3');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,5,NULL,2,NULL,'2020-03-27 13:38:00',NULL,1,'2020-03-27 13:38:49','2020-03-27 13:38:49'),(17,6,NULL,3,1,'2021-03-15 15:40:00',NULL,1,'2021-03-15 15:41:19','2021-03-15 15:41:19'),(18,6,NULL,3,1,'2021-03-15 15:40:00',NULL,NULL,'2021-03-15 15:41:19','2021-03-15 15:41:19'),(20,6,NULL,3,1,'2021-03-15 15:40:00',NULL,NULL,'2021-03-15 16:17:37','2021-03-15 16:17:37'),(24,7,NULL,5,1,'2022-01-06 14:13:00',NULL,0,'2022-01-06 14:13:33','2022-01-06 14:13:33'),(26,7,NULL,5,1,'2022-01-06 14:13:00',NULL,NULL,'2022-01-06 14:16:07','2022-01-06 14:16:07'),(27,7,NULL,5,1,'2022-01-06 14:16:00',NULL,0,'2022-01-06 14:16:34','2022-01-06 14:16:34'),(29,7,NULL,5,1,'2022-01-06 14:16:00',NULL,NULL,'2022-01-06 14:17:18','2022-01-06 14:17:18'),(30,7,NULL,5,1,'2022-01-06 14:17:00',NULL,0,'2022-01-06 14:17:22','2022-01-06 14:17:22'),(32,7,NULL,5,1,'2022-01-06 14:17:00',NULL,NULL,'2022-01-06 14:18:18','2022-01-06 14:18:18'),(33,8,NULL,6,1,'2022-01-06 14:47:00',NULL,0,'2022-01-06 14:47:19','2022-01-06 14:47:19'),(34,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 14:57:31','2022-01-06 14:57:31'),(39,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 14:58:59','2022-01-06 14:58:59'),(45,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 15:21:30','2022-01-06 15:21:30'),(53,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 15:26:16','2022-01-06 15:26:16'),(59,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 15:26:24','2022-01-06 15:26:24'),(65,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 15:26:39','2022-01-06 15:26:39'),(71,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 15:34:41','2022-01-06 15:34:41'),(74,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 15:34:49','2022-01-06 15:34:49'),(80,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 15:38:44','2022-01-06 15:38:44'),(86,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 15:45:36','2022-01-06 15:45:36'),(92,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 15:46:19','2022-01-06 15:46:19'),(98,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 15:55:36','2022-01-06 15:55:36'),(107,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 15:56:50','2022-01-06 15:56:50'),(113,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 16:03:37','2022-01-06 16:03:37'),(116,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 16:03:42','2022-01-06 16:03:42'),(126,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 16:09:27','2022-01-06 16:09:27'),(134,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 16:09:38','2022-01-06 16:09:38'),(142,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 16:09:43','2022-01-06 16:09:43'),(148,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 16:09:53','2022-01-06 16:09:53'),(154,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 16:13:32','2022-01-06 16:13:32'),(158,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 16:13:55','2022-01-06 16:13:55'),(166,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 17:41:16','2022-01-06 17:41:16'),(175,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 17:41:50','2022-01-06 17:41:50'),(181,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 17:44:55','2022-01-06 17:44:55'),(190,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 17:45:46','2022-01-06 17:45:46'),(194,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-06 17:47:14','2022-01-06 17:47:14'),(198,6,NULL,3,1,'2021-03-15 15:40:00',NULL,NULL,'2022-01-18 15:42:04','2022-01-18 15:42:04'),(199,6,NULL,3,1,'2021-03-15 15:40:00',NULL,NULL,'2022-01-18 15:42:55','2022-01-18 15:42:55'),(204,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-22 03:05:59','2022-01-22 03:05:59'),(212,8,NULL,6,1,'2022-01-06 14:47:00',NULL,NULL,'2022-01-22 03:16:41','2022-01-22 03:16:41'),(216,9,NULL,7,1,'2022-01-22 03:50:00',NULL,0,'2022-01-22 03:50:16','2022-01-22 03:50:16'),(217,9,NULL,7,1,'2022-01-22 03:50:00',NULL,NULL,'2022-01-22 03:51:15','2022-01-22 03:51:15'),(242,9,NULL,7,1,'2022-01-22 03:50:00',NULL,NULL,'2022-01-22 03:54:01','2022-01-22 03:54:01'),(250,9,NULL,7,1,'2022-01-22 03:50:00',NULL,NULL,'2022-01-22 05:06:24','2022-01-22 05:06:24'),(258,9,NULL,7,1,'2022-01-22 03:50:00',NULL,NULL,'2022-01-22 05:07:21','2022-01-22 05:07:21'),(266,9,NULL,7,1,'2022-01-22 03:50:00',NULL,NULL,'2022-01-22 05:07:29','2022-01-22 05:07:29'),(274,9,NULL,7,1,'2022-01-22 03:50:00',NULL,NULL,'2022-01-22 05:08:21','2022-01-22 05:08:21'),(282,9,NULL,7,1,'2022-01-22 03:50:00',NULL,NULL,'2022-01-22 05:21:59','2022-01-22 05:21:59'),(290,9,NULL,7,1,'2022-01-22 03:50:00',NULL,NULL,'2022-01-22 18:51:06','2022-01-22 18:51:06'),(298,9,NULL,7,1,'2022-01-22 03:50:00',NULL,NULL,'2022-01-22 18:54:52','2022-01-22 18:54:52'),(302,9,NULL,7,1,'2022-01-22 03:50:00',NULL,NULL,'2022-01-23 00:08:26','2022-01-23 00:08:26');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (2,5,1,'Homepage','homepage',0,'none',NULL,'{section.name|raw}',1,'2020-03-27 13:38:49','2021-03-15 15:40:41','2022-01-19 17:33:35','fb3a8f31-d1cc-4c13-903b-a501f7e51f54'),(3,6,5,'Blog','blog',1,'site',NULL,NULL,1,'2021-03-15 15:39:25','2021-03-15 15:39:25','2022-01-19 17:33:38','c4536798-743d-4bf0-9669-192827bfb26c'),(4,6,8,'Review','review',1,'site',NULL,NULL,2,'2021-04-01 02:34:33','2021-04-01 02:34:33','2022-01-19 17:33:38','f631db8b-3a6f-47c4-9001-54fa8733f2c9'),(5,7,11,'Default','default',1,'site',NULL,NULL,1,'2022-01-06 14:09:21','2022-04-24 01:18:46','2022-04-24 02:57:47','88ffed5d-fece-4914-9e1a-a275577840d3'),(6,8,13,'Default','default',1,'site',NULL,NULL,1,'2022-01-06 14:46:05','2022-04-24 01:18:46','2022-04-24 02:57:50','d2e0ba28-01c7-4060-8087-0c12e978341b'),(7,9,15,'Default','default',1,'site',NULL,NULL,1,'2022-01-22 03:17:16','2022-04-24 01:18:46','2022-04-24 02:57:53','46862260-8c13-44f7-9a4e-a3cb6e1a22b3');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2020-03-27 13:22:43','2020-03-27 13:22:43','2022-01-19 17:39:42','94b4d5ac-d7ea-4241-a6cb-92b39f482f99'),(3,'Flavors','2022-01-06 14:09:37','2022-04-24 01:18:46','2022-04-24 02:58:23','86e92ff9-5119-4b99-b222-f3279dcc7818'),(4,'Orders','2022-01-06 14:46:30','2022-01-06 14:46:30','2022-04-24 02:59:44','92425d88-9e0a-4213-b474-f553f37261c2'),(5,'User','2022-01-19 17:41:58','2022-04-24 01:05:09','2022-04-24 02:59:55','1aeaf5aa-fe37-42b5-aef9-f4556b92c43a'),(6,'Pages','2022-01-22 03:23:57','2022-01-22 03:23:57','2022-04-24 02:59:49','9265d2f0-4fa5-4187-8ee4-b6eb8808e295');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (44,12,24,13,0,0,'2022-01-22 02:58:47','2022-01-22 02:58:47','acfd3591-89e8-487f-b483-19b6c2cf143e'),(45,12,24,12,0,1,'2022-01-22 02:58:47','2022-01-22 02:58:47','0ccddac6-8c66-40f0-9f01-95b60a1c24a5'),(46,12,24,14,0,2,'2022-01-22 02:58:47','2022-01-22 02:58:47','372fb0a5-9ba5-4a36-abc3-ee21502ce9e1'),(57,16,30,19,0,0,'2022-01-22 04:20:15','2022-01-22 04:20:15','48ea619a-df3a-4284-aa4f-0339101a45a7'),(58,16,30,21,0,1,'2022-01-22 04:20:15','2022-01-22 04:20:15','4758b236-3210-4ba1-b6e4-e99e3f70fdcb'),(59,16,30,20,0,2,'2022-01-22 04:20:15','2022-01-22 04:20:15','54fb585a-1949-4ce0-a0b4-8fab02341376');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2021-03-03 22:29:11','2021-03-03 22:29:11','2022-01-19 17:33:35','3079b909-ff31-4f40-98a0-10c57767ab1f'),(2,'craft\\commerce\\elements\\Order','2021-03-15 15:24:15','2021-03-15 15:24:15',NULL,'030fdf45-9155-498b-8850-e2358400347b'),(3,'craft\\commerce\\elements\\Product','2021-03-15 15:24:16','2021-03-15 15:24:16',NULL,'08766548-0b7c-493b-bdce-20f096719426'),(4,'craft\\commerce\\elements\\Variant','2021-03-15 15:24:16','2021-03-15 15:24:16',NULL,'80c2837d-4f73-465a-bc55-085b035da781'),(5,'craft\\elements\\Entry','2021-03-15 15:39:25','2021-03-15 15:39:25','2022-01-19 17:33:38','44918e94-126a-4108-98da-1f66e19d2b2d'),(6,'craft\\elements\\GlobalSet','2021-03-15 15:55:30','2021-03-15 15:55:30','2022-01-19 17:34:05','e1ad1c2a-97c8-4b64-9d59-41e897a98298'),(7,'craft\\elements\\Asset','2021-03-15 16:13:40','2021-03-15 16:13:40',NULL,'e73b4186-2fad-4c0f-8eae-bbb884932c58'),(8,'craft\\elements\\Entry','2021-04-01 02:34:33','2021-04-01 02:34:33','2022-01-19 17:33:38','e66084b1-4fac-4681-b142-cd25eab4c076'),(9,'craft\\elements\\Category','2021-04-01 02:35:21','2021-04-01 02:35:21','2022-01-19 17:36:03','461e3853-0a60-4277-8682-5f5b7993c5e1'),(10,'verbb\\giftvoucher\\elements\\Voucher','2022-01-04 18:30:43','2022-01-04 18:30:43',NULL,'5bea5fdc-91af-4886-9b9d-6a3a02f78f09'),(11,'craft\\elements\\Entry','2022-01-06 14:09:21','2022-04-24 01:18:46','2022-04-24 02:57:47','0e78f5fb-bf35-4e56-9189-7aa945434937'),(12,'craft\\elements\\MatrixBlock','2022-01-06 14:25:01','2022-01-06 14:25:01',NULL,'7ae7f9a6-a9e1-4ba4-84f7-23006bebf1ca'),(13,'craft\\elements\\Entry','2022-01-06 14:46:05','2022-04-24 01:18:46','2022-04-24 02:57:50','f9551994-37fd-4761-95f0-9e5083121608'),(14,'craft\\elements\\User','2022-01-19 17:43:04','2022-01-19 17:43:04',NULL,'34d1d67d-a82b-4439-a563-3193f2964a51'),(15,'craft\\elements\\Entry','2022-01-22 03:17:16','2022-04-24 01:18:46','2022-04-24 02:57:53','539f02dd-1bc6-43f1-ad1b-db44ad1bf0d2'),(16,'craft\\elements\\MatrixBlock','2022-01-22 03:29:26','2022-01-22 03:29:26',NULL,'3e2f89e1-55db-41e9-8815-5a9a167a7940');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (2,3,'Content',NULL,'[{\"type\":\"craft\\\\commerce\\\\fieldlayoutelements\\\\ProductTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"70d6c1e4-adb3-4503-8c87-5c884f64d853\"}]',1,'2021-03-15 15:24:16','2022-04-24 03:26:53','1cc0a6e3-5b8f-46fc-9f03-904e8ebe4d0e'),(4,5,'Content',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"e966ce08-fbdb-49c4-bc54-eba7cd477ffc\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"21903cb2-5b82-49ea-9766-e120d0951ea3\",\"uid\":\"1876c9c3-7153-4812-beb5-9ed27c373253\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"abcda4a4-b1db-4677-b5d6-69588443704f\",\"uid\":\"37a1f8c4-1b84-40ab-85de-8c6b11b95fb3\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4a0cb371-14a6-415d-84db-fc0512410ec8\",\"uid\":\"862cccc4-3c63-4e77-87d2-4c6260f4dc41\"}]',1,'2021-03-15 15:40:26','2022-04-24 03:26:53','a8cc334b-f23b-4c0c-8fbd-044bfb986b5c'),(5,1,'Content',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"cba1088d-917f-4463-8a6c-92b07dab179e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"21903cb2-5b82-49ea-9766-e120d0951ea3\",\"uid\":\"8cfca497-a381-4e85-a733-7edaffd70398\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"abcda4a4-b1db-4677-b5d6-69588443704f\",\"uid\":\"07349b9f-e05e-4bf2-baa8-15a2106a51cf\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4a0cb371-14a6-415d-84db-fc0512410ec8\",\"uid\":\"7c4847c4-fa40-4158-8311-f0a60a596dd1\"}]',1,'2021-03-15 15:40:41','2022-04-24 03:26:53','602a1b6a-3cbc-46cf-9b2f-3139e7237e35'),(6,6,'Default',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"21903cb2-5b82-49ea-9766-e120d0951ea3\",\"uid\":\"27211381-f016-49a4-84bf-79d13e9fd08f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"abcda4a4-b1db-4677-b5d6-69588443704f\",\"uid\":\"61a93b20-2fb9-4466-8273-ee9a3d7ff30a\"}]',1,'2021-03-15 15:55:30','2022-04-24 03:26:53','39fa5f70-670b-44cc-a7b2-e7684c2ca914'),(8,8,'Content',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"c9f1cb9b-ad7a-463a-b64d-7d10e6798882\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"21903cb2-5b82-49ea-9766-e120d0951ea3\",\"uid\":\"6d00baba-8dde-4af9-9b37-c174479d8f45\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"abcda4a4-b1db-4677-b5d6-69588443704f\",\"uid\":\"8474d6b2-8518-4c1d-ace3-f119b9866a5d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4a0cb371-14a6-415d-84db-fc0512410ec8\",\"uid\":\"885cbab7-346a-4cf5-9577-99c3e545be37\"}]',1,'2021-04-01 02:34:33','2022-04-24 03:26:53','25a0770e-d1aa-4fbe-9d40-8253aebcfd83'),(11,10,'Content',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"f5d604e9-bf1d-4685-ab16-56c7bc1719ee\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4a0cb371-14a6-415d-84db-fc0512410ec8\",\"uid\":\"c5553a50-f5a2-49e0-9b83-5aa3f69a4496\"}]',1,'2022-01-04 18:30:43','2022-04-24 03:26:53','3dc210ee-7b9d-4498-9c4b-66b7a844e536'),(21,9,'Content',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"55e93d93-4bac-4bb2-b6b3-c66824878543\"}]',1,'2022-01-19 17:32:39','2022-04-24 03:26:53','6067f7f4-77ed-4433-b7cb-5a787441a6fb'),(22,14,'User Settings',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"858b290d-45ae-4da8-8e51-2c03caefeee3\",\"uid\":\"9325c0ef-549c-41c0-a654-fb4ae436cf32\"}]',1,'2022-01-19 17:43:04','2022-04-24 03:26:53','2a0ba74a-98b8-4b30-af48-e3791155a9ae'),(24,12,'Content',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"071aeb2b-e8eb-4bcf-825c-dd016745f107\",\"uid\":\"b0934747-9c3a-4488-b4ea-9c5a5645eaf9\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"8f804a45-ad1d-4a71-b0b4-6df2040dc205\",\"uid\":\"0b14b4e5-5f33-463f-ae34-3746108ec66c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6359fe58-db81-4ee6-94eb-e9f4e3c61da6\",\"uid\":\"edce92e5-7599-4256-9fc5-49f7978c8f07\"}]',1,'2022-01-22 02:58:47','2022-04-24 03:26:53','683e63c5-9ee1-4fe5-adaf-8af594b3aae3'),(30,16,'Content',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1f716763-7f9e-4ffd-9f8c-2c0e7ccf15f7\",\"uid\":\"c0ac2278-0dfa-441c-9961-0e6aa57d0310\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f652db8c-edc2-4a66-8241-2fb0787110ee\",\"uid\":\"8b3efb4e-bc1d-4d3b-94d3-25473ca50dce\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4828c563-32cf-4021-afeb-1d5e38f31daf\",\"uid\":\"aef4ab82-d930-41dc-a514-48e73877ecde\"}]',1,'2022-01-22 04:20:15','2022-04-24 03:26:53','76194167-0411-4a21-a3d3-d246da5162ec'),(34,13,'Content',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"d694ee80-c60f-497c-af97-0cc4f965cea8\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c6fb33da-e3f0-4f50-a4c5-4cce12415e80\",\"uid\":\"4f437ead-393a-47c5-acf0-9c7cac0f7602\"}]',1,'2022-04-24 01:18:46','2022-04-24 03:26:53','3ed978eb-abb2-4ff9-b834-37e3cd4fa2ec'),(35,11,'Content',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"eecb9589-dff2-4da0-bda7-2dd055e583e6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"682126f6-e053-4b1d-b707-82879cb43392\",\"uid\":\"6b1961e6-9ab3-4c06-8c31-059a3274528d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2b2ed478-8e77-4c39-a69a-56ad864557d1\",\"uid\":\"7729d97c-6cc9-4aa3-bbb7-18fb1e865cdb\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3d7dba4f-8e70-4965-acec-4e70f830a016\",\"uid\":\"84181ed6-7937-436e-a26d-a3f903278eb1\"}]',1,'2022-04-24 01:18:46','2022-04-24 03:26:53','028b2efa-2ffb-4cae-8b14-e741e61da514'),(36,15,'Content',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"e03e5ae3-a374-4d67-a45f-fdd8738138c7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"ade97714-e4c4-4c73-9322-2c6b398cef04\",\"uid\":\"6fbcdc28-4049-4fca-b86b-0449a17315be\"}]',1,'2022-04-24 01:18:46','2022-04-24 03:26:53','ceeeb09e-07ed-4b54-876c-1b1293d4374d'),(37,7,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"autocapitalize\":true,\"autocomplete\":false,\"autocorrect\":true,\"class\":null,\"disabled\":false,\"id\":null,\"instructions\":null,\"label\":null,\"max\":null,\"min\":null,\"name\":null,\"orientation\":null,\"placeholder\":null,\"readonly\":false,\"requirable\":false,\"size\":null,\"step\":null,\"tip\":null,\"title\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"warning\":null,\"width\":100,\"uid\":\"6a0c610e-4e47-4716-a63d-8728b4de0d91\"}]',1,'2022-04-24 03:26:53','2022-04-24 03:26:53','9e1ec516-06db-4ea2-bcbb-7dfafe62a1a5');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (12,NULL,'Nuts','nuts','matrixBlockType:7a591e66-18df-490d-92b5-3fd3a3986f09',NULL,'',0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":null,\"onLabel\":null}','2022-01-06 14:25:01','2022-01-22 02:58:47','8f804a45-ad1d-4a71-b0b4-6df2040dc205'),(13,NULL,'Flavor','flavor','matrixBlockType:7a591e66-18df-490d-92b5-3fd3a3986f09',NULL,'',0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"limit\":\"1\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":[\"section:10571998-751e-449a-98c5-d48adf32034b\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2022-01-06 14:25:01','2022-01-22 02:58:47','071aeb2b-e8eb-4bcf-825c-dd016745f107'),(14,NULL,'Notes','notes','matrixBlockType:7a591e66-18df-490d-92b5-3fd3a3986f09',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-01-06 14:25:01','2022-01-06 14:45:35','6359fe58-db81-4ee6-94eb-e9f4e3c61da6'),(19,NULL,'Selected','selected','matrixBlockType:c2e2b69d-127d-4afe-8032-0209247e70de',NULL,'',0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":null,\"onLabel\":null}','2022-01-22 03:29:26','2022-01-22 03:51:55','1f716763-7f9e-4ffd-9f8c-2c0e7ccf15f7'),(20,NULL,'Accent Color','accentColor','matrixBlockType:c2e2b69d-127d-4afe-8032-0209247e70de',NULL,'',0,'none',NULL,'craft\\fields\\Color','{\"defaultColor\":\"\"}','2022-01-22 03:29:26','2022-01-22 03:51:55','4828c563-32cf-4021-afeb-1d5e38f31daf'),(21,NULL,'Primary Color','primaryColor','matrixBlockType:c2e2b69d-127d-4afe-8032-0209247e70de',NULL,'',0,'none',NULL,'craft\\fields\\Color','{\"defaultColor\":\"\"}','2022-01-22 03:29:26','2022-01-22 03:51:55','f652db8c-edc2-4a66-8241-2fb0787110ee');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `giftvoucher_codes`
--

LOCK TABLES `giftvoucher_codes` WRITE;
/*!40000 ALTER TABLE `giftvoucher_codes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `giftvoucher_codes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `giftvoucher_redemptions`
--

LOCK TABLES `giftvoucher_redemptions` WRITE;
/*!40000 ALTER TABLE `giftvoucher_redemptions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `giftvoucher_redemptions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `giftvoucher_vouchers`
--

LOCK TABLES `giftvoucher_vouchers` WRITE;
/*!40000 ALTER TABLE `giftvoucher_vouchers` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `giftvoucher_vouchers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `giftvoucher_vouchertypes`
--

LOCK TABLES `giftvoucher_vouchertypes` WRITE;
/*!40000 ALTER TABLE `giftvoucher_vouchertypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `giftvoucher_vouchertypes` VALUES (1,10,'Moof','moof','','2022-01-04 18:30:43','2022-01-04 18:30:43','56e5b35e-e032-44db-84bc-e09be34ca5d5');
/*!40000 ALTER TABLE `giftvoucher_vouchertypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `giftvoucher_vouchertypes_sites`
--

LOCK TABLES `giftvoucher_vouchertypes_sites` WRITE;
/*!40000 ALTER TABLE `giftvoucher_vouchertypes_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `giftvoucher_vouchertypes_sites` VALUES (1,1,1,'moof/{slug}','moof/_voucher',1,'2022-01-04 18:30:43','2022-01-04 18:30:43','3f335365-3abe-494e-bae7-5d54eeded362'),(2,1,2,'moof/{slug}','moof/_voucher',1,'2022-01-04 18:30:43','2022-01-04 18:30:43','1e6f215f-c142-4f0d-bee2-1663b999696d');
/*!40000 ALTER TABLE `giftvoucher_vouchertypes_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `globalsets` VALUES (19,'Globals','globals',6,NULL,'2021-03-15 15:55:30','2021-03-15 15:55:30','aa7c6968-88ec-4d2a-af47-d3c40b582a68');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[]',1,'2021-02-28 19:56:45','2021-02-28 19:56:45','6005c2f9-5d85-4442-b712-22e070096ac8');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqltokens` VALUES (1,'Public Token','__PUBLIC__',0,NULL,NULL,1,'2020-10-16 15:16:16','2021-02-28 19:56:45','1b9fd892-85aa-46c0-9bed-c7c82bf46416');
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.0.0-beta.4','4.0.0.8',0,'mshkxxjmeolv','3@qiffiztxfj','2020-03-27 13:22:43','2022-04-24 03:26:53','85f4c669-6b2b-4771-976e-a4bcdd2bd77b');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_colorsswatches`
--

LOCK TABLES `matrixcontent_colorsswatches` WRITE;
/*!40000 ALTER TABLE `matrixcontent_colorsswatches` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_colorsswatches` VALUES (1,219,1,'2022-01-22 03:52:24','2022-01-22 03:52:24','7854e8e8-badb-4936-be18-bff4323ebc46',0,NULL,NULL),(2,220,1,'2022-01-22 03:52:31','2022-01-22 03:52:31','a21bec0d-1ec2-465c-a4da-398429fc9a03',0,NULL,'#ff0000'),(3,221,1,'2022-01-22 03:52:36','2022-01-22 03:52:36','cd3ed919-aaac-48a1-8a55-5eb01eb3b83e',0,'#e3a5a5','#ff0000'),(4,222,1,'2022-01-22 03:52:38','2022-01-22 03:52:38','fdf31ffb-9bb8-4d0c-b5b3-dd2967430db2',0,'#e3a5a5','#ff0000'),(5,223,1,'2022-01-22 03:52:38','2022-01-22 03:52:38','c5b40047-08d5-4930-83d7-d4d200d2bc8d',0,NULL,NULL),(6,224,1,'2022-01-22 03:53:21','2022-01-22 03:53:21','0bf13861-8af0-4fc1-b9fc-18c9f4ac223d',0,'#e3a5a5','#ff0000'),(7,225,1,'2022-01-22 03:53:21','2022-01-22 03:53:21','8d29a9b5-8b0e-4784-9260-2c95dda2fa70',0,NULL,'#0091ff'),(8,226,1,'2022-01-22 03:53:26','2022-01-22 03:53:26','3a8287fb-9d72-45c0-a3de-df27d1b8fcca',0,'#e3a5a5','#ff0000'),(9,227,1,'2022-01-22 03:53:26','2022-01-22 03:53:26','0b3d6ba5-9e1f-4a83-a538-27719e9307dc',0,'#8382c4','#0091ff'),(10,228,1,'2022-01-22 03:53:35','2022-01-22 03:53:35','ef8f6de7-b9a4-4652-bee6-1ee025162436',0,'#e3a5a5','#ff0000'),(11,229,1,'2022-01-22 03:53:35','2022-01-22 03:53:35','619849a4-c7ba-4600-ae5b-42acd17441a4',1,'#8382c4','#0091ff'),(12,230,1,'2022-01-22 03:53:37','2022-01-22 03:53:37','560e9b5e-2efa-4ee3-b65e-66a78d55db67',0,'#e3a5a5','#ff0000'),(13,231,1,'2022-01-22 03:53:37','2022-01-22 03:53:37','2d80f5fd-1220-437a-b74a-622d4cfe43cb',1,'#8382c4','#0091ff'),(14,232,1,'2022-01-22 03:53:37','2022-01-22 03:53:37','d5f0b0d0-3449-4ec3-85fb-ad23c35034d7',0,NULL,NULL),(15,233,1,'2022-01-22 03:53:51','2022-01-22 03:53:51','04d653d3-7a8f-4215-894d-8b58f754dad5',0,'#e3a5a5','#ff0000'),(16,234,1,'2022-01-22 03:53:51','2022-01-22 03:53:51','94b56c10-cf2c-47fd-8839-c65149ffe4fc',1,'#8382c4','#0091ff'),(17,235,1,'2022-01-22 03:53:51','2022-01-22 03:53:51','0b7c5fd5-874f-49dd-bb7a-2dcfb3c99ff5',0,NULL,'#d4ff00'),(21,239,1,'2022-01-22 03:54:01','2022-04-24 01:05:22','45134397-63d7-496f-81da-fc9a06b0b101',1,'#d00000','#1c3144'),(22,240,1,'2022-01-22 03:54:01','2022-04-24 01:05:22','a26b7600-30cf-4ce7-867e-e1481732d444',0,'#3ec300','#337ca0'),(23,241,1,'2022-01-22 03:54:01','2022-04-24 01:05:22','0d7a81ac-a67a-425f-ac4d-7a3b464b19a7',0,'#a38560','#574d68'),(24,243,1,'2022-01-22 03:54:01','2022-01-22 03:54:01','88959387-df47-4f2c-b392-7d259af5c7c4',0,'#e3a5a5','#ff0000'),(25,244,1,'2022-01-22 03:54:01','2022-01-22 03:54:01','df70fbec-b7ed-4d3f-a2fc-250bf3165bfd',1,'#8382c4','#0091ff'),(26,245,1,'2022-01-22 03:54:01','2022-01-22 03:54:01','3986e813-372f-49c5-820b-a7f7bf86577a',0,'#d6f0c1','#d4ff00'),(30,251,1,'2022-01-22 05:06:24','2022-01-22 05:06:24','3da3011d-1ce3-46bb-8fca-7fde56bad54e',1,'#e3a5a5','#ff0000'),(31,252,1,'2022-01-22 05:06:24','2022-01-22 05:06:24','6ff8ec09-caa9-4765-bbe5-2ba5a133b4a6',1,'#8382c4','#0091ff'),(32,253,1,'2022-01-22 05:06:24','2022-01-22 05:06:24','fbbc700c-f275-4e72-a13b-1b226944497c',1,'#d6f0c1','#d4ff00'),(36,259,1,'2022-01-22 05:07:21','2022-01-22 05:07:21','21a47883-a3c6-40b9-95dc-47dc00865ac3',1,'#e3a5a5','#ff0000'),(37,260,1,'2022-01-22 05:07:21','2022-01-22 05:07:21','2742b5fc-1a2d-4fa0-9e12-ab1565db54d7',0,'#8382c4','#0091ff'),(38,261,1,'2022-01-22 05:07:21','2022-01-22 05:07:21','e166009a-f5e3-49a8-b3ea-693382581484',0,'#d6f0c1','#d4ff00'),(42,267,1,'2022-01-22 05:07:29','2022-01-22 05:07:29','d50c6c0c-e2a8-488c-bbd6-f3db327812bc',0,'#e3a5a5','#ff0000'),(43,268,1,'2022-01-22 05:07:29','2022-01-22 05:07:29','d0020d51-7303-4ec6-bc37-6034a6d836ec',0,'#8382c4','#0091ff'),(44,269,1,'2022-01-22 05:07:29','2022-01-22 05:07:29','7790511a-3861-4cfd-a10b-b7bb47c1567c',1,'#d6f0c1','#d4ff00'),(48,275,1,'2022-01-22 05:08:21','2022-01-22 05:08:21','4c147456-88d2-415e-8d93-20149c678c85',0,'#e3a5a5','#ff0000'),(49,276,1,'2022-01-22 05:08:21','2022-01-22 05:08:21','1c0dc6dd-b368-49e8-9215-f1f812704195',0,'#8382c4','#0091ff'),(50,277,1,'2022-01-22 05:08:21','2022-01-22 05:08:21','6446a33a-5d22-47d6-a923-8a193c87256f',1,'#d6f0c1','#d4ff00'),(54,283,1,'2022-01-22 05:21:59','2022-01-22 05:21:59','08a1fefc-1cf8-4844-87cb-753e50611b04',1,'#e3a5a5','#ff0000'),(55,284,1,'2022-01-22 05:21:59','2022-01-22 05:21:59','f676d8bd-dffd-4dad-ae47-7049e2d51c5e',0,'#8382c4','#0091ff'),(56,285,1,'2022-01-22 05:21:59','2022-01-22 05:21:59','3028ce24-a0d6-46cd-bf64-e0af0725d5d5',0,'#d6f0c1','#d4ff00'),(60,291,1,'2022-01-22 18:51:06','2022-01-22 18:51:06','444ce788-0268-4d99-a1bb-eca38ea5a92c',0,'#d00000','#1c3144'),(61,292,1,'2022-01-22 18:51:06','2022-01-22 18:51:06','c4a1f856-20b2-439b-9b75-93386ee2e373',1,'#3ec300','#337ca0'),(62,293,1,'2022-01-22 18:51:06','2022-01-22 18:51:06','c0612cae-8f5c-4e4c-b4d0-5ff1add8cecf',0,'#474747','#ad343e'),(66,299,1,'2022-01-22 18:54:52','2022-01-22 18:54:52','8c42b9ea-a8cf-4172-b3b5-897a2296ab7a',1,'#d00000','#1c3144'),(67,300,1,'2022-01-22 18:54:52','2022-01-22 18:54:52','f62ff7bd-bdc9-4be0-a761-a2761e82dd33',0,'#3ec300','#337ca0'),(68,301,1,'2022-01-22 18:54:52','2022-01-22 18:54:52','a411a3c9-de1c-4be0-b8d6-c1199ffc3e20',0,'#a38560','#574d68'),(69,303,1,'2022-01-23 00:08:26','2022-04-24 01:05:21','cd9b1cd5-9649-4492-ae0a-b9700dad405a',1,'#d00000','#1c3144'),(70,304,1,'2022-01-23 00:08:26','2022-04-24 01:05:21','e19ea7b6-3e55-424e-82b2-ec2d9fe06ba1',0,'#3ec300','#337ca0'),(71,305,1,'2022-01-23 00:08:26','2022-04-24 01:05:21','4ac5b941-67ec-47f9-9e73-c213bbd470dc',0,'#a38560','#574d68');
/*!40000 ALTER TABLE `matrixcontent_colorsswatches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_scoops`
--

LOCK TABLES `matrixcontent_scoops` WRITE;
/*!40000 ALTER TABLE `matrixcontent_scoops` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_scoops` VALUES (5,38,1,'2022-01-06 14:58:59','2022-01-06 16:09:38','f908c899-5bb7-4ff5-a851-3ce56feed99f','nuts','Helo there',NULL),(6,38,2,'2022-01-06 14:58:59','2022-01-06 16:09:38','ea1e5953-8f14-4220-9311-92fe3f0a8315','nuts','Helo there',NULL),(7,40,1,'2022-01-06 14:58:59','2022-01-06 14:58:59','27d701af-a8fd-4bfd-b27a-51bc5cdc24f3','[]',NULL,NULL),(8,40,2,'2022-01-06 14:58:59','2022-01-06 14:58:59','bfe49310-506f-4dca-a0e0-006bbebbebd6','[]',NULL,NULL),(13,46,1,'2022-01-06 15:21:30','2022-01-06 15:21:30','d33222a0-7880-4f18-85f7-61b48caa155f','nuts',NULL,NULL),(14,46,2,'2022-01-06 15:21:30','2022-01-06 15:21:30','f17bfd85-214a-403f-a473-156946c6ec9b','nuts',NULL,NULL),(23,52,1,'2022-01-06 15:26:16','2022-01-06 16:09:43','6a6962ac-c841-4764-a023-10fe96c79754',NULL,'woof',NULL),(24,52,2,'2022-01-06 15:26:16','2022-01-06 16:09:43','3fdedb73-6ed1-41ff-9f4c-816bc445eb89',NULL,'woof',NULL),(25,54,1,'2022-01-06 15:26:16','2022-01-06 15:26:16','403768a1-593d-4b53-8c14-04af4e449f8f','nuts',NULL,NULL),(26,54,2,'2022-01-06 15:26:16','2022-01-06 15:26:16','1148a1fa-edc7-4ede-977c-b07a7863fd63','nuts',NULL,NULL),(27,55,1,'2022-01-06 15:26:16','2022-01-06 15:26:16','5b58ac77-7996-4e62-bb30-c91523771ab4',NULL,NULL,NULL),(28,55,2,'2022-01-06 15:26:17','2022-01-06 15:26:17','a3daa2f7-7450-40d1-92b5-c34a9670862c',NULL,NULL,NULL),(33,60,1,'2022-01-06 15:26:24','2022-01-06 15:26:24','50075ef5-fea2-4cbe-aeea-851922fa4951','nuts',NULL,NULL),(34,60,2,'2022-01-06 15:26:24','2022-01-06 15:26:24','b5c315ce-45c8-4505-a37f-bee28a8045f1','nuts',NULL,NULL),(35,61,1,'2022-01-06 15:26:24','2022-01-06 15:26:24','a62c20c6-c3f7-4175-bab4-f2459ccdf81f',NULL,NULL,NULL),(36,61,2,'2022-01-06 15:26:24','2022-01-06 15:26:24','ab7308b6-bcbe-42c2-a6ef-ad01cb59bebf',NULL,NULL,NULL),(41,66,1,'2022-01-06 15:26:39','2022-01-06 15:26:39','043e6edd-8b6d-46ba-8604-7ac0ff52585a','nuts',NULL,NULL),(42,66,2,'2022-01-06 15:26:39','2022-01-06 15:26:39','369fb498-0549-4af4-aa0a-4fa554fefc3d','nuts',NULL,NULL),(43,67,1,'2022-01-06 15:26:39','2022-01-06 15:26:39','a7bb3d44-2662-40cd-8239-53a36a6c4efd',NULL,NULL,NULL),(44,67,2,'2022-01-06 15:26:39','2022-01-06 15:26:39','fa0a8a98-8180-4da5-8ea4-fc9dddde3439',NULL,NULL,NULL),(49,72,1,'2022-01-06 15:34:41','2022-01-06 15:34:41','68250e8d-d260-4e15-9a33-d250287ce159','nuts',NULL,NULL),(50,72,2,'2022-01-06 15:34:41','2022-01-06 15:34:41','76cefd90-8494-4949-886a-933f15133c84','nuts',NULL,NULL),(51,73,1,'2022-01-06 15:34:41','2022-01-06 15:34:41','d4cf7de6-b2be-4103-b69d-7343e72df028',NULL,NULL,NULL),(52,73,2,'2022-01-06 15:34:41','2022-01-06 15:34:41','1c5bc7e3-8405-4403-b55d-23e5706edcd0',NULL,NULL,NULL),(53,75,1,'2022-01-06 15:34:49','2022-01-06 15:34:49','2ef9bb37-2c24-46c9-8e54-154937df7f51','nuts',NULL,NULL),(54,75,2,'2022-01-06 15:34:49','2022-01-06 15:34:49','4502cdc4-658d-46c5-9a29-d11508ad8970','nuts',NULL,NULL),(55,76,1,'2022-01-06 15:34:49','2022-01-06 15:34:49','37d7fd8c-e383-4eef-b0a7-f5942bf02bd6',NULL,NULL,NULL),(56,76,2,'2022-01-06 15:34:49','2022-01-06 15:34:49','8a64f6fe-66d8-4552-b922-1d075a05337e',NULL,NULL,NULL),(61,81,1,'2022-01-06 15:38:44','2022-01-06 15:38:44','0a1cfdef-8577-4cc3-a26d-3c31313fa537','nuts',NULL,NULL),(62,81,2,'2022-01-06 15:38:44','2022-01-06 15:38:44','a0bc0a9a-bcbc-4538-a424-8c8e69478754','nuts',NULL,NULL),(63,82,1,'2022-01-06 15:38:44','2022-01-06 15:38:44','a59dd9fb-1328-40d5-b88a-0ed02519192f',NULL,NULL,NULL),(64,82,2,'2022-01-06 15:38:44','2022-01-06 15:38:44','952ae05b-45ec-47f2-baec-6921f75c5894',NULL,NULL,NULL),(69,87,1,'2022-01-06 15:45:36','2022-01-06 15:45:36','102f9a60-64f9-4391-affc-3be3fee09271','nuts',NULL,NULL),(70,87,2,'2022-01-06 15:45:36','2022-01-06 15:45:36','c2cf1ed9-3188-40f0-b6e8-720cd3f2f898','nuts',NULL,NULL),(71,88,1,'2022-01-06 15:45:36','2022-01-06 15:45:36','624f94de-5170-407d-9081-66356d6b1c2b',NULL,NULL,NULL),(72,88,2,'2022-01-06 15:45:36','2022-01-06 15:45:36','0532ca74-d8a8-4ed9-9a70-7d5abc6ab48a',NULL,NULL,NULL),(77,93,1,'2022-01-06 15:46:19','2022-01-06 15:46:19','3e7fae01-4010-4e18-bfae-2328ccbd20a7','nuts',NULL,NULL),(78,93,2,'2022-01-06 15:46:19','2022-01-06 15:46:19','feedfcf8-da65-457a-969e-9e5eeee1fa96','nuts',NULL,NULL),(79,94,1,'2022-01-06 15:46:19','2022-01-06 15:46:19','31a54ac6-d13e-4ba6-a216-ab3e2926f335',NULL,NULL,NULL),(80,94,2,'2022-01-06 15:46:19','2022-01-06 15:46:19','8e5df0d8-8ae1-42dd-9e54-1ac53c5ece79',NULL,NULL,NULL),(85,99,1,'2022-01-06 15:55:36','2022-01-06 15:55:36','f0720ab2-04f7-4789-9829-dd812153bf67','nuts',NULL,NULL),(86,99,2,'2022-01-06 15:55:36','2022-01-06 15:55:36','a16139fa-c24d-4df4-a315-e53f73f9d128','nuts',NULL,NULL),(87,100,1,'2022-01-06 15:55:36','2022-01-06 15:55:36','13a33bac-fd79-441f-bb3c-9fe34e89bb46',NULL,NULL,NULL),(88,100,2,'2022-01-06 15:55:36','2022-01-06 15:55:36','45068585-b32a-4835-a07b-ddc24a8ea840',NULL,NULL,NULL),(97,108,1,'2022-01-06 15:56:50','2022-01-06 15:56:50','e29fa4b5-0092-4538-abc6-1de7cf581f58','nuts',NULL,NULL),(98,108,2,'2022-01-06 15:56:50','2022-01-06 15:56:50','4244784c-3081-4d83-bc5c-3e563ef75894','nuts',NULL,NULL),(99,109,1,'2022-01-06 15:56:50','2022-01-06 15:56:50','ef38c507-3f00-4541-a1f6-f065f9b76775',NULL,NULL,NULL),(100,109,2,'2022-01-06 15:56:50','2022-01-06 15:56:50','cc27ff00-bbcc-4b9e-a1b4-8ac784a6a296',NULL,NULL,NULL),(105,114,1,'2022-01-06 16:03:37','2022-01-06 16:03:37','9597b44e-2782-4ce2-b37c-c9925728a337','nuts','Helo there',NULL),(106,114,2,'2022-01-06 16:03:37','2022-01-06 16:03:37','8c1b22d5-9016-4610-8273-315f3de35903','nuts','Helo there',NULL),(107,115,1,'2022-01-06 16:03:37','2022-01-06 16:03:37','b4f45ba2-225d-432f-ae93-08dfd65db4bf',NULL,NULL,NULL),(108,115,2,'2022-01-06 16:03:37','2022-01-06 16:03:37','2e330646-bf36-454c-b74c-4af53270dcfc',NULL,NULL,NULL),(109,117,1,'2022-01-06 16:03:42','2022-01-06 16:03:42','d3c4eccc-4aca-4458-8e9f-a3442ba13a9b','nuts','Helo there',NULL),(110,117,2,'2022-01-06 16:03:42','2022-01-06 16:03:42','d6637c1e-98c8-46b6-b53f-2d8f07cc5f4f','nuts','Helo there',NULL),(111,118,1,'2022-01-06 16:03:42','2022-01-06 16:03:42','da339e05-5d9a-470f-9417-e7d7a659127c',NULL,'woof',NULL),(112,118,2,'2022-01-06 16:03:42','2022-01-06 16:03:42','3f7426a0-2511-4a15-83ab-23cc28ec54a5',NULL,'woof',NULL),(123,125,1,'2022-01-06 16:09:27','2022-01-06 16:09:43','01248ce7-c155-46d3-820b-07a948fcdaed',NULL,NULL,NULL),(124,125,2,'2022-01-06 16:09:27','2022-01-06 16:09:43','180f864b-4f5f-4d77-b401-201636075e24',NULL,NULL,NULL),(125,127,1,'2022-01-06 16:09:27','2022-01-06 16:09:27','169cf488-3995-4f04-8983-69b9e7ed6a42','nuts','Helo there',NULL),(126,127,2,'2022-01-06 16:09:27','2022-01-06 16:09:27','6dea50f1-60df-4ec2-a771-a9145fed0431','nuts','Helo there',NULL),(127,128,1,'2022-01-06 16:09:27','2022-01-06 16:09:27','810643fc-0b47-4344-89ae-b3eff6a0fc69',NULL,'woof',NULL),(128,128,2,'2022-01-06 16:09:27','2022-01-06 16:09:27','79c090af-ae99-49fe-b2a3-46e6ae91e154',NULL,'woof',NULL),(129,129,1,'2022-01-06 16:09:27','2022-01-06 16:09:27','f09cc942-e05b-4c55-99db-191b02c1f61c',NULL,NULL,NULL),(130,129,2,'2022-01-06 16:09:27','2022-01-06 16:09:27','3f5258a0-9fcb-44b6-a745-af243b5af6c4',NULL,NULL,NULL),(137,135,1,'2022-01-06 16:09:38','2022-01-06 16:09:38','87385d98-82a4-428a-ad25-19ff7baedc84',NULL,'woof',NULL),(138,135,2,'2022-01-06 16:09:38','2022-01-06 16:09:38','e34b2f9d-0c98-40db-b361-ca74d4adb17e',NULL,'woof',NULL),(139,136,1,'2022-01-06 16:09:38','2022-01-06 16:09:38','82f0c646-5226-444c-b439-aa970793fc8c','nuts','Helo there',NULL),(140,136,2,'2022-01-06 16:09:38','2022-01-06 16:09:38','cadd98b5-5b0c-4d9e-8b73-711d3a4eabfd','nuts','Helo there',NULL),(141,137,1,'2022-01-06 16:09:38','2022-01-06 16:09:38','361303aa-956d-4ec8-ba8b-8f28611c2716',NULL,NULL,NULL),(142,137,2,'2022-01-06 16:09:38','2022-01-06 16:09:38','7e6a31ec-d3d5-437f-aa0a-2f426ab28200',NULL,NULL,NULL),(149,143,1,'2022-01-06 16:09:44','2022-01-06 16:09:44','28348d0c-ff3a-4566-b75a-691fcd1ae65e',NULL,'woof',NULL),(150,143,2,'2022-01-06 16:09:44','2022-01-06 16:09:44','f7210d58-5ce7-4eb3-a17b-d51834f8daba',NULL,'woof',NULL),(151,144,1,'2022-01-06 16:09:44','2022-01-06 16:09:44','40ac6841-a2bf-4c54-bc0c-f98fb527505b',NULL,NULL,NULL),(152,144,2,'2022-01-06 16:09:44','2022-01-06 16:09:44','6de18178-9d86-4ecf-ac5c-e395fa20a86c',NULL,NULL,NULL),(163,153,1,'2022-01-06 16:13:32','2022-01-06 16:13:32','6d7471d0-dac0-42e7-aba4-afbe2dbc13da','nuts',NULL,NULL),(164,153,2,'2022-01-06 16:13:32','2022-01-06 16:13:32','9be9457b-8056-420b-9caf-3cb9c6a02578','nuts',NULL,NULL),(165,155,1,'2022-01-06 16:13:32','2022-01-06 16:13:32','4394e752-234a-4270-ad1f-d050cb1cd38c','nuts',NULL,NULL),(166,155,2,'2022-01-06 16:13:32','2022-01-06 16:13:32','0a60466c-0e1c-4ee5-a7fa-252a60a0ff8a','nuts',NULL,NULL),(179,165,1,'2022-01-06 17:41:16','2022-04-24 01:05:23','cfc54620-6991-4a31-99cf-142a6cdb831f','nuts','Hates Vegan, add bacon',0),(181,167,1,'2022-01-06 17:41:16','2022-01-06 17:41:16','14e4484e-4987-47cc-9309-945fe87253b6',NULL,'Hates Vegan, add bacon',NULL),(182,167,2,'2022-01-06 17:41:16','2022-01-06 17:41:16','66b5f470-32fc-4420-a72d-8eb7427f9593',NULL,'Hates Vegan, add bacon',NULL),(193,174,1,'2022-01-06 17:41:50','2022-04-24 01:05:23','ec95e444-c024-4d47-aa2b-144e724b6d61','nuts','Loves nuts!',1),(195,176,1,'2022-01-06 17:41:50','2022-01-06 17:41:50','11fb806b-920d-429c-981e-018fee8d2dc1',NULL,'Hates Vegan, add bacon',NULL),(196,176,2,'2022-01-06 17:41:50','2022-01-06 17:41:50','b717fa67-6e9f-4473-ae84-e4afa98ad41e',NULL,'Hates Vegan, add bacon',NULL),(197,177,1,'2022-01-06 17:41:50','2022-01-06 17:41:50','fc768660-1cbb-481d-8014-ed387704ba12','nuts','Loves nuts!',NULL),(198,177,2,'2022-01-06 17:41:50','2022-01-06 17:41:50','0f72e4fa-0061-4595-afab-ca2ce660edef','nuts','Loves nuts!',NULL),(203,182,1,'2022-01-06 17:44:55','2022-01-06 17:44:55','6b579d58-aac3-43a1-85c2-0124369b56bd',NULL,'Hates Vegan, add bacon',NULL),(204,182,2,'2022-01-06 17:44:55','2022-01-06 17:44:55','a4dbba1e-3f13-4337-b74b-c28e54b8a61b',NULL,'Hates Vegan, add bacon',NULL),(205,183,1,'2022-01-06 17:44:55','2022-01-06 17:44:55','26b1b6c7-ddcf-43cf-b72c-ac25a2f45052','nuts','Loves nuts!',NULL),(206,183,2,'2022-01-06 17:44:55','2022-01-06 17:44:55','a226f0b5-b253-43ed-8e2c-69705d8634ac','nuts','Loves nuts!',NULL),(215,189,1,'2022-01-06 17:45:46','2022-04-24 01:05:23','91452744-3bee-4bf5-9ffd-a71faea90cba',NULL,NULL,1),(217,191,1,'2022-01-06 17:45:46','2022-01-06 17:45:46','5fe8de9f-54ee-4683-80f7-33a0412eb7f3','nuts','Loves nuts!',NULL),(218,191,2,'2022-01-06 17:45:46','2022-01-06 17:45:46','f4a9134c-76ad-4799-815d-cc54e81f8c13','nuts','Loves nuts!',NULL),(219,192,1,'2022-01-06 17:45:46','2022-01-06 17:45:46','c30be14d-5694-409b-be83-10f3aa5a967b','nuts','Hates Vegan, add bacon',NULL),(220,192,2,'2022-01-06 17:45:46','2022-01-06 17:45:46','e0290f36-b6e8-4870-93c9-9451961ccfc5','nuts','Hates Vegan, add bacon',NULL),(221,193,1,'2022-01-06 17:45:46','2022-01-06 17:45:46','30e0377c-2866-4822-a7e7-3d7ef462d003',NULL,NULL,NULL),(222,193,2,'2022-01-06 17:45:46','2022-01-06 17:45:46','c82142b7-8973-4fd2-8210-319d7c64f1d1',NULL,NULL,NULL),(223,195,1,'2022-01-06 17:47:14','2022-01-06 17:47:14','84d3aa57-91bf-4514-a304-05e6aec44896','nuts','Loves nuts!',NULL),(224,195,2,'2022-01-06 17:47:14','2022-01-06 17:47:14','a6e39b97-30fa-4c00-966d-d01fe0903784','nuts','Loves nuts!',NULL),(225,196,1,'2022-01-06 17:47:14','2022-01-06 17:47:14','cc86e43f-7673-4940-a2ed-7a8c6af704e6','nuts','Hates Vegan, add bacon',NULL),(226,196,2,'2022-01-06 17:47:14','2022-01-06 17:47:14','c2319184-a0ae-4b51-9a07-5dde47a97e18','nuts','Hates Vegan, add bacon',NULL),(227,197,1,'2022-01-06 17:47:14','2022-01-06 17:47:14','bd4e1011-66d3-4cb1-9d01-bc35aabac8b7',NULL,NULL,NULL),(228,197,2,'2022-01-06 17:47:14','2022-01-06 17:47:14','c1cf4c4f-1ffd-4d1a-b512-fabf79aa8a27',NULL,NULL,NULL),(232,205,1,'2022-01-22 03:05:59','2022-01-22 03:05:59','b0976708-d7c7-4670-aea8-ebbf84cf9e24',NULL,'Loves nuts!',1),(233,206,1,'2022-01-22 03:05:59','2022-01-22 03:05:59','7203c8a2-a63a-4be3-aea7-6040471394b2',NULL,'Hates Vegan, add bacon',0),(234,207,1,'2022-01-22 03:05:59','2022-01-22 03:05:59','c14e93b9-3254-4e88-bd3d-1ce9627de162',NULL,NULL,0),(238,213,1,'2022-01-22 03:16:41','2022-01-22 03:16:41','06c530a0-a25c-4732-8a04-935e8c91a0ed',NULL,'Loves nuts!',1),(239,214,1,'2022-01-22 03:16:41','2022-01-22 03:16:41','e2d5c9c0-f0ac-4dc8-942c-4dbc0e0ee965',NULL,'Hates Vegan, add bacon',0),(240,215,1,'2022-01-22 03:16:41','2022-01-22 03:16:41','a499dc90-fec3-42a5-8ad4-8c5763454d1e',NULL,NULL,1);
/*!40000 ALTER TABLE `matrixcontent_scoops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','255a7bd9-4a6a-445c-bac0-ec5c80eff1ca'),(2,'craft','m150403_183908_migrations_table_changes','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','81cb0aab-bfa1-482f-a797-8ebd6913b240'),(3,'craft','m150403_184247_plugins_table_changes','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','5aea1857-8cf1-419c-9c08-fc68d91fe5f4'),(4,'craft','m150403_184533_field_version','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','0f589dd7-da06-4d0f-bf2a-93eaaddcd2ad'),(5,'craft','m150403_184729_type_columns','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','8b25192b-bb45-40ed-bd4a-32f4ddac5aa9'),(6,'craft','m150403_185142_volumes','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','66017e13-b70d-49ac-a668-097db57528f9'),(7,'craft','m150428_231346_userpreferences','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','39fd1888-30b1-42a5-93ce-f7d34cfb1310'),(8,'craft','m150519_150900_fieldversion_conversion','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','86bcf854-22b0-4a70-96bc-2044611c597b'),(9,'craft','m150617_213829_update_email_settings','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','a0c8e602-0468-49fe-8c16-fdffa82b4643'),(10,'craft','m150721_124739_templatecachequeries','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','6f320738-c1e5-46a2-bc27-91c7c1926dd2'),(11,'craft','m150724_140822_adjust_quality_settings','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','1af6d726-306c-4bf5-8cfd-eb434ab616d1'),(12,'craft','m150815_133521_last_login_attempt_ip','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','2d4ec2a2-98c1-4c8a-ab2b-020217a6cf70'),(13,'craft','m151002_095935_volume_cache_settings','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','eff78c75-bac8-4447-9a3c-3ce5702ffa10'),(14,'craft','m151005_142750_volume_s3_storage_settings','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','b701ae4c-63b1-48cc-8267-59085e643f81'),(15,'craft','m151016_133600_delete_asset_thumbnails','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','af500463-3e1a-46c3-b7c9-6bd5d7a4db71'),(16,'craft','m151209_000000_move_logo','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','e9fdda5e-9b99-4d7b-b09d-5cfa95b48c7b'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','75df1e70-a409-4c90-b7d8-ee19ed7b401c'),(18,'craft','m151215_000000_rename_asset_permissions','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','14e72674-0ccb-42b0-98de-9b70dbe6dd2c'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','7123c498-b5b5-41fb-9fa3-f7bb31c4d248'),(20,'craft','m160708_185142_volume_hasUrls_setting','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','148932ce-bafe-414d-8020-4bd04635da04'),(21,'craft','m160714_000000_increase_max_asset_filesize','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','0e377531-0a70-462f-bab2-f3ab80986ccf'),(22,'craft','m160727_194637_column_cleanup','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','cb7e9397-4728-43b5-b974-ccbd9e08797f'),(23,'craft','m160804_110002_userphotos_to_assets','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','72a8bc4b-2064-45fe-b857-349cd7241a5b'),(24,'craft','m160807_144858_sites','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','30b17f8b-3acd-4b10-8394-1ad35cee1139'),(25,'craft','m160829_000000_pending_user_content_cleanup','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','5ef2a4c5-1e2f-4337-b249-c667627886df'),(26,'craft','m160830_000000_asset_index_uri_increase','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','b009b29a-1e7f-48e9-9d8f-2a50466b16b8'),(27,'craft','m160912_230520_require_entry_type_id','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','057f602e-2110-4b74-a9b6-794e1972f92f'),(28,'craft','m160913_134730_require_matrix_block_type_id','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','c67eaec1-a102-40c3-a7d5-f4a3400fbf7e'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','be379f74-f2cd-4400-8884-4dc0b2bd2114'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','8373c373-51d7-4c3c-b3da-65af03c1cab3'),(31,'craft','m160925_113941_route_uri_parts','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','cff3b8d3-60ae-490c-89ad-2b8317a8ce11'),(32,'craft','m161006_205918_schemaVersion_not_null','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','d4e67e40-90c6-490b-98bb-ed4586b1d764'),(33,'craft','m161007_130653_update_email_settings','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','b789a9b3-8114-4d63-9bd8-9c2112323dba'),(34,'craft','m161013_175052_newParentId','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','15b96b1d-f810-4f22-a3cd-0ac21cd3bf65'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','603a7ae6-a3a3-4836-a363-dea7c9d4ea8e'),(36,'craft','m161021_182140_rename_get_help_widget','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','6f5a896c-06e1-454d-8eb8-1b716d3eb64f'),(37,'craft','m161025_000000_fix_char_columns','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','232f4ee5-f823-4421-9fab-9460a1bf2a7c'),(38,'craft','m161029_124145_email_message_languages','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','d9721ac1-3111-4005-9ddf-d75ba11c4b83'),(39,'craft','m161108_000000_new_version_format','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','faf44e8e-d227-4152-9778-2294550479a5'),(40,'craft','m161109_000000_index_shuffle','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','0e4dcb9b-2b4c-4403-991b-58a44f5e0c0e'),(41,'craft','m161122_185500_no_craft_app','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','4330d3bc-67bb-44e2-bc71-7689150cdc14'),(42,'craft','m161125_150752_clear_urlmanager_cache','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','273b17f6-fd34-47a9-b66e-0e15c6c8b5e3'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','e5304c92-fc2a-479e-8aab-0e5bc9851d47'),(44,'craft','m170114_161144_udates_permission','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','ee9efd39-5f71-4fee-bd70-b7b2da3641c4'),(45,'craft','m170120_000000_schema_cleanup','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','5047cbb6-5a6f-4868-8e05-655046bad66c'),(46,'craft','m170126_000000_assets_focal_point','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','1ebab523-177b-43bc-a707-e2a172ab5ccc'),(47,'craft','m170206_142126_system_name','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','56bae875-93b7-446a-8cb5-3fe91fd0fc92'),(48,'craft','m170217_044740_category_branch_limits','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','fa730cd1-4608-476f-a041-1a192406e634'),(49,'craft','m170217_120224_asset_indexing_columns','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','c706d06a-9fa7-4502-afe6-90b23a651a72'),(50,'craft','m170223_224012_plain_text_settings','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','459a346a-43c6-4f0f-aaa0-c863cb13a73b'),(51,'craft','m170227_120814_focal_point_percentage','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','e24f0c44-46bc-4bc5-a6bc-5044981382b5'),(52,'craft','m170228_171113_system_messages','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','071c531e-e2bb-48ec-9efd-fcab056d6a26'),(53,'craft','m170303_140500_asset_field_source_settings','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','7b6dcde0-b522-44a6-916e-438f05d9d586'),(54,'craft','m170306_150500_asset_temporary_uploads','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','ffc146b0-577b-4e6e-9c53-73c19007bc58'),(55,'craft','m170523_190652_element_field_layout_ids','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','101e4d6c-ac3b-40c8-8f0f-7b0411fc5191'),(56,'craft','m170612_000000_route_index_shuffle','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','51522a51-bd55-47e3-97de-daadb68f43f7'),(57,'craft','m170621_195237_format_plugin_handles','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','a32776a8-5419-42e4-a2e8-f7a0a52d8307'),(58,'craft','m170630_161027_deprecation_line_nullable','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','428a77ea-a40f-4c28-8d85-9af37bd53d23'),(59,'craft','m170630_161028_deprecation_changes','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','0257f4e3-0265-4f2f-9a1b-3088ae972348'),(60,'craft','m170703_181539_plugins_table_tweaks','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','954fa697-9999-4583-b39b-b5ff9d62d4f6'),(61,'craft','m170704_134916_sites_tables','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','2f968f14-db59-4421-978a-87fa06690e07'),(62,'craft','m170706_183216_rename_sequences','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','5e6c9484-b078-4c80-b28a-e90bc53db103'),(63,'craft','m170707_094758_delete_compiled_traits','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','2c0bbe6e-73bf-4dd1-94a7-c29b8764f89b'),(64,'craft','m170731_190138_drop_asset_packagist','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','241e0eff-622d-4a45-b5da-8ae74c7ee587'),(65,'craft','m170810_201318_create_queue_table','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','5697abc2-9558-4bcf-b141-f7370b59bd31'),(66,'craft','m170903_192801_longblob_for_queue_jobs','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','dab06800-69cd-4c56-a7f4-f7b692512cd1'),(67,'craft','m170914_204621_asset_cache_shuffle','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','15267267-1409-4375-86e5-629713cd31fb'),(68,'craft','m171011_214115_site_groups','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','4752ee77-3835-469c-a871-f814b09e30e8'),(69,'craft','m171012_151440_primary_site','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','8f593dbc-14e0-48d3-99a9-05d381f8d2ec'),(70,'craft','m171013_142500_transform_interlace','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','4da5a8e2-3a1b-46b6-b23c-89234119bc88'),(71,'craft','m171016_092553_drop_position_select','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','3c2970ed-345f-4d3b-ac7e-cffdfa2942f0'),(72,'craft','m171016_221244_less_strict_translation_method','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','afa9a878-dbee-4064-9777-0bd8ddbd0720'),(73,'craft','m171107_000000_assign_group_permissions','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','0ff13617-ceac-405e-8458-0baeb2f269cd'),(74,'craft','m171117_000001_templatecache_index_tune','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','77d0e773-5c44-4048-b5f4-934772d85fbe'),(75,'craft','m171126_105927_disabled_plugins','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','8690b346-0b5c-4a8e-9ff2-8804a5d136c5'),(76,'craft','m171130_214407_craftidtokens_table','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','5f38b70d-2fec-4fbd-9bf9-cfb37c621fba'),(77,'craft','m171202_004225_update_email_settings','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','07fe7680-763c-4f8b-bbb2-ace8bfe411eb'),(78,'craft','m171204_000001_templatecache_index_tune_deux','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','a6c74f57-4c1c-44fb-8421-d7bd70312d32'),(79,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','d6026314-995a-4815-9b18-ce2aa676655f'),(80,'craft','m171218_143135_longtext_query_column','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','8f747f8e-c5b3-4fea-b886-83e18d38df8f'),(81,'craft','m171231_055546_environment_variables_to_aliases','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','074ae9a8-f9ea-429c-845a-ebabaa1e0264'),(82,'craft','m180113_153740_drop_users_archived_column','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','94d3dcb0-87d6-473d-b0f2-47f3e4a52314'),(83,'craft','m180122_213433_propagate_entries_setting','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','54968ca4-e5a5-4d24-8c74-fe558c83c29f'),(84,'craft','m180124_230459_fix_propagate_entries_values','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','eb0b9ea6-3870-4f0c-95a6-be9dcf9cdcb2'),(85,'craft','m180128_235202_set_tag_slugs','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','3f0a065b-7ca2-4a1c-8305-418e15bc0053'),(86,'craft','m180202_185551_fix_focal_points','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','152a8537-f013-4cf8-811c-6e5841c3efff'),(87,'craft','m180217_172123_tiny_ints','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','c3e99dd8-f2be-470e-a5ba-ecef98230ef4'),(88,'craft','m180321_233505_small_ints','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','64a53868-a156-4b99-994a-6201dae965c1'),(89,'craft','m180328_115523_new_license_key_statuses','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','6f94253a-9490-4514-810f-e612432eba56'),(90,'craft','m180404_182320_edition_changes','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','095c2e7e-e262-4d27-9f4e-a6889211e77e'),(91,'craft','m180411_102218_fix_db_routes','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','731742bc-8e59-405e-b1e6-c111d243e2a2'),(92,'craft','m180416_205628_resourcepaths_table','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','6e06ec91-db04-44db-a85d-1f370aeb2df5'),(93,'craft','m180418_205713_widget_cleanup','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','31f47605-5041-4181-a9a3-7881d11d31c1'),(94,'craft','m180425_203349_searchable_fields','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','dc4704d5-dcc9-422c-8a87-132be84fce1a'),(95,'craft','m180516_153000_uids_in_field_settings','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','3b4774d6-4654-4463-b2f1-97f726b62362'),(96,'craft','m180517_173000_user_photo_volume_to_uid','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','48aaf568-9b71-4dbb-b398-23ea179761ab'),(97,'craft','m180518_173000_permissions_to_uid','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','8c132a81-a3d6-495b-8266-cb3304906c7e'),(98,'craft','m180520_173000_matrix_context_to_uids','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','7cb3202e-0875-489a-a5b3-2d8a69450b2c'),(99,'craft','m180521_172900_project_config_table','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','8ddfe078-e983-44b3-8b73-6b8c3e7f8ba8'),(100,'craft','m180521_173000_initial_yml_and_snapshot','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','e44637ee-d8f3-420a-84bc-59e94f33096a'),(101,'craft','m180731_162030_soft_delete_sites','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','64b3c4ed-b2f0-4e9a-a79a-af12fc83dd7d'),(102,'craft','m180810_214427_soft_delete_field_layouts','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','76cbbfc5-0745-4ed2-8fd4-9bd227c0c0b4'),(103,'craft','m180810_214439_soft_delete_elements','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','a03e5d4d-5c49-42c4-a71a-69db678a8224'),(104,'craft','m180824_193422_case_sensitivity_fixes','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','c675d233-cde2-4c93-b3ca-9b37bb434053'),(105,'craft','m180901_151639_fix_matrixcontent_tables','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','3ef9239e-4fdb-4613-8e7c-15a3f4125de8'),(106,'craft','m180904_112109_permission_changes','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','5f3c9a1a-11d2-478c-b049-ad6334598763'),(107,'craft','m180910_142030_soft_delete_sitegroups','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','066fac48-7b3e-47f9-b85f-6b717b7925f4'),(108,'craft','m181011_160000_soft_delete_asset_support','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','a4c72873-ccef-484e-8e2d-930ad5215921'),(109,'craft','m181016_183648_set_default_user_settings','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','028d4e4c-c46f-45cf-9d78-7a1753c2b098'),(110,'craft','m181017_225222_system_config_settings','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','230b6760-a134-400b-8428-fbd7ae846bce'),(111,'craft','m181018_222343_drop_userpermissions_from_config','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','e7c9b7ec-aa66-49bd-a7eb-3915aeabb975'),(112,'craft','m181029_130000_add_transforms_routes_to_config','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','599bc463-b22f-487c-8a42-aca50d00e71e'),(113,'craft','m181112_203955_sequences_table','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','882f7e42-1fd5-4400-bf17-f4c1cdc33033'),(114,'craft','m181121_001712_cleanup_field_configs','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','78c5b189-03f7-4708-a650-b38f69d029e7'),(115,'craft','m181128_193942_fix_project_config','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','9dc406f3-6c6f-4059-b44d-59d16b0eb2b1'),(116,'craft','m181130_143040_fix_schema_version','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','55663d4f-27ff-411e-956c-e14655ecac0b'),(117,'craft','m181211_143040_fix_entry_type_uids','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','b1d4d9a4-6316-413a-945e-2feac788829b'),(118,'craft','m181213_102500_config_map_aliases','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','89bf7bbb-44a6-443c-8206-af3ff2989eba'),(119,'craft','m181217_153000_fix_structure_uids','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','846a472a-95f5-4f1f-a4f7-ca5184f269aa'),(120,'craft','m190104_152725_store_licensed_plugin_editions','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','5c209aff-00dd-42d9-8a42-b6564d100cc0'),(121,'craft','m190108_110000_cleanup_project_config','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','d327fadd-76d7-4503-be11-81da8a912af6'),(122,'craft','m190108_113000_asset_field_setting_change','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','695f277a-ab68-4a83-82f2-e936295adb3d'),(123,'craft','m190109_172845_fix_colspan','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','43910cd4-5e83-4b6d-855a-8f7b88b6247f'),(124,'craft','m190110_150000_prune_nonexisting_sites','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','4cd71f29-f98a-4899-a2b4-238a61c4db65'),(125,'craft','m190110_214819_soft_delete_volumes','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','8335956a-2c49-4a40-8b0e-e68b208e1c30'),(126,'craft','m190112_124737_fix_user_settings','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','4698b045-e5ee-4a56-bff7-c1fff754a9f1'),(127,'craft','m190112_131225_fix_field_layouts','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','902d60e1-8e2c-4f4a-9055-8f83c85f6e6d'),(128,'craft','m190112_201010_more_soft_deletes','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','7f9961ac-e762-4ef5-9a7a-fa1817d26bf4'),(129,'craft','m190114_143000_more_asset_field_setting_changes','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','e8cf4c8b-8f82-472d-b39d-f896cfc6d226'),(130,'craft','m190121_120000_rich_text_config_setting','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','0dec2485-9aab-4d9d-8d46-6756b44eeb93'),(131,'craft','m190125_191628_fix_email_transport_password','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','1cc76fe6-e762-4c91-beec-702c1b984b44'),(132,'craft','m190128_181422_cleanup_volume_folders','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','692967b5-27b0-432e-a903-069ba83f074c'),(133,'craft','m190205_140000_fix_asset_soft_delete_index','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','8ab58617-1897-42ae-94ae-0db48629922b'),(134,'craft','m190208_140000_reset_project_config_mapping','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','d9b0e8dd-3d94-416f-89f5-45df90281cf2'),(135,'craft','m190218_143000_element_index_settings_uid','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','76cc86f7-0364-4afe-90a6-6316792c9bdd'),(136,'craft','m190312_152740_element_revisions','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','bb233c1e-c672-4022-834d-955b2f2b2c5b'),(137,'craft','m190327_235137_propagation_method','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','be267a4a-fe8d-49a7-8d8f-db65a9a40281'),(138,'craft','m190401_223843_drop_old_indexes','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','8a3991de-610a-4423-bab3-0d7af54a2bd9'),(139,'craft','m190416_014525_drop_unique_global_indexes','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','17772379-ba34-4e84-b8e1-0515ad2af06e'),(140,'craft','m190417_085010_add_image_editor_permissions','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','3701bce4-d093-4d7a-adf6-fbb44d3c3696'),(141,'craft','m190502_122019_store_default_user_group_uid','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','241e3fa0-c65d-44ba-93c5-7017f358b17d'),(142,'craft','m190504_150349_preview_targets','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','0bc04b28-b115-4ee9-b48d-13e4f61f6553'),(143,'craft','m190516_184711_job_progress_label','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','fd29213c-6dca-4b79-9a1a-6153444036ef'),(144,'craft','m190523_190303_optional_revision_creators','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','6ffbf76b-3eda-4c76-a528-e8e4b5a03d16'),(145,'craft','m190529_204501_fix_duplicate_uids','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','af69fe27-56cc-4d3d-9acf-9a0b395274d0'),(146,'craft','m190605_223807_unsaved_drafts','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','674c3d9e-8a8d-4789-9cf2-304de25ce61d'),(147,'craft','m190607_230042_entry_revision_error_tables','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','c2e80144-eafe-4417-8e5d-68ab36613f48'),(148,'craft','m190608_033429_drop_elements_uid_idx','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','b46a28ab-4748-49d0-baf4-2259b7aaeda8'),(149,'craft','m190617_164400_add_gqlschemas_table','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','e4256312-0939-4eaa-af6e-46e7e333887b'),(150,'craft','m190624_234204_matrix_propagation_method','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','e2fdceea-2402-4dfc-b8ad-91a5bb6081ea'),(151,'craft','m190711_153020_drop_snapshots','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','eabbd986-c254-43b4-9293-617dec6ced0f'),(152,'craft','m190712_195914_no_draft_revisions','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','b9fa515f-0b21-4e90-8b24-55ce3b20fbdf'),(153,'craft','m190723_140314_fix_preview_targets_column','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','617fa9ec-59ff-48a6-9f37-0d058a8cf10f'),(154,'craft','m190820_003519_flush_compiled_templates','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','d6355a46-1036-4f2c-849c-31c1c744d5cf'),(155,'craft','m190823_020339_optional_draft_creators','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','8f291ec6-25df-48b1-b0fd-832c222067cc'),(156,'craft','m190913_152146_update_preview_targets','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','708fc9d8-e029-4b1b-9a8e-47e74fb3da23'),(157,'craft','m191107_122000_add_gql_project_config_support','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','378c63e4-b06d-4aaf-8432-2264aeb67810'),(158,'craft','m191204_085100_pack_savable_component_settings','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','6a175408-6d11-408d-b252-0604dd85b192'),(159,'craft','m191206_001148_change_tracking','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','a0e210b7-bd80-4b35-8559-9cdc1da25b54'),(160,'craft','m191216_191635_asset_upload_tracking','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','89b3dda9-0fa6-4741-8987-3aa30bfde7ee'),(161,'craft','m191222_002848_peer_asset_permissions','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','03c80884-65ce-47b0-98cc-a7a7049a8d82'),(162,'craft','m200127_172522_queue_channels','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','3fba8b65-7b25-4114-b773-430aaffc50b5'),(163,'craft','m200211_175048_truncate_element_query_cache','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','79e5d574-6170-42b0-920f-e63fae0baa9d'),(164,'craft','m200213_172522_new_elements_index','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','b8f132e5-cf07-4758-b90b-f0b691227577'),(165,'craft','m200228_195211_long_deprecation_messages','2020-03-27 13:22:44','2020-03-27 13:22:44','2020-03-27 13:22:44','63b1b93f-c645-4d76-9eee-9f5cda47dbd1'),(185,'craft','m200306_054652_disabled_sites','2020-10-16 15:16:14','2020-10-16 15:16:14','2020-10-16 15:16:14','abc2f9d4-4653-4583-82f4-7e483a13f888'),(186,'craft','m200522_191453_clear_template_caches','2020-10-16 15:16:14','2020-10-16 15:16:14','2020-10-16 15:16:14','b3cf261a-7c72-494f-b0d3-f90f37dd8697'),(187,'craft','m200606_231117_migration_tracks','2020-10-16 15:16:14','2020-10-16 15:16:14','2020-10-16 15:16:14','bc34bce4-9616-413c-8c68-5e9b60eb7210'),(188,'craft','m200619_215137_title_translation_method','2020-10-16 15:16:14','2020-10-16 15:16:14','2020-10-16 15:16:14','d7391893-a7b0-481b-bac7-bb8124f56aa2'),(189,'craft','m200620_005028_user_group_descriptions','2020-10-16 15:16:14','2020-10-16 15:16:14','2020-10-16 15:16:14','abd003bc-e99d-4929-8d42-fdb5adfa8c90'),(190,'craft','m200620_230205_field_layout_changes','2020-10-16 15:16:14','2020-10-16 15:16:14','2020-10-16 15:16:14','43b71a32-5238-4c70-90a2-6531b2042268'),(191,'craft','m200625_131100_move_entrytypes_to_top_project_config','2020-10-16 15:16:14','2020-10-16 15:16:14','2020-10-16 15:16:14','2b86d78a-0825-4c90-acf7-629463148de8'),(192,'craft','m200629_112700_remove_project_config_legacy_files','2020-10-16 15:16:14','2020-10-16 15:16:14','2020-10-16 15:16:14','35da89d2-87af-4f31-98d4-d028e5f44f03'),(193,'craft','m200630_183000_drop_configmap','2020-10-16 15:16:14','2020-10-16 15:16:14','2020-10-16 15:16:14','6e888e11-fff0-4cf6-83ed-ac62cce76ef0'),(194,'craft','m200715_113400_transform_index_error_flag','2020-10-16 15:16:14','2020-10-16 15:16:14','2020-10-16 15:16:14','b7bae372-1ba0-4109-ade5-b1f9af4a63a6'),(195,'craft','m200716_110900_replace_file_asset_permissions','2020-10-16 15:16:14','2020-10-16 15:16:14','2020-10-16 15:16:14','3a1671c1-3334-478b-92d3-35dce55d87ae'),(196,'craft','m200716_153800_public_token_settings_in_project_config','2020-10-16 15:16:14','2020-10-16 15:16:14','2020-10-16 15:16:14','9fcbf070-3ff5-40a0-910b-ed0c0e5ad88d'),(197,'craft','m200720_175543_drop_unique_constraints','2020-10-16 15:16:15','2020-10-16 15:16:15','2020-10-16 15:16:15','deaeab5a-092d-4e0f-95fb-18ef08d6489e'),(198,'craft','m200825_051217_project_config_version','2020-10-16 15:16:15','2020-10-16 15:16:15','2020-10-16 15:16:15','6e096de1-fcd8-4f96-92b3-37db41a29a25'),(204,'craft','m201116_190500_asset_title_translation_method','2021-02-28 04:53:01','2021-02-28 04:53:01','2021-02-28 04:53:01','94da610f-2014-4abf-adcb-175d1b85f4bb'),(205,'craft','m201124_003555_plugin_trials','2021-02-28 04:53:01','2021-02-28 04:53:01','2021-02-28 04:53:01','2f1fd1a7-9419-4809-b2d7-ea1c23107884'),(206,'craft','m210209_135503_soft_delete_field_groups','2021-02-28 04:53:01','2021-02-28 04:53:01','2021-02-28 04:53:01','a4136522-77e7-4bec-96d9-08066118c154'),(207,'craft','m210212_223539_delete_invalid_drafts','2021-02-28 04:53:01','2021-02-28 04:53:01','2021-02-28 04:53:01','e4608336-f165-4108-89c7-67d5d70cf2d2'),(208,'craft','m210214_202731_track_saved_drafts','2021-02-28 04:53:01','2021-02-28 04:53:01','2021-02-28 04:53:01','9b5948e1-7f7f-458f-8276-fefeee254ff2'),(212,'craft','m210223_150900_add_new_element_gql_schema_components','2021-03-15 15:23:29','2021-03-15 15:23:29','2021-03-15 15:23:29','aef28876-0de8-4eca-bd90-392d818d7740'),(213,'craft','m210224_162000_add_projectconfignames_table','2021-03-15 15:23:29','2021-03-15 15:23:29','2021-03-15 15:23:29','0eb6eb5a-2c3d-4321-901a-7fd2629fcc56'),(348,'craft','m210326_132000_invalidate_projectconfig_cache','2021-04-01 00:06:58','2021-04-01 00:06:58','2021-04-01 00:06:58','27d82ddb-2a06-4353-ab3c-21f1e89ee847'),(352,'craft','m210302_212318_canonical_elements','2021-12-31 19:54:53','2021-12-31 19:54:53','2021-12-31 19:54:53','b95c3961-06e8-4b12-8140-8cc73e649da8'),(353,'craft','m210329_214847_field_column_suffixes','2021-12-31 19:54:53','2021-12-31 19:54:53','2021-12-31 19:54:53','275e2104-9db1-4d13-beab-7de38ba38250'),(354,'craft','m210331_220322_null_author','2021-12-31 19:54:53','2021-12-31 19:54:53','2021-12-31 19:54:53','f17c25c0-e69d-49ad-bfe2-2357352b1100'),(355,'craft','m210405_231315_provisional_drafts','2021-12-31 19:54:53','2021-12-31 19:54:53','2021-12-31 19:54:53','773498da-411f-419a-919d-64437d1006b8'),(356,'craft','m210602_111300_project_config_names_in_config','2021-12-31 19:54:53','2021-12-31 19:54:53','2021-12-31 19:54:53','008cd678-ee78-4ace-b823-65fff1804b81'),(357,'craft','m210611_233510_default_placement_settings','2021-12-31 19:54:53','2021-12-31 19:54:53','2021-12-31 19:54:53','32cd27cd-6957-4934-ba34-833d02698472'),(358,'craft','m210613_145522_sortable_global_sets','2021-12-31 19:54:53','2021-12-31 19:54:53','2021-12-31 19:54:53','bb76554a-9c6a-40ea-a8e9-3a58991ab0fd'),(359,'craft','m210613_184103_announcements','2021-12-31 19:54:54','2021-12-31 19:54:54','2021-12-31 19:54:54','e812f795-d1da-410c-b115-0284944c03ca'),(360,'craft','m210829_000000_element_index_tweak','2021-12-31 19:54:54','2021-12-31 19:54:54','2021-12-31 19:54:54','874bc0af-3319-420c-a917-e77147236981'),(403,'craft','m220209_095604_add_indexes','2022-03-26 20:22:45','2022-03-26 20:22:45','2022-03-26 20:22:45','5e56d57f-64ea-4834-9095-bee08a24d7d8'),(404,'craft','m220214_000000_truncate_sessions','2022-03-26 20:22:45','2022-03-26 20:22:45','2022-03-26 20:22:45','ee2b8a61-c874-4208-9a0d-94cc03ee8d6f'),(405,'craft','m210121_145800_asset_indexing_changes','2022-04-24 03:26:51','2022-04-24 03:26:51','2022-04-24 03:26:51','0c456c2c-515a-4b1d-a71f-793dbc694a7a'),(406,'craft','m210624_222934_drop_deprecated_tables','2022-04-24 03:26:51','2022-04-24 03:26:51','2022-04-24 03:26:51','6d9dc7a9-be07-44cb-92dd-12f8dc3375d0'),(407,'craft','m210724_180756_rename_source_cols','2022-04-24 03:26:51','2022-04-24 03:26:51','2022-04-24 03:26:51','648fcb9a-bf20-4ae9-8584-be1e79d34d6a'),(408,'craft','m210809_124211_remove_superfluous_uids','2022-04-24 03:26:51','2022-04-24 03:26:51','2022-04-24 03:26:51','638e9f95-f116-4d63-8ada-6ae4a96ee6a2'),(409,'craft','m210817_014201_universal_users','2022-04-24 03:26:52','2022-04-24 03:26:52','2022-04-24 03:26:52','663f0d37-1311-4892-a6fb-a4b673243104'),(410,'craft','m210904_132612_store_element_source_settings_in_project_config','2022-04-24 03:26:52','2022-04-24 03:26:52','2022-04-24 03:26:52','2f8f8025-bd56-44f5-935f-6f25f33b49bd'),(411,'craft','m211115_135500_image_transformers','2022-04-24 03:26:52','2022-04-24 03:26:52','2022-04-24 03:26:52','9885dcb8-aa80-4bb1-829f-c1759343b1e7'),(412,'craft','m211201_131000_filesystems','2022-04-24 03:26:52','2022-04-24 03:26:52','2022-04-24 03:26:52','8d9ba3ff-1ebc-4e19-9a2b-1d72cef45c52'),(413,'craft','m220103_043103_tab_conditions','2022-04-24 03:26:53','2022-04-24 03:26:53','2022-04-24 03:26:53','80021f9d-dda1-4aa4-aa99-52c150b62d16'),(414,'craft','m220104_003433_asset_alt_text','2022-04-24 03:26:53','2022-04-24 03:26:53','2022-04-24 03:26:53','f68136c5-25e1-43c1-b576-694ffb476837'),(415,'craft','m220123_213619_update_permissions','2022-04-24 03:26:53','2022-04-24 03:26:53','2022-04-24 03:26:53','c8ac16c6-b42b-46c3-b7b7-ab0a46221df7'),(416,'craft','m220126_003432_addresses','2022-04-24 03:26:53','2022-04-24 03:26:53','2022-04-24 03:26:53','2521995d-2e0a-496c-af18-cb77f4076a29'),(417,'craft','m220213_015220_matrixblocks_owners_table','2022-04-24 03:26:53','2022-04-24 03:26:53','2022-04-24 03:26:53','3c87ab5b-4a61-441d-adf0-996e757106fc'),(418,'craft','m220222_122159_full_names','2022-04-24 03:26:53','2022-04-24 03:26:53','2022-04-24 03:26:53','38b6704f-3fce-404c-9f0b-cd72f7e7f624'),(419,'craft','m220223_180559_nullable_address_owner','2022-04-24 03:26:53','2022-04-24 03:26:53','2022-04-24 03:26:53','db7f1511-5438-457b-b22f-905be4ee63fd'),(420,'craft','m220225_165000_transform_filesystems','2022-04-24 03:26:53','2022-04-24 03:26:53','2022-04-24 03:26:53','b8d769ff-7db9-434c-a817-9486dd4c0024'),(421,'craft','m220309_152006_rename_field_layout_elements','2022-04-24 03:26:53','2022-04-24 03:26:53','2022-04-24 03:26:53','a6ad28e0-7ba5-458a-9117-7c94ff386674'),(422,'craft','m220314_211928_field_layout_element_uids','2022-04-24 03:26:53','2022-04-24 03:26:53','2022-04-24 03:26:53','316a6f31-717b-4413-92d9-2cc7c17a53cf'),(423,'craft','m220316_123800_transform_fs_subpath','2022-04-24 03:26:53','2022-04-24 03:26:53','2022-04-24 03:26:53','df31b86c-83aa-46c0-8617-ce2e089c5437'),(424,'craft','m220317_174250_release_all_jobs','2022-04-24 03:26:53','2022-04-24 03:26:53','2022-04-24 03:26:53','849bbc06-6d85-441d-b359-d4e2362f67e9'),(425,'craft','m220330_150000_add_site_gql_schema_components','2022-04-24 03:26:53','2022-04-24 03:26:53','2022-04-24 03:26:53','dac823bb-6ddc-4a4d-b278-7e76ecdbc636');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1650770812'),('email.fromEmail','\"andrew@nystudio107.com\"'),('email.fromName','\"Craft\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('fs.site.hasUrls','true'),('fs.site.name','\"Site\"'),('fs.site.settings.path','\"@webroot/assets/site\"'),('fs.site.type','\"craft\\\\fs\\\\Local\"'),('fs.site.url','\"@web/assets/site\"'),('graphql.publicToken.enabled','false'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.6005c2f9-5d85-4442-b712-22e070096ac8.isPublic','true'),('graphql.schemas.6005c2f9-5d85-4442-b712-22e070096ac8.name','\"Public Schema\"'),('meta.__names__.071aeb2b-e8eb-4bcf-825c-dd016745f107','\"Flavor\"'),('meta.__names__.1f716763-7f9e-4ffd-9f8c-2c0e7ccf15f7','\"Selected\"'),('meta.__names__.4828c563-32cf-4021-afeb-1d5e38f31daf','\"Accent Color\"'),('meta.__names__.5c642d7e-b16b-4836-9575-668d75d242e5','\"Site\"'),('meta.__names__.5da841b1-ca0d-46ff-8bb1-04d6c889ac54','\"English\"'),('meta.__names__.6005c2f9-5d85-4442-b712-22e070096ac8','\"Public Schema\"'),('meta.__names__.6359fe58-db81-4ee6-94eb-e9f4e3c61da6','\"Notes\"'),('meta.__names__.7a591e66-18df-490d-92b5-3fd3a3986f09','\"default\"'),('meta.__names__.8f804a45-ad1d-4a71-b0b4-6df2040dc205','\"Nuts\"'),('meta.__names__.c2e2b69d-127d-4afe-8032-0209247e70de','\"default\"'),('meta.__names__.dd87a305-fb8e-4bc0-965b-8afadc876934','\"Syrup\"'),('meta.__names__.e7500fc4-6a5e-4656-8947-27c47c0c9dd8','\"Whip\"'),('meta.__names__.f652db8c-edc2-4a66-8241-2fb0787110ee','\"Primary Color\"'),('meta.__names__.f89601e9-4ba9-4a48-9e99-350aa9914912','\"default\"'),('siteGroups.f89601e9-4ba9-4a48-9e99-350aa9914912.name','\"default\"'),('sites.5da841b1-ca0d-46ff-8bb1-04d6c889ac54.baseUrl','\"@web/\"'),('sites.5da841b1-ca0d-46ff-8bb1-04d6c889ac54.enabled','true'),('sites.5da841b1-ca0d-46ff-8bb1-04d6c889ac54.handle','\"default\"'),('sites.5da841b1-ca0d-46ff-8bb1-04d6c889ac54.hasUrls','true'),('sites.5da841b1-ca0d-46ff-8bb1-04d6c889ac54.language','\"en-US\"'),('sites.5da841b1-ca0d-46ff-8bb1-04d6c889ac54.name','\"English\"'),('sites.5da841b1-ca0d-46ff-8bb1-04d6c889ac54.primary','true'),('sites.5da841b1-ca0d-46ff-8bb1-04d6c889ac54.siteGroup','\"f89601e9-4ba9-4a48-9e99-350aa9914912\"'),('sites.5da841b1-ca0d-46ff-8bb1-04d6c889ac54.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"Craft CMS\"'),('system.retryDuration','60'),('system.schemaVersion','\"4.0.0.8\"'),('system.timeZone','\"America/New_York\"'),('users.allowPublicRegistration','false'),('users.deactivateByDefault','false'),('users.defaultGroup','null'),('users.fieldLayouts.34d1d67d-a82b-4439-a563-3193f2964a51.tabs.0.elements.0.fieldUid','\"858b290d-45ae-4da8-8e51-2c03caefeee3\"'),('users.fieldLayouts.34d1d67d-a82b-4439-a563-3193f2964a51.tabs.0.elements.0.instructions','null'),('users.fieldLayouts.34d1d67d-a82b-4439-a563-3193f2964a51.tabs.0.elements.0.label','null'),('users.fieldLayouts.34d1d67d-a82b-4439-a563-3193f2964a51.tabs.0.elements.0.required','false'),('users.fieldLayouts.34d1d67d-a82b-4439-a563-3193f2964a51.tabs.0.elements.0.tip','null'),('users.fieldLayouts.34d1d67d-a82b-4439-a563-3193f2964a51.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('users.fieldLayouts.34d1d67d-a82b-4439-a563-3193f2964a51.tabs.0.elements.0.warning','null'),('users.fieldLayouts.34d1d67d-a82b-4439-a563-3193f2964a51.tabs.0.elements.0.width','100'),('users.fieldLayouts.34d1d67d-a82b-4439-a563-3193f2964a51.tabs.0.name','\"User Settings\"'),('users.fieldLayouts.34d1d67d-a82b-4439-a563-3193f2964a51.tabs.0.sortOrder','1'),('users.photoSubpath','\"\"'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.autocapitalize','true'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.autocomplete','false'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.autocorrect','true'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.class','null'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.disabled','false'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.id','null'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.instructions','null'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.label','null'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.max','null'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.min','null'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.name','null'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.orientation','null'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.placeholder','null'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.readonly','false'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.requirable','false'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.size','null'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.step','null'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.tip','null'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.title','null'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.warning','null'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.elements.0.width','100'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.name','\"Content\"'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fieldLayouts.e73b4186-2fad-4c0f-8eae-bbb884932c58.tabs.0.sortOrder','1'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.fs','\"site\"'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.handle','\"site\"'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.hasUrls','true'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.name','\"Site\"'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.sortOrder','0'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.titleTranslationKeyFormat','null'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.titleTranslationMethod','\"site\"'),('volumes.5c642d7e-b16b-4836-9575-668d75d242e5.url','\"@web/assets/site\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (8,13,38,NULL,30,1,'2022-01-06 14:58:59','2022-01-06 14:58:59','48d1654a-1808-4e6c-9802-b00b9a088b62'),(9,13,40,NULL,30,1,'2022-01-06 14:58:59','2022-01-06 14:58:59','9701db82-ff40-4421-905f-ac97a68d7ac4'),(12,13,46,NULL,30,1,'2022-01-06 15:21:30','2022-01-06 15:21:30','0e1143f2-0390-4098-b34e-e967d97a8e4b'),(16,13,52,NULL,24,1,'2022-01-06 15:26:16','2022-01-06 15:26:16','a3ad779b-559e-4ad0-8ff0-ff488f966f0a'),(17,13,54,NULL,30,1,'2022-01-06 15:26:16','2022-01-06 15:26:16','878cf3bf-5939-4760-9d58-21709923d151'),(18,13,55,NULL,24,1,'2022-01-06 15:26:17','2022-01-06 15:26:17','ce23709c-d6f8-4859-a2e0-3ef4b6f6a75e'),(21,13,60,NULL,30,1,'2022-01-06 15:26:24','2022-01-06 15:26:24','45ba96a8-66bd-4265-bc43-6239eca6af07'),(22,13,61,NULL,24,1,'2022-01-06 15:26:24','2022-01-06 15:26:24','2c718308-b8c3-445a-a4b5-c646a9c9e036'),(25,13,66,NULL,30,1,'2022-01-06 15:26:39','2022-01-06 15:26:39','938efe2e-d6b2-4689-8ec3-fa405d2e6602'),(26,13,67,NULL,24,1,'2022-01-06 15:26:39','2022-01-06 15:26:39','efbdbc77-c7f3-4e63-b798-4db57e1ea77f'),(29,13,72,NULL,30,1,'2022-01-06 15:34:41','2022-01-06 15:34:41','ace63f14-e183-4ac5-8eb7-3479c0fb360b'),(30,13,73,NULL,24,1,'2022-01-06 15:34:41','2022-01-06 15:34:41','e9c3be95-06db-4282-ae81-370a66fca612'),(31,13,75,NULL,30,1,'2022-01-06 15:34:49','2022-01-06 15:34:49','3ca2dc83-3860-48b3-9483-cfef2a83a94b'),(32,13,76,NULL,24,1,'2022-01-06 15:34:49','2022-01-06 15:34:49','560bc3ee-bd60-4dca-8cc8-64eee571dfca'),(35,13,81,NULL,30,1,'2022-01-06 15:38:44','2022-01-06 15:38:44','b733064b-fc2b-43c6-bda3-8f616c37979a'),(36,13,82,NULL,24,1,'2022-01-06 15:38:44','2022-01-06 15:38:44','b76bf5af-3ed5-4c3c-bfcb-b46678ecff00'),(39,13,87,NULL,30,1,'2022-01-06 15:45:36','2022-01-06 15:45:36','3e5a197d-6ca0-4a9c-9230-c98f6a3ab9f1'),(40,13,88,NULL,24,1,'2022-01-06 15:45:36','2022-01-06 15:45:36','40afa6c3-97ca-4ec0-85ee-374885de3838'),(43,13,93,NULL,30,1,'2022-01-06 15:46:19','2022-01-06 15:46:19','62647f95-b1fb-47d7-98ae-23373c5429f3'),(44,13,94,NULL,24,1,'2022-01-06 15:46:19','2022-01-06 15:46:19','17e89a94-0e5e-4967-8e0b-98df5e6db1d1'),(47,13,99,NULL,30,1,'2022-01-06 15:55:36','2022-01-06 15:55:36','a01188ac-e39d-4ade-8d1d-de1f454cf0d2'),(48,13,100,NULL,24,1,'2022-01-06 15:55:36','2022-01-06 15:55:36','ef931f57-5dff-4b20-a074-a06e951abb03'),(53,13,108,NULL,30,1,'2022-01-06 15:56:50','2022-01-06 15:56:50','2acb731d-08e3-4a20-876d-d8d9fee3f7b5'),(54,13,109,NULL,24,1,'2022-01-06 15:56:50','2022-01-06 15:56:50','2b7f7773-7ab9-4a94-affb-db535633eb90'),(57,13,114,NULL,30,1,'2022-01-06 16:03:37','2022-01-06 16:03:37','4565a538-b123-4117-866e-475e86d41939'),(58,13,115,NULL,24,1,'2022-01-06 16:03:37','2022-01-06 16:03:37','4dbf74fc-5e36-41f5-a47b-41da818e0fe1'),(59,13,117,NULL,30,1,'2022-01-06 16:03:42','2022-01-06 16:03:42','f7aae761-8434-409c-bce1-66700000ee22'),(60,13,118,NULL,24,1,'2022-01-06 16:03:42','2022-01-06 16:03:42','0910fa92-d48d-4331-9706-d75af4ee2ede'),(64,13,125,NULL,27,1,'2022-01-06 16:09:27','2022-01-06 16:09:27','d6966404-0038-4db6-b84c-1bc1119a35b3'),(65,13,127,NULL,30,1,'2022-01-06 16:09:27','2022-01-06 16:09:27','07b33f74-f23b-4855-90ed-59f4e7f40b5a'),(66,13,128,NULL,24,1,'2022-01-06 16:09:27','2022-01-06 16:09:27','a27914bd-ed3d-4114-806f-8ae426ebdb60'),(67,13,129,NULL,27,1,'2022-01-06 16:09:27','2022-01-06 16:09:27','a7190c08-92ed-41bd-bf70-426e6af5438f'),(71,13,135,NULL,24,1,'2022-01-06 16:09:38','2022-01-06 16:09:38','b41ac9ac-842f-4eca-b98b-1067f9fa3b10'),(72,13,136,NULL,30,1,'2022-01-06 16:09:38','2022-01-06 16:09:38','e2432a0f-d8ec-4af4-9e8e-5ae65362c108'),(73,13,137,NULL,27,1,'2022-01-06 16:09:38','2022-01-06 16:09:38','c9c863d4-f279-40bf-830e-ae393dff27e0'),(77,13,143,NULL,24,1,'2022-01-06 16:09:44','2022-01-06 16:09:44','6f29c363-5809-49fb-ba48-61ba7b2603ef'),(78,13,144,NULL,27,1,'2022-01-06 16:09:44','2022-01-06 16:09:44','8edc614f-c749-4cfb-bad4-75d24f86d5d2'),(82,13,153,NULL,30,1,'2022-01-06 16:13:32','2022-01-06 16:13:32','bdacd599-cc12-4c33-853c-48225d30d8e4'),(83,13,155,NULL,30,1,'2022-01-06 16:13:32','2022-01-06 16:13:32','b12936f0-ba73-4dcd-a69e-f10b41f2f095'),(90,13,167,NULL,27,1,'2022-01-06 17:41:16','2022-01-06 17:41:16','7e7c6443-ad62-4e89-8672-f714c816e931'),(95,13,174,NULL,30,1,'2022-01-06 17:41:50','2022-01-06 17:41:50','215875cf-71c3-47de-a3e2-d8682fae9c75'),(96,13,176,NULL,27,1,'2022-01-06 17:41:50','2022-01-06 17:41:50','6960e828-f7b6-4726-a7d0-7e061c3e357a'),(97,13,177,NULL,30,1,'2022-01-06 17:41:50','2022-01-06 17:41:50','59981f7d-4c9c-4bfd-bf3c-26909a972c1e'),(101,13,165,NULL,24,1,'2022-01-06 17:44:55','2022-01-06 17:44:55','4bb8809f-3ce9-48bf-b692-aa75c9303c5d'),(102,13,182,NULL,24,1,'2022-01-06 17:44:55','2022-01-06 17:44:55','5cd1f677-630e-45f5-b3d6-c0bf5eb5aa0b'),(103,13,183,NULL,30,1,'2022-01-06 17:44:55','2022-01-06 17:44:55','710c2b37-97c6-4e75-a081-c984bfa984b6'),(107,13,189,NULL,27,1,'2022-01-06 17:45:46','2022-01-06 17:45:46','4f949f20-9e36-4452-b22a-bc26b08b360e'),(108,13,191,NULL,30,1,'2022-01-06 17:45:46','2022-01-06 17:45:46','ed3e74c8-371b-4168-965e-f8df1a6db397'),(109,13,192,NULL,24,1,'2022-01-06 17:45:46','2022-01-06 17:45:46','15ec6e7f-f103-408b-b6fb-d46bd7f9a15f'),(110,13,193,NULL,27,1,'2022-01-06 17:45:46','2022-01-06 17:45:46','ea134399-fd78-41d2-9f12-e00b68448caa'),(111,13,195,NULL,30,1,'2022-01-06 17:47:14','2022-01-06 17:47:14','e4f13c3f-fe60-438f-b94c-c69db8adb08d'),(112,13,196,NULL,24,1,'2022-01-06 17:47:14','2022-01-06 17:47:14','71007dd9-289d-4602-b27c-35029b2221dd'),(113,13,197,NULL,27,1,'2022-01-06 17:47:14','2022-01-06 17:47:14','146b501e-d956-4542-a6e6-666219dd2045'),(117,13,205,NULL,30,1,'2022-01-22 03:05:59','2022-01-22 03:05:59','245e07ea-261a-4398-bdf0-bae64b218bb5'),(118,13,206,NULL,24,1,'2022-01-22 03:05:59','2022-01-22 03:05:59','397839de-7cb7-44ed-8fa2-ff9bb482ba3c'),(119,13,207,NULL,27,1,'2022-01-22 03:05:59','2022-01-22 03:05:59','651c9829-4ce4-4bed-8550-54b96dc3ff1b'),(123,13,213,NULL,30,1,'2022-01-22 03:16:41','2022-01-22 03:16:41','dfc5de30-d432-4372-bf17-884de1bd6792'),(124,13,214,NULL,24,1,'2022-01-22 03:16:41','2022-01-22 03:16:41','31dfd3d1-d924-4668-8083-de1de6c37d99'),(125,13,215,NULL,27,1,'2022-01-22 03:16:41','2022-01-22 03:16:41','45432b74-0b7d-43fc-ad2c-aabe682aa78a');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `retour_redirects`
--

LOCK TABLES `retour_redirects` WRITE;
/*!40000 ALTER TABLE `retour_redirects` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `retour_redirects` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `retour_static_redirects`
--

LOCK TABLES `retour_static_redirects` WRITE;
/*!40000 ALTER TABLE `retour_static_redirects` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `retour_static_redirects` VALUES (1,'2022-01-06 14:58:59','2022-01-06 14:58:59','acf557bc-fbb2-48a7-a4df-312901c2c0a8',2,0,1,'/orders/__temp_cfyrozefvlxbfuhhlmpfsmkzlmfbaotibnxi','/orders/__temp_cfyrozefvlxbfuhhlmpfsmkzlmfbaotibnxi','pathonly','exactmatch','/orders/entry-35',301,0,NULL);
/*!40000 ALTER TABLE `retour_static_redirects` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `retour_stats`
--

LOCK TABLES `retour_stats` WRITE;
/*!40000 ALTER TABLE `retour_stats` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `retour_stats` VALUES (1,'2020-03-27 13:32:33','2022-01-17 14:09:25','d51a6505-12b4-479c-8521-90eec927b370',1,'/favicon.ico','http://localhost:8000/admin/retour/dashboard','172.23.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36','Template not found: favicon.ico','/var/www/project/cms/vendor/craftcms/cms/src/controllers/TemplatesController.php',94,13,'2022-01-17 14:09:25',0),(2,'2020-10-16 15:31:42','2020-10-16 15:31:42','32f201b5-aa6a-47cb-9167-8f4455303414',1,'/webperf/metrics/beacon','http://localhost:8000/','172.26.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36','Template not found: webperf/metrics/beacon','/var/www/project/cms/vendor/craftcms/cms/src/controllers/TemplatesController.php',92,1,'2020-10-16 15:31:42',0),(3,'2021-12-31 20:04:51','2022-01-17 20:16:31','0d2b83ea-c974-48ed-b5ee-b61a6d2e3e5e',1,'/__vite_ping','http://localhost:8000/admin/settings/fields/edit/4','172.23.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36','Page not found.','/var/www/project/cms/vendor/craftcms/cms/src/web/Request.php',1326,37,'2022-01-17 20:16:31',0);
/*!40000 ALTER TABLE `retour_stats` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,17,1,1,''),(2,17,1,2,''),(3,24,1,1,''),(4,27,1,1,''),(5,30,1,1,''),(6,33,1,1,''),(7,33,1,2,'Applied “Draft 1”'),(8,33,1,3,'Applied “Draft 1”'),(9,33,1,4,'Applied “Draft 1”'),(10,33,1,5,'Applied “Draft 1”'),(11,33,1,6,'Applied “Draft 1”'),(12,33,1,7,'Applied “Draft 1”'),(13,33,1,8,''),(14,33,1,9,'Applied “Draft 1”'),(15,33,1,10,'Applied “Draft 1”'),(16,33,1,11,'Applied “Draft 1”'),(17,33,1,12,''),(18,33,1,13,'Applied “Draft 1”'),(19,33,1,14,'Applied “Draft 1”'),(20,33,1,15,''),(21,33,1,16,'Applied “Draft 1”'),(22,33,1,17,'Applied “Draft 1”'),(23,33,1,18,'Applied “Draft 1”'),(24,33,1,19,'Applied “Draft 1”'),(25,33,1,20,'Applied “Draft 1”'),(26,33,1,21,'Applied “Draft 1”'),(27,33,1,22,'Applied “Draft 1”'),(28,33,1,23,'Applied “Draft 1”'),(29,33,1,24,'Applied “Draft 1”'),(30,33,1,25,'Applied “Draft 1”'),(31,33,1,26,''),(32,17,1,3,''),(33,17,1,4,''),(34,33,1,27,'Applied “Draft 1”'),(35,33,1,28,'Applied “Draft 1”'),(36,216,1,1,''),(37,216,1,2,'Applied “Draft 1”'),(38,216,1,3,'Applied “Draft 1”'),(39,216,1,4,'Applied “Draft 1”'),(40,216,1,5,'Applied “Draft 1”'),(41,216,1,6,'Applied “Draft 1”'),(42,216,1,7,'Applied “Draft 1”'),(43,216,1,8,'Applied “Draft 1”'),(44,216,1,9,'Applied “Draft 1”');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' admin '),(2,'title',0,1,' homepage '),(2,'slug',0,1,' homepage '),(2,'slug',0,2,' homepage '),(2,'title',0,2,' homepage '),(3,'slug',0,1,''),(17,'title',0,1,' my first blog '),(17,'slug',0,1,' my first blog '),(19,'slug',0,2,''),(19,'slug',0,1,''),(21,'title',0,2,' puppies '),(21,'slug',0,2,' puppies '),(21,'slug',0,1,' puppies '),(21,'title',0,1,' puppies '),(22,'title',0,2,' kitties '),(22,'slug',0,2,' kitties '),(22,'slug',0,1,' kitties '),(22,'title',0,1,' kitties '),(23,'kind',0,2,' image '),(23,'slug',0,2,''),(23,'extension',0,2,' jpg '),(23,'filename',0,2,' fhedat4x0aafhbi jpg '),(23,'filename',0,1,' fhedat4x0aafhbi jpg '),(23,'extension',0,1,' jpg '),(23,'kind',0,1,' image '),(23,'slug',0,1,''),(23,'title',0,1,' fhed at4 x0 aafh bi '),(23,'title',0,2,' fhed at4 x0 aafh bi '),(24,'slug',0,2,' vanilla '),(24,'title',0,1,' vanilla '),(24,'slug',0,1,' vanilla '),(24,'title',0,2,' vanilla '),(25,'kind',0,2,' image '),(25,'slug',0,2,''),(25,'extension',0,2,' jpg '),(25,'filename',0,2,' 582 5827467 homemade brand vanilla ice cream scoop homemade brand jpg '),(25,'extension',0,1,' jpg '),(25,'kind',0,1,' image '),(25,'slug',0,1,''),(25,'title',0,1,' vanilla scoop '),(25,'title',0,2,' 582 5827467 homemade brand vanilla ice cream scoop homemade brand '),(27,'title',0,2,' chocolate '),(27,'slug',0,1,' chocolate '),(27,'slug',0,2,' chocolate '),(28,'kind',0,2,' image '),(28,'slug',0,2,''),(28,'title',0,2,' chocolate ice cream scoop ice cream ice cream scoop isolated delicious indulgence dessert sweet 118155804 '),(28,'extension',0,2,' jpg '),(28,'filename',0,2,' chocolate ice cream scoop ice cream ice cream scoop isolated delicious indulgence dessert sweet 118155804 jpg '),(28,'filename',0,1,' chocolate scoop jpg '),(28,'extension',0,1,' jpg '),(28,'kind',0,1,' image '),(28,'slug',0,1,''),(28,'title',0,1,' chocolate scoop '),(27,'title',0,1,' chocolate '),(30,'title',0,2,' strawberry '),(30,'slug',0,2,' strawberry '),(30,'title',0,1,' strawberry '),(30,'slug',0,1,' strawberry '),(31,'kind',0,2,' image '),(31,'extension',0,2,' png '),(31,'filename',0,2,' rfnsa strawberry scoop2 png '),(31,'extension',0,1,' png '),(31,'kind',0,1,' image '),(31,'slug',0,1,''),(31,'title',0,1,' strawberry scoop '),(31,'slug',0,2,''),(31,'title',0,2,' rfnsa strawberry scoop2 '),(165,'slug',0,2,''),(174,'slug',0,1,''),(33,'title',0,1,' some order '),(33,'slug',0,2,' entry 35 '),(33,'title',0,2,' entry 35 '),(38,'slug',0,1,''),(38,'slug',0,2,''),(52,'slug',0,1,''),(52,'slug',0,2,''),(125,'slug',0,1,''),(125,'slug',0,2,''),(165,'slug',0,1,''),(153,'slug',0,1,''),(153,'slug',0,2,''),(189,'slug',0,1,''),(17,'slug',0,2,' my first blog '),(17,'title',0,2,' my first blog '),(174,'slug',0,2,''),(189,'slug',0,2,''),(31,'filename',0,1,' strawberry scoop png '),(25,'filename',0,1,' vanilla scoop jpg '),(33,'slug',0,1,' some order '),(240,'slug',0,1,''),(216,'slug',0,1,' landing page '),(239,'slug',0,1,''),(219,'slug',0,1,''),(241,'slug',0,1,''),(222,'slug',0,1,''),(223,'slug',0,1,''),(224,'slug',0,1,''),(225,'slug',0,1,''),(226,'slug',0,1,''),(227,'slug',0,1,''),(230,'slug',0,1,''),(231,'slug',0,1,''),(232,'slug',0,1,''),(233,'slug',0,1,''),(234,'slug',0,1,''),(235,'slug',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'firstname',0,1,''),(302,'title',0,1,' landing page '),(303,'slug',0,1,''),(304,'slug',0,1,''),(305,'slug',0,1,''),(302,'slug',0,1,' landing page '),(216,'title',0,1,' landing page '),(1,'email',0,1,' ryan craftquest io '),(1,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (5,NULL,'Homepage','homepage','single',0,'all','end','[{\"label\":\"Entry\",\"urlFormat\":\"/\",\"refresh\":\"1\"}]','2020-03-27 13:38:49','2021-03-15 15:04:41','2022-01-19 17:33:35','54e60257-f31a-44aa-960e-bbd364197e28'),(6,NULL,'Blog','blog','channel',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2021-03-15 15:39:25','2021-03-15 15:39:25','2022-01-19 17:33:38','de308a7d-1794-448f-9176-29e2eace7ecf'),(7,NULL,'Flavors','flavors','channel',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2022-01-06 14:09:20','2022-04-24 01:18:46','2022-04-24 02:57:47','10571998-751e-449a-98c5-d48adf32034b'),(8,NULL,'Orders','orders','channel',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2022-01-06 14:46:04','2022-04-24 01:18:46','2022-04-24 02:57:50','1f2ba12a-f04e-47d9-af2b-3e876c5adbce'),(9,NULL,'Pages','pages','channel',1,'all','end',NULL,'2022-01-22 03:17:16','2022-04-24 01:18:46','2022-04-24 02:57:53','7c3fb4f3-2ba5-4834-9056-6712aa5c18f4');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (2,5,1,1,'__home__','index',1,'2020-03-27 13:38:49','2020-03-27 13:38:49','94d75213-7345-4ed4-9251-15f5d2f8a915'),(4,6,1,1,'blog/{slug}','blog/_entry',1,'2021-03-15 15:39:25','2021-03-15 15:39:25','f134ef0e-b422-449e-971f-5465a6c43bf5'),(6,7,1,1,'flavors/{slug}','flavors/_entry',1,'2022-01-06 14:09:20','2022-01-06 14:09:20','fd3fb3c5-9031-4302-baf2-1b157cc44ca2'),(8,8,1,1,'orders/{slug}','orders/_entry',1,'2022-01-06 14:46:04','2022-01-06 14:46:04','c16c1804-9097-4ae5-81c5-dc3dbbf6e6ca'),(10,9,1,1,'pages/{slug}','pages/_entry',1,'2022-01-22 03:17:16','2022-01-22 03:17:16','eb91a8fe-cf5b-4268-96ec-9ef018662ce7');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `seomatic_metabundles`
--

LOCK TABLES `seomatic_metabundles` WRITE;
/*!40000 ALTER TABLE `seomatic_metabundles` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `seomatic_metabundles` VALUES (1,'2020-03-27 13:29:52','2021-12-31 19:57:31','54bcfb25-90fc-40ce-8a49-7ff73bee5bd6','1.0.59','__GLOBAL_BUNDLE__',1,'__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__',NULL,'',1,'[]','2021-12-31 19:57:31','{\"language\":null,\"mainEntityOfPage\":\"WebSite\",\"seoTitle\":\"\",\"siteNamePosition\":\"before\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{seomatic.helper.safeCanonicalUrl()}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"none\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"none\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"Project\",\"identity\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"creator\":{\"siteType\":\"Organization\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"nystudio107\",\"genericAlternateName\":\"nys\",\"genericDescription\":\"We do technology-based consulting, branding, design, and development. Making the web better one site at a time, with a focus on performance, usability & SEO\",\"genericUrl\":\"https://nystudio107.com/\",\"genericImage\":\"https://nystudio107-ems2qegf7x6qiqq.netdna-ssl.com/img/site/nys_logo_seo.png\",\"genericImageWidth\":\"1042\",\"genericImageHeight\":\"1042\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"info@nystudio107.com\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"Webster\",\"genericAddressRegion\":\"NY\",\"genericPostalCode\":\"14580\",\"genericAddressCountry\":\"US\",\"genericGeoLatitude\":\"43.2365384\",\"genericGeoLongitude\":\"-77.49211620000001\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"Andrew Welch, Polly Welch\",\"organizationFoundingDate\":\"2013-05-02\",\"organizationFoundingLocation\":\"Webster, NY\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":{\"twitter\":{\"siteName\":\"Twitter\",\"handle\":\"twitter\",\"url\":\"\"},\"facebook\":{\"siteName\":\"Facebook\",\"handle\":\"facebook\",\"url\":\"\"},\"wikipedia\":{\"siteName\":\"Wikipedia\",\"handle\":\"wikipedia\",\"url\":\"\"},\"linkedin\":{\"siteName\":\"LinkedIn\",\"handle\":\"linkedin\",\"url\":\"\"},\"googleplus\":{\"siteName\":\"Google+\",\"handle\":\"googleplus\",\"url\":\"\"},\"youtube\":{\"siteName\":\"YouTube\",\"handle\":\"youtube\",\"url\":\"\"},\"instagram\":{\"siteName\":\"Instagram\",\"handle\":\"instagram\",\"url\":\"\"},\"pinterest\":{\"siteName\":\"Pinterest\",\"handle\":\"pinterest\",\"url\":\"\"},\"github\":{\"siteName\":\"GitHub\",\"handle\":\"github\",\"url\":\"\"},\"vimeo\":{\"siteName\":\"Vimeo\",\"handle\":\"vimeo\",\"url\":\"\"}},\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":{\"generator\":{\"charset\":\"\",\"content\":\"SEOmatic\",\"httpEquiv\":\"\",\"name\":\"generator\",\"property\":null,\"include\":true,\"key\":\"generator\",\"environment\":null,\"dependencies\":{\"config\":[\"generatorEnabled\"]},\"tagAttrs\":[]},\"keywords\":{\"charset\":\"\",\"content\":\"{seomatic.meta.seoKeywords}\",\"httpEquiv\":\"\",\"name\":\"keywords\",\"property\":null,\"include\":true,\"key\":\"keywords\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"description\":{\"charset\":\"\",\"content\":\"{seomatic.meta.seoDescription}\",\"httpEquiv\":\"\",\"name\":\"description\",\"property\":null,\"include\":true,\"key\":\"description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"referrer\":{\"charset\":\"\",\"content\":\"{seomatic.site.referrer}\",\"httpEquiv\":\"\",\"name\":\"referrer\",\"property\":null,\"include\":true,\"key\":\"referrer\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"robots\":{\"charset\":\"\",\"content\":\"{seomatic.meta.robots}\",\"httpEquiv\":\"\",\"name\":\"robots\",\"property\":null,\"include\":true,\"key\":\"robots\",\"environment\":{\"live\":{\"content\":\"{seomatic.meta.robots}\"},\"staging\":{\"content\":\"none\"},\"local\":{\"content\":\"none\"}},\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":{\"fb:profile_id\":{\"charset\":\"\",\"content\":\"{seomatic.site.facebookProfileId}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:profile_id\",\"include\":true,\"key\":\"fb:profile_id\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"fb:app_id\":{\"charset\":\"\",\"content\":\"{seomatic.site.facebookAppId}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:app_id\",\"include\":true,\"key\":\"fb:app_id\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:locale\":{\"charset\":\"\",\"content\":\"{{ craft.app.language |replace({\\\"-\\\": \\\"_\\\"}) }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale\",\"include\":true,\"key\":\"og:locale\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:locale:alternate\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale:alternate\",\"include\":true,\"key\":\"og:locale:alternate\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:site_name\":{\"charset\":\"\",\"content\":\"{seomatic.site.siteName}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:site_name\",\"include\":true,\"key\":\"og:site_name\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:type\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogType}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:type\",\"include\":true,\"key\":\"og:type\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:url\":{\"charset\":\"\",\"content\":\"{seomatic.meta.canonicalUrl}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:url\",\"include\":true,\"key\":\"og:url\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:title\":{\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.ogSiteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"charset\":\"\",\"content\":\"{seomatic.meta.ogTitle}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:title\",\"include\":true,\"key\":\"og:title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:description\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogDescription}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:description\",\"include\":true,\"key\":\"og:description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:image\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogImage}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image\",\"include\":true,\"key\":\"og:image\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:image:width\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogImageWidth}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:width\",\"include\":true,\"key\":\"og:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:image:height\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogImageHeight}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:height\",\"include\":true,\"key\":\"og:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:image:alt\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogImageDescription}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:alt\",\"include\":true,\"key\":\"og:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:see_also\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:see_also\",\"include\":true,\"key\":\"og:see_also\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"facebook-site-verification\":{\"charset\":\"\",\"content\":\"{seomatic.site.facebookSiteVerification}\",\"httpEquiv\":\"\",\"name\":\"facebook-domain-verification\",\"property\":null,\"include\":true,\"key\":\"facebook-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"facebookSiteVerification\"]},\"tagAttrs\":[]}},\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":{\"twitter:card\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterCard}\",\"httpEquiv\":\"\",\"name\":\"twitter:card\",\"property\":null,\"include\":true,\"key\":\"twitter:card\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:site\":{\"charset\":\"\",\"content\":\"@{seomatic.site.twitterHandle}\",\"httpEquiv\":\"\",\"name\":\"twitter:site\",\"property\":null,\"include\":true,\"key\":\"twitter:site\",\"environment\":null,\"dependencies\":{\"site\":[\"twitterHandle\"]},\"tagAttrs\":[]},\"twitter:creator\":{\"charset\":\"\",\"content\":\"@{seomatic.meta.twitterCreator}\",\"httpEquiv\":\"\",\"name\":\"twitter:creator\",\"property\":null,\"include\":true,\"key\":\"twitter:creator\",\"environment\":null,\"dependencies\":{\"meta\":[\"twitterCreator\"]},\"tagAttrs\":[]},\"twitter:title\":{\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.twitterSiteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"charset\":\"\",\"content\":\"{seomatic.meta.twitterTitle}\",\"httpEquiv\":\"\",\"name\":\"twitter:title\",\"property\":null,\"include\":true,\"key\":\"twitter:title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:description\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterDescription}\",\"httpEquiv\":\"\",\"name\":\"twitter:description\",\"property\":null,\"include\":true,\"key\":\"twitter:description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:image\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterImage}\",\"httpEquiv\":\"\",\"name\":\"twitter:image\",\"property\":null,\"include\":true,\"key\":\"twitter:image\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:image:width\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterImageWidth}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:width\",\"property\":null,\"include\":true,\"key\":\"twitter:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]},\"twitter:image:height\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterImageHeight}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:height\",\"property\":null,\"include\":true,\"key\":\"twitter:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]},\"twitter:image:alt\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterImageDescription}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:alt\",\"property\":null,\"include\":true,\"key\":\"twitter:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]}},\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":{\"site\":[\"twitterHandle\"]},\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":{\"google-site-verification\":{\"charset\":\"\",\"content\":\"{seomatic.site.googleSiteVerification}\",\"httpEquiv\":\"\",\"name\":\"google-site-verification\",\"property\":null,\"include\":true,\"key\":\"google-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"googleSiteVerification\"]},\"tagAttrs\":[]},\"bing-site-verification\":{\"charset\":\"\",\"content\":\"{seomatic.site.bingSiteVerification}\",\"httpEquiv\":\"\",\"name\":\"msvalidate.01\",\"property\":null,\"include\":true,\"key\":\"bing-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"bingSiteVerification\"]},\"tagAttrs\":[]},\"pinterest-site-verification\":{\"charset\":\"\",\"content\":\"{seomatic.site.pinterestSiteVerification}\",\"httpEquiv\":\"\",\"name\":\"p:domain_verify\",\"property\":null,\"include\":true,\"key\":\"pinterest-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"pinterestSiteVerification\"]},\"tagAttrs\":[]}},\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":{\"canonical\":{\"crossorigin\":\"\",\"href\":\"{seomatic.meta.canonicalUrl}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"canonical\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"canonical\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"home\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"/\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"home\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"home\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"author\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"/humans.txt\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"author\",\"sizes\":\"\",\"type\":\"text/plain\",\"include\":true,\"key\":\"author\",\"environment\":null,\"dependencies\":{\"frontend_template\":[\"humans\"]},\"tagAttrs\":[]},\"publisher\":{\"crossorigin\":\"\",\"href\":\"{seomatic.site.googlePublisherLink}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"publisher\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"publisher\",\"environment\":null,\"dependencies\":{\"site\":[\"googlePublisherLink\"]},\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":{\"gtag\":{\"name\":\"Google gtag.js\",\"description\":\"The global site tag (gtag.js) is a JavaScript tagging framework and API that allows you to send event data to AdWords, DoubleClick, and Google Analytics. Instead of having to manage multiple tags for different products, you can use gtag.js and more easily benefit from the latest tracking features and integrations as they become available. [Learn More](https://developers.google.com/gtagjs/)\",\"templatePath\":\"_frontend/scripts/gtagHead.twig\",\"templateString\":\"{% set gtagProperty = googleAnalyticsId.value ?? googleAdWordsId.value ?? dcFloodlightId.value ?? null %}\\n{% if gtagProperty %}\\nwindow.dataLayer = window.dataLayer || [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\nfunction gtag(){dataLayer.push(arguments)};\\ngtag(\'js\', new Date());\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if googleAnalyticsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'anonymize_ip\': #{ipAnonymization.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'link_attribution\': #{enhancedLinkAttribution.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'allow_display_features\': #{displayFeatures.value ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAnalyticsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if googleAdWordsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAdWordsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if dcFloodlightId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ dcFloodlightId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/gtagBody.twig\",\"bodyTemplateString\":\"{% set gtagProperty = googleAnalyticsId.value ?? googleAdWordsId.value ?? dcFloodlightId.value ?? null %}\\n{% if gtagProperty %}\\n<script async src=\\\"{{ gtagScriptUrl.value }}?id={{ gtagProperty }}\\\"></script>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleAnalyticsId\":{\"title\":\"Google Analytics Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `UA-XXXXXX-XX`, not the entire script code. [Learn More](https://support.google.com/analytics/answer/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"googleAdWordsId\":{\"title\":\"AdWords Conversion ID\",\"instructions\":\"Only enter the ID, e.g.: `AW-XXXXXXXX`, not the entire script code. [Learn More](https://developers.google.com/adwords-remarketing-tag/)\",\"type\":\"string\",\"value\":\"\"},\"dcFloodlightId\":{\"title\":\"DoubleClick Floodlight ID\",\"instructions\":\"Only enter the ID, e.g.: `DC-XXXXXXXX`, not the entire script code. [Learn More](https://support.google.com/dcm/partner/answer/7568534)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send PageView\",\"instructions\":\"Controls whether the `gtag.js` script automatically sends a PageView to Google Analytics, AdWords, and DoubleClick Floodlight when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"In some cases, you might need to anonymize the IP addresses of hits sent to Google Analytics. [Learn More](https://developers.google.com/analytics/devguides/collection/gtagjs/ip-anonymization)\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Google Analytics Display Features\",\"instructions\":\"The display features plugin for gtag.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https://developers.google.com/analytics/devguides/collection/gtagjs/display-features)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Google Analytics Enhanced Link Attribution\",\"instructions\":\"Enhanced link attribution improves click track reporting by automatically differentiating between multiple link clicks that have the same URL on a given page. [Learn More](https://developers.google.com/analytics/devguides/collection/gtagjs/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"gtagScriptUrl\":{\"title\":\"Google gtag.js Script URL\",\"instructions\":\"The URL to the Google gtag.js tracking script. Normally this should not be changed, unless you locally cache it. The JavaScript `dataLayer` will automatically be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"https://www.googletagmanager.com/gtag/js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"gtag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"googleTagManager\":{\"name\":\"Google Tag Manager\",\"description\":\"Google Tag Manager is a tag management system that allows you to quickly and easily update tags and code snippets on your website. Once the Tag Manager snippet has been added to your website or mobile app, you can configure tags via a web-based user interface without having to alter and deploy additional code. [Learn More](https://support.google.com/tagmanager/answer/6102821?hl=en)\",\"templatePath\":\"_frontend/scripts/googleTagManagerHead.twig\",\"templateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n{{ dataLayerVariableName.value }} = [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\n(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({\'gtm.start\':\\nnew Date().getTime(),event:\'gtm.js\'});var f=d.getElementsByTagName(s)[0],\\nj=d.createElement(s),dl=l!=\'dataLayer\'?\'&l=\'+l:\'\';j.async=true;j.src=\\n\'{{ googleTagManagerUrl.value }}?id=\'+i+dl;f.parentNode.insertBefore(j,f);\\n})(window,document,\'script\',\'{{ dataLayerVariableName.value }}\',\'{{ googleTagManagerId.value }}\');\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/googleTagManagerBody.twig\",\"bodyTemplateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n<noscript><iframe src=\\\"{{ googleTagManagerNoScriptUrl.value }}?id={{ googleTagManagerId.value }}\\\"\\nheight=\\\"0\\\" width=\\\"0\\\" style=\\\"display:none;visibility:hidden\\\"></iframe></noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleTagManagerId\":{\"title\":\"Google Tag Manager ID\",\"instructions\":\"Only enter the ID, e.g.: `GTM-XXXXXX`, not the entire script code. [Learn More](https://developers.google.com/tag-manager/quickstart)\",\"type\":\"string\",\"value\":\"\"},\"dataLayerVariableName\":{\"title\":\"DataLayer Variable Name\",\"instructions\":\"The name to use for the JavaScript DataLayer variable. The value of this variable will be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"dataLayer\"},\"googleTagManagerUrl\":{\"title\":\"Google Tag Manager Script URL\",\"instructions\":\"The URL to the Google Tag Manager script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.googletagmanager.com/gtm.js\"},\"googleTagManagerNoScriptUrl\":{\"title\":\"Google Tag Manager Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Google Tag Manager `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.googletagmanager.com/ns.html\"}},\"dataLayer\":[],\"include\":false,\"key\":\"googleTagManager\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"facebookPixel\":{\"name\":\"Facebook Pixel\",\"description\":\"The Facebook pixel is an analytics tool that helps you measure the effectiveness of your advertising. You can use the Facebook pixel to understand the actions people are taking on your website and reach audiences you care about. [Learn More](https://www.facebook.com/business/help/651294705016616)\",\"templatePath\":\"_frontend/scripts/facebookPixelHead.twig\",\"templateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?\\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;\\nn.push=n;n.loaded=!0;n.version=\'2.0\';n.queue=[];t=b.createElement(e);t.async=!0;\\nt.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,\\ndocument,\'script\',\'{{ facebookPixelUrl.value }}\');\\nfbq(\'init\', \'{{ facebookPixelId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nfbq(\'track\', \'PageView\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/facebookPixelBody.twig\",\"bodyTemplateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none\\\"\\nsrc=\\\"{{ facebookPixelNoScriptUrl.value }}?id={{ facebookPixelId.value }}&ev=PageView&noscript=1\\\" /></noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"facebookPixelId\":{\"title\":\"Facebook Pixel ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https://developers.facebook.com/docs/facebook-pixel/api-reference)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Facebook Pixel PageView\",\"instructions\":\"Controls whether the Facebook Pixel script automatically sends a PageView to Facebook Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"facebookPixelUrl\":{\"title\":\"Facebook Pixel Script URL\",\"instructions\":\"The URL to the Facebook Pixel script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://connect.facebook.net/en_US/fbevents.js\"},\"facebookPixelNoScriptUrl\":{\"title\":\"Facebook Pixel Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Facebook Pixel `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.facebook.com/tr\"}},\"dataLayer\":[],\"include\":false,\"key\":\"facebookPixel\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"linkedInInsight\":{\"name\":\"LinkedIn Insight\",\"description\":\"The LinkedIn Insight Tag is a lightweight JavaScript tag that powers conversion tracking, retargeting, and web analytics for LinkedIn ad campaigns.\",\"templatePath\":\"_frontend/scripts/linkedInInsightHead.twig\",\"templateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n_linkedin_data_partner_id = \\\"{{ dataPartnerId.value }}\\\";\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/linkedInInsightBody.twig\",\"bodyTemplateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n<script type=\\\"text/javascript\\\">\\n(function(){var s = document.getElementsByTagName(\\\"script\\\")[0];\\n    var b = document.createElement(\\\"script\\\");\\n    b.type = \\\"text/javascript\\\";b.async = true;\\n    b.src = \\\"{{ linkedInInsightUrl.value }}\\\";\\n    s.parentNode.insertBefore(b, s);})();\\n</script>\\n<noscript>\\n<img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ linkedInInsightNoScriptUrl.value }}?pid={{ dataPartnerId.value }}&fmt=gif\\\" />\\n</noscript>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"dataPartnerId\":{\"title\":\"LinkedIn Data Partner ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https://www.linkedin.com/help/lms/answer/65513/adding-the-linkedin-insight-tag-to-your-website?lang=en)\",\"type\":\"string\",\"value\":\"\"},\"linkedInInsightUrl\":{\"title\":\"LinkedIn Insight Script URL\",\"instructions\":\"The URL to the LinkedIn Insight script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://snap.licdn.com/li.lms-analytics/insight.min.js\"},\"linkedInInsightNoScriptUrl\":{\"title\":\"LinkedIn Insight &lt;noscript&gt; URL\",\"instructions\":\"The URL to the LinkedIn Insight `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://dc.ads.linkedin.com/collect/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"linkedInInsight\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"hubSpot\":{\"name\":\"HubSpot\",\"description\":\"If you\'re not hosting your entire website on HubSpot, or have pages on your website that are not hosted on HubSpot, you\'ll need to install the HubSpot tracking code on your non-HubSpot pages in order to capture those analytics.\",\"templatePath\":null,\"templateString\":null,\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/hubSpotBody.twig\",\"bodyTemplateString\":\"{% if hubSpotId.value is defined and hubSpotId.value %}\\n<script type=\\\"text/javascript\\\" id=\\\"hs-script-loader\\\" async defer src=\\\"{{ hubSpotUrl.value }}{{ hubSpotId.value }}.js\\\"></script>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"hubSpotId\":{\"title\":\"HubSpot ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https://knowledge.hubspot.com/articles/kcs_article/reports/install-the-hubspot-tracking-code)\",\"type\":\"string\",\"value\":\"\"},\"hubSpotUrl\":{\"title\":\"HubSpot Script URL\",\"instructions\":\"The URL to the HubSpot script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"//js.hs-scripts.com/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"hubSpot\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"pinterestTag\":{\"name\":\"Pinterest Tag\",\"description\":\"The Pinterest tag allows you to track actions people take on your website after viewing your Promoted Pin. You can use this information to measure return on ad spend (RoAS) and create audiences to target on your Promoted Pins. [Learn More](https://help.pinterest.com/en/business/article/track-conversions-with-pinterest-tag)\",\"templatePath\":\"_frontend/scripts/pinterestTagHead.twig\",\"templateString\":\"{% if pinterestTagId.value is defined and pinterestTagId.value %}\\n!function(e){if(!window.pintrk){window.pintrk=function(){window.pintrk.queue.push(\\nArray.prototype.slice.call(arguments))};var\\nn=window.pintrk;n.queue=[],n.version=\\\"3.0\\\";var\\nt=document.createElement(\\\"script\\\");t.async=!0,t.src=e;var\\nr=document.getElementsByTagName(\\\"script\\\")[0];r.parentNode.insertBefore(t,r)}}(\\\"{{ pinterestTagUrl.value }}\\\");\\npintrk(\'load\', \'{{ pinterestTagId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\npintrk(\'page\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/pinterestTagBody.twig\",\"bodyTemplateString\":\"{% if pinterestTagId.value is defined and pinterestTagId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ pinterestTagNoScriptUrl.value }}?tid={{ pinterestTagId.value }}&noscript=1\\\" /></noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"pinterestTagId\":{\"title\":\"Pinterest Tag ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https://developers.pinterest.com/docs/ad-tools/conversion-tag/)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Pinterest Tag PageView\",\"instructions\":\"Controls whether the Pinterest Tag script automatically sends a PageView to when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"pinterestTagUrl\":{\"title\":\"Pinterest Tag Script URL\",\"instructions\":\"The URL to the Pinterest Tag script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://s.pinimg.com/ct/core.js\"},\"pinterestTagNoScriptUrl\":{\"title\":\"Pinterest Tag Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Pinterest Tag `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://ct.pinterest.com/v3/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"pinterestTag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"fathom\":{\"name\":\"Fathom\",\"description\":\"Fathom is a simple, light-weight, privacy-first alternative to Google Analytics. So, stop scrolling through pages of reports and collecting gobs of personal data about your visitors, both of which you probably don’t need. [Learn More](https://usefathom.com/)\",\"templatePath\":\"_frontend/scripts/fathomAnalytics.twig\",\"templateString\":\"{% if siteId.value is defined and siteId.value %}\\n(function() {\\nvar tag = document.createElement(\'script\');\\ntag.src = \\\"{{ scriptUrl.value }}\\\";\\ntag.defer = true;\\ntag.setAttribute(\\\"data-site\\\", \\\"{{ siteId.value | raw }}\\\");\\n{% if honorDnt.value %}\\ntag.setAttribute(\\\"data-honor-dnt\\\", \\\"true\\\");\\n{% endif %}\\n{% if disableAutoTracking.value %}\\ntag.setAttribute(\\\"data-auto\\\", \\\"false\\\");\\n{% endif %}\\n{% if ignoreCanonicals.value %}\\ntag.setAttribute(\\\"data-canonical\\\", \\\"false\\\");\\n{% endif %}\\n{% if excludedDomains.value | length %}\\ntag.setAttribute(\\\"data-excluded-domains\\\", \\\"{{ excludedDomains.value | raw }}\\\");\\n{% endif %}\\n{% if includedDomains.value | length %}\\ntag.setAttribute(\\\"data-included-domains\\\", \\\"{{ includedDomains.value | raw }}\\\");\\n{% endif %}\\nvar firstScriptTag = document.getElementsByTagName(\'script\')[0];\\nfirstScriptTag.parentNode.insertBefore(tag, firstScriptTag);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteId\":{\"title\":\"Site ID\",\"instructions\":\"Only enter the Site ID, not the entire script code. [Learn More](https://usefathom.com/support/tracking)\",\"type\":\"string\",\"value\":\"\"},\"honorDnt\":{\"title\":\"Honoring Do Not Track (DNT)\",\"instructions\":\"By default we track every visitor to your website, regardless of them having DNT turned on or not. [Learn More](https://usefathom.com/support/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"disableAutoTracking\":{\"title\":\"Disable automatic tracking\",\"instructions\":\"By default, we track a page view every time a visitor to your website loads a page with our script on it. [Learn More](https://usefathom.com/support/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"ignoreCanonicals\":{\"title\":\"Ignore canonicals\",\"instructions\":\"If there’s a canonical URL in place, then by default we use it instead of the current URL. [Learn More](https://usefathom.com/support/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"excludedDomains\":{\"title\":\"Excluded Domains\",\"instructions\":\"You exclude one or several domains, so our tracker will track things on every domain, except the ones excluded. [Learn More](https://usefathom.com/support/tracking-advanced)\",\"type\":\"string\",\"value\":\"\"},\"includedDomains\":{\"title\":\"Included Domains\",\"instructions\":\"If you want to go in the opposite direction and only track stats on a specific domain. [Learn More](https://usefathom.com/support/tracking-advanced)\",\"type\":\"string\",\"value\":\"\"},\"scriptUrl\":{\"title\":\"Fathom Script URL\",\"instructions\":\"The URL to the Fathom tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://cdn.usefathom.com/script.js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"fathom\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"matomo\":{\"name\":\"Matomo\",\"description\":\"Matomo is a Google Analytics alternative that protects your data and your customers\' privacy [Learn More](https://matomo.org/)\",\"templatePath\":\"_frontend/scripts/matomoAnalytics.twig\",\"templateString\":\"{% if siteId.value is defined and siteId.value and scriptUrl.value is defined and scriptUrl.value | length %}\\nvar _paq = window._paq = window._paq || [];\\n{% if sendPageView.value %}\\n_paq.push([\'trackPageView\']);\\n{% endif %}\\n{% if sendPageView.value %}\\n_paq.push([\'enableLinkTracking\']);\\n{% endif %}\\n(function() {\\nvar u=\\\"{{ scriptUrl.value }}\\\";\\n_paq.push([\'setTrackerUrl\', u+\'matomo.php\']);\\n_paq.push([\'setSiteId\', {{ siteId.value }}]);\\nvar d=document, g=d.createElement(\'script\'), s=d.getElementsByTagName(\'script\')[0];\\ng.type=\'text/javascript\'; g.async=true; g.src=u+\'matomo.js\'; s.parentNode.insertBefore(g,s);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteId\":{\"title\":\"Site ID\",\"instructions\":\"Only enter the Site ID, not the entire script code. [Learn More](https://developer.matomo.org/guides/tracking-javascript-guide)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Matomo PageView\",\"instructions\":\"Controls whether the Matomo script automatically sends a PageView when your pages are loaded. [Learn More](https://developer.matomo.org/api-reference/tracking-javascript)\",\"type\":\"bool\",\"value\":true},\"enableLinkTracking\":{\"title\":\"Enable Link Tracking\",\"instructions\":\"Install link tracking on all applicable link elements. [Learn More](https://developer.matomo.org/api-reference/tracking-javascript)\",\"type\":\"bool\",\"value\":true},\"scriptUrl\":{\"title\":\"Matomo Script URL\",\"instructions\":\"The URL to the Matomo tracking script. This will vary depending on whether you are using Matomo Cloud or Matomo On-Premise. [Learn More](https://developer.matomo.org/guides/tracking-javascript-guide)\",\"type\":\"string\",\"value\":\"\"}},\"dataLayer\":[],\"include\":false,\"key\":\"matomo\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"plausible\":{\"name\":\"Plausible\",\"description\":\"Plausible is a lightweight and open-source website analytics tool. No cookies and fully compliant with GDPR, CCPA and PECR. [Learn More](https://plausible.io/)\",\"templatePath\":\"_frontend/scripts/plausibleAnalytics.twig\",\"templateString\":\"{% if siteDomain.value is defined and siteDomain.value %}\\n(function() {\\nvar tag = document.createElement(\'script\');\\ntag.src = \\\"{{ scriptUrl.value }}\\\";\\ntag.defer = true;\\ntag.setAttribute(\\\"data-domain\\\", \\\"{{ siteDomain.value | raw }}\\\");\\nvar firstScriptTag = document.getElementsByTagName(\'script\')[0];\\nfirstScriptTag.parentNode.insertBefore(tag, firstScriptTag);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteDomain\":{\"title\":\"Site Domain\",\"instructions\":\"Only enter the site domain, not the entire script code. [Learn More](https://plausible.io/docs/plausible-script)\",\"type\":\"string\",\"value\":\"\"},\"scriptUrl\":{\"title\":\"Plausible Script URL\",\"instructions\":\"The URL to the Plausible tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://plausible.io/js/plausible.js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"plausible\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"googleAnalytics\":{\"name\":\"Google Analytics\",\"description\":\"Google Analytics gives you the digital analytics tools you need to analyze data from all touchpoints in one place, for a deeper understanding of the customer experience. You can then share the insights that matter with your whole organization. [Learn More](https://www.google.com/analytics/analytics/)\",\"templatePath\":\"_frontend/scripts/googleAnalytics.twig\",\"templateString\":\"{% if trackingId.value is defined and trackingId.value %}\\n(function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){\\n(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\\nm=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\\n})(window,document,\'script\',\'{{ analyticsUrl.value }}\',\'ga\');\\nga(\'create\', \'{{ trackingId.value |raw }}\', \'auto\'{% if linker.value %}, {allowLinker: true}{% endif %});\\n{% if ipAnonymization.value %}\\nga(\'set\', \'anonymizeIp\', true);\\n{% endif %}\\n{% if displayFeatures.value %}\\nga(\'require\', \'displayfeatures\');\\n{% endif %}\\n{% if ecommerce.value %}\\nga(\'require\', \'ecommerce\');\\n{% endif %}\\n{% if enhancedEcommerce.value %}\\nga(\'require\', \'ec\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linkid\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linker\');\\n{% endif %}\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nga(\'send\', \'pageview\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"trackingId\":{\"title\":\"Google Analytics Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `UA-XXXXXX-XX`, not the entire script code. [Learn More](https://support.google.com/analytics/answer/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Google Analytics PageView\",\"instructions\":\"Controls whether the Google Analytics script automatically sends a PageView to Google Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"When a customer of Analytics requests IP address anonymization, Analytics anonymizes the address as soon as technically feasible at the earliest possible stage of the collection network.\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Display Features\",\"instructions\":\"The display features plugin for analytics.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/display-features)\",\"type\":\"bool\",\"value\":false},\"ecommerce\":{\"title\":\"Ecommerce\",\"instructions\":\"Ecommerce tracking allows you to measure the number of transactions and revenue that your website generates. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedEcommerce\":{\"title\":\"Enhanced Ecommerce\",\"instructions\":\"The enhanced ecommerce plug-in for analytics.js enables the measurement of user interactions with products on ecommerce websites across the user\'s shopping experience, including: product impressions, product clicks, viewing product details, adding a product to a shopping cart, initiating the checkout process, transactions, and refunds. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/enhanced-ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Enhanced Link Attribution\",\"instructions\":\"Enhanced Link Attribution improves the accuracy of your In-Page Analytics report by automatically differentiating between multiple links to the same URL on a single page by using link element IDs. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"linker\":{\"title\":\"Linker\",\"instructions\":\"The linker plugin simplifies the process of implementing cross-domain tracking as described in the Cross-domain Tracking guide for analytics.js. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/linker)\",\"type\":\"bool\",\"value\":false},\"analyticsUrl\":{\"title\":\"Google Analytics Script URL\",\"instructions\":\"The URL to the Google Analytics tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.google-analytics.com/analytics.js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"googleAnalytics\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"issn\":null,\"about\":null,\"abstract\":null,\"accessMode\":null,\"accessModeSufficient\":null,\"accessibilityAPI\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"accessibilityHazard\":null,\"accessibilitySummary\":null,\"accountablePerson\":null,\"acquireLicensePage\":null,\"aggregateRating\":null,\"alternativeHeadline\":null,\"associatedMedia\":null,\"audience\":null,\"audio\":null,\"author\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"award\":null,\"character\":null,\"citation\":null,\"comment\":null,\"commentCount\":null,\"conditionsOfAccess\":null,\"contentLocation\":null,\"contentRating\":null,\"contentReferenceTime\":null,\"contributor\":null,\"copyrightHolder\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"copyrightYear\":null,\"correction\":null,\"creativeWorkStatus\":null,\"creator\":{\"id\":\"{parseEnv(seomatic.site.creator.genericUrl)}#creator\"},\"dateCreated\":null,\"dateModified\":null,\"datePublished\":null,\"discussionUrl\":null,\"editor\":null,\"educationalAlignment\":null,\"educationalUse\":null,\"encoding\":null,\"encodingFormat\":null,\"exampleOfWork\":null,\"expires\":null,\"funder\":null,\"genre\":null,\"hasPart\":null,\"headline\":null,\"inLanguage\":\"{seomatic.meta.language}\",\"interactionStatistic\":null,\"interactivityType\":null,\"isAccessibleForFree\":null,\"isBasedOn\":null,\"isFamilyFriendly\":null,\"isPartOf\":null,\"keywords\":null,\"learningResourceType\":null,\"license\":null,\"locationCreated\":null,\"mainEntity\":null,\"maintainer\":null,\"material\":null,\"materialExtent\":null,\"mentions\":null,\"offers\":null,\"position\":null,\"producer\":null,\"provider\":null,\"publication\":null,\"publisher\":null,\"publisherImprint\":null,\"publishingPrinciples\":null,\"recordedAt\":null,\"releasedEvent\":null,\"review\":null,\"schemaVersion\":null,\"sdDatePublished\":null,\"sdLicense\":null,\"sdPublisher\":null,\"sourceOrganization\":null,\"spatial\":null,\"spatialCoverage\":null,\"sponsor\":null,\"temporal\":null,\"temporalCoverage\":null,\"text\":null,\"thumbnailUrl\":null,\"timeRequired\":null,\"translationOfWork\":null,\"translator\":null,\"typicalAgeRange\":null,\"usageInfo\":null,\"version\":null,\"video\":null,\"workExample\":null,\"workTranslation\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":{\"type\":\"EntryPoint\",\"urlTemplate\":\"{seomatic.site.siteLinksSearchTarget}\"},\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"identity\":{\"actionableFeedbackPolicy\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{seomatic.site.identity.genericStreetAddress}\",\"addressLocality\":\"{seomatic.site.identity.genericAddressLocality}\",\"addressRegion\":\"{seomatic.site.identity.genericAddressRegion}\",\"postalCode\":\"{seomatic.site.identity.genericPostalCode}\",\"addressCountry\":\"{seomatic.site.identity.genericAddressCountry}\"},\"aggregateRating\":null,\"alumni\":null,\"areaServed\":null,\"award\":null,\"brand\":null,\"contactPoint\":null,\"correctionsPolicy\":null,\"department\":null,\"dissolutionDate\":null,\"diversityPolicy\":null,\"diversityStaffingReport\":null,\"duns\":\"{seomatic.site.identity.organizationDuns}\",\"email\":\"{seomatic.site.identity.genericEmail}\",\"employee\":null,\"ethicsPolicy\":null,\"event\":null,\"faxNumber\":null,\"founder\":\"{seomatic.site.identity.organizationFounder}\",\"foundingDate\":\"{seomatic.site.identity.organizationFoundingDate}\",\"foundingLocation\":\"{seomatic.site.identity.organizationFoundingLocation}\",\"funder\":null,\"globalLocationNumber\":null,\"hasCredential\":null,\"hasMerchantReturnPolicy\":null,\"hasOfferCatalog\":null,\"hasPOS\":null,\"interactionStatistic\":null,\"isicV4\":null,\"knowsAbout\":null,\"knowsLanguage\":null,\"legalName\":null,\"leiCode\":null,\"location\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.helper.socialTransform(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\")}\",\"width\":\"{seomatic.helper.socialTransformWidth(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\")}\",\"height\":\"{seomatic.helper.socialTransformHeight(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\")}\"},\"makesOffer\":null,\"member\":null,\"memberOf\":null,\"naics\":null,\"numberOfEmployees\":null,\"ownershipFundingInfo\":null,\"owns\":null,\"parentOrganization\":null,\"publishingPrinciples\":null,\"review\":null,\"seeks\":null,\"slogan\":null,\"sponsor\":null,\"subOrganization\":null,\"taxID\":null,\"telephone\":\"{seomatic.site.identity.genericTelephone}\",\"unnamedSourcesPolicy\":null,\"vatID\":null,\"additionalType\":null,\"alternateName\":\"{seomatic.site.identity.genericAlternateName}\",\"description\":\"{seomatic.site.identity.genericDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.site.identity.genericImage}\",\"width\":\"{seomatic.site.identity.genericImageWidth}\",\"height\":\"{seomatic.site.identity.genericImageHeight}\"},\"mainEntityOfPage\":null,\"name\":\"{seomatic.site.identity.genericName}\",\"potentialAction\":null,\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.site.identity.genericUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.site.identity.computedType}\",\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\",\"graph\":null,\"include\":true,\"key\":\"identity\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"creator\":{\"actionableFeedbackPolicy\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{seomatic.site.creator.genericStreetAddress}\",\"addressLocality\":\"{seomatic.site.creator.genericAddressLocality}\",\"addressRegion\":\"{seomatic.site.creator.genericAddressRegion}\",\"postalCode\":\"{seomatic.site.creator.genericPostalCode}\",\"addressCountry\":\"{seomatic.site.creator.genericAddressCountry}\"},\"aggregateRating\":null,\"alumni\":null,\"areaServed\":null,\"award\":null,\"brand\":null,\"contactPoint\":null,\"correctionsPolicy\":null,\"department\":null,\"dissolutionDate\":null,\"diversityPolicy\":null,\"diversityStaffingReport\":null,\"duns\":\"{seomatic.site.creator.organizationDuns}\",\"email\":\"{seomatic.site.creator.genericEmail}\",\"employee\":null,\"ethicsPolicy\":null,\"event\":null,\"faxNumber\":null,\"founder\":\"{seomatic.site.creator.organizationFounder}\",\"foundingDate\":\"{seomatic.site.creator.organizationFoundingDate}\",\"foundingLocation\":\"{seomatic.site.creator.organizationFoundingLocation}\",\"funder\":null,\"globalLocationNumber\":null,\"hasCredential\":null,\"hasMerchantReturnPolicy\":null,\"hasOfferCatalog\":null,\"hasPOS\":null,\"interactionStatistic\":null,\"isicV4\":null,\"knowsAbout\":null,\"knowsLanguage\":null,\"legalName\":null,\"leiCode\":null,\"location\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.helper.socialTransform(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\")}\",\"width\":\"{seomatic.helper.socialTransformWidth(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\")}\",\"height\":\"{seomatic.helper.socialTransformHeight(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\")}\"},\"makesOffer\":null,\"member\":null,\"memberOf\":null,\"naics\":null,\"numberOfEmployees\":null,\"ownershipFundingInfo\":null,\"owns\":null,\"parentOrganization\":null,\"publishingPrinciples\":null,\"review\":null,\"seeks\":null,\"slogan\":null,\"sponsor\":null,\"subOrganization\":null,\"taxID\":null,\"telephone\":\"{seomatic.site.creator.genericTelephone}\",\"unnamedSourcesPolicy\":null,\"vatID\":null,\"additionalType\":null,\"alternateName\":\"{seomatic.site.creator.genericAlternateName}\",\"description\":\"{seomatic.site.creator.genericDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.site.creator.genericImage}\",\"width\":\"{seomatic.site.creator.genericImageWidth}\",\"height\":\"{seomatic.site.creator.genericImageHeight}\"},\"mainEntityOfPage\":null,\"name\":\"{seomatic.site.creator.genericName}\",\"potentialAction\":null,\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.site.creator.genericUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.site.creator.computedType}\",\"id\":\"{parseEnv(seomatic.site.creator.genericUrl)}#creator\",\"graph\":null,\"include\":true,\"key\":\"creator\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":{\"humans\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"/* TEAM */\\n\\nCreator: {{ seomatic.site.creator.genericName ?? \\\"n/a\\\" }}\\nURL: {{ seomatic.site.creator.genericUrl ?? \\\"n/a\\\" }}\\nDescription: {{ seomatic.site.creator.genericDescription ?? \\\"n/a\\\" }}\\n\\n/* THANKS */\\n\\nCraft CMS - https://craftcms.com\\nPixel & Tonic - https://pixelandtonic.com\\n\\n/* SITE */\\n\\nStandards: HTML5, CSS3\\nComponents: Craft CMS 3, Yii2, PHP, JavaScript, SEOmatic\\n\",\"siteId\":null,\"include\":true,\"handle\":\"humans\",\"path\":\"humans.txt\",\"template\":\"_frontend/pages/humans.twig\",\"controller\":\"frontend-template\",\"action\":\"humans\"},\"robots\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# robots.txt for {{ siteUrl }}\\n\\nSitemap: {{ seomatic.helper.sitemapIndexForSiteId() }}\\n{% switch seomatic.config.environment %}\\n\\n{% case \\\"live\\\" %}\\n\\n# live - don\'t allow web crawlers to index cpresources/ or vendor/\\n\\nUser-agent: *\\nDisallow: /cpresources/\\nDisallow: /vendor/\\nDisallow: /.env\\nDisallow: /cache/\\n\\n{% case \\\"staging\\\" %}\\n\\n# staging - disallow all\\n\\nUser-agent: *\\nDisallow: /\\n\\n{% case \\\"local\\\" %}\\n\\n# local - disallow all\\n\\nUser-agent: *\\nDisallow: /\\n\\n{% default %}\\n\\n# default - don\'t allow web crawlers to index cpresources/ or vendor/\\n\\nUser-agent: *\\nDisallow: /cpresources/\\nDisallow: /vendor/\\nDisallow: /.env\\nDisallow: /cache/\\n\\n{% endswitch %}\\n\",\"siteId\":null,\"include\":true,\"handle\":\"robots\",\"path\":\"robots.txt\",\"template\":\"_frontend/pages/robots.twig\",\"controller\":\"frontend-template\",\"action\":\"robots\"},\"ads\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# ads.txt file for {{ siteUrl }}\\n# More info: https://support.google.com/admanager/answer/7441288?hl=en\\n{{ siteUrl }},123,DIRECT\\n\",\"siteId\":null,\"include\":true,\"handle\":\"ads\",\"path\":\"ads.txt\",\"template\":\"_frontend/pages/ads.twig\",\"controller\":\"frontend-template\",\"action\":\"ads\"},\"security\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# security.txt file for {{ siteUrl }} - more info: https://securitytxt.org/\\n# (required) Contact email address for security issues\\nContact: {% set adminUser = craft.app.getUsers().userById(1) %}{{ adminUser.email ?? \'user@example.com\' }}\\n\\n# (required) Expiration date for the security information herein\\nExpiration: {{ date(\'1year\')|atom }}\\n\\n# (optional) OpenPGP key:\\nEncryption: {{ siteUrl }}pgp-key.txt\\n\\n# (optional) Security policy page:\\nPolicy: {{ siteUrl }}security-policy\\n\\n# (optional) Security acknowledgements page:\\nAcknowledgements: {{ siteUrl }}hall-of-fame\\n\",\"siteId\":null,\"include\":true,\"handle\":\"security\",\"path\":\"security.txt\",\"template\":\"_frontend/pages/security.twig\",\"controller\":\"frontend-template\",\"action\":\"security\"}},\"name\":\"Frontend Templates\",\"description\":\"Templates that are rendered on the frontend\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":\"SeomaticEditableTemplate\",\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(2,'2020-03-27 13:38:49','2021-03-15 15:40:42','5e1950fb-88fb-41ee-8b5f-051ba6490e0c','1.0.29','section',5,'Homepage','homepage','single',NULL,'index',1,'{\"1\":{\"id\":2,\"sectionId\":5,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"__home__\",\"template\":\"index\",\"language\":\"en-us\"}}','2021-03-15 15:40:42','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{entry.title}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{entry.url}\",\"robots\":\"\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\"}','{\"siteName\":\"Friends of Webster Trails\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"breadcrumb\":null,\"lastReviewed\":null,\"mainContentOfPage\":null,\"primaryImageOfPage\":null,\"relatedLink\":null,\"reviewedBy\":null,\"significantLink\":null,\"speakable\":null,\"specialty\":null,\"about\":null,\"abstract\":null,\"accessMode\":null,\"accessModeSufficient\":null,\"accessibilityAPI\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"accessibilityHazard\":null,\"accessibilitySummary\":null,\"accountablePerson\":null,\"acquireLicensePage\":null,\"aggregateRating\":null,\"alternativeHeadline\":null,\"associatedMedia\":null,\"audience\":null,\"audio\":null,\"author\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"award\":null,\"character\":null,\"citation\":null,\"comment\":null,\"commentCount\":null,\"conditionsOfAccess\":null,\"contentLocation\":null,\"contentRating\":null,\"contentReferenceTime\":null,\"contributor\":null,\"copyrightHolder\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"copyrightYear\":\"{entry.postDate | date(\\\"Y\\\")}\",\"correction\":null,\"creativeWorkStatus\":null,\"creator\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"dateCreated\":false,\"dateModified\":\"{entry.dateUpdated |atom}\",\"datePublished\":\"{entry.postDate |atom}\",\"discussionUrl\":null,\"editor\":null,\"educationalAlignment\":null,\"educationalUse\":null,\"encoding\":null,\"encodingFormat\":null,\"exampleOfWork\":null,\"expires\":null,\"funder\":null,\"genre\":null,\"hasPart\":null,\"headline\":\"{seomatic.meta.seoTitle}\",\"inLanguage\":\"{seomatic.meta.language}\",\"interactionStatistic\":null,\"interactivityType\":null,\"isAccessibleForFree\":null,\"isBasedOn\":null,\"isFamilyFriendly\":null,\"isPartOf\":null,\"keywords\":null,\"learningResourceType\":null,\"license\":null,\"locationCreated\":null,\"mainEntity\":null,\"maintainer\":null,\"material\":null,\"materialExtent\":null,\"mentions\":null,\"offers\":null,\"position\":null,\"producer\":null,\"provider\":null,\"publication\":null,\"publisher\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"publisherImprint\":null,\"publishingPrinciples\":null,\"recordedAt\":null,\"releasedEvent\":null,\"review\":null,\"schemaVersion\":null,\"sdDatePublished\":null,\"sdLicense\":null,\"sdPublisher\":null,\"sourceOrganization\":null,\"spatial\":null,\"spatialCoverage\":null,\"sponsor\":null,\"temporal\":null,\"temporalCoverage\":null,\"text\":null,\"thumbnailUrl\":null,\"timeRequired\":null,\"translationOfWork\":null,\"translator\":null,\"typicalAgeRange\":null,\"usageInfo\":null,\"version\":null,\"video\":null,\"workExample\":null,\"workTranslation\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{seomatic.site.siteLinksSearchTarget}\",\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebPage\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromField\",\"seoTitleField\":\"title\",\"siteNamePositionSource\":\"sameAsGlobal\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"sameAsGlobal\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"sameAsGlobal\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(3,'2021-03-15 15:04:42','2021-03-15 15:40:42','3bebe8ad-f57a-4cc3-8849-3701daca07a1','1.0.29','section',5,'Homepage','homepage','single',NULL,'',2,'{\"1\":{\"id\":2,\"sectionId\":5,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"__home__\",\"template\":\"index\",\"language\":\"en-us\"},\"2\":{\"id\":3,\"sectionId\":5,\"siteId\":2,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"__home__\",\"template\":null,\"language\":\"es\"}}','2021-03-15 15:40:42','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{entry.title}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{entry.url}\",\"robots\":\"\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\"}','{\"siteName\":\"Project\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"breadcrumb\":null,\"lastReviewed\":null,\"mainContentOfPage\":null,\"primaryImageOfPage\":null,\"relatedLink\":null,\"reviewedBy\":null,\"significantLink\":null,\"speakable\":null,\"specialty\":null,\"about\":null,\"abstract\":null,\"accessMode\":null,\"accessModeSufficient\":null,\"accessibilityAPI\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"accessibilityHazard\":null,\"accessibilitySummary\":null,\"accountablePerson\":null,\"acquireLicensePage\":null,\"aggregateRating\":null,\"alternativeHeadline\":null,\"associatedMedia\":null,\"audience\":null,\"audio\":null,\"author\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"award\":null,\"character\":null,\"citation\":null,\"comment\":null,\"commentCount\":null,\"conditionsOfAccess\":null,\"contentLocation\":null,\"contentRating\":null,\"contentReferenceTime\":null,\"contributor\":null,\"copyrightHolder\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"copyrightYear\":\"{entry.postDate | date(\\\"Y\\\")}\",\"correction\":null,\"creativeWorkStatus\":null,\"creator\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"dateCreated\":false,\"dateModified\":\"{entry.dateUpdated |atom}\",\"datePublished\":\"{entry.postDate |atom}\",\"discussionUrl\":null,\"editor\":null,\"educationalAlignment\":null,\"educationalUse\":null,\"encoding\":null,\"encodingFormat\":null,\"exampleOfWork\":null,\"expires\":null,\"funder\":null,\"genre\":null,\"hasPart\":null,\"headline\":\"{seomatic.meta.seoTitle}\",\"inLanguage\":\"{seomatic.meta.language}\",\"interactionStatistic\":null,\"interactivityType\":null,\"isAccessibleForFree\":null,\"isBasedOn\":null,\"isFamilyFriendly\":null,\"isPartOf\":null,\"keywords\":null,\"learningResourceType\":null,\"license\":null,\"locationCreated\":null,\"mainEntity\":null,\"maintainer\":null,\"material\":null,\"materialExtent\":null,\"mentions\":null,\"offers\":null,\"position\":null,\"producer\":null,\"provider\":null,\"publication\":null,\"publisher\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"publisherImprint\":null,\"publishingPrinciples\":null,\"recordedAt\":null,\"releasedEvent\":null,\"review\":null,\"schemaVersion\":null,\"sdDatePublished\":null,\"sdLicense\":null,\"sdPublisher\":null,\"sourceOrganization\":null,\"spatial\":null,\"spatialCoverage\":null,\"sponsor\":null,\"temporal\":null,\"temporalCoverage\":null,\"text\":null,\"thumbnailUrl\":null,\"timeRequired\":null,\"translationOfWork\":null,\"translator\":null,\"typicalAgeRange\":null,\"usageInfo\":null,\"version\":null,\"video\":null,\"workExample\":null,\"workTranslation\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{seomatic.site.siteLinksSearchTarget}\",\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebPage\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromField\",\"seoTitleField\":\"title\",\"siteNamePositionSource\":\"sameAsGlobal\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"sameAsGlobal\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"sameAsGlobal\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(4,'2021-03-15 15:24:20','2021-03-15 15:24:20','ab4e123a-e7d5-4716-a325-7bfa6f7c553d','1.0.33','product',1,'Clothing','clothing','product',NULL,'shop/products/_product',2,'{\"1\":{\"id\":\"1\",\"productTypeId\":\"1\",\"siteId\":\"1\",\"hasUrls\":\"1\",\"uriFormat\":\"shop/products/{slug}\",\"template\":\"shop/products/_product\",\"uriFormatIsRequired\":true,\"language\":\"en-us\"},\"2\":{\"id\":\"2\",\"productTypeId\":\"1\",\"siteId\":\"2\",\"hasUrls\":\"1\",\"uriFormat\":\"shop/products/{slug}\",\"template\":\"shop/products/_product\",\"uriFormatIsRequired\":true,\"language\":\"es\"}}','2021-03-15 15:24:16','{\"language\":null,\"mainEntityOfPage\":\"Product\",\"seoTitle\":\"{product.title}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{product.url}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\"}','{\"siteName\":\"Project\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"additionalProperty\":null,\"aggregateRating\":null,\"audience\":null,\"award\":null,\"brand\":null,\"category\":null,\"color\":null,\"depth\":null,\"gtin\":null,\"gtin12\":null,\"gtin13\":null,\"gtin14\":null,\"gtin8\":null,\"hasMerchantReturnPolicy\":null,\"height\":null,\"isAccessoryOrSparePartFor\":null,\"isConsumableFor\":null,\"isRelatedTo\":null,\"isSimilarTo\":null,\"itemCondition\":null,\"logo\":null,\"manufacturer\":null,\"material\":null,\"model\":null,\"mpn\":null,\"nsn\":null,\"offers\":{\"type\":\"Offer\",\"url\":\"{seomatic.meta.canonicalUrl}\",\"price\":\"{product.getDefaultVariant().getPrice()|number_format(2, \\\".\\\", \\\"\\\")}\",\"priceCurrency\":\"{{craft.commerce.paymentCurrencies.primaryPaymentCurrencyIso()}}\",\"offeredBy\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"seller\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"availability\":\"http://schema.org/{% if object.product.hasUnlimitedStock or object.product.totalStock > 0 %}InStock{% else %}OutOfStock{% endif %}\"},\"productID\":null,\"productionDate\":null,\"purchaseDate\":null,\"releaseDate\":null,\"review\":null,\"sku\":\"{product.getDefaultVariant().getSku()}\",\"slogan\":null,\"weight\":null,\"width\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{seomatic.site.siteLinksSearchTarget}\",\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"Product\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromField\",\"seoTitleField\":\"title\",\"siteNamePositionSource\":\"sameAsGlobal\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"sameAsGlobal\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"sameAsGlobal\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(5,'2021-03-15 15:24:20','2021-03-15 15:24:20','2ffcb07b-9e3f-4a82-8ba8-b5e909291818','1.0.33','product',1,'Clothing','clothing','product',NULL,'shop/products/_product',1,'{\"1\":{\"id\":\"1\",\"productTypeId\":\"1\",\"siteId\":\"1\",\"hasUrls\":\"1\",\"uriFormat\":\"shop/products/{slug}\",\"template\":\"shop/products/_product\",\"uriFormatIsRequired\":true,\"language\":\"en-us\"},\"2\":{\"id\":\"2\",\"productTypeId\":\"1\",\"siteId\":\"2\",\"hasUrls\":\"1\",\"uriFormat\":\"shop/products/{slug}\",\"template\":\"shop/products/_product\",\"uriFormatIsRequired\":true,\"language\":\"es\"}}','2021-03-15 15:24:16','{\"language\":null,\"mainEntityOfPage\":\"Product\",\"seoTitle\":\"{product.title}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{product.url}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\"}','{\"siteName\":\"Project\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"additionalProperty\":null,\"aggregateRating\":null,\"audience\":null,\"award\":null,\"brand\":null,\"category\":null,\"color\":null,\"depth\":null,\"gtin\":null,\"gtin12\":null,\"gtin13\":null,\"gtin14\":null,\"gtin8\":null,\"hasMerchantReturnPolicy\":null,\"height\":null,\"isAccessoryOrSparePartFor\":null,\"isConsumableFor\":null,\"isRelatedTo\":null,\"isSimilarTo\":null,\"itemCondition\":null,\"logo\":null,\"manufacturer\":null,\"material\":null,\"model\":null,\"mpn\":null,\"nsn\":null,\"offers\":{\"type\":\"Offer\",\"url\":\"{seomatic.meta.canonicalUrl}\",\"price\":\"{product.getDefaultVariant().getPrice()|number_format(2, \\\".\\\", \\\"\\\")}\",\"priceCurrency\":\"{{craft.commerce.paymentCurrencies.primaryPaymentCurrencyIso()}}\",\"offeredBy\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"seller\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"availability\":\"http://schema.org/{% if object.product.hasUnlimitedStock or object.product.totalStock > 0 %}InStock{% else %}OutOfStock{% endif %}\"},\"productID\":null,\"productionDate\":null,\"purchaseDate\":null,\"releaseDate\":null,\"review\":null,\"sku\":\"{product.getDefaultVariant().getSku()}\",\"slogan\":null,\"weight\":null,\"width\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{seomatic.site.siteLinksSearchTarget}\",\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"Product\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromField\",\"seoTitleField\":\"title\",\"siteNamePositionSource\":\"sameAsGlobal\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"sameAsGlobal\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"sameAsGlobal\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(6,'2021-03-15 15:39:25','2022-01-18 15:42:55','55e209e4-06d9-4b7d-9d4f-b8c5464ca10a','1.0.29','section',6,'Blog','blog','channel',NULL,'blog/_entry',1,'{\"1\":{\"id\":4,\"sectionId\":6,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"blog/{slug}\",\"template\":\"blog/_entry\",\"language\":\"en-us\"},\"2\":{\"id\":5,\"sectionId\":6,\"siteId\":2,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"blog/{slug}\",\"template\":\"blog/_entry\",\"language\":\"es\"}}','2022-01-18 15:42:55','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{entry.title}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{entry.url}\",\"robots\":\"\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"Project\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"breadcrumb\":null,\"lastReviewed\":null,\"mainContentOfPage\":null,\"primaryImageOfPage\":null,\"relatedLink\":null,\"reviewedBy\":null,\"significantLink\":null,\"speakable\":null,\"specialty\":null,\"about\":null,\"abstract\":null,\"accessMode\":null,\"accessModeSufficient\":null,\"accessibilityAPI\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"accessibilityHazard\":null,\"accessibilitySummary\":null,\"accountablePerson\":null,\"acquireLicensePage\":null,\"aggregateRating\":null,\"alternativeHeadline\":null,\"associatedMedia\":null,\"audience\":null,\"audio\":null,\"author\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"award\":null,\"character\":null,\"citation\":null,\"comment\":null,\"commentCount\":null,\"conditionsOfAccess\":null,\"contentLocation\":null,\"contentRating\":null,\"contentReferenceTime\":null,\"contributor\":null,\"copyrightHolder\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"copyrightYear\":\"{entry.postDate | date(\\\"Y\\\")}\",\"correction\":null,\"creativeWorkStatus\":null,\"creator\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"dateCreated\":false,\"dateModified\":\"{entry.dateUpdated |atom}\",\"datePublished\":\"{entry.postDate |atom}\",\"discussionUrl\":null,\"editor\":null,\"educationalAlignment\":null,\"educationalUse\":null,\"encoding\":null,\"encodingFormat\":null,\"exampleOfWork\":null,\"expires\":null,\"funder\":null,\"genre\":null,\"hasPart\":null,\"headline\":\"{seomatic.meta.seoTitle}\",\"inLanguage\":\"{seomatic.meta.language}\",\"interactionStatistic\":null,\"interactivityType\":null,\"isAccessibleForFree\":null,\"isBasedOn\":null,\"isFamilyFriendly\":null,\"isPartOf\":null,\"keywords\":null,\"learningResourceType\":null,\"license\":null,\"locationCreated\":null,\"mainEntity\":null,\"maintainer\":null,\"material\":null,\"materialExtent\":null,\"mentions\":null,\"offers\":null,\"position\":null,\"producer\":null,\"provider\":null,\"publication\":null,\"publisher\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"publisherImprint\":null,\"publishingPrinciples\":null,\"recordedAt\":null,\"releasedEvent\":null,\"review\":null,\"schemaVersion\":null,\"sdDatePublished\":null,\"sdLicense\":null,\"sdPublisher\":null,\"sourceOrganization\":null,\"spatial\":null,\"spatialCoverage\":null,\"sponsor\":null,\"temporal\":null,\"temporalCoverage\":null,\"text\":null,\"thumbnailUrl\":null,\"timeRequired\":null,\"translationOfWork\":null,\"translator\":null,\"typicalAgeRange\":null,\"usageInfo\":null,\"version\":null,\"video\":null,\"workExample\":null,\"workTranslation\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{seomatic.site.siteLinksSearchTarget}\",\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebPage\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromField\",\"seoTitleField\":\"title\",\"siteNamePositionSource\":\"sameAsGlobal\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"sameAsGlobal\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"sameAsGlobal\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(7,'2021-03-15 15:39:25','2022-01-18 15:42:55','00513103-9fae-41ce-a47d-707c58b06b0f','1.0.29','section',6,'Blog','blog','channel',NULL,'blog/_entry',2,'{\"1\":{\"id\":4,\"sectionId\":6,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"blog/{slug}\",\"template\":\"blog/_entry\",\"language\":\"en-us\"},\"2\":{\"id\":5,\"sectionId\":6,\"siteId\":2,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"blog/{slug}\",\"template\":\"blog/_entry\",\"language\":\"es\"}}','2022-01-18 15:42:55','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{entry.title}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{entry.url}\",\"robots\":\"\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"Project\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"breadcrumb\":null,\"lastReviewed\":null,\"mainContentOfPage\":null,\"primaryImageOfPage\":null,\"relatedLink\":null,\"reviewedBy\":null,\"significantLink\":null,\"speakable\":null,\"specialty\":null,\"about\":null,\"abstract\":null,\"accessMode\":null,\"accessModeSufficient\":null,\"accessibilityAPI\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"accessibilityHazard\":null,\"accessibilitySummary\":null,\"accountablePerson\":null,\"acquireLicensePage\":null,\"aggregateRating\":null,\"alternativeHeadline\":null,\"associatedMedia\":null,\"audience\":null,\"audio\":null,\"author\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"award\":null,\"character\":null,\"citation\":null,\"comment\":null,\"commentCount\":null,\"conditionsOfAccess\":null,\"contentLocation\":null,\"contentRating\":null,\"contentReferenceTime\":null,\"contributor\":null,\"copyrightHolder\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"copyrightYear\":\"{entry.postDate | date(\\\"Y\\\")}\",\"correction\":null,\"creativeWorkStatus\":null,\"creator\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"dateCreated\":false,\"dateModified\":\"{entry.dateUpdated |atom}\",\"datePublished\":\"{entry.postDate |atom}\",\"discussionUrl\":null,\"editor\":null,\"educationalAlignment\":null,\"educationalUse\":null,\"encoding\":null,\"encodingFormat\":null,\"exampleOfWork\":null,\"expires\":null,\"funder\":null,\"genre\":null,\"hasPart\":null,\"headline\":\"{seomatic.meta.seoTitle}\",\"inLanguage\":\"{seomatic.meta.language}\",\"interactionStatistic\":null,\"interactivityType\":null,\"isAccessibleForFree\":null,\"isBasedOn\":null,\"isFamilyFriendly\":null,\"isPartOf\":null,\"keywords\":null,\"learningResourceType\":null,\"license\":null,\"locationCreated\":null,\"mainEntity\":null,\"maintainer\":null,\"material\":null,\"materialExtent\":null,\"mentions\":null,\"offers\":null,\"position\":null,\"producer\":null,\"provider\":null,\"publication\":null,\"publisher\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"publisherImprint\":null,\"publishingPrinciples\":null,\"recordedAt\":null,\"releasedEvent\":null,\"review\":null,\"schemaVersion\":null,\"sdDatePublished\":null,\"sdLicense\":null,\"sdPublisher\":null,\"sourceOrganization\":null,\"spatial\":null,\"spatialCoverage\":null,\"sponsor\":null,\"temporal\":null,\"temporalCoverage\":null,\"text\":null,\"thumbnailUrl\":null,\"timeRequired\":null,\"translationOfWork\":null,\"translator\":null,\"typicalAgeRange\":null,\"usageInfo\":null,\"version\":null,\"video\":null,\"workExample\":null,\"workTranslation\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{seomatic.site.siteLinksSearchTarget}\",\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebPage\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromField\",\"seoTitleField\":\"title\",\"siteNamePositionSource\":\"sameAsGlobal\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"sameAsGlobal\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"sameAsGlobal\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(8,'2021-03-15 15:50:58','2021-03-15 15:50:58','24580179-74c1-467c-93bf-aaec35939a7c','1.0.49','__GLOBAL_BUNDLE__',1,'__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__',NULL,'',2,'[]','2021-03-15 15:50:58','{\"language\":null,\"mainEntityOfPage\":\"WebSite\",\"seoTitle\":\"\",\"siteNamePosition\":\"before\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{seomatic.helper.safeCanonicalUrl()}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"none\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"none\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\"}','{\"siteName\":\"Project\",\"identity\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"creator\":{\"siteType\":\"Organization\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"nystudio107\",\"genericAlternateName\":\"nys\",\"genericDescription\":\"We do technology-based consulting, branding, design, and development. Making the web better one site at a time, with a focus on performance, usability & SEO\",\"genericUrl\":\"https://nystudio107.com/\",\"genericImage\":\"https://nystudio107-ems2qegf7x6qiqq.netdna-ssl.com/img/site/nys_logo_seo.png\",\"genericImageWidth\":\"1042\",\"genericImageHeight\":\"1042\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"info@nystudio107.com\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"Webster\",\"genericAddressRegion\":\"NY\",\"genericPostalCode\":\"14580\",\"genericAddressCountry\":\"US\",\"genericGeoLatitude\":\"43.2365384\",\"genericGeoLongitude\":\"-77.49211620000001\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"Andrew Welch, Polly Welch\",\"organizationFoundingDate\":\"2013-05-02\",\"organizationFoundingLocation\":\"Webster, NY\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"sameAsLinks\":{\"twitter\":{\"siteName\":\"Twitter\",\"handle\":\"twitter\",\"url\":\"\"},\"facebook\":{\"siteName\":\"Facebook\",\"handle\":\"facebook\",\"url\":\"\"},\"wikipedia\":{\"siteName\":\"Wikipedia\",\"handle\":\"wikipedia\",\"url\":\"\"},\"linkedin\":{\"siteName\":\"LinkedIn\",\"handle\":\"linkedin\",\"url\":\"\"},\"googleplus\":{\"siteName\":\"Google+\",\"handle\":\"googleplus\",\"url\":\"\"},\"youtube\":{\"siteName\":\"YouTube\",\"handle\":\"youtube\",\"url\":\"\"},\"instagram\":{\"siteName\":\"Instagram\",\"handle\":\"instagram\",\"url\":\"\"},\"pinterest\":{\"siteName\":\"Pinterest\",\"handle\":\"pinterest\",\"url\":\"\"},\"github\":{\"siteName\":\"GitHub\",\"handle\":\"github\",\"url\":\"\"},\"vimeo\":{\"siteName\":\"Vimeo\",\"handle\":\"vimeo\",\"url\":\"\"}},\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}]}','{\"MetaTagContainergeneral\":{\"data\":{\"generator\":{\"charset\":\"\",\"content\":\"SEOmatic\",\"httpEquiv\":\"\",\"name\":\"generator\",\"property\":null,\"include\":true,\"key\":\"generator\",\"environment\":null,\"dependencies\":{\"config\":[\"generatorEnabled\"]}},\"keywords\":{\"charset\":\"\",\"content\":\"{seomatic.meta.seoKeywords}\",\"httpEquiv\":\"\",\"name\":\"keywords\",\"property\":null,\"include\":true,\"key\":\"keywords\",\"environment\":null,\"dependencies\":null},\"description\":{\"charset\":\"\",\"content\":\"{seomatic.meta.seoDescription}\",\"httpEquiv\":\"\",\"name\":\"description\",\"property\":null,\"include\":true,\"key\":\"description\",\"environment\":null,\"dependencies\":null},\"referrer\":{\"charset\":\"\",\"content\":\"{seomatic.site.referrer}\",\"httpEquiv\":\"\",\"name\":\"referrer\",\"property\":null,\"include\":true,\"key\":\"referrer\",\"environment\":null,\"dependencies\":null},\"robots\":{\"charset\":\"\",\"content\":\"{seomatic.meta.robots}\",\"httpEquiv\":\"\",\"name\":\"robots\",\"property\":null,\"include\":true,\"key\":\"robots\",\"environment\":{\"live\":{\"content\":\"{seomatic.meta.robots}\"},\"staging\":{\"content\":\"none\"},\"local\":{\"content\":\"none\"}},\"dependencies\":null}},\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":{\"fb:profile_id\":{\"charset\":\"\",\"content\":\"{seomatic.site.facebookProfileId}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:profile_id\",\"include\":true,\"key\":\"fb:profile_id\",\"environment\":null,\"dependencies\":null},\"fb:app_id\":{\"charset\":\"\",\"content\":\"{seomatic.site.facebookAppId}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:app_id\",\"include\":true,\"key\":\"fb:app_id\",\"environment\":null,\"dependencies\":null},\"og:locale\":{\"charset\":\"\",\"content\":\"{{ craft.app.language |replace({\\\"-\\\": \\\"_\\\"}) }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale\",\"include\":true,\"key\":\"og:locale\",\"environment\":null,\"dependencies\":null},\"og:locale:alternate\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale:alternate\",\"include\":true,\"key\":\"og:locale:alternate\",\"environment\":null,\"dependencies\":null},\"og:site_name\":{\"charset\":\"\",\"content\":\"{seomatic.site.siteName}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:site_name\",\"include\":true,\"key\":\"og:site_name\",\"environment\":null,\"dependencies\":null},\"og:type\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogType}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:type\",\"include\":true,\"key\":\"og:type\",\"environment\":null,\"dependencies\":null},\"og:url\":{\"charset\":\"\",\"content\":\"{seomatic.meta.canonicalUrl}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:url\",\"include\":true,\"key\":\"og:url\",\"environment\":null,\"dependencies\":null},\"og:title\":{\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.ogSiteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"charset\":\"\",\"content\":\"{seomatic.meta.ogTitle}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:title\",\"include\":true,\"key\":\"og:title\",\"environment\":null,\"dependencies\":null},\"og:description\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogDescription}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:description\",\"include\":true,\"key\":\"og:description\",\"environment\":null,\"dependencies\":null},\"og:image\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogImage}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image\",\"include\":true,\"key\":\"og:image\",\"environment\":null,\"dependencies\":null},\"og:image:width\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogImageWidth}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:width\",\"include\":true,\"key\":\"og:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]}},\"og:image:height\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogImageHeight}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:height\",\"include\":true,\"key\":\"og:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]}},\"og:image:alt\":{\"charset\":\"\",\"content\":\"{seomatic.meta.ogImageDescription}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:alt\",\"include\":true,\"key\":\"og:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]}},\"og:see_also\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:see_also\",\"include\":true,\"key\":\"og:see_also\",\"environment\":null,\"dependencies\":null}},\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":{\"twitter:card\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterCard}\",\"httpEquiv\":\"\",\"name\":\"twitter:card\",\"property\":null,\"include\":true,\"key\":\"twitter:card\",\"environment\":null,\"dependencies\":null},\"twitter:site\":{\"charset\":\"\",\"content\":\"@{seomatic.site.twitterHandle}\",\"httpEquiv\":\"\",\"name\":\"twitter:site\",\"property\":null,\"include\":true,\"key\":\"twitter:site\",\"environment\":null,\"dependencies\":{\"site\":[\"twitterHandle\"]}},\"twitter:creator\":{\"charset\":\"\",\"content\":\"@{seomatic.meta.twitterCreator}\",\"httpEquiv\":\"\",\"name\":\"twitter:creator\",\"property\":null,\"include\":true,\"key\":\"twitter:creator\",\"environment\":null,\"dependencies\":{\"meta\":[\"twitterCreator\"]}},\"twitter:title\":{\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.twitterSiteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"charset\":\"\",\"content\":\"{seomatic.meta.twitterTitle}\",\"httpEquiv\":\"\",\"name\":\"twitter:title\",\"property\":null,\"include\":true,\"key\":\"twitter:title\",\"environment\":null,\"dependencies\":null},\"twitter:description\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterDescription}\",\"httpEquiv\":\"\",\"name\":\"twitter:description\",\"property\":null,\"include\":true,\"key\":\"twitter:description\",\"environment\":null,\"dependencies\":null},\"twitter:image\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterImage}\",\"httpEquiv\":\"\",\"name\":\"twitter:image\",\"property\":null,\"include\":true,\"key\":\"twitter:image\",\"environment\":null,\"dependencies\":null},\"twitter:image:width\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterImageWidth}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:width\",\"property\":null,\"include\":true,\"key\":\"twitter:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]}},\"twitter:image:height\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterImageHeight}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:height\",\"property\":null,\"include\":true,\"key\":\"twitter:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]}},\"twitter:image:alt\":{\"charset\":\"\",\"content\":\"{seomatic.meta.twitterImageDescription}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:alt\",\"property\":null,\"include\":true,\"key\":\"twitter:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]}}},\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":{\"site\":[\"twitterHandle\"]},\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":{\"google-site-verification\":{\"charset\":\"\",\"content\":\"{seomatic.site.googleSiteVerification}\",\"httpEquiv\":\"\",\"name\":\"google-site-verification\",\"property\":null,\"include\":true,\"key\":\"google-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"googleSiteVerification\"]}},\"bing-site-verification\":{\"charset\":\"\",\"content\":\"{seomatic.site.bingSiteVerification}\",\"httpEquiv\":\"\",\"name\":\"msvalidate.01\",\"property\":null,\"include\":true,\"key\":\"bing-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"bingSiteVerification\"]}},\"pinterest-site-verification\":{\"charset\":\"\",\"content\":\"{seomatic.site.pinterestSiteVerification}\",\"httpEquiv\":\"\",\"name\":\"p:domain_verify\",\"property\":null,\"include\":true,\"key\":\"pinterest-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"pinterestSiteVerification\"]}}},\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":{\"canonical\":{\"crossorigin\":\"\",\"href\":\"{seomatic.meta.canonicalUrl}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"canonical\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"canonical\",\"environment\":null,\"dependencies\":null},\"home\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"/\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"home\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"home\",\"environment\":null,\"dependencies\":null},\"author\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"/humans.txt\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"author\",\"sizes\":\"\",\"type\":\"text/plain\",\"include\":true,\"key\":\"author\",\"environment\":null,\"dependencies\":{\"frontend_template\":[\"humans\"]}},\"publisher\":{\"crossorigin\":\"\",\"href\":\"{seomatic.site.googlePublisherLink}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"publisher\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"publisher\",\"environment\":null,\"dependencies\":{\"site\":[\"googlePublisherLink\"]}}},\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":{\"googleAnalytics\":{\"name\":\"Google Analytics\",\"description\":\"Google Analytics gives you the digital analytics tools you need to analyze data from all touchpoints in one place, for a deeper understanding of the customer experience. You can then share the insights that matter with your whole organization. [Learn More](https://www.google.com/analytics/analytics/)\",\"templatePath\":\"_frontend/scripts/googleAnalytics.twig\",\"templateString\":\"{% if trackingId.value is defined and trackingId.value %}\\n(function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){\\n(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\\nm=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\\n})(window,document,\'script\',\'{{ analyticsUrl.value }}\',\'ga\');\\nga(\'create\', \'{{ trackingId.value |raw }}\', \'auto\'{% if linker.value %}, {allowLinker: true}{% endif %});\\n{% if ipAnonymization.value %}\\nga(\'set\', \'anonymizeIp\', true);\\n{% endif %}\\n{% if displayFeatures.value %}\\nga(\'require\', \'displayfeatures\');\\n{% endif %}\\n{% if ecommerce.value %}\\nga(\'require\', \'ecommerce\');\\n{% endif %}\\n{% if enhancedEcommerce.value %}\\nga(\'require\', \'ec\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linkid\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linker\');\\n{% endif %}\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nga(\'send\', \'pageview\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"trackingId\":{\"title\":\"Google Analytics Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `UA-XXXXXX-XX`, not the entire script code. [Learn More](https://support.google.com/analytics/answer/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Google Analytics PageView\",\"instructions\":\"Controls whether the Google Analytics script automatically sends a PageView to Google Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"When a customer of Analytics requests IP address anonymization, Analytics anonymizes the address as soon as technically feasible at the earliest possible stage of the collection network.\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Display Features\",\"instructions\":\"The display features plugin for analytics.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/display-features)\",\"type\":\"bool\",\"value\":false},\"ecommerce\":{\"title\":\"Ecommerce\",\"instructions\":\"Ecommerce tracking allows you to measure the number of transactions and revenue that your website generates. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedEcommerce\":{\"title\":\"Enhanced Ecommerce\",\"instructions\":\"The enhanced ecommerce plug-in for analytics.js enables the measurement of user interactions with products on ecommerce websites across the user\'s shopping experience, including: product impressions, product clicks, viewing product details, adding a product to a shopping cart, initiating the checkout process, transactions, and refunds. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/enhanced-ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Enhanced Link Attribution\",\"instructions\":\"Enhanced Link Attribution improves the accuracy of your In-Page Analytics report by automatically differentiating between multiple links to the same URL on a single page by using link element IDs. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"linker\":{\"title\":\"Linker\",\"instructions\":\"The linker plugin simplifies the process of implementing cross-domain tracking as described in the Cross-domain Tracking guide for analytics.js. [Learn More](https://developers.google.com/analytics/devguides/collection/analyticsjs/linker)\",\"type\":\"bool\",\"value\":false},\"analyticsUrl\":{\"title\":\"Google Analytics Script URL\",\"instructions\":\"The URL to the Google Analytics tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.google-analytics.com/analytics.js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"googleAnalytics\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"nonce\":null},\"gtag\":{\"name\":\"Google gtag.js\",\"description\":\"The global site tag (gtag.js) is a JavaScript tagging framework and API that allows you to send event data to AdWords, DoubleClick, and Google Analytics. Instead of having to manage multiple tags for different products, you can use gtag.js and more easily benefit from the latest tracking features and integrations as they become available. [Learn More](https://developers.google.com/gtagjs/)\",\"templatePath\":\"_frontend/scripts/gtagHead.twig\",\"templateString\":\"{% set gtagProperty = googleAnalyticsId.value ?? googleAdWordsId.value ?? dcFloodlightId.value ?? null %}\\n{% if gtagProperty %}\\nwindow.dataLayer = window.dataLayer || [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\nfunction gtag(){dataLayer.push(arguments)};\\ngtag(\'js\', new Date());\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if googleAnalyticsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'anonymize_ip\': #{ipAnonymization.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'link_attribution\': #{enhancedLinkAttribution.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'allow_display_features\': #{displayFeatures.value ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAnalyticsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if googleAdWordsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAdWordsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if dcFloodlightId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ dcFloodlightId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/gtagBody.twig\",\"bodyTemplateString\":\"{% set gtagProperty = googleAnalyticsId.value ?? googleAdWordsId.value ?? dcFloodlightId.value ?? null %}\\n{% if gtagProperty %}\\n<script async src=\\\"{{ gtagScriptUrl.value }}?id={{ gtagProperty }}\\\"></script>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleAnalyticsId\":{\"title\":\"Google Analytics Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `UA-XXXXXX-XX`, not the entire script code. [Learn More](https://support.google.com/analytics/answer/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"googleAdWordsId\":{\"title\":\"AdWords Conversion ID\",\"instructions\":\"Only enter the ID, e.g.: `AW-XXXXXXXX`, not the entire script code. [Learn More](https://developers.google.com/adwords-remarketing-tag/)\",\"type\":\"string\",\"value\":\"\"},\"dcFloodlightId\":{\"title\":\"DoubleClick Floodlight ID\",\"instructions\":\"Only enter the ID, e.g.: `DC-XXXXXXXX`, not the entire script code. [Learn More](https://support.google.com/dcm/partner/answer/7568534)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send PageView\",\"instructions\":\"Controls whether the `gtag.js` script automatically sends a PageView to Google Analytics, AdWords, and DoubleClick Floodlight when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"In some cases, you might need to anonymize the IP addresses of hits sent to Google Analytics. [Learn More](https://developers.google.com/analytics/devguides/collection/gtagjs/ip-anonymization)\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Google Analytics Display Features\",\"instructions\":\"The display features plugin for gtag.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https://developers.google.com/analytics/devguides/collection/gtagjs/display-features)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Google Analytics Enhanced Link Attribution\",\"instructions\":\"Enhanced link attribution improves click track reporting by automatically differentiating between multiple link clicks that have the same URL on a given page. [Learn More](https://developers.google.com/analytics/devguides/collection/gtagjs/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"gtagScriptUrl\":{\"title\":\"Google gtag.js Script URL\",\"instructions\":\"The URL to the Google gtag.js tracking script. Normally this should not be changed, unless you locally cache it. The JavaScript `dataLayer` will automatically be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"https://www.googletagmanager.com/gtag/js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"gtag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"nonce\":null},\"googleTagManager\":{\"name\":\"Google Tag Manager\",\"description\":\"Google Tag Manager is a tag management system that allows you to quickly and easily update tags and code snippets on your website. Once the Tag Manager snippet has been added to your website or mobile app, you can configure tags via a web-based user interface without having to alter and deploy additional code. [Learn More](https://support.google.com/tagmanager/answer/6102821?hl=en)\",\"templatePath\":\"_frontend/scripts/googleTagManagerHead.twig\",\"templateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n{{ dataLayerVariableName.value }} = [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\n(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({\'gtm.start\':\\nnew Date().getTime(),event:\'gtm.js\'});var f=d.getElementsByTagName(s)[0],\\nj=d.createElement(s),dl=l!=\'dataLayer\'?\'&l=\'+l:\'\';j.async=true;j.src=\\n\'{{ googleTagManagerUrl.value }}?id=\'+i+dl;f.parentNode.insertBefore(j,f);\\n})(window,document,\'script\',\'{{ dataLayerVariableName.value }}\',\'{{ googleTagManagerId.value }}\');\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/googleTagManagerBody.twig\",\"bodyTemplateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n<noscript><iframe src=\\\"{{ googleTagManagerNoScriptUrl.value }}?id={{ googleTagManagerId.value }}\\\"\\nheight=\\\"0\\\" width=\\\"0\\\" style=\\\"display:none;visibility:hidden\\\"></iframe></noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleTagManagerId\":{\"title\":\"Google Tag Manager ID\",\"instructions\":\"Only enter the ID, e.g.: `GTM-XXXXXX`, not the entire script code. [Learn More](https://developers.google.com/tag-manager/quickstart)\",\"type\":\"string\",\"value\":\"\"},\"dataLayerVariableName\":{\"title\":\"DataLayer Variable Name\",\"instructions\":\"The name to use for the JavaScript DataLayer variable. The value of this variable will be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"dataLayer\"},\"googleTagManagerUrl\":{\"title\":\"Google Tag Manager Script URL\",\"instructions\":\"The URL to the Google Tag Manager script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.googletagmanager.com/gtm.js\"},\"googleTagManagerNoScriptUrl\":{\"title\":\"Google Tag Manager Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Google Tag Manager `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.googletagmanager.com/ns.html\"}},\"dataLayer\":[],\"include\":false,\"key\":\"googleTagManager\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"nonce\":null},\"facebookPixel\":{\"name\":\"Facebook Pixel\",\"description\":\"The Facebook pixel is an analytics tool that helps you measure the effectiveness of your advertising. You can use the Facebook pixel to understand the actions people are taking on your website and reach audiences you care about. [Learn More](https://www.facebook.com/business/help/651294705016616)\",\"templatePath\":\"_frontend/scripts/facebookPixelHead.twig\",\"templateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?\\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;\\nn.push=n;n.loaded=!0;n.version=\'2.0\';n.queue=[];t=b.createElement(e);t.async=!0;\\nt.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,\\ndocument,\'script\',\'{{ facebookPixelUrl.value }}\');\\nfbq(\'init\', \'{{ facebookPixelId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nfbq(\'track\', \'PageView\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/facebookPixelBody.twig\",\"bodyTemplateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none\\\"\\nsrc=\\\"{{ facebookPixelNoScriptUrl.value }}?id={{ facebookPixelId.value }}&ev=PageView&noscript=1\\\" /></noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"facebookPixelId\":{\"title\":\"Facebook Pixel ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https://developers.facebook.com/docs/facebook-pixel/api-reference)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Facebook Pixel PageView\",\"instructions\":\"Controls whether the Facebook Pixel script automatically sends a PageView to Facebook Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"facebookPixelUrl\":{\"title\":\"Facebook Pixel Script URL\",\"instructions\":\"The URL to the Facebook Pixel script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://connect.facebook.net/en_US/fbevents.js\"},\"facebookPixelNoScriptUrl\":{\"title\":\"Facebook Pixel Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Facebook Pixel `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://www.facebook.com/tr\"}},\"dataLayer\":[],\"include\":false,\"key\":\"facebookPixel\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"nonce\":null},\"linkedInInsight\":{\"name\":\"LinkedIn Insight\",\"description\":\"The LinkedIn Insight Tag is a lightweight JavaScript tag that powers conversion tracking, retargeting, and web analytics for LinkedIn ad campaigns.\",\"templatePath\":\"_frontend/scripts/linkedInInsightHead.twig\",\"templateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n_linkedin_data_partner_id = \\\"{{ dataPartnerId.value }}\\\";\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/linkedInInsightBody.twig\",\"bodyTemplateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n<script type=\\\"text/javascript\\\">\\n(function(){var s = document.getElementsByTagName(\\\"script\\\")[0];\\n    var b = document.createElement(\\\"script\\\");\\n    b.type = \\\"text/javascript\\\";b.async = true;\\n    b.src = \\\"{{ linkedInInsightUrl.value }}\\\";\\n    s.parentNode.insertBefore(b, s);})();\\n</script>\\n<noscript>\\n<img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ linkedInInsightNoScriptUrl.value }}?pid={{ dataPartnerId.value }}&fmt=gif\\\" />\\n</noscript>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"dataPartnerId\":{\"title\":\"LinkedIn Data Partner ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https://www.linkedin.com/help/lms/answer/65513/adding-the-linkedin-insight-tag-to-your-website?lang=en)\",\"type\":\"string\",\"value\":\"\"},\"linkedInInsightUrl\":{\"title\":\"LinkedIn Insight Script URL\",\"instructions\":\"The URL to the LinkedIn Insight script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://snap.licdn.com/li.lms-analytics/insight.min.js\"},\"linkedInInsightNoScriptUrl\":{\"title\":\"LinkedIn Insight &lt;noscript&gt; URL\",\"instructions\":\"The URL to the LinkedIn Insight `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https://dc.ads.linkedin.com/collect/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"linkedInInsight\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"nonce\":null},\"hubSpot\":{\"name\":\"HubSpot\",\"description\":\"If you\'re not hosting your entire website on HubSpot, or have pages on your website that are not hosted on HubSpot, you\'ll need to install the HubSpot tracking code on your non-HubSpot pages in order to capture those analytics.\",\"templatePath\":null,\"templateString\":null,\"position\":1,\"bodyTemplatePath\":\"_frontend/scripts/hubSpotBody.twig\",\"bodyTemplateString\":\"{% if hubSpotId.value is defined and hubSpotId.value %}\\n<script type=\\\"text/javascript\\\" id=\\\"hs-script-loader\\\" async defer src=\\\"{{ hubSpotUrl.value }}{{ hubSpotId.value }}.js\\\"></script>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"hubSpotId\":{\"title\":\"HubSpot ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https://knowledge.hubspot.com/articles/kcs_article/reports/install-the-hubspot-tracking-code)\",\"type\":\"string\",\"value\":\"\"},\"hubSpotUrl\":{\"title\":\"HubSpot Script URL\",\"instructions\":\"The URL to the HubSpot script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"//js.hs-scripts.com/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"hubSpot\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"nonce\":null}},\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"issn\":null,\"about\":null,\"abstract\":null,\"accessMode\":null,\"accessModeSufficient\":null,\"accessibilityAPI\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"accessibilityHazard\":null,\"accessibilitySummary\":null,\"accountablePerson\":null,\"acquireLicensePage\":null,\"aggregateRating\":null,\"alternativeHeadline\":null,\"associatedMedia\":null,\"audience\":null,\"audio\":null,\"author\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"award\":null,\"character\":null,\"citation\":null,\"comment\":null,\"commentCount\":null,\"conditionsOfAccess\":null,\"contentLocation\":null,\"contentRating\":null,\"contentReferenceTime\":null,\"contributor\":null,\"copyrightHolder\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"copyrightYear\":null,\"correction\":null,\"creativeWorkStatus\":null,\"creator\":{\"id\":\"{parseEnv(seomatic.site.creator.genericUrl)}#creator\"},\"dateCreated\":null,\"dateModified\":null,\"datePublished\":null,\"discussionUrl\":null,\"editor\":null,\"educationalAlignment\":null,\"educationalUse\":null,\"encoding\":null,\"encodingFormat\":null,\"exampleOfWork\":null,\"expires\":null,\"funder\":null,\"genre\":null,\"hasPart\":null,\"headline\":null,\"inLanguage\":\"{seomatic.meta.language}\",\"interactionStatistic\":null,\"interactivityType\":null,\"isAccessibleForFree\":null,\"isBasedOn\":null,\"isFamilyFriendly\":null,\"isPartOf\":null,\"keywords\":null,\"learningResourceType\":null,\"license\":null,\"locationCreated\":null,\"mainEntity\":null,\"maintainer\":null,\"material\":null,\"materialExtent\":null,\"mentions\":null,\"offers\":null,\"position\":null,\"producer\":null,\"provider\":null,\"publication\":null,\"publisher\":null,\"publisherImprint\":null,\"publishingPrinciples\":null,\"recordedAt\":null,\"releasedEvent\":null,\"review\":null,\"schemaVersion\":null,\"sdDatePublished\":null,\"sdLicense\":null,\"sdPublisher\":null,\"sourceOrganization\":null,\"spatial\":null,\"spatialCoverage\":null,\"sponsor\":null,\"temporal\":null,\"temporalCoverage\":null,\"text\":null,\"thumbnailUrl\":null,\"timeRequired\":null,\"translationOfWork\":null,\"translator\":null,\"typicalAgeRange\":null,\"usageInfo\":null,\"version\":null,\"video\":null,\"workExample\":null,\"workTranslation\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{seomatic.site.siteLinksSearchTarget}\",\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"nonce\":null},\"identity\":{\"actionableFeedbackPolicy\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{seomatic.site.identity.genericStreetAddress}\",\"addressLocality\":\"{seomatic.site.identity.genericAddressLocality}\",\"addressRegion\":\"{seomatic.site.identity.genericAddressRegion}\",\"postalCode\":\"{seomatic.site.identity.genericPostalCode}\",\"addressCountry\":\"{seomatic.site.identity.genericAddressCountry}\"},\"aggregateRating\":null,\"alumni\":null,\"areaServed\":null,\"award\":null,\"brand\":null,\"contactPoint\":null,\"correctionsPolicy\":null,\"department\":null,\"dissolutionDate\":null,\"diversityPolicy\":null,\"diversityStaffingReport\":null,\"duns\":\"{seomatic.site.identity.organizationDuns}\",\"email\":\"{seomatic.site.identity.genericEmail}\",\"employee\":null,\"ethicsPolicy\":null,\"event\":null,\"faxNumber\":null,\"founder\":\"{seomatic.site.identity.organizationFounder}\",\"foundingDate\":\"{seomatic.site.identity.organizationFoundingDate}\",\"foundingLocation\":\"{seomatic.site.identity.organizationFoundingLocation}\",\"funder\":null,\"globalLocationNumber\":null,\"hasCredential\":null,\"hasMerchantReturnPolicy\":null,\"hasOfferCatalog\":null,\"hasPOS\":null,\"interactionStatistic\":null,\"isicV4\":null,\"knowsAbout\":null,\"knowsLanguage\":null,\"legalName\":null,\"leiCode\":null,\"location\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.helper.socialTransform(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\")}\",\"width\":\"{seomatic.helper.socialTransformWidth(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\")}\",\"height\":\"{seomatic.helper.socialTransformHeight(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\")}\"},\"makesOffer\":null,\"member\":null,\"memberOf\":null,\"naics\":null,\"numberOfEmployees\":null,\"ownershipFundingInfo\":null,\"owns\":null,\"parentOrganization\":null,\"publishingPrinciples\":null,\"review\":null,\"seeks\":null,\"slogan\":null,\"sponsor\":null,\"subOrganization\":null,\"taxID\":null,\"telephone\":\"{seomatic.site.identity.genericTelephone}\",\"unnamedSourcesPolicy\":null,\"vatID\":null,\"additionalType\":null,\"alternateName\":\"{seomatic.site.identity.genericAlternateName}\",\"description\":\"{seomatic.site.identity.genericDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.site.identity.genericImage}\",\"width\":\"{seomatic.site.identity.genericImageWidth}\",\"height\":\"{seomatic.site.identity.genericImageHeight}\"},\"mainEntityOfPage\":null,\"name\":\"{seomatic.site.identity.genericName}\",\"potentialAction\":null,\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.site.identity.genericUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.site.identity.computedType}\",\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\",\"graph\":null,\"include\":true,\"key\":\"identity\",\"environment\":null,\"dependencies\":null,\"nonce\":null},\"creator\":{\"actionableFeedbackPolicy\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{seomatic.site.creator.genericStreetAddress}\",\"addressLocality\":\"{seomatic.site.creator.genericAddressLocality}\",\"addressRegion\":\"{seomatic.site.creator.genericAddressRegion}\",\"postalCode\":\"{seomatic.site.creator.genericPostalCode}\",\"addressCountry\":\"{seomatic.site.creator.genericAddressCountry}\"},\"aggregateRating\":null,\"alumni\":null,\"areaServed\":null,\"award\":null,\"brand\":null,\"contactPoint\":null,\"correctionsPolicy\":null,\"department\":null,\"dissolutionDate\":null,\"diversityPolicy\":null,\"diversityStaffingReport\":null,\"duns\":\"{seomatic.site.creator.organizationDuns}\",\"email\":\"{seomatic.site.creator.genericEmail}\",\"employee\":null,\"ethicsPolicy\":null,\"event\":null,\"faxNumber\":null,\"founder\":\"{seomatic.site.creator.organizationFounder}\",\"foundingDate\":\"{seomatic.site.creator.organizationFoundingDate}\",\"foundingLocation\":\"{seomatic.site.creator.organizationFoundingLocation}\",\"funder\":null,\"globalLocationNumber\":null,\"hasCredential\":null,\"hasMerchantReturnPolicy\":null,\"hasOfferCatalog\":null,\"hasPOS\":null,\"interactionStatistic\":null,\"isicV4\":null,\"knowsAbout\":null,\"knowsLanguage\":null,\"legalName\":null,\"leiCode\":null,\"location\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.helper.socialTransform(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\")}\",\"width\":\"{seomatic.helper.socialTransformWidth(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\")}\",\"height\":\"{seomatic.helper.socialTransformHeight(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\")}\"},\"makesOffer\":null,\"member\":null,\"memberOf\":null,\"naics\":null,\"numberOfEmployees\":null,\"ownershipFundingInfo\":null,\"owns\":null,\"parentOrganization\":null,\"publishingPrinciples\":null,\"review\":null,\"seeks\":null,\"slogan\":null,\"sponsor\":null,\"subOrganization\":null,\"taxID\":null,\"telephone\":\"{seomatic.site.creator.genericTelephone}\",\"unnamedSourcesPolicy\":null,\"vatID\":null,\"additionalType\":null,\"alternateName\":\"{seomatic.site.creator.genericAlternateName}\",\"description\":\"{seomatic.site.creator.genericDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.site.creator.genericImage}\",\"width\":\"{seomatic.site.creator.genericImageWidth}\",\"height\":\"{seomatic.site.creator.genericImageHeight}\"},\"mainEntityOfPage\":null,\"name\":\"{seomatic.site.creator.genericName}\",\"potentialAction\":null,\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.site.creator.genericUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.site.creator.computedType}\",\"id\":\"{parseEnv(seomatic.site.creator.genericUrl)}#creator\",\"graph\":null,\"include\":true,\"key\":\"creator\",\"environment\":null,\"dependencies\":null,\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":{\"humans\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"/* TEAM */\\n\\nCreator: {{ seomatic.site.creator.genericName ?? \\\"n/a\\\" }}\\nURL: {{ seomatic.site.creator.genericUrl ?? \\\"n/a\\\" }}\\nDescription: {{ seomatic.site.creator.genericDescription ?? \\\"n/a\\\" }}\\n\\n/* THANKS */\\n\\nCraft CMS - https://craftcms.com\\nPixel & Tonic - https://pixelandtonic.com\\n\\n/* SITE */\\n\\nStandards: HTML5, CSS3\\nComponents: Craft CMS 3, Yii2, PHP, JavaScript, SEOmatic\\n\",\"siteId\":null,\"include\":true,\"handle\":\"humans\",\"path\":\"humans.txt\",\"template\":\"_frontend/pages/humans.twig\",\"controller\":\"frontend-template\",\"action\":\"humans\"},\"robots\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# robots.txt for {{ siteUrl }}\\n\\nSitemap: {{ seomatic.helper.sitemapIndexForSiteId() }}\\n{% switch seomatic.config.environment %}\\n\\n{% case \\\"live\\\" %}\\n\\n# live - don\'t allow web crawlers to index cpresources/ or vendor/\\n\\nUser-agent: *\\nDisallow: /cpresources/\\nDisallow: /vendor/\\nDisallow: /.env\\nDisallow: /cache/\\n\\n{% case \\\"staging\\\" %}\\n\\n# staging - disallow all\\n\\nUser-agent: *\\nDisallow: /\\n\\n{% case \\\"local\\\" %}\\n\\n# local - disallow all\\n\\nUser-agent: *\\nDisallow: /\\n\\n{% default %}\\n\\n# default - don\'t allow web crawlers to index cpresources/ or vendor/\\n\\nUser-agent: *\\nDisallow: /cpresources/\\nDisallow: /vendor/\\nDisallow: /.env\\nDisallow: /cache/\\n\\n{% endswitch %}\\n\",\"siteId\":null,\"include\":true,\"handle\":\"robots\",\"path\":\"robots.txt\",\"template\":\"_frontend/pages/robots.twig\",\"controller\":\"frontend-template\",\"action\":\"robots\"},\"ads\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# ads.txt file for {{ siteUrl }}\\n# More info: https://support.google.com/admanager/answer/7441288?hl=en\\n{{ siteUrl }},123,DIRECT\\n\",\"siteId\":null,\"include\":true,\"handle\":\"ads\",\"path\":\"ads.txt\",\"template\":\"_frontend/pages/ads.twig\",\"controller\":\"frontend-template\",\"action\":\"ads\"}},\"name\":\"Frontend Templates\",\"description\":\"Templates that are rendered on the frontend\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":\"SeomaticEditableTemplate\",\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(9,'2021-04-01 02:35:21','2021-04-01 02:35:44','eca2ecb0-1d84-4a00-8828-4f1080c06322','1.0.26','categorygroup',1,'Category','category','category',NULL,'',1,'{\"1\":{\"id\":1,\"groupId\":1,\"siteId\":1,\"hasUrls\":1,\"uriFormat\":\"category/{slug}\",\"template\":null,\"language\":\"en-us\"},\"2\":{\"id\":2,\"groupId\":1,\"siteId\":2,\"hasUrls\":1,\"uriFormat\":\"category/{slug}\",\"template\":null,\"language\":\"es\"}}','2021-04-01 02:35:44','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{category.title}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{category.url}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\"}','{\"siteName\":\"plugindev\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"breadcrumb\":null,\"lastReviewed\":null,\"mainContentOfPage\":null,\"primaryImageOfPage\":null,\"relatedLink\":null,\"reviewedBy\":null,\"significantLink\":null,\"speakable\":null,\"specialty\":null,\"about\":null,\"abstract\":null,\"accessMode\":null,\"accessModeSufficient\":null,\"accessibilityAPI\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"accessibilityHazard\":null,\"accessibilitySummary\":null,\"accountablePerson\":null,\"acquireLicensePage\":null,\"aggregateRating\":null,\"alternativeHeadline\":null,\"associatedMedia\":null,\"audience\":null,\"audio\":null,\"author\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"award\":null,\"character\":null,\"citation\":null,\"comment\":null,\"commentCount\":null,\"conditionsOfAccess\":null,\"contentLocation\":null,\"contentRating\":null,\"contentReferenceTime\":null,\"contributor\":null,\"copyrightHolder\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"copyrightYear\":\"{category.dateCreated |date(\\\"Y\\\")}\",\"correction\":null,\"creativeWorkStatus\":null,\"creator\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"dateCreated\":false,\"dateModified\":\"{category.dateUpdated |atom}\",\"datePublished\":\"{category.dateCreated |atom}\",\"discussionUrl\":null,\"editor\":null,\"educationalAlignment\":null,\"educationalUse\":null,\"encoding\":null,\"encodingFormat\":null,\"exampleOfWork\":null,\"expires\":null,\"funder\":null,\"genre\":null,\"hasPart\":null,\"headline\":\"{seomatic.meta.seoTitle}\",\"inLanguage\":\"{seomatic.meta.language}\",\"interactionStatistic\":null,\"interactivityType\":null,\"isAccessibleForFree\":null,\"isBasedOn\":null,\"isFamilyFriendly\":null,\"isPartOf\":null,\"keywords\":null,\"learningResourceType\":null,\"license\":null,\"locationCreated\":null,\"mainEntity\":null,\"maintainer\":null,\"material\":null,\"materialExtent\":null,\"mentions\":null,\"offers\":null,\"position\":null,\"producer\":null,\"provider\":null,\"publication\":null,\"publisher\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"publisherImprint\":null,\"publishingPrinciples\":null,\"recordedAt\":null,\"releasedEvent\":null,\"review\":null,\"schemaVersion\":null,\"sdDatePublished\":null,\"sdLicense\":null,\"sdPublisher\":null,\"sourceOrganization\":null,\"spatial\":null,\"spatialCoverage\":null,\"sponsor\":null,\"temporal\":null,\"temporalCoverage\":null,\"text\":null,\"thumbnailUrl\":null,\"timeRequired\":null,\"translationOfWork\":null,\"translator\":null,\"typicalAgeRange\":null,\"usageInfo\":null,\"version\":null,\"video\":null,\"workExample\":null,\"workTranslation\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{seomatic.site.siteLinksSearchTarget}\",\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebPage\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromField\",\"seoTitleField\":\"title\",\"siteNamePositionSource\":\"sameAsGlobal\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"sameAsGlobal\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"sameAsGlobal\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(10,'2021-04-01 02:35:21','2021-04-01 02:35:44','9c84ec4a-934b-46bd-a868-1f1641684933','1.0.26','categorygroup',1,'Category','category','category',NULL,'',2,'{\"1\":{\"id\":1,\"groupId\":1,\"siteId\":1,\"hasUrls\":1,\"uriFormat\":\"category/{slug}\",\"template\":null,\"language\":\"en-us\"},\"2\":{\"id\":2,\"groupId\":1,\"siteId\":2,\"hasUrls\":1,\"uriFormat\":\"category/{slug}\",\"template\":null,\"language\":\"es\"}}','2021-04-01 02:35:44','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{category.title}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{category.url}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\"}','{\"siteName\":\"plugindev\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"breadcrumb\":null,\"lastReviewed\":null,\"mainContentOfPage\":null,\"primaryImageOfPage\":null,\"relatedLink\":null,\"reviewedBy\":null,\"significantLink\":null,\"speakable\":null,\"specialty\":null,\"about\":null,\"abstract\":null,\"accessMode\":null,\"accessModeSufficient\":null,\"accessibilityAPI\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"accessibilityHazard\":null,\"accessibilitySummary\":null,\"accountablePerson\":null,\"acquireLicensePage\":null,\"aggregateRating\":null,\"alternativeHeadline\":null,\"associatedMedia\":null,\"audience\":null,\"audio\":null,\"author\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"award\":null,\"character\":null,\"citation\":null,\"comment\":null,\"commentCount\":null,\"conditionsOfAccess\":null,\"contentLocation\":null,\"contentRating\":null,\"contentReferenceTime\":null,\"contributor\":null,\"copyrightHolder\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"copyrightYear\":\"{category.dateCreated |date(\\\"Y\\\")}\",\"correction\":null,\"creativeWorkStatus\":null,\"creator\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"dateCreated\":false,\"dateModified\":\"{category.dateUpdated |atom}\",\"datePublished\":\"{category.dateCreated |atom}\",\"discussionUrl\":null,\"editor\":null,\"educationalAlignment\":null,\"educationalUse\":null,\"encoding\":null,\"encodingFormat\":null,\"exampleOfWork\":null,\"expires\":null,\"funder\":null,\"genre\":null,\"hasPart\":null,\"headline\":\"{seomatic.meta.seoTitle}\",\"inLanguage\":\"{seomatic.meta.language}\",\"interactionStatistic\":null,\"interactivityType\":null,\"isAccessibleForFree\":null,\"isBasedOn\":null,\"isFamilyFriendly\":null,\"isPartOf\":null,\"keywords\":null,\"learningResourceType\":null,\"license\":null,\"locationCreated\":null,\"mainEntity\":null,\"maintainer\":null,\"material\":null,\"materialExtent\":null,\"mentions\":null,\"offers\":null,\"position\":null,\"producer\":null,\"provider\":null,\"publication\":null,\"publisher\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"publisherImprint\":null,\"publishingPrinciples\":null,\"recordedAt\":null,\"releasedEvent\":null,\"review\":null,\"schemaVersion\":null,\"sdDatePublished\":null,\"sdLicense\":null,\"sdPublisher\":null,\"sourceOrganization\":null,\"spatial\":null,\"spatialCoverage\":null,\"sponsor\":null,\"temporal\":null,\"temporalCoverage\":null,\"text\":null,\"thumbnailUrl\":null,\"timeRequired\":null,\"translationOfWork\":null,\"translator\":null,\"typicalAgeRange\":null,\"usageInfo\":null,\"version\":null,\"video\":null,\"workExample\":null,\"workTranslation\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{seomatic.site.siteLinksSearchTarget}\",\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebPage\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromField\",\"seoTitleField\":\"title\",\"siteNamePositionSource\":\"sameAsGlobal\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"sameAsGlobal\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"sameAsGlobal\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(11,'2022-01-06 14:09:21','2022-01-06 14:18:18','465c5dce-f7ad-441d-89fa-a96700969ee3','1.0.29','section',7,'Flavors','flavors','channel',NULL,'flavors/_entry',1,'{\"1\":{\"id\":6,\"sectionId\":7,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"flavors/{slug}\",\"template\":\"flavors/_entry\",\"language\":\"en-us\"},\"2\":{\"id\":7,\"sectionId\":7,\"siteId\":2,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"flavors/{slug}\",\"template\":\"flavors/_entry\",\"language\":\"es\"}}','2022-01-06 14:18:18','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{entry.title}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{entry.url}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"plugindev\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"breadcrumb\":null,\"lastReviewed\":null,\"mainContentOfPage\":null,\"primaryImageOfPage\":null,\"relatedLink\":null,\"reviewedBy\":null,\"significantLink\":null,\"speakable\":null,\"specialty\":null,\"about\":null,\"abstract\":null,\"accessMode\":null,\"accessModeSufficient\":null,\"accessibilityAPI\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"accessibilityHazard\":null,\"accessibilitySummary\":null,\"accountablePerson\":null,\"acquireLicensePage\":null,\"aggregateRating\":null,\"alternativeHeadline\":null,\"associatedMedia\":null,\"audience\":null,\"audio\":null,\"author\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"award\":null,\"character\":null,\"citation\":null,\"comment\":null,\"commentCount\":null,\"conditionsOfAccess\":null,\"contentLocation\":null,\"contentRating\":null,\"contentReferenceTime\":null,\"contributor\":null,\"copyrightHolder\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"copyrightYear\":\"{entry.postDate | date(\\\"Y\\\")}\",\"correction\":null,\"creativeWorkStatus\":null,\"creator\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"dateCreated\":false,\"dateModified\":\"{entry.dateUpdated |atom}\",\"datePublished\":\"{entry.postDate |atom}\",\"discussionUrl\":null,\"editor\":null,\"educationalAlignment\":null,\"educationalUse\":null,\"encoding\":null,\"encodingFormat\":null,\"exampleOfWork\":null,\"expires\":null,\"funder\":null,\"genre\":null,\"hasPart\":null,\"headline\":\"{seomatic.meta.seoTitle}\",\"inLanguage\":\"{seomatic.meta.language}\",\"interactionStatistic\":null,\"interactivityType\":null,\"isAccessibleForFree\":null,\"isBasedOn\":null,\"isFamilyFriendly\":null,\"isPartOf\":null,\"keywords\":null,\"learningResourceType\":null,\"license\":null,\"locationCreated\":null,\"mainEntity\":null,\"maintainer\":null,\"material\":null,\"materialExtent\":null,\"mentions\":null,\"offers\":null,\"position\":null,\"producer\":null,\"provider\":null,\"publication\":null,\"publisher\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"publisherImprint\":null,\"publishingPrinciples\":null,\"recordedAt\":null,\"releasedEvent\":null,\"review\":null,\"schemaVersion\":null,\"sdDatePublished\":null,\"sdLicense\":null,\"sdPublisher\":null,\"sourceOrganization\":null,\"spatial\":null,\"spatialCoverage\":null,\"sponsor\":null,\"temporal\":null,\"temporalCoverage\":null,\"text\":null,\"thumbnailUrl\":null,\"timeRequired\":null,\"translationOfWork\":null,\"translator\":null,\"typicalAgeRange\":null,\"usageInfo\":null,\"version\":null,\"video\":null,\"workExample\":null,\"workTranslation\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{seomatic.site.siteLinksSearchTarget}\",\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(12,'2022-01-06 14:09:21','2022-01-06 14:18:18','b63f4a3c-52ea-47a7-9730-5353b34bb7f5','1.0.29','section',7,'Flavors','flavors','channel',NULL,'flavors/_entry',2,'{\"1\":{\"id\":6,\"sectionId\":7,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"flavors/{slug}\",\"template\":\"flavors/_entry\",\"language\":\"en-us\"},\"2\":{\"id\":7,\"sectionId\":7,\"siteId\":2,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"flavors/{slug}\",\"template\":\"flavors/_entry\",\"language\":\"es\"}}','2022-01-06 14:18:18','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{entry.title}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{entry.url}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"plugindev\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"breadcrumb\":null,\"lastReviewed\":null,\"mainContentOfPage\":null,\"primaryImageOfPage\":null,\"relatedLink\":null,\"reviewedBy\":null,\"significantLink\":null,\"speakable\":null,\"specialty\":null,\"about\":null,\"abstract\":null,\"accessMode\":null,\"accessModeSufficient\":null,\"accessibilityAPI\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"accessibilityHazard\":null,\"accessibilitySummary\":null,\"accountablePerson\":null,\"acquireLicensePage\":null,\"aggregateRating\":null,\"alternativeHeadline\":null,\"associatedMedia\":null,\"audience\":null,\"audio\":null,\"author\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"award\":null,\"character\":null,\"citation\":null,\"comment\":null,\"commentCount\":null,\"conditionsOfAccess\":null,\"contentLocation\":null,\"contentRating\":null,\"contentReferenceTime\":null,\"contributor\":null,\"copyrightHolder\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"copyrightYear\":\"{entry.postDate | date(\\\"Y\\\")}\",\"correction\":null,\"creativeWorkStatus\":null,\"creator\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"dateCreated\":false,\"dateModified\":\"{entry.dateUpdated |atom}\",\"datePublished\":\"{entry.postDate |atom}\",\"discussionUrl\":null,\"editor\":null,\"educationalAlignment\":null,\"educationalUse\":null,\"encoding\":null,\"encodingFormat\":null,\"exampleOfWork\":null,\"expires\":null,\"funder\":null,\"genre\":null,\"hasPart\":null,\"headline\":\"{seomatic.meta.seoTitle}\",\"inLanguage\":\"{seomatic.meta.language}\",\"interactionStatistic\":null,\"interactivityType\":null,\"isAccessibleForFree\":null,\"isBasedOn\":null,\"isFamilyFriendly\":null,\"isPartOf\":null,\"keywords\":null,\"learningResourceType\":null,\"license\":null,\"locationCreated\":null,\"mainEntity\":null,\"maintainer\":null,\"material\":null,\"materialExtent\":null,\"mentions\":null,\"offers\":null,\"position\":null,\"producer\":null,\"provider\":null,\"publication\":null,\"publisher\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"publisherImprint\":null,\"publishingPrinciples\":null,\"recordedAt\":null,\"releasedEvent\":null,\"review\":null,\"schemaVersion\":null,\"sdDatePublished\":null,\"sdLicense\":null,\"sdPublisher\":null,\"sourceOrganization\":null,\"spatial\":null,\"spatialCoverage\":null,\"sponsor\":null,\"temporal\":null,\"temporalCoverage\":null,\"text\":null,\"thumbnailUrl\":null,\"timeRequired\":null,\"translationOfWork\":null,\"translator\":null,\"typicalAgeRange\":null,\"usageInfo\":null,\"version\":null,\"video\":null,\"workExample\":null,\"workTranslation\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{seomatic.site.siteLinksSearchTarget}\",\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(13,'2022-01-06 14:46:05','2022-01-06 17:47:14','7b03b6ba-a166-445d-adce-ebaa28d6c67a','1.0.29','section',8,'Orders','orders','channel',NULL,'orders/_entry',1,'{\"1\":{\"id\":8,\"sectionId\":8,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"orders/{slug}\",\"template\":\"orders/_entry\",\"language\":\"en-us\"},\"2\":{\"id\":9,\"sectionId\":8,\"siteId\":2,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"orders/{slug}\",\"template\":\"orders/_entry\",\"language\":\"es\"}}','2022-01-06 17:47:14','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{entry.title}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{entry.url}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"plugindev\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"breadcrumb\":null,\"lastReviewed\":null,\"mainContentOfPage\":null,\"primaryImageOfPage\":null,\"relatedLink\":null,\"reviewedBy\":null,\"significantLink\":null,\"speakable\":null,\"specialty\":null,\"about\":null,\"abstract\":null,\"accessMode\":null,\"accessModeSufficient\":null,\"accessibilityAPI\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"accessibilityHazard\":null,\"accessibilitySummary\":null,\"accountablePerson\":null,\"acquireLicensePage\":null,\"aggregateRating\":null,\"alternativeHeadline\":null,\"associatedMedia\":null,\"audience\":null,\"audio\":null,\"author\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"award\":null,\"character\":null,\"citation\":null,\"comment\":null,\"commentCount\":null,\"conditionsOfAccess\":null,\"contentLocation\":null,\"contentRating\":null,\"contentReferenceTime\":null,\"contributor\":null,\"copyrightHolder\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"copyrightYear\":\"{entry.postDate | date(\\\"Y\\\")}\",\"correction\":null,\"creativeWorkStatus\":null,\"creator\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"dateCreated\":false,\"dateModified\":\"{entry.dateUpdated |atom}\",\"datePublished\":\"{entry.postDate |atom}\",\"discussionUrl\":null,\"editor\":null,\"educationalAlignment\":null,\"educationalUse\":null,\"encoding\":null,\"encodingFormat\":null,\"exampleOfWork\":null,\"expires\":null,\"funder\":null,\"genre\":null,\"hasPart\":null,\"headline\":\"{seomatic.meta.seoTitle}\",\"inLanguage\":\"{seomatic.meta.language}\",\"interactionStatistic\":null,\"interactivityType\":null,\"isAccessibleForFree\":null,\"isBasedOn\":null,\"isFamilyFriendly\":null,\"isPartOf\":null,\"keywords\":null,\"learningResourceType\":null,\"license\":null,\"locationCreated\":null,\"mainEntity\":null,\"maintainer\":null,\"material\":null,\"materialExtent\":null,\"mentions\":null,\"offers\":null,\"position\":null,\"producer\":null,\"provider\":null,\"publication\":null,\"publisher\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"publisherImprint\":null,\"publishingPrinciples\":null,\"recordedAt\":null,\"releasedEvent\":null,\"review\":null,\"schemaVersion\":null,\"sdDatePublished\":null,\"sdLicense\":null,\"sdPublisher\":null,\"sourceOrganization\":null,\"spatial\":null,\"spatialCoverage\":null,\"sponsor\":null,\"temporal\":null,\"temporalCoverage\":null,\"text\":null,\"thumbnailUrl\":null,\"timeRequired\":null,\"translationOfWork\":null,\"translator\":null,\"typicalAgeRange\":null,\"usageInfo\":null,\"version\":null,\"video\":null,\"workExample\":null,\"workTranslation\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{seomatic.site.siteLinksSearchTarget}\",\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(14,'2022-01-06 14:46:05','2022-01-06 17:47:14','331722e7-ba93-435c-b9a0-ce27d8a40d1b','1.0.29','section',8,'Orders','orders','channel',NULL,'orders/_entry',2,'{\"1\":{\"id\":8,\"sectionId\":8,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"orders/{slug}\",\"template\":\"orders/_entry\",\"language\":\"en-us\"},\"2\":{\"id\":9,\"sectionId\":8,\"siteId\":2,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"orders/{slug}\",\"template\":\"orders/_entry\",\"language\":\"es\"}}','2022-01-06 17:47:14','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{entry.title}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{entry.url}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{seomatic.meta.seoTitle}\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"{seomatic.meta.seoDescription}\",\"ogImage\":\"{seomatic.meta.seoImage}\",\"ogImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"ogImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"ogImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{seomatic.site.twitterHandle}\",\"twitterTitle\":\"{seomatic.meta.seoTitle}\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"{seomatic.meta.seoDescription}\",\"twitterImage\":\"{seomatic.meta.seoImage}\",\"twitterImageWidth\":\"{seomatic.meta.seoImageWidth}\",\"twitterImageHeight\":\"{seomatic.meta.seoImageHeight}\",\"twitterImageDescription\":\"{seomatic.meta.seoImageDescription}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"plugindev\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"breadcrumb\":null,\"lastReviewed\":null,\"mainContentOfPage\":null,\"primaryImageOfPage\":null,\"relatedLink\":null,\"reviewedBy\":null,\"significantLink\":null,\"speakable\":null,\"specialty\":null,\"about\":null,\"abstract\":null,\"accessMode\":null,\"accessModeSufficient\":null,\"accessibilityAPI\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"accessibilityHazard\":null,\"accessibilitySummary\":null,\"accountablePerson\":null,\"acquireLicensePage\":null,\"aggregateRating\":null,\"alternativeHeadline\":null,\"associatedMedia\":null,\"audience\":null,\"audio\":null,\"author\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"award\":null,\"character\":null,\"citation\":null,\"comment\":null,\"commentCount\":null,\"conditionsOfAccess\":null,\"contentLocation\":null,\"contentRating\":null,\"contentReferenceTime\":null,\"contributor\":null,\"copyrightHolder\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#identity\"},\"copyrightYear\":\"{entry.postDate | date(\\\"Y\\\")}\",\"correction\":null,\"creativeWorkStatus\":null,\"creator\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"dateCreated\":false,\"dateModified\":\"{entry.dateUpdated |atom}\",\"datePublished\":\"{entry.postDate |atom}\",\"discussionUrl\":null,\"editor\":null,\"educationalAlignment\":null,\"educationalUse\":null,\"encoding\":null,\"encodingFormat\":null,\"exampleOfWork\":null,\"expires\":null,\"funder\":null,\"genre\":null,\"hasPart\":null,\"headline\":\"{seomatic.meta.seoTitle}\",\"inLanguage\":\"{seomatic.meta.language}\",\"interactionStatistic\":null,\"interactivityType\":null,\"isAccessibleForFree\":null,\"isBasedOn\":null,\"isFamilyFriendly\":null,\"isPartOf\":null,\"keywords\":null,\"learningResourceType\":null,\"license\":null,\"locationCreated\":null,\"mainEntity\":null,\"maintainer\":null,\"material\":null,\"materialExtent\":null,\"mentions\":null,\"offers\":null,\"position\":null,\"producer\":null,\"provider\":null,\"publication\":null,\"publisher\":{\"id\":\"{parseEnv(seomatic.site.identity.genericUrl)}#creator\"},\"publisherImprint\":null,\"publishingPrinciples\":null,\"recordedAt\":null,\"releasedEvent\":null,\"review\":null,\"schemaVersion\":null,\"sdDatePublished\":null,\"sdLicense\":null,\"sdPublisher\":null,\"sourceOrganization\":null,\"spatial\":null,\"spatialCoverage\":null,\"sponsor\":null,\"temporal\":null,\"temporalCoverage\":null,\"text\":null,\"thumbnailUrl\":null,\"timeRequired\":null,\"translationOfWork\":null,\"translator\":null,\"typicalAgeRange\":null,\"usageInfo\":null,\"version\":null,\"video\":null,\"workExample\":null,\"workTranslation\":null,\"additionalType\":null,\"alternateName\":null,\"description\":\"{seomatic.meta.seoDescription}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{seomatic.meta.seoImage}\"},\"mainEntityOfPage\":\"{seomatic.meta.canonicalUrl}\",\"name\":\"{seomatic.meta.seoTitle}\",\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{seomatic.site.siteLinksSearchTarget}\",\"query-input\":\"{seomatic.helper.siteLinksQueryInput()}\"},\"sameAs\":null,\"subjectOf\":null,\"url\":\"{seomatic.meta.canonicalUrl}\",\"context\":\"http://schema.org\",\"type\":\"{seomatic.meta.mainEntityOfPage}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{seomatic.meta.seoTitle}\",\"siteName\":\"{seomatic.site.siteName}\",\"siteNamePosition\":\"{seomatic.meta.siteNamePosition}\",\"separatorChar\":\"{seomatic.config.separatorChar}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}');
/*!40000 ALTER TABLE `seomatic_metabundles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'default','2020-03-27 13:22:43','2022-01-19 17:33:22',NULL,'f89601e9-4ba9-4a48-9e99-350aa9914912');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,1,'English','default','en-US',1,'@web/',1,'2020-03-27 13:22:43','2021-03-15 15:02:45',NULL,'5da841b1-ca0d-46ff-8bb1-04d6c889ac54'),(2,1,0,1,'Spanish','spanish','es',1,'@web/es',2,'2021-03-15 15:02:36','2021-03-15 15:02:36','2022-01-19 17:32:39','ec473f07-152f-423b-90df-ac425e6068a1');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sprig_playgrounds`
--

LOCK TABLES `sprig_playgrounds` WRITE;
/*!40000 ALTER TABLE `sprig_playgrounds` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sprig_playgrounds` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,2,0,'2021-04-01 02:35:35','2022-01-19 17:36:03','49453ac8-b940-462b-9de9-8b45aa3efa99');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,NULL,'2021-04-01 02:35:21','2021-04-01 02:35:21','2022-01-19 17:36:03','720df5b4-5784-490a-b196-dcbd886a2803');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,'admin',NULL,NULL,'','','ryan@craftquest.io','$2y$13$EuMO1jWoObzUT.7T6IMJ4.U1GB2uIGV8LbrzGKT/HEimvXCPC65Ji',1,1,0,0,0,'2022-04-24 03:29:29',NULL,NULL,NULL,'2022-04-24 00:54:20',NULL,1,NULL,NULL,NULL,0,'2021-03-15 14:57:00','2020-03-27 13:22:44','2022-04-24 03:29:29');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Site','','2020-03-27 13:38:49','2020-03-27 13:38:49','06e0e3c7-6e7a-4bdd-8f29-c732a9b33766'),(2,NULL,NULL,'Temporary source',NULL,'2020-03-27 13:39:48','2020-03-27 13:39:48','2bb19851-ae57-499e-adf9-c1d0aec186ae'),(3,2,NULL,'user_1','user_1/','2020-03-27 13:39:48','2020-03-27 13:39:48','34f058d0-d16c-436b-8513-c46d815c95d0');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,7,'Site','site','site',NULL,NULL,'site',NULL,0,'2020-03-27 13:38:49','2022-01-19 18:08:49',NULL,'5c642d7e-b16b-4836-9575-668d75d242e5');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webperf_data_samples`
--

LOCK TABLES `webperf_data_samples` WRITE;
/*!40000 ALTER TABLE `webperf_data_samples` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `webperf_data_samples` VALUES (1,'2022-01-17 13:43:59','2022-01-17 13:44:04','a556ac82-3be3-4b94-a83b-6d6699c27523',7165646048945485054,1,'&#x1f6a7; Project | Homepage','http://localhost:8000/',NULL,NULL,NULL,3037,3110,3110,3128,7707,'??','Macintosh','Chrome 97.0.4692.71','OS X Catalina 10.15',0,3020,34,54,0,0,2986,506,8951416);
/*!40000 ALTER TABLE `webperf_data_samples` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webperf_error_samples`
--

LOCK TABLES `webperf_error_samples` WRITE;
/*!40000 ALTER TABLE `webperf_error_samples` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webperf_error_samples` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}',1,'2020-03-27 13:39:27','2020-03-27 13:39:27','2f8142d5-2827-4555-a01d-6febb92a5a37'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2020-03-27 13:39:27','2020-03-27 13:39:27','ce3eb9de-186b-4978-afa5-ec0ed9dc8ddb'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2020-03-27 13:39:27','2020-03-27 13:39:27','8fe2cacd-6ad5-45be-a48d-c9c9ba814765'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2020-03-27 13:39:27','2020-03-27 13:39:27','fc1f719e-cf8d-4f24-a58f-d980812b3b32');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-24  3:29:47
