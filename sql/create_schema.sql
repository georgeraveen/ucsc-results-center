-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 167.99.28.58    Database: results
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Current Database: `results`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `results` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `results`;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `text` varchar(512) DEFAULT NULL,
  `template` varchar(15) DEFAULT 'info',
  `autoDismiss` int(11) DEFAULT '1',
  `autoDismissDelay` int(11) DEFAULT '5000',
  `showAlways` int(11) DEFAULT '0',
  `deprication` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset`
--

DROP TABLE IF EXISTS `dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_subscriptions`
--

DROP TABLE IF EXISTS `event_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_subscriptions` (
  `fbid` varchar(45) NOT NULL,
  `event` varchar(45) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `uniquekey` (`fbid`,`event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facebook`
--

DROP TABLE IF EXISTS `facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facebook` (
  `id` varchar(100) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `fname` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `lname` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `link` varchar(1024) DEFAULT NULL,
  `short_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `picture` varchar(1024) DEFAULT NULL,
  `cover` varchar(1024) DEFAULT NULL,
  `index_number` int(11) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `power` int(11) DEFAULT '0',
  `handle` varchar(120) DEFAULT NULL,
  `lastvisit` varchar(256) DEFAULT NULL,
  `email` varchar(1024) DEFAULT NULL,
  `alternate_email` varchar(1024) DEFAULT NULL,
  `alert_version` varchar(45) DEFAULT '0',
  `psid` varchar(45) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `fbid` varchar(100) NOT NULL,
  `text` varchar(3000) CHARACTER SET utf8 NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL DEFAULT '',
  `code` varchar(20) NOT NULL DEFAULT '',
  `message` varchar(1500) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `data` varchar(3000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=742 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messnger_subscription_tokens`
--

DROP TABLE IF EXISTS `messnger_subscription_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messnger_subscription_tokens` (
  `tokenId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(45) NOT NULL,
  `token` varchar(45) NOT NULL,
  `expirydate` bigint(12) DEFAULT NULL,
  PRIMARY KEY (`tokenId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index` int(11) NOT NULL,
  `subject` varchar(15) NOT NULL,
  `grade` varchar(3) NOT NULL,
  `examYear` int(11) NOT NULL,
  `dataset` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_RES_TO_DS_idx` (`dataset`),
  KEY `FK_RES_TO_SUB_idx` (`subject`),
  CONSTRAINT `FK_RES_TO_DS` FOREIGN KEY (`dataset`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RES_TO_SUB` FOREIGN KEY (`subject`) REFERENCES `subject` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35522 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statistic`
--

DROP TABLE IF EXISTS `statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL DEFAULT '',
  `value` bigint(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `code` varchar(15) NOT NULL,
  `name` varchar(90) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `nonGpaCredits` int(11) DEFAULT '0',
  `stream` int(11) DEFAULT '0',
  `optional` int(11) DEFAULT '1',
  `checksum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmptable_1`
--

DROP TABLE IF EXISTS `tmptable_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmptable_1` (
  `code` varchar(15) NOT NULL,
  `name` varchar(90) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `nonGpaCredits` int(11) DEFAULT '0',
  `stream` int(11) DEFAULT '0',
  `optional` int(11) DEFAULT '1',
  `checksum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `undergraduate`
--

DROP TABLE IF EXISTS `undergraduate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `undergraduate` (
  `indexNumber` int(11) unsigned NOT NULL,
  `privacy` varchar(10) DEFAULT 'public',
  `fbid` varchar(100) DEFAULT NULL,
  `gpa` float DEFAULT '0',
  `gpa_diff` float DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  `rank_diff` int(11) DEFAULT '0',
  `credits` int(11) DEFAULT '0',
  `credits_non_gpa` int(11) DEFAULT '0',
  `updated_date` varchar(250) DEFAULT '-1',
  `y1s1_gpa` float DEFAULT NULL,
  `y1s1_rank` int(11) DEFAULT NULL,
  `y1s1_credits` int(11) DEFAULT NULL,
  `y1s1_credits_non_gpa` int(11) DEFAULT NULL,
  `y1s2_gpa` float DEFAULT NULL,
  `y1s2_rank` int(11) DEFAULT NULL,
  `y1s2_credits` int(11) DEFAULT NULL,
  `y1s2_credits_non_gpa` int(11) DEFAULT NULL,
  `y2s1_gpa` float DEFAULT NULL,
  `y2s1_rank` int(11) DEFAULT NULL,
  `y2s1_credits` int(11) DEFAULT NULL,
  `y2s1_credits_non_gpa` int(11) DEFAULT NULL,
  `y2s2_gpa` float DEFAULT NULL,
  `y2s2_rank` int(11) DEFAULT NULL,
  `y2s2_credits` int(11) DEFAULT NULL,
  `y2s2_credits_non_gpa` int(11) DEFAULT NULL,
  `y3s1_gpa` float DEFAULT NULL,
  `y3s1_rank` int(11) DEFAULT NULL,
  `y3s1_credits` int(11) DEFAULT NULL,
  `y3s1_credits_non_gpa` int(11) DEFAULT NULL,
  `y3s2_gpa` float DEFAULT NULL,
  `y3s2_rank` int(11) DEFAULT NULL,
  `y3s2_credits` int(11) DEFAULT NULL,
  `y3s2_credits_non_gpa` int(11) DEFAULT NULL,
  `y4s1_gpa` float DEFAULT NULL,
  `y4s1_rank` int(11) DEFAULT NULL,
  `y4s1_credits` int(11) DEFAULT NULL,
  `y4s1_credits_non_gpa` int(11) DEFAULT NULL,
  `y4s2_gpa` float DEFAULT NULL,
  `y4s2_rank` int(11) DEFAULT NULL,
  `y4s2_credits` int(11) DEFAULT NULL,
  `y4s2_credits_non_gpa` int(11) DEFAULT NULL,
  `user_showcase` int(11) DEFAULT '0',
  PRIMARY KEY (`indexNumber`),
  UNIQUE KEY `FBID_UNDERGRADUATE` (`fbid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sysadmin`@`%`*/ /*!50003 TRIGGER `updateOverallGPA`
    BEFORE UPDATE ON `undergraduate`
    FOR EACH ROW
BEGIN
	DECLARE calculatedGpa FLOAT;
    IF (OLD.updated_date = NEW.updated_date) THEN
		SET calculatedGpa = (
														(coalesce(NEW.y1s1_gpa, 0) * coalesce(NEW.y1s1_credits, 0)) +
														(coalesce(NEW.y1s2_gpa, 0) * coalesce(NEW.y1s2_credits, 0)) +
														(coalesce(NEW.y2s1_gpa, 0) * coalesce(NEW.y2s1_credits, 0)) +
														(coalesce(NEW.y2s2_gpa, 0) * coalesce(NEW.y2s2_credits, 0)) +
														(coalesce(NEW.y3s1_gpa, 0) * coalesce(NEW.y3s1_credits, 0)) +
														(coalesce(NEW.y3s2_gpa, 0) * coalesce(NEW.y3s2_credits, 0)) +
														(coalesce(NEW.y4s1_gpa, 0) * coalesce(NEW.y4s1_credits, 0)) +
														(coalesce(NEW.y4s2_gpa, 0) * coalesce(NEW.y4s2_credits, 0))
													) / (
														coalesce(NEW.y1s1_credits, 0) + 
														coalesce(NEW.y1s2_credits, 0) + 
														coalesce(NEW.y2s1_credits, 0) + 
														coalesce(NEW.y2s2_credits, 0) + 
														coalesce(NEW.y3s1_credits, 0) + 
														coalesce(NEW.y3s2_credits, 0) + 
														coalesce(NEW.y4s1_credits, 0) + 
														coalesce(NEW.y4s2_credits, 0)
													);
                                                    
        SET NEW.gpa = calculatedGpa;
		SET NEW.credits = (
														coalesce(NEW.y1s1_credits, 0) + 
														coalesce(NEW.y1s2_credits, 0) + 
														coalesce(NEW.y2s1_credits, 0) + 
														coalesce(NEW.y2s2_credits, 0) + 
														coalesce(NEW.y3s1_credits, 0) + 
														coalesce(NEW.y3s2_credits, 0) + 
														coalesce(NEW.y4s1_credits, 0) + 
														coalesce(NEW.y4s2_credits, 0)
													);
		SET NEW.credits_non_gpa = (
														coalesce(NEW.y1s1_credits_non_gpa, 0) + 
														coalesce(NEW.y1s2_credits_non_gpa, 0) + 
														coalesce(NEW.y2s1_credits_non_gpa, 0) + 
														coalesce(NEW.y2s2_credits_non_gpa, 0) + 
														coalesce(NEW.y3s1_credits_non_gpa, 0) + 
														coalesce(NEW.y3s2_credits_non_gpa, 0) + 
														coalesce(NEW.y4s1_credits_non_gpa, 0) + 
														coalesce(NEW.y4s2_credits_non_gpa, 0)
													);
	    SET NEW.updated_date = NOW();
        
        IF (OLD.gpa != calculatedGpa) THEN
			SET NEW.gpa_diff = calculatedGpa - coalesce(OLD.gpa, 0);
		END IF;
        
        IF (OLD.rank != NEW.rank) THEN
			SET NEW.rank_diff = coalesce(NEW.RANK, 0) - coalesce(OLD.rank, 0);
		END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'results'
--

--
-- Dumping routines for database 'results'
--
/*!50003 DROP FUNCTION IF EXISTS `accessControl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sysadmin`@`%` FUNCTION `accessControl`(requestorIndex INT, requesteeIndex INT) RETURNS int(11)
BEGIN
	DECLARE privacyCode VARCHAR(20);
    
    -- Assign variables
    SELECT `privacy` INTO privacyCode FROM `undergraduate` WHERE `indexNumber`=requesteeIndex;
    
    -- Check 
    CASE privacyCode
		WHEN 'public' THEN RETURN 1;
		WHEN 'private' THEN
			BEGIN
				IF requestorIndex = requesteeIndex THEN
					RETURN 1; 
				ELSE 
					RETURN 0;
                END IF;
            END;
		WHEN 'shared' THEN
			BEGIN
				IF SUBSTRING(requestorIndex,1,2) = SUBSTRING(requesteeIndex,1,2) THEN
					RETURN 1; 
				ELSE 
					RETURN 0;
                END IF;
            END;
        ELSE RETURN 1;
	END CASE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isBest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sysadmin`@`%` FUNCTION `isBest`( resultId INT) RETURNS int(11)
BEGIN
	DECLARE userIndexNumber INT;
	DECLARE subjectCode VARCHAR(20);
	DECLARE currentGrade VARCHAR(20);
	DECLARE currentExamYear INT;
    DECLARE perfectMatch INT;
    
    -- Assign variables
    SELECT `index`, `subject`, `grade`, `examYear` INTO userIndexNumber, subjectCode, currentGrade, currentExamYear FROM `result` WHERE `id`=resultId;
    
    -- Matching
    SELECT `grade` = currentGrade AND `examYear` = currentExamYear INTO perfectMatch
    FROM `result` WHERE `index` = userIndexNumber AND `subject` = subjectCode order by case 
		WHEN `grade`='A+' THEN 4.25  
		WHEN `grade`='A'   THEN 4.0 
		WHEN `grade`='A-'  THEN 3.75 

		WHEN `grade`='B+' THEN 3.25 
		WHEN `grade`='B' 	 THEN 3.0 
		WHEN `grade`='B-'  THEN 2.75 

		WHEN `grade`='C+' THEN 2.25
		WHEN `grade`='C'   THEN 2.0
		WHEN `grade`='C-'  THEN 1.75

		WHEN `grade`='D+' THEN 1.25 
		WHEN `grade`='D'   THEN 1.0 
		WHEN `grade`='D-'  THEN 0.75

		WHEN `grade`='E' THEN 0.5 
		WHEN `grade`='F' THEN 0.4
		
		ELSE 0 
    END
	DESC LIMIT 1;

	RETURN perfectMatch;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ranker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sysadmin`@`%` PROCEDURE `ranker`(IN con VARCHAR(20))
BEGIN
  SELECT con FROM undergraduate WHERE indexNumber LIKE '1400%';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `subjectwise_stat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sulochanak`@`%` PROCEDURE `subjectwise_stat`(IN subjectCode VARCHAR(12), IN pattern VARCHAR(2))
BEGIN
	DECLARE total INT;
	DECLARE total_all INT;
	SELECT COUNT(grade) INTO total FROM result WHERE `subject`= subjectCode AND `index` LIKE CONCAT(pattern, '%');
	SELECT COUNT(grade) INTO total_all FROM result WHERE `subject`= subjectCode;
	SELECT B.`grade`, A.`batch_count`, A.`batch_perc`, B.`overall_count`, B.`overall_perc` FROM (
		SELECT COUNT(grade) as overall_count, COUNT(grade)*100/total_all as overall_perc, grade FROM result WHERE `subject`= subjectCode GROUP BY grade
	) as B
    LEFT JOIN (
		SELECT COUNT(grade) as batch_count, COUNT(grade)*100/total as batch_perc, grade FROM result WHERE `subject`= subjectCode AND `index` LIKE CONCAT(pattern, '%') GROUP BY grade
	) as A
    ON B.`grade` =  A.`grade`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `resultsdev`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `resultsdev` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `resultsdev`;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `text` varchar(512) DEFAULT NULL,
  `template` varchar(15) DEFAULT 'info',
  `autoDismiss` int(11) DEFAULT '1',
  `autoDismissDelay` int(11) DEFAULT '5000',
  `showAlways` int(11) DEFAULT '0',
  `deprication` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset`
--

DROP TABLE IF EXISTS `dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_subscriptions`
--

DROP TABLE IF EXISTS `event_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_subscriptions` (
  `fbid` varchar(45) NOT NULL,
  `event` varchar(45) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `uniquekey` (`fbid`,`event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facebook`
--

DROP TABLE IF EXISTS `facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facebook` (
  `id` varchar(100) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `fname` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `lname` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `link` varchar(1024) DEFAULT NULL,
  `short_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `picture` varchar(1024) DEFAULT NULL,
  `cover` varchar(1024) DEFAULT NULL,
  `index_number` int(11) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `power` int(11) DEFAULT '0',
  `handle` varchar(120) DEFAULT NULL,
  `lastvisit` varchar(256) DEFAULT NULL,
  `email` varchar(1024) DEFAULT NULL,
  `alternate_email` varchar(1024) DEFAULT NULL,
  `alert_version` varchar(45) DEFAULT '0',
  `psid` varchar(45) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `fbid` varchar(100) NOT NULL,
  `text` varchar(3000) CHARACTER SET utf8 NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL DEFAULT '',
  `code` varchar(20) NOT NULL DEFAULT '',
  `message` varchar(1500) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `data` varchar(3000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messnger_subscription_tokens`
--

DROP TABLE IF EXISTS `messnger_subscription_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messnger_subscription_tokens` (
  `tokenId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(45) NOT NULL,
  `token` varchar(45) NOT NULL,
  `expirydate` bigint(12) DEFAULT NULL,
  PRIMARY KEY (`tokenId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index` int(11) NOT NULL,
  `subject` varchar(15) NOT NULL,
  `grade` varchar(3) NOT NULL,
  `examYear` int(11) NOT NULL,
  `dataset` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_RES_TO_DS_idx` (`dataset`),
  KEY `FK_RES_TO_SUB_idx` (`subject`),
  CONSTRAINT `FK_RES_TO_DS` FOREIGN KEY (`dataset`) REFERENCES `dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RES_TO_SUB` FOREIGN KEY (`subject`) REFERENCES `subject` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34336 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statistic`
--

DROP TABLE IF EXISTS `statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL DEFAULT '',
  `value` bigint(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `code` varchar(15) NOT NULL,
  `name` varchar(90) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `nonGpaCredits` int(11) DEFAULT '0',
  `stream` int(11) DEFAULT '0',
  `optional` int(11) DEFAULT '1',
  `checksum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `undergraduate`
--

DROP TABLE IF EXISTS `undergraduate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `undergraduate` (
  `indexNumber` int(11) unsigned NOT NULL,
  `privacy` varchar(10) DEFAULT 'public',
  `fbid` varchar(100) DEFAULT NULL,
  `gpa` float DEFAULT '0',
  `gpa_diff` float DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  `rank_diff` int(11) DEFAULT '0',
  `credits` int(11) DEFAULT '0',
  `credits_non_gpa` int(11) DEFAULT '0',
  `updated_date` varchar(250) DEFAULT '-1',
  `y1s1_gpa` float DEFAULT NULL,
  `y1s1_rank` int(11) DEFAULT NULL,
  `y1s1_credits` int(11) DEFAULT NULL,
  `y1s1_credits_non_gpa` int(11) DEFAULT NULL,
  `y1s2_gpa` float DEFAULT NULL,
  `y1s2_rank` int(11) DEFAULT NULL,
  `y1s2_credits` int(11) DEFAULT NULL,
  `y1s2_credits_non_gpa` int(11) DEFAULT NULL,
  `y2s1_gpa` float DEFAULT NULL,
  `y2s1_rank` int(11) DEFAULT NULL,
  `y2s1_credits` int(11) DEFAULT NULL,
  `y2s1_credits_non_gpa` int(11) DEFAULT NULL,
  `y2s2_gpa` float DEFAULT NULL,
  `y2s2_rank` int(11) DEFAULT NULL,
  `y2s2_credits` int(11) DEFAULT NULL,
  `y2s2_credits_non_gpa` int(11) DEFAULT NULL,
  `y3s1_gpa` float DEFAULT NULL,
  `y3s1_rank` int(11) DEFAULT NULL,
  `y3s1_credits` int(11) DEFAULT NULL,
  `y3s1_credits_non_gpa` int(11) DEFAULT NULL,
  `y3s2_gpa` float DEFAULT NULL,
  `y3s2_rank` int(11) DEFAULT NULL,
  `y3s2_credits` int(11) DEFAULT NULL,
  `y3s2_credits_non_gpa` int(11) DEFAULT NULL,
  `y4s1_gpa` float DEFAULT NULL,
  `y4s1_rank` int(11) DEFAULT NULL,
  `y4s1_credits` int(11) DEFAULT NULL,
  `y4s1_credits_non_gpa` int(11) DEFAULT NULL,
  `y4s2_gpa` float DEFAULT NULL,
  `y4s2_rank` int(11) DEFAULT NULL,
  `y4s2_credits` int(11) DEFAULT NULL,
  `y4s2_credits_non_gpa` int(11) DEFAULT NULL,
  `user_showcase` int(11) DEFAULT '0',
  PRIMARY KEY (`indexNumber`),
  UNIQUE KEY `FBID_UNDERGRADUATE` (`fbid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sysadmin`@`%`*/ /*!50003 TRIGGER `updateOverallGPA`
    BEFORE UPDATE ON `undergraduate`
    FOR EACH ROW
BEGIN
	DECLARE calculatedGpa FLOAT;
    IF (OLD.updated_date = NEW.updated_date) THEN
		SET calculatedGpa = (
														(coalesce(NEW.y1s1_gpa, 0) * coalesce(NEW.y1s1_credits, 0)) +
														(coalesce(NEW.y1s2_gpa, 0) * coalesce(NEW.y1s2_credits, 0)) +
														(coalesce(NEW.y2s1_gpa, 0) * coalesce(NEW.y2s1_credits, 0)) +
														(coalesce(NEW.y2s2_gpa, 0) * coalesce(NEW.y2s2_credits, 0)) +
														(coalesce(NEW.y3s1_gpa, 0) * coalesce(NEW.y3s1_credits, 0)) +
														(coalesce(NEW.y3s2_gpa, 0) * coalesce(NEW.y3s2_credits, 0)) +
														(coalesce(NEW.y4s1_gpa, 0) * coalesce(NEW.y4s1_credits, 0)) +
														(coalesce(NEW.y4s2_gpa, 0) * coalesce(NEW.y4s2_credits, 0))
													) / (
														coalesce(NEW.y1s1_credits, 0) + 
														coalesce(NEW.y1s2_credits, 0) + 
														coalesce(NEW.y2s1_credits, 0) + 
														coalesce(NEW.y2s2_credits, 0) + 
														coalesce(NEW.y3s1_credits, 0) + 
														coalesce(NEW.y3s2_credits, 0) + 
														coalesce(NEW.y4s1_credits, 0) + 
														coalesce(NEW.y4s2_credits, 0)
													);
                                                    
        SET NEW.gpa = calculatedGpa;
		SET NEW.credits = (
														coalesce(NEW.y1s1_credits, 0) + 
														coalesce(NEW.y1s2_credits, 0) + 
														coalesce(NEW.y2s1_credits, 0) + 
														coalesce(NEW.y2s2_credits, 0) + 
														coalesce(NEW.y3s1_credits, 0) + 
														coalesce(NEW.y3s2_credits, 0) + 
														coalesce(NEW.y4s1_credits, 0) + 
														coalesce(NEW.y4s2_credits, 0)
													);
		SET NEW.credits_non_gpa = (
														coalesce(NEW.y1s1_credits_non_gpa, 0) + 
														coalesce(NEW.y1s2_credits_non_gpa, 0) + 
														coalesce(NEW.y2s1_credits_non_gpa, 0) + 
														coalesce(NEW.y2s2_credits_non_gpa, 0) + 
														coalesce(NEW.y3s1_credits_non_gpa, 0) + 
														coalesce(NEW.y3s2_credits_non_gpa, 0) + 
														coalesce(NEW.y4s1_credits_non_gpa, 0) + 
														coalesce(NEW.y4s2_credits_non_gpa, 0)
													);
	    SET NEW.updated_date = NOW();
        
        IF (OLD.gpa != calculatedGpa) THEN
			SET NEW.gpa_diff = calculatedGpa - coalesce(OLD.gpa, 0);
		END IF;
        
        IF (OLD.rank != NEW.rank) THEN
			SET NEW.rank_diff = coalesce(NEW.RANK, 0) - coalesce(OLD.rank, 0);
		END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'resultsdev'
--

--
-- Dumping routines for database 'resultsdev'
--
/*!50003 DROP FUNCTION IF EXISTS `accessControl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sysadmin`@`%` FUNCTION `accessControl`(requestorIndex INT, requesteeIndex INT) RETURNS int(11)
BEGIN
	DECLARE privacyCode VARCHAR(20);
    
    -- Assign variables
    SELECT `privacy` INTO privacyCode FROM `undergraduate` WHERE `indexNumber`=requesteeIndex;
    
    -- Check 
    CASE privacyCode
		WHEN 'public' THEN RETURN 1;
		WHEN 'private' THEN
			BEGIN
				IF requestorIndex = requesteeIndex THEN
					RETURN 1; 
				ELSE 
					RETURN 0;
                END IF;
            END;
		WHEN 'shared' THEN
			BEGIN
				IF SUBSTRING(requestorIndex,1,2) = SUBSTRING(requesteeIndex,1,2) THEN
					RETURN 1; 
				ELSE 
					RETURN 0;
                END IF;
            END;
        ELSE RETURN 1;
	END CASE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isBest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sysadmin`@`%` FUNCTION `isBest`( resultId INT) RETURNS int(11)
BEGIN
	DECLARE userIndexNumber INT;
	DECLARE subjectCode VARCHAR(20);
	DECLARE currentGrade VARCHAR(20);
	DECLARE currentExamYear INT;
    DECLARE perfectMatch INT;
    
    -- Assign variables
    SELECT `index`, `subject`, `grade`, `examYear` INTO userIndexNumber, subjectCode, currentGrade, currentExamYear FROM `result` WHERE `id`=resultId;
    
    -- Matching
    SELECT `grade` = currentGrade AND `examYear` = currentExamYear INTO perfectMatch
    FROM `result` WHERE `index` = userIndexNumber AND `subject` = subjectCode order by case 
		WHEN `grade`='A+' THEN 4.25  
		WHEN `grade`='A'   THEN 4.0 
		WHEN `grade`='A-'  THEN 3.75 

		WHEN `grade`='B+' THEN 3.25 
		WHEN `grade`='B' 	 THEN 3.0 
		WHEN `grade`='B-'  THEN 2.75 

		WHEN `grade`='C+' THEN 2.25
		WHEN `grade`='C'   THEN 2.0
		WHEN `grade`='C-'  THEN 1.75

		WHEN `grade`='D+' THEN 1.25 
		WHEN `grade`='D'   THEN 1.0 
		WHEN `grade`='D-'  THEN 0.75

		WHEN `grade`='E' THEN 0.5 
		WHEN `grade`='F' THEN 0.4
		
		ELSE 0 
    END
	DESC LIMIT 1;

	RETURN perfectMatch;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ranker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sysadmin`@`%` PROCEDURE `ranker`(IN con VARCHAR(20))
BEGIN
  SELECT con FROM undergraduate WHERE indexNumber LIKE '1400%';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `subjectwise_stat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sulochanak`@`%` PROCEDURE `subjectwise_stat`(IN subjectCode VARCHAR(12), IN pattern VARCHAR(2))
BEGIN
	DECLARE total INT;
	DECLARE total_all INT;
	SELECT COUNT(grade) INTO total FROM result WHERE `subject`= subjectCode AND `index` LIKE CONCAT(pattern, '%');
	SELECT COUNT(grade) INTO total_all FROM result WHERE `subject`= subjectCode;
	SELECT B.`grade`, A.`batch_count`, A.`batch_perc`, B.`overall_count`, B.`overall_perc` FROM (
		SELECT COUNT(grade) as overall_count, COUNT(grade)*100/total_all as overall_perc, grade FROM result WHERE `subject`= subjectCode GROUP BY grade
	) as B
    LEFT JOIN (
		SELECT COUNT(grade) as batch_count, COUNT(grade)*100/total as batch_perc, grade FROM result WHERE `subject`= subjectCode AND `index` LIKE CONCAT(pattern, '%') GROUP BY grade
	) as A
    ON B.`grade` =  A.`grade`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-26 21:10:45
