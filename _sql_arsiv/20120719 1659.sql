-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.51-community-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema shop2
--

CREATE DATABASE IF NOT EXISTS shop2;
USE shop2;

--
-- Temporary table structure for view `view_dosyalar_kategori`
--
DROP TABLE IF EXISTS `view_dosyalar_kategori`;
DROP VIEW IF EXISTS `view_dosyalar_kategori`;
CREATE TABLE `view_dosyalar_kategori` (
  `id` int(11),
  `tip` varchar(5),
  `ad` varchar(255),
  `ust_kategori_id` bigint(11),
  `ust_kategori_baslik` varchar(255)
);

--
-- Temporary table structure for view `view_kategoriler`
--
DROP TABLE IF EXISTS `view_kategoriler`;
DROP VIEW IF EXISTS `view_kategoriler`;
CREATE TABLE `view_kategoriler` (
  `id` int(11),
  `dil_id` int(11),
  `ad` varchar(255),
  `ust_kategori_id` bigint(11),
  `ust_kategori_baslik` varchar(255)
);

--
-- Temporary table structure for view `view_sayfa`
--
DROP TABLE IF EXISTS `view_sayfa`;
DROP VIEW IF EXISTS `view_sayfa`;
CREATE TABLE `view_sayfa` (
  `text_id` int(11),
  `dil` varchar(255),
  `sabitler_id` int(11),
  `sabit` varchar(500),
  `text` varchar(500),
  `sayfa` varchar(255),
  `onay` varchar(5)
);

--
-- Temporary table structure for view `view_sayfa_kontrol`
--
DROP TABLE IF EXISTS `view_sayfa_kontrol`;
DROP VIEW IF EXISTS `view_sayfa_kontrol`;
CREATE TABLE `view_sayfa_kontrol` (
  `text_id` bigint(11),
  `sonuc` varchar(3),
  `sabitler_id` int(11),
  `sayfa` varchar(255),
  `dil` varchar(255),
  `sabit` varchar(500),
  `text` varchar(500),
  `onay` varchar(5)
);

--
-- Temporary table structure for view `view_siparis_durumlar`
--
DROP TABLE IF EXISTS `view_siparis_durumlar`;
DROP VIEW IF EXISTS `view_siparis_durumlar`;
CREATE TABLE `view_siparis_durumlar` (
  `text_id` int(11),
  `dil` varchar(255),
  `sabitler_id` int(11),
  `sabit` varchar(255),
  `text` varchar(255),
  `onay` varchar(5)
);

--
-- Temporary table structure for view `view_siparis_durumlar_kontrol`
--
DROP TABLE IF EXISTS `view_siparis_durumlar_kontrol`;
DROP VIEW IF EXISTS `view_siparis_durumlar_kontrol`;
CREATE TABLE `view_siparis_durumlar_kontrol` (
  `text_id` bigint(11),
  `sonuc` varchar(3),
  `siparis_durum_id` int(11),
  `dil` varchar(255),
  `sabit` varchar(255),
  `text` varchar(500),
  `onay` varchar(5)
);

--
-- Temporary table structure for view `view_tablo_detaylari`
--
DROP TABLE IF EXISTS `view_tablo_detaylari`;
DROP VIEW IF EXISTS `view_tablo_detaylari`;
CREATE TABLE `view_tablo_detaylari` (
  `TABLE_NAME` varchar(64),
  `TABLE_TYPE` varchar(64),
  `ENGINE` varchar(64),
  `ROW_FORMAT` varchar(10),
  `TABLE_ROWS` bigint(21) unsigned,
  `AVG_ROW_LENGTH` bigint(21) unsigned,
  `INDEX_LENGTH` bigint(21) unsigned,
  `AUTO_INCREMENT` bigint(21) unsigned,
  `CREATE_TIME` datetime,
  `UPDATE_TIME` datetime,
  `CHECK_TIME` datetime,
  `TABLE_COLLATION` varchar(32),
  `CREATE_OPTIONS` varchar(255),
  `TABLE_COMMENT` varchar(80)
);

--
-- Temporary table structure for view `view_text`
--
DROP TABLE IF EXISTS `view_text`;
DROP VIEW IF EXISTS `view_text`;
CREATE TABLE `view_text` (
  `text_id` int(11),
  `dil` varchar(255),
  `sabitler_id` int(11),
  `sabit` varchar(500),
  `text` varchar(500),
  `onay` varchar(5)
);

--
-- Temporary table structure for view `view_text-sayfa_kontrol`
--
DROP TABLE IF EXISTS `view_text-sayfa_kontrol`;
DROP VIEW IF EXISTS `view_text-sayfa_kontrol`;
CREATE TABLE `view_text-sayfa_kontrol` (
  `text_id` bigint(11),
  `sonuc` varchar(3),
  `sabitler_id` int(11),
  `tip` varchar(3),
  `sayfa` varchar(255),
  `dil` varchar(255),
  `sabit` varchar(500),
  `text` varchar(500),
  `onay` varchar(5)
);

--
-- Temporary table structure for view `view_text_kontrol`
--
DROP TABLE IF EXISTS `view_text_kontrol`;
DROP VIEW IF EXISTS `view_text_kontrol`;
CREATE TABLE `view_text_kontrol` (
  `text_id` bigint(11),
  `sonuc` varchar(3),
  `sabitler_id` int(11),
  `dil` varchar(255),
  `sabit` varchar(500),
  `text` varchar(500),
  `onay` varchar(5)
);

--
-- Definition of table `tbl_adminler`
--

DROP TABLE IF EXISTS `tbl_adminler`;
CREATE TABLE `tbl_adminler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_soyad` varchar(255) NOT NULL DEFAULT '',
  `kullanici_adi` varchar(150) NOT NULL DEFAULT '',
  `sifre` varchar(36) NOT NULL DEFAULT '',
  `root` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 ise hayır, 1 ise evet',
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT '-1' COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT '-1' COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `kullanici_adi` (`kullanici_adi`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `onay` (`onay`),
  KEY `root` (`root`),
  CONSTRAINT `fk_adminler_admin_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_adminler_admin_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_adminler`
--

/*!40000 ALTER TABLE `tbl_adminler` DISABLE KEYS */;
INSERT INTO `tbl_adminler` (`id`,`ad_soyad`,`kullanici_adi`,`sifre`,`root`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (999,'Fatih ÜNAL','q','5353F8D9D31D435F9D49BDA3968DC7B3',1,1,999,'2011-12-19 23:11:57',999,'2012-01-31 02:33:07'),
 (1000,'a','a','9D57FB95A81A6E8BFF8151DA93F1EFED',0,1,999,'2011-12-28 02:08:10',999,'2012-01-31 02:33:04'),
 (1002,'de','de','1CCD9D33F495CBC2DFFAF76938EE912C',0,1,999,'2012-01-24 00:52:46',999,'2012-01-24 00:53:07');
/*!40000 ALTER TABLE `tbl_adminler` ENABLE KEYS */;


--
-- Definition of trigger `trg_admin_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_admin_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_admin_ek` BEFORE INSERT ON `tbl_adminler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_admin_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_admin_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_admin_gun` BEFORE UPDATE ON `tbl_adminler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_all_http`
--

DROP TABLE IF EXISTS `tbl_all_http`;
CREATE TABLE `tbl_all_http` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tablo` varchar(60) DEFAULT NULL,
  `kayit_id` int(11) DEFAULT NULL,
  `tarih` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `ALL_HTTP` longtext,
  `ALL_RAW` longtext,
  `APPL_MD_PATH` longtext,
  `APPL_PHYSICAL_PATH` longtext,
  `AUTH_TYPE` longtext,
  `AUTH_USER` longtext,
  `AUTH_PASSWORD` longtext,
  `LOGON_USER` longtext,
  `REMOTE_USER` longtext,
  `CERT_COOKIE` longtext,
  `CERT_FLAGS` longtext,
  `CERT_ISSUER` longtext,
  `CERT_KEYSIZE` longtext,
  `CERT_SECRETKEYSIZE` longtext,
  `CERT_SERIALNUMBER` longtext,
  `CERT_SERVER_ISSUER` longtext,
  `CERT_SERVER_SUBJECT` longtext,
  `CERT_SUBJECT` longtext,
  `CONTENT_LENGTH` longtext,
  `CONTENT_TYPE` longtext,
  `GATEWAY_INTERFACE` longtext,
  `HTTPS` varchar(3) DEFAULT '',
  `HTTPS_KEYSIZE` longtext,
  `HTTPS_SECRETKEYSIZE` longtext,
  `HTTPS_SERVER_ISSUER` longtext,
  `HTTPS_SERVER_SUBJECT` longtext,
  `INSTANCE_ID` varchar(20) DEFAULT NULL,
  `INSTANCE_META_PATH` longtext,
  `LOCAL_ADDR` longtext,
  `PATH_INFO` longtext,
  `PATH_TRANSLATED` longtext,
  `QUERY_STRING` longtext,
  `REMOTE_ADDR` longtext,
  `REMOTE_HOST` longtext,
  `REMOTE_PORT` varchar(6) DEFAULT NULL,
  `REQUEST_METHOD` varchar(5) DEFAULT NULL,
  `SCRIPT_NAME` longtext,
  `SERVER_NAME` longtext,
  `SERVER_PORT` varchar(6) DEFAULT NULL,
  `SERVER_PORT_SECURE` varchar(6) DEFAULT NULL,
  `SERVER_PROTOCOL` longtext,
  `SERVER_SOFTWARE` longtext,
  `URL` longtext,
  `HTTP_CONNECTION` longtext,
  `HTTP_ACCEPT` longtext,
  `HTTP_ACCEPT_CHARSET` longtext,
  `HTTP_ACCEPT_ENCODING` longtext,
  `HTTP_ACCEPT_LANGUAGE` longtext,
  `HTTP_COOKIE` longtext,
  `HTTP_HOST` longtext,
  `HTTP_USER_AGENT` longtext,
  `ULKE` varchar(255) DEFAULT NULL,
  `ULKE_KOD` varchar(10) DEFAULT NULL,
  `IL` varchar(255) DEFAULT NULL,
  `LAT` decimal(10,8) DEFAULT NULL,
  `LON` decimal(10,8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `tarih` (`tarih`),
  KEY `kayit_id` (`kayit_id`),
  KEY `tablo` (`tablo`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_all_http`
--

/*!40000 ALTER TABLE `tbl_all_http` DISABLE KEYS */;
INSERT INTO `tbl_all_http` (`id`,`tablo`,`kayit_id`,`tarih`,`ALL_HTTP`,`ALL_RAW`,`APPL_MD_PATH`,`APPL_PHYSICAL_PATH`,`AUTH_TYPE`,`AUTH_USER`,`AUTH_PASSWORD`,`LOGON_USER`,`REMOTE_USER`,`CERT_COOKIE`,`CERT_FLAGS`,`CERT_ISSUER`,`CERT_KEYSIZE`,`CERT_SECRETKEYSIZE`,`CERT_SERIALNUMBER`,`CERT_SERVER_ISSUER`,`CERT_SERVER_SUBJECT`,`CERT_SUBJECT`,`CONTENT_LENGTH`,`CONTENT_TYPE`,`GATEWAY_INTERFACE`,`HTTPS`,`HTTPS_KEYSIZE`,`HTTPS_SECRETKEYSIZE`,`HTTPS_SERVER_ISSUER`,`HTTPS_SERVER_SUBJECT`,`INSTANCE_ID`,`INSTANCE_META_PATH`,`LOCAL_ADDR`,`PATH_INFO`,`PATH_TRANSLATED`,`QUERY_STRING`,`REMOTE_ADDR`,`REMOTE_HOST`,`REMOTE_PORT`,`REQUEST_METHOD`,`SCRIPT_NAME`,`SERVER_NAME`,`SERVER_PORT`,`SERVER_PORT_SECURE`,`SERVER_PROTOCOL`,`SERVER_SOFTWARE`,`URL`,`HTTP_CONNECTION`,`HTTP_ACCEPT`,`HTTP_ACCEPT_CHARSET`,`HTTP_ACCEPT_ENCODING`,`HTTP_ACCEPT_LANGUAGE`,`HTTP_COOKIE`,`HTTP_HOST`,`HTTP_USER_AGENT`,`ULKE`,`ULKE_KOD`,`IL`,`LAT`,`LON`) VALUES 
 (1,'tbl_giris_cikislar',1,'2012-04-15 23:26:30','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo\r\nHTTP_HOST:localhost:82\r\nHTTP_REFERER:http://localhost:82/admin/\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo\r\nHost: localhost:82\r\nReferer: http://localhost:82/admin/\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/3/ROOT','D:\\Siteler\\serasmac\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','3','/LM/W3SVC/3','::1','/admin/default.aspx','D:\\Siteler\\serasmac\\admin\\default.aspx','_dc=1334521589520','::1','::1','3406','POST','/admin/default.aspx','localhost','82','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo','localhost:82','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0',NULL,NULL,NULL,NULL,NULL),
 (2,'tbl_giris_cikislar',2,'2012-04-15 23:43:30','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo\r\nHTTP_HOST:localhost:82\r\nHTTP_REFERER:http://localhost:82/admin/default.aspx?rnd=63470129935610&s=http://localhost:82/admin/panel.aspx?rnd=63470129190732&_dc=1334522316047\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo\r\nHost: localhost:82\r\nReferer: http://localhost:82/admin/default.aspx?rnd=63470129935610&s=http://localhost:82/admin/panel.aspx?rnd=63470129190732&_dc=1334522316047\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/3/ROOT','D:\\Siteler\\serasmac\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','3','/LM/W3SVC/3','::1','/admin/default.aspx','D:\\Siteler\\serasmac\\admin\\default.aspx','rnd=63470129935610&s=http%3a%2f%2flocalhost%3a82%2fadmin%2fpanel.aspx%3frnd%3d63470129190732&_dc=1334522316047&_dc=1334522607998','::1','::1','3585','POST','/admin/default.aspx','localhost','82','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo','localhost:82','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0',NULL,NULL,NULL,NULL,NULL),
 (3,'tbl_giris_cikislar',3,'2012-04-16 00:35:27','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo; VITRIN=logo\r\nHTTP_HOST:localhost:82\r\nHTTP_REFERER:http://localhost:82/admin/\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo; VITRIN=logo\r\nHost: localhost:82\r\nReferer: http://localhost:82/admin/\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/3/ROOT','D:\\Siteler\\serasmac\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','3','/LM/W3SVC/3','::1','/admin/default.aspx','D:\\Siteler\\serasmac\\admin\\default.aspx','_dc=1334525723451','::1','::1','4075','POST','/admin/default.aspx','localhost','82','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo; VITRIN=logo','localhost:82','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0',NULL,NULL,NULL,NULL,NULL),
 (4,'tbl_giris_cikislar',4,'2012-04-16 01:27:26','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo; VITRIN=logo\r\nHTTP_HOST:localhost:82\r\nHTTP_REFERER:http://localhost:82/admin/default.aspx?rnd=63470136439396&s=http://localhost:82/admin/diller.aspx?rnd=1334526982000\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo; VITRIN=logo\r\nHost: localhost:82\r\nReferer: http://localhost:82/admin/default.aspx?rnd=63470136439396&s=http://localhost:82/admin/diller.aspx?rnd=1334526982000\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/3/ROOT','D:\\Siteler\\serasmac\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','3','/LM/W3SVC/3','::1','/admin/default.aspx','D:\\Siteler\\serasmac\\admin\\default.aspx','rnd=63470136439396&s=http%3a%2f%2flocalhost%3a82%2fadmin%2fdiller.aspx%3frnd%3d1334526982000&_dc=1334528845020','::1','::1','4373','POST','/admin/default.aspx','localhost','82','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo; VITRIN=logo','localhost:82','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0',NULL,NULL,NULL,NULL,NULL),
 (5,'tbl_giris_cikislar',5,'2012-04-16 01:39:40','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo; VITRIN=logo\r\nHTTP_HOST:localhost:82\r\nHTTP_REFERER:http://localhost:82/admin/default.aspx?rnd=63470137175955&s=http://localhost:82/admin/diller.aspx?rnd=1334526982000&_dc=1334529574445\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo; VITRIN=logo\r\nHost: localhost:82\r\nReferer: http://localhost:82/admin/default.aspx?rnd=63470137175955&s=http://localhost:82/admin/diller.aspx?rnd=1334526982000&_dc=1334529574445\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/3/ROOT','D:\\Siteler\\serasmac\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','3','/LM/W3SVC/3','::1','/admin/default.aspx','D:\\Siteler\\serasmac\\admin\\default.aspx','rnd=63470137175955&s=http%3a%2f%2flocalhost%3a82%2fadmin%2fdiller.aspx%3frnd%3d1334526982000&_dc=1334529574445&_dc=1334529579059','::1','::1','4560','POST','/admin/default.aspx','localhost','82','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo; VITRIN=logo','localhost:82','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0',NULL,NULL,NULL,NULL,NULL),
 (6,'tbl_giris_cikislar',6,'2012-04-16 02:13:29','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo; VITRIN=logo\r\nHTTP_HOST:localhost:82\r\nHTTP_REFERER:http://localhost:82/admin/default.aspx?rnd=63470139204592&s=http://localhost:82/admin/firma-bilgileri.aspx?_dc=1334531105455\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo; VITRIN=logo\r\nHost: localhost:82\r\nReferer: http://localhost:82/admin/default.aspx?rnd=63470139204592&s=http://localhost:82/admin/firma-bilgileri.aspx?_dc=1334531105455\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/3/ROOT','D:\\Siteler\\serasmac\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','3','/LM/W3SVC/3','::1','/admin/default.aspx','D:\\Siteler\\serasmac\\admin\\default.aspx','rnd=63470139204592&s=http%3a%2f%2flocalhost%3a82%2fadmin%2ffirma-bilgileri.aspx%3f_dc%3d1334531105455&_dc=1334531608040','::1','::1','5078','POST','/admin/default.aspx','localhost','82','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','ASP.NET_SessionId=vvjw3us4tgcapacowvsr3t0q; SERASMAC=logo; VITRIN=logo','localhost:82','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0',NULL,NULL,NULL,NULL,NULL),
 (7,'tbl_giris_cikislar',7,'2012-04-18 01:05:34','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:VITRIN=logo; ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3\r\nHTTP_HOST:localhost:82\r\nHTTP_REFERER:http://localhost:82/admin/default.aspx?rnd=63470307883964&s=http://localhost:82/admin/site-ziyaretleri.aspx\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: VITRIN=logo; ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3\r\nHost: localhost:82\r\nReferer: http://localhost:82/admin/default.aspx?rnd=63470307883964&s=http://localhost:82/admin/site-ziyaretleri.aspx\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/3/ROOT','D:\\Siteler\\serasmac\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','3','/LM/W3SVC/3','::1','/admin/default.aspx','D:\\Siteler\\serasmac\\admin\\default.aspx','rnd=63470307883964&s=http%3a%2f%2flocalhost%3a82%2fadmin%2fsite-ziyaretleri.aspx&_dc=1334700333030','::1','::1','2930','POST','/admin/default.aspx','localhost','82','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','VITRIN=logo; ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3','localhost:82','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0',NULL,NULL,NULL,NULL,NULL),
 (8,'tbl_giris_cikislar_hatalar',1,'2012-04-18 01:14:22','HTTP_CONNECTION:keep-alive\r\nHTTP_CONTENT_LENGTH:113\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:*/*\r\nHTTP_ACCEPT_CHARSET:ISO-8859-9,utf-8;q=0.7,*;q=0.3\r\nHTTP_ACCEPT_ENCODING:gzip,deflate,sdch\r\nHTTP_ACCEPT_LANGUAGE:tr-TR,tr;q=0.8,en-US;q=0.6,en;q=0.4\r\nHTTP_COOKIE:ASP.NET_SessionId=qri0ak2rpmmyn3rfoyylcqr1; VITRIN=logo\r\nHTTP_HOST:localhost:82\r\nHTTP_REFERER:http://localhost:82/admin/\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/14.0.835.202 Safari/535.1\r\nHTTP_ORIGIN:http://localhost:82\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Connection: keep-alive\r\nContent-Length: 113\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: */*\r\nAccept-Charset: ISO-8859-9,utf-8;q=0.7,*;q=0.3\r\nAccept-Encoding: gzip,deflate,sdch\r\nAccept-Language: tr-TR,tr;q=0.8,en-US;q=0.6,en;q=0.4\r\nCookie: ASP.NET_SessionId=qri0ak2rpmmyn3rfoyylcqr1; VITRIN=logo\r\nHost: localhost:82\r\nReferer: http://localhost:82/admin/\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/14.0.835.202 Safari/535.1\r\nOrigin: http://localhost:82\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/3/ROOT','D:\\Siteler\\serasmac\\','','','','','','','','','','','','','','','113','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','3','/LM/W3SVC/3','::1','/admin/default.aspx','D:\\Siteler\\serasmac\\admin\\default.aspx','_dc=1334700861981','::1','::1','3196','POST','/admin/default.aspx','localhost','82','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','*/*','ISO-8859-9,utf-8;q=0.7,*;q=0.3','gzip,deflate,sdch','tr-TR,tr;q=0.8,en-US;q=0.6,en;q=0.4','ASP.NET_SessionId=qri0ak2rpmmyn3rfoyylcqr1; VITRIN=logo','localhost:82','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/14.0.835.202 Safari/535.1',NULL,NULL,NULL,NULL,NULL),
 (9,'tbl_giris_cikislar',8,'2012-04-18 01:30:27','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:VITRIN=logo; ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3\r\nHTTP_HOST:localhost:82\r\nHTTP_REFERER:http://localhost:82/admin/default.aspx?rnd=63470309420973&s=http://localhost:82/admin/giris-hatalari.aspx\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: VITRIN=logo; ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3\r\nHost: localhost:82\r\nReferer: http://localhost:82/admin/default.aspx?rnd=63470309420973&s=http://localhost:82/admin/giris-hatalari.aspx\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/3/ROOT','D:\\Siteler\\serasmac\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','3','/LM/W3SVC/3','::1','/admin/default.aspx','D:\\Siteler\\serasmac\\admin\\default.aspx','rnd=63470309420973&s=http%3a%2f%2flocalhost%3a82%2fadmin%2fgiris-hatalari.aspx&_dc=1334701824956','::1','::1','3394','POST','/admin/default.aspx','localhost','82','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','VITRIN=logo; ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3','localhost:82','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0',NULL,NULL,NULL,NULL,NULL),
 (10,'tbl_giris_cikislar',9,'2012-04-18 01:44:33','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:VITRIN=logo; ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3\r\nHTTP_HOST:localhost:82\r\nHTTP_REFERER:http://localhost:82/admin/default.aspx?rnd=63470310052183&s=http://localhost:82/admin/giris-hatalari.aspx\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: VITRIN=logo; ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3\r\nHost: localhost:82\r\nReferer: http://localhost:82/admin/default.aspx?rnd=63470310052183&s=http://localhost:82/admin/giris-hatalari.aspx\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/3/ROOT','D:\\Siteler\\serasmac\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','3','/LM/W3SVC/3','::1','/admin/default.aspx','D:\\Siteler\\serasmac\\admin\\default.aspx','rnd=63470310052183&s=http%3a%2f%2flocalhost%3a82%2fadmin%2fgiris-hatalari.aspx&_dc=1334702670598','::1','::1','3430','POST','/admin/default.aspx','localhost','82','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','VITRIN=logo; ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3','localhost:82','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0',NULL,NULL,NULL,NULL,NULL),
 (11,'tbl_giris_cikislar',10,'2012-04-18 01:59:14','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3; VITRIN=logo\r\nHTTP_HOST:localhost:82\r\nHTTP_REFERER:http://localhost:82/admin/default.aspx?rnd=63470311148523&s=http://localhost:82/admin/giris-cikis-kayitlari.aspx\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3; VITRIN=logo\r\nHost: localhost:82\r\nReferer: http://localhost:82/admin/default.aspx?rnd=63470311148523&s=http://localhost:82/admin/giris-cikis-kayitlari.aspx\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/3/ROOT','D:\\Siteler\\serasmac\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','3','/LM/W3SVC/3','::1','/admin/default.aspx','D:\\Siteler\\serasmac\\admin\\default.aspx','rnd=63470311148523&s=http%3a%2f%2flocalhost%3a82%2fadmin%2fgiris-cikis-kayitlari.aspx&_dc=1334703552489','::1','::1','3550','POST','/admin/default.aspx','localhost','82','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3; VITRIN=logo','localhost:82','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0',NULL,NULL,NULL,NULL,NULL),
 (12,'tbl_giris_cikislar',11,'2012-04-18 02:02:46','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3; VITRIN=logo\r\nHTTP_HOST:localhost:82\r\nHTTP_REFERER:http://localhost:82/admin/\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3; VITRIN=logo\r\nHost: localhost:82\r\nReferer: http://localhost:82/admin/\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/3/ROOT','D:\\Siteler\\serasmac\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','3','/LM/W3SVC/3','::1','/admin/default.aspx','D:\\Siteler\\serasmac\\admin\\default.aspx','_dc=1334703763879','::1','::1','3563','POST','/admin/default.aspx','localhost','82','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3; VITRIN=logo','localhost:82','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0',NULL,NULL,NULL,NULL,NULL),
 (13,'tbl_giris_cikislar',12,'2012-04-18 02:11:14','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3; VITRIN=logo\r\nHTTP_HOST:localhost:82\r\nHTTP_REFERER:http://localhost:82/admin/default.aspx?rnd=63470311868638&s=http://localhost:82/admin/kodlar-scriptler.aspx?_dc=1334704267254\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3; VITRIN=logo\r\nHost: localhost:82\r\nReferer: http://localhost:82/admin/default.aspx?rnd=63470311868638&s=http://localhost:82/admin/kodlar-scriptler.aspx?_dc=1334704267254\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/3/ROOT','D:\\Siteler\\serasmac\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','3','/LM/W3SVC/3','::1','/admin/default.aspx','D:\\Siteler\\serasmac\\admin\\default.aspx','rnd=63470311868638&s=http%3a%2f%2flocalhost%3a82%2fadmin%2fkodlar-scriptler.aspx%3f_dc%3d1334704267254&_dc=1334704271559','::1','::1','3563','POST','/admin/default.aspx','localhost','82','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','ASP.NET_SessionId=lltn1c2cwj1njiitl0m2ddp3; VITRIN=logo','localhost:82','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0',NULL,NULL,NULL,NULL,NULL),
 (14,'tbl_giris_cikislar',13,'2012-04-27 16:44:20','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:__utma=111872281.978857877.1332501739.1332535395.1332543163.4; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=jx4r3ir3eqs344mnj0n5gqwc\r\nHTTP_HOST:localhost:94\r\nHTTP_REFERER:http://localhost:94/admin/\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: __utma=111872281.978857877.1332501739.1332535395.1332543163.4; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=jx4r3ir3eqs344mnj0n5gqwc\r\nHost: localhost:94\r\nReferer: http://localhost:94/admin/\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/14/ROOT','D:\\Inetpub\\Proje\\alisveris\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','14','/LM/W3SVC/14','127.0.0.1','/admin/default.aspx','D:\\Inetpub\\Proje\\alisveris\\admin\\default.aspx','_dc=1335534258085','127.0.0.1','127.0.0.1','20927','POST','/admin/default.aspx','localhost','94','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','__utma=111872281.978857877.1332501739.1332535395.1332543163.4; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=jx4r3ir3eqs344mnj0n5gqwc','localhost:94','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0','Reserved','RD','','0.00000000','0.00000000'),
 (15,'tbl_giris_cikislar',14,'2012-04-28 22:43:27','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:__utma=111872281.978857877.1332501739.1332535395.1332543163.4; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=1lrjuoxqqw3qhnnkp0qunbkl\r\nHTTP_HOST:localhost:94\r\nHTTP_REFERER:http://localhost:94/admin/\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: __utma=111872281.978857877.1332501739.1332535395.1332543163.4; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=1lrjuoxqqw3qhnnkp0qunbkl\r\nHost: localhost:94\r\nReferer: http://localhost:94/admin/\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/14/ROOT','D:\\Inetpub\\Proje\\alisveris\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','14','/LM/W3SVC/14','127.0.0.1','/admin/default.aspx','D:\\Inetpub\\Proje\\alisveris\\admin\\default.aspx','_dc=1335642204360','127.0.0.1','127.0.0.1','6528','POST','/admin/default.aspx','localhost','94','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','__utma=111872281.978857877.1332501739.1332535395.1332543163.4; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=1lrjuoxqqw3qhnnkp0qunbkl','localhost:94','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0','Reserved','RD','','0.00000000','0.00000000'),
 (16,'tbl_giris_cikislar',15,'2012-05-03 20:23:13','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:__utma=111872281.978857877.1332501739.1332535395.1332543163.4; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ydsa0xdaami5bhxy4dry211l\r\nHTTP_HOST:localhost:94\r\nHTTP_REFERER:http://localhost:94/admin/\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: __utma=111872281.978857877.1332501739.1332535395.1332543163.4; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ydsa0xdaami5bhxy4dry211l\r\nHost: localhost:94\r\nReferer: http://localhost:94/admin/\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/14/ROOT','D:\\Inetpub\\Proje\\alisveris\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','14','/LM/W3SVC/14','127.0.0.1','/admin/default.aspx','D:\\Inetpub\\Proje\\alisveris\\admin\\default.aspx','_dc=1336065786761','127.0.0.1','127.0.0.1','2481','POST','/admin/default.aspx','localhost','94','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','__utma=111872281.978857877.1332501739.1332535395.1332543163.4; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ydsa0xdaami5bhxy4dry211l','localhost:94','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0','Reserved','RD','','0.00000000','0.00000000'),
 (17,'tbl_giris_cikislar',16,'2012-05-03 21:49:28','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:__utma=111872281.978857877.1332501739.1332543163.1336068309.5; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ydsa0xdaami5bhxy4dry211l; __utmb=111872281.12.10.1336068309; __utmc=111872281\r\nHTTP_HOST:localhost:94\r\nHTTP_REFERER:http://localhost:94/admin/default.aspx?rnd=63471675638305&s=http://localhost:94/admin/panel.aspx?rnd=63471673393459&_dc=1336068033283\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: __utma=111872281.978857877.1332501739.1332543163.1336068309.5; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ydsa0xdaami5bhxy4dry211l; __utmb=111872281.12.10.1336068309; __utmc=111872281\r\nHost: localhost:94\r\nReferer: http://localhost:94/admin/default.aspx?rnd=63471675638305&s=http://localhost:94/admin/panel.aspx?rnd=63471673393459&_dc=1336068033283\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/14/ROOT','D:\\Inetpub\\Proje\\alisveris\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','14','/LM/W3SVC/14','127.0.0.1','/admin/default.aspx','D:\\Inetpub\\Proje\\alisveris\\admin\\default.aspx','rnd=63471675638305&s=http%3a%2f%2flocalhost%3a94%2fadmin%2fpanel.aspx%3frnd%3d63471673393459&_dc=1336068033283&_dc=1336070965242','127.0.0.1','127.0.0.1','2905','POST','/admin/default.aspx','localhost','94','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','__utma=111872281.978857877.1332501739.1332543163.1336068309.5; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ydsa0xdaami5bhxy4dry211l; __utmb=111872281.12.10.1336068309; __utmc=111872281','localhost:94','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0','Reserved','RD','','0.00000000','0.00000000'),
 (18,'tbl_giris_cikislar',17,'2012-05-03 22:25:58','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:__utma=111872281.978857877.1332501739.1332543163.1336068309.5; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ydsa0xdaami5bhxy4dry211l; __utmb=111872281.34.10.1336068309; __utmc=111872281\r\nHTTP_HOST:localhost:94\r\nHTTP_REFERER:http://localhost:94/admin/default.aspx?rnd=63471680143090&s=http://localhost:94/admin/panel.aspx?rnd=63471673393459&_dc=1336072542875\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: __utma=111872281.978857877.1332501739.1332543163.1336068309.5; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ydsa0xdaami5bhxy4dry211l; __utmb=111872281.34.10.1336068309; __utmc=111872281\r\nHost: localhost:94\r\nReferer: http://localhost:94/admin/default.aspx?rnd=63471680143090&s=http://localhost:94/admin/panel.aspx?rnd=63471673393459&_dc=1336072542875\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/14/ROOT','D:\\Inetpub\\Proje\\alisveris\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','14','/LM/W3SVC/14','127.0.0.1','/admin/default.aspx','D:\\Inetpub\\Proje\\alisveris\\admin\\default.aspx','rnd=63471680143090&s=http%3a%2f%2flocalhost%3a94%2fadmin%2fpanel.aspx%3frnd%3d63471673393459&_dc=1336072542875&_dc=1336073156932','127.0.0.1','127.0.0.1','3132','POST','/admin/default.aspx','localhost','94','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','__utma=111872281.978857877.1332501739.1332543163.1336068309.5; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ydsa0xdaami5bhxy4dry211l; __utmb=111872281.34.10.1336068309; __utmc=111872281','localhost:94','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0','Reserved','RD','','0.00000000','0.00000000'),
 (19,'tbl_giris_cikislar',18,'2012-05-03 23:07:14','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:__utma=111872281.978857877.1332501739.1332543163.1336068309.5; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ydsa0xdaami5bhxy4dry211l; __utmb=111872281.52.10.1336068309; __utmc=111872281\r\nHTTP_HOST:localhost:94\r\nHTTP_REFERER:http://localhost:94/admin/default.aspx?rnd=63471681310932&s=http://localhost:94/admin/panel.aspx?rnd=63471673393459&_dc=1336073710666\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: __utma=111872281.978857877.1332501739.1332543163.1336068309.5; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ydsa0xdaami5bhxy4dry211l; __utmb=111872281.52.10.1336068309; __utmc=111872281\r\nHost: localhost:94\r\nReferer: http://localhost:94/admin/default.aspx?rnd=63471681310932&s=http://localhost:94/admin/panel.aspx?rnd=63471673393459&_dc=1336073710666\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/14/ROOT','D:\\Inetpub\\Proje\\alisveris\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','14','/LM/W3SVC/14','127.0.0.1','/admin/default.aspx','D:\\Inetpub\\Proje\\alisveris\\admin\\default.aspx','rnd=63471681310932&s=http%3a%2f%2flocalhost%3a94%2fadmin%2fpanel.aspx%3frnd%3d63471673393459&_dc=1336073710666&_dc=1336075624949','127.0.0.1','127.0.0.1','4037','POST','/admin/default.aspx','localhost','94','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','__utma=111872281.978857877.1332501739.1332543163.1336068309.5; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ydsa0xdaami5bhxy4dry211l; __utmb=111872281.52.10.1336068309; __utmc=111872281','localhost:94','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0','Reserved','RD','','0.00000000','0.00000000'),
 (20,'tbl_giris_cikislar',19,'2012-05-04 01:37:09','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:__utma=111872281.978857877.1332501739.1336068309.1336082140.6; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utmb=111872281.14.10.1336082140; ASP.NET_SessionId=o52gaaklg1spnzcclibg4mqi\r\nHTTP_HOST:localhost:94\r\nHTTP_REFERER:http://localhost:94/admin/\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: __utma=111872281.978857877.1332501739.1336068309.1336082140.6; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utmb=111872281.14.10.1336082140; ASP.NET_SessionId=o52gaaklg1spnzcclibg4mqi\r\nHost: localhost:94\r\nReferer: http://localhost:94/admin/\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/14/ROOT','D:\\Inetpub\\Proje\\alisveris\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','14','/LM/W3SVC/14','127.0.0.1','/admin/default.aspx','D:\\Inetpub\\Proje\\alisveris\\admin\\default.aspx','_dc=1336084626493','127.0.0.1','127.0.0.1','5866','POST','/admin/default.aspx','localhost','94','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','__utma=111872281.978857877.1332501739.1336068309.1336082140.6; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utmb=111872281.14.10.1336082140; ASP.NET_SessionId=o52gaaklg1spnzcclibg4mqi','localhost:94','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0','Reserved','RD','','0.00000000','0.00000000'),
 (21,'tbl_giris_cikislar',20,'2012-05-04 17:39:00','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:__utma=111872281.978857877.1332501739.1336135671.1336140243.13; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=k2fhukvtrz0saj01plxhozal; __utmc=111872281\r\nHTTP_HOST:localhost:94\r\nHTTP_REFERER:http://localhost:94/admin/\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: __utma=111872281.978857877.1332501739.1336135671.1336140243.13; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=k2fhukvtrz0saj01plxhozal; __utmc=111872281\r\nHost: localhost:94\r\nReferer: http://localhost:94/admin/\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/14/ROOT','D:\\Inetpub\\Proje\\alisveris\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','14','/LM/W3SVC/14','127.0.0.1','/admin/default.aspx','D:\\Inetpub\\Proje\\alisveris\\admin\\default.aspx','_dc=1336142337629','127.0.0.1','127.0.0.1','35239','POST','/admin/default.aspx','localhost','94','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','__utma=111872281.978857877.1332501739.1336135671.1336140243.13; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=k2fhukvtrz0saj01plxhozal; __utmc=111872281','localhost:94','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0','Reserved','RD','','0.00000000','0.00000000'),
 (22,'tbl_giris_cikislar',21,'2012-05-04 20:02:29','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:__utma=111872281.978857877.1332501739.1336135671.1336140243.13; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ee3neho1dpjusac3mywujawt\r\nHTTP_HOST:localhost:94\r\nHTTP_REFERER:http://localhost:94/admin/\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: __utma=111872281.978857877.1332501739.1336135671.1336140243.13; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ee3neho1dpjusac3mywujawt\r\nHost: localhost:94\r\nReferer: http://localhost:94/admin/\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/14/ROOT','D:\\Inetpub\\Proje\\alisveris\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','14','/LM/W3SVC/14','127.0.0.1','/admin/default.aspx','D:\\Inetpub\\Proje\\alisveris\\admin\\default.aspx','_dc=1336150940678','127.0.0.1','127.0.0.1','1042','POST','/admin/default.aspx','localhost','94','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','__utma=111872281.978857877.1332501739.1336135671.1336140243.13; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ee3neho1dpjusac3mywujawt','localhost:94','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0',NULL,NULL,NULL,NULL,NULL),
 (23,'tbl_giris_cikislar',22,'2012-05-04 20:04:43','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:__utma=111872281.978857877.1332501739.1336135671.1336140243.13; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ee3neho1dpjusac3mywujawt\r\nHTTP_HOST:localhost:94\r\nHTTP_REFERER:http://localhost:94/admin/default.aspx?rnd=63471758673234&s=http://localhost:94/admin/panel.aspx?rnd=63471758549745&_dc=1336151073201\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: __utma=111872281.978857877.1332501739.1336135671.1336140243.13; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ee3neho1dpjusac3mywujawt\r\nHost: localhost:94\r\nReferer: http://localhost:94/admin/default.aspx?rnd=63471758673234&s=http://localhost:94/admin/panel.aspx?rnd=63471758549745&_dc=1336151073201\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/14/ROOT','D:\\Inetpub\\Proje\\alisveris\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','14','/LM/W3SVC/14','127.0.0.1','/admin/default.aspx','D:\\Inetpub\\Proje\\alisveris\\admin\\default.aspx','rnd=63471758673234&s=http%3a%2f%2flocalhost%3a94%2fadmin%2fpanel.aspx%3frnd%3d63471758549745&_dc=1336151073201&_dc=1336151082352','127.0.0.1','127.0.0.1','1061','POST','/admin/default.aspx','localhost','94','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','__utma=111872281.978857877.1332501739.1336135671.1336140243.13; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=ee3neho1dpjusac3mywujawt','localhost:94','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0',NULL,NULL,NULL,NULL,NULL),
 (24,'tbl_giris_cikislar',23,'2012-05-05 18:43:55','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:__utma=111872281.978857877.1332501739.1336225987.1336229938.20; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=vzh4peywlksyr14npbo2uodn; __utmc=111872281\r\nHTTP_HOST:localhost:94\r\nHTTP_REFERER:http://localhost:94/admin/\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: __utma=111872281.978857877.1332501739.1336225987.1336229938.20; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=vzh4peywlksyr14npbo2uodn; __utmc=111872281\r\nHost: localhost:94\r\nReferer: http://localhost:94/admin/\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/14/ROOT','D:\\Inetpub\\Proje\\alisveris\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','14','/LM/W3SVC/14','127.0.0.1','/admin/default.aspx','D:\\Inetpub\\Proje\\alisveris\\admin\\default.aspx','_dc=1336232635051','127.0.0.1','127.0.0.1','3479','POST','/admin/default.aspx','localhost','94','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','__utma=111872281.978857877.1332501739.1336225987.1336229938.20; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=vzh4peywlksyr14npbo2uodn; __utmc=111872281','localhost:94','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0',NULL,NULL,NULL,NULL,NULL),
 (25,'tbl_iletisimler',3,'2012-05-06 21:45:34','HTTP_CONNECTION:keep-alive\r\nHTTP_CONTENT_LENGTH:631\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:__utma=111872281.978857877.1332501739.1336307683.1336324716.25; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=sft1rq15pulgkkcrcaq0o42t; __utmc=111872281; __utmb=111872281.26.10.1336324716\r\nHTTP_HOST:localhost:94\r\nHTTP_REFERER:http://localhost:94/iletisim\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\n','Connection: keep-alive\r\nContent-Length: 631\r\nContent-Type: application/x-www-form-urlencoded\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: __utma=111872281.978857877.1332501739.1336307683.1336324716.25; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=sft1rq15pulgkkcrcaq0o42t; __utmc=111872281; __utmb=111872281.26.10.1336324716\r\nHost: localhost:94\r\nReferer: http://localhost:94/iletisim\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\n','/LM/W3SVC/14/ROOT','D:\\Inetpub\\Proje\\alisveris\\','','','','','','','','','','','','','','','631','application/x-www-form-urlencoded','CGI/1.1','off','','','','','14','/LM/W3SVC/14','127.0.0.1','/iletisim','D:\\Inetpub\\Proje\\alisveris\\iletisim','','127.0.0.1','127.0.0.1','10367','POST','/iletisim','localhost','94','0','HTTP/1.1','Microsoft-IIS/7.5','/iletisim','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','__utma=111872281.978857877.1332501739.1336307683.1336324716.25; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=sft1rq15pulgkkcrcaq0o42t; __utmc=111872281; __utmb=111872281.26.10.1336324716','localhost:94','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0','Reserved','RD','','0.00000000','0.00000000'),
 (26,'tbl_giris_cikislar',24,'2012-05-10 20:07:02','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:__utma=111872281.978857877.1332501739.1336636515.1336667929.39; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __atuvc=28|19; ASP.NET_SessionId=nnev0wpcabzmddjijplil4oy; __utmb=111872281.1.10.1336667929; __utmc=111872281\r\nHTTP_HOST:localhost:94\r\nHTTP_REFERER:http://localhost:94/admin/\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: __utma=111872281.978857877.1332501739.1336636515.1336667929.39; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __atuvc=28|19; ASP.NET_SessionId=nnev0wpcabzmddjijplil4oy; __utmb=111872281.1.10.1336667929; __utmc=111872281\r\nHost: localhost:94\r\nReferer: http://localhost:94/admin/\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/14/ROOT','D:\\Inetpub\\Proje\\alisveris\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','14','/LM/W3SVC/14','127.0.0.1','/admin/default.aspx','D:\\Inetpub\\Proje\\alisveris\\admin\\default.aspx','_dc=1336669617989','127.0.0.1','127.0.0.1','1539','POST','/admin/default.aspx','localhost','94','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','__utma=111872281.978857877.1332501739.1336636515.1336667929.39; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __atuvc=28|19; ASP.NET_SessionId=nnev0wpcabzmddjijplil4oy; __utmb=111872281.1.10.1336667929; __utmc=111872281','localhost:94','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0','Reserved','RD','','0.00000000','0.00000000'),
 (27,'tbl_giris_cikislar',25,'2012-05-31 01:26:28','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:__atuvc=5|22; ASP.NET_SessionId=fs4ipyn03z45shzychgmwykd\r\nHTTP_HOST:localhost:94\r\nHTTP_REFERER:http://localhost:94/admin/default.aspx?rnd=63474024360687&s=http://localhost:94/admin/yoneticiler.aspx\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: __atuvc=5|22; ASP.NET_SessionId=fs4ipyn03z45shzychgmwykd\r\nHost: localhost:94\r\nReferer: http://localhost:94/admin/default.aspx?rnd=63474024360687&s=http://localhost:94/admin/yoneticiler.aspx\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/14/ROOT','D:\\Inetpub\\Proje\\alisveris\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','14','/LM/W3SVC/14','127.0.0.1','/admin/default.aspx','D:\\Inetpub\\Proje\\alisveris\\admin\\default.aspx','rnd=63474024360687&s=http%3a%2f%2flocalhost%3a94%2fadmin%2fyoneticiler.aspx&_dc=1338416786996','127.0.0.1','127.0.0.1','6278','POST','/admin/default.aspx','localhost','94','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','__atuvc=5|22; ASP.NET_SessionId=fs4ipyn03z45shzychgmwykd','localhost:94','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0','Reserved','RD','','0.00000000','0.00000000');
/*!40000 ALTER TABLE `tbl_all_http` ENABLE KEYS */;


--
-- Definition of trigger `trg_all_http_tarih`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_all_http_tarih`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_all_http_tarih` BEFORE INSERT ON `tbl_all_http` FOR EACH ROW BEGIN
SET NEW.tarih = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_aramalar`
--

DROP TABLE IF EXISTS `tbl_aramalar`;
CREATE TABLE `tbl_aramalar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dil_id` int(11) NOT NULL DEFAULT '-1',
  `kelime` varchar(255) NOT NULL DEFAULT '',
  `tarih` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `dil_id` (`dil_id`),
  CONSTRAINT `fk_aramalar_dil_id` FOREIGN KEY (`dil_id`) REFERENCES `tbl_diller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_aramalar`
--

/*!40000 ALTER TABLE `tbl_aramalar` DISABLE KEYS */;
INSERT INTO `tbl_aramalar` (`id`,`dil_id`,`kelime`,`tarih`) VALUES 
 (1,999,'ser-00','2012-03-11 23:32:57'),
 (2,999,'ser-00','2012-03-11 23:33:38'),
 (3,999,'ser-00','2012-03-11 23:33:50'),
 (4,999,'ser-001','2012-03-11 23:33:56'),
 (5,999,'ser-001','2012-03-11 23:37:34'),
 (6,999,'ser-001','2012-03-11 23:37:43'),
 (7,999,'ser-001','2012-03-11 23:52:47'),
 (8,999,'ser-001','2012-03-11 23:52:58'),
 (9,999,'ser-001','2012-03-11 23:53:11'),
 (10,999,'ser-001','2012-03-11 23:53:17'),
 (11,999,'ser-001','2012-03-11 23:53:33'),
 (12,999,'ser-001','2012-03-11 23:53:50'),
 (13,999,'ser-001','2012-03-11 23:54:06'),
 (14,999,'ser-001','2012-03-11 23:54:23'),
 (15,999,'ser-001','2012-03-11 23:54:41'),
 (16,999,'ser-001','2012-03-11 23:54:50'),
 (17,999,'ser-001','2012-03-11 23:54:57'),
 (18,999,'ser-001','2012-03-11 23:55:27'),
 (19,999,'ser-001','2012-03-11 23:56:09'),
 (20,999,'ser-001','2012-03-11 23:56:16'),
 (21,999,'ser-001','2012-03-11 23:56:16'),
 (22,999,'ser-001','2012-03-11 23:56:20'),
 (23,999,'ser-001','2012-03-11 23:56:47'),
 (24,999,'ser-001','2012-03-11 23:56:57'),
 (25,999,'ser-001','2012-03-12 00:04:18'),
 (26,999,'ser-001','2012-03-12 00:04:30'),
 (27,999,'ser-001','2012-03-12 00:05:12'),
 (28,999,'ser-001','2012-03-12 00:05:29'),
 (29,999,'ser-001','2012-03-12 00:05:46'),
 (30,999,'ser-001','2012-03-12 00:05:53'),
 (31,999,'ser-001','2012-03-12 00:05:57'),
 (32,999,'ser-001','2012-03-12 00:06:05'),
 (33,999,'ser-001','2012-03-12 00:06:10'),
 (34,999,'ser-001','2012-03-12 00:06:33'),
 (35,999,'ser-001','2012-03-12 00:07:10'),
 (36,999,'ser-001','2012-03-12 00:07:10'),
 (37,999,'ser-001','2012-03-12 00:07:11'),
 (38,999,'ser-001','2012-03-12 00:07:22'),
 (39,999,'ser-001','2012-03-12 00:07:28'),
 (40,999,'ser-001','2012-03-12 00:07:33'),
 (41,999,'ser-001','2012-03-12 00:07:38'),
 (42,999,'ser-001','2012-03-12 00:13:03'),
 (43,999,'ser-001','2012-03-12 00:15:30'),
 (44,999,'ser-001','2012-03-12 00:15:44'),
 (45,999,'ser-001','2012-03-12 00:30:32'),
 (46,999,'ser','2012-03-12 01:07:31'),
 (47,999,'DENEME Ü','2012-03-12 01:09:03'),
 (48,999,'deneme 28','2012-03-12 01:09:09'),
 (49,999,'ser','2012-03-12 01:47:38'),
 (50,999,'ser','2012-03-12 01:50:12'),
 (51,999,'ser','2012-03-12 01:52:14'),
 (52,999,'ser','2012-03-12 01:52:27'),
 (53,999,'ser','2012-03-12 01:53:57'),
 (54,999,'ser','2012-03-12 01:59:29'),
 (55,999,'ser','2012-03-12 01:59:30'),
 (56,999,'ser','2012-03-12 02:02:00'),
 (57,999,'ser','2012-03-12 02:02:40'),
 (58,999,'ser','2012-03-12 02:03:03'),
 (59,999,'ser','2012-03-12 02:03:08'),
 (60,999,'ser','2012-03-12 02:03:43'),
 (61,999,'ser','2012-03-12 02:03:55'),
 (62,999,'ser','2012-03-12 02:04:23'),
 (63,999,'ser','2012-03-12 02:04:33'),
 (64,999,'ser','2012-03-12 02:04:39'),
 (65,999,'ser','2012-03-12 02:04:48'),
 (66,999,'ser','2012-03-12 02:04:55'),
 (67,999,'ser','2012-03-12 02:05:08'),
 (68,999,'sis','2012-03-15 02:40:54'),
 (69,999,'deeeeee','2012-03-15 02:41:03'),
 (70,999,'eeeeeeeeeeeeeeeeee','2012-03-15 02:41:07'),
 (71,999,'`^^','2012-03-15 03:25:45'),
 (72,999,'404','2012-03-15 03:25:51'),
 (73,999,'202','2012-03-15 03:25:54'),
 (74,999,'253','2012-03-15 03:26:05'),
 (75,999,'yuf','2012-04-16 02:15:13'),
 (76,999,'şişme','2012-05-03 20:39:21'),
 (77,999,'aaaaaaaa','2012-05-03 20:41:01'),
 (78,999,'aaaaaaaa','2012-05-03 20:41:46'),
 (79,999,'aaaaaaaa','2012-05-03 20:42:50'),
 (80,999,'aaaaaaaa','2012-05-03 20:44:04');
/*!40000 ALTER TABLE `tbl_aramalar` ENABLE KEYS */;


--
-- Definition of trigger `trg_aramalar`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_aramalar`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_aramalar` BEFORE INSERT ON `tbl_aramalar` FOR EACH ROW BEGIN
SET NEW.tarih = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_bottomlar`
--

DROP TABLE IF EXISTS `tbl_bottomlar`;
CREATE TABLE `tbl_bottomlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dil_id` int(11) NOT NULL DEFAULT '-1',
  `baslik` varchar(255) NOT NULL DEFAULT '',
  `text` longtext,
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `dil_id` (`dil_id`),
  KEY `onay` (`onay`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_bottomlar_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bottomlar_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bottomlar_dil_id` FOREIGN KEY (`dil_id`) REFERENCES `tbl_diller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_bottomlar`
--

/*!40000 ALTER TABLE `tbl_bottomlar` DISABLE KEYS */;
INSERT INTO `tbl_bottomlar` (`id`,`dil_id`,`baslik`,`text`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (2,999,'Copyright © 2012 Marin Boat her hakkı sakldır.','Yazılı izin olmadan kopyalanamaz veya taklit edilemez.',1,999,'2012-03-09 00:45:36',999,'2012-05-02 23:52:11');
/*!40000 ALTER TABLE `tbl_bottomlar` ENABLE KEYS */;


--
-- Definition of trigger `trg_bottomlar_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_bottomlar_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_bottomlar_ek` BEFORE INSERT ON `tbl_bottomlar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_bottomlar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_bottomlar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_bottomlar_gun` BEFORE UPDATE ON `tbl_bottomlar` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_cpy_odeme_bildirimler_hesap_nolar`
--

DROP TABLE IF EXISTS `tbl_cpy_odeme_bildirimler_hesap_nolar`;
CREATE TABLE `tbl_cpy_odeme_bildirimler_hesap_nolar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hesap_nolar_id` int(11) DEFAULT NULL,
  `banka_id` int(11) DEFAULT NULL,
  `sube` varchar(255) DEFAULT NULL,
  `sube_kodu` varchar(10) DEFAULT NULL,
  `hesap_sahibi` varchar(255) DEFAULT NULL,
  `hesap_no` varchar(20) DEFAULT NULL,
  `iban` varchar(34) DEFAULT NULL,
  `aciklama` longtext,
  `tarih` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `banka_id` (`banka_id`),
  KEY `sube_kodu` (`sube_kodu`),
  KEY `tarih` (`tarih`),
  KEY `hesap_nolar_id` (`hesap_nolar_id`),
  KEY `iban` (`iban`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='KOPYA TABLOSU';

--
-- Dumping data for table `tbl_cpy_odeme_bildirimler_hesap_nolar`
--

/*!40000 ALTER TABLE `tbl_cpy_odeme_bildirimler_hesap_nolar` DISABLE KEYS */;
INSERT INTO `tbl_cpy_odeme_bildirimler_hesap_nolar` (`id`,`hesap_nolar_id`,`banka_id`,`sube`,`sube_kodu`,`hesap_sahibi`,`hesap_no`,`iban`,`aciklama`,`tarih`) VALUES 
 (14,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-04-29 03:57:48'),
 (15,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-04-29 04:03:44'),
 (16,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-04-29 04:04:56'),
 (17,3,17,'Alaşehir','1000','Hatice Yıldırım','7436895','TR01234567890102345678965255555553',NULL,'2012-04-30 13:16:25'),
 (18,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-05-03 00:22:13'),
 (19,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-05-06 17:54:14'),
 (20,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-05-06 17:54:16'),
 (21,2,18,'Antalya','743','Hüseyin Yıldırım','6889831','TR01234567890102345678965255555554',NULL,'2012-05-06 17:54:18'),
 (22,3,17,'Alaşehir','1000','Hatice Yıldırım','7436895','TR01234567890102345678965255555553',NULL,'2012-05-06 17:54:20'),
 (23,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-05-06 18:36:47'),
 (24,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-05-06 18:44:49'),
 (25,2,18,'Antalya','743','Hüseyin Yıldırım','6889831','TR01234567890102345678965255555554',NULL,'2012-05-06 18:55:33'),
 (26,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-05-07 13:27:23'),
 (27,2,18,'Antalya','743','Hüseyin Yıldırım','6889831','TR01234567890102345678965255555554',NULL,'2012-05-08 09:51:09'),
 (28,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-05-20 13:35:02'),
 (29,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-07-05 23:45:29'),
 (30,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-07-06 13:20:16'),
 (31,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-07-06 13:28:04'),
 (32,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-07-06 14:46:47');
/*!40000 ALTER TABLE `tbl_cpy_odeme_bildirimler_hesap_nolar` ENABLE KEYS */;


--
-- Definition of trigger `trg_cpy_odeme_bildirimler_hesap_nolar`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_cpy_odeme_bildirimler_hesap_nolar`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_cpy_odeme_bildirimler_hesap_nolar` BEFORE INSERT ON `tbl_cpy_odeme_bildirimler_hesap_nolar` FOR EACH ROW BEGIN

SET NEW.banka_id = IF((SELECT id FROM tbl_hesap_nolar USE INDEX (id) WHERE id=NEW.hesap_nolar_id)<=>NULL,NULL,(SELECT banka_id FROM tbl_hesap_nolar USE INDEX (id) WHERE id=NEW.hesap_nolar_id));
SET NEW.sube = IF((SELECT id FROM tbl_hesap_nolar USE INDEX (id) WHERE id=NEW.hesap_nolar_id)<=>NULL,NULL,(SELECT sube FROM tbl_hesap_nolar USE INDEX (id) WHERE id=NEW.hesap_nolar_id));
SET NEW.sube_kodu = IF((SELECT id FROM tbl_hesap_nolar USE INDEX (id) WHERE id=NEW.hesap_nolar_id)<=>NULL,NULL,(SELECT sube_kodu FROM tbl_hesap_nolar USE INDEX (id) WHERE id=NEW.hesap_nolar_id));
SET NEW.hesap_sahibi = IF((SELECT id FROM tbl_hesap_nolar USE INDEX (id) WHERE id=NEW.hesap_nolar_id)<=>NULL,NULL,(SELECT hesap_sahibi FROM tbl_hesap_nolar USE INDEX (id) WHERE id=NEW.hesap_nolar_id));
SET NEW.hesap_no = IF((SELECT id FROM tbl_hesap_nolar USE INDEX (id) WHERE id=NEW.hesap_nolar_id)<=>NULL,NULL,(SELECT hesap_no FROM tbl_hesap_nolar USE INDEX (id) WHERE id=NEW.hesap_nolar_id));
SET NEW.iban = IF((SELECT id FROM tbl_hesap_nolar USE INDEX (id) WHERE id=NEW.hesap_nolar_id)<=>NULL,NULL,(SELECT iban FROM tbl_hesap_nolar USE INDEX (id) WHERE id=NEW.hesap_nolar_id));
SET NEW.aciklama = IF((SELECT id FROM tbl_hesap_nolar USE INDEX (id) WHERE id=NEW.hesap_nolar_id)<=>NULL,NULL,(SELECT aciklama FROM tbl_hesap_nolar USE INDEX (id) WHERE id=NEW.hesap_nolar_id));

SET NEW.tarih = NOW();

END $$

DELIMITER ;

--
-- Definition of table `tbl_cpy_siparisler_indirimler`
--

DROP TABLE IF EXISTS `tbl_cpy_siparisler_indirimler`;
CREATE TABLE `tbl_cpy_siparisler_indirimler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indirimler_id` int(11) DEFAULT NULL,
  `ad` varchar(255) DEFAULT NULL,
  `yuzde` float(11,3) DEFAULT NULL,
  `tarih` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `tarih_ek` (`tarih`),
  KEY `yuzde` (`yuzde`),
  KEY `indirimler_id` (`indirimler_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='KOPYA TABLOSU';

--
-- Dumping data for table `tbl_cpy_siparisler_indirimler`
--

/*!40000 ALTER TABLE `tbl_cpy_siparisler_indirimler` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cpy_siparisler_indirimler` ENABLE KEYS */;


--
-- Definition of trigger `trg_cpy_siparisler_indirimler`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_cpy_siparisler_indirimler`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_cpy_siparisler_indirimler` BEFORE INSERT ON `tbl_cpy_siparisler_indirimler` FOR EACH ROW BEGIN

SET NEW.ad = IF((SELECT id FROM tbl_indirimler USE INDEX (id) WHERE id=NEW.indirimler_id)<=>NULL,NULL,(SELECT ad FROM tbl_indirimler USE INDEX (id) WHERE id=NEW.indirimler_id));
SET NEW.yuzde = IF((SELECT id FROM tbl_indirimler USE INDEX (id) WHERE id=NEW.indirimler_id)<=>NULL,NULL,(SELECT yuzde FROM tbl_indirimler USE INDEX (id) WHERE id=NEW.indirimler_id));

SET NEW.tarih = NOW();

END $$

DELIMITER ;

--
-- Definition of table `tbl_cpy_siparisler_kredi_karti_oranlar`
--

DROP TABLE IF EXISTS `tbl_cpy_siparisler_kredi_karti_oranlar`;
CREATE TABLE `tbl_cpy_siparisler_kredi_karti_oranlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kredi_karti_oranlar_id` int(11) DEFAULT NULL,
  `banka_id` int(11) DEFAULT NULL,
  `ay` int(4) DEFAULT NULL,
  `oran` float(11,3) DEFAULT NULL,
  `tarih` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `banka_id` (`banka_id`),
  KEY `tarih_ek` (`tarih`),
  KEY `ay` (`ay`),
  KEY `oran` (`oran`),
  KEY `kredi_karti_oranlar_id` (`kredi_karti_oranlar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='KOPYA TABLOSU';

--
-- Dumping data for table `tbl_cpy_siparisler_kredi_karti_oranlar`
--

/*!40000 ALTER TABLE `tbl_cpy_siparisler_kredi_karti_oranlar` DISABLE KEYS */;
INSERT INTO `tbl_cpy_siparisler_kredi_karti_oranlar` (`id`,`kredi_karti_oranlar_id`,`banka_id`,`ay`,`oran`,`tarih`) VALUES 
 (1,5,17,12,1.100,'2012-04-30 12:34:10'),
 (2,10,19,3,1.000,'2012-04-30 13:18:49'),
 (3,10,19,3,1.000,'2012-04-30 13:20:09'),
 (4,11,19,6,1.010,'2012-04-30 13:21:28'),
 (5,13,19,12,1.060,'2012-04-30 13:57:12'),
 (6,17,20,12,1.090,'2012-05-02 13:20:52'),
 (7,7,18,6,1.030,'2012-05-05 00:41:38'),
 (8,6,18,3,1.010,'2012-05-06 16:49:11'),
 (9,6,18,3,1.010,'2012-05-06 17:03:55'),
 (10,6,18,3,1.010,'2012-05-06 17:44:57'),
 (11,2,17,3,1.020,'2012-05-06 18:08:09'),
 (12,6,18,3,1.010,'2012-05-06 18:53:06'),
 (13,12,19,9,1.030,'2012-05-06 18:56:55');
/*!40000 ALTER TABLE `tbl_cpy_siparisler_kredi_karti_oranlar` ENABLE KEYS */;


--
-- Definition of trigger `trg_cpy_siparisler_kredi_karti_oranlar`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_cpy_siparisler_kredi_karti_oranlar`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_cpy_siparisler_kredi_karti_oranlar` BEFORE INSERT ON `tbl_cpy_siparisler_kredi_karti_oranlar` FOR EACH ROW BEGIN

SET NEW.banka_id = IF((SELECT id FROM tbl_kredi_karti_oranlar USE INDEX (id) WHERE id=NEW.kredi_karti_oranlar_id)<=>NULL,NULL,(SELECT banka_id FROM tbl_kredi_karti_oranlar USE INDEX (id) WHERE id=NEW.kredi_karti_oranlar_id));
SET NEW.ay = IF((SELECT id FROM tbl_kredi_karti_oranlar USE INDEX (id) WHERE id=NEW.kredi_karti_oranlar_id)<=>NULL,NULL,(SELECT ay FROM tbl_kredi_karti_oranlar USE INDEX (id) WHERE id=NEW.kredi_karti_oranlar_id));
SET NEW.oran = IF((SELECT id FROM tbl_kredi_karti_oranlar USE INDEX (id) WHERE id=NEW.kredi_karti_oranlar_id)<=>NULL,NULL,(SELECT oran FROM tbl_kredi_karti_oranlar USE INDEX (id) WHERE id=NEW.kredi_karti_oranlar_id));

SET NEW.tarih = NOW();

END $$

DELIMITER ;

--
-- Definition of table `tbl_cpy_siparisler_kullanicilar_adresler`
--

DROP TABLE IF EXISTS `tbl_cpy_siparisler_kullanicilar_adresler`;
CREATE TABLE `tbl_cpy_siparisler_kullanicilar_adresler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kullanicilar_adresler_id` int(11) DEFAULT NULL,
  `kullanici_id` int(11) DEFAULT NULL,
  `tip` tinyint(1) DEFAULT NULL COMMENT '0 fatura adres, 1 kargo adres',
  `baslik` varchar(255) DEFAULT NULL,
  `ulke_id` int(11) DEFAULT NULL,
  `eyalet` varchar(255) DEFAULT NULL,
  `il` varchar(255) DEFAULT NULL,
  `il_id` int(11) DEFAULT NULL,
  `ilce` varchar(255) DEFAULT NULL,
  `ilce_id` int(11) DEFAULT NULL,
  `posta_kodu` varchar(50) DEFAULT NULL,
  `adres` longtext,
  `acik_adres` longtext,
  `tarih` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `tarih_ek` (`tarih`),
  KEY `kullanici_id` (`kullanici_id`),
  KEY `ulke_id` (`ulke_id`),
  KEY `tip` (`tip`),
  KEY `kullanicilar_adresler_id` (`kullanicilar_adresler_id`),
  KEY `il_id` (`il_id`),
  KEY `ilce_id` (`ilce_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='KOPYA TABLOSU';

--
-- Dumping data for table `tbl_cpy_siparisler_kullanicilar_adresler`
--

/*!40000 ALTER TABLE `tbl_cpy_siparisler_kullanicilar_adresler` DISABLE KEYS */;
INSERT INTO `tbl_cpy_siparisler_kullanicilar_adresler` (`id`,`kullanicilar_adresler_id`,`kullanici_id`,`tip`,`baslik`,`ulke_id`,`eyalet`,`il`,`il_id`,`ilce`,`ilce_id`,`posta_kodu`,`adres`,`acik_adres`,`tarih`) VALUES 
 (58,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-29 03:57:47'),
 (59,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-29 03:57:47'),
 (60,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-29 04:03:43'),
 (61,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-29 04:03:43'),
 (62,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-29 04:04:55'),
 (63,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-29 04:04:55'),
 (64,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-30 01:12:07'),
 (65,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-30 01:12:07'),
 (66,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-30 01:32:00'),
 (67,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-30 01:32:01'),
 (68,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-30 01:33:35'),
 (69,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-30 01:33:35'),
 (70,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-30 13:16:24'),
 (71,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-30 13:16:24'),
 (72,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-30 13:18:49'),
 (73,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-30 13:18:49'),
 (74,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-30 13:20:09'),
 (75,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-30 13:20:09'),
 (76,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-30 13:21:27'),
 (77,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-30 13:21:27'),
 (78,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-30 13:57:12'),
 (79,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-30 13:57:12'),
 (80,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-05-02 13:20:50'),
 (81,5,1,0,'Akdeniz TV A.Ş.',235,NULL,'Antalya',7,'Merkez',82,'07120','Gençlik Mh. Işıklar Cd. No:5 Sultan Apt.',NULL,'2012-05-02 13:20:51'),
 (82,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-05-02 13:28:00'),
 (83,5,1,0,'Akdeniz TV A.Ş.',235,NULL,'Antalya',7,'Merkez',82,'07120','Gençlik Mh. Işıklar Cd. No:5 Sultan Apt.',NULL,'2012-05-02 13:28:00'),
 (84,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-05-03 00:22:11'),
 (85,5,1,0,'Akdeniz TV A.Ş.',235,NULL,'Antalya',7,'Merkez',82,'07120','Gençlik Mh. Işıklar Cd. No:5 Sultan Apt.',NULL,'2012-05-03 00:22:12'),
 (86,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-05-05 00:41:37'),
 (87,5,1,0,'Akdeniz TV A.Ş.',235,NULL,'Antalya',7,'Merkez',82,'07120','Gençlik Mh. Işıklar Cd. No:5 Sultan Apt.',NULL,'2012-05-05 00:41:38'),
 (88,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-05-06 16:49:10'),
 (89,5,1,0,'Akdeniz TV A.Ş.',235,NULL,'Antalya',7,'Merkez',82,'07120','Gençlik Mh. Işıklar Cd. No:5 Sultan Apt.',NULL,'2012-05-06 16:49:10'),
 (90,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-05-06 17:03:54'),
 (91,5,1,0,'Akdeniz TV A.Ş.',235,NULL,'Antalya',7,'Merkez',82,'07120','Gençlik Mh. Işıklar Cd. No:5 Sultan Apt.',NULL,'2012-05-06 17:03:54'),
 (92,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-05-06 17:44:56'),
 (93,5,1,0,'Akdeniz TV A.Ş.',235,NULL,'Antalya',7,'Merkez',82,'07120','Gençlik Mh. Işıklar Cd. No:5 Sultan Apt.',NULL,'2012-05-06 17:44:56'),
 (94,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-05-06 18:08:08'),
 (95,5,1,0,'Akdeniz TV A.Ş.',235,NULL,'Antalya',7,'Merkez',82,'07120','Gençlik Mh. Işıklar Cd. No:5 Sultan Apt.',NULL,'2012-05-06 18:08:09'),
 (96,7,11,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Merkez',82,'07320','Habibler Mh. 5563 Sk. No:5','Habibler Mh. 5563 Sk. No:5','2012-05-06 18:36:46'),
 (97,6,11,0,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Merkez',82,'07320','Habibler Mh. 5563 Sk. No:5',NULL,'2012-05-06 18:36:47'),
 (98,7,11,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Merkez',82,'07320','Habibler Mh. 5563 Sk. No:5','Habibler Mh. 5563 Sk. No:5','2012-05-06 18:44:49'),
 (99,6,11,0,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Merkez',82,'07320','Habibler Mh. 5563 Sk. No:5',NULL,'2012-05-06 18:44:49'),
 (100,7,11,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Merkez',82,'07320','Habibler Mh. 5563 Sk. No:5','Habibler Mh. 5563 Sk. No:5','2012-05-06 18:53:05'),
 (101,6,11,0,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Merkez',82,'07320','Habibler Mh. 5563 Sk. No:5',NULL,'2012-05-06 18:53:06'),
 (102,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-05-06 18:55:32'),
 (103,5,1,0,'Akdeniz TV A.Ş.',235,NULL,'Antalya',7,'Merkez',82,'07120','Gençlik Mh. Işıklar Cd. No:5 Sultan Apt.',NULL,'2012-05-06 18:55:32'),
 (104,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-05-06 18:56:55'),
 (105,5,1,0,'Akdeniz TV A.Ş.',235,NULL,'Antalya',7,'Merkez',82,'07120','Gençlik Mh. Işıklar Cd. No:5 Sultan Apt.',NULL,'2012-05-06 18:56:55'),
 (106,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-05-07 13:27:22'),
 (107,5,1,0,'Akdeniz TV A.Ş.',235,NULL,'Antalya',7,'Merkez',82,'07120','Gençlik Mh. Işıklar Cd. No:5 Sultan Apt.',NULL,'2012-05-07 13:27:22'),
 (108,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-05-08 09:51:07'),
 (109,5,1,0,'Akdeniz TV A.Ş.',235,NULL,'Antalya',7,'Merkez',82,'07120','Gençlik Mh. Işıklar Cd. No:5 Sultan Apt.',NULL,'2012-05-08 09:51:08'),
 (110,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-05-20 13:34:59'),
 (111,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-05-20 13:35:00'),
 (112,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Manavgat',96,'076001','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-07-05 23:45:28'),
 (113,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Merkez',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-07-05 23:45:28'),
 (114,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Manavgat',96,'076001','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-07-06 13:20:15'),
 (115,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Merkez',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-07-06 13:20:15'),
 (116,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Manavgat',96,'076001','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-07-06 13:28:04'),
 (117,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Merkez',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-07-06 13:28:04'),
 (118,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Manavgat',96,'076001','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-07-06 14:46:46'),
 (119,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Merkez',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-07-06 14:46:46');
/*!40000 ALTER TABLE `tbl_cpy_siparisler_kullanicilar_adresler` ENABLE KEYS */;


--
-- Definition of trigger `trg_cpy_siparisler_kullanicilar_adresler`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_cpy_siparisler_kullanicilar_adresler`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_cpy_siparisler_kullanicilar_adresler` BEFORE INSERT ON `tbl_cpy_siparisler_kullanicilar_adresler` FOR EACH ROW BEGIN

SET NEW.kullanici_id = IF((SELECT id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id)<=>NULL,NULL,(SELECT kullanici_id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id));
SET NEW.tip = IF((SELECT id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id)<=>NULL,NULL,(SELECT tip FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id));
SET NEW.baslik = IF((SELECT id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id)<=>NULL,NULL,(SELECT baslik FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id));
SET NEW.ulke_id = IF((SELECT id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id)<=>NULL,NULL,(SELECT ulke_id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id));
SET NEW.eyalet = IF((SELECT id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id)<=>NULL,NULL,(SELECT eyalet FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id));
SET NEW.il = IF((SELECT id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id)<=>NULL,NULL,(SELECT il FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id));
SET NEW.il_id = IF((SELECT id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id)<=>NULL,NULL,(SELECT il_id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id));
SET NEW.ilce = IF((SELECT id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id)<=>NULL,NULL,(SELECT ilce FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id));
SET NEW.ilce_id = IF((SELECT id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id)<=>NULL,NULL,(SELECT ilce_id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id));
SET NEW.posta_kodu = IF((SELECT id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id)<=>NULL,NULL,(SELECT posta_kodu FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id));
SET NEW.adres = IF((SELECT id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id)<=>NULL,NULL,(SELECT adres FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id));
SET NEW.acik_adres = IF((SELECT id FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id)<=>NULL,NULL,(SELECT acik_adres FROM tbl_kullanicilar_adresler USE INDEX (id) WHERE id=NEW.kullanicilar_adresler_id));

SET NEW.tarih = NOW();

END $$

DELIMITER ;

--
-- Definition of table `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler`
--

DROP TABLE IF EXISTS `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler`;
CREATE TABLE `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kullanicilar_vergi_bilgiler_id` int(11) DEFAULT NULL,
  `kullanici_id` int(11) DEFAULT NULL,
  `adres_id` int(11) DEFAULT NULL,
  `tip` tinyint(1) DEFAULT NULL COMMENT '0 kişisel, 1 kurumsal',
  `vergi_dairesi` varchar(255) DEFAULT NULL,
  `vergi_no` varchar(13) DEFAULT NULL,
  `tc_kimlik_no` varchar(11) DEFAULT NULL,
  `tarih` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `tarih_ek` (`tarih`),
  KEY `ulke_id` (`vergi_no`),
  KEY `tip` (`tip`),
  KEY `vergi_no` (`vergi_no`),
  KEY `tc_kimlik_no` (`tc_kimlik_no`),
  KEY `kullanicilar_vergi_bilgiler_id` (`kullanicilar_vergi_bilgiler_id`),
  KEY `adres_id` (`adres_id`),
  KEY `kullanici_id` (`kullanici_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='KOPYA TABLOSU';

--
-- Dumping data for table `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler`
--

/*!40000 ALTER TABLE `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler` DISABLE KEYS */;
INSERT INTO `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler` (`id`,`kullanicilar_vergi_bilgiler_id`,`kullanici_id`,`adres_id`,`tip`,`vergi_dairesi`,`vergi_no`,`tc_kimlik_no`,`tarih`) VALUES 
 (32,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-29 03:57:47'),
 (33,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-29 04:03:44'),
 (34,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-29 04:04:55'),
 (35,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-30 01:12:07'),
 (36,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-30 01:32:01'),
 (37,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-30 01:33:35'),
 (38,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-30 13:16:24'),
 (39,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-30 13:18:49'),
 (40,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-30 13:20:09'),
 (41,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-30 13:21:27'),
 (42,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-30 13:57:12'),
 (43,-1,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-02 13:20:51'),
 (44,-1,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-02 13:28:01'),
 (45,-1,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-03 00:22:12'),
 (46,-1,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-05 00:41:38'),
 (47,-1,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-06 16:49:10'),
 (48,-1,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-06 17:03:54'),
 (49,-1,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-06 17:44:56'),
 (50,-1,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-06 18:08:09'),
 (51,2,11,6,0,'','','62809043732','2012-05-06 18:36:47'),
 (52,2,11,6,0,'','','62809043732','2012-05-06 18:44:49'),
 (53,2,11,6,0,'','','62809043732','2012-05-06 18:53:06'),
 (54,-1,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-06 18:55:32'),
 (55,-1,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-06 18:56:55'),
 (56,-1,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-07 13:27:22'),
 (57,-1,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-08 09:51:08'),
 (58,1,1,2,1,'Kurumlar','925 014 6664','','2012-05-20 13:35:00'),
 (59,1,1,2,1,'Kurumlar','925 014 6664','','2012-07-05 23:45:28'),
 (60,1,1,2,1,'Kurumlar','925 014 6664','','2012-07-06 13:20:15'),
 (61,1,1,2,1,'Kurumlar','925 014 6664','','2012-07-06 13:28:04'),
 (62,1,1,2,1,'Kurumlar','925 014 6664','','2012-07-06 14:46:46');
/*!40000 ALTER TABLE `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler` ENABLE KEYS */;


--
-- Definition of trigger `trg_cpy_siparisler_kullanicilar_vergi_bilgiler`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_cpy_siparisler_kullanicilar_vergi_bilgiler`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_cpy_siparisler_kullanicilar_vergi_bilgiler` BEFORE INSERT ON `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler` FOR EACH ROW BEGIN

SET NEW.kullanici_id = IF((SELECT id FROM tbl_kullanicilar_vergi_bilgiler USE INDEX (id) WHERE id=NEW.kullanicilar_vergi_bilgiler_id)<=>NULL,NULL,(SELECT kullanici_id FROM tbl_kullanicilar_vergi_bilgiler USE INDEX (id) WHERE id=NEW.kullanicilar_vergi_bilgiler_id));
SET NEW.adres_id = IF((SELECT id FROM tbl_kullanicilar_vergi_bilgiler USE INDEX (id) WHERE id=NEW.kullanicilar_vergi_bilgiler_id)<=>NULL,NULL,(SELECT adres_id FROM tbl_kullanicilar_vergi_bilgiler USE INDEX (id) WHERE id=NEW.kullanicilar_vergi_bilgiler_id));
SET NEW.tip = IF((SELECT id FROM tbl_kullanicilar_vergi_bilgiler USE INDEX (id) WHERE id=NEW.kullanicilar_vergi_bilgiler_id)<=>NULL,NULL,(SELECT tip FROM tbl_kullanicilar_vergi_bilgiler USE INDEX (id) WHERE id=NEW.kullanicilar_vergi_bilgiler_id));
SET NEW.vergi_dairesi = IF((SELECT id FROM tbl_kullanicilar_vergi_bilgiler USE INDEX (id) WHERE id=NEW.kullanicilar_vergi_bilgiler_id)<=>NULL,NULL,(SELECT vergi_dairesi FROM tbl_kullanicilar_vergi_bilgiler USE INDEX (id) WHERE id=NEW.kullanicilar_vergi_bilgiler_id));
SET NEW.vergi_no = IF((SELECT id FROM tbl_kullanicilar_vergi_bilgiler USE INDEX (id) WHERE id=NEW.kullanicilar_vergi_bilgiler_id)<=>NULL,NULL,(SELECT vergi_no FROM tbl_kullanicilar_vergi_bilgiler USE INDEX (id) WHERE id=NEW.kullanicilar_vergi_bilgiler_id));
SET NEW.tc_kimlik_no = IF((SELECT id FROM tbl_kullanicilar_vergi_bilgiler USE INDEX (id) WHERE id=NEW.kullanicilar_vergi_bilgiler_id)<=>NULL,NULL,(SELECT tc_kimlik_no FROM tbl_kullanicilar_vergi_bilgiler USE INDEX (id) WHERE id=NEW.kullanicilar_vergi_bilgiler_id));

SET NEW.tarih = NOW();

END $$

DELIMITER ;

--
-- Definition of table `tbl_cpy_siparisler_urunler`
--

DROP TABLE IF EXISTS `tbl_cpy_siparisler_urunler`;
CREATE TABLE `tbl_cpy_siparisler_urunler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `urunler_id` int(11) DEFAULT NULL,
  `dil_id` int(11) DEFAULT NULL,
  `dil` varchar(255) DEFAULT NULL,
  `kod_id` int(11) DEFAULT NULL,
  `kod` varchar(255) DEFAULT NULL,
  `resim_id` int(11) DEFAULT NULL,
  `resim` varchar(255) DEFAULT NULL,
  `resim_kategori_id` int(11) DEFAULT NULL,
  `resim_kategori` varchar(255) DEFAULT NULL,
  `video_kategori_id` int(11) DEFAULT NULL,
  `video_kategori` varchar(255) DEFAULT NULL,
  `ad` varchar(110) DEFAULT NULL,
  `on_aciklama` longtext,
  `aciklama` longtext,
  `en` int(11) DEFAULT NULL COMMENT 'CM',
  `boy` int(11) DEFAULT NULL COMMENT 'CM',
  `yukseklik` int(11) DEFAULT NULL COMMENT 'CM',
  `desi` float(11,2) DEFAULT NULL,
  `kg` float(11,2) DEFAULT NULL,
  `fiyat` double(11,5) DEFAULT NULL,
  `para_birimi_id` int(11) DEFAULT NULL,
  `kdv_id` int(11) DEFAULT NULL,
  `kargo_hesaplama_id` int(11) DEFAULT NULL,
  `indirim_id` int(11) DEFAULT NULL,
  `indirim_ad` varchar(255) DEFAULT NULL,
  `indirim_yuzde` float(11,3) DEFAULT NULL,
  `tarih` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `dil_id` (`dil_id`),
  KEY `resim_kategori_id` (`resim_kategori_id`),
  KEY `video_kategori_id` (`video_kategori_id`),
  KEY `kod_id` (`kod_id`),
  KEY `resim_id` (`resim_id`),
  KEY `para_birimi_id` (`para_birimi_id`),
  KEY `kdv_id` (`kdv_id`),
  KEY `kargo_hesaplama_id` (`kargo_hesaplama_id`) USING BTREE,
  KEY `en` (`en`),
  KEY `boy` (`boy`),
  KEY `yukseklik` (`yukseklik`),
  KEY `kg` (`kg`),
  KEY `tarih` (`tarih`),
  KEY `indirim_id` (`indirim_id`),
  KEY `indirim_yuzde` (`indirim_yuzde`),
  KEY `urunler_id` (`urunler_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='KOPYA TABLOSU';

--
-- Dumping data for table `tbl_cpy_siparisler_urunler`
--

/*!40000 ALTER TABLE `tbl_cpy_siparisler_urunler` DISABLE KEYS */;
INSERT INTO `tbl_cpy_siparisler_urunler` (`id`,`urunler_id`,`dil_id`,`dil`,`kod_id`,`kod`,`resim_id`,`resim`,`resim_kategori_id`,`resim_kategori`,`video_kategori_id`,`video_kategori`,`ad`,`on_aciklama`,`aciklama`,`en`,`boy`,`yukseklik`,`desi`,`kg`,`fiyat`,`para_birimi_id`,`kdv_id`,`kargo_hesaplama_id`,`indirim_id`,`indirim_ad`,`indirim_yuzde`,`tarih`) VALUES 
 (67,34,999,'TÜRKÇE',1,'SER-000',115,'product_01.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 281','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',30,20,50,10.00,NULL,654.00000,1,1,5,NULL,NULL,NULL,'2012-04-29 03:57:47'),
 (68,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,2.60,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-04-29 03:57:47'),
 (69,41,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 289','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,965.00000,2,1,1,2,'BAHAR KAMPANYASI %10',1.100,'2012-04-29 03:57:47'),
 (70,38,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 285','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,258.00000,2,1,1,NULL,NULL,NULL,'2012-04-29 03:57:47'),
 (71,42,999,'TÜRKÇE',3,'SER-003',117,'product_03.jpg',NULL,NULL,NULL,NULL,'ŞİŞME BOT 290','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,853.00000,1,1,1,NULL,NULL,NULL,'2012-04-29 03:57:47'),
 (72,38,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 285','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,258.00000,2,1,1,NULL,NULL,NULL,'2012-04-29 04:03:44'),
 (73,34,999,'TÜRKÇE',1,'SER-000',115,'product_01.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 281','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',30,20,50,10.00,NULL,654.00000,1,1,5,NULL,NULL,NULL,'2012-04-29 04:04:55'),
 (74,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,2.60,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-04-29 04:04:55'),
 (75,41,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 289','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,965.00000,2,1,1,2,'BAHAR KAMPANYASI %10',1.100,'2012-04-30 01:12:08'),
 (76,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,2.60,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-04-30 01:32:01'),
 (77,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,2.60,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-04-30 01:33:35'),
 (78,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,2.60,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-04-30 13:16:24'),
 (79,41,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 289','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,965.00000,2,1,1,2,'BAHAR KAMPANYASI %10',1.100,'2012-04-30 13:18:49'),
 (80,44,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 292','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,158.00000,1,1,1,2,'BAHAR KAMPANYASI %10',1.100,'2012-04-30 13:21:28'),
 (81,44,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 292','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,158.00000,1,1,1,2,'BAHAR KAMPANYASI %10',1.100,'2012-04-30 13:57:12'),
 (82,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,2.60,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-05-02 13:20:51'),
 (83,44,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 292','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,158.00000,1,1,1,2,'BAHAR KAMPANYASI %10',1.100,'2012-05-02 13:28:01'),
 (84,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,2.60,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-05-03 00:22:12'),
 (85,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,2.60,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-05-05 00:41:38'),
 (86,34,999,'TÜRKÇE',1,'SER-000',115,'product_01.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 281','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',30,20,50,10.00,NULL,654.00000,1,1,5,NULL,NULL,NULL,'2012-05-06 16:49:11'),
 (87,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,15.00,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-05-06 17:03:55'),
 (88,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,15.00,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-05-06 17:44:57'),
 (89,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,15.00,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-05-06 18:08:09'),
 (90,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,15.00,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-05-06 18:36:47'),
 (91,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,15.00,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-05-06 18:44:49'),
 (92,34,999,'TÜRKÇE',1,'SER-000',115,'product_01.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 281','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',30,20,50,10.00,NULL,654.00000,1,1,5,NULL,NULL,NULL,'2012-05-06 18:53:06'),
 (93,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,15.00,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-05-06 18:55:32'),
 (94,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,15.00,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-05-06 18:56:55'),
 (95,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,15.00,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-05-07 13:27:23'),
 (96,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,15.00,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-05-08 09:51:08'),
 (97,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,15.00,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-05-20 13:35:01'),
 (98,58,999,'TÜRKÇE',1,'SER-000',117,'product_03.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 303','gfgfdgfgfgf<br/>g<br/>fg<br/>f<br/>gf','gfgfdgfgfgf<br/>g<br/>fg<br/>f<br/>gf',0,0,0,0.00,0.00,588.00000,1,1,1,1,'KDV BİZDEN %18',1.180,'2012-07-05 23:45:28'),
 (99,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,2.00,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-07-05 23:45:28');
INSERT INTO `tbl_cpy_siparisler_urunler` (`id`,`urunler_id`,`dil_id`,`dil`,`kod_id`,`kod`,`resim_id`,`resim`,`resim_kategori_id`,`resim_kategori`,`video_kategori_id`,`video_kategori`,`ad`,`on_aciklama`,`aciklama`,`en`,`boy`,`yukseklik`,`desi`,`kg`,`fiyat`,`para_birimi_id`,`kdv_id`,`kargo_hesaplama_id`,`indirim_id`,`indirim_ad`,`indirim_yuzde`,`tarih`) VALUES 
 (100,38,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 285','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,258.00000,2,1,1,NULL,NULL,NULL,'2012-07-05 23:45:28');
/*!40000 ALTER TABLE `tbl_cpy_siparisler_urunler` ENABLE KEYS */;


--
-- Definition of trigger `trg_cpy_siparisler_urunler`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_cpy_siparisler_urunler`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_cpy_siparisler_urunler` BEFORE INSERT ON `tbl_cpy_siparisler_urunler` FOR EACH ROW BEGIN

SET NEW.dil_id = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT dil_id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.kod_id = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT kod_id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.resim_id = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT resim_id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.resim_kategori_id = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.resim_kategori_id)<=>NULL,NULL,(SELECT resim_kategori_id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.resim_kategori_id));
SET NEW.video_kategori_id = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT video_kategori_id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.ad = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT ad FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.on_aciklama = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT on_aciklama FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.aciklama = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT aciklama FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.en = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT en FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.boy = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT boy FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.yukseklik = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT yukseklik FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.desi = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT desi FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.kg = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT kg FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.fiyat = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT fiyat FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.para_birimi_id = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT para_birimi_id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.kdv_id = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT kdv_id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.kargo_hesaplama_id = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT kargo_hesaplama_id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));
SET NEW.indirim_id = IF((SELECT id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id)<=>NULL,NULL,(SELECT indirim_id FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id));

IF ((SELECT COUNT(dil_id) FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id) > 0) THEN
SET NEW.dil = IF((SELECT id FROM tbl_diller USE INDEX (id) WHERE id=NEW.dil_id)<=>NULL,NULL,(SELECT dil FROM tbl_diller USE INDEX (id) WHERE id=NEW.dil_id));
END IF;

IF ((SELECT COUNT(kod_id) FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id) > 0) THEN
SET NEW.kod = IF((SELECT id FROM tbl_kodlar USE INDEX (id) WHERE id=NEW.kod_id)<=>NULL,NULL,(SELECT kod FROM tbl_kodlar USE INDEX (id) WHERE id=NEW.kod_id));
END IF;

IF ((SELECT COUNT(resim_id) FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id) > 0) THEN
SET NEW.resim = IF((SELECT id FROM tbl_dosyalar USE INDEX (id) WHERE id=NEW.resim_id)<=>NULL,NULL,(SELECT ad FROM tbl_dosyalar USE INDEX (id) WHERE id=NEW.resim_id));
END IF;

IF ((SELECT COUNT(resim_kategori_id) FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id) > 0) THEN
SET NEW.resim_kategori = IF((SELECT id FROM tbl_dosyalar_kategori USE INDEX (id) WHERE id=NEW.resim_kategori_id)<=>NULL,NULL,(SELECT ad FROM tbl_dosyalar_kategori USE INDEX (id) WHERE id=NEW.resim_kategori_id));
END IF;

IF ((SELECT COUNT(video_kategori_id) FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id) > 0) THEN
SET NEW.video_kategori = IF((SELECT id FROM tbl_dosyalar_kategori USE INDEX (id) WHERE id=NEW.video_kategori_id)<=>NULL,NULL,(SELECT ad FROM tbl_dosyalar_kategori USE INDEX (id) WHERE id=NEW.video_kategori_id));
END IF;

IF ((SELECT COUNT(indirim_id) FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id) > 0) THEN
SET NEW.indirim_ad = IF((SELECT id FROM tbl_indirimler USE INDEX (id) WHERE id=NEW.indirim_id)<=>NULL,NULL,(SELECT ad FROM tbl_indirimler USE INDEX (id) WHERE id=NEW.indirim_id));
END IF;

IF ((SELECT COUNT(indirim_id) FROM tbl_urunler USE INDEX (id) WHERE id=NEW.urunler_id) > 0) THEN
SET NEW.indirim_yuzde = IF((SELECT id FROM tbl_indirimler USE INDEX (id) WHERE id=NEW.indirim_id)<=>NULL,NULL,(SELECT yuzde FROM tbl_indirimler USE INDEX (id) WHERE id=NEW.indirim_id));
END IF;

SET NEW.tarih = NOW();

END $$

DELIMITER ;

--
-- Definition of table `tbl_diller`
--

DROP TABLE IF EXISTS `tbl_diller`;
CREATE TABLE `tbl_diller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dil` varchar(255) NOT NULL DEFAULT '',
  `ulke_id` int(11) NOT NULL DEFAULT '-1',
  `kodlama` varchar(10) NOT NULL DEFAULT 'utf-8',
  `ikon` varchar(45) NOT NULL DEFAULT '',
  `para_birimi_id` int(11) NOT NULL DEFAULT '-1',
  `sira` int(11) NOT NULL DEFAULT '0',
  `ana_dil` tinyint(1) NOT NULL DEFAULT '0',
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `kodlama` (`kodlama`),
  KEY `sira` (`sira`),
  KEY `ana_dil` (`ana_dil`),
  KEY `onay` (`onay`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `para_birimi_id` (`para_birimi_id`),
  KEY `ulke_id` (`ulke_id`) USING BTREE,
  CONSTRAINT `fk_diller_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_diller_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_diller_ulke_id` FOREIGN KEY (`ulke_id`) REFERENCES `tbl_sbt_ulke` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_diller`
--

/*!40000 ALTER TABLE `tbl_diller` DISABLE KEYS */;
INSERT INTO `tbl_diller` (`id`,`dil`,`ulke_id`,`kodlama`,`ikon`,`para_birimi_id`,`sira`,`ana_dil`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,'ENGLISH',243,'iso-8859-1','usa.png',5,1,0,1,999,'2011-12-04 21:35:02',999,'2012-04-13 00:44:21'),
 (2,'DEUTSCH',85,'utf-8','germany.png',5,2,0,1,999,'2011-12-04 21:35:02',999,'2012-04-13 00:44:11'),
 (999,'TÜRKÇE',235,'iso-8859-9','turkey.png',1,0,1,1,999,'2011-12-04 21:35:02',999,'2012-04-24 22:52:42');
/*!40000 ALTER TABLE `tbl_diller` ENABLE KEYS */;


--
-- Definition of trigger `trg_diller_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_diller_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_diller_ek` BEFORE INSERT ON `tbl_diller` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_diller_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_diller_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_diller_gun` BEFORE UPDATE ON `tbl_diller` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_dosyalar`
--

DROP TABLE IF EXISTS `tbl_dosyalar`;
CREATE TABLE `tbl_dosyalar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(600) DEFAULT NULL,
  `aciklama` varchar(500) DEFAULT NULL,
  `tip` int(1) NOT NULL DEFAULT '0' COMMENT '0 resim, 1 video, 2 diğer',
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `onay` (`onay`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `tip` (`tip`),
  CONSTRAINT `fk_dosyalar_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dosyalar_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_dosyalar`
--

/*!40000 ALTER TABLE `tbl_dosyalar` DISABLE KEYS */;
INSERT INTO `tbl_dosyalar` (`id`,`ad`,`url`,`aciklama`,`tip`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (22,'Video 1 - Youtube','http://www.youtube.com/embed/Z3_1_bZsJXU?rel=0&wmode=transparent',NULL,1,1,999,'2011-12-10 17:04:09',999,'2012-03-05 01:43:19'),
 (24,'Video 2 - Vimeo','http://player.vimeo.com/video/10752259?title=0&byline=0&portrait=0',NULL,1,1,999,'2011-12-10 17:39:19',999,'2012-02-29 00:55:10'),
 (28,'Video 4 - ZapKolik','http://www.zapkolik.com/playerv1/player.swf?id=333685@e&autoplay=0',NULL,1,1,999,'2011-12-10 17:54:03',999,'2012-03-05 01:43:12'),
 (29,'Video 5 - Timsah','http://www.timsah.com/getswf/v2/n00TVTldyHv',NULL,1,1,999,'2011-12-10 17:54:50',999,'2012-03-05 01:43:07'),
 (30,'Video 6 - Dailymotion','http://www.dailymotion.com/embed/video/xfgqrn','ddsd',1,1,999,'2011-12-10 17:58:00',999,'2012-02-23 18:55:38'),
 (115,'product_01.jpg',NULL,'DENEME ÜRÜN RESMI',0,1,999,'2012-03-05 01:43:53',NULL,NULL),
 (116,'product_02.jpg',NULL,NULL,0,1,999,'2012-03-05 01:44:06',NULL,NULL),
 (117,'product_03.jpg',NULL,NULL,0,1,999,'2012-03-05 01:44:15',NULL,NULL),
 (118,'product_04.jpg',NULL,NULL,0,1,999,'2012-03-05 01:44:23',NULL,NULL),
 (119,'product_05.jpg',NULL,NULL,0,1,999,'2012-03-05 01:44:31',NULL,NULL),
 (120,'product_06.jpg',NULL,NULL,0,1,999,'2012-03-05 01:44:40',NULL,NULL);
/*!40000 ALTER TABLE `tbl_dosyalar` ENABLE KEYS */;


--
-- Definition of trigger `trg_dosyalar_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_dosyalar_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_dosyalar_ek` BEFORE INSERT ON `tbl_dosyalar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_dosyalar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_dosyalar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_dosyalar_gun` BEFORE UPDATE ON `tbl_dosyalar` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_dosyalar_kategori`
--

DROP TABLE IF EXISTS `tbl_dosyalar_kategori`;
CREATE TABLE `tbl_dosyalar_kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_tip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 ana kategori, 1 alt kategori',
  `kategori_id` int(1) NOT NULL DEFAULT '0',
  `ad` varchar(255) NOT NULL DEFAULT '',
  `tip` int(1) NOT NULL DEFAULT '0' COMMENT '0 resim, 1 video, 2 diğer',
  `aciklama` varchar(500) DEFAULT NULL,
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `tip` (`tip`),
  KEY `kategori_tip` (`kategori_tip`),
  CONSTRAINT `fk_dosyalar_kategori_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dosyalar_kategori_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_dosyalar_kategori`
--

/*!40000 ALTER TABLE `tbl_dosyalar_kategori` DISABLE KEYS */;
INSERT INTO `tbl_dosyalar_kategori` (`id`,`kategori_tip`,`kategori_id`,`ad`,`tip`,`aciklama`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,0,0,'RESIM - BOŞ KATEGORİ',0,'Resim için boş kategori',999,'2011-12-08 23:45:37',999,'2012-01-22 04:32:16'),
 (2,0,0,'VIDEO - BOŞ KATEGORİ',1,'Video için boş kategori',999,'2011-12-10 17:04:33',999,'2012-02-13 02:27:36');
/*!40000 ALTER TABLE `tbl_dosyalar_kategori` ENABLE KEYS */;


--
-- Definition of trigger `trg_dosyalar_kategori_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_dosyalar_kategori_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_dosyalar_kategori_ek` BEFORE INSERT ON `tbl_dosyalar_kategori` FOR EACH ROW BEGIN

SET NEW.tarih_ek = NOW();

IF (NEW.kategori_id!=0) THEN
SET NEW.kategori_tip = 1;
ELSE
SET NEW.kategori_tip = 0;
END IF;

END $$

DELIMITER ;

--
-- Definition of trigger `trg_dosyalar_kategori_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_dosyalar_kategori_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_dosyalar_kategori_gun` BEFORE UPDATE ON `tbl_dosyalar_kategori` FOR EACH ROW BEGIN

SET NEW.tarih_gun = NOW();

IF (NEW.kategori_id!=0) THEN
SET NEW.kategori_tip = 1;
ELSE
SET NEW.kategori_tip = 0;
END IF;

END $$

DELIMITER ;

--
-- Definition of table `tbl_dosyalar_kategoriler`
--

DROP TABLE IF EXISTS `tbl_dosyalar_kategoriler`;
CREATE TABLE `tbl_dosyalar_kategoriler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dosya_id` int(11) NOT NULL DEFAULT '-1',
  `kategori_id` int(11) NOT NULL DEFAULT '-1',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `dosya_id` (`dosya_id`),
  KEY `kategori_id` (`kategori_id`),
  CONSTRAINT `fk_dosyalar_kategoriler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dosyalar_kategoriler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dosyalar_kategoriler_dosya_id` FOREIGN KEY (`dosya_id`) REFERENCES `tbl_dosyalar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dosyalar_kategoriler_kategori_id` FOREIGN KEY (`kategori_id`) REFERENCES `tbl_dosyalar_kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_dosyalar_kategoriler`
--

/*!40000 ALTER TABLE `tbl_dosyalar_kategoriler` DISABLE KEYS */;
INSERT INTO `tbl_dosyalar_kategoriler` (`id`,`dosya_id`,`kategori_id`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (14,30,2,999,'2012-02-23 19:40:13',NULL,'2012-02-23 19:40:18'),
 (40,24,2,999,'2012-02-29 00:55:10',NULL,NULL),
 (41,29,2,999,'2012-03-05 01:43:07',NULL,NULL),
 (42,28,2,999,'2012-03-05 01:43:12',NULL,NULL),
 (43,22,2,999,'2012-03-05 01:43:19',NULL,NULL),
 (44,115,1,999,'2012-03-05 01:43:54',NULL,NULL),
 (45,116,1,999,'2012-03-05 01:44:06',NULL,NULL),
 (46,117,1,999,'2012-03-05 01:44:15',NULL,NULL),
 (47,118,1,999,'2012-03-05 01:44:23',NULL,NULL),
 (48,119,1,999,'2012-03-05 01:44:31',NULL,NULL),
 (49,120,1,999,'2012-03-05 01:44:40',NULL,NULL);
/*!40000 ALTER TABLE `tbl_dosyalar_kategoriler` ENABLE KEYS */;


--
-- Definition of trigger `trg_dosyalar_kategoriler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_dosyalar_kategoriler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_dosyalar_kategoriler_ek` BEFORE INSERT ON `tbl_dosyalar_kategoriler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_dosyalar_kategoriler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_dosyalar_kategoriler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_dosyalar_kategoriler_gun` BEFORE UPDATE ON `tbl_dosyalar_kategoriler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_etiketler`
--

DROP TABLE IF EXISTS `tbl_etiketler`;
CREATE TABLE `tbl_etiketler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dil_id` int(11) NOT NULL DEFAULT '-1',
  `ad` varchar(255) NOT NULL DEFAULT '',
  `anasayfa` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 anasayfada yok, 1 ise var',
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `dil_id` (`dil_id`),
  KEY `anasayfa` (`anasayfa`),
  KEY `onay` (`onay`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_etiketler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_etiketler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_etiketler_dil_id` FOREIGN KEY (`dil_id`) REFERENCES `tbl_diller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_etiketler`
--

/*!40000 ALTER TABLE `tbl_etiketler` DISABLE KEYS */;
INSERT INTO `tbl_etiketler` (`id`,`dil_id`,`ad`,`anasayfa`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (67,999,'boat',1,1,999,'2012-02-27 02:39:35',999,'2012-05-03 10:57:22'),
 (68,999,'kança',1,1,999,'2012-02-27 02:39:35',999,'2012-05-03 10:57:25'),
 (69,999,'tekne',1,1,999,'2012-02-27 02:41:43',999,'2012-05-03 10:57:27'),
 (70,999,'deniz motoru',1,1,999,'2012-02-27 02:41:45',999,'2012-05-03 10:57:44'),
 (71,999,'makara',1,1,999,'2012-02-27 02:43:18',999,'2012-05-03 10:57:49'),
 (72,999,'balık bulucu',1,1,999,'2012-02-27 02:43:18',999,'2012-05-03 10:57:53'),
 (73,999,'yelek',1,1,999,'2012-02-27 03:14:29',999,'2012-05-03 10:57:55'),
 (74,999,'güverte',1,1,999,'2012-02-28 23:49:32',999,'2012-05-03 10:57:58'),
 (76,999,'gösterge',1,1,999,'2012-03-02 01:22:59',999,'2012-05-03 10:58:01'),
 (77,999,'havalandırma',1,1,999,'2012-03-05 01:48:23',999,'2012-05-03 10:58:07'),
 (78,999,'elektrik',1,1,999,'2012-03-05 01:48:23',999,'2012-05-03 10:58:10'),
 (79,999,'şişme botlar',1,1,999,'2012-03-05 01:48:23',999,'2012-05-03 10:58:16'),
 (80,999,'alışveriş',1,1,999,'2012-03-05 02:00:24',999,'2012-05-03 10:58:31'),
 (81,999,'mağaza',1,1,999,'2012-03-05 02:00:24',999,'2012-05-03 10:58:33'),
 (82,999,' lorem',1,1,999,'2012-03-05 02:00:24',999,'2012-03-14 22:54:07'),
 (83,999,' tipsum',1,1,999,'2012-03-05 02:00:25',999,'2012-03-14 22:54:07'),
 (84,999,' hede',1,1,999,'2012-03-05 02:00:25',999,'2012-03-14 22:54:07');
/*!40000 ALTER TABLE `tbl_etiketler` ENABLE KEYS */;


--
-- Definition of trigger `trg_etiketler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_etiketler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_etiketler_ek` BEFORE INSERT ON `tbl_etiketler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_etiketler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_etiketler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_etiketler_gun` BEFORE UPDATE ON `tbl_etiketler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_firma_adresler`
--

DROP TABLE IF EXISTS `tbl_firma_adresler`;
CREATE TABLE `tbl_firma_adresler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firma_id` int(1) NOT NULL DEFAULT '1',
  `baslik` varchar(255) NOT NULL DEFAULT '',
  `ulke_id` int(11) NOT NULL DEFAULT '-1',
  `ikon` varchar(45) NOT NULL DEFAULT '',
  `adres` longtext NOT NULL,
  `harita_url` varchar(600) DEFAULT NULL,
  `sira` int(11) NOT NULL DEFAULT '0',
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `ikon` (`ikon`),
  KEY `sira` (`sira`),
  KEY `firma_id` (`firma_id`),
  KEY `fk_firma_adresler_ulke_id` (`ulke_id`),
  CONSTRAINT `fk_firma_adresler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_firma_adresler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_firma_adresler_firma_id` FOREIGN KEY (`firma_id`) REFERENCES `tbl_sbt_firma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_firma_adresler_ulke_id` FOREIGN KEY (`ulke_id`) REFERENCES `tbl_sbt_ulke` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_firma_adresler`
--

/*!40000 ALTER TABLE `tbl_firma_adresler` DISABLE KEYS */;
INSERT INTO `tbl_firma_adresler` (`id`,`firma_id`,`baslik`,`ulke_id`,`ikon`,`adres`,`harita_url`,`sira`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,1,'HONG KONG',235,'hong_kong.png','<span>Unit 2 11/F North Point AsiaPac Commercial Centre, 10 North Point - <span>NORTH POINT</span>\n<br /><br />\nTel  : 00 852 51 75 12 28\n<br />\nFax : 00 852 24 89 22 31\n<br /><br />\n<a href=\"&#109;&#97;&#x69;&#108;&#x74;&#x6f;&#58;&#x68;&#111;&#110;&#103;&#x6b;&#111;&#110;&#103;&#x40;&#x73;&#x65;&#114;&#x61;&#115;&#x6d;&#x61;&#99;&#46;&#x63;&#111;&#x6d;\">&#x68;&#x6f;&#x6e;&#103;&#107;&#x6f;&#110;&#103;&#64;&#115;&#x65;&#x72;&#97;&#115;&#109;&#x61;&#x63;&#46;&#x63;&#111;&#x6d;</a>\n</span>','http://maps.google.com/maps?q=north+point,+hong+kong&hl=tr&ll=22.287627,114.19168&spn=0.024064,0.052314&sll=37.0625,-95.677068&sspn=42.03917,107.138672&oq=north+point+h&hnear=north+point,+hong+kong&t=m&z=15&iwloc=a',0,1,999,'2012-03-04 16:31:24',999,'2012-04-20 01:44:20'),
 (3,1,'CHINA',235,'china.png','<span>Clifford A19 Street 70/2F of Pan Yu - <span>GUANGZHOU</span>\n<br /><br />\nTel  : 00 86 13 60 06 43 43\n<br />\nFax : 00 86 20 84 80 23 10\n<br /><br />\n<a href=\"&#x6d;&#x61;&#x69;&#x6c;&#x74;&#x6f;&#x3a;&#99;&#x68;&#x69;&#x6e;&#x61;&#x40;&#115;&#101;&#114;&#97;&#x73;&#109;&#x61;&#x63;&#46;&#x63;&#x6f;&#109;\">&#99;&#104;&#105;&#110;&#x61;&#64;&#x73;&#x65;&#114;&#x61;&#x73;&#109;&#x61;&#x63;&#x2e;&#99;&#111;&#x6d;</a>\n</span>','http://maps.google.com/maps?q=guangzhou,+guangdong,+%c3%87in&hl=tr&ie=utf8&sll=22.287627,114.19168&sspn=0.024064,0.052314&hnear=guangzhou,+guangdong,+%c3%87in&t=m&z=9',1,1,999,'2012-03-04 16:37:24',999,'2012-04-20 01:44:14'),
 (4,1,'GERMANY',235,'germany.png','<span>Derner Kippshof 42 44329 - <span>DORTMUND</span>\n<br /><br />\nTel : 00 49 17 86 36 47 13\n<br /><br />\n<a href=\"&#109;&#97;&#105;&#x6c;&#x74;&#x6f;&#58;&#103;&#101;&#x72;&#109;&#97;&#x6e;&#x79;&#64;&#115;&#101;&#114;&#x61;&#115;&#x6d;&#x61;&#x63;&#46;&#x63;&#111;&#109;\">&#x67;&#101;&#114;&#109;&#97;&#110;&#x79;&#x40;&#115;&#x65;&#x72;&#97;&#115;&#109;&#x61;&#x63;&#46;&#x63;&#x6f;&#109;</a>\n</span>','http://maps.google.com/maps?q=derner+kippshof+42+44329+-+dortmund,+germany&hl=tr&ll=51.572758,7.517195&spn=0.001017,0.00327&sll=51.572884,7.517126&hnear=derner+kippshof+42,+44329+dortmund,+arnsberg,+nordrhein-westfalen,+almanya&t=m&z=19',2,1,999,'2012-03-04 16:40:12',999,'2012-04-20 01:44:14'),
 (5,1,'TURKIYE',235,'turkey.png','<span>Servi Mh. Ikibulbul Sk. Ata Apt. B Blok No.6 - <span>KUTAHYA</span>\n<br /><br />\nTel : 00 90 274 216 12 21\n<br /><br />\n<a href=\"&#109;&#x61;&#x69;&#108;&#116;&#111;&#x3a;&#x74;&#x75;&#114;&#x6b;&#101;&#x79;&#x40;&#x73;&#101;&#114;&#97;&#115;&#109;&#97;&#x63;&#x2e;&#x63;&#111;&#x6d;\">&#x74;&#x75;&#x72;&#x6b;&#x65;&#x79;&#x40;&#x73;&#101;&#114;&#97;&#115;&#109;&#x61;&#x63;&#46;&#99;&#111;&#x6d;</a>\n</span>','http://maps.google.com/maps?q=%c4%b0ki+b%c3%bclb%c3%bcl+sokak,+servi+mh.,+k%c3%bctahya,+t%c3%bcrkiye&hl=tr&ie=utf8&sll=51.572759,7.517197&sspn=0.00202,0.006539&oq=servi+mh.+%c4%b0ki+b%c3%bclb%c3%bcl+sk.+k%c3%bctahya&hnear=servi+mh.,+%c4%b0ki+b%c3%bclb%c3%bcl+sk,+k%c3%bctahya,+t%c3%bcrkiye&t=m&z=16',3,1,999,'2012-03-04 16:42:06',999,'2012-04-20 01:44:15');
/*!40000 ALTER TABLE `tbl_firma_adresler` ENABLE KEYS */;


--
-- Definition of trigger `trg_firma_adresler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_firma_adresler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_firma_adresler_ek` BEFORE INSERT ON `tbl_firma_adresler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_firma_adresler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_firma_adresler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_firma_adresler_gun` BEFORE UPDATE ON `tbl_firma_adresler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_giris_cikislar`
--

DROP TABLE IF EXISTS `tbl_giris_cikislar`;
CREATE TABLE `tbl_giris_cikislar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 admin, 1 kullanici',
  `admin_id` int(11) DEFAULT NULL,
  `kullanici_id` int(11) DEFAULT NULL,
  `islem` int(1) NOT NULL DEFAULT '0' COMMENT '0 giriş, 1 çıkış',
  `tarih` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `tarih` (`tarih`),
  KEY `islem` (`islem`),
  KEY `tip` (`tip`),
  KEY `kullanici_id` (`kullanici_id`),
  CONSTRAINT `fk_giris_cikislar_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_giris_cikislar_kullanici_id` FOREIGN KEY (`kullanici_id`) REFERENCES `tbl_kullanicilar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_giris_cikislar`
--

/*!40000 ALTER TABLE `tbl_giris_cikislar` DISABLE KEYS */;
INSERT INTO `tbl_giris_cikislar` (`id`,`tip`,`admin_id`,`kullanici_id`,`islem`,`tarih`) VALUES 
 (1,0,999,NULL,0,'2012-04-15 23:26:30'),
 (2,0,999,NULL,0,'2012-04-15 23:43:28'),
 (3,0,999,NULL,0,'2012-04-16 00:35:24'),
 (4,0,999,NULL,0,'2012-04-16 01:27:25'),
 (5,0,999,NULL,0,'2012-04-16 01:39:39'),
 (6,0,999,NULL,0,'2012-04-16 02:13:28'),
 (7,0,999,NULL,0,'2012-04-18 01:05:33'),
 (8,0,999,NULL,0,'2012-04-18 01:30:25'),
 (9,0,999,NULL,0,'2012-04-18 01:44:31'),
 (10,0,999,NULL,0,'2012-04-18 01:59:13'),
 (11,0,999,NULL,0,'2012-04-18 02:02:44'),
 (12,0,999,NULL,0,'2012-04-18 02:11:12'),
 (13,0,999,NULL,0,'2012-04-27 16:44:19'),
 (14,0,999,NULL,0,'2012-04-28 22:43:25'),
 (15,0,999,NULL,0,'2012-05-03 20:23:08'),
 (16,0,999,NULL,0,'2012-05-03 21:49:26'),
 (17,0,999,NULL,0,'2012-05-03 22:25:57'),
 (18,0,999,NULL,0,'2012-05-03 23:07:12'),
 (19,0,999,NULL,0,'2012-05-04 01:37:07'),
 (20,0,999,NULL,0,'2012-05-04 17:38:59'),
 (21,0,999,NULL,0,'2012-05-04 20:02:29'),
 (22,0,999,NULL,0,'2012-05-04 20:04:43'),
 (23,0,999,NULL,0,'2012-05-05 18:43:55'),
 (24,0,999,NULL,0,'2012-05-10 20:06:59'),
 (25,0,999,NULL,0,'2012-05-31 01:26:27');
/*!40000 ALTER TABLE `tbl_giris_cikislar` ENABLE KEYS */;


--
-- Definition of trigger `trg_giris_cikislar`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_giris_cikislar`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_giris_cikislar` BEFORE INSERT ON `tbl_giris_cikislar` FOR EACH ROW BEGIN
SET NEW.tarih = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_giris_cikislar_hatalar`
--

DROP TABLE IF EXISTS `tbl_giris_cikislar_hatalar`;
CREATE TABLE `tbl_giris_cikislar_hatalar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 admin, 1 kullanici',
  `admin_id` int(11) DEFAULT NULL,
  `kullanici_id` int(11) DEFAULT NULL,
  `kullanici_adi` varchar(320) DEFAULT NULL COMMENT 'sadece kullanici yok ise geçerli',
  `islem` int(1) NOT NULL DEFAULT '0' COMMENT '0 kullanici yok, 1 şifre yanlış, 2 onay yok',
  `tarih` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `islem` (`islem`),
  KEY `tarih` (`tarih`),
  KEY `kullanici_id` (`kullanici_id`),
  KEY `tip` (`tip`),
  CONSTRAINT `fk_giris_cikislar_hatalar_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_giris_cikislar_hatalar_kullanici_id` FOREIGN KEY (`kullanici_id`) REFERENCES `tbl_kullanicilar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_giris_cikislar_hatalar`
--

/*!40000 ALTER TABLE `tbl_giris_cikislar_hatalar` DISABLE KEYS */;
INSERT INTO `tbl_giris_cikislar_hatalar` (`id`,`tip`,`admin_id`,`kullanici_id`,`kullanici_adi`,`islem`,`tarih`) VALUES 
 (1,0,NULL,NULL,'q',1,'2012-04-18 01:14:22'),
 (2,1,NULL,NULL,'aa',0,'2012-04-18 01:38:55');
/*!40000 ALTER TABLE `tbl_giris_cikislar_hatalar` ENABLE KEYS */;


--
-- Definition of trigger `trg_giris_cikislar_hatalar`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_giris_cikislar_hatalar`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_giris_cikislar_hatalar` BEFORE INSERT ON `tbl_giris_cikislar_hatalar` FOR EACH ROW BEGIN
SET NEW.tarih = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_gunluk_kurlar`
--

DROP TABLE IF EXISTS `tbl_gunluk_kurlar`;
CREATE TABLE `tbl_gunluk_kurlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `para_birimi_id` int(11) NOT NULL DEFAULT '-1',
  `alis` double(11,5) DEFAULT NULL,
  `satis` double(11,5) DEFAULT NULL,
  `efektif_alis` double(11,5) DEFAULT NULL,
  `efektif_satis` double(11,5) DEFAULT NULL,
  `kur_tarih` date DEFAULT NULL,
  `tarih` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `para_birimi_id` (`para_birimi_id`),
  KEY `tarih` (`tarih`),
  KEY `alis` (`alis`),
  KEY `satis` (`satis`),
  KEY `efektif_alis` (`efektif_alis`),
  KEY `efektif_satis` (`efektif_satis`),
  CONSTRAINT `fk_gunluk_kurlar_para_birimi_id` FOREIGN KEY (`para_birimi_id`) REFERENCES `tbl_sbt_para_birim` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=895 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_gunluk_kurlar`
--

/*!40000 ALTER TABLE `tbl_gunluk_kurlar` DISABLE KEYS */;
INSERT INTO `tbl_gunluk_kurlar` (`id`,`para_birimi_id`,`alis`,`satis`,`efektif_alis`,`efektif_satis`,`kur_tarih`,`tarih`) VALUES 
 (271,2,1.77980,1.78840,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (272,9,1.79760,1.80570,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (273,4,0.31494,0.31649,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (274,8,0.26256,0.26529,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (275,7,1.94610,1.95860,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (276,11,0.30973,0.31182,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (277,13,2.18940,2.20390,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (278,12,0.47601,0.47687,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (279,10,6.34720,6.43080,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (280,3,1.82810,1.84010,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (281,5,2.34330,2.35460,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (282,6,2.87310,2.88810,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (283,16,0.06000,0.06079,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (284,15,0.53025,0.53723,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (285,17,0.01440,0.01459,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (286,14,1.18820,1.20390,NULL,NULL,'2012-04-24','2012-04-24 00:00:00'),
 (287,2,1.76610,1.77460,NULL,NULL,'2012-04-25','2012-04-26 09:19:05'),
 (288,9,1.79130,1.79940,NULL,NULL,'2012-04-25','2012-04-26 09:19:05'),
 (289,4,0.31365,0.31519,NULL,NULL,'2012-04-25','2012-04-26 09:19:05'),
 (290,8,0.26100,0.26372,NULL,NULL,'2012-04-25','2012-04-26 09:19:05'),
 (291,7,1.93890,1.95140,NULL,NULL,'2012-04-25','2012-04-26 09:19:05'),
 (292,11,0.30799,0.31007,NULL,NULL,'2012-04-25','2012-04-26 09:19:05'),
 (293,13,2.17010,2.18450,NULL,NULL,'2012-04-25','2012-04-26 09:19:05'),
 (294,12,0.47235,0.47320,NULL,NULL,'2012-04-25','2012-04-26 09:19:05'),
 (295,10,6.30280,6.38580,NULL,NULL,'2012-04-25','2012-04-26 09:19:05'),
 (296,3,1.82250,1.83440,NULL,NULL,'2012-04-25','2012-04-26 09:19:06'),
 (297,5,2.33380,2.34510,NULL,NULL,'2012-04-25','2012-04-26 09:19:06'),
 (298,6,2.84560,2.86050,NULL,NULL,'2012-04-25','2012-04-26 09:19:06'),
 (299,16,0.05977,0.06056,NULL,NULL,'2012-04-25','2012-04-26 09:19:06'),
 (300,15,0.52869,0.53565,NULL,NULL,'2012-04-25','2012-04-26 09:19:06'),
 (301,17,0.01428,0.01447,NULL,NULL,'2012-04-25','2012-04-26 09:19:06'),
 (302,14,1.18340,1.19900,NULL,NULL,'2012-04-25','2012-04-26 09:19:06'),
 (303,2,1.75690,1.76540,NULL,NULL,'2012-04-26','2012-04-26 16:29:22'),
 (304,9,1.78950,1.79760,NULL,NULL,'2012-04-26','2012-04-26 16:29:23'),
 (305,4,0.31230,0.31384,NULL,NULL,'2012-04-26','2012-04-26 16:29:23'),
 (306,8,0.26035,0.26306,NULL,NULL,'2012-04-26','2012-04-26 16:29:23'),
 (307,7,1.93060,1.94300,NULL,NULL,'2012-04-26','2012-04-26 16:29:23'),
 (308,11,0.30657,0.30864,NULL,NULL,'2012-04-26','2012-04-26 16:29:23'),
 (309,13,2.16520,2.17960,NULL,NULL,'2012-04-26','2012-04-26 16:29:23'),
 (310,12,0.46990,0.47075,NULL,NULL,'2012-04-26','2012-04-26 16:29:23'),
 (311,10,6.27000,6.35260,NULL,NULL,'2012-04-26','2012-04-26 16:29:23'),
 (312,3,1.81990,1.83180,NULL,NULL,'2012-04-26','2012-04-26 16:29:23'),
 (313,5,2.32350,2.33470,NULL,NULL,'2012-04-26','2012-04-26 16:29:23'),
 (314,6,2.84330,2.85820,NULL,NULL,'2012-04-26','2012-04-26 16:29:23'),
 (315,16,0.05948,0.06026,NULL,NULL,'2012-04-26','2012-04-26 16:29:23'),
 (316,15,0.52659,0.53353,NULL,NULL,'2012-04-26','2012-04-26 16:29:23'),
 (317,17,0.01421,0.01440,NULL,NULL,'2012-04-26','2012-04-26 16:29:23'),
 (318,14,1.17820,1.19370,NULL,NULL,'2012-04-26','2012-04-26 16:29:23'),
 (319,2,1.75350,1.76200,NULL,NULL,'2012-04-27','2012-04-27 17:30:40'),
 (320,9,1.78240,1.79050,NULL,NULL,'2012-04-27','2012-04-27 17:30:40'),
 (321,4,0.31149,0.31302,NULL,NULL,'2012-04-27','2012-04-27 17:30:40'),
 (322,8,0.25921,0.26191,NULL,NULL,'2012-04-27','2012-04-27 17:30:40'),
 (323,7,1.92540,1.93780,NULL,NULL,'2012-04-27','2012-04-27 17:30:40'),
 (324,11,0.30535,0.30741,NULL,NULL,'2012-04-27','2012-04-27 17:30:40'),
 (325,13,2.16990,2.18430,NULL,NULL,'2012-04-27','2012-04-27 17:30:40'),
 (326,12,0.46897,0.46982,NULL,NULL,'2012-04-27','2012-04-27 17:30:41'),
 (327,10,6.26250,6.34500,NULL,NULL,'2012-04-27','2012-04-27 17:30:41'),
 (328,3,1.82130,1.83320,NULL,NULL,'2012-04-27','2012-04-27 17:30:41'),
 (329,5,2.31730,2.32850,NULL,NULL,'2012-04-27','2012-04-27 17:30:41'),
 (330,6,2.84150,2.85640,NULL,NULL,'2012-04-27','2012-04-27 17:30:41'),
 (331,16,0.05913,0.05991,NULL,NULL,'2012-04-27','2012-04-27 17:30:41'),
 (332,15,0.52493,0.53184,NULL,NULL,'2012-04-27','2012-04-27 17:30:41'),
 (333,17,0.01418,0.01437,NULL,NULL,'2012-04-27','2012-04-27 17:30:41'),
 (334,14,1.17500,1.19050,NULL,NULL,'2012-04-27','2012-04-27 17:30:41'),
 (335,2,1.74890,1.75730,NULL,NULL,'2012-04-30','2012-05-01 09:07:18'),
 (336,9,1.78140,1.78950,NULL,NULL,'2012-04-30','2012-05-01 09:07:18'),
 (337,4,0.31093,0.31246,NULL,NULL,'2012-04-30','2012-05-01 09:07:18'),
 (338,8,0.25813,0.26082,NULL,NULL,'2012-04-30','2012-05-01 09:07:18'),
 (339,7,1.92190,1.93430,NULL,NULL,'2012-04-30','2012-05-01 09:07:18'),
 (340,11,0.30451,0.30656,NULL,NULL,'2012-04-30','2012-05-01 09:07:18'),
 (341,13,2.17820,2.19270,NULL,NULL,'2012-04-30','2012-05-01 09:07:18'),
 (342,12,0.46774,0.46858,NULL,NULL,'2012-04-30','2012-05-01 09:07:18'),
 (343,10,6.25030,6.33260,NULL,NULL,'2012-04-30','2012-05-01 09:07:18'),
 (344,3,1.82170,1.83360,NULL,NULL,'2012-04-30','2012-05-01 09:07:18'),
 (345,5,2.31320,2.32440,NULL,NULL,'2012-04-30','2012-05-01 09:07:18'),
 (346,6,2.84420,2.85910,NULL,NULL,'2012-04-30','2012-05-01 09:07:19'),
 (347,16,0.05904,0.05982,NULL,NULL,'2012-04-30','2012-05-01 09:07:19'),
 (348,15,0.52121,0.52807,NULL,NULL,'2012-04-30','2012-05-01 09:07:19'),
 (349,17,0.01414,0.01433,NULL,NULL,'2012-04-30','2012-05-01 09:07:19'),
 (350,14,1.17290,1.18830,NULL,NULL,'2012-04-30','2012-05-01 09:07:19'),
 (351,2,1.75150,1.75990,NULL,NULL,'2012-05-02','2012-05-02 17:04:35'),
 (352,9,1.77530,1.78330,NULL,NULL,'2012-05-02','2012-05-02 17:04:36'),
 (353,4,0.30987,0.31140,NULL,NULL,'2012-05-02','2012-05-02 17:04:36'),
 (354,8,0.25790,0.26058,NULL,NULL,'2012-05-02','2012-05-02 17:04:36'),
 (355,7,1.91510,1.92740,NULL,NULL,'2012-05-02','2012-05-02 17:04:36'),
 (356,11,0.30409,0.30614,NULL,NULL,'2012-05-02','2012-05-02 17:04:36'),
 (357,13,2.17680,2.19130,NULL,NULL,'2012-05-02','2012-05-02 17:04:36'),
 (358,12,0.46844,0.46928,NULL,NULL,'2012-05-02','2012-05-02 17:04:36'),
 (359,10,6.25500,6.33740,NULL,NULL,'2012-05-02','2012-05-02 17:04:36'),
 (360,3,1.80620,1.81800,NULL,NULL,'2012-05-02','2012-05-02 17:04:36'),
 (361,5,2.30550,2.31660,NULL,NULL,'2012-05-02','2012-05-02 17:04:36'),
 (362,6,2.83570,2.85050,NULL,NULL,'2012-05-02','2012-05-02 17:04:36'),
 (363,16,0.05901,0.05979,NULL,NULL,'2012-05-02','2012-05-02 17:04:36'),
 (364,15,0.51725,0.52406,NULL,NULL,'2012-05-02','2012-05-02 17:04:36'),
 (365,17,0.01416,0.01435,NULL,NULL,'2012-05-02','2012-05-02 17:04:36'),
 (366,14,1.16890,1.18430,NULL,NULL,'2012-05-02','2012-05-02 17:04:36'),
 (367,2,1.75110,1.75950,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (368,9,1.77920,1.78720,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (369,4,0.30927,0.31079,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (370,8,0.25792,0.26060,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (371,7,1.91170,1.92400,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (372,11,0.30421,0.30626,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (373,13,2.17590,2.19040,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (374,12,0.46833,0.46917,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (375,10,6.25140,6.33370,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (376,3,1.79870,1.81050,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (377,5,2.30070,2.31180,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (378,6,2.83210,2.84690,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (379,16,0.05884,0.05962,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (380,15,0.51764,0.52446,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (381,17,0.01416,0.01435,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (382,14,1.16650,1.18190,NULL,NULL,'2012-05-03','2012-05-03 17:30:00'),
 (383,2,1.74830,1.75670,NULL,NULL,'2012-05-04','2012-05-04 15:56:30'),
 (384,9,1.76840,1.77640,NULL,NULL,'2012-05-04','2012-05-04 15:56:30'),
 (385,4,0.30868,0.31020,NULL,NULL,'2012-05-04','2012-05-04 15:56:30'),
 (386,8,0.25655,0.25922,NULL,NULL,'2012-05-04','2012-05-04 15:56:30'),
 (387,7,1.90800,1.92030,NULL,NULL,'2012-05-04','2012-05-04 15:56:30'),
 (388,11,0.30312,0.30516,NULL,NULL,'2012-05-04','2012-05-04 15:56:30'),
 (389,13,2.17640,2.19090,NULL,NULL,'2012-05-04','2012-05-04 15:56:30'),
 (390,12,0.46758,0.46842,NULL,NULL,'2012-05-04','2012-05-04 15:56:30'),
 (391,10,6.24140,6.32360,NULL,NULL,'2012-05-04','2012-05-04 15:56:30'),
 (392,3,1.78820,1.79990,NULL,NULL,'2012-05-04','2012-05-04 15:56:30'),
 (393,5,2.29610,2.30720,NULL,NULL,'2012-05-04','2012-05-04 15:56:30'),
 (394,6,2.82680,2.84160,NULL,NULL,'2012-05-04','2012-05-04 15:56:30'),
 (395,16,0.05859,0.05936,NULL,NULL,'2012-05-04','2012-05-04 15:56:30'),
 (396,15,0.51678,0.52359,NULL,NULL,'2012-05-04','2012-05-04 15:56:30'),
 (397,17,0.01414,0.01433,NULL,NULL,'2012-05-04','2012-05-04 15:56:30'),
 (398,14,1.16450,1.17980,NULL,NULL,'2012-05-04','2012-05-04 15:56:31'),
 (399,2,1.75670,1.76520,NULL,NULL,'2012-05-07','2012-05-07 20:14:13'),
 (400,9,1.76390,1.77190,NULL,NULL,'2012-05-07','2012-05-07 20:14:13'),
 (401,4,0.30763,0.30914,NULL,NULL,'2012-05-07','2012-05-07 20:14:13'),
 (402,8,0.25522,0.25788,NULL,NULL,'2012-05-07','2012-05-07 20:14:13'),
 (403,7,1.90150,1.91370,NULL,NULL,'2012-05-07','2012-05-07 20:14:13'),
 (404,11,0.30164,0.30367,NULL,NULL,'2012-05-07','2012-05-07 20:14:13'),
 (405,13,2.19610,2.21070,NULL,NULL,'2012-05-07','2012-05-07 20:14:13'),
 (406,12,0.46983,0.47068,NULL,NULL,'2012-05-07','2012-05-07 20:14:13'),
 (407,10,6.26490,6.34740,NULL,NULL,'2012-05-07','2012-05-07 20:14:13'),
 (408,3,1.78510,1.79680,NULL,NULL,'2012-05-07','2012-05-07 20:14:13'),
 (409,5,2.28800,2.29900,NULL,NULL,'2012-05-07','2012-05-07 20:14:13'),
 (410,6,2.83710,2.85190,NULL,NULL,'2012-05-07','2012-05-07 20:14:14'),
 (411,16,0.05820,0.05897,NULL,NULL,'2012-05-07','2012-05-07 20:14:14'),
 (412,15,0.51496,0.52174,NULL,NULL,'2012-05-07','2012-05-07 20:14:14'),
 (413,17,0.01421,0.01440,NULL,NULL,'2012-05-07','2012-05-07 20:14:14'),
 (414,14,1.16010,1.17540,NULL,NULL,'2012-05-07','2012-05-07 20:14:14'),
 (415,2,1.75550,1.76400,NULL,NULL,'2012-05-08','2012-05-09 09:24:59'),
 (416,9,1.76170,1.76970,NULL,NULL,'2012-05-08','2012-05-09 09:24:59'),
 (417,4,0.30732,0.30883,NULL,NULL,'2012-05-08','2012-05-09 09:24:59'),
 (418,8,0.25549,0.25815,NULL,NULL,'2012-05-08','2012-05-09 09:24:59'),
 (419,7,1.89980,1.91200,NULL,NULL,'2012-05-08','2012-05-09 09:24:59'),
 (420,11,0.30164,0.30367,NULL,NULL,'2012-05-08','2012-05-09 09:24:59'),
 (421,13,2.19530,2.20990,NULL,NULL,'2012-05-08','2012-05-09 09:24:59'),
 (422,12,0.46951,0.47036,NULL,NULL,'2012-05-08','2012-05-09 09:24:59'),
 (423,10,6.25840,6.34080,NULL,NULL,'2012-05-08','2012-05-09 09:24:59'),
 (424,3,1.77820,1.78980,NULL,NULL,'2012-05-08','2012-05-09 09:24:59'),
 (425,5,2.28570,2.29670,NULL,NULL,'2012-05-08','2012-05-09 09:24:59'),
 (426,6,2.83300,2.84780,NULL,NULL,'2012-05-08','2012-05-09 09:24:59'),
 (427,16,0.05797,0.05873,NULL,NULL,'2012-05-08','2012-05-09 09:24:59'),
 (428,15,0.51491,0.52169,NULL,NULL,'2012-05-08','2012-05-09 09:25:00'),
 (429,17,0.01420,0.01439,NULL,NULL,'2012-05-08','2012-05-09 09:25:00'),
 (430,14,1.15890,1.17420,NULL,NULL,'2012-05-08','2012-05-09 09:25:00'),
 (431,2,1.78000,1.78860,NULL,NULL,'2012-05-09','2012-05-10 10:55:04'),
 (432,9,1.77490,1.78290,NULL,NULL,'2012-05-09','2012-05-10 10:55:04'),
 (433,4,0.31048,0.31201,NULL,NULL,'2012-05-09','2012-05-10 10:55:04'),
 (434,8,0.25795,0.26063,NULL,NULL,'2012-05-09','2012-05-10 10:55:04'),
 (435,7,1.91890,1.93130,NULL,NULL,'2012-05-09','2012-05-10 10:55:04'),
 (436,11,0.30427,0.30632,NULL,NULL,'2012-05-09','2012-05-10 10:55:04'),
 (437,13,2.23040,2.24520,NULL,NULL,'2012-05-09','2012-05-10 10:55:04'),
 (438,12,0.47606,0.47692,NULL,NULL,'2012-05-09','2012-05-10 10:55:04'),
 (439,10,6.34340,6.42690,NULL,NULL,'2012-05-09','2012-05-10 10:55:04'),
 (440,3,1.78800,1.79970,NULL,NULL,'2012-05-09','2012-05-10 10:55:04'),
 (441,5,2.30870,2.31980,NULL,NULL,'2012-05-09','2012-05-10 10:55:04'),
 (442,6,2.86790,2.88290,NULL,NULL,'2012-05-09','2012-05-10 10:55:05'),
 (443,16,0.05840,0.05917,NULL,NULL,'2012-05-09','2012-05-10 10:55:05'),
 (444,15,0.51829,0.52512,NULL,NULL,'2012-05-09','2012-05-10 10:55:05'),
 (445,17,0.01440,0.01459,NULL,NULL,'2012-05-09','2012-05-10 10:55:05'),
 (446,14,1.17070,1.18610,NULL,NULL,'2012-05-09','2012-05-10 10:55:05'),
 (447,2,1.77880,1.78740,NULL,NULL,'2012-05-10','2012-05-10 19:38:31'),
 (448,9,1.77730,1.78530,NULL,NULL,'2012-05-10','2012-05-10 19:38:32'),
 (449,4,0.30983,0.31136,NULL,NULL,'2012-05-10','2012-05-10 19:38:32'),
 (450,8,0.25629,0.25896,NULL,NULL,'2012-05-10','2012-05-10 19:38:32'),
 (451,7,1.91440,1.92670,NULL,NULL,'2012-05-10','2012-05-10 19:38:32'),
 (452,11,0.30388,0.30593,NULL,NULL,'2012-05-10','2012-05-10 19:38:32'),
 (453,13,2.22830,2.24310,NULL,NULL,'2012-05-10','2012-05-10 19:38:32'),
 (454,12,0.47574,0.47660,NULL,NULL,'2012-05-10','2012-05-10 19:38:33'),
 (455,10,6.33680,6.42030,NULL,NULL,'2012-05-10','2012-05-10 19:38:33'),
 (456,3,1.79450,1.80620,NULL,NULL,'2012-05-10','2012-05-10 19:38:33'),
 (457,5,2.30360,2.31470,NULL,NULL,'2012-05-10','2012-05-10 19:38:33'),
 (458,6,2.86790,2.88290,NULL,NULL,'2012-05-10','2012-05-10 19:38:33'),
 (459,16,0.05847,0.05924,NULL,NULL,'2012-05-10','2012-05-10 19:38:33'),
 (460,15,0.51677,0.52358,NULL,NULL,'2012-05-10','2012-05-10 19:38:33'),
 (461,17,0.01439,0.01458,NULL,NULL,'2012-05-10','2012-05-10 19:38:34'),
 (462,14,1.16790,1.18330,NULL,NULL,'2012-05-10','2012-05-10 19:38:34'),
 (463,2,1.77970,1.78830,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (464,9,1.77340,1.78140,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (465,4,0.30970,0.31123,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (466,8,0.25446,0.25711,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (467,7,1.91350,1.92580,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (468,11,0.30255,0.30459,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (469,13,2.22340,2.23820,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (470,12,0.47598,0.47684,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (471,10,6.33550,6.41890,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (472,3,1.78360,1.79530,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (473,5,2.30240,2.31350,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (474,6,2.86540,2.88040,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (475,16,0.05852,0.05929,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (476,15,0.51528,0.52207,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (477,17,0.01440,0.01459,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (478,14,1.16740,1.18280,NULL,NULL,'2012-05-11','2012-05-12 09:20:53'),
 (479,2,1.79850,1.80720,NULL,NULL,'2012-05-14','2012-05-14 16:20:38'),
 (480,9,1.79210,1.80020,NULL,NULL,'2012-05-14','2012-05-14 16:20:39'),
 (481,4,0.31142,0.31295,NULL,NULL,'2012-05-14','2012-05-14 16:20:39'),
 (482,8,0.25550,0.25816,NULL,NULL,'2012-05-14','2012-05-14 16:20:39'),
 (483,7,1.92440,1.93680,NULL,NULL,'2012-05-14','2012-05-14 16:20:39'),
 (484,11,0.30416,0.30621,NULL,NULL,'2012-05-14','2012-05-14 16:20:39'),
 (485,13,2.24470,2.25960,NULL,NULL,'2012-05-14','2012-05-14 16:20:39'),
 (486,12,0.48101,0.48188,NULL,NULL,'2012-05-14','2012-05-14 16:20:39'),
 (487,10,6.40010,6.48440,NULL,NULL,'2012-05-14','2012-05-14 16:20:39'),
 (488,3,1.79210,1.80380,NULL,NULL,'2012-05-14','2012-05-14 16:20:39'),
 (489,5,2.31500,2.32620,NULL,NULL,'2012-05-14','2012-05-14 16:20:39'),
 (490,6,2.88910,2.90420,NULL,NULL,'2012-05-14','2012-05-14 16:20:39'),
 (491,16,0.05881,0.05958,NULL,NULL,'2012-05-14','2012-05-14 16:20:39'),
 (492,15,0.51732,0.52413,NULL,NULL,'2012-05-14','2012-05-14 16:20:39'),
 (493,17,0.01455,0.01474,NULL,NULL,'2012-05-14','2012-05-14 16:20:39'),
 (494,14,1.17380,1.18930,NULL,NULL,'2012-05-14','2012-05-14 16:20:39'),
 (495,2,1.81690,1.82570,NULL,NULL,'2012-05-16','2012-05-16 19:28:36'),
 (496,9,1.80040,1.80850,NULL,NULL,'2012-05-16','2012-05-16 19:28:36'),
 (497,4,0.31097,0.31250,NULL,NULL,'2012-05-16','2012-05-16 19:28:36'),
 (498,8,0.25211,0.25473,NULL,NULL,'2012-05-16','2012-05-16 19:28:36'),
 (499,7,1.92160,1.93400,NULL,NULL,'2012-05-16','2012-05-16 19:28:36'),
 (500,11,0.30237,0.30441,NULL,NULL,'2012-05-16','2012-05-16 19:28:36'),
 (501,13,2.25480,2.26980,NULL,NULL,'2012-05-16','2012-05-16 19:28:37'),
 (502,12,0.48593,0.48681,NULL,NULL,'2012-05-16','2012-05-16 19:28:37'),
 (503,10,6.44710,6.53200,NULL,NULL,'2012-05-16','2012-05-16 19:28:37'),
 (504,3,1.79890,1.81070,NULL,NULL,'2012-05-16','2012-05-16 19:28:37'),
 (505,5,2.31170,2.32280,NULL,NULL,'2012-05-16','2012-05-16 19:28:37'),
 (506,6,2.89400,2.90910,NULL,NULL,'2012-05-16','2012-05-16 19:28:37'),
 (507,16,0.05825,0.05902,NULL,NULL,'2012-05-16','2012-05-16 19:28:37'),
 (508,15,0.51554,0.52233,NULL,NULL,'2012-05-16','2012-05-16 19:28:37'),
 (509,17,0.01470,0.01489,NULL,NULL,'2012-05-16','2012-05-16 19:28:37'),
 (510,14,1.17220,1.18760,NULL,NULL,'2012-05-16','2012-05-16 19:28:37'),
 (511,2,1.81600,1.82480,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (512,9,1.79240,1.80050,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (513,4,0.31027,0.31180,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (514,8,0.25129,0.25391,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (515,7,1.91710,1.92940,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (516,11,0.30349,0.30554,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (517,13,2.25770,2.27270,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (518,12,0.48569,0.48657,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (519,10,6.44390,6.52880,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (520,3,1.79880,1.81060,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (521,5,2.30620,2.31730,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (522,6,2.87960,2.89470,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (523,16,0.05798,0.05874,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (524,15,0.51467,0.52145,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (525,17,0.01469,0.01488,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (526,14,1.16960,1.18500,NULL,NULL,'2012-05-17','2012-05-17 22:04:54'),
 (527,2,1.82360,1.83240,NULL,NULL,'2012-05-18','2012-05-18 19:54:15'),
 (528,9,1.79280,1.80090,NULL,NULL,'2012-05-18','2012-05-18 19:54:15'),
 (529,4,0.31154,0.31307,NULL,NULL,'2012-05-18','2012-05-18 19:54:15'),
 (530,8,0.25255,0.25518,NULL,NULL,'2012-05-18','2012-05-18 19:54:15'),
 (531,7,1.92500,1.93740,NULL,NULL,'2012-05-18','2012-05-18 19:54:15'),
 (532,11,0.30420,0.30625,NULL,NULL,'2012-05-18','2012-05-18 19:54:15'),
 (533,13,2.29470,2.30990,NULL,NULL,'2012-05-18','2012-05-18 19:54:15'),
 (534,12,0.48772,0.48860,NULL,NULL,'2012-05-18','2012-05-18 19:54:16'),
 (535,10,6.46840,6.55360,NULL,NULL,'2012-05-18','2012-05-18 19:54:16'),
 (536,3,1.79500,1.80670,NULL,NULL,'2012-05-18','2012-05-18 19:54:16'),
 (537,5,2.31580,2.32700,NULL,NULL,'2012-05-18','2012-05-18 19:54:16'),
 (538,6,2.88140,2.89650,NULL,NULL,'2012-05-18','2012-05-18 19:54:16'),
 (539,16,0.05781,0.05857,NULL,NULL,'2012-05-18','2012-05-18 19:54:16'),
 (540,15,0.51659,0.52339,NULL,NULL,'2012-05-18','2012-05-18 19:54:16'),
 (541,17,0.01476,0.01495,NULL,NULL,'2012-05-18','2012-05-18 19:54:16'),
 (542,14,1.17430,1.18980,NULL,NULL,'2012-05-18','2012-05-18 19:54:16'),
 (543,2,1.82070,1.82950,NULL,NULL,'2012-05-21','2012-05-21 18:52:07'),
 (544,9,1.78550,1.79360,NULL,NULL,'2012-05-21','2012-05-21 18:52:07'),
 (545,4,0.31275,0.31429,NULL,NULL,'2012-05-21','2012-05-21 18:52:08'),
 (546,8,0.25362,0.25626,NULL,NULL,'2012-05-21','2012-05-21 18:52:08'),
 (547,7,1.93240,1.94480,NULL,NULL,'2012-05-21','2012-05-21 18:52:08'),
 (548,11,0.30467,0.30673,NULL,NULL,'2012-05-21','2012-05-21 18:52:08'),
 (549,13,2.29100,2.30620,NULL,NULL,'2012-05-21','2012-05-21 18:52:08'),
 (550,12,0.48695,0.48783,NULL,NULL,'2012-05-21','2012-05-21 18:52:08'),
 (551,10,6.46510,6.55030,NULL,NULL,'2012-05-21','2012-05-21 18:52:08'),
 (552,3,1.79020,1.80190,NULL,NULL,'2012-05-21','2012-05-21 18:52:08'),
 (553,5,2.32490,2.33610,NULL,NULL,'2012-05-21','2012-05-21 18:52:08'),
 (554,6,2.87760,2.89260,NULL,NULL,'2012-05-21','2012-05-21 18:52:08'),
 (555,16,0.05787,0.05863,NULL,NULL,'2012-05-21','2012-05-21 18:52:08'),
 (556,15,0.51898,0.52582,NULL,NULL,'2012-05-21','2012-05-21 18:52:08'),
 (557,17,0.01473,0.01492,NULL,NULL,'2012-05-21','2012-05-21 18:52:08'),
 (558,14,1.17880,1.19430,NULL,NULL,'2012-05-21','2012-05-21 18:52:08'),
 (559,2,1.81700,1.82580,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (560,9,1.78720,1.79530,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (561,4,0.31220,0.31374,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (562,8,0.25390,0.25654,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (563,7,1.92890,1.94130,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (564,11,0.30570,0.30776,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (565,13,2.27560,2.29070,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (566,12,0.48596,0.48684,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (567,10,6.45440,6.53940,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (568,3,1.79550,1.80720,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (569,5,2.32050,2.33170,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (570,6,2.86850,2.88350,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (571,16,0.05785,0.05861,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (572,15,0.51739,0.52420,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (573,17,0.01470,0.01489,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (574,14,1.17670,1.19220,NULL,NULL,'2012-05-22','2012-05-23 01:16:44'),
 (575,2,1.83900,1.84790,NULL,NULL,'2012-05-24','2012-05-25 00:11:11'),
 (576,9,1.79370,1.80180,NULL,NULL,'2012-05-24','2012-05-25 00:11:11'),
 (577,4,0.31096,0.31249,NULL,NULL,'2012-05-24','2012-05-25 00:11:11'),
 (578,8,0.25555,0.25821,NULL,NULL,'2012-05-24','2012-05-25 00:11:11'),
 (579,7,1.92120,1.93360,NULL,NULL,'2012-05-24','2012-05-25 00:11:11'),
 (580,11,0.30603,0.30809,NULL,NULL,'2012-05-24','2012-05-25 00:11:11'),
 (581,13,2.31180,2.32720,NULL,NULL,'2012-05-24','2012-05-25 00:11:12'),
 (582,12,0.49184,0.49273,NULL,NULL,'2012-05-24','2012-05-25 00:11:12'),
 (583,10,6.50920,6.59490,NULL,NULL,'2012-05-24','2012-05-25 00:11:12'),
 (584,3,1.79280,1.80450,NULL,NULL,'2012-05-24','2012-05-25 00:11:12'),
 (585,5,2.31120,2.32230,NULL,NULL,'2012-05-24','2012-05-25 00:11:12'),
 (586,6,2.88300,2.89810,NULL,NULL,'2012-05-24','2012-05-25 00:11:12'),
 (587,16,0.05760,0.05836,NULL,NULL,'2012-05-24','2012-05-25 00:11:12'),
 (588,15,0.51301,0.51977,NULL,NULL,'2012-05-24','2012-05-25 00:11:12'),
 (589,17,0.01487,0.01507,NULL,NULL,'2012-05-24','2012-05-25 00:11:12'),
 (590,14,1.17190,1.18730,NULL,NULL,'2012-05-24','2012-05-25 00:11:12'),
 (591,2,1.83190,1.84070,NULL,NULL,'2012-05-25','2012-05-26 14:05:12'),
 (592,9,1.78580,1.79390,NULL,NULL,'2012-05-25','2012-05-26 14:05:12'),
 (593,4,0.30987,0.31140,NULL,NULL,'2012-05-25','2012-05-26 14:05:13'),
 (594,8,0.25454,0.25719,NULL,NULL,'2012-05-25','2012-05-26 14:05:13'),
 (595,7,1.91330,1.92560,NULL,NULL,'2012-05-25','2012-05-26 14:05:13'),
 (596,11,0.30396,0.30601,NULL,NULL,'2012-05-25','2012-05-26 14:05:13'),
 (597,13,2.29800,2.31330,NULL,NULL,'2012-05-25','2012-05-26 14:05:13'),
 (598,12,0.48993,0.49081,NULL,NULL,'2012-05-25','2012-05-26 14:05:13'),
 (599,10,6.48620,6.57160,NULL,NULL,'2012-05-25','2012-05-26 14:05:13'),
 (600,3,1.79020,1.80190,NULL,NULL,'2012-05-25','2012-05-26 14:05:13'),
 (601,5,2.30280,2.31390,NULL,NULL,'2012-05-25','2012-05-26 14:05:13'),
 (602,6,2.87050,2.88550,NULL,NULL,'2012-05-25','2012-05-26 14:05:13'),
 (603,16,0.05704,0.05779,NULL,NULL,'2012-05-25','2012-05-26 14:05:13'),
 (604,15,0.51139,0.51813,NULL,NULL,'2012-05-25','2012-05-26 14:05:13'),
 (605,17,0.01481,0.01501,NULL,NULL,'2012-05-25','2012-05-26 14:05:13'),
 (606,14,1.16770,1.18310,NULL,NULL,'2012-05-25','2012-05-26 14:05:13'),
 (607,2,1.83070,1.83950,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (608,9,1.78320,1.79130,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (609,4,0.30668,0.30819,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (610,8,0.25249,0.25512,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (611,7,1.89480,1.90700,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (612,11,0.30238,0.30442,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (613,13,2.30790,2.32320,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (614,12,0.48961,0.49049,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (615,10,6.47040,6.55560,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (616,3,1.78600,1.79770,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (617,5,2.27940,2.29040,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (618,6,2.85180,2.86670,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (619,16,0.05574,0.05647,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (620,15,0.50635,0.51302,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (621,17,0.01481,0.01500,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (622,14,1.15570,1.17090,NULL,NULL,'2012-05-30','2012-05-31 01:25:51'),
 (623,2,1.85890,1.86790,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (624,9,1.79070,1.79880,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (625,4,0.30848,0.31000,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (626,8,0.25343,0.25607,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (627,7,1.90590,1.91820,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (628,11,0.30228,0.30432,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (629,13,2.37160,2.38740,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (630,12,0.49717,0.49807,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (631,10,6.55620,6.64260,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (632,3,1.79180,1.80350,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (633,5,2.29260,2.30370,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (634,6,2.84540,2.86030,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (635,16,0.05446,0.05518,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (636,15,0.50838,0.51508,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (637,17,0.01504,0.01524,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (638,14,1.16250,1.17780,NULL,NULL,'2012-06-01','2012-06-04 09:40:47'),
 (639,2,1.84300,1.85190,NULL,NULL,'2012-06-04','2012-06-05 09:02:14'),
 (640,9,1.77200,1.78000,NULL,NULL,'2012-06-04','2012-06-05 09:02:14'),
 (641,4,0.30819,0.30971,NULL,NULL,'2012-06-04','2012-06-05 09:02:14'),
 (642,8,0.25290,0.25553,NULL,NULL,'2012-06-04','2012-06-05 09:02:15'),
 (643,7,1.90400,1.91630,NULL,NULL,'2012-06-04','2012-06-05 09:02:15'),
 (644,11,0.30043,0.30246,NULL,NULL,'2012-06-04','2012-06-05 09:02:15'),
 (645,13,2.35560,2.37130,NULL,NULL,'2012-06-04','2012-06-05 09:02:15'),
 (646,12,0.49290,0.49379,NULL,NULL,'2012-06-04','2012-06-05 09:02:15'),
 (647,10,6.51160,6.59740,NULL,NULL,'2012-06-04','2012-06-05 09:02:15'),
 (648,3,1.78280,1.79450,NULL,NULL,'2012-06-04','2012-06-05 09:02:15'),
 (649,5,2.29040,2.30140,NULL,NULL,'2012-06-04','2012-06-05 09:02:15'),
 (650,6,2.83310,2.84790,NULL,NULL,'2012-06-04','2012-06-05 09:02:15'),
 (651,16,0.05403,0.05474,NULL,NULL,'2012-06-04','2012-06-05 09:02:15'),
 (652,15,0.50839,0.51509,NULL,NULL,'2012-06-04','2012-06-05 09:02:15'),
 (653,17,0.01491,0.01511,NULL,NULL,'2012-06-04','2012-06-05 09:02:15'),
 (654,14,1.16140,1.17670,NULL,NULL,'2012-06-04','2012-06-05 09:02:15'),
 (655,2,1.84190,1.85080,NULL,NULL,'2012-06-05','2012-06-06 09:44:05'),
 (656,9,1.77080,1.77880,NULL,NULL,'2012-06-05','2012-06-06 09:44:06'),
 (657,4,0.30808,0.30960,NULL,NULL,'2012-06-05','2012-06-06 09:44:06'),
 (658,8,0.25385,0.25649,NULL,NULL,'2012-06-05','2012-06-06 09:44:06'),
 (659,7,1.90360,1.91590,NULL,NULL,'2012-06-05','2012-06-06 09:44:06'),
 (660,11,0.30091,0.30294,NULL,NULL,'2012-06-05','2012-06-06 09:44:06'),
 (661,13,2.35030,2.36590,NULL,NULL,'2012-06-05','2012-06-06 09:44:06'),
 (662,12,0.49260,0.49349,NULL,NULL,'2012-06-05','2012-06-06 09:44:06'),
 (663,10,6.51240,6.59820,NULL,NULL,'2012-06-05','2012-06-06 09:44:06'),
 (664,3,1.79040,1.80210,NULL,NULL,'2012-06-05','2012-06-06 09:44:06'),
 (665,5,2.28970,2.30070,NULL,NULL,'2012-06-05','2012-06-06 09:44:06'),
 (666,6,2.82540,2.84020,NULL,NULL,'2012-06-05','2012-06-06 09:44:06'),
 (667,16,0.05489,0.05561,NULL,NULL,'2012-06-05','2012-06-06 09:44:06'),
 (668,15,0.50831,0.51500,NULL,NULL,'2012-06-05','2012-06-06 09:44:06'),
 (669,17,0.01490,0.01510,NULL,NULL,'2012-06-05','2012-06-06 09:44:06'),
 (670,14,1.16110,1.17640,NULL,NULL,'2012-06-05','2012-06-06 09:44:06'),
 (671,2,1.83110,1.83990,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (672,9,1.77400,1.78200,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (673,4,0.30799,0.30951,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (674,8,0.25289,0.25552,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (675,7,1.90310,1.91540,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (676,11,0.30050,0.30253,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (677,13,2.30960,2.32490,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (678,12,0.48971,0.49059,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (679,10,6.47640,6.56170,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (680,3,1.80270,1.81450,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (681,5,2.28940,2.30040,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (682,6,2.83170,2.84650,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (683,16,0.05580,0.05654,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (684,15,0.50874,0.51544,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (685,17,0.01481,0.01501,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (686,14,1.16080,1.17610,NULL,NULL,'2012-06-06','2012-06-07 08:45:01'),
 (687,2,1.82690,1.83570,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (688,9,1.76770,1.77570,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (689,4,0.30637,0.30788,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (690,8,0.25215,0.25477,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (691,7,1.89280,1.90500,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (692,11,0.29912,0.30114,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (693,13,2.30020,2.31550,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (694,12,0.48859,0.48947,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (695,10,6.45470,6.53970,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (696,3,1.79550,1.80720,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (697,5,2.27740,2.28840,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (698,6,2.81670,2.83140,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (699,16,0.05524,0.05597,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (700,15,0.50580,0.51246,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (701,17,0.01478,0.01497,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (702,14,1.15480,1.17000,NULL,NULL,'2012-06-08','2012-06-08 18:52:08'),
 (703,2,1.80660,1.81530,NULL,NULL,'2012-06-15','2012-06-16 22:21:55'),
 (704,9,1.76630,1.77430,NULL,NULL,'2012-06-15','2012-06-16 22:21:55'),
 (705,4,0.30683,0.30834,NULL,NULL,'2012-06-15','2012-06-16 22:21:55'),
 (706,8,0.25671,0.25938,NULL,NULL,'2012-06-15','2012-06-16 22:21:55'),
 (707,7,1.89560,1.90780,NULL,NULL,'2012-06-15','2012-06-16 22:21:55'),
 (708,11,0.30297,0.30501,NULL,NULL,'2012-06-15','2012-06-16 22:21:55'),
 (709,13,2.28820,2.30340,NULL,NULL,'2012-06-15','2012-06-16 22:21:55'),
 (710,12,0.48315,0.48402,NULL,NULL,'2012-06-15','2012-06-16 22:21:55'),
 (711,10,6.39890,6.48320,NULL,NULL,'2012-06-15','2012-06-16 22:21:56'),
 (712,3,1.81020,1.82200,NULL,NULL,'2012-06-15','2012-06-16 22:21:56'),
 (713,5,2.28050,2.29150,NULL,NULL,'2012-06-15','2012-06-16 22:21:56'),
 (714,6,2.80540,2.82010,NULL,NULL,'2012-06-15','2012-06-16 22:21:56'),
 (715,16,0.05517,0.05590,NULL,NULL,'2012-06-15','2012-06-16 22:21:56'),
 (716,15,0.50721,0.51389,NULL,NULL,'2012-06-15','2012-06-16 22:21:56'),
 (717,17,0.01462,0.01481,NULL,NULL,'2012-06-15','2012-06-16 22:21:56'),
 (718,14,1.15640,1.17160,NULL,NULL,'2012-06-15','2012-06-16 22:21:56'),
 (719,2,1.80150,1.81020,NULL,NULL,'2012-06-18','2012-06-18 19:15:06'),
 (720,9,1.75940,1.76740,NULL,NULL,'2012-06-18','2012-06-18 19:15:07'),
 (721,4,0.30649,0.30800,NULL,NULL,'2012-06-18','2012-06-18 19:15:07'),
 (722,8,0.25620,0.25887,NULL,NULL,'2012-06-18','2012-06-18 19:15:07'),
 (723,7,1.89370,1.90590,NULL,NULL,'2012-06-18','2012-06-18 19:15:07'),
 (724,11,0.30177,0.30381,NULL,NULL,'2012-06-18','2012-06-18 19:15:07'),
 (725,13,2.27280,2.28790,NULL,NULL,'2012-06-18','2012-06-18 19:15:07'),
 (726,12,0.48180,0.48267,NULL,NULL,'2012-06-18','2012-06-18 19:15:07'),
 (727,10,6.38320,6.46730,NULL,NULL,'2012-06-18','2012-06-18 19:15:07'),
 (728,3,1.81460,1.82650,NULL,NULL,'2012-06-18','2012-06-18 19:15:07'),
 (729,5,2.27820,2.28920,NULL,NULL,'2012-06-18','2012-06-18 19:15:07'),
 (730,6,2.82210,2.83690,NULL,NULL,'2012-06-18','2012-06-18 19:15:07'),
 (731,16,0.05539,0.05612,NULL,NULL,'2012-06-18','2012-06-18 19:15:07'),
 (732,15,0.50611,0.51278,NULL,NULL,'2012-06-18','2012-06-18 19:15:07'),
 (733,17,0.01458,0.01477,NULL,NULL,'2012-06-18','2012-06-18 19:15:07'),
 (734,14,1.15520,1.17040,NULL,NULL,'2012-06-18','2012-06-18 19:15:07'),
 (735,2,1.78450,1.79310,NULL,NULL,'2012-06-20','2012-06-21 11:49:57'),
 (736,9,1.75370,1.76160,NULL,NULL,'2012-06-20','2012-06-21 11:49:57'),
 (737,4,0.30474,0.30624,NULL,NULL,'2012-06-20','2012-06-21 11:49:57'),
 (738,8,0.25473,0.25738,NULL,NULL,'2012-06-20','2012-06-21 11:49:57'),
 (739,7,1.88340,1.89550,NULL,NULL,'2012-06-20','2012-06-21 11:49:57'),
 (740,11,0.30065,0.30268,NULL,NULL,'2012-06-20','2012-06-21 11:49:57'),
 (741,13,2.25610,2.27110,NULL,NULL,'2012-06-20','2012-06-21 11:49:57'),
 (742,12,0.47726,0.47812,NULL,NULL,'2012-06-20','2012-06-21 11:49:57'),
 (743,10,6.32750,6.41080,NULL,NULL,'2012-06-20','2012-06-21 11:49:57'),
 (744,3,1.81620,1.82810,NULL,NULL,'2012-06-20','2012-06-21 11:49:57'),
 (745,5,2.26540,2.27630,NULL,NULL,'2012-06-20','2012-06-21 11:49:57'),
 (746,6,2.80600,2.82070,NULL,NULL,'2012-06-20','2012-06-21 11:49:57'),
 (747,16,0.05440,0.05512,NULL,NULL,'2012-06-20','2012-06-21 11:49:58'),
 (748,15,0.50331,0.50994,NULL,NULL,'2012-06-20','2012-06-21 11:49:58'),
 (749,17,0.01444,0.01463,NULL,NULL,'2012-06-20','2012-06-21 11:49:58'),
 (750,14,1.14870,1.16380,NULL,NULL,'2012-06-20','2012-06-21 11:49:58'),
 (751,2,1.78950,1.79810,NULL,NULL,'2012-06-21','2012-06-22 13:17:02'),
 (752,9,1.75410,1.76200,NULL,NULL,'2012-06-21','2012-06-22 13:17:02'),
 (753,4,0.30505,0.30655,NULL,NULL,'2012-06-21','2012-06-22 13:17:02'),
 (754,8,0.25525,0.25791,NULL,NULL,'2012-06-21','2012-06-22 13:17:02'),
 (755,7,1.88500,1.89710,NULL,NULL,'2012-06-21','2012-06-22 13:17:02'),
 (756,11,0.30185,0.30389,NULL,NULL,'2012-06-21','2012-06-22 13:17:02'),
 (757,13,2.23700,2.25190,NULL,NULL,'2012-06-21','2012-06-22 13:17:02'),
 (758,12,0.47859,0.47945,NULL,NULL,'2012-06-21','2012-06-22 13:17:02'),
 (759,10,6.34290,6.42640,NULL,NULL,'2012-06-21','2012-06-22 13:17:03'),
 (760,3,1.81680,1.82870,NULL,NULL,'2012-06-21','2012-06-22 13:17:03'),
 (761,5,2.26800,2.27890,NULL,NULL,'2012-06-21','2012-06-22 13:17:03'),
 (762,6,2.80940,2.82410,NULL,NULL,'2012-06-21','2012-06-22 13:17:03'),
 (763,16,0.05401,0.05472,NULL,NULL,'2012-06-21','2012-06-22 13:17:03'),
 (764,15,0.50360,0.51023,NULL,NULL,'2012-06-21','2012-06-22 13:17:03'),
 (765,17,0.01448,0.01467,NULL,NULL,'2012-06-21','2012-06-22 13:17:03'),
 (766,14,1.15000,1.16510,NULL,NULL,'2012-06-21','2012-06-22 13:17:03'),
 (767,2,1.79780,1.80650,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (768,9,1.74840,1.75630,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (769,4,0.30330,0.30479,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (770,8,0.25473,0.25738,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (771,7,1.87460,1.88670,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (772,11,0.30076,0.30279,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (773,13,2.23400,2.24880,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (774,12,0.48082,0.48169,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (775,10,6.35880,6.44260,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (776,3,1.80010,1.81190,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (777,5,2.25500,2.26590,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (778,6,2.80450,2.81920,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (779,16,0.05342,0.05412,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (780,15,0.50026,0.50685,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (781,17,0.01454,0.01473,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (782,14,1.14330,1.15840,NULL,NULL,'2012-06-22','2012-06-22 17:09:19'),
 (783,2,1.81230,1.82100,NULL,NULL,'2012-06-25','2012-06-25 16:14:44'),
 (784,9,1.76240,1.77040,NULL,NULL,'2012-06-25','2012-06-25 16:14:44'),
 (785,4,0.30446,0.30596,NULL,NULL,'2012-06-25','2012-06-25 16:14:44'),
 (786,8,0.25544,0.25810,NULL,NULL,'2012-06-25','2012-06-25 16:14:44'),
 (787,7,1.88160,1.89370,NULL,NULL,'2012-06-25','2012-06-25 16:14:45'),
 (788,11,0.30151,0.30354,NULL,NULL,'2012-06-25','2012-06-25 16:14:45'),
 (789,13,2.26350,2.27850,NULL,NULL,'2012-06-25','2012-06-25 16:14:45'),
 (790,12,0.48469,0.48556,NULL,NULL,'2012-06-25','2012-06-25 16:14:45'),
 (791,10,6.40530,6.48970,NULL,NULL,'2012-06-25','2012-06-25 16:14:45'),
 (792,3,1.81030,1.82210,NULL,NULL,'2012-06-25','2012-06-25 16:14:45'),
 (793,5,2.26330,2.27420,NULL,NULL,'2012-06-25','2012-06-25 16:14:45'),
 (794,6,2.81790,2.83260,NULL,NULL,'2012-06-25','2012-06-25 16:14:45'),
 (795,16,0.05409,0.05480,NULL,NULL,'2012-06-25','2012-06-25 16:14:45'),
 (796,15,0.50230,0.50892,NULL,NULL,'2012-06-25','2012-06-25 16:14:45'),
 (797,17,0.01466,0.01485,NULL,NULL,'2012-06-25','2012-06-25 16:14:45'),
 (798,14,1.14770,1.16280,NULL,NULL,'2012-06-25','2012-06-25 16:14:45'),
 (799,2,1.81110,1.81980,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (800,9,1.76410,1.77210,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (801,4,0.30442,0.30592,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (802,8,0.25505,0.25770,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (803,7,1.88140,1.89350,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (804,11,0.30098,0.30301,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (805,13,2.27670,2.29180,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (806,12,0.48437,0.48524,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (807,10,6.40340,6.48770,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (808,3,1.81540,1.82730,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (809,5,2.26310,2.27400,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (810,6,2.82660,2.84140,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (811,16,0.05428,0.05499,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (812,15,0.50299,0.50962,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (813,17,0.01465,0.01484,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (814,14,1.14760,1.16270,NULL,NULL,'2012-06-26','2012-06-26 16:52:33'),
 (815,2,1.80110,1.80980,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (816,9,1.75710,1.76500,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (817,4,0.30260,0.30409,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (818,8,0.25322,0.25586,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (819,7,1.87010,1.88210,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (820,11,0.29850,0.30051,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (821,13,2.25810,2.27310,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (822,12,0.48172,0.48259,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (823,10,6.36600,6.44980,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (824,3,1.80980,1.82160,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (825,5,2.24960,2.26040,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (826,6,2.81180,2.82650,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (827,16,0.05426,0.05497,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (828,15,0.50188,0.50849,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (829,17,0.01457,0.01476,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (830,14,1.14080,1.15580,NULL,NULL,'2012-06-27','2012-06-27 16:16:04'),
 (831,2,1.79330,1.80190,NULL,NULL,'2012-07-04','2012-07-05 09:25:02'),
 (832,9,1.77080,1.77880,NULL,NULL,'2012-07-04','2012-07-05 09:25:02'),
 (833,4,0.30327,0.30476,NULL,NULL,'2012-07-04','2012-07-05 09:25:02'),
 (834,8,0.25751,0.26019,NULL,NULL,'2012-07-04','2012-07-05 09:25:02'),
 (835,7,1.87430,1.88640,NULL,NULL,'2012-07-04','2012-07-05 09:25:02'),
 (836,11,0.29957,0.30159,NULL,NULL,'2012-07-04','2012-07-05 09:25:02'),
 (837,13,2.24310,2.25800,NULL,NULL,'2012-07-04','2012-07-05 09:25:02'),
 (838,12,0.47962,0.48048,NULL,NULL,'2012-07-04','2012-07-05 09:25:02'),
 (839,10,6.34490,6.42850,NULL,NULL,'2012-07-04','2012-07-05 09:25:02'),
 (840,3,1.84000,1.85200,NULL,NULL,'2012-07-04','2012-07-05 09:25:02'),
 (841,5,2.25520,2.26610,NULL,NULL,'2012-07-04','2012-07-05 09:25:02'),
 (842,6,2.80510,2.81980,NULL,NULL,'2012-07-04','2012-07-05 09:25:02'),
 (843,16,0.05518,0.05591,NULL,NULL,'2012-07-04','2012-07-05 09:25:03'),
 (844,15,0.50005,0.50664,NULL,NULL,'2012-07-04','2012-07-05 09:25:03'),
 (845,17,0.01451,0.01470,NULL,NULL,'2012-07-04','2012-07-05 09:25:03'),
 (846,14,1.14350,1.15860,NULL,NULL,'2012-07-04','2012-07-05 09:25:03'),
 (847,2,1.80080,1.80950,NULL,NULL,'2012-07-05','2012-07-05 21:41:32'),
 (848,9,1.77900,1.78700,NULL,NULL,'2012-07-05','2012-07-05 21:41:33'),
 (849,4,0.30257,0.30406,NULL,NULL,'2012-07-05','2012-07-05 21:41:33'),
 (850,8,0.25861,0.26130,NULL,NULL,'2012-07-05','2012-07-05 21:41:33'),
 (851,7,1.87020,1.88220,NULL,NULL,'2012-07-05','2012-07-05 21:41:33'),
 (852,11,0.29963,0.30165,NULL,NULL,'2012-07-05','2012-07-05 21:41:33'),
 (853,13,2.25540,2.27040,NULL,NULL,'2012-07-05','2012-07-05 21:41:33'),
 (854,12,0.48164,0.48251,NULL,NULL,'2012-07-05','2012-07-05 21:41:33'),
 (855,10,6.36030,6.44410,NULL,NULL,'2012-07-05','2012-07-05 21:41:33'),
 (856,3,1.84810,1.86020,NULL,NULL,'2012-07-05','2012-07-05 21:41:33'),
 (857,5,2.25040,2.26130,NULL,NULL,'2012-07-05','2012-07-05 21:41:33'),
 (858,6,2.80430,2.81900,NULL,NULL,'2012-07-05','2012-07-05 21:41:33'),
 (859,16,0.05502,0.05574,NULL,NULL,'2012-07-05','2012-07-05 21:41:33'),
 (860,15,0.49810,0.50466,NULL,NULL,'2012-07-05','2012-07-05 21:41:33'),
 (861,17,0.01457,0.01476,NULL,NULL,'2012-07-05','2012-07-05 21:41:33'),
 (862,14,1.14120,1.15620,NULL,NULL,'2012-07-05','2012-07-05 21:41:33'),
 (863,2,1.80950,1.81820,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (864,9,1.78310,1.79120,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (865,4,0.30101,0.30249,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (866,8,0.25778,0.26046,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (867,7,1.86200,1.87400,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (868,11,0.29784,0.29985,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (869,13,2.26220,2.27720,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (870,12,0.48396,0.48483,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (871,10,6.37730,6.46130,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (872,3,1.85430,1.86640,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (873,5,2.24010,2.25090,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (874,6,2.81010,2.82480,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (875,16,0.05495,0.05567,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (876,15,0.49171,0.49819,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (877,17,0.01464,0.01483,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (878,14,1.13590,1.15090,NULL,NULL,'2012-07-06','2012-07-06 16:06:13'),
 (879,2,1.80770,1.81640,NULL,NULL,'2012-07-12','2012-07-13 10:15:13'),
 (880,9,1.76810,1.77610,NULL,NULL,'2012-07-12','2012-07-13 10:15:14'),
 (881,4,0.29657,0.29803,NULL,NULL,'2012-07-12','2012-07-13 10:15:14'),
 (882,8,0.25571,0.25837,NULL,NULL,'2012-07-12','2012-07-13 10:15:14'),
 (883,7,1.83360,1.84540,NULL,NULL,'2012-07-12','2012-07-13 10:15:14'),
 (884,11,0.29459,0.29658,NULL,NULL,'2012-07-12','2012-07-13 10:15:14'),
 (885,13,2.27460,2.28970,NULL,NULL,'2012-07-12','2012-07-13 10:15:14'),
 (886,12,0.48348,0.48435,NULL,NULL,'2012-07-12','2012-07-13 10:15:14'),
 (887,10,6.35960,6.44340,NULL,NULL,'2012-07-12','2012-07-13 10:15:14'),
 (888,3,1.82930,1.84130,NULL,NULL,'2012-07-12','2012-07-13 10:15:14'),
 (889,5,2.20600,2.21660,NULL,NULL,'2012-07-12','2012-07-13 10:15:14'),
 (890,6,2.79280,2.80740,NULL,NULL,'2012-07-12','2012-07-13 10:15:14'),
 (891,16,0.05475,0.05547,NULL,NULL,'2012-07-12','2012-07-13 10:15:14'),
 (892,15,0.48279,0.48915,NULL,NULL,'2012-07-12','2012-07-13 10:15:14'),
 (893,17,0.01463,0.01482,NULL,NULL,'2012-07-12','2012-07-13 10:15:14'),
 (894,14,1.11860,1.13330,NULL,NULL,'2012-07-12','2012-07-13 10:15:14');
/*!40000 ALTER TABLE `tbl_gunluk_kurlar` ENABLE KEYS */;


--
-- Definition of trigger `trg_gunluk_kurlar_tarih`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_gunluk_kurlar_tarih`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_gunluk_kurlar_tarih` BEFORE INSERT ON `tbl_gunluk_kurlar` FOR EACH ROW BEGIN
SET NEW.tarih = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_haberler`
--

DROP TABLE IF EXISTS `tbl_haberler`;
CREATE TABLE `tbl_haberler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dil_id` int(11) NOT NULL DEFAULT '-1',
  `resim` varchar(255) DEFAULT NULL,
  `ad` varchar(255) NOT NULL DEFAULT '',
  `text` longtext NOT NULL,
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `dil_id` (`dil_id`),
  KEY `onay` (`onay`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_haberler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_haberler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_haberler_dil_id` FOREIGN KEY (`dil_id`) REFERENCES `tbl_diller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_haberler`
--

/*!40000 ALTER TABLE `tbl_haberler` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_haberler` ENABLE KEYS */;


--
-- Definition of trigger `trg_haberler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_haberler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_haberler_ek` BEFORE INSERT ON `tbl_haberler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_haberler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_haberler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_haberler_gun` BEFORE UPDATE ON `tbl_haberler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_headerlar`
--

DROP TABLE IF EXISTS `tbl_headerlar`;
CREATE TABLE `tbl_headerlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dil_id` int(11) NOT NULL DEFAULT '-1',
  `baslik` varchar(255) NOT NULL DEFAULT '',
  `text` longtext,
  `resim` varchar(255) NOT NULL DEFAULT '',
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `dil_id` (`dil_id`),
  KEY `onay` (`onay`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_headerlar_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_headerlar_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_headerlar_dil_id` FOREIGN KEY (`dil_id`) REFERENCES `tbl_diller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_headerlar`
--

/*!40000 ALTER TABLE `tbl_headerlar` DISABLE KEYS */;
INSERT INTO `tbl_headerlar` (`id`,`dil_id`,`baslik`,`text`,`resim`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,999,'DÜNYANIN DÖRT BİR YANINDA SİZLERLE','Çin, Hong Kong ve Almanya `da bulunan mevcut ofislerimiz ile Mısır, Pakistan, Kore, Fransa, Lübnan ve diğer ülkelerden sonra, Türkiye `de ki ofisimiz, bayi ve temsilcilerimizle beraber, sürekli ve kesintisiz hizmet vermekteyiz.','world.jpg',1,999,NULL,999,'2011-12-04 22:41:47'),
 (2,999,'DAİMA KALİTELİ VE STABİL ÜRÜNLER','Çin ofisimiz tarafından özenle seçilen, alanında uzman tedarikçilere istenilen özellik ve ebatlarda ürettirilen makinalarımız, üretimin her aşamasında kontrol altında olup, sürekli kalite ve stabilite testlerine tabi tutulmaktadır. Bu sayede %100 `e kadar uyumlu malzeme kullanılarak, iç verim oranı ve makine dayanımı yükseltilmektedir.','factory.jpg',1,999,NULL,999,'2011-12-04 22:41:48'),
 (3,999,'HER ZAMAN MAKUL FİYATLAR','Her geçen gün artan pazar payı ve üretimin her aşamasında kullanılan en son teknolojiler ile daha kaliteli ve dayanıklı malzeme kullanımını birleştirerek, ürünlerimizi daha makul fiyatlarla sizlere sunmaktayız.','price.jpg',1,999,NULL,999,'2011-12-04 22:41:48'),
 (4,999,'ZAMANIN DEĞERİNİ ÇOK İYİ BİLİYORUZ','Günümüz yaşam koşullarında herkesin zamanı çok kısıtlı ve değerli. Bu kısıtlı zamanı daha kaliteli ve verimli olarak değerlendirebilmeniz için üretimde harcadığınız zamanı kısaltarak daha az bir sürede daha kaliteli üretim yapmanızı sağlıyoruz.','time.jpg',1,999,NULL,999,'2011-12-04 22:41:48');
/*!40000 ALTER TABLE `tbl_headerlar` ENABLE KEYS */;


--
-- Definition of trigger `trg_headerlar_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_headerlar_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_headerlar_ek` BEFORE INSERT ON `tbl_headerlar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_headerlar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_headerlar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_headerlar_gun` BEFORE UPDATE ON `tbl_headerlar` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_hesap_nolar`
--

DROP TABLE IF EXISTS `tbl_hesap_nolar`;
CREATE TABLE `tbl_hesap_nolar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banka_id` int(11) NOT NULL DEFAULT '-1',
  `sube` varchar(255) NOT NULL DEFAULT '',
  `sube_kodu` varchar(10) DEFAULT NULL,
  `hesap_sahibi` varchar(255) NOT NULL,
  `hesap_no` varchar(20) NOT NULL DEFAULT '',
  `iban` varchar(34) DEFAULT NULL,
  `aciklama` longtext,
  `onay` tinyint(1) DEFAULT '1',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `iban` (`iban`),
  KEY `banka_id` (`banka_id`),
  KEY `sube_kodu` (`sube_kodu`),
  KEY `onay` (`onay`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_hesap_nolar_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hesap_nolar_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hesap_nolar_banka_id` FOREIGN KEY (`banka_id`) REFERENCES `tbl_sbt_banka` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_hesap_nolar`
--

/*!40000 ALTER TABLE `tbl_hesap_nolar` DISABLE KEYS */;
INSERT INTO `tbl_hesap_nolar` (`id`,`banka_id`,`sube`,`sube_kodu`,`hesap_sahibi`,`hesap_no`,`iban`,`aciklama`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,1,999,'2012-03-26 23:03:01',NULL,NULL),
 (2,18,'Antalya','743','Hüseyin Yıldırım','6889831','TR01234567890102345678965255555554',NULL,1,999,'2012-04-30 13:14:12',999,'2012-04-30 13:14:27'),
 (3,17,'Alaşehir','1000','Hatice Yıldırım','7436895','TR01234567890102345678965255555553',NULL,1,999,'2012-04-30 13:14:47',999,'2012-04-30 13:14:56');
/*!40000 ALTER TABLE `tbl_hesap_nolar` ENABLE KEYS */;


--
-- Definition of trigger `trg_hesap_nolar_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_hesap_nolar_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_hesap_nolar_ek` BEFORE INSERT ON `tbl_hesap_nolar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_hesap_nolar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_hesap_nolar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_hesap_nolar_gun` BEFORE UPDATE ON `tbl_hesap_nolar` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_ikonlar`
--

DROP TABLE IF EXISTS `tbl_ikonlar`;
CREATE TABLE `tbl_ikonlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dil_id` int(11) NOT NULL DEFAULT '-1',
  `ikon` varchar(255) NOT NULL DEFAULT '',
  `alt` varchar(250) DEFAULT NULL,
  `yer` int(1) NOT NULL DEFAULT '0' COMMENT '0 ust, 1 alt',
  `konum` int(1) NOT NULL DEFAULT '0' COMMENT '0 sol, 1 sağ',
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `dil_id` (`dil_id`),
  KEY `yer` (`yer`),
  KEY `konum` (`konum`),
  KEY `onay` (`onay`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_ikonlar_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ikonlar_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ikonlar_dil_id` FOREIGN KEY (`dil_id`) REFERENCES `tbl_diller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_ikonlar`
--

/*!40000 ALTER TABLE `tbl_ikonlar` DISABLE KEYS */;
INSERT INTO `tbl_ikonlar` (`id`,`dil_id`,`ikon`,`alt`,`yer`,`konum`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,999,'ce.png',NULL,1,0,1,999,'2012-01-26 15:08:52',999,'2012-04-15 23:34:53'),
 (2,999,'guarantee.png',NULL,1,1,1,999,NULL,999,'2012-04-15 23:34:53'),
 (3,999,'left.png',NULL,0,0,1,999,NULL,999,'2012-04-15 23:34:53'),
 (4,999,'satisfaction.png',NULL,0,1,1,999,NULL,999,'2012-04-15 23:34:53'),
 (5,1,'ce.png',NULL,1,0,1,999,'2012-01-26 15:23:28',999,'2012-01-26 15:15:01'),
 (6,1,'guarantee_en.png',NULL,1,1,1,999,'2012-01-26 15:23:28',999,'2012-01-26 15:14:59'),
 (7,1,'left.png',NULL,0,0,1,999,'2012-01-26 15:23:28',999,'2012-01-26 15:15:10'),
 (8,1,'satisfaction_en.png',NULL,0,1,1,999,'2012-01-26 15:23:28',999,'2012-01-26 15:15:05');
/*!40000 ALTER TABLE `tbl_ikonlar` ENABLE KEYS */;


--
-- Definition of trigger `trg_ikonlar_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_ikonlar_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_ikonlar_ek` BEFORE INSERT ON `tbl_ikonlar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_ikonlar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_ikonlar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_ikonlar_gun` BEFORE UPDATE ON `tbl_ikonlar` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_iletisimler`
--

DROP TABLE IF EXISTS `tbl_iletisimler`;
CREATE TABLE `tbl_iletisimler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_soyad` varchar(255) NOT NULL DEFAULT '',
  `mail` varchar(320) NOT NULL DEFAULT '',
  `telefon` varchar(15) NOT NULL DEFAULT '',
  `gorusler` longtext NOT NULL,
  `tarih` datetime DEFAULT NULL,
  `okundu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 ise hayır, 1 ise evet',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `okundu` (`okundu`),
  KEY `tarih` (`tarih`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_iletisimler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_iletisimler`
--

/*!40000 ALTER TABLE `tbl_iletisimler` DISABLE KEYS */;
INSERT INTO `tbl_iletisimler` (`id`,`ad_soyad`,`mail`,`telefon`,`gorusler`,`tarih`,`okundu`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,'FATIH ÜNAL','fatih@acoder.info','009053323132722','fffgfg<br/>fdgdf<br/>g<br/>dfg<br/>fd<br/>g<br/>dfg<br/>df<br/>gdf<br/>g','2012-03-13 01:37:02',1,999,'2012-03-13 02:18:12'),
 (2,'D','deneme@deneme.com','555555555555555','<br/>Sizlere sundugumuz hizmet kalitesinin gelistirilmesi sizlerden aldigimiz öneri, görüs ve elestirilerin degerlendirilmesiyle dogru orantili olarak gelismektedir. <br/><br/>Sürekli gelisim sürecimize destek olacak öneri ve beklentilerinizi bizlerle paylasmanizdan memnuniyet duyacagiz. <br/><br/>Mesajlariniz tarafimizdan titizlikle incelenecek ve alinacak aksiyonlara temel olusturacaktir. Sizlerin beklentilerini ve memnuniyetini arttirarak, \"%100 müsteri memnuniyeti\" anlayisimizi birlikte daha ileriye tasimak dilegiyle.','2012-03-13 02:54:47',1,999,'2012-03-13 02:57:54'),
 (3,'H&#252;seyin Yıldırım','huseyinyildirim@hotmail.com','5436063222','denemedir','2012-05-06 21:45:31',0,NULL,NULL);
/*!40000 ALTER TABLE `tbl_iletisimler` ENABLE KEYS */;


--
-- Definition of trigger `trg_iletisimler_tarih`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_iletisimler_tarih`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_iletisimler_tarih` BEFORE INSERT ON `tbl_iletisimler` FOR EACH ROW BEGIN
SET NEW.tarih = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_iletisimler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_iletisimler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_iletisimler_gun` BEFORE UPDATE ON `tbl_iletisimler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_indirimler`
--

DROP TABLE IF EXISTS `tbl_indirimler`;
CREATE TABLE `tbl_indirimler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) DEFAULT NULL,
  `yuzde` float(11,3) DEFAULT NULL,
  `onay` tinyint(1) DEFAULT '1',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `onay` (`onay`),
  KEY `yuzde` (`yuzde`),
  CONSTRAINT `fk_indirimler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_indirimler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_indirimler`
--

/*!40000 ALTER TABLE `tbl_indirimler` DISABLE KEYS */;
INSERT INTO `tbl_indirimler` (`id`,`ad`,`yuzde`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,'KDV BİZDEN %18',1.180,1,999,'2012-03-18 03:37:13',999,'2012-03-28 00:23:22'),
 (2,'BAHAR KAMPANYASI %10',1.100,1,999,'2012-03-18 03:37:13',999,'2012-03-28 00:23:18');
/*!40000 ALTER TABLE `tbl_indirimler` ENABLE KEYS */;


--
-- Definition of trigger `trg_indirimler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_indirimler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_indirimler_ek` BEFORE INSERT ON `tbl_indirimler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_indirimler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_indirimler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_indirimler_gun` BEFORE UPDATE ON `tbl_indirimler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_islemler`
--

DROP TABLE IF EXISTS `tbl_islemler`;
CREATE TABLE `tbl_islemler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 admin, 1 kullanici',
  `admin_id` int(11) DEFAULT NULL,
  `kullanici_id` int(11) DEFAULT NULL,
  `tablo` varchar(60) NOT NULL DEFAULT '',
  `kayit_id` int(11) NOT NULL DEFAULT '0',
  `islem` int(1) NOT NULL DEFAULT '0' COMMENT '0 insert, 1 update, 2 delete',
  `tarih` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `islem` (`islem`),
  KEY `tarih` (`tarih`),
  KEY `kayit_id` (`kayit_id`),
  KEY `kullanici_id` (`kullanici_id`),
  KEY `tablo` (`tablo`),
  CONSTRAINT `fk_islemler_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_islemler_kullanici_id` FOREIGN KEY (`kullanici_id`) REFERENCES `tbl_kullanicilar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_islemler`
--

/*!40000 ALTER TABLE `tbl_islemler` DISABLE KEYS */;
INSERT INTO `tbl_islemler` (`id`,`tip`,`admin_id`,`kullanici_id`,`tablo`,`kayit_id`,`islem`,`tarih`) VALUES 
 (1,0,999,NULL,'tbl_ikonlar',4,1,'2012-04-15 23:34:31'),
 (2,0,999,NULL,'tbl_ikonlar',3,1,'2012-04-15 23:34:31'),
 (3,0,999,NULL,'tbl_ikonlar',2,1,'2012-04-15 23:34:31'),
 (4,0,999,NULL,'tbl_ikonlar',1,1,'2012-04-15 23:34:31'),
 (5,0,999,NULL,'tbl_ikonlar',4,1,'2012-04-15 23:34:53'),
 (6,0,999,NULL,'tbl_ikonlar',3,1,'2012-04-15 23:34:53'),
 (7,0,999,NULL,'tbl_ikonlar',2,1,'2012-04-15 23:34:53'),
 (8,0,999,NULL,'tbl_ikonlar',1,1,'2012-04-15 23:34:53'),
 (9,0,999,NULL,'tbl_textler',60,0,'2012-04-16 00:44:54'),
 (10,0,999,NULL,'tbl_textler',60,2,'2012-04-16 00:45:05'),
 (11,0,999,NULL,'tbl_textler',41,1,'2012-04-16 00:45:24'),
 (12,0,999,NULL,'tbl_textler',41,1,'2012-04-16 00:45:49'),
 (13,0,999,NULL,'tbl_textler',26,1,'2012-04-16 00:46:07'),
 (14,0,999,NULL,'tbl_textler',26,1,'2012-04-16 00:46:28'),
 (15,0,999,NULL,'tbl_firma_adresler',6,0,'2012-04-16 00:54:45'),
 (16,0,999,NULL,'tbl_firma_adresler',6,1,'2012-04-16 00:55:08'),
 (17,0,999,NULL,'tbl_firma_adresler',6,2,'2012-04-16 00:56:17'),
 (18,0,999,NULL,'tbl_diller',1001,0,'2012-04-16 01:04:55'),
 (19,0,999,NULL,'tbl_diller',1001,2,'2012-04-16 01:05:04'),
 (20,0,999,NULL,'tbl_diller',1003,0,'2012-04-16 01:36:58'),
 (21,0,999,NULL,'tbl_diller',1003,1,'2012-04-16 01:37:43'),
 (22,0,999,NULL,'tbl_diller',1003,2,'2012-04-16 01:37:48'),
 (23,0,999,NULL,'tbl_diller',1004,0,'2012-04-16 01:38:02'),
 (24,0,999,NULL,'tbl_diller',1004,1,'2012-04-16 01:38:12'),
 (25,0,999,NULL,'tbl_diller',1004,1,'2012-04-16 01:38:48'),
 (26,0,999,NULL,'tbl_diller',1004,1,'2012-04-16 01:38:53'),
 (27,0,999,NULL,'tbl_diller',1004,1,'2012-04-16 01:39:03'),
 (28,0,999,NULL,'tbl_diller',1004,1,'2012-04-16 01:39:11'),
 (29,0,999,NULL,'tbl_diller',1004,1,'2012-04-16 01:39:18'),
 (30,0,999,NULL,'tbl_diller',1004,1,'2012-04-16 01:39:25'),
 (31,0,999,NULL,'tbl_diller',1004,2,'2012-04-16 01:39:30'),
 (32,0,999,NULL,'tbl_sbt_firma',1,1,'2012-04-16 01:58:28'),
 (33,0,999,NULL,'tbl_sbt_firma',1,1,'2012-04-16 02:00:32'),
 (34,0,999,NULL,'tbl_sbt_firma',1,1,'2012-04-16 02:01:59'),
 (35,0,999,NULL,'tbl_sbt_firma',1,1,'2012-04-16 02:02:34'),
 (36,0,999,NULL,'tbl_sbt_firma',1,1,'2012-04-16 02:05:05'),
 (37,0,999,NULL,'tbl_scriptler',4,2,'2012-04-18 02:06:53'),
 (38,0,999,NULL,'tbl_scriptler',5,0,'2012-04-18 02:09:08'),
 (39,0,999,NULL,'tbl_scriptler',5,1,'2012-04-18 02:09:16'),
 (40,0,999,NULL,'tbl_urunler',42,1,'2012-04-27 16:46:45'),
 (41,0,999,NULL,'tbl_urunler_markalar',1,0,'2012-04-27 16:46:45'),
 (42,0,999,NULL,'tbl_urunler_markalar',2,0,'2012-04-27 16:46:45'),
 (43,0,999,NULL,'tbl_urunler_markalar',3,0,'2012-04-27 16:46:45'),
 (44,0,999,NULL,'tbl_urunler_markalar',4,0,'2012-04-27 16:46:45'),
 (45,0,999,NULL,'tbl_urunler_kategoriler',1,0,'2012-04-27 16:46:45'),
 (46,0,999,NULL,'tbl_urunler_kategoriler',2,0,'2012-04-27 16:46:45'),
 (47,0,999,NULL,'tbl_urunler_kategoriler',3,0,'2012-04-27 16:46:46'),
 (48,0,999,NULL,'tbl_urunler_kategoriler',4,0,'2012-04-27 16:46:46'),
 (49,0,999,NULL,'tbl_urunler_kategoriler',5,0,'2012-04-27 16:46:46'),
 (50,0,999,NULL,'tbl_urunler_kategoriler',6,0,'2012-04-27 16:46:46'),
 (51,0,999,NULL,'tbl_urunler_kategoriler',7,0,'2012-04-27 16:46:46'),
 (52,0,999,NULL,'tbl_urunler_kategoriler',8,0,'2012-04-27 16:46:46'),
 (53,0,999,NULL,'tbl_urunler_kategoriler',9,0,'2012-04-27 16:46:46'),
 (54,0,999,NULL,'tbl_etiketler',85,0,'2012-04-27 16:46:46'),
 (55,0,999,NULL,'tbl_urunler_etiketler',1,0,'2012-04-27 16:46:46'),
 (56,0,999,NULL,'tbl_kategoriler',31,1,'2012-05-05 18:50:08'),
 (57,0,999,NULL,'tbl_kategoriler',31,1,'2012-05-05 18:50:16');
/*!40000 ALTER TABLE `tbl_islemler` ENABLE KEYS */;


--
-- Definition of trigger `trg_admin_islem`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_admin_islem`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_admin_islem` BEFORE INSERT ON `tbl_islemler` FOR EACH ROW BEGIN
SET NEW.tarih = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_kargo_ulke_bolge`
--

DROP TABLE IF EXISTS `tbl_kargo_ulke_bolge`;
CREATE TABLE `tbl_kargo_ulke_bolge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kargo_id` int(11) NOT NULL DEFAULT '-1',
  `bolge_id` int(11) NOT NULL DEFAULT '-1',
  `desi` float(11,2) NOT NULL DEFAULT '0.00',
  `fiyat` double(11,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `kargo_id` (`kargo_id`),
  KEY `desi` (`fiyat`),
  KEY `bolge_id` (`bolge_id`),
  CONSTRAINT `fk_sbt_kargo_ulke_bolge_bolge_id` FOREIGN KEY (`bolge_id`) REFERENCES `tbl_sbt_ulke_bolge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sbt_kargo_ulke_bolge_kargo_id` FOREIGN KEY (`kargo_id`) REFERENCES `tbl_sbt_kargo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kargo_ulke_bolge`
--

/*!40000 ALTER TABLE `tbl_kargo_ulke_bolge` DISABLE KEYS */;
INSERT INTO `tbl_kargo_ulke_bolge` (`id`,`kargo_id`,`bolge_id`,`desi`,`fiyat`) VALUES 
 (1,1,1,0.00,4.00000);
/*!40000 ALTER TABLE `tbl_kargo_ulke_bolge` ENABLE KEYS */;


--
-- Definition of table `tbl_kargo_ulke_il_bolge`
--

DROP TABLE IF EXISTS `tbl_kargo_ulke_il_bolge`;
CREATE TABLE `tbl_kargo_ulke_il_bolge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kargo_id` int(11) NOT NULL DEFAULT '-1',
  `bolge_id` int(11) NOT NULL DEFAULT '-1',
  `desi` float(11,2) NOT NULL DEFAULT '0.00',
  `fiyat` double(11,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `kargo_id` (`kargo_id`),
  KEY `desi` (`fiyat`),
  KEY `bolge_id` (`bolge_id`),
  CONSTRAINT `fk_sbt_kargo_ulke_il_bolge_bolge_id` FOREIGN KEY (`bolge_id`) REFERENCES `tbl_sbt_ulke_il_bolge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sbt_kargo_ulke_il_bolge_kargo_id` FOREIGN KEY (`kargo_id`) REFERENCES `tbl_sbt_kargo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2101 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kargo_ulke_il_bolge`
--

/*!40000 ALTER TABLE `tbl_kargo_ulke_il_bolge` DISABLE KEYS */;
INSERT INTO `tbl_kargo_ulke_il_bolge` (`id`,`kargo_id`,`bolge_id`,`desi`,`fiyat`) VALUES 
 (1,1,1,1.00,5.00000),
 (2,1,1,2.00,6.00000),
 (3,1,1,3.00,7.00000),
 (4,1,1,4.00,8.00000),
 (5,1,1,5.00,9.00000),
 (6,1,1,6.00,10.00000),
 (7,1,1,7.00,11.00000),
 (8,1,1,8.00,12.00000),
 (9,1,1,9.00,13.00000),
 (10,1,1,10.00,14.00000),
 (11,1,1,11.00,15.00000),
 (12,1,1,12.00,16.00000),
 (13,1,1,13.00,17.00000),
 (14,1,1,14.00,18.00000),
 (15,1,1,15.00,19.00000),
 (16,1,1,16.00,20.00000),
 (17,1,1,17.00,21.00000),
 (18,1,1,18.00,22.00000),
 (19,1,1,19.00,23.00000),
 (20,1,1,20.00,24.00000),
 (21,1,1,21.00,25.00000),
 (22,1,1,22.00,26.00000),
 (23,1,1,23.00,27.00000),
 (24,1,1,24.00,28.00000),
 (25,1,1,25.00,29.00000),
 (26,1,1,26.00,30.00000),
 (27,1,1,27.00,31.00000),
 (28,1,1,28.00,32.00000),
 (29,1,1,29.00,33.00000),
 (30,1,1,30.00,34.00000),
 (31,1,1,31.00,35.00000),
 (32,1,1,32.00,36.00000),
 (33,1,1,33.00,37.00000),
 (34,1,1,34.00,38.00000),
 (35,1,1,35.00,39.00000),
 (36,1,1,36.00,40.00000),
 (37,1,1,37.00,41.00000),
 (38,1,1,38.00,42.00000),
 (39,1,1,39.00,43.00000),
 (40,1,1,40.00,44.00000),
 (41,1,1,41.00,45.00000),
 (42,1,1,42.00,46.00000),
 (43,1,1,43.00,47.00000),
 (44,1,1,44.00,48.00000),
 (45,1,1,45.00,49.00000),
 (46,1,1,46.00,50.00000),
 (47,1,1,47.00,51.00000),
 (48,1,1,48.00,52.00000),
 (49,1,1,49.00,53.00000),
 (50,1,1,50.00,54.00000),
 (51,1,2,1.00,5.00000),
 (52,1,2,2.00,6.00000),
 (53,1,2,3.00,7.00000),
 (54,1,2,4.00,8.00000),
 (55,1,2,5.00,9.00000),
 (56,1,2,6.00,10.00000),
 (57,1,2,7.00,11.00000),
 (58,1,2,8.00,12.00000),
 (59,1,2,9.00,13.00000),
 (60,1,2,10.00,14.00000),
 (61,1,2,11.00,15.00000),
 (62,1,2,12.00,16.00000),
 (63,1,2,13.00,17.00000),
 (64,1,2,14.00,18.00000),
 (65,1,2,15.00,19.00000),
 (66,1,2,16.00,20.00000),
 (67,1,2,17.00,21.00000),
 (68,1,2,18.00,22.00000),
 (69,1,2,19.00,23.00000),
 (70,1,2,20.00,24.00000),
 (71,1,2,21.00,25.00000),
 (72,1,2,22.00,26.00000),
 (73,1,2,23.00,27.00000),
 (74,1,2,24.00,28.00000),
 (75,1,2,25.00,29.00000),
 (76,1,2,26.00,30.00000),
 (77,1,2,27.00,31.00000),
 (78,1,2,28.00,32.00000),
 (79,1,2,29.00,33.00000),
 (80,1,2,30.00,34.00000),
 (81,1,2,31.00,35.00000),
 (82,1,2,32.00,36.00000),
 (83,1,2,33.00,37.00000),
 (84,1,2,34.00,38.00000),
 (85,1,2,35.00,39.00000),
 (86,1,2,36.00,40.00000),
 (87,1,2,37.00,41.00000),
 (88,1,2,38.00,42.00000),
 (89,1,2,39.00,43.00000),
 (90,1,2,40.00,44.00000),
 (91,1,2,41.00,45.00000),
 (92,1,2,42.00,46.00000),
 (93,1,2,43.00,47.00000),
 (94,1,2,44.00,48.00000),
 (95,1,2,45.00,49.00000),
 (96,1,2,46.00,50.00000),
 (97,1,2,47.00,51.00000),
 (98,1,2,48.00,52.00000),
 (99,1,2,49.00,53.00000),
 (100,1,2,50.00,54.00000),
 (101,1,3,1.00,5.00000),
 (102,1,3,2.00,6.00000),
 (103,1,3,3.00,7.00000),
 (104,1,3,4.00,8.00000),
 (105,1,3,5.00,9.00000),
 (106,1,3,6.00,10.00000),
 (107,1,3,7.00,11.00000),
 (108,1,3,8.00,12.00000),
 (109,1,3,9.00,13.00000),
 (110,1,3,10.00,14.00000),
 (111,1,3,11.00,15.00000),
 (112,1,3,12.00,16.00000),
 (113,1,3,13.00,17.00000),
 (114,1,3,14.00,18.00000),
 (115,1,3,15.00,19.00000),
 (116,1,3,16.00,20.00000),
 (117,1,3,17.00,21.00000),
 (118,1,3,18.00,22.00000),
 (119,1,3,19.00,23.00000),
 (120,1,3,20.00,24.00000),
 (121,1,3,21.00,25.00000),
 (122,1,3,22.00,26.00000),
 (123,1,3,23.00,27.00000),
 (124,1,3,24.00,28.00000),
 (125,1,3,25.00,29.00000),
 (126,1,3,26.00,30.00000),
 (127,1,3,27.00,31.00000),
 (128,1,3,28.00,32.00000),
 (129,1,3,29.00,33.00000),
 (130,1,3,30.00,34.00000),
 (131,1,3,31.00,35.00000),
 (132,1,3,32.00,36.00000),
 (133,1,3,33.00,37.00000),
 (134,1,3,34.00,38.00000),
 (135,1,3,35.00,39.00000),
 (136,1,3,36.00,40.00000),
 (137,1,3,37.00,41.00000),
 (138,1,3,38.00,42.00000),
 (139,1,3,39.00,43.00000),
 (140,1,3,40.00,44.00000),
 (141,1,3,41.00,45.00000),
 (142,1,3,42.00,46.00000),
 (143,1,3,43.00,47.00000),
 (144,1,3,44.00,48.00000),
 (145,1,3,45.00,49.00000),
 (146,1,3,46.00,50.00000),
 (147,1,3,47.00,51.00000),
 (148,1,3,48.00,52.00000),
 (149,1,3,49.00,53.00000),
 (150,1,3,50.00,54.00000),
 (151,1,4,1.00,5.00000),
 (152,1,4,2.00,6.00000),
 (153,1,4,3.00,7.00000),
 (154,1,4,4.00,8.00000),
 (155,1,4,5.00,9.00000),
 (156,1,4,6.00,10.00000),
 (157,1,4,7.00,11.00000),
 (158,1,4,8.00,12.00000),
 (159,1,4,9.00,13.00000),
 (160,1,4,10.00,14.00000),
 (161,1,4,11.00,15.00000),
 (162,1,4,12.00,16.00000),
 (163,1,4,13.00,17.00000),
 (164,1,4,14.00,18.00000),
 (165,1,4,15.00,19.00000),
 (166,1,4,16.00,20.00000),
 (167,1,4,17.00,21.00000),
 (168,1,4,18.00,22.00000),
 (169,1,4,19.00,23.00000),
 (170,1,4,20.00,24.00000),
 (171,1,4,21.00,25.00000),
 (172,1,4,22.00,26.00000),
 (173,1,4,23.00,27.00000),
 (174,1,4,24.00,28.00000),
 (175,1,4,25.00,29.00000),
 (176,1,4,26.00,30.00000),
 (177,1,4,27.00,31.00000),
 (178,1,4,28.00,32.00000),
 (179,1,4,29.00,33.00000),
 (180,1,4,30.00,34.00000),
 (181,1,4,31.00,35.00000),
 (182,1,4,32.00,36.00000),
 (183,1,4,33.00,37.00000),
 (184,1,4,34.00,38.00000),
 (185,1,4,35.00,39.00000),
 (186,1,4,36.00,40.00000),
 (187,1,4,37.00,41.00000),
 (188,1,4,38.00,42.00000),
 (189,1,4,39.00,43.00000),
 (190,1,4,40.00,44.00000),
 (191,1,4,41.00,45.00000),
 (192,1,4,42.00,46.00000),
 (193,1,4,43.00,47.00000),
 (194,1,4,44.00,48.00000),
 (195,1,4,45.00,49.00000),
 (196,1,4,46.00,50.00000),
 (197,1,4,47.00,51.00000),
 (198,1,4,48.00,52.00000),
 (199,1,4,49.00,53.00000),
 (200,1,4,50.00,54.00000),
 (201,1,5,1.00,5.00000),
 (202,1,5,2.00,6.00000),
 (203,1,5,3.00,7.00000),
 (204,1,5,4.00,8.00000),
 (205,1,5,5.00,9.00000),
 (206,1,5,6.00,10.00000),
 (207,1,5,7.00,11.00000),
 (208,1,5,8.00,12.00000),
 (209,1,5,9.00,13.00000),
 (210,1,5,10.00,14.00000),
 (211,1,5,11.00,15.00000),
 (212,1,5,12.00,16.00000),
 (213,1,5,13.00,17.00000),
 (214,1,5,14.00,18.00000),
 (215,1,5,15.00,19.00000),
 (216,1,5,16.00,20.00000),
 (217,1,5,17.00,21.00000),
 (218,1,5,18.00,22.00000),
 (219,1,5,19.00,23.00000),
 (220,1,5,20.00,24.00000),
 (221,1,5,21.00,25.00000),
 (222,1,5,22.00,26.00000),
 (223,1,5,23.00,27.00000),
 (224,1,5,24.00,28.00000),
 (225,1,5,25.00,29.00000),
 (226,1,5,26.00,30.00000),
 (227,1,5,27.00,31.00000),
 (228,1,5,28.00,32.00000),
 (229,1,5,29.00,33.00000),
 (230,1,5,30.00,34.00000),
 (231,1,5,31.00,35.00000),
 (232,1,5,32.00,36.00000),
 (233,1,5,33.00,37.00000),
 (234,1,5,34.00,38.00000),
 (235,1,5,35.00,39.00000),
 (236,1,5,36.00,40.00000),
 (237,1,5,37.00,41.00000),
 (238,1,5,38.00,42.00000),
 (239,1,5,39.00,43.00000),
 (240,1,5,40.00,44.00000),
 (241,1,5,41.00,45.00000),
 (242,1,5,42.00,46.00000),
 (243,1,5,43.00,47.00000),
 (244,1,5,44.00,48.00000),
 (245,1,5,45.00,49.00000),
 (246,1,5,46.00,50.00000),
 (247,1,5,47.00,51.00000),
 (248,1,5,48.00,52.00000),
 (249,1,5,49.00,53.00000),
 (250,1,5,50.00,54.00000),
 (251,1,6,1.00,5.00000),
 (252,1,6,2.00,6.00000),
 (253,1,6,3.00,7.00000),
 (254,1,6,4.00,8.00000),
 (255,1,6,5.00,9.00000),
 (256,1,6,6.00,10.00000),
 (257,1,6,7.00,11.00000),
 (258,1,6,8.00,12.00000),
 (259,1,6,9.00,13.00000),
 (260,1,6,10.00,14.00000),
 (261,1,6,11.00,15.00000),
 (262,1,6,12.00,16.00000),
 (263,1,6,13.00,17.00000),
 (264,1,6,14.00,18.00000),
 (265,1,6,15.00,19.00000),
 (266,1,6,16.00,20.00000),
 (267,1,6,17.00,21.00000),
 (268,1,6,18.00,22.00000),
 (269,1,6,19.00,23.00000),
 (270,1,6,20.00,24.00000),
 (271,1,6,21.00,25.00000),
 (272,1,6,22.00,26.00000),
 (273,1,6,23.00,27.00000),
 (274,1,6,24.00,28.00000),
 (275,1,6,25.00,29.00000),
 (276,1,6,26.00,30.00000),
 (277,1,6,27.00,31.00000),
 (278,1,6,28.00,32.00000),
 (279,1,6,29.00,33.00000),
 (280,1,6,30.00,34.00000),
 (281,1,6,31.00,35.00000),
 (282,1,6,32.00,36.00000),
 (283,1,6,33.00,37.00000),
 (284,1,6,34.00,38.00000),
 (285,1,6,35.00,39.00000),
 (286,1,6,36.00,40.00000),
 (287,1,6,37.00,41.00000),
 (288,1,6,38.00,42.00000),
 (289,1,6,39.00,43.00000),
 (290,1,6,40.00,44.00000),
 (291,1,6,41.00,45.00000),
 (292,1,6,42.00,46.00000),
 (293,1,6,43.00,47.00000),
 (294,1,6,44.00,48.00000),
 (295,1,6,45.00,49.00000),
 (296,1,6,46.00,50.00000),
 (297,1,6,47.00,51.00000),
 (298,1,6,48.00,52.00000),
 (299,1,6,49.00,53.00000),
 (300,1,6,50.00,54.00000),
 (301,1,7,1.00,5.00000),
 (302,1,7,2.00,6.00000),
 (303,1,7,3.00,7.00000),
 (304,1,7,4.00,8.00000),
 (305,1,7,5.00,9.00000),
 (306,1,7,6.00,10.00000),
 (307,1,7,7.00,11.00000),
 (308,1,7,8.00,12.00000),
 (309,1,7,9.00,13.00000),
 (310,1,7,10.00,14.00000),
 (311,1,7,11.00,15.00000),
 (312,1,7,12.00,16.00000),
 (313,1,7,13.00,17.00000),
 (314,1,7,14.00,18.00000),
 (315,1,7,15.00,19.00000),
 (316,1,7,16.00,20.00000),
 (317,1,7,17.00,21.00000),
 (318,1,7,18.00,22.00000),
 (319,1,7,19.00,23.00000),
 (320,1,7,20.00,24.00000),
 (321,1,7,21.00,25.00000),
 (322,1,7,22.00,26.00000),
 (323,1,7,23.00,27.00000),
 (324,1,7,24.00,28.00000),
 (325,1,7,25.00,29.00000),
 (326,1,7,26.00,30.00000),
 (327,1,7,27.00,31.00000),
 (328,1,7,28.00,32.00000),
 (329,1,7,29.00,33.00000),
 (330,1,7,30.00,34.00000),
 (331,1,7,31.00,35.00000),
 (332,1,7,32.00,36.00000),
 (333,1,7,33.00,37.00000),
 (334,1,7,34.00,38.00000),
 (335,1,7,35.00,39.00000),
 (336,1,7,36.00,40.00000),
 (337,1,7,37.00,41.00000),
 (338,1,7,38.00,42.00000),
 (339,1,7,39.00,43.00000),
 (340,1,7,40.00,44.00000),
 (341,1,7,41.00,45.00000),
 (342,1,7,42.00,46.00000),
 (343,1,7,43.00,47.00000),
 (344,1,7,44.00,48.00000),
 (345,1,7,45.00,49.00000),
 (346,1,7,46.00,50.00000),
 (347,1,7,47.00,51.00000),
 (348,1,7,48.00,52.00000),
 (349,1,7,49.00,53.00000),
 (350,1,7,50.00,54.00000),
 (351,2,1,1.00,5.00000),
 (352,2,1,2.00,6.00000),
 (353,2,1,3.00,7.00000),
 (354,2,1,4.00,8.00000),
 (355,2,1,5.00,9.00000),
 (356,2,1,6.00,10.00000),
 (357,2,1,7.00,11.00000),
 (358,2,1,8.00,12.00000),
 (359,2,1,9.00,13.00000),
 (360,2,1,10.00,14.00000),
 (361,2,1,11.00,15.00000),
 (362,2,1,12.00,16.00000),
 (363,2,1,13.00,17.00000),
 (364,2,1,14.00,18.00000),
 (365,2,1,15.00,19.00000),
 (366,2,1,16.00,20.00000),
 (367,2,1,17.00,21.00000),
 (368,2,1,18.00,22.00000),
 (369,2,1,19.00,23.00000),
 (370,2,1,20.00,24.00000),
 (371,2,1,21.00,25.00000),
 (372,2,1,22.00,26.00000),
 (373,2,1,23.00,27.00000),
 (374,2,1,24.00,28.00000),
 (375,2,1,25.00,29.00000),
 (376,2,1,26.00,30.00000),
 (377,2,1,27.00,31.00000),
 (378,2,1,28.00,32.00000),
 (379,2,1,29.00,33.00000),
 (380,2,1,30.00,34.00000),
 (381,2,1,31.00,35.00000),
 (382,2,1,32.00,36.00000),
 (383,2,1,33.00,37.00000),
 (384,2,1,34.00,38.00000),
 (385,2,1,35.00,39.00000),
 (386,2,1,36.00,40.00000),
 (387,2,1,37.00,41.00000),
 (388,2,1,38.00,42.00000),
 (389,2,1,39.00,43.00000),
 (390,2,1,40.00,44.00000),
 (391,2,1,41.00,45.00000),
 (392,2,1,42.00,46.00000),
 (393,2,1,43.00,47.00000),
 (394,2,1,44.00,48.00000),
 (395,2,1,45.00,49.00000),
 (396,2,1,46.00,50.00000),
 (397,2,1,47.00,51.00000),
 (398,2,1,48.00,52.00000),
 (399,2,1,49.00,53.00000),
 (400,2,1,50.00,54.00000),
 (401,2,2,1.00,5.00000),
 (402,2,2,2.00,6.00000),
 (403,2,2,3.00,7.00000),
 (404,2,2,4.00,8.00000),
 (405,2,2,5.00,9.00000),
 (406,2,2,6.00,10.00000),
 (407,2,2,7.00,11.00000),
 (408,2,2,8.00,12.00000),
 (409,2,2,9.00,13.00000),
 (410,2,2,10.00,14.00000),
 (411,2,2,11.00,15.00000),
 (412,2,2,12.00,16.00000),
 (413,2,2,13.00,17.00000),
 (414,2,2,14.00,18.00000),
 (415,2,2,15.00,19.00000),
 (416,2,2,16.00,20.00000),
 (417,2,2,17.00,21.00000),
 (418,2,2,18.00,22.00000),
 (419,2,2,19.00,23.00000),
 (420,2,2,20.00,24.00000),
 (421,2,2,21.00,25.00000),
 (422,2,2,22.00,26.00000),
 (423,2,2,23.00,27.00000),
 (424,2,2,24.00,28.00000),
 (425,2,2,25.00,29.00000),
 (426,2,2,26.00,30.00000),
 (427,2,2,27.00,31.00000),
 (428,2,2,28.00,32.00000),
 (429,2,2,29.00,33.00000),
 (430,2,2,30.00,34.00000),
 (431,2,2,31.00,35.00000),
 (432,2,2,32.00,36.00000),
 (433,2,2,33.00,37.00000),
 (434,2,2,34.00,38.00000),
 (435,2,2,35.00,39.00000),
 (436,2,2,36.00,40.00000),
 (437,2,2,37.00,41.00000),
 (438,2,2,38.00,42.00000),
 (439,2,2,39.00,43.00000),
 (440,2,2,40.00,44.00000),
 (441,2,2,41.00,45.00000),
 (442,2,2,42.00,46.00000),
 (443,2,2,43.00,47.00000),
 (444,2,2,44.00,48.00000),
 (445,2,2,45.00,49.00000),
 (446,2,2,46.00,50.00000),
 (447,2,2,47.00,51.00000),
 (448,2,2,48.00,52.00000),
 (449,2,2,49.00,53.00000),
 (450,2,2,50.00,54.00000),
 (451,2,3,1.00,5.00000),
 (452,2,3,2.00,6.00000),
 (453,2,3,3.00,7.00000),
 (454,2,3,4.00,8.00000),
 (455,2,3,5.00,9.00000),
 (456,2,3,6.00,10.00000),
 (457,2,3,7.00,11.00000),
 (458,2,3,8.00,12.00000),
 (459,2,3,9.00,13.00000),
 (460,2,3,10.00,14.00000),
 (461,2,3,11.00,15.00000),
 (462,2,3,12.00,16.00000),
 (463,2,3,13.00,17.00000),
 (464,2,3,14.00,18.00000),
 (465,2,3,15.00,19.00000),
 (466,2,3,16.00,20.00000),
 (467,2,3,17.00,21.00000),
 (468,2,3,18.00,22.00000),
 (469,2,3,19.00,23.00000),
 (470,2,3,20.00,24.00000),
 (471,2,3,21.00,25.00000),
 (472,2,3,22.00,26.00000),
 (473,2,3,23.00,27.00000),
 (474,2,3,24.00,28.00000),
 (475,2,3,25.00,29.00000),
 (476,2,3,26.00,30.00000),
 (477,2,3,27.00,31.00000),
 (478,2,3,28.00,32.00000),
 (479,2,3,29.00,33.00000),
 (480,2,3,30.00,34.00000),
 (481,2,3,31.00,35.00000),
 (482,2,3,32.00,36.00000),
 (483,2,3,33.00,37.00000),
 (484,2,3,34.00,38.00000),
 (485,2,3,35.00,39.00000),
 (486,2,3,36.00,40.00000),
 (487,2,3,37.00,41.00000),
 (488,2,3,38.00,42.00000),
 (489,2,3,39.00,43.00000),
 (490,2,3,40.00,44.00000),
 (491,2,3,41.00,45.00000),
 (492,2,3,42.00,46.00000),
 (493,2,3,43.00,47.00000),
 (494,2,3,44.00,48.00000),
 (495,2,3,45.00,49.00000),
 (496,2,3,46.00,50.00000),
 (497,2,3,47.00,51.00000),
 (498,2,3,48.00,52.00000),
 (499,2,3,49.00,53.00000),
 (500,2,3,50.00,54.00000),
 (501,2,4,1.00,5.00000),
 (502,2,4,2.00,6.00000),
 (503,2,4,3.00,7.00000),
 (504,2,4,4.00,8.00000),
 (505,2,4,5.00,9.00000),
 (506,2,4,6.00,10.00000),
 (507,2,4,7.00,11.00000),
 (508,2,4,8.00,12.00000),
 (509,2,4,9.00,13.00000),
 (510,2,4,10.00,14.00000),
 (511,2,4,11.00,15.00000),
 (512,2,4,12.00,16.00000),
 (513,2,4,13.00,17.00000),
 (514,2,4,14.00,18.00000),
 (515,2,4,15.00,19.00000),
 (516,2,4,16.00,20.00000),
 (517,2,4,17.00,21.00000),
 (518,2,4,18.00,22.00000),
 (519,2,4,19.00,23.00000),
 (520,2,4,20.00,24.00000),
 (521,2,4,21.00,25.00000),
 (522,2,4,22.00,26.00000),
 (523,2,4,23.00,27.00000),
 (524,2,4,24.00,28.00000),
 (525,2,4,25.00,29.00000),
 (526,2,4,26.00,30.00000),
 (527,2,4,27.00,31.00000),
 (528,2,4,28.00,32.00000),
 (529,2,4,29.00,33.00000),
 (530,2,4,30.00,34.00000),
 (531,2,4,31.00,35.00000),
 (532,2,4,32.00,36.00000),
 (533,2,4,33.00,37.00000),
 (534,2,4,34.00,38.00000),
 (535,2,4,35.00,39.00000),
 (536,2,4,36.00,40.00000),
 (537,2,4,37.00,41.00000),
 (538,2,4,38.00,42.00000),
 (539,2,4,39.00,43.00000),
 (540,2,4,40.00,44.00000),
 (541,2,4,41.00,45.00000),
 (542,2,4,42.00,46.00000),
 (543,2,4,43.00,47.00000),
 (544,2,4,44.00,48.00000),
 (545,2,4,45.00,49.00000),
 (546,2,4,46.00,50.00000),
 (547,2,4,47.00,51.00000),
 (548,2,4,48.00,52.00000),
 (549,2,4,49.00,53.00000),
 (550,2,4,50.00,54.00000),
 (551,2,5,1.00,5.00000),
 (552,2,5,2.00,6.00000),
 (553,2,5,3.00,7.00000),
 (554,2,5,4.00,8.00000),
 (555,2,5,5.00,9.00000),
 (556,2,5,6.00,10.00000),
 (557,2,5,7.00,11.00000),
 (558,2,5,8.00,12.00000),
 (559,2,5,9.00,13.00000),
 (560,2,5,10.00,14.00000),
 (561,2,5,11.00,15.00000),
 (562,2,5,12.00,16.00000),
 (563,2,5,13.00,17.00000),
 (564,2,5,14.00,18.00000),
 (565,2,5,15.00,19.00000),
 (566,2,5,16.00,20.00000),
 (567,2,5,17.00,21.00000),
 (568,2,5,18.00,22.00000),
 (569,2,5,19.00,23.00000),
 (570,2,5,20.00,24.00000),
 (571,2,5,21.00,25.00000),
 (572,2,5,22.00,26.00000),
 (573,2,5,23.00,27.00000),
 (574,2,5,24.00,28.00000),
 (575,2,5,25.00,29.00000),
 (576,2,5,26.00,30.00000),
 (577,2,5,27.00,31.00000),
 (578,2,5,28.00,32.00000),
 (579,2,5,29.00,33.00000),
 (580,2,5,30.00,34.00000),
 (581,2,5,31.00,35.00000),
 (582,2,5,32.00,36.00000),
 (583,2,5,33.00,37.00000),
 (584,2,5,34.00,38.00000),
 (585,2,5,35.00,39.00000),
 (586,2,5,36.00,40.00000),
 (587,2,5,37.00,41.00000),
 (588,2,5,38.00,42.00000),
 (589,2,5,39.00,43.00000),
 (590,2,5,40.00,44.00000),
 (591,2,5,41.00,45.00000),
 (592,2,5,42.00,46.00000),
 (593,2,5,43.00,47.00000),
 (594,2,5,44.00,48.00000),
 (595,2,5,45.00,49.00000),
 (596,2,5,46.00,50.00000),
 (597,2,5,47.00,51.00000),
 (598,2,5,48.00,52.00000),
 (599,2,5,49.00,53.00000),
 (600,2,5,50.00,54.00000),
 (601,2,6,1.00,5.00000),
 (602,2,6,2.00,6.00000),
 (603,2,6,3.00,7.00000),
 (604,2,6,4.00,8.00000),
 (605,2,6,5.00,9.00000),
 (606,2,6,6.00,10.00000),
 (607,2,6,7.00,11.00000),
 (608,2,6,8.00,12.00000),
 (609,2,6,9.00,13.00000),
 (610,2,6,10.00,14.00000),
 (611,2,6,11.00,15.00000),
 (612,2,6,12.00,16.00000),
 (613,2,6,13.00,17.00000),
 (614,2,6,14.00,18.00000),
 (615,2,6,15.00,19.00000),
 (616,2,6,16.00,20.00000),
 (617,2,6,17.00,21.00000),
 (618,2,6,18.00,22.00000),
 (619,2,6,19.00,23.00000),
 (620,2,6,20.00,24.00000),
 (621,2,6,21.00,25.00000),
 (622,2,6,22.00,26.00000),
 (623,2,6,23.00,27.00000),
 (624,2,6,24.00,28.00000),
 (625,2,6,25.00,29.00000),
 (626,2,6,26.00,30.00000),
 (627,2,6,27.00,31.00000),
 (628,2,6,28.00,32.00000),
 (629,2,6,29.00,33.00000),
 (630,2,6,30.00,34.00000),
 (631,2,6,31.00,35.00000),
 (632,2,6,32.00,36.00000),
 (633,2,6,33.00,37.00000),
 (634,2,6,34.00,38.00000),
 (635,2,6,35.00,39.00000),
 (636,2,6,36.00,40.00000),
 (637,2,6,37.00,41.00000),
 (638,2,6,38.00,42.00000),
 (639,2,6,39.00,43.00000),
 (640,2,6,40.00,44.00000),
 (641,2,6,41.00,45.00000),
 (642,2,6,42.00,46.00000),
 (643,2,6,43.00,47.00000),
 (644,2,6,44.00,48.00000),
 (645,2,6,45.00,49.00000),
 (646,2,6,46.00,50.00000),
 (647,2,6,47.00,51.00000),
 (648,2,6,48.00,52.00000),
 (649,2,6,49.00,53.00000),
 (650,2,6,50.00,54.00000),
 (651,2,7,1.00,5.00000),
 (652,2,7,2.00,6.00000),
 (653,2,7,3.00,7.00000),
 (654,2,7,4.00,8.00000),
 (655,2,7,5.00,9.00000),
 (656,2,7,6.00,10.00000),
 (657,2,7,7.00,11.00000),
 (658,2,7,8.00,12.00000),
 (659,2,7,9.00,13.00000),
 (660,2,7,10.00,14.00000),
 (661,2,7,11.00,15.00000),
 (662,2,7,12.00,16.00000),
 (663,2,7,13.00,17.00000),
 (664,2,7,14.00,18.00000),
 (665,2,7,15.00,19.00000),
 (666,2,7,16.00,20.00000),
 (667,2,7,17.00,21.00000),
 (668,2,7,18.00,22.00000),
 (669,2,7,19.00,23.00000),
 (670,2,7,20.00,24.00000),
 (671,2,7,21.00,25.00000),
 (672,2,7,22.00,26.00000),
 (673,2,7,23.00,27.00000),
 (674,2,7,24.00,28.00000),
 (675,2,7,25.00,29.00000),
 (676,2,7,26.00,30.00000),
 (677,2,7,27.00,31.00000),
 (678,2,7,28.00,32.00000),
 (679,2,7,29.00,33.00000),
 (680,2,7,30.00,34.00000),
 (681,2,7,31.00,35.00000),
 (682,2,7,32.00,36.00000),
 (683,2,7,33.00,37.00000),
 (684,2,7,34.00,38.00000),
 (685,2,7,35.00,39.00000),
 (686,2,7,36.00,40.00000),
 (687,2,7,37.00,41.00000),
 (688,2,7,38.00,42.00000),
 (689,2,7,39.00,43.00000),
 (690,2,7,40.00,44.00000),
 (691,2,7,41.00,45.00000),
 (692,2,7,42.00,46.00000),
 (693,2,7,43.00,47.00000),
 (694,2,7,44.00,48.00000),
 (695,2,7,45.00,49.00000),
 (696,2,7,46.00,50.00000),
 (697,2,7,47.00,51.00000),
 (698,2,7,48.00,52.00000),
 (699,2,7,49.00,53.00000),
 (700,2,7,50.00,54.00000),
 (701,3,1,1.00,5.00000),
 (702,3,1,2.00,6.00000),
 (703,3,1,3.00,7.00000),
 (704,3,1,4.00,8.00000),
 (705,3,1,5.00,9.00000),
 (706,3,1,6.00,10.00000),
 (707,3,1,7.00,11.00000),
 (708,3,1,8.00,12.00000),
 (709,3,1,9.00,13.00000),
 (710,3,1,10.00,14.00000),
 (711,3,1,11.00,15.00000),
 (712,3,1,12.00,16.00000),
 (713,3,1,13.00,17.00000),
 (714,3,1,14.00,18.00000),
 (715,3,1,15.00,19.00000),
 (716,3,1,16.00,20.00000),
 (717,3,1,17.00,21.00000),
 (718,3,1,18.00,22.00000),
 (719,3,1,19.00,23.00000),
 (720,3,1,20.00,24.00000),
 (721,3,1,21.00,25.00000),
 (722,3,1,22.00,26.00000),
 (723,3,1,23.00,27.00000),
 (724,3,1,24.00,28.00000),
 (725,3,1,25.00,29.00000),
 (726,3,1,26.00,30.00000),
 (727,3,1,27.00,31.00000),
 (728,3,1,28.00,32.00000),
 (729,3,1,29.00,33.00000),
 (730,3,1,30.00,34.00000),
 (731,3,1,31.00,35.00000),
 (732,3,1,32.00,36.00000),
 (733,3,1,33.00,37.00000),
 (734,3,1,34.00,38.00000),
 (735,3,1,35.00,39.00000),
 (736,3,1,36.00,40.00000),
 (737,3,1,37.00,41.00000),
 (738,3,1,38.00,42.00000),
 (739,3,1,39.00,43.00000),
 (740,3,1,40.00,44.00000),
 (741,3,1,41.00,45.00000),
 (742,3,1,42.00,46.00000),
 (743,3,1,43.00,47.00000),
 (744,3,1,44.00,48.00000),
 (745,3,1,45.00,49.00000),
 (746,3,1,46.00,50.00000),
 (747,3,1,47.00,51.00000),
 (748,3,1,48.00,52.00000),
 (749,3,1,49.00,53.00000),
 (750,3,1,50.00,54.00000),
 (751,3,2,1.00,5.00000),
 (752,3,2,2.00,6.00000),
 (753,3,2,3.00,7.00000),
 (754,3,2,4.00,8.00000),
 (755,3,2,5.00,9.00000),
 (756,3,2,6.00,10.00000),
 (757,3,2,7.00,11.00000),
 (758,3,2,8.00,12.00000),
 (759,3,2,9.00,13.00000),
 (760,3,2,10.00,14.00000),
 (761,3,2,11.00,15.00000),
 (762,3,2,12.00,16.00000),
 (763,3,2,13.00,17.00000),
 (764,3,2,14.00,18.00000),
 (765,3,2,15.00,19.00000),
 (766,3,2,16.00,20.00000),
 (767,3,2,17.00,21.00000),
 (768,3,2,18.00,22.00000),
 (769,3,2,19.00,23.00000),
 (770,3,2,20.00,24.00000),
 (771,3,2,21.00,25.00000),
 (772,3,2,22.00,26.00000),
 (773,3,2,23.00,27.00000),
 (774,3,2,24.00,28.00000),
 (775,3,2,25.00,29.00000),
 (776,3,2,26.00,30.00000),
 (777,3,2,27.00,31.00000),
 (778,3,2,28.00,32.00000),
 (779,3,2,29.00,33.00000),
 (780,3,2,30.00,34.00000),
 (781,3,2,31.00,35.00000),
 (782,3,2,32.00,36.00000),
 (783,3,2,33.00,37.00000),
 (784,3,2,34.00,38.00000),
 (785,3,2,35.00,39.00000),
 (786,3,2,36.00,40.00000),
 (787,3,2,37.00,41.00000),
 (788,3,2,38.00,42.00000),
 (789,3,2,39.00,43.00000),
 (790,3,2,40.00,44.00000),
 (791,3,2,41.00,45.00000),
 (792,3,2,42.00,46.00000),
 (793,3,2,43.00,47.00000),
 (794,3,2,44.00,48.00000),
 (795,3,2,45.00,49.00000),
 (796,3,2,46.00,50.00000),
 (797,3,2,47.00,51.00000),
 (798,3,2,48.00,52.00000),
 (799,3,2,49.00,53.00000),
 (800,3,2,50.00,54.00000),
 (801,3,3,1.00,5.00000),
 (802,3,3,2.00,6.00000),
 (803,3,3,3.00,7.00000),
 (804,3,3,4.00,8.00000),
 (805,3,3,5.00,9.00000),
 (806,3,3,6.00,10.00000),
 (807,3,3,7.00,11.00000),
 (808,3,3,8.00,12.00000),
 (809,3,3,9.00,13.00000),
 (810,3,3,10.00,14.00000),
 (811,3,3,11.00,15.00000),
 (812,3,3,12.00,16.00000),
 (813,3,3,13.00,17.00000),
 (814,3,3,14.00,18.00000),
 (815,3,3,15.00,19.00000),
 (816,3,3,16.00,20.00000),
 (817,3,3,17.00,21.00000),
 (818,3,3,18.00,22.00000),
 (819,3,3,19.00,23.00000),
 (820,3,3,20.00,24.00000),
 (821,3,3,21.00,25.00000),
 (822,3,3,22.00,26.00000),
 (823,3,3,23.00,27.00000),
 (824,3,3,24.00,28.00000),
 (825,3,3,25.00,29.00000),
 (826,3,3,26.00,30.00000),
 (827,3,3,27.00,31.00000),
 (828,3,3,28.00,32.00000),
 (829,3,3,29.00,33.00000),
 (830,3,3,30.00,34.00000),
 (831,3,3,31.00,35.00000),
 (832,3,3,32.00,36.00000),
 (833,3,3,33.00,37.00000),
 (834,3,3,34.00,38.00000),
 (835,3,3,35.00,39.00000),
 (836,3,3,36.00,40.00000),
 (837,3,3,37.00,41.00000),
 (838,3,3,38.00,42.00000),
 (839,3,3,39.00,43.00000),
 (840,3,3,40.00,44.00000),
 (841,3,3,41.00,45.00000),
 (842,3,3,42.00,46.00000),
 (843,3,3,43.00,47.00000),
 (844,3,3,44.00,48.00000),
 (845,3,3,45.00,49.00000),
 (846,3,3,46.00,50.00000),
 (847,3,3,47.00,51.00000),
 (848,3,3,48.00,52.00000),
 (849,3,3,49.00,53.00000),
 (850,3,3,50.00,54.00000),
 (851,3,4,1.00,5.00000),
 (852,3,4,2.00,6.00000),
 (853,3,4,3.00,7.00000),
 (854,3,4,4.00,8.00000),
 (855,3,4,5.00,9.00000),
 (856,3,4,6.00,10.00000),
 (857,3,4,7.00,11.00000),
 (858,3,4,8.00,12.00000),
 (859,3,4,9.00,13.00000),
 (860,3,4,10.00,14.00000),
 (861,3,4,11.00,15.00000),
 (862,3,4,12.00,16.00000),
 (863,3,4,13.00,17.00000),
 (864,3,4,14.00,18.00000),
 (865,3,4,15.00,19.00000),
 (866,3,4,16.00,20.00000),
 (867,3,4,17.00,21.00000),
 (868,3,4,18.00,22.00000),
 (869,3,4,19.00,23.00000),
 (870,3,4,20.00,24.00000),
 (871,3,4,21.00,25.00000),
 (872,3,4,22.00,26.00000),
 (873,3,4,23.00,27.00000),
 (874,3,4,24.00,28.00000),
 (875,3,4,25.00,29.00000),
 (876,3,4,26.00,30.00000),
 (877,3,4,27.00,31.00000),
 (878,3,4,28.00,32.00000),
 (879,3,4,29.00,33.00000),
 (880,3,4,30.00,34.00000),
 (881,3,4,31.00,35.00000),
 (882,3,4,32.00,36.00000),
 (883,3,4,33.00,37.00000),
 (884,3,4,34.00,38.00000),
 (885,3,4,35.00,39.00000),
 (886,3,4,36.00,40.00000),
 (887,3,4,37.00,41.00000),
 (888,3,4,38.00,42.00000),
 (889,3,4,39.00,43.00000),
 (890,3,4,40.00,44.00000),
 (891,3,4,41.00,45.00000),
 (892,3,4,42.00,46.00000),
 (893,3,4,43.00,47.00000),
 (894,3,4,44.00,48.00000),
 (895,3,4,45.00,49.00000),
 (896,3,4,46.00,50.00000),
 (897,3,4,47.00,51.00000),
 (898,3,4,48.00,52.00000),
 (899,3,4,49.00,53.00000),
 (900,3,4,50.00,54.00000),
 (901,3,5,1.00,5.00000),
 (902,3,5,2.00,6.00000),
 (903,3,5,3.00,7.00000),
 (904,3,5,4.00,8.00000),
 (905,3,5,5.00,9.00000),
 (906,3,5,6.00,10.00000),
 (907,3,5,7.00,11.00000),
 (908,3,5,8.00,12.00000),
 (909,3,5,9.00,13.00000),
 (910,3,5,10.00,14.00000),
 (911,3,5,11.00,15.00000),
 (912,3,5,12.00,16.00000),
 (913,3,5,13.00,17.00000),
 (914,3,5,14.00,18.00000),
 (915,3,5,15.00,19.00000),
 (916,3,5,16.00,20.00000),
 (917,3,5,17.00,21.00000),
 (918,3,5,18.00,22.00000),
 (919,3,5,19.00,23.00000),
 (920,3,5,20.00,24.00000),
 (921,3,5,21.00,25.00000),
 (922,3,5,22.00,26.00000),
 (923,3,5,23.00,27.00000),
 (924,3,5,24.00,28.00000),
 (925,3,5,25.00,29.00000),
 (926,3,5,26.00,30.00000),
 (927,3,5,27.00,31.00000),
 (928,3,5,28.00,32.00000),
 (929,3,5,29.00,33.00000),
 (930,3,5,30.00,34.00000),
 (931,3,5,31.00,35.00000),
 (932,3,5,32.00,36.00000),
 (933,3,5,33.00,37.00000),
 (934,3,5,34.00,38.00000),
 (935,3,5,35.00,39.00000),
 (936,3,5,36.00,40.00000),
 (937,3,5,37.00,41.00000),
 (938,3,5,38.00,42.00000),
 (939,3,5,39.00,43.00000),
 (940,3,5,40.00,44.00000),
 (941,3,5,41.00,45.00000),
 (942,3,5,42.00,46.00000),
 (943,3,5,43.00,47.00000),
 (944,3,5,44.00,48.00000),
 (945,3,5,45.00,49.00000),
 (946,3,5,46.00,50.00000),
 (947,3,5,47.00,51.00000),
 (948,3,5,48.00,52.00000),
 (949,3,5,49.00,53.00000),
 (950,3,5,50.00,54.00000),
 (951,3,6,1.00,5.00000),
 (952,3,6,2.00,6.00000),
 (953,3,6,3.00,7.00000),
 (954,3,6,4.00,8.00000),
 (955,3,6,5.00,9.00000),
 (956,3,6,6.00,10.00000),
 (957,3,6,7.00,11.00000),
 (958,3,6,8.00,12.00000),
 (959,3,6,9.00,13.00000),
 (960,3,6,10.00,14.00000),
 (961,3,6,11.00,15.00000),
 (962,3,6,12.00,16.00000),
 (963,3,6,13.00,17.00000),
 (964,3,6,14.00,18.00000),
 (965,3,6,15.00,19.00000),
 (966,3,6,16.00,20.00000),
 (967,3,6,17.00,21.00000),
 (968,3,6,18.00,22.00000),
 (969,3,6,19.00,23.00000),
 (970,3,6,20.00,24.00000),
 (971,3,6,21.00,25.00000),
 (972,3,6,22.00,26.00000),
 (973,3,6,23.00,27.00000),
 (974,3,6,24.00,28.00000),
 (975,3,6,25.00,29.00000),
 (976,3,6,26.00,30.00000),
 (977,3,6,27.00,31.00000),
 (978,3,6,28.00,32.00000),
 (979,3,6,29.00,33.00000),
 (980,3,6,30.00,34.00000),
 (981,3,6,31.00,35.00000),
 (982,3,6,32.00,36.00000),
 (983,3,6,33.00,37.00000),
 (984,3,6,34.00,38.00000),
 (985,3,6,35.00,39.00000),
 (986,3,6,36.00,40.00000),
 (987,3,6,37.00,41.00000),
 (988,3,6,38.00,42.00000),
 (989,3,6,39.00,43.00000),
 (990,3,6,40.00,44.00000),
 (991,3,6,41.00,45.00000),
 (992,3,6,42.00,46.00000),
 (993,3,6,43.00,47.00000),
 (994,3,6,44.00,48.00000),
 (995,3,6,45.00,49.00000),
 (996,3,6,46.00,50.00000),
 (997,3,6,47.00,51.00000),
 (998,3,6,48.00,52.00000),
 (999,3,6,49.00,53.00000),
 (1000,3,6,50.00,54.00000),
 (1001,3,7,1.00,5.00000),
 (1002,3,7,2.00,6.00000),
 (1003,3,7,3.00,7.00000),
 (1004,3,7,4.00,8.00000),
 (1005,3,7,5.00,9.00000),
 (1006,3,7,6.00,10.00000),
 (1007,3,7,7.00,11.00000),
 (1008,3,7,8.00,12.00000),
 (1009,3,7,9.00,13.00000),
 (1010,3,7,10.00,14.00000),
 (1011,3,7,11.00,15.00000),
 (1012,3,7,12.00,16.00000),
 (1013,3,7,13.00,17.00000),
 (1014,3,7,14.00,18.00000),
 (1015,3,7,15.00,19.00000),
 (1016,3,7,16.00,20.00000),
 (1017,3,7,17.00,21.00000),
 (1018,3,7,18.00,22.00000),
 (1019,3,7,19.00,23.00000),
 (1020,3,7,20.00,24.00000),
 (1021,3,7,21.00,25.00000),
 (1022,3,7,22.00,26.00000),
 (1023,3,7,23.00,27.00000),
 (1024,3,7,24.00,28.00000),
 (1025,3,7,25.00,29.00000),
 (1026,3,7,26.00,30.00000),
 (1027,3,7,27.00,31.00000),
 (1028,3,7,28.00,32.00000),
 (1029,3,7,29.00,33.00000),
 (1030,3,7,30.00,34.00000),
 (1031,3,7,31.00,35.00000),
 (1032,3,7,32.00,36.00000),
 (1033,3,7,33.00,37.00000),
 (1034,3,7,34.00,38.00000),
 (1035,3,7,35.00,39.00000),
 (1036,3,7,36.00,40.00000),
 (1037,3,7,37.00,41.00000),
 (1038,3,7,38.00,42.00000),
 (1039,3,7,39.00,43.00000),
 (1040,3,7,40.00,44.00000),
 (1041,3,7,41.00,45.00000),
 (1042,3,7,42.00,46.00000),
 (1043,3,7,43.00,47.00000),
 (1044,3,7,44.00,48.00000),
 (1045,3,7,45.00,49.00000),
 (1046,3,7,46.00,50.00000),
 (1047,3,7,47.00,51.00000),
 (1048,3,7,48.00,52.00000),
 (1049,3,7,49.00,53.00000),
 (1050,3,7,50.00,54.00000),
 (1051,4,1,1.00,5.00000),
 (1052,4,1,2.00,6.00000),
 (1053,4,1,3.00,7.00000),
 (1054,4,1,4.00,8.00000),
 (1055,4,1,5.00,9.00000),
 (1056,4,1,6.00,10.00000),
 (1057,4,1,7.00,11.00000),
 (1058,4,1,8.00,12.00000),
 (1059,4,1,9.00,13.00000),
 (1060,4,1,10.00,14.00000),
 (1061,4,1,11.00,15.00000),
 (1062,4,1,12.00,16.00000),
 (1063,4,1,13.00,17.00000),
 (1064,4,1,14.00,18.00000),
 (1065,4,1,15.00,19.00000),
 (1066,4,1,16.00,20.00000),
 (1067,4,1,17.00,21.00000),
 (1068,4,1,18.00,22.00000),
 (1069,4,1,19.00,23.00000),
 (1070,4,1,20.00,24.00000),
 (1071,4,1,21.00,25.00000),
 (1072,4,1,22.00,26.00000),
 (1073,4,1,23.00,27.00000),
 (1074,4,1,24.00,28.00000),
 (1075,4,1,25.00,29.00000),
 (1076,4,1,26.00,30.00000),
 (1077,4,1,27.00,31.00000),
 (1078,4,1,28.00,32.00000),
 (1079,4,1,29.00,33.00000),
 (1080,4,1,30.00,34.00000),
 (1081,4,1,31.00,35.00000),
 (1082,4,1,32.00,36.00000),
 (1083,4,1,33.00,37.00000),
 (1084,4,1,34.00,38.00000),
 (1085,4,1,35.00,39.00000),
 (1086,4,1,36.00,40.00000),
 (1087,4,1,37.00,41.00000),
 (1088,4,1,38.00,42.00000),
 (1089,4,1,39.00,43.00000),
 (1090,4,1,40.00,44.00000),
 (1091,4,1,41.00,45.00000),
 (1092,4,1,42.00,46.00000),
 (1093,4,1,43.00,47.00000),
 (1094,4,1,44.00,48.00000),
 (1095,4,1,45.00,49.00000),
 (1096,4,1,46.00,50.00000),
 (1097,4,1,47.00,51.00000),
 (1098,4,1,48.00,52.00000),
 (1099,4,1,49.00,53.00000),
 (1100,4,1,50.00,54.00000),
 (1101,4,2,1.00,5.00000),
 (1102,4,2,2.00,6.00000),
 (1103,4,2,3.00,7.00000),
 (1104,4,2,4.00,8.00000),
 (1105,4,2,5.00,9.00000),
 (1106,4,2,6.00,10.00000),
 (1107,4,2,7.00,11.00000),
 (1108,4,2,8.00,12.00000),
 (1109,4,2,9.00,13.00000),
 (1110,4,2,10.00,14.00000),
 (1111,4,2,11.00,15.00000),
 (1112,4,2,12.00,16.00000),
 (1113,4,2,13.00,17.00000),
 (1114,4,2,14.00,18.00000),
 (1115,4,2,15.00,19.00000),
 (1116,4,2,16.00,20.00000),
 (1117,4,2,17.00,21.00000),
 (1118,4,2,18.00,22.00000),
 (1119,4,2,19.00,23.00000),
 (1120,4,2,20.00,24.00000),
 (1121,4,2,21.00,25.00000),
 (1122,4,2,22.00,26.00000),
 (1123,4,2,23.00,27.00000),
 (1124,4,2,24.00,28.00000),
 (1125,4,2,25.00,29.00000),
 (1126,4,2,26.00,30.00000),
 (1127,4,2,27.00,31.00000),
 (1128,4,2,28.00,32.00000),
 (1129,4,2,29.00,33.00000),
 (1130,4,2,30.00,34.00000),
 (1131,4,2,31.00,35.00000),
 (1132,4,2,32.00,36.00000),
 (1133,4,2,33.00,37.00000),
 (1134,4,2,34.00,38.00000),
 (1135,4,2,35.00,39.00000),
 (1136,4,2,36.00,40.00000),
 (1137,4,2,37.00,41.00000),
 (1138,4,2,38.00,42.00000),
 (1139,4,2,39.00,43.00000),
 (1140,4,2,40.00,44.00000),
 (1141,4,2,41.00,45.00000),
 (1142,4,2,42.00,46.00000),
 (1143,4,2,43.00,47.00000),
 (1144,4,2,44.00,48.00000),
 (1145,4,2,45.00,49.00000),
 (1146,4,2,46.00,50.00000),
 (1147,4,2,47.00,51.00000),
 (1148,4,2,48.00,52.00000),
 (1149,4,2,49.00,53.00000),
 (1150,4,2,50.00,54.00000),
 (1151,4,3,1.00,5.00000),
 (1152,4,3,2.00,6.00000),
 (1153,4,3,3.00,7.00000),
 (1154,4,3,4.00,8.00000),
 (1155,4,3,5.00,9.00000),
 (1156,4,3,6.00,10.00000),
 (1157,4,3,7.00,11.00000),
 (1158,4,3,8.00,12.00000),
 (1159,4,3,9.00,13.00000),
 (1160,4,3,10.00,14.00000),
 (1161,4,3,11.00,15.00000),
 (1162,4,3,12.00,16.00000),
 (1163,4,3,13.00,17.00000),
 (1164,4,3,14.00,18.00000),
 (1165,4,3,15.00,19.00000),
 (1166,4,3,16.00,20.00000),
 (1167,4,3,17.00,21.00000),
 (1168,4,3,18.00,22.00000),
 (1169,4,3,19.00,23.00000),
 (1170,4,3,20.00,24.00000),
 (1171,4,3,21.00,25.00000),
 (1172,4,3,22.00,26.00000),
 (1173,4,3,23.00,27.00000),
 (1174,4,3,24.00,28.00000),
 (1175,4,3,25.00,29.00000),
 (1176,4,3,26.00,30.00000),
 (1177,4,3,27.00,31.00000),
 (1178,4,3,28.00,32.00000),
 (1179,4,3,29.00,33.00000),
 (1180,4,3,30.00,34.00000),
 (1181,4,3,31.00,35.00000),
 (1182,4,3,32.00,36.00000),
 (1183,4,3,33.00,37.00000),
 (1184,4,3,34.00,38.00000),
 (1185,4,3,35.00,39.00000),
 (1186,4,3,36.00,40.00000),
 (1187,4,3,37.00,41.00000),
 (1188,4,3,38.00,42.00000),
 (1189,4,3,39.00,43.00000),
 (1190,4,3,40.00,44.00000),
 (1191,4,3,41.00,45.00000),
 (1192,4,3,42.00,46.00000),
 (1193,4,3,43.00,47.00000),
 (1194,4,3,44.00,48.00000),
 (1195,4,3,45.00,49.00000),
 (1196,4,3,46.00,50.00000),
 (1197,4,3,47.00,51.00000),
 (1198,4,3,48.00,52.00000),
 (1199,4,3,49.00,53.00000),
 (1200,4,3,50.00,54.00000),
 (1201,4,4,1.00,5.00000),
 (1202,4,4,2.00,6.00000),
 (1203,4,4,3.00,7.00000),
 (1204,4,4,4.00,8.00000),
 (1205,4,4,5.00,9.00000),
 (1206,4,4,6.00,10.00000),
 (1207,4,4,7.00,11.00000),
 (1208,4,4,8.00,12.00000),
 (1209,4,4,9.00,13.00000),
 (1210,4,4,10.00,14.00000),
 (1211,4,4,11.00,15.00000),
 (1212,4,4,12.00,16.00000),
 (1213,4,4,13.00,17.00000),
 (1214,4,4,14.00,18.00000),
 (1215,4,4,15.00,19.00000),
 (1216,4,4,16.00,20.00000),
 (1217,4,4,17.00,21.00000),
 (1218,4,4,18.00,22.00000),
 (1219,4,4,19.00,23.00000),
 (1220,4,4,20.00,24.00000),
 (1221,4,4,21.00,25.00000),
 (1222,4,4,22.00,26.00000),
 (1223,4,4,23.00,27.00000),
 (1224,4,4,24.00,28.00000),
 (1225,4,4,25.00,29.00000),
 (1226,4,4,26.00,30.00000),
 (1227,4,4,27.00,31.00000),
 (1228,4,4,28.00,32.00000),
 (1229,4,4,29.00,33.00000),
 (1230,4,4,30.00,34.00000),
 (1231,4,4,31.00,35.00000),
 (1232,4,4,32.00,36.00000),
 (1233,4,4,33.00,37.00000),
 (1234,4,4,34.00,38.00000),
 (1235,4,4,35.00,39.00000),
 (1236,4,4,36.00,40.00000),
 (1237,4,4,37.00,41.00000),
 (1238,4,4,38.00,42.00000),
 (1239,4,4,39.00,43.00000),
 (1240,4,4,40.00,44.00000),
 (1241,4,4,41.00,45.00000),
 (1242,4,4,42.00,46.00000),
 (1243,4,4,43.00,47.00000),
 (1244,4,4,44.00,48.00000),
 (1245,4,4,45.00,49.00000),
 (1246,4,4,46.00,50.00000),
 (1247,4,4,47.00,51.00000),
 (1248,4,4,48.00,52.00000),
 (1249,4,4,49.00,53.00000),
 (1250,4,4,50.00,54.00000),
 (1251,4,5,1.00,5.00000),
 (1252,4,5,2.00,6.00000),
 (1253,4,5,3.00,7.00000),
 (1254,4,5,4.00,8.00000),
 (1255,4,5,5.00,9.00000),
 (1256,4,5,6.00,10.00000),
 (1257,4,5,7.00,11.00000),
 (1258,4,5,8.00,12.00000),
 (1259,4,5,9.00,13.00000),
 (1260,4,5,10.00,14.00000),
 (1261,4,5,11.00,15.00000),
 (1262,4,5,12.00,16.00000),
 (1263,4,5,13.00,17.00000),
 (1264,4,5,14.00,18.00000),
 (1265,4,5,15.00,19.00000),
 (1266,4,5,16.00,20.00000),
 (1267,4,5,17.00,21.00000),
 (1268,4,5,18.00,22.00000),
 (1269,4,5,19.00,23.00000),
 (1270,4,5,20.00,24.00000),
 (1271,4,5,21.00,25.00000),
 (1272,4,5,22.00,26.00000),
 (1273,4,5,23.00,27.00000),
 (1274,4,5,24.00,28.00000),
 (1275,4,5,25.00,29.00000),
 (1276,4,5,26.00,30.00000),
 (1277,4,5,27.00,31.00000),
 (1278,4,5,28.00,32.00000),
 (1279,4,5,29.00,33.00000),
 (1280,4,5,30.00,34.00000),
 (1281,4,5,31.00,35.00000),
 (1282,4,5,32.00,36.00000),
 (1283,4,5,33.00,37.00000),
 (1284,4,5,34.00,38.00000),
 (1285,4,5,35.00,39.00000),
 (1286,4,5,36.00,40.00000),
 (1287,4,5,37.00,41.00000),
 (1288,4,5,38.00,42.00000),
 (1289,4,5,39.00,43.00000),
 (1290,4,5,40.00,44.00000),
 (1291,4,5,41.00,45.00000),
 (1292,4,5,42.00,46.00000),
 (1293,4,5,43.00,47.00000),
 (1294,4,5,44.00,48.00000),
 (1295,4,5,45.00,49.00000),
 (1296,4,5,46.00,50.00000),
 (1297,4,5,47.00,51.00000),
 (1298,4,5,48.00,52.00000),
 (1299,4,5,49.00,53.00000),
 (1300,4,5,50.00,54.00000),
 (1301,4,6,1.00,5.00000),
 (1302,4,6,2.00,6.00000),
 (1303,4,6,3.00,7.00000),
 (1304,4,6,4.00,8.00000),
 (1305,4,6,5.00,9.00000),
 (1306,4,6,6.00,10.00000),
 (1307,4,6,7.00,11.00000),
 (1308,4,6,8.00,12.00000),
 (1309,4,6,9.00,13.00000),
 (1310,4,6,10.00,14.00000),
 (1311,4,6,11.00,15.00000),
 (1312,4,6,12.00,16.00000),
 (1313,4,6,13.00,17.00000),
 (1314,4,6,14.00,18.00000),
 (1315,4,6,15.00,19.00000),
 (1316,4,6,16.00,20.00000),
 (1317,4,6,17.00,21.00000),
 (1318,4,6,18.00,22.00000),
 (1319,4,6,19.00,23.00000),
 (1320,4,6,20.00,24.00000),
 (1321,4,6,21.00,25.00000),
 (1322,4,6,22.00,26.00000),
 (1323,4,6,23.00,27.00000),
 (1324,4,6,24.00,28.00000),
 (1325,4,6,25.00,29.00000),
 (1326,4,6,26.00,30.00000),
 (1327,4,6,27.00,31.00000),
 (1328,4,6,28.00,32.00000),
 (1329,4,6,29.00,33.00000),
 (1330,4,6,30.00,34.00000),
 (1331,4,6,31.00,35.00000),
 (1332,4,6,32.00,36.00000),
 (1333,4,6,33.00,37.00000),
 (1334,4,6,34.00,38.00000),
 (1335,4,6,35.00,39.00000),
 (1336,4,6,36.00,40.00000),
 (1337,4,6,37.00,41.00000),
 (1338,4,6,38.00,42.00000),
 (1339,4,6,39.00,43.00000),
 (1340,4,6,40.00,44.00000),
 (1341,4,6,41.00,45.00000),
 (1342,4,6,42.00,46.00000),
 (1343,4,6,43.00,47.00000),
 (1344,4,6,44.00,48.00000),
 (1345,4,6,45.00,49.00000),
 (1346,4,6,46.00,50.00000),
 (1347,4,6,47.00,51.00000),
 (1348,4,6,48.00,52.00000),
 (1349,4,6,49.00,53.00000),
 (1350,4,6,50.00,54.00000),
 (1351,4,7,1.00,5.00000),
 (1352,4,7,2.00,6.00000),
 (1353,4,7,3.00,7.00000),
 (1354,4,7,4.00,8.00000),
 (1355,4,7,5.00,9.00000),
 (1356,4,7,6.00,10.00000),
 (1357,4,7,7.00,11.00000),
 (1358,4,7,8.00,12.00000),
 (1359,4,7,9.00,13.00000),
 (1360,4,7,10.00,14.00000),
 (1361,4,7,11.00,15.00000),
 (1362,4,7,12.00,16.00000),
 (1363,4,7,13.00,17.00000),
 (1364,4,7,14.00,18.00000),
 (1365,4,7,15.00,19.00000),
 (1366,4,7,16.00,20.00000),
 (1367,4,7,17.00,21.00000),
 (1368,4,7,18.00,22.00000),
 (1369,4,7,19.00,23.00000),
 (1370,4,7,20.00,24.00000),
 (1371,4,7,21.00,25.00000),
 (1372,4,7,22.00,26.00000),
 (1373,4,7,23.00,27.00000),
 (1374,4,7,24.00,28.00000),
 (1375,4,7,25.00,29.00000),
 (1376,4,7,26.00,30.00000),
 (1377,4,7,27.00,31.00000),
 (1378,4,7,28.00,32.00000),
 (1379,4,7,29.00,33.00000),
 (1380,4,7,30.00,34.00000),
 (1381,4,7,31.00,35.00000),
 (1382,4,7,32.00,36.00000),
 (1383,4,7,33.00,37.00000),
 (1384,4,7,34.00,38.00000),
 (1385,4,7,35.00,39.00000),
 (1386,4,7,36.00,40.00000),
 (1387,4,7,37.00,41.00000),
 (1388,4,7,38.00,42.00000),
 (1389,4,7,39.00,43.00000),
 (1390,4,7,40.00,44.00000),
 (1391,4,7,41.00,45.00000),
 (1392,4,7,42.00,46.00000),
 (1393,4,7,43.00,47.00000),
 (1394,4,7,44.00,48.00000),
 (1395,4,7,45.00,49.00000),
 (1396,4,7,46.00,50.00000),
 (1397,4,7,47.00,51.00000),
 (1398,4,7,48.00,52.00000),
 (1399,4,7,49.00,53.00000),
 (1400,4,7,50.00,54.00000),
 (1401,5,1,1.00,5.00000),
 (1402,5,1,2.00,6.00000),
 (1403,5,1,3.00,7.00000),
 (1404,5,1,4.00,8.00000),
 (1405,5,1,5.00,9.00000),
 (1406,5,1,6.00,10.00000),
 (1407,5,1,7.00,11.00000),
 (1408,5,1,8.00,12.00000),
 (1409,5,1,9.00,13.00000),
 (1410,5,1,10.00,14.00000),
 (1411,5,1,11.00,15.00000),
 (1412,5,1,12.00,16.00000),
 (1413,5,1,13.00,17.00000),
 (1414,5,1,14.00,18.00000),
 (1415,5,1,15.00,19.00000),
 (1416,5,1,16.00,20.00000),
 (1417,5,1,17.00,21.00000),
 (1418,5,1,18.00,22.00000),
 (1419,5,1,19.00,23.00000),
 (1420,5,1,20.00,24.00000),
 (1421,5,1,21.00,25.00000),
 (1422,5,1,22.00,26.00000),
 (1423,5,1,23.00,27.00000),
 (1424,5,1,24.00,28.00000),
 (1425,5,1,25.00,29.00000),
 (1426,5,1,26.00,30.00000),
 (1427,5,1,27.00,31.00000),
 (1428,5,1,28.00,32.00000),
 (1429,5,1,29.00,33.00000),
 (1430,5,1,30.00,34.00000),
 (1431,5,1,31.00,35.00000),
 (1432,5,1,32.00,36.00000),
 (1433,5,1,33.00,37.00000),
 (1434,5,1,34.00,38.00000),
 (1435,5,1,35.00,39.00000),
 (1436,5,1,36.00,40.00000),
 (1437,5,1,37.00,41.00000),
 (1438,5,1,38.00,42.00000),
 (1439,5,1,39.00,43.00000),
 (1440,5,1,40.00,44.00000),
 (1441,5,1,41.00,45.00000),
 (1442,5,1,42.00,46.00000),
 (1443,5,1,43.00,47.00000),
 (1444,5,1,44.00,48.00000),
 (1445,5,1,45.00,49.00000),
 (1446,5,1,46.00,50.00000),
 (1447,5,1,47.00,51.00000),
 (1448,5,1,48.00,52.00000),
 (1449,5,1,49.00,53.00000),
 (1450,5,1,50.00,54.00000),
 (1451,5,2,1.00,5.00000),
 (1452,5,2,2.00,6.00000),
 (1453,5,2,3.00,7.00000),
 (1454,5,2,4.00,8.00000),
 (1455,5,2,5.00,9.00000),
 (1456,5,2,6.00,10.00000),
 (1457,5,2,7.00,11.00000),
 (1458,5,2,8.00,12.00000),
 (1459,5,2,9.00,13.00000),
 (1460,5,2,10.00,14.00000),
 (1461,5,2,11.00,15.00000),
 (1462,5,2,12.00,16.00000),
 (1463,5,2,13.00,17.00000),
 (1464,5,2,14.00,18.00000),
 (1465,5,2,15.00,19.00000),
 (1466,5,2,16.00,20.00000),
 (1467,5,2,17.00,21.00000),
 (1468,5,2,18.00,22.00000),
 (1469,5,2,19.00,23.00000),
 (1470,5,2,20.00,24.00000),
 (1471,5,2,21.00,25.00000),
 (1472,5,2,22.00,26.00000),
 (1473,5,2,23.00,27.00000),
 (1474,5,2,24.00,28.00000),
 (1475,5,2,25.00,29.00000),
 (1476,5,2,26.00,30.00000),
 (1477,5,2,27.00,31.00000),
 (1478,5,2,28.00,32.00000),
 (1479,5,2,29.00,33.00000),
 (1480,5,2,30.00,34.00000),
 (1481,5,2,31.00,35.00000),
 (1482,5,2,32.00,36.00000),
 (1483,5,2,33.00,37.00000),
 (1484,5,2,34.00,38.00000),
 (1485,5,2,35.00,39.00000),
 (1486,5,2,36.00,40.00000),
 (1487,5,2,37.00,41.00000),
 (1488,5,2,38.00,42.00000),
 (1489,5,2,39.00,43.00000),
 (1490,5,2,40.00,44.00000),
 (1491,5,2,41.00,45.00000),
 (1492,5,2,42.00,46.00000),
 (1493,5,2,43.00,47.00000),
 (1494,5,2,44.00,48.00000),
 (1495,5,2,45.00,49.00000),
 (1496,5,2,46.00,50.00000),
 (1497,5,2,47.00,51.00000),
 (1498,5,2,48.00,52.00000),
 (1499,5,2,49.00,53.00000),
 (1500,5,2,50.00,54.00000),
 (1501,5,3,1.00,5.00000),
 (1502,5,3,2.00,6.00000),
 (1503,5,3,3.00,7.00000),
 (1504,5,3,4.00,8.00000),
 (1505,5,3,5.00,9.00000),
 (1506,5,3,6.00,10.00000),
 (1507,5,3,7.00,11.00000),
 (1508,5,3,8.00,12.00000),
 (1509,5,3,9.00,13.00000),
 (1510,5,3,10.00,14.00000),
 (1511,5,3,11.00,15.00000),
 (1512,5,3,12.00,16.00000),
 (1513,5,3,13.00,17.00000),
 (1514,5,3,14.00,18.00000),
 (1515,5,3,15.00,19.00000),
 (1516,5,3,16.00,20.00000),
 (1517,5,3,17.00,21.00000),
 (1518,5,3,18.00,22.00000),
 (1519,5,3,19.00,23.00000),
 (1520,5,3,20.00,24.00000),
 (1521,5,3,21.00,25.00000),
 (1522,5,3,22.00,26.00000),
 (1523,5,3,23.00,27.00000),
 (1524,5,3,24.00,28.00000),
 (1525,5,3,25.00,29.00000),
 (1526,5,3,26.00,30.00000),
 (1527,5,3,27.00,31.00000),
 (1528,5,3,28.00,32.00000),
 (1529,5,3,29.00,33.00000),
 (1530,5,3,30.00,34.00000),
 (1531,5,3,31.00,35.00000),
 (1532,5,3,32.00,36.00000),
 (1533,5,3,33.00,37.00000),
 (1534,5,3,34.00,38.00000),
 (1535,5,3,35.00,39.00000),
 (1536,5,3,36.00,40.00000),
 (1537,5,3,37.00,41.00000),
 (1538,5,3,38.00,42.00000),
 (1539,5,3,39.00,43.00000),
 (1540,5,3,40.00,44.00000),
 (1541,5,3,41.00,45.00000),
 (1542,5,3,42.00,46.00000),
 (1543,5,3,43.00,47.00000),
 (1544,5,3,44.00,48.00000),
 (1545,5,3,45.00,49.00000),
 (1546,5,3,46.00,50.00000),
 (1547,5,3,47.00,51.00000),
 (1548,5,3,48.00,52.00000),
 (1549,5,3,49.00,53.00000),
 (1550,5,3,50.00,54.00000),
 (1551,5,4,1.00,5.00000),
 (1552,5,4,2.00,6.00000),
 (1553,5,4,3.00,7.00000),
 (1554,5,4,4.00,8.00000),
 (1555,5,4,5.00,9.00000),
 (1556,5,4,6.00,10.00000),
 (1557,5,4,7.00,11.00000),
 (1558,5,4,8.00,12.00000),
 (1559,5,4,9.00,13.00000),
 (1560,5,4,10.00,14.00000),
 (1561,5,4,11.00,15.00000),
 (1562,5,4,12.00,16.00000),
 (1563,5,4,13.00,17.00000),
 (1564,5,4,14.00,18.00000),
 (1565,5,4,15.00,19.00000),
 (1566,5,4,16.00,20.00000),
 (1567,5,4,17.00,21.00000),
 (1568,5,4,18.00,22.00000),
 (1569,5,4,19.00,23.00000),
 (1570,5,4,20.00,24.00000),
 (1571,5,4,21.00,25.00000),
 (1572,5,4,22.00,26.00000),
 (1573,5,4,23.00,27.00000),
 (1574,5,4,24.00,28.00000),
 (1575,5,4,25.00,29.00000),
 (1576,5,4,26.00,30.00000),
 (1577,5,4,27.00,31.00000),
 (1578,5,4,28.00,32.00000),
 (1579,5,4,29.00,33.00000),
 (1580,5,4,30.00,34.00000),
 (1581,5,4,31.00,35.00000),
 (1582,5,4,32.00,36.00000),
 (1583,5,4,33.00,37.00000),
 (1584,5,4,34.00,38.00000),
 (1585,5,4,35.00,39.00000),
 (1586,5,4,36.00,40.00000),
 (1587,5,4,37.00,41.00000),
 (1588,5,4,38.00,42.00000),
 (1589,5,4,39.00,43.00000),
 (1590,5,4,40.00,44.00000),
 (1591,5,4,41.00,45.00000),
 (1592,5,4,42.00,46.00000),
 (1593,5,4,43.00,47.00000),
 (1594,5,4,44.00,48.00000),
 (1595,5,4,45.00,49.00000),
 (1596,5,4,46.00,50.00000),
 (1597,5,4,47.00,51.00000),
 (1598,5,4,48.00,52.00000),
 (1599,5,4,49.00,53.00000),
 (1600,5,4,50.00,54.00000),
 (1601,5,5,1.00,5.00000),
 (1602,5,5,2.00,6.00000),
 (1603,5,5,3.00,7.00000),
 (1604,5,5,4.00,8.00000),
 (1605,5,5,5.00,9.00000),
 (1606,5,5,6.00,10.00000),
 (1607,5,5,7.00,11.00000),
 (1608,5,5,8.00,12.00000),
 (1609,5,5,9.00,13.00000),
 (1610,5,5,10.00,14.00000),
 (1611,5,5,11.00,15.00000),
 (1612,5,5,12.00,16.00000),
 (1613,5,5,13.00,17.00000),
 (1614,5,5,14.00,18.00000),
 (1615,5,5,15.00,19.00000),
 (1616,5,5,16.00,20.00000),
 (1617,5,5,17.00,21.00000),
 (1618,5,5,18.00,22.00000),
 (1619,5,5,19.00,23.00000),
 (1620,5,5,20.00,24.00000),
 (1621,5,5,21.00,25.00000),
 (1622,5,5,22.00,26.00000),
 (1623,5,5,23.00,27.00000),
 (1624,5,5,24.00,28.00000),
 (1625,5,5,25.00,29.00000),
 (1626,5,5,26.00,30.00000),
 (1627,5,5,27.00,31.00000),
 (1628,5,5,28.00,32.00000),
 (1629,5,5,29.00,33.00000),
 (1630,5,5,30.00,34.00000),
 (1631,5,5,31.00,35.00000),
 (1632,5,5,32.00,36.00000),
 (1633,5,5,33.00,37.00000),
 (1634,5,5,34.00,38.00000),
 (1635,5,5,35.00,39.00000),
 (1636,5,5,36.00,40.00000),
 (1637,5,5,37.00,41.00000),
 (1638,5,5,38.00,42.00000),
 (1639,5,5,39.00,43.00000),
 (1640,5,5,40.00,44.00000),
 (1641,5,5,41.00,45.00000),
 (1642,5,5,42.00,46.00000),
 (1643,5,5,43.00,47.00000),
 (1644,5,5,44.00,48.00000),
 (1645,5,5,45.00,49.00000),
 (1646,5,5,46.00,50.00000),
 (1647,5,5,47.00,51.00000),
 (1648,5,5,48.00,52.00000),
 (1649,5,5,49.00,53.00000),
 (1650,5,5,50.00,54.00000),
 (1651,5,6,1.00,5.00000),
 (1652,5,6,2.00,6.00000),
 (1653,5,6,3.00,7.00000),
 (1654,5,6,4.00,8.00000),
 (1655,5,6,5.00,9.00000),
 (1656,5,6,6.00,10.00000),
 (1657,5,6,7.00,11.00000),
 (1658,5,6,8.00,12.00000),
 (1659,5,6,9.00,13.00000),
 (1660,5,6,10.00,14.00000),
 (1661,5,6,11.00,15.00000),
 (1662,5,6,12.00,16.00000),
 (1663,5,6,13.00,17.00000),
 (1664,5,6,14.00,18.00000),
 (1665,5,6,15.00,19.00000),
 (1666,5,6,16.00,20.00000),
 (1667,5,6,17.00,21.00000),
 (1668,5,6,18.00,22.00000),
 (1669,5,6,19.00,23.00000),
 (1670,5,6,20.00,24.00000),
 (1671,5,6,21.00,25.00000),
 (1672,5,6,22.00,26.00000),
 (1673,5,6,23.00,27.00000),
 (1674,5,6,24.00,28.00000),
 (1675,5,6,25.00,29.00000),
 (1676,5,6,26.00,30.00000),
 (1677,5,6,27.00,31.00000),
 (1678,5,6,28.00,32.00000),
 (1679,5,6,29.00,33.00000),
 (1680,5,6,30.00,34.00000),
 (1681,5,6,31.00,35.00000),
 (1682,5,6,32.00,36.00000),
 (1683,5,6,33.00,37.00000),
 (1684,5,6,34.00,38.00000),
 (1685,5,6,35.00,39.00000),
 (1686,5,6,36.00,40.00000),
 (1687,5,6,37.00,41.00000),
 (1688,5,6,38.00,42.00000),
 (1689,5,6,39.00,43.00000),
 (1690,5,6,40.00,44.00000),
 (1691,5,6,41.00,45.00000),
 (1692,5,6,42.00,46.00000),
 (1693,5,6,43.00,47.00000),
 (1694,5,6,44.00,48.00000),
 (1695,5,6,45.00,49.00000),
 (1696,5,6,46.00,50.00000),
 (1697,5,6,47.00,51.00000),
 (1698,5,6,48.00,52.00000),
 (1699,5,6,49.00,53.00000),
 (1700,5,6,50.00,54.00000),
 (1701,5,7,1.00,5.00000),
 (1702,5,7,2.00,6.00000),
 (1703,5,7,3.00,7.00000),
 (1704,5,7,4.00,8.00000),
 (1705,5,7,5.00,9.00000),
 (1706,5,7,6.00,10.00000),
 (1707,5,7,7.00,11.00000),
 (1708,5,7,8.00,12.00000),
 (1709,5,7,9.00,13.00000),
 (1710,5,7,10.00,14.00000),
 (1711,5,7,11.00,15.00000),
 (1712,5,7,12.00,16.00000),
 (1713,5,7,13.00,17.00000),
 (1714,5,7,14.00,18.00000),
 (1715,5,7,15.00,19.00000),
 (1716,5,7,16.00,20.00000),
 (1717,5,7,17.00,21.00000),
 (1718,5,7,18.00,22.00000),
 (1719,5,7,19.00,23.00000),
 (1720,5,7,20.00,24.00000),
 (1721,5,7,21.00,25.00000),
 (1722,5,7,22.00,26.00000),
 (1723,5,7,23.00,27.00000),
 (1724,5,7,24.00,28.00000),
 (1725,5,7,25.00,29.00000),
 (1726,5,7,26.00,30.00000),
 (1727,5,7,27.00,31.00000),
 (1728,5,7,28.00,32.00000),
 (1729,5,7,29.00,33.00000),
 (1730,5,7,30.00,34.00000),
 (1731,5,7,31.00,35.00000),
 (1732,5,7,32.00,36.00000),
 (1733,5,7,33.00,37.00000),
 (1734,5,7,34.00,38.00000),
 (1735,5,7,35.00,39.00000),
 (1736,5,7,36.00,40.00000),
 (1737,5,7,37.00,41.00000),
 (1738,5,7,38.00,42.00000),
 (1739,5,7,39.00,43.00000),
 (1740,5,7,40.00,44.00000),
 (1741,5,7,41.00,45.00000),
 (1742,5,7,42.00,46.00000),
 (1743,5,7,43.00,47.00000),
 (1744,5,7,44.00,48.00000),
 (1745,5,7,45.00,49.00000),
 (1746,5,7,46.00,50.00000),
 (1747,5,7,47.00,51.00000),
 (1748,5,7,48.00,52.00000),
 (1749,5,7,49.00,53.00000),
 (1750,5,7,50.00,54.00000),
 (1751,6,1,1.00,5.00000),
 (1752,6,1,2.00,6.00000),
 (1753,6,1,3.00,7.00000),
 (1754,6,1,4.00,8.00000),
 (1755,6,1,5.00,9.00000),
 (1756,6,1,6.00,10.00000),
 (1757,6,1,7.00,11.00000),
 (1758,6,1,8.00,12.00000),
 (1759,6,1,9.00,13.00000),
 (1760,6,1,10.00,14.00000),
 (1761,6,1,11.00,15.00000),
 (1762,6,1,12.00,16.00000),
 (1763,6,1,13.00,17.00000),
 (1764,6,1,14.00,18.00000),
 (1765,6,1,15.00,19.00000),
 (1766,6,1,16.00,20.00000),
 (1767,6,1,17.00,21.00000),
 (1768,6,1,18.00,22.00000),
 (1769,6,1,19.00,23.00000),
 (1770,6,1,20.00,24.00000),
 (1771,6,1,21.00,25.00000),
 (1772,6,1,22.00,26.00000),
 (1773,6,1,23.00,27.00000),
 (1774,6,1,24.00,28.00000),
 (1775,6,1,25.00,29.00000),
 (1776,6,1,26.00,30.00000),
 (1777,6,1,27.00,31.00000),
 (1778,6,1,28.00,32.00000),
 (1779,6,1,29.00,33.00000),
 (1780,6,1,30.00,34.00000),
 (1781,6,1,31.00,35.00000),
 (1782,6,1,32.00,36.00000),
 (1783,6,1,33.00,37.00000),
 (1784,6,1,34.00,38.00000),
 (1785,6,1,35.00,39.00000),
 (1786,6,1,36.00,40.00000),
 (1787,6,1,37.00,41.00000),
 (1788,6,1,38.00,42.00000),
 (1789,6,1,39.00,43.00000),
 (1790,6,1,40.00,44.00000),
 (1791,6,1,41.00,45.00000),
 (1792,6,1,42.00,46.00000),
 (1793,6,1,43.00,47.00000),
 (1794,6,1,44.00,48.00000),
 (1795,6,1,45.00,49.00000),
 (1796,6,1,46.00,50.00000),
 (1797,6,1,47.00,51.00000),
 (1798,6,1,48.00,52.00000),
 (1799,6,1,49.00,53.00000),
 (1800,6,1,50.00,54.00000),
 (1801,6,2,1.00,5.00000),
 (1802,6,2,2.00,6.00000),
 (1803,6,2,3.00,7.00000),
 (1804,6,2,4.00,8.00000),
 (1805,6,2,5.00,9.00000),
 (1806,6,2,6.00,10.00000),
 (1807,6,2,7.00,11.00000),
 (1808,6,2,8.00,12.00000),
 (1809,6,2,9.00,13.00000),
 (1810,6,2,10.00,14.00000),
 (1811,6,2,11.00,15.00000),
 (1812,6,2,12.00,16.00000),
 (1813,6,2,13.00,17.00000),
 (1814,6,2,14.00,18.00000),
 (1815,6,2,15.00,19.00000),
 (1816,6,2,16.00,20.00000),
 (1817,6,2,17.00,21.00000),
 (1818,6,2,18.00,22.00000),
 (1819,6,2,19.00,23.00000),
 (1820,6,2,20.00,24.00000),
 (1821,6,2,21.00,25.00000),
 (1822,6,2,22.00,26.00000),
 (1823,6,2,23.00,27.00000),
 (1824,6,2,24.00,28.00000),
 (1825,6,2,25.00,29.00000),
 (1826,6,2,26.00,30.00000),
 (1827,6,2,27.00,31.00000),
 (1828,6,2,28.00,32.00000),
 (1829,6,2,29.00,33.00000),
 (1830,6,2,30.00,34.00000),
 (1831,6,2,31.00,35.00000),
 (1832,6,2,32.00,36.00000),
 (1833,6,2,33.00,37.00000),
 (1834,6,2,34.00,38.00000),
 (1835,6,2,35.00,39.00000),
 (1836,6,2,36.00,40.00000),
 (1837,6,2,37.00,41.00000),
 (1838,6,2,38.00,42.00000),
 (1839,6,2,39.00,43.00000),
 (1840,6,2,40.00,44.00000),
 (1841,6,2,41.00,45.00000),
 (1842,6,2,42.00,46.00000),
 (1843,6,2,43.00,47.00000),
 (1844,6,2,44.00,48.00000),
 (1845,6,2,45.00,49.00000),
 (1846,6,2,46.00,50.00000),
 (1847,6,2,47.00,51.00000),
 (1848,6,2,48.00,52.00000),
 (1849,6,2,49.00,53.00000),
 (1850,6,2,50.00,54.00000),
 (1851,6,3,1.00,5.00000),
 (1852,6,3,2.00,6.00000),
 (1853,6,3,3.00,7.00000),
 (1854,6,3,4.00,8.00000),
 (1855,6,3,5.00,9.00000),
 (1856,6,3,6.00,10.00000),
 (1857,6,3,7.00,11.00000),
 (1858,6,3,8.00,12.00000),
 (1859,6,3,9.00,13.00000),
 (1860,6,3,10.00,14.00000),
 (1861,6,3,11.00,15.00000),
 (1862,6,3,12.00,16.00000),
 (1863,6,3,13.00,17.00000),
 (1864,6,3,14.00,18.00000),
 (1865,6,3,15.00,19.00000),
 (1866,6,3,16.00,20.00000),
 (1867,6,3,17.00,21.00000),
 (1868,6,3,18.00,22.00000),
 (1869,6,3,19.00,23.00000),
 (1870,6,3,20.00,24.00000),
 (1871,6,3,21.00,25.00000),
 (1872,6,3,22.00,26.00000),
 (1873,6,3,23.00,27.00000),
 (1874,6,3,24.00,28.00000),
 (1875,6,3,25.00,29.00000),
 (1876,6,3,26.00,30.00000),
 (1877,6,3,27.00,31.00000),
 (1878,6,3,28.00,32.00000),
 (1879,6,3,29.00,33.00000),
 (1880,6,3,30.00,34.00000),
 (1881,6,3,31.00,35.00000),
 (1882,6,3,32.00,36.00000),
 (1883,6,3,33.00,37.00000),
 (1884,6,3,34.00,38.00000),
 (1885,6,3,35.00,39.00000),
 (1886,6,3,36.00,40.00000),
 (1887,6,3,37.00,41.00000),
 (1888,6,3,38.00,42.00000),
 (1889,6,3,39.00,43.00000),
 (1890,6,3,40.00,44.00000),
 (1891,6,3,41.00,45.00000),
 (1892,6,3,42.00,46.00000),
 (1893,6,3,43.00,47.00000),
 (1894,6,3,44.00,48.00000),
 (1895,6,3,45.00,49.00000),
 (1896,6,3,46.00,50.00000),
 (1897,6,3,47.00,51.00000),
 (1898,6,3,48.00,52.00000),
 (1899,6,3,49.00,53.00000),
 (1900,6,3,50.00,54.00000),
 (1901,6,4,1.00,5.00000),
 (1902,6,4,2.00,6.00000),
 (1903,6,4,3.00,7.00000),
 (1904,6,4,4.00,8.00000),
 (1905,6,4,5.00,9.00000),
 (1906,6,4,6.00,10.00000),
 (1907,6,4,7.00,11.00000),
 (1908,6,4,8.00,12.00000),
 (1909,6,4,9.00,13.00000),
 (1910,6,4,10.00,14.00000),
 (1911,6,4,11.00,15.00000),
 (1912,6,4,12.00,16.00000),
 (1913,6,4,13.00,17.00000),
 (1914,6,4,14.00,18.00000),
 (1915,6,4,15.00,19.00000),
 (1916,6,4,16.00,20.00000),
 (1917,6,4,17.00,21.00000),
 (1918,6,4,18.00,22.00000),
 (1919,6,4,19.00,23.00000),
 (1920,6,4,20.00,24.00000),
 (1921,6,4,21.00,25.00000),
 (1922,6,4,22.00,26.00000),
 (1923,6,4,23.00,27.00000),
 (1924,6,4,24.00,28.00000),
 (1925,6,4,25.00,29.00000),
 (1926,6,4,26.00,30.00000),
 (1927,6,4,27.00,31.00000),
 (1928,6,4,28.00,32.00000),
 (1929,6,4,29.00,33.00000),
 (1930,6,4,30.00,34.00000),
 (1931,6,4,31.00,35.00000),
 (1932,6,4,32.00,36.00000),
 (1933,6,4,33.00,37.00000),
 (1934,6,4,34.00,38.00000),
 (1935,6,4,35.00,39.00000),
 (1936,6,4,36.00,40.00000),
 (1937,6,4,37.00,41.00000),
 (1938,6,4,38.00,42.00000),
 (1939,6,4,39.00,43.00000),
 (1940,6,4,40.00,44.00000),
 (1941,6,4,41.00,45.00000),
 (1942,6,4,42.00,46.00000),
 (1943,6,4,43.00,47.00000),
 (1944,6,4,44.00,48.00000),
 (1945,6,4,45.00,49.00000),
 (1946,6,4,46.00,50.00000),
 (1947,6,4,47.00,51.00000),
 (1948,6,4,48.00,52.00000),
 (1949,6,4,49.00,53.00000),
 (1950,6,4,50.00,54.00000),
 (1951,6,5,1.00,5.00000),
 (1952,6,5,2.00,6.00000),
 (1953,6,5,3.00,7.00000),
 (1954,6,5,4.00,8.00000),
 (1955,6,5,5.00,9.00000),
 (1956,6,5,6.00,10.00000),
 (1957,6,5,7.00,11.00000),
 (1958,6,5,8.00,12.00000),
 (1959,6,5,9.00,13.00000),
 (1960,6,5,10.00,14.00000),
 (1961,6,5,11.00,15.00000),
 (1962,6,5,12.00,16.00000),
 (1963,6,5,13.00,17.00000),
 (1964,6,5,14.00,18.00000),
 (1965,6,5,15.00,19.00000),
 (1966,6,5,16.00,20.00000),
 (1967,6,5,17.00,21.00000),
 (1968,6,5,18.00,22.00000),
 (1969,6,5,19.00,23.00000),
 (1970,6,5,20.00,24.00000),
 (1971,6,5,21.00,25.00000),
 (1972,6,5,22.00,26.00000),
 (1973,6,5,23.00,27.00000),
 (1974,6,5,24.00,28.00000),
 (1975,6,5,25.00,29.00000),
 (1976,6,5,26.00,30.00000),
 (1977,6,5,27.00,31.00000),
 (1978,6,5,28.00,32.00000),
 (1979,6,5,29.00,33.00000),
 (1980,6,5,30.00,34.00000),
 (1981,6,5,31.00,35.00000),
 (1982,6,5,32.00,36.00000),
 (1983,6,5,33.00,37.00000),
 (1984,6,5,34.00,38.00000),
 (1985,6,5,35.00,39.00000),
 (1986,6,5,36.00,40.00000),
 (1987,6,5,37.00,41.00000),
 (1988,6,5,38.00,42.00000),
 (1989,6,5,39.00,43.00000),
 (1990,6,5,40.00,44.00000),
 (1991,6,5,41.00,45.00000),
 (1992,6,5,42.00,46.00000),
 (1993,6,5,43.00,47.00000),
 (1994,6,5,44.00,48.00000),
 (1995,6,5,45.00,49.00000),
 (1996,6,5,46.00,50.00000),
 (1997,6,5,47.00,51.00000),
 (1998,6,5,48.00,52.00000),
 (1999,6,5,49.00,53.00000),
 (2000,6,5,50.00,54.00000),
 (2001,6,6,1.00,5.00000),
 (2002,6,6,2.00,6.00000),
 (2003,6,6,3.00,7.00000),
 (2004,6,6,4.00,8.00000),
 (2005,6,6,5.00,9.00000),
 (2006,6,6,6.00,10.00000),
 (2007,6,6,7.00,11.00000),
 (2008,6,6,8.00,12.00000),
 (2009,6,6,9.00,13.00000),
 (2010,6,6,10.00,14.00000),
 (2011,6,6,11.00,15.00000),
 (2012,6,6,12.00,16.00000),
 (2013,6,6,13.00,17.00000),
 (2014,6,6,14.00,18.00000),
 (2015,6,6,15.00,19.00000),
 (2016,6,6,16.00,20.00000),
 (2017,6,6,17.00,21.00000),
 (2018,6,6,18.00,22.00000),
 (2019,6,6,19.00,23.00000),
 (2020,6,6,20.00,24.00000),
 (2021,6,6,21.00,25.00000),
 (2022,6,6,22.00,26.00000),
 (2023,6,6,23.00,27.00000),
 (2024,6,6,24.00,28.00000),
 (2025,6,6,25.00,29.00000),
 (2026,6,6,26.00,30.00000),
 (2027,6,6,27.00,31.00000),
 (2028,6,6,28.00,32.00000),
 (2029,6,6,29.00,33.00000),
 (2030,6,6,30.00,34.00000),
 (2031,6,6,31.00,35.00000),
 (2032,6,6,32.00,36.00000),
 (2033,6,6,33.00,37.00000),
 (2034,6,6,34.00,38.00000),
 (2035,6,6,35.00,39.00000),
 (2036,6,6,36.00,40.00000),
 (2037,6,6,37.00,41.00000),
 (2038,6,6,38.00,42.00000),
 (2039,6,6,39.00,43.00000),
 (2040,6,6,40.00,44.00000),
 (2041,6,6,41.00,45.00000),
 (2042,6,6,42.00,46.00000),
 (2043,6,6,43.00,47.00000),
 (2044,6,6,44.00,48.00000),
 (2045,6,6,45.00,49.00000),
 (2046,6,6,46.00,50.00000),
 (2047,6,6,47.00,51.00000),
 (2048,6,6,48.00,52.00000),
 (2049,6,6,49.00,53.00000),
 (2050,6,6,50.00,54.00000),
 (2051,6,7,1.00,5.00000),
 (2052,6,7,2.00,6.00000),
 (2053,6,7,3.00,7.00000),
 (2054,6,7,4.00,8.00000),
 (2055,6,7,5.00,9.00000),
 (2056,6,7,6.00,10.00000),
 (2057,6,7,7.00,11.00000),
 (2058,6,7,8.00,12.00000),
 (2059,6,7,9.00,13.00000),
 (2060,6,7,10.00,14.00000),
 (2061,6,7,11.00,15.00000),
 (2062,6,7,12.00,16.00000),
 (2063,6,7,13.00,17.00000),
 (2064,6,7,14.00,18.00000),
 (2065,6,7,15.00,19.00000),
 (2066,6,7,16.00,20.00000),
 (2067,6,7,17.00,21.00000),
 (2068,6,7,18.00,22.00000),
 (2069,6,7,19.00,23.00000),
 (2070,6,7,20.00,24.00000),
 (2071,6,7,21.00,25.00000),
 (2072,6,7,22.00,26.00000),
 (2073,6,7,23.00,27.00000),
 (2074,6,7,24.00,28.00000),
 (2075,6,7,25.00,29.00000),
 (2076,6,7,26.00,30.00000),
 (2077,6,7,27.00,31.00000),
 (2078,6,7,28.00,32.00000),
 (2079,6,7,29.00,33.00000),
 (2080,6,7,30.00,34.00000),
 (2081,6,7,31.00,35.00000),
 (2082,6,7,32.00,36.00000),
 (2083,6,7,33.00,37.00000),
 (2084,6,7,34.00,38.00000),
 (2085,6,7,35.00,39.00000),
 (2086,6,7,36.00,40.00000),
 (2087,6,7,37.00,41.00000),
 (2088,6,7,38.00,42.00000),
 (2089,6,7,39.00,43.00000),
 (2090,6,7,40.00,44.00000),
 (2091,6,7,41.00,45.00000),
 (2092,6,7,42.00,46.00000),
 (2093,6,7,43.00,47.00000),
 (2094,6,7,44.00,48.00000),
 (2095,6,7,45.00,49.00000),
 (2096,6,7,46.00,50.00000),
 (2097,6,7,47.00,51.00000),
 (2098,6,7,48.00,52.00000),
 (2099,6,7,49.00,53.00000),
 (2100,6,7,50.00,54.00000);
/*!40000 ALTER TABLE `tbl_kargo_ulke_il_bolge` ENABLE KEYS */;


--
-- Definition of table `tbl_kategoriler`
--

DROP TABLE IF EXISTS `tbl_kategoriler`;
CREATE TABLE `tbl_kategoriler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dil_id` int(11) NOT NULL DEFAULT '-1',
  `kategori_tip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 ana kategori, 1 alt kategori',
  `kategori_id` int(11) NOT NULL DEFAULT '0',
  `ad` varchar(255) NOT NULL DEFAULT '',
  `resim` varchar(255) DEFAULT NULL,
  `ust` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Üst panelde göster',
  `sira` int(11) NOT NULL DEFAULT '1',
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `onay` (`onay`),
  KEY `dil_id` (`dil_id`),
  KEY `kategori_id` (`kategori_id`),
  KEY `sira` (`sira`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `ust` (`ust`),
  CONSTRAINT `fk_kategoriler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kategoriler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kategoriler_dil_id` FOREIGN KEY (`dil_id`) REFERENCES `tbl_diller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kategoriler`
--

/*!40000 ALTER TABLE `tbl_kategoriler` DISABLE KEYS */;
INSERT INTO `tbl_kategoriler` (`id`,`dil_id`,`kategori_tip`,`kategori_id`,`ad`,`resim`,`ust`,`sira`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (12,999,0,0,'Şişme Botlar',NULL,1,0,1,999,'2012-04-23 01:22:47',999,'2012-03-28 11:45:45'),
 (13,999,0,0,'Akü ve Aksesuarları',NULL,0,0,1,999,'2012-04-23 01:22:47',999,'2012-03-28 09:58:25'),
 (18,999,0,0,'Bağlantı Elemanları',NULL,1,0,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 11:35:04'),
 (19,999,0,0,'Balık Bulucular',NULL,0,0,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 09:58:37'),
 (20,999,0,0,'Boya &amp; Bakım',NULL,0,0,1,999,'2012-04-23 01:22:47',NULL,'2012-04-26 23:42:26'),
 (21,999,0,0,'Can Yelekleri',NULL,1,0,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 11:35:05'),
 (22,999,0,0,'Çapa ve Baş Makaralar',NULL,0,0,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 09:58:57'),
 (23,999,0,0,'Deniz Motorları',NULL,0,0,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 09:59:06'),
 (24,999,0,0,'Dümen &amp; Kumanda',NULL,1,0,1,999,'2012-04-23 01:22:47',NULL,'2012-04-26 23:42:41'),
 (25,999,0,0,'Elektrik &amp; Elektronik',NULL,0,0,1,999,'2012-04-23 01:22:47',NULL,'2012-04-26 23:42:43'),
 (26,999,0,0,'Güverte',NULL,1,0,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 11:35:10'),
 (27,999,0,0,'Göstergeler',NULL,1,0,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 11:35:08'),
 (29,999,0,0,'Havalandırma',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:11:30'),
 (30,999,1,12,'Dinghy Botlar',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:04'),
 (31,999,1,12,'Izgara Tabanlı Botlar',NULL,0,1,1,999,'2012-04-23 01:22:47',999,'2012-05-05 18:50:16'),
 (32,999,1,12,'Şişme Tabanlı Botlar',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:05'),
 (33,999,1,12,'Ahşap Tabanlı Botlar',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:05'),
 (34,999,1,12,'Alüminyum Tabanlı Botlar',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:06'),
 (35,999,1,12,'Fiber Tabanlı Botlar',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:06'),
 (36,999,1,13,'Akü Aksesuarları',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:07'),
 (37,999,1,13,'Akü İzolatörü',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:11'),
 (38,999,1,13,'Akü Şalteri',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:11'),
 (39,999,1,13,'Devre Kesiciler',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:11'),
 (40,999,1,13,'Deka Marin Akü Bakımsız',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:11'),
 (41,999,1,13,'Aküler',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:13'),
 (43,999,1,18,'Babalar',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:13'),
 (44,999,1,18,'Çelik Halat',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:13'),
 (45,999,1,18,'Fırdöndü',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:13'),
 (46,999,1,18,'Halka Köprü',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:16'),
 (47,999,1,18,'Karabina',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:16'),
 (48,999,1,18,'Klemens',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:16'),
 (49,999,1,18,'Radansa',NULL,0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:16');
/*!40000 ALTER TABLE `tbl_kategoriler` ENABLE KEYS */;


--
-- Definition of trigger `trg_kategoriler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_kategoriler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_kategoriler_ek` BEFORE INSERT ON `tbl_kategoriler` FOR EACH ROW BEGIN

SET NEW.tarih_ek = NOW();

IF (NEW.kategori_id!=0) THEN
SET NEW.kategori_tip = 1;
ELSE
SET NEW.kategori_tip = 0;
END IF;

END $$

DELIMITER ;

--
-- Definition of trigger `trg_kategoriler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_kategoriler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_kategoriler_gun` BEFORE UPDATE ON `tbl_kategoriler` FOR EACH ROW BEGIN

SET NEW.tarih_gun = NOW();

IF (NEW.kategori_id!=0) THEN
SET NEW.kategori_tip = 1;
ELSE
SET NEW.kategori_tip = 0;
END IF;

END $$

DELIMITER ;

--
-- Definition of table `tbl_kodlar`
--

DROP TABLE IF EXISTS `tbl_kodlar`;
CREATE TABLE `tbl_kodlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kod` varchar(7) NOT NULL DEFAULT 'SER-000',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `kod` (`kod`),
  CONSTRAINT `fk_kodlar_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kodlar_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kodlar`
--

/*!40000 ALTER TABLE `tbl_kodlar` DISABLE KEYS */;
INSERT INTO `tbl_kodlar` (`id`,`kod`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,'SER-000',999,'2011-12-15 00:26:21',999,'2012-01-30 02:32:57'),
 (2,'SER-001',999,'2011-12-15 00:26:55',999,'2012-01-30 02:32:57'),
 (3,'SER-003',999,'2011-12-15 00:26:59',999,'2012-01-30 02:32:59');
/*!40000 ALTER TABLE `tbl_kodlar` ENABLE KEYS */;


--
-- Definition of trigger `trg_kodlar_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_kodlar_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_kodlar_ek` BEFORE INSERT ON `tbl_kodlar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_kodlar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_kodlar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_kodlar_gun` BEFORE UPDATE ON `tbl_kodlar` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_kredi_karti_oranlar`
--

DROP TABLE IF EXISTS `tbl_kredi_karti_oranlar`;
CREATE TABLE `tbl_kredi_karti_oranlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banka_id` int(11) NOT NULL DEFAULT '-1',
  `ay` int(2) NOT NULL DEFAULT '1',
  `oran` float(11,3) DEFAULT NULL,
  `onay` tinyint(1) DEFAULT '1',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `banka_id` (`banka_id`),
  KEY `onay` (`onay`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `ay` (`ay`),
  KEY `oran` (`oran`),
  CONSTRAINT `fk_kredi_karti_oranlar_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kredi_karti_oranlar_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kredi_karti_oranlar_banka_id` FOREIGN KEY (`banka_id`) REFERENCES `tbl_sbt_banka` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kredi_karti_oranlar`
--

/*!40000 ALTER TABLE `tbl_kredi_karti_oranlar` DISABLE KEYS */;
INSERT INTO `tbl_kredi_karti_oranlar` (`id`,`banka_id`,`ay`,`oran`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (2,17,3,1.020,1,999,'2012-03-28 00:18:30',999,'2012-04-25 00:00:19'),
 (3,17,6,1.040,1,999,'2012-04-25 00:00:29',NULL,NULL),
 (4,17,9,1.060,1,999,'2012-04-25 00:00:36',NULL,NULL),
 (5,17,12,1.100,1,999,'2012-04-25 00:00:45',NULL,NULL),
 (6,18,3,1.010,1,999,'2012-04-25 00:00:53',NULL,NULL),
 (7,18,6,1.030,1,999,'2012-04-25 00:01:01',NULL,NULL),
 (8,18,9,1.050,1,999,'2012-04-25 00:01:09',NULL,NULL),
 (9,18,12,1.080,1,999,'2012-04-25 00:01:17',NULL,NULL),
 (10,19,3,1.000,1,999,'2012-04-25 00:01:28',NULL,NULL),
 (11,19,6,1.010,1,999,'2012-04-25 00:01:36',NULL,NULL),
 (12,19,9,1.030,1,999,'2012-04-25 00:01:43',NULL,NULL),
 (13,19,12,1.060,1,999,'2012-04-25 00:01:54',NULL,NULL),
 (14,20,3,1.020,1,999,'2012-04-25 00:02:00',NULL,NULL),
 (15,20,6,1.040,1,999,'2012-04-25 00:02:07',NULL,NULL),
 (16,20,9,1.070,1,999,'2012-04-25 00:02:16',NULL,NULL),
 (17,20,12,1.090,1,999,'2012-04-25 00:02:23',NULL,NULL);
/*!40000 ALTER TABLE `tbl_kredi_karti_oranlar` ENABLE KEYS */;


--
-- Definition of trigger `trg_kredi_karti_oranlar_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_kredi_karti_oranlar_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_kredi_karti_oranlar_ek` BEFORE INSERT ON `tbl_kredi_karti_oranlar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_kredi_karti_oranlar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_kredi_karti_oranlar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_kredi_karti_oranlar_gun` BEFORE UPDATE ON `tbl_kredi_karti_oranlar` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_kullanicilar`
--

DROP TABLE IF EXISTS `tbl_kullanicilar`;
CREATE TABLE `tbl_kullanicilar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_soyad` varchar(255) NOT NULL DEFAULT '',
  `sifre` varchar(36) NOT NULL DEFAULT '',
  `mail` varchar(320) NOT NULL DEFAULT '',
  `alan_kodu_id` int(11) DEFAULT NULL,
  `gsm` varchar(10) DEFAULT NULL,
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `tarih_ek` datetime DEFAULT NULL,
  `tarih_gun` datetime DEFAULT NULL,
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `telefon` (`gsm`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `alan_kodu_id` (`alan_kodu_id`),
  KEY `onay` (`onay`),
  KEY `admin_id_gun` (`admin_id_gun`),
  CONSTRAINT `fk_kullanicilar_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kullanicilar_alan_kodu_id` FOREIGN KEY (`alan_kodu_id`) REFERENCES `tbl_sbt_ulke` (`alan_kodu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kullanicilar`
--

/*!40000 ALTER TABLE `tbl_kullanicilar` DISABLE KEYS */;
INSERT INTO `tbl_kullanicilar` (`id`,`ad_soyad`,`sifre`,`mail`,`alan_kodu_id`,`gsm`,`onay`,`tarih_ek`,`tarih_gun`,`admin_id_gun`) VALUES 
 (1,'Fatih ÜNAL','5353F8D9D31D435F9D49BDA3968DC7B3','fatih@acoder.info',90,'5332317372',1,'2012-03-26 22:40:19','2012-05-04 22:29:15',NULL),
 (10,'H&#252;seyin Yıldırım','5353F8D9D31D435F9D49BDA3968DC7B3','dvlpr07@gmail.com',NULL,'5436063222',0,'2012-05-04 20:42:51','2012-05-06 18:32:50',NULL),
 (11,'H&#252;seyin Yıldırım','5353F8D9D31D435F9D49BDA3968DC7B3','huseyinyildirim@hotmail.com',NULL,'5436063222',1,'2012-05-04 20:46:30','2012-05-06 18:32:50',NULL);
/*!40000 ALTER TABLE `tbl_kullanicilar` ENABLE KEYS */;


--
-- Definition of trigger `trg_kullanicilar_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_kullanicilar_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_kullanicilar_ek` BEFORE INSERT ON `tbl_kullanicilar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_kullanicilar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_kullanicilar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_kullanicilar_gun` BEFORE UPDATE ON `tbl_kullanicilar` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_kullanicilar_adresler`
--

DROP TABLE IF EXISTS `tbl_kullanicilar_adresler`;
CREATE TABLE `tbl_kullanicilar_adresler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kullanici_id` int(11) NOT NULL DEFAULT '-1',
  `tip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 fatura adres, 1 kargo adres',
  `baslik` varchar(255) DEFAULT NULL,
  `ulke_id` int(11) NOT NULL DEFAULT '-1',
  `eyalet` varchar(255) DEFAULT NULL,
  `il` varchar(255) NOT NULL DEFAULT '',
  `il_id` int(11) DEFAULT NULL,
  `ilce` varchar(255) NOT NULL DEFAULT '',
  `ilce_id` int(11) DEFAULT NULL,
  `posta_kodu` varchar(50) DEFAULT NULL,
  `adres` longtext NOT NULL,
  `acik_adres` longtext,
  `tarih_ek` datetime DEFAULT NULL,
  `tarih_gun` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `kullanici_id` (`kullanici_id`),
  KEY `ulke_id` (`ulke_id`),
  KEY `tip` (`tip`),
  KEY `il_id` (`il_id`),
  KEY `ilce_id` (`ilce_id`),
  CONSTRAINT `fk_kullanicilar_adresler_ilce_id` FOREIGN KEY (`ilce_id`) REFERENCES `tbl_sbt_ulke_ilce` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kullanicilar_adresler_il_id` FOREIGN KEY (`il_id`) REFERENCES `tbl_sbt_ulke_il` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kullanicilar_adresler_kullanici_id` FOREIGN KEY (`kullanici_id`) REFERENCES `tbl_kullanicilar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kullanicilar_adresler_ulke_id` FOREIGN KEY (`ulke_id`) REFERENCES `tbl_sbt_ulke` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kullanicilar_adresler`
--

/*!40000 ALTER TABLE `tbl_kullanicilar_adresler` DISABLE KEYS */;
INSERT INTO `tbl_kullanicilar_adresler` (`id`,`kullanici_id`,`tip`,`baslik`,`ulke_id`,`eyalet`,`il`,`il_id`,`ilce`,`ilce_id`,`posta_kodu`,`adres`,`acik_adres`,`tarih_ek`,`tarih_gun`) VALUES 
 (2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Merkez',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-03-28 00:49:17','2012-06-27 13:15:53'),
 (4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Manavgat',96,'076001','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-03-28 00:49:39','2012-06-27 14:10:41');
/*!40000 ALTER TABLE `tbl_kullanicilar_adresler` ENABLE KEYS */;


--
-- Definition of trigger `trg_kullanicilar_adresler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_kullanicilar_adresler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_kullanicilar_adresler_ek` BEFORE INSERT ON `tbl_kullanicilar_adresler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_kullanicilar_adresler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_kullanicilar_adresler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_kullanicilar_adresler_gun` BEFORE UPDATE ON `tbl_kullanicilar_adresler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_kullanicilar_vergi_bilgiler`
--

DROP TABLE IF EXISTS `tbl_kullanicilar_vergi_bilgiler`;
CREATE TABLE `tbl_kullanicilar_vergi_bilgiler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kullanici_id` int(11) NOT NULL DEFAULT '-1',
  `adres_id` int(11) DEFAULT NULL,
  `tip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 kişisel, 1 kurumsal',
  `vergi_dairesi` varchar(255) DEFAULT NULL,
  `vergi_no` varchar(13) NOT NULL DEFAULT '',
  `tc_kimlik_no` varchar(11) NOT NULL,
  `tarih_ek` datetime DEFAULT NULL,
  `tarih_gun` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `tip` (`tip`),
  KEY `vergi_no` (`vergi_no`),
  KEY `tc_kimlik_no` (`tc_kimlik_no`),
  KEY `adres_id` (`adres_id`),
  KEY `kullanici_id` (`kullanici_id`) USING BTREE,
  CONSTRAINT `fk_kullanicilar_vergi_bilgiler_adres_id` FOREIGN KEY (`adres_id`) REFERENCES `tbl_kullanicilar_adresler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kullanicilar_vergi_bilgiler_kullanici_id` FOREIGN KEY (`kullanici_id`) REFERENCES `tbl_kullanicilar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kullanicilar_vergi_bilgiler`
--

/*!40000 ALTER TABLE `tbl_kullanicilar_vergi_bilgiler` DISABLE KEYS */;
INSERT INTO `tbl_kullanicilar_vergi_bilgiler` (`id`,`kullanici_id`,`adres_id`,`tip`,`vergi_dairesi`,`vergi_no`,`tc_kimlik_no`,`tarih_ek`,`tarih_gun`) VALUES 
 (1,1,2,1,'Kurumlar','925 014 6664','','2012-03-26 22:42:26','2012-06-27 13:15:53');
/*!40000 ALTER TABLE `tbl_kullanicilar_vergi_bilgiler` ENABLE KEYS */;


--
-- Definition of trigger `trg_kullanicilar_vergi_bilgiler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_kullanicilar_vergi_bilgiler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_kullanicilar_vergi_bilgiler_ek` BEFORE INSERT ON `tbl_kullanicilar_vergi_bilgiler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_kullanicilar_vergi_bilgiler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_kullanicilar_vergi_bilgiler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_kullanicilar_vergi_bilgiler_gun` BEFORE UPDATE ON `tbl_kullanicilar_vergi_bilgiler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_mailler`
--

DROP TABLE IF EXISTS `tbl_mailler`;
CREATE TABLE `tbl_mailler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baslik` varchar(255) NOT NULL DEFAULT '',
  `mail` longtext NOT NULL,
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_mailler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mailler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mailler`
--

/*!40000 ALTER TABLE `tbl_mailler` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_mailler` ENABLE KEYS */;


--
-- Definition of trigger `trg_mailler_tarih_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_mailler_tarih_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_mailler_tarih_ek` BEFORE INSERT ON `tbl_mailler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_mailler_tarih_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_mailler_tarih_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_mailler_tarih_gun` BEFORE UPDATE ON `tbl_mailler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_mailler_gonderilen`
--

DROP TABLE IF EXISTS `tbl_mailler_gonderilen`;
CREATE TABLE `tbl_mailler_gonderilen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maillist_id` int(1) NOT NULL DEFAULT '-1',
  `mail_id` int(11) NOT NULL DEFAULT '-1',
  `admin_id` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `maillist_id` (`maillist_id`),
  KEY `mail_id` (`mail_id`),
  KEY `admin_id` (`admin_id`),
  KEY `tarih` (`tarih`),
  CONSTRAINT `fk_mailler_gonderilen_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mailler_gonderilen_maillist_id` FOREIGN KEY (`maillist_id`) REFERENCES `tbl_maillist_mailler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mailler_gonderilen_mail_id` FOREIGN KEY (`mail_id`) REFERENCES `tbl_mailler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mailler_gonderilen`
--

/*!40000 ALTER TABLE `tbl_mailler_gonderilen` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_mailler_gonderilen` ENABLE KEYS */;


--
-- Definition of trigger `trg_mailler_gonderilen_tarih`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_mailler_gonderilen_tarih`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_mailler_gonderilen_tarih` BEFORE INSERT ON `tbl_mailler_gonderilen` FOR EACH ROW BEGIN
SET NEW.tarih = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_maillist_mailler`
--

DROP TABLE IF EXISTS `tbl_maillist_mailler`;
CREATE TABLE `tbl_maillist_mailler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_soyad` varchar(150) NOT NULL DEFAULT '',
  `mail` varchar(320) NOT NULL DEFAULT '',
  `durum` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise pasif, 1 ise aktif',
  `tip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 default, 1 ise iletisim kismindan gelmis',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `durum` (`durum`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `tip` (`tip`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_maillist_mailler`
--

/*!40000 ALTER TABLE `tbl_maillist_mailler` DISABLE KEYS */;
INSERT INTO `tbl_maillist_mailler` (`id`,`ad_soyad`,`mail`,`durum`,`tip`,`tarih_ek`,`tarih_gun`) VALUES 
 (1,'Hüseyin Yıldırım','dvlpr07@gmail.com',1,0,'2012-05-04 20:45:50',NULL),
 (2,'Hüseyin Yıldırım','huseyinyildirim@hotmail.com',1,0,'2012-05-04 20:46:36',NULL),
 (4,'huseyin@vegatours.net','huseyin@vegatours.net',1,0,'2012-05-04 21:04:24',NULL),
 (8,'Fatih ÜNAL','',1,0,'2012-05-04 22:28:03',NULL);
/*!40000 ALTER TABLE `tbl_maillist_mailler` ENABLE KEYS */;


--
-- Definition of trigger `trg_maillist_tarih_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_maillist_tarih_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_maillist_tarih_ek` BEFORE INSERT ON `tbl_maillist_mailler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_maillist_tarih_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_maillist_tarih_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_maillist_tarih_gun` BEFORE UPDATE ON `tbl_maillist_mailler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_markalar`
--

DROP TABLE IF EXISTS `tbl_markalar`;
CREATE TABLE `tbl_markalar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) NOT NULL DEFAULT '',
  `ikon` varchar(255) DEFAULT NULL,
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `onay` (`onay`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_markalar_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_markalar_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_markalar`
--

/*!40000 ALTER TABLE `tbl_markalar` DISABLE KEYS */;
INSERT INTO `tbl_markalar` (`id`,`ad`,`ikon`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,'Garmin','garmin.jpg',1,999,'2012-01-29 10:32:31',999,'2012-05-01 22:06:31'),
 (2,'Humminbird','humminbird.jpg',1,999,'2012-01-30 02:14:27',999,'2012-05-01 22:07:04'),
 (3,'Mariner','mariner.jpg',1,999,'2012-01-30 02:25:39',999,'2012-05-01 22:06:55'),
 (4,'Vetus','vetus.jpg',1,999,'2012-03-02 01:35:49',999,'2012-05-01 22:07:01'),
 (5,'Beko',NULL,1,999,'2012-05-03 12:06:35',NULL,'2012-05-03 12:06:45'),
 (6,'Vestel',NULL,1,999,'2012-05-03 12:06:38',NULL,'2012-05-03 12:06:44'),
 (7,'Arçelik',NULL,1,999,'2012-05-03 12:06:43',NULL,NULL);
/*!40000 ALTER TABLE `tbl_markalar` ENABLE KEYS */;


--
-- Definition of trigger `trg_markalar_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_markalar_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_markalar_ek` BEFORE INSERT ON `tbl_markalar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_markalar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_markalar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_markalar_gun` BEFORE UPDATE ON `tbl_markalar` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_menuler`
--

DROP TABLE IF EXISTS `tbl_menuler`;
CREATE TABLE `tbl_menuler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dil_id` int(11) NOT NULL DEFAULT '-1',
  `sira` int(11) NOT NULL DEFAULT '0',
  `ad` varchar(25) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `onay` (`onay`),
  KEY `dil_id` (`dil_id`),
  KEY `sira` (`sira`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_menuler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_menuler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_menuler_dil_id` FOREIGN KEY (`dil_id`) REFERENCES `tbl_diller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_menuler`
--

/*!40000 ALTER TABLE `tbl_menuler` DISABLE KEYS */;
INSERT INTO `tbl_menuler` (`id`,`dil_id`,`sira`,`ad`,`url`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,999,0,'Anasayfa','shop',1,999,'2011-12-17 02:59:01',999,'2012-05-06 20:31:36'),
 (2,999,1,'Ürünler','',1,999,'2011-12-17 02:59:01',999,'2012-04-25 16:53:21'),
 (3,999,2,'Hakkımızda','hakkimizda',1,999,'2011-12-17 02:59:01',999,'2012-05-06 20:31:42'),
 (4,999,3,'İletişim','iletisim',1,999,'2011-12-17 02:59:01',999,'2012-05-06 20:31:46'),
 (5,1,0,'Main','',1,999,'2011-12-17 02:59:01',999,'2012-04-25 16:53:19'),
 (6,1,1,'Products','',1,999,'2011-12-17 02:59:01',999,'2012-04-25 16:53:18'),
 (7,1,2,'About','',1,999,'2011-12-17 02:59:01',999,'2012-04-25 16:53:18'),
 (8,1,3,'Contact','',1,999,'2011-12-17 02:59:01',999,'2012-04-25 16:53:17'),
 (9,2,1,'Produkte','',1,999,'2011-12-17 02:59:01',999,'2012-04-25 16:53:10'),
 (10,2,0,'Hause','',1,999,'2011-12-17 02:59:37',999,'2012-04-25 16:53:09'),
 (11,2,3,'Kommunikation','',1,999,'2011-12-17 03:00:00',999,'2012-04-25 16:53:08'),
 (12,2,2,'Über','',1,999,'2011-12-17 03:01:15',999,'2012-04-25 16:53:08');
/*!40000 ALTER TABLE `tbl_menuler` ENABLE KEYS */;


--
-- Definition of trigger `trg_menu_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_menu_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_menu_ek` BEFORE INSERT ON `tbl_menuler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_menu_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_menu_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_menu_gun` BEFORE UPDATE ON `tbl_menuler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_odeme_bildirimler`
--

DROP TABLE IF EXISTS `tbl_odeme_bildirimler`;
CREATE TABLE `tbl_odeme_bildirimler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kullanici_id` int(11) NOT NULL DEFAULT '-1',
  `siparis_id` int(11) NOT NULL DEFAULT '-1',
  `odeme_bildirimler_hesap_nolar_id` int(11) NOT NULL DEFAULT '-1',
  `tip` int(1) NOT NULL DEFAULT '0' COMMENT '0 havale, 1 EFT, 2 diger',
  `islem_no` varchar(255) DEFAULT NULL COMMENT 'dekont no veya islem no',
  `odeme_tarih` date DEFAULT NULL,
  `tutar` double(11,5) DEFAULT NULL,
  `para_birimi_id` int(11) NOT NULL DEFAULT '-1',
  `tarih` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `tip` (`tip`),
  KEY `tutar` (`tutar`),
  KEY `odeme_tarih` (`odeme_tarih`),
  KEY `tarih` (`tarih`),
  KEY `kullanici_id` (`kullanici_id`),
  KEY `siparis_id` (`siparis_id`),
  KEY `para_birimi_id` (`para_birimi_id`),
  KEY `odeme_bildirimler_hesap_nolar_id` (`odeme_bildirimler_hesap_nolar_id`),
  CONSTRAINT `fk_odeme_bildirimler_kullanici_id` FOREIGN KEY (`kullanici_id`) REFERENCES `tbl_kullanicilar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_odeme_bildirimler_odeme_bildirimler_hesap_nolar_id` FOREIGN KEY (`odeme_bildirimler_hesap_nolar_id`) REFERENCES `tbl_cpy_odeme_bildirimler_hesap_nolar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_odeme_bildirimler_para_birimi_id` FOREIGN KEY (`para_birimi_id`) REFERENCES `tbl_sbt_para_birim` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_odeme_bildirimler_siparis_id` FOREIGN KEY (`siparis_id`) REFERENCES `tbl_siparisler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_odeme_bildirimler`
--

/*!40000 ALTER TABLE `tbl_odeme_bildirimler` DISABLE KEYS */;
INSERT INTO `tbl_odeme_bildirimler` (`id`,`kullanici_id`,`siparis_id`,`odeme_bildirimler_hesap_nolar_id`,`tip`,`islem_no`,`odeme_tarih`,`tutar`,`para_birimi_id`,`tarih`) VALUES 
 (9,1,14,14,0,NULL,NULL,6078.99000,1,'2012-04-29 03:57:48'),
 (10,1,15,15,0,NULL,NULL,533.83000,1,'2012-04-29 04:03:44'),
 (11,1,16,16,0,NULL,NULL,2723.43000,1,'2012-04-29 04:04:56'),
 (12,1,20,17,0,NULL,NULL,1751.71000,1,'2012-04-30 13:16:25'),
 (13,1,27,18,0,NULL,NULL,1749.73000,1,'2012-05-03 00:22:13'),
 (14,11,33,23,0,NULL,NULL,2010.57000,1,'2012-05-06 18:36:47'),
 (15,11,34,24,0,NULL,NULL,2010.57000,1,'2012-05-06 18:44:49'),
 (16,1,36,25,0,NULL,NULL,2010.57000,1,'2012-05-06 18:55:33'),
 (17,1,38,26,0,NULL,'2012-05-10',2010.57000,1,'2012-05-07 13:27:23'),
 (18,1,39,27,0,NULL,'2012-05-10',2018.86000,1,'2012-05-08 09:51:09'),
 (19,1,40,28,0,NULL,NULL,2084.89000,1,'2012-05-20 13:35:02'),
 (20,1,41,29,0,NULL,NULL,3513.64000,1,'2012-07-05 23:45:29'),
 (21,1,41,30,0,NULL,NULL,3300.29000,1,'2012-07-06 13:20:16'),
 (22,1,41,31,0,NULL,NULL,3300.29000,1,'2012-07-06 13:28:04'),
 (23,1,41,32,0,NULL,NULL,3300.29000,1,'2012-07-06 14:46:47');
/*!40000 ALTER TABLE `tbl_odeme_bildirimler` ENABLE KEYS */;


--
-- Definition of trigger `trg_odeme_bildirimler`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_odeme_bildirimler`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_odeme_bildirimler` BEFORE INSERT ON `tbl_odeme_bildirimler` FOR EACH ROW BEGIN

SET NEW.tarih = NOW();

END $$

DELIMITER ;

--
-- Definition of table `tbl_odeme_indirimler`
--

DROP TABLE IF EXISTS `tbl_odeme_indirimler`;
CREATE TABLE `tbl_odeme_indirimler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `odeme_sekli_id` int(11) NOT NULL DEFAULT '-1',
  `ad` varchar(255) DEFAULT NULL,
  `yuzde` float(11,3) DEFAULT NULL,
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `odeme_sekli_id` (`odeme_sekli_id`),
  KEY `yuzde` (`yuzde`),
  CONSTRAINT `fk_odeme_indirimler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_odeme_indirimler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_odeme_indirimler_odeme_sekli_id` FOREIGN KEY (`odeme_sekli_id`) REFERENCES `tbl_sbt_odeme_sekli` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_odeme_indirimler`
--

/*!40000 ALTER TABLE `tbl_odeme_indirimler` DISABLE KEYS */;
INSERT INTO `tbl_odeme_indirimler` (`id`,`odeme_sekli_id`,`ad`,`yuzde`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,1,'KDV BİZDEN %18',1.180,999,'2012-03-18 03:37:13',999,'2012-03-28 00:21:43'),
 (2,1,'BAHAR KAMPANYASI %10',1.100,999,'2012-03-18 03:37:13',999,'2012-03-28 00:21:48');
/*!40000 ALTER TABLE `tbl_odeme_indirimler` ENABLE KEYS */;


--
-- Definition of trigger `trg_odeme_indirimler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_odeme_indirimler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_odeme_indirimler_ek` BEFORE INSERT ON `tbl_odeme_indirimler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_odeme_indirimler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_odeme_indirimler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_odeme_indirimler_gun` BEFORE UPDATE ON `tbl_odeme_indirimler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_sanal_pos_bankalar`
--

DROP TABLE IF EXISTS `tbl_sanal_pos_bankalar`;
CREATE TABLE `tbl_sanal_pos_bankalar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sanal_pos_id` int(11) NOT NULL DEFAULT '-1',
  `banka_id` int(11) NOT NULL DEFAULT '-1',
  `bin_kontrol` tinyint(1) NOT NULL DEFAULT '0',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sanal_pos_id` (`sanal_pos_id`),
  KEY `banka_id` (`banka_id`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `bin_kontrol` (`bin_kontrol`),
  CONSTRAINT `fk_sanal_poslar_bankalar_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sanal_poslar_bankalar_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sanal_poslar_bankalar_banka_id` FOREIGN KEY (`banka_id`) REFERENCES `tbl_sbt_banka` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sanal_poslar_bankalar_sanal_pos_id` FOREIGN KEY (`sanal_pos_id`) REFERENCES `tbl_sbt_sanal_pos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sanal_pos_bankalar`
--

/*!40000 ALTER TABLE `tbl_sanal_pos_bankalar` DISABLE KEYS */;
INSERT INTO `tbl_sanal_pos_bankalar` (`id`,`sanal_pos_id`,`banka_id`,`bin_kontrol`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,1,27,1,999,'2012-07-03 17:59:38',999,'2012-07-04 23:50:29'),
 (2,1,4,1,999,'2012-07-03 18:00:15',999,'2012-07-04 23:50:30'),
 (3,1,22,1,999,'2012-07-03 18:00:31',999,'2012-07-04 23:50:30'),
 (4,1,21,1,999,'2012-07-03 18:00:53',999,'2012-07-04 23:50:31');
/*!40000 ALTER TABLE `tbl_sanal_pos_bankalar` ENABLE KEYS */;


--
-- Definition of trigger `trg_sanal_poslar_bankalar_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_sanal_poslar_bankalar_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_sanal_poslar_bankalar_ek` BEFORE INSERT ON `tbl_sanal_pos_bankalar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_sanal_poslar_bankalar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_sanal_poslar_bankalar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_sanal_poslar_bankalar_gun` BEFORE UPDATE ON `tbl_sanal_pos_bankalar` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_sanal_pos_binler`
--

DROP TABLE IF EXISTS `tbl_sanal_pos_binler`;
CREATE TABLE `tbl_sanal_pos_binler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banka_id` int(11) NOT NULL DEFAULT '-1',
  `kredi_karti_tip_id` int(11) NOT NULL DEFAULT '-1',
  `tip` int(1) NOT NULL DEFAULT '0' COMMENT '0 visa, 1 master, 2 amex, 3 diğer',
  `bin_kodu` varchar(6) DEFAULT NULL,
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `banka_id` (`banka_id`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `kredi_karti_tip_id` (`kredi_karti_tip_id`),
  KEY `tip` (`tip`),
  KEY `bin_kodu` (`bin_kodu`),
  CONSTRAINT `fk_sanal_pos_binler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sanal_pos_binler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sanal_pos_binler_banka_id` FOREIGN KEY (`banka_id`) REFERENCES `tbl_sbt_banka` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sanal_pos_binler_kredi_karti_tip_id` FOREIGN KEY (`kredi_karti_tip_id`) REFERENCES `tbl_sbt_kredi_karti_tip` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sanal_pos_binler`
--

/*!40000 ALTER TABLE `tbl_sanal_pos_binler` DISABLE KEYS */;
INSERT INTO `tbl_sanal_pos_binler` (`id`,`banka_id`,`kredi_karti_tip_id`,`tip`,`bin_kodu`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,4,1,3,'425846',999,'2012-07-04 23:39:17',NULL,NULL),
 (2,4,1,3,'425847',999,'2012-07-04 23:39:17',NULL,NULL),
 (3,4,1,3,'425848',999,'2012-07-04 23:39:17',NULL,NULL),
 (4,4,1,3,'425849',999,'2012-07-04 23:39:17',NULL,NULL),
 (5,4,1,3,'441341',999,'2012-07-04 23:39:17',NULL,NULL),
 (6,4,1,3,'522240',999,'2012-07-04 23:39:17',NULL,NULL),
 (7,4,1,3,'522241',999,'2012-07-04 23:39:17',NULL,NULL),
 (8,4,1,3,'554301',999,'2012-07-04 23:39:17',NULL,NULL),
 (9,4,1,3,'558593',999,'2012-07-04 23:39:17',NULL,NULL),
 (10,4,5,3,'676460',999,'2012-07-04 23:39:17',999,'2012-07-04 23:43:31'),
 (12,21,1,3,'402940',999,'2012-07-04 23:43:21',NULL,NULL),
 (13,21,1,3,'409084',999,'2012-07-04 23:43:21',NULL,NULL),
 (14,21,1,3,'411724',999,'2012-07-04 23:43:21',NULL,NULL),
 (15,21,1,3,'411942',999,'2012-07-04 23:43:21',NULL,NULL),
 (16,21,1,3,'411943',999,'2012-07-04 23:43:21',NULL,NULL),
 (17,21,1,3,'411944',999,'2012-07-04 23:43:21',NULL,NULL),
 (18,21,1,3,'411979',999,'2012-07-04 23:43:21',NULL,NULL),
 (19,21,1,3,'415792',999,'2012-07-04 23:43:21',NULL,NULL),
 (20,21,1,3,'416757',999,'2012-07-04 23:43:21',NULL,NULL),
 (21,21,1,3,'428945',999,'2012-07-04 23:43:21',NULL,NULL),
 (22,21,1,3,'442671',999,'2012-07-04 23:43:21',NULL,NULL),
 (23,21,5,3,'491005',999,'2012-07-04 23:43:21',NULL,NULL),
 (24,21,1,3,'493840',999,'2012-07-04 23:43:21',NULL,NULL),
 (25,21,1,3,'493841',999,'2012-07-04 23:43:21',NULL,NULL),
 (26,21,1,3,'493846',999,'2012-07-04 23:43:21',NULL,NULL),
 (27,21,1,3,'510162',999,'2012-07-04 23:43:21',NULL,NULL),
 (28,21,1,3,'510163',999,'2012-07-04 23:43:21',NULL,NULL),
 (29,21,1,3,'510238',999,'2012-07-04 23:43:21',NULL,NULL),
 (30,21,1,3,'520017',999,'2012-07-04 23:43:21',NULL,NULL),
 (31,21,1,3,'540045',999,'2012-07-04 23:43:21',NULL,NULL),
 (32,21,1,3,'540046',999,'2012-07-04 23:43:21',NULL,NULL),
 (33,21,1,3,'542119',999,'2012-07-04 23:43:21',NULL,NULL),
 (34,21,1,3,'542798',999,'2012-07-04 23:43:21',NULL,NULL),
 (35,21,1,3,'542804',999,'2012-07-04 23:43:21',NULL,NULL),
 (36,21,1,3,'547244',999,'2012-07-04 23:43:21',NULL,NULL),
 (37,21,1,3,'552101',999,'2012-07-04 23:43:21',NULL,NULL),
 (38,21,5,3,'589311',999,'2012-07-04 23:43:21',NULL,NULL),
 (39,21,5,3,'990015',999,'2012-07-04 23:43:21',NULL,NULL),
 (40,22,1,3,'402458',999,'2012-07-04 23:46:07',NULL,NULL),
 (41,22,1,3,'402459',999,'2012-07-04 23:46:07',NULL,NULL),
 (42,22,1,3,'406015',999,'2012-07-04 23:46:07',NULL,NULL),
 (43,22,1,3,'427707',999,'2012-07-04 23:46:07',NULL,NULL),
 (44,22,1,3,'440247',999,'2012-07-04 23:46:07',NULL,NULL),
 (45,22,1,3,'440273',999,'2012-07-04 23:46:07',NULL,NULL),
 (46,22,5,3,'440274',999,'2012-07-04 23:46:07',999,'2012-07-04 23:47:23'),
 (47,22,1,3,'440293',999,'2012-07-04 23:46:07',NULL,NULL),
 (48,22,1,3,'440294',999,'2012-07-04 23:46:07',NULL,NULL),
 (49,22,1,3,'440295',999,'2012-07-04 23:46:07',NULL,NULL),
 (50,22,1,3,'459026',999,'2012-07-04 23:46:07',NULL,NULL),
 (51,22,1,3,'479227',999,'2012-07-04 23:46:07',NULL,NULL),
 (52,22,1,3,'489494',999,'2012-07-04 23:46:07',NULL,NULL),
 (53,22,1,3,'489495',999,'2012-07-04 23:46:07',NULL,NULL),
 (54,22,1,3,'489496',999,'2012-07-04 23:46:07',NULL,NULL),
 (55,22,1,3,'510138',999,'2012-07-04 23:46:07',NULL,NULL),
 (56,22,1,3,'510139',999,'2012-07-04 23:46:07',NULL,NULL),
 (57,22,1,3,'510221',999,'2012-07-04 23:46:07',NULL,NULL),
 (58,22,1,3,'512753',999,'2012-07-04 23:46:07',NULL,NULL),
 (59,22,1,3,'512803',999,'2012-07-04 23:46:07',NULL,NULL),
 (60,22,5,3,'516742',999,'2012-07-04 23:46:07',999,'2012-07-04 23:47:20'),
 (61,22,1,3,'524346',999,'2012-07-04 23:46:07',NULL,NULL),
 (62,22,1,3,'524839',999,'2012-07-04 23:46:07',NULL,NULL),
 (63,22,1,3,'524840',999,'2012-07-04 23:46:07',NULL,NULL),
 (64,22,1,3,'528920',999,'2012-07-04 23:46:07',NULL,NULL),
 (65,22,1,3,'530853',999,'2012-07-04 23:46:07',NULL,NULL),
 (66,22,1,3,'545124',999,'2012-07-04 23:46:07',NULL,NULL),
 (67,22,1,3,'553090',999,'2012-07-04 23:46:07',NULL,NULL),
 (68,22,1,5,'676578',999,'2012-07-04 23:46:07',NULL,NULL),
 (69,27,5,3,'401622',999,'2012-07-04 23:50:04',NULL,NULL),
 (70,27,1,3,'404809',999,'2012-07-04 23:50:04',NULL,NULL),
 (71,27,5,3,'406281',999,'2012-07-04 23:50:04',NULL,NULL),
 (72,27,1,3,'408522',999,'2012-07-04 23:50:04',NULL,NULL),
 (73,27,5,3,'413382',999,'2012-07-04 23:50:04',NULL,NULL),
 (74,27,5,3,'414392',999,'2012-07-04 23:50:04',NULL,NULL),
 (75,27,5,3,'420343',999,'2012-07-04 23:50:04',NULL,NULL),
 (76,27,5,3,'442106',999,'2012-07-04 23:50:04',NULL,NULL),
 (77,27,1,3,'444444',999,'2012-07-04 23:50:04',NULL,NULL),
 (78,27,1,3,'446212',999,'2012-07-04 23:50:04',NULL,NULL),
 (79,27,1,3,'450634',999,'2012-07-04 23:50:04',NULL,NULL),
 (80,27,1,3,'455359',999,'2012-07-04 23:50:04',NULL,NULL),
 (81,27,1,3,'455360',999,'2012-07-04 23:50:04',NULL,NULL),
 (82,27,1,3,'479794',999,'2012-07-04 23:50:04',NULL,NULL),
 (83,27,1,3,'479795',999,'2012-07-04 23:50:04',NULL,NULL),
 (84,27,5,3,'490983',999,'2012-07-04 23:50:04',NULL,NULL),
 (85,27,1,3,'491205',999,'2012-07-04 23:50:04',NULL,NULL),
 (86,27,1,3,'492129',999,'2012-07-04 23:50:04',NULL,NULL),
 (87,27,1,3,'492130',999,'2012-07-04 23:50:04',NULL,NULL),
 (88,27,1,3,'492131',999,'2012-07-04 23:50:04',NULL,NULL),
 (89,27,5,3,'494314',999,'2012-07-04 23:50:04',NULL,NULL),
 (90,27,5,3,'501774',999,'2012-07-04 23:50:04',NULL,NULL),
 (91,27,1,3,'510054',999,'2012-07-04 23:50:04',NULL,NULL),
 (92,27,1,3,'540061',999,'2012-07-04 23:50:04',NULL,NULL),
 (93,27,1,3,'540062',999,'2012-07-04 23:50:04',NULL,NULL),
 (94,27,1,3,'540063',999,'2012-07-04 23:50:04',NULL,NULL),
 (95,27,1,3,'540122',999,'2012-07-04 23:50:04',NULL,NULL),
 (96,27,1,3,'540129',999,'2012-07-04 23:50:04',NULL,NULL),
 (97,27,1,3,'542117',999,'2012-07-04 23:50:04',NULL,NULL),
 (98,27,1,3,'545103',999,'2012-07-04 23:50:04',NULL,NULL),
 (99,27,1,3,'550054',999,'2012-07-04 23:50:04',NULL,NULL),
 (100,27,1,3,'552645',999,'2012-07-04 23:50:04',NULL,NULL),
 (101,27,1,3,'552659',999,'2012-07-04 23:50:04',NULL,NULL),
 (102,27,5,3,'560279',999,'2012-07-04 23:50:04',NULL,NULL),
 (103,27,5,3,'561056',999,'2012-07-04 23:50:04',NULL,NULL),
 (104,27,5,3,'588691',999,'2012-07-04 23:50:04',NULL,NULL),
 (105,27,5,3,'588992',999,'2012-07-04 23:50:04',NULL,NULL),
 (106,27,5,3,'589117',999,'2012-07-04 23:50:04',NULL,NULL),
 (107,27,1,3,'601881',999,'2012-07-04 23:50:04',NULL,NULL),
 (108,27,1,3,'602676',999,'2012-07-04 23:50:04',NULL,NULL),
 (109,27,1,3,'602678',999,'2012-07-04 23:50:04',NULL,NULL),
 (110,27,1,3,'602908',999,'2012-07-04 23:50:04',NULL,NULL),
 (111,27,1,3,'602981',999,'2012-07-04 23:50:04',NULL,NULL),
 (112,27,1,3,'603098',999,'2012-07-04 23:50:04',NULL,NULL),
 (113,27,5,3,'603649',999,'2012-07-04 23:50:04',NULL,NULL),
 (114,27,5,3,'603797',999,'2012-07-04 23:50:04',NULL,NULL),
 (115,27,5,3,'636689',999,'2012-07-04 23:50:04',NULL,NULL),
 (116,27,5,3,'639004',999,'2012-07-04 23:50:04',NULL,NULL),
 (117,27,5,3,'676166',999,'2012-07-04 23:50:04',NULL,NULL);
/*!40000 ALTER TABLE `tbl_sanal_pos_binler` ENABLE KEYS */;


--
-- Definition of trigger `trg_sanal_poslar_bin_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_sanal_poslar_bin_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_sanal_poslar_bin_ek` BEFORE INSERT ON `tbl_sanal_pos_binler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_sanal_poslar_bin_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_sanal_poslar_bin_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_sanal_poslar_bin_gun` BEFORE UPDATE ON `tbl_sanal_pos_binler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_sbt_banka`
--

DROP TABLE IF EXISTS `tbl_sbt_banka`;
CREATE TABLE `tbl_sbt_banka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) NOT NULL DEFAULT '',
  `marka` varchar(255) DEFAULT NULL,
  `ikon` varchar(255) DEFAULT NULL,
  `renk` varchar(6) DEFAULT NULL COMMENT 'fffff',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `renk` (`renk`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_banka`
--

/*!40000 ALTER TABLE `tbl_sbt_banka` DISABLE KEYS */;
INSERT INTO `tbl_sbt_banka` (`id`,`ad`,`marka`,`ikon`,`renk`) VALUES 
 (1,'AKBANK','AKBANK','akbank.jpg',NULL),
 (2,'ALBARAKA TÜRK KATILIM BANKASI','ALBARAKA',NULL,NULL),
 (3,'ALTERNATİFBANK','ALTERNATİFBANK',NULL,NULL),
 (4,'ANADOLUBANK','ANADOLUBANK',NULL,NULL),
 (5,'ARAP TÜRK BANKASI','ARAP TÜRK BANKASI',NULL,NULL),
 (6,'ASYA KATILIM BANKASI',NULL,NULL,NULL),
 (7,'CITIBANK','CITIBANK',NULL,NULL),
 (8,'DENİZBANK','DENİZBANK','denizbank.jpg',NULL),
 (9,'DEUTSCHE BANK','DEUTSCHE BANK',NULL,NULL),
 (10,'EUROBANK TEKFEN','EUROBANK',NULL,NULL),
 (11,'FİBABANKA','FİBA',NULL,NULL),
 (12,'FİNANSBANK','FİNANS','finansbank.jpg',NULL),
 (13,'HSBC BANK','HSBC',NULL,NULL),
 (14,'ING BANK','ING',NULL,NULL),
 (15,'KUVEYT TÜRK KATILIM BANKASI',NULL,NULL,NULL),
 (16,'ŞEKERBANK','ŞEKERBANK',NULL,NULL),
 (17,'TÜRKİYE İŞ BANKASI','İŞ BANKASI','isbank.jpg',NULL),
 (18,'TÜRKİYE FİNANS KATILIM BANKASI',NULL,'turkiyefinans.jpg',NULL),
 (19,'TÜRKİYE GARANTİ BANKASI','GARANTİ','garanti.jpg',NULL),
 (20,'TÜRKİYE HALK BANKASI','HALK BANKASI',NULL,NULL),
 (21,'TÜRKİYE VAKIFLAR BANKASI','VAKIF BANK','vakifbank.jpg',NULL),
 (22,'TÜRK EKONOMİ BANKASI',NULL,NULL,NULL),
 (23,'T.C. ZİRAAT BANKASI','ZİRAAT',NULL,NULL),
 (24,'TEKSTİL BANKASI','TEKSTİL BANK',NULL,NULL),
 (25,'TURKISH BANK','TURKISH',NULL,NULL),
 (26,'TURKLAND BANK','TURKLAND',NULL,NULL),
 (27,'YAPI VE KREDİ BANKASI','YAPI KREDİ','yapikredi.jpg',NULL);
/*!40000 ALTER TABLE `tbl_sbt_banka` ENABLE KEYS */;


--
-- Definition of table `tbl_sbt_firma`
--

DROP TABLE IF EXISTS `tbl_sbt_firma`;
CREATE TABLE `tbl_sbt_firma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firma` varchar(255) NOT NULL DEFAULT '',
  `unvan` longtext NOT NULL,
  `marka` varchar(255) NOT NULL DEFAULT '',
  `domain` varchar(255) NOT NULL DEFAULT '',
  `mail` varchar(320) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `title` longtext NOT NULL,
  `google_analytics` longtext,
  `google_dogrulama_kodu` longtext,
  `flickr` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `vimeo` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `google_plus` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `paypal` varchar(255) DEFAULT NULL,
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `firma` (`firma`),
  UNIQUE KEY `domain` (`domain`),
  UNIQUE KEY `marka` (`marka`),
  UNIQUE KEY `admin_id_gun` (`admin_id_gun`),
  UNIQUE KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_sbt_firma_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_firma`
--

/*!40000 ALTER TABLE `tbl_sbt_firma` DISABLE KEYS */;
INSERT INTO `tbl_sbt_firma` (`id`,`firma`,`unvan`,`marka`,`domain`,`mail`,`description`,`title`,`google_analytics`,`google_dogrulama_kodu`,`flickr`,`youtube`,`vimeo`,`facebook`,`google_plus`,`twitter`,`paypal`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,'Marin Boat','Marin Boat','Marin Boat','shop.zirvedns.com','info@zirvedns.com','SERASMAC, SERAS MAC, SERAS MACHINES Co. Ltd., SERASMAK, SERAS, SERAS MAKINE, SERAS MAKINA, SERASMAK, SERAS MAK, SERAS MAKINA, SERAS MAKINE','Marin Boat','<script type=\"text/javascript\">\n\n  var _gaq = _gaq || [];\n  _gaq.push([\'_setAccount\', \'UA-30102156-1\']);\n  _gaq.push([\'_trackPageview\']);\n\n  (function() {\n    var ga = document.createElement(\'script\'); ga.type = \'text/javascript\'; ga.async = true;\n    ga.src = (\'https:\' == document.location.protocol ? \'https://ssl\' : \'http://www\') + \'.google-analytics.com/ga.js\';\n    var s = document.getElementsByTagName(\'script\')[0]; s.parentNode.insertBefore(ga, s);\n  })();\n\n</script>',NULL,'marinboat','marinboat','marinboat','marinboat','marinboat','turkcell',NULL,999,'2012-05-04 00:06:14');
/*!40000 ALTER TABLE `tbl_sbt_firma` ENABLE KEYS */;


--
-- Definition of trigger `tbl_sbt_firma_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `tbl_sbt_firma_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `tbl_sbt_firma_gun` BEFORE UPDATE ON `tbl_sbt_firma` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_sbt_kargo`
--

DROP TABLE IF EXISTS `tbl_sbt_kargo`;
CREATE TABLE `tbl_sbt_kargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 yerel, 1 global',
  `ad` varchar(255) NOT NULL DEFAULT '',
  `ikon` varchar(255) DEFAULT NULL,
  `url` varchar(600) DEFAULT NULL,
  `km_birim_fiyat` double(11,5) DEFAULT NULL,
  `desi_birim_fiyat` double(11,5) DEFAULT NULL,
  `sabit_fiyat` double(11,5) DEFAULT NULL,
  `ucretsiz_fiyat` double(11,5) DEFAULT NULL,
  `ucretsiz_desi` float(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `km_birim_fiyat` (`km_birim_fiyat`),
  KEY `tip` (`tip`),
  KEY `desi_birim_fiyat` (`desi_birim_fiyat`),
  KEY `ucretsiz_fiyat` (`ucretsiz_fiyat`),
  KEY `sabit_fiyat` (`sabit_fiyat`),
  KEY `ucretsiz_desi` (`ucretsiz_desi`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_kargo`
--

/*!40000 ALTER TABLE `tbl_sbt_kargo` DISABLE KEYS */;
INSERT INTO `tbl_sbt_kargo` (`id`,`tip`,`ad`,`ikon`,`url`,`km_birim_fiyat`,`desi_birim_fiyat`,`sabit_fiyat`,`ucretsiz_fiyat`,`ucretsiz_desi`) VALUES 
 (1,0,'Yurtiçi Kargo','yurtici.jpg',NULL,1.00000,0.10000,7.00000,100.00000,999.00),
 (2,0,'Mng Kargo','mng.jpg',NULL,1.10000,0.20000,7.20000,100.00000,999.00),
 (3,0,'Fillo Kargo','fillo.jpg',NULL,NULL,0.30000,5.00000,NULL,NULL),
 (4,0,'Horoz Kargo','horoz.jpg',NULL,NULL,0.40000,5.00000,NULL,NULL),
 (5,0,'Ptt Kargo','ptt.jpg',NULL,NULL,0.50000,5.00000,NULL,NULL),
 (6,0,'Aras Kargo','aras.jpg',NULL,NULL,0.60000,5.00000,NULL,NULL);
/*!40000 ALTER TABLE `tbl_sbt_kargo` ENABLE KEYS */;


--
-- Definition of table `tbl_sbt_kargo_hesaplama_tip`
--

DROP TABLE IF EXISTS `tbl_sbt_kargo_hesaplama_tip`;
CREATE TABLE `tbl_sbt_kargo_hesaplama_tip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 yerel, 1 global',
  `ad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `tip` (`tip`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_kargo_hesaplama_tip`
--

/*!40000 ALTER TABLE `tbl_sbt_kargo_hesaplama_tip` DISABLE KEYS */;
INSERT INTO `tbl_sbt_kargo_hesaplama_tip` (`id`,`tip`,`ad`) VALUES 
 (1,1,'YOK'),
 (2,1,'PAKET'),
 (3,1,'KİLO'),
 (4,0,'BOYUT'),
 (5,0,'DESI'),
 (6,1,'DIGER');
/*!40000 ALTER TABLE `tbl_sbt_kargo_hesaplama_tip` ENABLE KEYS */;


--
-- Definition of table `tbl_sbt_kdv`
--

DROP TABLE IF EXISTS `tbl_sbt_kdv`;
CREATE TABLE `tbl_sbt_kdv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) DEFAULT NULL,
  `yuzde` float(11,3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `yuzde` (`yuzde`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_kdv`
--

/*!40000 ALTER TABLE `tbl_sbt_kdv` DISABLE KEYS */;
INSERT INTO `tbl_sbt_kdv` (`id`,`ad`,`yuzde`) VALUES 
 (1,'KDV %18',1.180),
 (2,'KDV %8',1.080),
 (3,'KDV %1',1.010),
 (4,'VAT %20',1.200);
/*!40000 ALTER TABLE `tbl_sbt_kdv` ENABLE KEYS */;


--
-- Definition of table `tbl_sbt_kredi_karti_tip`
--

DROP TABLE IF EXISTS `tbl_sbt_kredi_karti_tip`;
CREATE TABLE `tbl_sbt_kredi_karti_tip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_kredi_karti_tip`
--

/*!40000 ALTER TABLE `tbl_sbt_kredi_karti_tip` DISABLE KEYS */;
INSERT INTO `tbl_sbt_kredi_karti_tip` (`id`,`ad`) VALUES 
 (1,'Classic'),
 (2,'Gold'),
 (3,'Business'),
 (4,'Platinum'),
 (5,'Diğer');
/*!40000 ALTER TABLE `tbl_sbt_kredi_karti_tip` ENABLE KEYS */;


--
-- Definition of table `tbl_sbt_mail`
--

DROP TABLE IF EXISTS `tbl_sbt_mail`;
CREATE TABLE `tbl_sbt_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kullanici_adi` varchar(320) NOT NULL DEFAULT '',
  `sifre` varchar(255) NOT NULL DEFAULT '',
  `host` varchar(255) NOT NULL DEFAULT '',
  `port` varchar(6) DEFAULT '587',
  `admin_id_gun` int(11) DEFAULT '-1' COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `port` (`port`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_mail_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_mail`
--

/*!40000 ALTER TABLE `tbl_sbt_mail` DISABLE KEYS */;
INSERT INTO `tbl_sbt_mail` (`id`,`kullanici_adi`,`sifre`,`host`,`port`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,'info@zirvedns.com','45074835','mail.zirvedns.com','587',999,'2012-05-03 20:19:12');
/*!40000 ALTER TABLE `tbl_sbt_mail` ENABLE KEYS */;


--
-- Definition of trigger `trg_mail_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_mail_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_mail_gun` BEFORE UPDATE ON `tbl_sbt_mail` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_sbt_odeme_sekli`
--

DROP TABLE IF EXISTS `tbl_sbt_odeme_sekli`;
CREATE TABLE `tbl_sbt_odeme_sekli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_odeme_sekli`
--

/*!40000 ALTER TABLE `tbl_sbt_odeme_sekli` DISABLE KEYS */;
INSERT INTO `tbl_sbt_odeme_sekli` (`id`,`ad`) VALUES 
 (1,'BANKA HAVALESİ'),
 (2,'KREDİ KARTI'),
 (4,'KAPIDA ÖDEME'),
 (5,'PAYPAL'),
 (6,'PTT');
/*!40000 ALTER TABLE `tbl_sbt_odeme_sekli` ENABLE KEYS */;


--
-- Definition of table `tbl_sbt_para_birim`
--

DROP TABLE IF EXISTS `tbl_sbt_para_birim`;
CREATE TABLE `tbl_sbt_para_birim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) NOT NULL DEFAULT '',
  `kisaltma` varchar(3) DEFAULT NULL,
  `simge` varchar(3) DEFAULT NULL,
  `uzunluk` int(1) NOT NULL DEFAULT '2' COMMENT 'virgülden sonraki uzunluk ve mantık olarak maksimum 5 olabilir',
  `sabit_kur` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 ise sabit kur geçerli',
  `hesaplama_tip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 normal kur, 1 efektif kur',
  `hesaplama_birim` int(3) NOT NULL DEFAULT '1',
  `kur` double(11,5) DEFAULT NULL COMMENT 'Sabit kur geçerliyse işe yarıyor',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `kisaltma` (`kisaltma`),
  KEY `simge` (`simge`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `hesaplama_tip` (`hesaplama_tip`),
  KEY `sabit_kur` (`sabit_kur`),
  KEY `kur` (`kur`),
  KEY `uzunluk` (`uzunluk`),
  CONSTRAINT `fk_para_birimleri_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_para_birim`
--

/*!40000 ALTER TABLE `tbl_sbt_para_birim` DISABLE KEYS */;
INSERT INTO `tbl_sbt_para_birim` (`id`,`ad`,`kisaltma`,`simge`,`uzunluk`,`sabit_kur`,`hesaplama_tip`,`hesaplama_birim`,`kur`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,'TÜRK LİRASI','TRY','TL',2,1,1,1,NULL,999,'2012-03-26 23:37:19'),
 (2,'ABD DOLARI','USD','$',2,0,1,1,NULL,999,'2012-03-18 03:19:40'),
 (3,'AVUSTRALYA DOLARI','AUD','AUD',2,0,1,1,NULL,999,'2012-04-23 23:33:19'),
 (4,'DANİMARKA KRONU','DKK','DKK',2,0,1,1,NULL,999,'2012-04-23 23:33:19'),
 (5,'EURO','EUR','€',2,0,1,1,NULL,999,'2012-03-18 03:19:41'),
 (6,'İNGİLİZ STERLİNİ','GBP','£',2,0,1,1,NULL,999,'2012-03-18 03:19:41'),
 (7,'İSVİÇRE FRANGI','CHF','CHF',2,0,1,1,NULL,999,'2012-04-23 23:33:28'),
 (8,'İSVEÇ KRONU','SEK','SEK',2,0,1,1,NULL,999,'2012-04-23 23:33:28'),
 (9,'KANADA DOLARI','CAD','CAD',2,0,1,1,NULL,999,'2012-04-23 23:33:28'),
 (10,'KUVEYT DİNARI','KWD','KWD',2,0,1,1,NULL,999,'2012-04-23 23:33:28'),
 (11,'NORVEÇ KRONU','NOK','NOK',2,0,1,1,NULL,999,'2012-04-23 23:33:28'),
 (12,'SUUDİ ARABİSTAN RİYALİ','SAR','SAR',2,0,1,1,NULL,999,'2012-04-23 23:33:28'),
 (13,'JAPON YENİ','JPY','JPY',5,0,1,100,NULL,999,'2012-04-23 23:33:28'),
 (14,'BULGAR LEVASI','BGN','BGN',2,0,0,1,NULL,999,'2012-04-23 23:33:28'),
 (15,'RUMEN LEYİ','RON','RON',2,0,0,1,NULL,999,'2012-04-23 23:33:28'),
 (16,'RUS RUBLESİ','RUB','RUB',2,0,0,1,NULL,999,'2012-04-23 23:33:28'),
 (17,'İRAN RİYALİ','IRR','IRR',5,0,0,100,NULL,999,'2012-04-23 23:33:28'),
 (999,'BOŞ PARA BİRİMİ',NULL,NULL,0,0,0,1,NULL,999,'2012-04-16 01:03:40');
/*!40000 ALTER TABLE `tbl_sbt_para_birim` ENABLE KEYS */;


--
-- Definition of trigger `trg_para_birimleri_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_para_birimleri_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_para_birimleri_gun` BEFORE UPDATE ON `tbl_sbt_para_birim` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_sbt_sabit`
--

DROP TABLE IF EXISTS `tbl_sbt_sabit`;
CREATE TABLE `tbl_sbt_sabit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aciklama` varchar(500) NOT NULL DEFAULT '',
  `sayfa` varchar(255) DEFAULT NULL,
  `shop` tinyint(1) NOT NULL DEFAULT '0',
  `xml` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `xml` (`xml`),
  KEY `shop` (`shop`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_sabit`
--

/*!40000 ALTER TABLE `tbl_sbt_sabit` DISABLE KEYS */;
INSERT INTO `tbl_sbt_sabit` (`id`,`aciklama`,`sayfa`,`shop`,`xml`) VALUES 
 (1,'Ürünler kısmı sorting için - Ürün Adı',NULL,0,0),
 (2,'Ürünler kısmı sorting için - Ürün Kodu',NULL,0,0),
 (3,'Ürün detayı için - Detaylar',NULL,0,0),
 (4,'Anasayfa sağ başlık - Kategoriler',NULL,0,0),
 (5,'Anasayfa sağ başlık - Uygulama Resimleri',NULL,0,0),
 (6,'Anasayfa sağ başlık - Uygulama Videoları',NULL,0,0),
 (7,'Anasayfa sağ başlık - Etiketler',NULL,0,0),
 (8,'Anasayfa sağ başlık - Mail Listesi',NULL,0,0),
 (9,'Sayfa başlığı - İletişim',NULL,0,0),
 (10,'İletişim üstü başlık\n',NULL,0,0),
 (11,'İletişim input - Ad Soyad',NULL,0,0),
 (12,'İletişim input - Mail',NULL,0,0),
 (13,'İletişim input - Telefon',NULL,0,0),
 (14,'İletişim input - Görüşler',NULL,0,0),
 (15,'İletişim de ki edebiyat bölümü',NULL,0,0),
 (16,'Logo altında ki slogan - makine sağlayıcınız',NULL,0,0),
 (17,'Sayfa başlığı - Ürünler',NULL,0,0),
 (18,'İletişim input - Gönder',NULL,0,0),
 (19,'İletişim Sağ - Adres ve Mail Bilgileri',NULL,0,0),
 (20,'İletişim - Başlık (iletişim formu)',NULL,0,0),
 (21,'Ürün sayfası - Açıklama',NULL,0,0),
 (22,'Ürün sayfası - Resimler',NULL,0,0),
 (23,'Ürün sayfası - Videolar',NULL,0,0),
 (24,'Sayfa başlığı - Hakkımızda',NULL,0,0),
 (25,'Hakkımızda - Başlık (SERASMAC Hakkında)',NULL,0,0),
 (26,'Hakkımızda Sayfası - İçerik',NULL,0,0),
 (27,'Hakkımızda Sayfası - Başlık',NULL,0,0),
 (28,'Sayfa başlığı - Belgeler',NULL,0,0),
 (29,'İletişim - Form Kontrol 1','contact',0,1),
 (30,'İletişim - Form Kontrol 2','contact',0,1),
 (31,'Iletisim - Form Kontrol 3','contact',0,1),
 (32,'Iletisim - Form Kontrol 4','contact',0,1),
 (33,'Iletisim - Form Kontrol 5','contact',0,1),
 (34,'Iletisim - Form Kontrol 6','contact',0,1),
 (35,'Iletisim - Form Kontrol 7','contact',0,1),
 (36,'Güvenlik kodu yanlış',NULL,0,0),
 (37,'Bilgileriniz başarıyla gönderilmiştir.',NULL,0,0),
 (38,'Anasayfa sağ başlık - Markalar',NULL,0,0),
 (39,'TÜM KATEGORİLER',NULL,0,0),
 (40,'TÜM MARKALAR',NULL,0,0),
 (41,'Sayfa başlığı - Etiket',NULL,0,0),
 (42,'Sayfa başlığı - Kategori',NULL,0,0),
 (43,'Sayfa başlığı - Marka',NULL,0,0),
 (44,'Sayfa başlığı - Tüm Ürünler',NULL,0,0),
 (45,'Arama Butonu',NULL,0,0),
 (46,'Arama Text (Ürünlerde Ara)',NULL,0,0),
 (47,'Arama - Sonuç bulamazsa',NULL,0,0),
 (48,'Arama - Kelime giriniz','search',0,1),
 (49,'Arama - Kelime 3 karakterden küçük olmasın','search',0,1),
 (60,'Üye Kayit Formu',NULL,1,0),
 (61,'Nerdesin:',NULL,1,0),
 (62,'Ana Sayfa',NULL,1,0),
 (63,'Sizin Için Seçtiklerimiz',NULL,1,0),
 (64,'Türkiye\'nin en büyük tekne magazasina hosgeldiniz.',NULL,1,0),
 (65,'E-Posta Adresiniz',NULL,1,0),
 (66,'Sifre',NULL,1,0),
 (67,'Beni hatirla',NULL,1,0),
 (68,'Sifremi unuttum?',NULL,1,0),
 (69,'Yeni üye ol',NULL,1,0),
 (70,'Adiniz Soyadiniz',NULL,1,0),
 (71,'Sifre',NULL,1,0),
 (72,'Sifre Tekrar',NULL,1,0),
 (73,'Telefon',NULL,1,0),
 (74,'Kayit Ol',NULL,1,0),
 (75,'KATEGORILER',NULL,1,0),
 (76,'MARKALAR',NULL,1,0),
 (77,'EN ÇOK SATILANLAR',NULL,1,0),
 (78,'INDIRIMLI ÜRÜNLER',NULL,1,0),
 (79,'SEPETIM',NULL,1,0),
 (80,'YENI ÜRÜNLER',NULL,1,0),
 (81,'KARGO',NULL,1,0),
 (82,'HABER SERVISI',NULL,1,0),
 (83,'Marin Boat ile ilgili güncel gelismelerden ilk siz haberdar olmak için:',NULL,1,0),
 (84,'Lütfen adinizi giriniz.',NULL,1,0),
 (85,'Lütfen e-posta adresinizi giriniz.',NULL,1,0),
 (86,'Lütfen e-posta adresinizi kontrol ediniz.',NULL,1,0),
 (87,'Lütfen sifrenizi giriniz.',NULL,1,0),
 (88,'Lütfen sifresinizi tekrar giriniz.',NULL,1,0),
 (89,'Lütfen sifrelerinizi kontrol ediniz.',NULL,1,0),
 (90,'Lütfen telefon numaranizi giriniz.',NULL,1,0),
 (91,'Üye kayit isleminiz basariyla gerçeklesmistir. Lütfen belirttiginiz e-posta adresine gönderilen onaylama linkine tiklayiniz.',NULL,1,0),
 (92,'Girdiginiz e-posta adresi zaten kayitlidir.',NULL,1,0),
 (93,'Giris Yap',NULL,1,0),
 (94,'Kullanici adi bulunamadi. Lütfen kullanici adinizi kontrol ederek yeniden yaziniz.',NULL,1,0),
 (95,'Hesabiniz aktif olmadigi için üye girisi yapamazsiniz!',NULL,1,0),
 (96,'Eksik veya yanlis sifre girdiniz. Lütfen sifrenizi kontrol ederek yeniden deneyiniz.',NULL,1,0),
 (97,'Alisveris Sepetim',NULL,1,0),
 (98,'Üye Girisi',NULL,1,0),
 (99,'Çikis Yap',NULL,1,0),
 (100,'Müsteri Hizmetleri',NULL,1,0),
 (101,'Siparis Takibi',NULL,1,0),
 (102,'Üyelik Bilgilerim',NULL,1,0),
 (103,'Sepete Ekle',NULL,1,0),
 (104,'Ürünü Incele',NULL,1,0),
 (105,'Yazdir',NULL,1,0),
 (106,'Favorilere Ekle',NULL,1,0),
 (107,'Stokta Yok',NULL,1,0),
 (108,'Yorum Yaz',NULL,1,0),
 (109,'Hemen Al',NULL,1,0),
 (110,'Sepeti Güncelle',NULL,1,0),
 (111,'Seçilenleri Sil',NULL,1,0),
 (112,'Alisverisi Tamamla',NULL,1,0),
 (113,'Ürün Adi',NULL,1,0),
 (114,'Birim Fiyat',NULL,1,0),
 (115,'Adet',NULL,1,0),
 (116,'Toplam Fiyat',NULL,1,0),
 (117,'Sepetim',NULL,1,0),
 (118,'Adres Bilgileri',NULL,1,0),
 (119,'Ödeme Bilgileri',NULL,1,0),
 (120,'Siparis Onayi',NULL,1,0),
 (121,'Ürün Bilgisi',NULL,1,0),
 (122,'Ürün Yorumlari',NULL,1,0),
 (123,'Taksik Seçenekleri',NULL,1,0),
 (124,'Ürün Resimleri',NULL,1,0),
 (125,'Ürün Videolari',NULL,1,0),
 (126,'Önerileriniz',NULL,1,0),
 (127,'Sepetinizde stogu bulunmayan ürünler sepetinizden silinmistir.',NULL,1,0),
 (128,'Taksitlendirme seçenegi bulunmuyor.',NULL,1,0),
 (129,'Taksit',NULL,1,0),
 (130,'Taksit Tutari',NULL,1,0),
 (131,'Toplam Tutar',NULL,1,0),
 (132,'Ürün için eklenmis resim bulunmuyor!',NULL,1,0),
 (133,'Ürün için eklenmis video bulunmuyor!',NULL,1,0),
 (134,'Toplam',NULL,1,0),
 (135,'KDV',NULL,1,0),
 (136,'Genel Toplam',NULL,1,0),
 (137,'Alisveris sepetinizde ürün bulunmuyor!',NULL,1,0),
 (138,'Fatura Bilgileri',NULL,1,0),
 (139,'Teslimat Bilgileri',NULL,1,0),
 (140,'Lütfen Seçiniz:',NULL,1,0),
 (141,'Yeni Adres Ekle',NULL,1,0),
 (142,'Kaydet',NULL,1,0),
 (143,'Bireysel',NULL,1,0),
 (144,'Kurumsal',NULL,1,0),
 (145,'Fatura Tipi',NULL,1,0),
 (146,'Firma Adi',NULL,1,0),
 (147,'Isim Soyisim',NULL,1,0),
 (148,'Adres',NULL,1,0),
 (149,'Posta Kodu',NULL,1,0),
 (150,'Ülke',NULL,1,0),
 (151,'Il',NULL,1,0),
 (152,'Ilçe',NULL,1,0),
 (153,'Açik Adres',NULL,1,0),
 (154,'Vergi Dairesi',NULL,1,0),
 (155,'Vergi No',NULL,1,0),
 (156,'TC Kimlik No',NULL,1,0),
 (157,'Devam Et',NULL,1,0),
 (158,'Banka Havalesi',NULL,1,0),
 (159,'Kredi Karti',NULL,1,0),
 (160,'Kapida Ödeme',NULL,1,0),
 (161,'Paypal',NULL,1,0),
 (162,'PTT',NULL,1,0),
 (163,'Banka:',NULL,1,0),
 (164,'Hesap Sahibi:',NULL,1,0),
 (165,'Sube:',NULL,1,0),
 (166,'Hesap No:',NULL,1,0),
 (167,'IBAN No:',NULL,1,0),
 (168,'Ödeme Yap',NULL,1,0),
 (169,'Kart Üzerindeki Isim',NULL,1,0),
 (170,'Kart Tipi',NULL,1,0),
 (171,'Son Kullanma Tarihi',NULL,1,0),
 (172,'Kart Numarasi',NULL,1,0),
 (173,'Güvenlik Kodu',NULL,1,0),
 (174,'Banka Adi',NULL,1,0),
 (175,'Bankanizi Seçiniz',NULL,1,0),
 (176,'Listede Yok',NULL,1,0),
 (177,'Ay',NULL,1,0),
 (178,'Yil',NULL,1,0),
 (179,'Detayli bilgi',NULL,1,0),
 (180,'Güncelle',NULL,1,0),
 (181,'Sifremi degistirmek istiyorum',NULL,1,0),
 (182,'Yeni Sifreniz',NULL,1,0),
 (183,'Yeni Sifreniz Tekrar',NULL,1,0),
 (184,'Üyelik bilgileriniz basariyla güncellenmistir.',NULL,1,0),
 (185,'Lütfen suan ki sifrenizi kontrol ediniz.',NULL,1,0),
 (186,'Beklenmedik bir hata oluştu.',NULL,1,0),
 (187,'Siparişiniz bulunmuyor.',NULL,1,0),
 (188,'Sipariş No',NULL,1,0),
 (189,'Toplam Tutar',NULL,1,0),
 (190,'Durumu',NULL,1,0),
 (191,'Sipariş Detayı',NULL,1,0),
 (192,'Sipariş Tarihi',NULL,1,0),
 (193,'Ödeme Şekli',NULL,1,0),
 (194,'KDV Dahil Fiyatı',NULL,1,0),
 (195,'İndirimli Fiyatı',NULL,1,0),
 (196,'Fiyatı',NULL,1,0),
 (197,'Markalar',NULL,1,0),
 (198,'Ödeme Bildirimi Yap',NULL,1,0),
 (199,'Ödeme Bildirimi',NULL,1,0),
 (200,'EFT/Havale Yapılacak Banka',NULL,1,0),
 (201,'Ödeme Tipi',NULL,1,0),
 (202,'İşlem No',NULL,1,0),
 (203,'Ödeme Tarihi',NULL,1,0),
 (204,'EFT',NULL,1,0),
 (205,'Havale',NULL,1,0),
 (206,'Diğer Ödeme Tipi',NULL,1,0),
 (207,'Lütfen marka seçiniz',NULL,1,0),
 (208,'Ürün Kodu',NULL,1,0),
 (209,'Ödeme bildiriniz başarıyla kayıt edilmiştir.',NULL,1,0),
 (210,'Kargo Bilgileri',NULL,1,0),
 (211,'Seç',NULL,1,0),
 (212,'Kargo Firması',NULL,1,0),
 (213,'Not',NULL,1,0),
 (214,'Size Özel Fiyatı',NULL,1,0),
 (215,'Geri',NULL,1,0),
 (216,'Ücretsiz Kargo',NULL,1,0),
 (217,'Kargo Payı',NULL,1,0),
 (218,'Lütfen şifre giriniz.','default',1,1),
 (219,'Lütfen şifrenizi tekrar giriniz.','default',1,1),
 (220,'Şifrelerinizi kontrol ediniz.','default',1,1),
 (221,'Ekle',NULL,1,0),
 (222,'Fatura adresini seçiniz.','basketadres',1,1),
 (223,'Teslimat adresini seçiniz.','basketadres',1,1),
 (224,'Lütfen eft/havale yapmak istediğiniz bankayı seçiniz.','basketadres',1,1),
 (225,'Etiketler',NULL,1,0),
 (226,'Şifremi unuttum?',NULL,1,0),
 (227,'Şifremi Gönder',NULL,1,0),
 (228,'Sepete Git',NULL,1,0),
 (229,'Üye Girişi',NULL,1,0),
 (230,'Üye İşlemleri',NULL,1,0),
 (231,'Kasaya Git',NULL,1,0),
 (232,'Bu kategoriye ait eklenmiş ürün bulunmuyor.',NULL,1,0),
 (233,'Üyelik Sözleşmesi Metinleri',NULL,1,0),
 (234,'Üyelik sözleşmesini okudum, anladım ve onaylıyorum.',NULL,1,0),
 (235,'Kayıt olmak için lütfen, üyelik sözleşmesini okuyup onaylayınız.','register',1,1),
 (236,'Satış Sözleşmesi Metinleri',NULL,1,0),
 (237,'Garanti ve İade Şartları',NULL,1,0),
 (238,'Gizlilik Politikası',NULL,1,0),
 (239,'Satış Sözleşmesi',NULL,1,0),
 (240,'Gizlilik Politikası Metinleri',NULL,1,0),
 (241,'Hesap Numaralarımız',NULL,1,0),
 (242,'Eklenmiş banka hesap numaramız bulunmamaktadır.',NULL,1,0),
 (243,'Bu markaya ait eklenmiş ürün bulunmuyor.',NULL,1,0),
 (244,'Arama sonuçları',NULL,1,0),
 (245,'Üye Kayıt Aktivasyon Metinleri',NULL,1,0),
 (246,'Üyelik Aktivasyon',NULL,1,0),
 (247,'Şifremi Unuttum Metinleri',NULL,1,0),
 (248,'Yeni Şifre Talebi',NULL,1,0),
 (249,'Sistemde kayıtlı olan e-posta adresinize şifrenizi yenilemek için link gönderdik. Lütfen e-posta adresinizi kontrol ediniz.',NULL,1,0),
 (250,'Sistemde kayıtlı değilsiniz.',NULL,1,0),
 (251,'Şifre yenileme kodunuz hatalıdır. Lütfen tekrar yeni şifre talebinde bulununuz.',NULL,1,0),
 (252,'Yeni şifreniz başarıyla oluşturulmuştur. Hesabınıza yeni şifrenizle giriş yapabilirsiniz.',NULL,1,0),
 (253,'Hesabınız aktif edilmiştir. Üye giriş paneline yönlendiriliyorsunuz.',NULL,1,0),
 (254,'Onay kodunuz hatalıdır. Lütfen bizimle irtibat kurunuz.',NULL,1,0),
 (255,'Hesabınız zaten aktif durumdadır.',NULL,1,0),
 (256,'Yeniliklerden haberdar olmak istiyorum.',NULL,1,0),
 (257,'Haber listemize kayıdınız başarıyla yapılmıştır.',NULL,1,0),
 (258,'E-posta adresiniz haber listemizde zaten mevcuttur.',NULL,1,0),
 (259,'Şipariş Onay Metinleri',NULL,1,0),
 (260,'Şipariş Onay Metinleri (E-posta)',NULL,1,0),
 (261,'{{SiparisNo}} nolu şipariş detayları',NULL,1,0),
 (262,'İptal',NULL,1,0),
 (263,'Vade Farkı',NULL,1,0),
 (264,'Ödemenizin daha hızlı kontrol edilmesi için lütfen havale/eft açıklamasına sipariş numarasını yazınız.',NULL,1,0),
 (265,'Müşteri hizmetleri sipariş takibi açıklaması',NULL,1,0),
 (266,'Müşteri hizmetleri üyelik bilgileri açıklaması',NULL,1,0),
 (267,'Müşteri hizmetleri hesap numaralarımız açıklaması',NULL,1,0),
 (268,'Müşteri hizmetleri ödeme bildirim açıklaması',NULL,1,0),
 (269,'Bize Sorun',NULL,1,0),
 (270,'Müşteri hizmetleri bize sorun açıklaması',NULL,1,0),
 (271,'Ürünler',NULL,1,0),
 (272,'Çok Satılanlara Göre',NULL,1,0),
 (273,'Puanına Göre',NULL,1,0),
 (274,'Fiyata Göre (Artan)',NULL,1,0),
 (275,'Eklenme Tarihine Göre',NULL,1,0),
 (276,'Ürün İsmine Göre',NULL,1,0),
 (277,'Sepet açıklamaları',NULL,1,0),
 (278,'Önemli Bilgiler',NULL,1,0),
 (279,'Havale açıklamaları',NULL,1,0),
 (280,'Merhaba',NULL,1,0),
 (281,'Fatura adres bilgisi düzenlenmiştir.',NULL,1,0),
 (282,'Sil',NULL,1,0),
 (283,'Seçtiğiniz fatura adresi silinmiştir.',NULL,1,0),
 (284,'Seçtiğiniz teslimat adresi silinmiştir.',NULL,1,0),
 (285,'Teslimat adres bilgisi düzenlenmiştir.',NULL,1,0),
 (286,'Yeni fatura adres bilgisi eklenmiştir.',NULL,1,0),
 (287,'Yeni teslimat adres bilgisi eklenmiştir.',NULL,1,0),
 (288,'Kredi kart kontrol bildirimi',NULL,1,0);
/*!40000 ALTER TABLE `tbl_sbt_sabit` ENABLE KEYS */;


--
-- Definition of table `tbl_sbt_sanal_pos`
--

DROP TABLE IF EXISTS `tbl_sbt_sanal_pos`;
CREATE TABLE `tbl_sbt_sanal_pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `magaza_no` varchar(255) NOT NULL DEFAULT '',
  `api_kullanicisi` varchar(255) NOT NULL,
  `sifre` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(600) NOT NULL DEFAULT '',
  `test_url` varchar(600) DEFAULT NULL,
  `3d_secure` tinyint(1) NOT NULL DEFAULT '0',
  `on_otorizasyon` tinyint(1) NOT NULL DEFAULT '0',
  `test` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'test ise 1 değilse 0',
  `onay` tinyint(1) DEFAULT '1',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `onay` (`onay`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `on_otorizasyon` (`on_otorizasyon`),
  KEY `3d_secure` (`3d_secure`),
  CONSTRAINT `fk_sanal_poslar_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sanal_poslar_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_sanal_pos`
--

/*!40000 ALTER TABLE `tbl_sbt_sanal_pos` DISABLE KEYS */;
INSERT INTO `tbl_sbt_sanal_pos` (`id`,`magaza_no`,`api_kullanicisi`,`sifre`,`url`,`test_url`,`3d_secure`,`on_otorizasyon`,`test`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,'111111111','488','şireli şifre','',NULL,0,0,0,1,999,'2012-03-26 23:03:01',NULL,'2012-04-21 01:48:39');
/*!40000 ALTER TABLE `tbl_sbt_sanal_pos` ENABLE KEYS */;


--
-- Definition of trigger `trg_sanal_poslar_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_sanal_poslar_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_sanal_poslar_ek` BEFORE INSERT ON `tbl_sbt_sanal_pos` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_sanal_poslar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_sanal_poslar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_sanal_poslar_gun` BEFORE UPDATE ON `tbl_sbt_sanal_pos` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_sbt_siparis_durum`
--

DROP TABLE IF EXISTS `tbl_sbt_siparis_durum`;
CREATE TABLE `tbl_sbt_siparis_durum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_siparis_durum`
--

/*!40000 ALTER TABLE `tbl_sbt_siparis_durum` DISABLE KEYS */;
INSERT INTO `tbl_sbt_siparis_durum` (`id`,`ad`) VALUES 
 (1,'HAZIRLANIYOR.'),
 (2,'ÖDEME BEKLENİYOR.'),
 (3,'ÖDEME TAMAMLANDI. ÜRÜN(LER) TEDARİK SÜRECİNDE.'),
 (4,'TAŞIMA (KARGO) FİRMASINA VERİLDİ.'),
 (5,'ÜRÜN(LER) TESLİM EDİLDİ.'),
 (6,'ÖDEME GERÇEKLEŞMEDİ. SİPARİŞ İPTAL EDİLDİ.'),
 (7,'ADRES BİLGİSİ YANLIŞ. SİPARİŞ İPTAL EDİLDİ.'),
 (8,'KARGO TESLİM EDİLEMEDİ. ÜRÜN(LER) GERİ GELDİ.'),
 (9,'SİPARİŞ YENİDEN KARGOYA VERİLDİ.'),
 (10,'ALICI BULUNAMADI. SİPARİŞ İPTAL EDİLDİ.');
/*!40000 ALTER TABLE `tbl_sbt_siparis_durum` ENABLE KEYS */;


--
-- Definition of table `tbl_sbt_ulke`
--

DROP TABLE IF EXISTS `tbl_sbt_ulke`;
CREATE TABLE `tbl_sbt_ulke` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bolge_id` int(11) NOT NULL DEFAULT '-1',
  `ad` varchar(255) DEFAULT NULL,
  `dil_kisaltma` varchar(255) DEFAULT NULL,
  `kisaltma` varchar(2) DEFAULT NULL,
  `alan_kodu` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `alan_kodu` (`alan_kodu`),
  KEY `bolge_id` (`bolge_id`),
  CONSTRAINT `fk_sbt_ulke_bolge_id` FOREIGN KEY (`bolge_id`) REFERENCES `tbl_sbt_ulke_bolge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_ulke`
--

/*!40000 ALTER TABLE `tbl_sbt_ulke` DISABLE KEYS */;
INSERT INTO `tbl_sbt_ulke` (`id`,`bolge_id`,`ad`,`dil_kisaltma`,`kisaltma`,`alan_kodu`) VALUES 
 (1,10,'Afghanistan',NULL,'AF',NULL),
 (2,10,'Albania',NULL,'AL',355),
 (3,1,'Algeria',NULL,'DZ',213),
 (4,9,'American Samoa',NULL,'AS',NULL),
 (5,10,'Andorra',NULL,'AD',376),
 (6,1,'Angola',NULL,'AO',244),
 (7,5,'Anguilla',NULL,'AI',1),
 (8,9,'Antarctica',NULL,'AQ',NULL),
 (9,5,'Antigua & Barbuda',NULL,'AG',1),
 (10,10,'Antilles, Netherlands',NULL,'AN',599),
 (11,8,'Saudi Arabia',NULL,'SA',966),
 (12,3,'Argentina',NULL,'AR',54),
 (13,6,'Armenia',NULL,'AM',374),
 (14,5,'Aruba',NULL,'AW',297),
 (15,9,'Australia',NULL,'AU',61),
 (16,10,'Austria',NULL,'AT',43),
 (17,6,'Azerbaijan',NULL,'AZ',994),
 (18,10,'Bahamas, The',NULL,'BS',1),
 (19,8,'Bahrain',NULL,'BH',973),
 (20,6,'Bangladesh',NULL,'BD',NULL),
 (21,5,'Barbados',NULL,'BB',1),
 (22,10,'Belarus',NULL,'BY',NULL),
 (23,7,'Belgium',NULL,'BE',32),
 (24,4,'Belize',NULL,'BZ',501),
 (25,1,'Benin',NULL,'BJ',229),
 (26,2,'Bermuda',NULL,'BM',1),
 (27,6,'Bhutan',NULL,'BT',975),
 (28,3,'Bolivia',NULL,'BO',591),
 (29,10,'Bosnia and Herzegovina',NULL,'BA',387),
 (30,1,'Botswana',NULL,'BW',267),
 (31,10,'Bouvet Island',NULL,'BV',NULL),
 (32,3,'Brazil',NULL,'BR',55),
 (33,10,'British Indian Ocean T.',NULL,'IO',NULL),
 (34,5,'British Virgin Islands',NULL,'VG',1),
 (35,10,'Brunei Darussalam',NULL,'BN',673),
 (36,7,'Bulgaria',NULL,'BG',359),
 (37,1,'Burkina Faso',NULL,'BF',226),
 (38,1,'Burundi',NULL,'BI',257),
 (39,6,'Cambodia',NULL,'KH',855),
 (40,1,'Cameroon',NULL,'CM',NULL),
 (41,2,'Canada',NULL,'CA',1),
 (42,1,'Cape Verde',NULL,'CV',238),
 (43,5,'Cayman Islands',NULL,'KY',1),
 (44,10,'Central African Republic',NULL,'CF',NULL),
 (45,1,'Chad',NULL,'TD',235),
 (46,3,'Chile',NULL,'CL',56),
 (47,6,'China',NULL,'CN',NULL),
 (48,9,'Christmas Island',NULL,'CX',NULL),
 (49,10,'Cocos (Keeling) Islands',NULL,'CC',NULL),
 (50,3,'Colombia',NULL,'CO',57),
 (51,1,'Comoros',NULL,'KM',269),
 (52,1,'Congo',NULL,'CG',242),
 (53,10,'Congo, Dem. Rep. of the',NULL,'CD',243),
 (54,9,'Cook Islands',NULL,'CK',682),
 (55,4,'Costa Rica',NULL,'CR',506),
 (56,1,'Cote D\'Ivoire',NULL,'CI',NULL),
 (57,10,'Croatia',NULL,'HR',385),
 (58,5,'Cuba',NULL,'CU',NULL),
 (59,10,'Cyprus',NULL,'CY',357),
 (60,10,'Czech Republic',NULL,'CZ',420),
 (61,7,'Denmark',NULL,'DK',45),
 (62,1,'Djibouti',NULL,'DJ',253),
 (63,5,'Dominica',NULL,'DM',1),
 (64,5,'Dominican Republic',NULL,'DO',1),
 (65,10,'East Timor (Timor-Leste)',NULL,'TP',NULL),
 (66,3,'Ecuador',NULL,'EC',593),
 (67,1,'Egypt',NULL,'EG',NULL),
 (68,4,'El Salvador',NULL,'SV',503),
 (69,1,'Equatorial Guinea',NULL,'GQ',NULL),
 (70,1,'Eritrea',NULL,'ER',291),
 (71,10,'Estonia',NULL,'EE',372),
 (72,1,'Ethiopia',NULL,'ET',251),
 (73,10,'European Union',NULL,'EU',NULL),
 (74,10,'Falkland Islands (Malvinas)',NULL,'FK',500),
 (75,10,'Faroe Islands',NULL,'FO',298),
 (76,9,'Fiji',NULL,'FJ',679),
 (77,10,'Finland',NULL,'FI',358),
 (78,7,'France',NULL,'FR',33),
 (79,3,'French Guiana',NULL,'GF',594),
 (80,9,'French Polynesia',NULL,'PF',689),
 (81,10,'French Southern Terr.',NULL,'TF',NULL),
 (82,1,'Gabon',NULL,'GA',241),
 (83,10,'Gambia, the',NULL,'GM',220),
 (84,6,'Georgia',NULL,'GE',NULL),
 (85,7,'Germany',NULL,'DE',49),
 (86,1,'Ghana',NULL,'GH',NULL),
 (87,10,'Gibraltar',NULL,'GI',350),
 (88,7,'Greece',NULL,'GR',30),
 (89,2,'Greenland',NULL,'GL',299),
 (90,5,'Grenada',NULL,'GD',1),
 (91,5,'Guadeloupe',NULL,'GP',590),
 (92,9,'Guam',NULL,'GU',NULL),
 (93,4,'Guatemala',NULL,'GT',502),
 (94,10,'Guernsey and Alderney',NULL,'GG',NULL),
 (95,10,'Guiana, French',NULL,'GF',594),
 (96,1,'Guinea',NULL,'GN',224),
 (97,1,'Guinea-Bissau',NULL,'GW',245),
 (98,10,'Guinea, Equatorial',NULL,'GP',590),
 (99,3,'Guyana',NULL,'GY',592),
 (100,5,'Haiti',NULL,'HT',NULL),
 (101,10,'Heard & McDonald Is.(AU)',NULL,'HM',NULL),
 (102,10,'Holy See (Vatican)',NULL,'VA',379),
 (103,4,'Honduras',NULL,'HN',504),
 (104,10,'Hong Kong, (China)',NULL,'HK',852),
 (105,10,'Hungary',NULL,'HU',36),
 (106,10,'Iceland',NULL,'IS',354),
 (107,6,'India',NULL,'IN',91),
 (108,6,'Indonesia',NULL,'ID',62),
 (109,10,'Iran, Islamic Republic of',NULL,'IR',NULL),
 (110,8,'Iraq',NULL,'IQ',NULL),
 (111,10,'Ireland',NULL,'IE',353),
 (112,8,'Israel',NULL,'IL',972),
 (113,10,'Italy',NULL,'IT',39),
 (114,10,'Ivory Coast (Cote d\'Ivoire)',NULL,'CI',NULL),
 (115,5,'Jamaica',NULL,'JM',1),
 (116,6,'Japan',NULL,'JP',81),
 (117,10,'Jersey',NULL,'JE',NULL),
 (118,8,'Jordan',NULL,'JO',962),
 (119,6,'Kazakhstan',NULL,'KZ',7),
 (120,1,'Kenya',NULL,'KE',254),
 (121,9,'Kiribati',NULL,'KI',686),
 (122,10,'Korea Dem. People\'s Rep.',NULL,'KP',NULL),
 (123,10,'Korea, (South) Republic of',NULL,'KR',82),
 (124,10,'Kosovo',NULL,'KV',NULL),
 (125,8,'Kuwait',NULL,'KW',965),
 (126,10,'Kyrgyzstan',NULL,'KG',996),
 (127,10,'Lao People\'s Democ. Rep.',NULL,'LA',856),
 (128,10,'Latvia',NULL,'LV',371),
 (129,8,'Lebanon',NULL,'LB',NULL),
 (130,1,'Lesotho',NULL,'LS',266),
 (131,1,'Liberia',NULL,'LR',NULL),
 (132,10,'Libyan Arab Jamahiriya',NULL,'LY',NULL),
 (133,10,'Liechtenstein',NULL,'LI',423),
 (134,10,'Lithuania',NULL,'LT',370),
 (135,10,'Luxembourg',NULL,'LU',352),
 (136,10,'Macao, (China)',NULL,'MO',NULL),
 (137,10,'Macedonia, TFYR',NULL,'MK',NULL),
 (138,1,'Madagascar',NULL,'MG',261),
 (139,1,'Malawi',NULL,'MW',265),
 (140,6,'Malaysia',NULL,'MY',60),
 (141,6,'Maldives',NULL,'MV',960),
 (142,1,'Mali',NULL,'ML',223),
 (143,10,'Malta',NULL,'MT',356),
 (144,10,'Man, Isle of',NULL,'IM',NULL),
 (145,9,'Marshall Islands',NULL,'MH',692),
 (146,10,'Martinique (FR)',NULL,'MQ',596),
 (147,1,'Mauritania',NULL,'MR',222),
 (148,1,'Mauritius',NULL,'MU',230),
 (149,1,'Mayotte (FR)',NULL,'YT',269),
 (150,4,'Mexico',NULL,'MX',52),
 (151,10,'Micronesia, Fed. States of',NULL,'FM',691),
 (152,10,'Moldova, Republic of',NULL,'MD',NULL),
 (153,10,'Monaco',NULL,'MC',NULL),
 (154,6,'Mongolia',NULL,'MN',976),
 (155,10,'Montenegro',NULL,'CS',NULL),
 (156,10,'Montserrat',NULL,'MS',1),
 (157,1,'Morocco',NULL,'MA',212),
 (158,1,'Mozambique',NULL,'MZ',258),
 (159,10,'Myanmar (ex-Burma)',NULL,'MM',NULL),
 (160,1,'Namibia',NULL,'NA',264),
 (161,9,'Nauru',NULL,'NR',674),
 (162,6,'Nepal',NULL,'NP',977),
 (163,7,'Netherlands',NULL,'NL',31),
 (164,5,'Netherlands Antilles',NULL,'AN',599),
 (165,9,'New Caledonia',NULL,'NC',687),
 (166,9,'New Zealand',NULL,'NZ',64),
 (167,4,'Nicaragua',NULL,'NI',505),
 (168,1,'Niger',NULL,'NE',227),
 (169,1,'Nigeria',NULL,'NG',NULL),
 (170,9,'Niue',NULL,'NU',683),
 (171,9,'Norfolk Island',NULL,'NF',672),
 (172,10,'Northern Mariana Islands',NULL,'MP',NULL),
 (173,10,'Norway',NULL,'NO',47),
 (174,8,'Oman',NULL,'OM',968),
 (175,6,'Pakistan',NULL,'PK',NULL),
 (176,9,'Palau',NULL,'PW',680),
 (177,10,'Palestinian Territory',NULL,'PS',NULL),
 (178,4,'Panama',NULL,'PA',507),
 (179,10,'Papua New Guinea',NULL,'PG',675),
 (180,3,'Paraguay',NULL,'PY',NULL),
 (181,3,'Peru',NULL,'PE',51),
 (182,6,'Philippines',NULL,'PH',63),
 (183,10,'Pitcairn Island',NULL,'PN',872),
 (184,7,'Poland',NULL,'PL',48),
 (185,7,'Portugal',NULL,'PT',351),
 (186,5,'Puerto Rico',NULL,'PR',NULL),
 (187,8,'Qatar',NULL,'QA',974),
 (188,1,'Reunion (FR)',NULL,'RE',262),
 (189,7,'Romania',NULL,'RO',40),
 (190,10,'Russia (Russian Fed.)',NULL,'RU',7),
 (191,1,'Rwanda',NULL,'RW',250),
 (192,10,'Sahara, Western',NULL,'EH',NULL),
 (193,10,'Saint Barthelemy (FR)',NULL,'BL',NULL),
 (194,1,'Saint Helena (UK)',NULL,'SH',290),
 (195,10,'Saint Kitts and Nevis',NULL,'KN',1),
 (196,5,'Saint Lucia',NULL,'LC',1),
 (197,10,'Saint Martin (FR)',NULL,'MF',NULL),
 (198,10,'S Pierre & Miquelon(FR)',NULL,'PM',508),
 (199,10,'S Vincent & Grenadines',NULL,'VC',1),
 (200,9,'Samoa',NULL,'WS',685),
 (201,10,'San Marino',NULL,'SM',378),
 (202,10,'Sao Tome and Principe',NULL,'ST',239),
 (203,8,'Saudi Arabia',NULL,'SA',966),
 (204,1,'Senegal',NULL,'SN',221),
 (205,10,'Serbia',NULL,'RS',NULL),
 (206,1,'Seychelles',NULL,'SC',248),
 (207,1,'Sierra Leone',NULL,'SL',232),
 (208,6,'Singapore',NULL,'SG',65),
 (209,10,'Slovakia',NULL,'SK',421),
 (210,10,'Slovenia',NULL,'SI',386),
 (211,9,'Solomon Islands',NULL,'SB',677),
 (212,1,'Somalia',NULL,'SO',252),
 (213,1,'South Africa',NULL,'ZA',27),
 (214,10,'S.George & S.Sandwich',NULL,'GS',NULL),
 (215,1,'South Sudan',NULL,'SS',NULL),
 (216,7,'Spain',NULL,'ES',34),
 (217,10,'Sri Lanka (ex-Ceilan)',NULL,'LK',94),
 (218,1,'Sudan',NULL,'SD',NULL),
 (219,3,'Suriname',NULL,'SR',597),
 (220,10,'Svalbard & Jan Mayen Is.',NULL,'SJ',47),
 (221,1,'Swaziland',NULL,'SZ',268),
 (222,10,'Sweden',NULL,'SE',46),
 (223,10,'Switzerland',NULL,'CH',41),
 (224,10,'Syrian Arab Republic',NULL,'SY',NULL),
 (225,6,'Taiwan',NULL,'TW',886),
 (226,6,'Tajikistan',NULL,'TJ',992),
 (227,10,'Tanzania, United Rep. of',NULL,'TZ',255),
 (228,6,'Thailand',NULL,'TH',66),
 (229,10,'Timor-Leste (East Timor)',NULL,'TL',NULL),
 (230,1,'Togo',NULL,'TG',228),
 (231,9,'Tokelau',NULL,'TK',NULL),
 (232,9,'Tonga',NULL,'TO',676),
 (233,5,'Trinidad & Tobago',NULL,'TT',1),
 (234,1,'Tunisia',NULL,'TN',216),
 (235,7,'Türkiye',NULL,'TR',90),
 (236,6,'Turkmenistan',NULL,'TM',993),
 (237,10,'Turks and Caicos Is.',NULL,'TC',1),
 (238,9,'Tuvalu',NULL,'TV',688),
 (239,1,'Uganda',NULL,'UG',256),
 (240,10,'Ukraine',NULL,'UA',380),
 (241,8,'United Arab Emirates',NULL,'AE',971),
 (242,7,'United Kingdom',NULL,'UK',NULL),
 (243,2,'United States','EN','US',1),
 (244,10,'US Minor Outlying Isl.',NULL,'UM',NULL),
 (245,3,'Uruguay',NULL,'UY',598),
 (246,6,'Uzbekistan',NULL,'UZ',NULL),
 (247,9,'Vanuatu',NULL,'VU',678),
 (248,10,'Vatican (Holy See)',NULL,'VA',379),
 (249,3,'Venezuela',NULL,'VE',58),
 (250,6,'Vietnam',NULL,'VN',84),
 (251,10,'Virgin Islands, British',NULL,'VG',1),
 (252,10,'Virgin Islands, U.S.',NULL,'VI',NULL),
 (253,10,'Wallis and Futuna',NULL,'WF',681),
 (254,1,'Western Sahara',NULL,'EH',NULL),
 (255,8,'Yemen',NULL,'YE',967),
 (256,1,'Zambia',NULL,'ZM',260),
 (257,1,'Zimbabwe',NULL,'ZW',NULL);
/*!40000 ALTER TABLE `tbl_sbt_ulke` ENABLE KEYS */;


--
-- Definition of table `tbl_sbt_ulke_bolge`
--

DROP TABLE IF EXISTS `tbl_sbt_ulke_bolge`;
CREATE TABLE `tbl_sbt_ulke_bolge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_ulke_bolge`
--

/*!40000 ALTER TABLE `tbl_sbt_ulke_bolge` DISABLE KEYS */;
INSERT INTO `tbl_sbt_ulke_bolge` (`id`,`ad`) VALUES 
 (1,'AFRIKA'),
 (2,'KUZEY AMERIKA'),
 (3,'GUNEY AMERIKA'),
 (4,'ORTA AMERIKA'),
 (5,'KARAYIPLER'),
 (6,'ASYA'),
 (7,'AVRUPA'),
 (8,'ORTADOGU'),
 (9,'OKYANUSYA'),
 (10,'DİĞER');
/*!40000 ALTER TABLE `tbl_sbt_ulke_bolge` ENABLE KEYS */;


--
-- Definition of table `tbl_sbt_ulke_il`
--

DROP TABLE IF EXISTS `tbl_sbt_ulke_il`;
CREATE TABLE `tbl_sbt_ulke_il` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ulke_id` int(11) NOT NULL DEFAULT '-1',
  `ad` varchar(255) NOT NULL DEFAULT '',
  `bolge_id` int(11) NOT NULL DEFAULT '-1',
  `alan_kodu` int(3) DEFAULT NULL,
  `plaka` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `alan_kodu` (`alan_kodu`),
  KEY `plaka` (`plaka`),
  KEY `ulke_id` (`ulke_id`),
  KEY `bolge_id` (`bolge_id`),
  CONSTRAINT `fk_sbt_ulke_il_bolge_id` FOREIGN KEY (`bolge_id`) REFERENCES `tbl_sbt_ulke_il_bolge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sbt_ulke_il_ulke_id` FOREIGN KEY (`ulke_id`) REFERENCES `tbl_sbt_ulke` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_ulke_il`
--

/*!40000 ALTER TABLE `tbl_sbt_ulke_il` DISABLE KEYS */;
INSERT INTO `tbl_sbt_ulke_il` (`id`,`ulke_id`,`ad`,`bolge_id`,`alan_kodu`,`plaka`) VALUES 
 (1,235,'Adıyaman',7,416,'02'),
 (2,235,'Afyon',3,272,'03'),
 (3,235,'Ağrı',6,472,'04'),
 (4,235,'Aksaray',5,382,'68'),
 (5,235,'Amasya',2,358,'05'),
 (6,235,'Ankara',5,312,'06'),
 (7,235,'Antalya',4,242,'07'),
 (8,235,'Ardahan',6,478,'75'),
 (9,235,'Artvin',2,466,'08'),
 (10,235,'Aydin',3,256,'09'),
 (11,235,'Balıkesir',1,266,'10'),
 (12,235,'Bartin',2,378,'74'),
 (13,235,'Batman',7,488,'72'),
 (14,235,'Bayburt',2,458,'69'),
 (15,235,'Bilecik',1,228,'11'),
 (16,235,'Bingöl',6,426,'12'),
 (17,235,'Bitlis',6,434,'13'),
 (18,235,'Bolu',2,374,'14'),
 (19,235,'Burdur',4,248,'15'),
 (20,235,'Bursa',1,224,'16'),
 (21,235,'Çanakkale',1,286,'17'),
 (22,235,'Çankırı',5,376,'18'),
 (23,235,'Çorum',2,364,'19'),
 (24,235,'Denizli',3,258,'20'),
 (25,235,'Diyarbakır',7,412,'21'),
 (26,235,'Düzce',2,380,'81'),
 (27,235,'Edirne',1,284,'22'),
 (28,235,'Elaziğ',6,424,'23'),
 (29,235,'Erzincan',6,446,'24'),
 (30,235,'Erzurum',6,442,'25'),
 (31,235,'Eskişehir',5,222,'26'),
 (32,235,'Gaziantep',7,342,'27'),
 (33,235,'Giresun',2,454,'28'),
 (34,235,'Gümüşhane',2,456,'29'),
 (35,235,'Hakkari',6,438,'30'),
 (36,235,'Hatay',4,326,'31'),
 (37,235,'Iğdır',6,476,'76'),
 (38,235,'Isparta',4,246,'32'),
 (39,235,'İçel',4,324,'33'),
 (41,235,'İzmir',3,232,'35'),
 (42,235,'Kahramanmaraş',4,370,'46'),
 (43,235,'Karabük',2,338,'78'),
 (44,235,'Karaman',5,474,'70'),
 (45,235,'Kars',6,366,'36'),
 (46,235,'Kastamonu',2,352,'37'),
 (47,235,'Kayseri',5,318,'38'),
 (48,235,'Kilis',7,288,'79'),
 (49,235,'Kirikkale',5,386,'71'),
 (50,235,'Kirklareli',1,348,'39'),
 (51,235,'Kirşehir',5,344,'40'),
 (52,235,'Kocaeli',1,262,'41'),
 (53,235,'Konya',5,332,'42'),
 (54,235,'Kütahya',3,274,'43'),
 (55,235,'Malatya',6,422,'44'),
 (56,235,'Manisa',3,236,'45'),
 (57,235,'Mardin',7,482,'47'),
 (58,235,'Muğla',3,252,'48'),
 (59,235,'Muş',6,436,'49'),
 (60,235,'Nevşehir',5,384,'50'),
 (61,235,'Niğde',5,388,'51'),
 (62,235,'Ordu',2,452,'52'),
 (63,235,'Osmaniye',4,328,'80'),
 (64,235,'Rize',2,464,'53'),
 (65,235,'Sakarya',1,264,'54'),
 (66,235,'Samsun',2,362,'55'),
 (67,235,'Siirt',7,484,'56'),
 (68,235,'Sinop',2,368,'57'),
 (69,235,'Sivas',5,346,'58'),
 (70,235,'Şanlıurfa',7,414,'63'),
 (71,235,'Şirnak',7,486,'73'),
 (72,235,'Tekirdağ',1,282,'59'),
 (73,235,'Tokat',2,356,'60'),
 (74,235,'Trabzon',2,462,'61'),
 (75,235,'Tunceli',6,428,'62'),
 (76,235,'Uşak',3,276,'64'),
 (77,235,'Van',6,432,'65'),
 (78,235,'Yalova',1,226,'77'),
 (79,235,'Yozgat',5,354,'66'),
 (80,235,'Zonguldak',2,372,'67'),
 (81,235,'Adana',4,322,'01'),
 (82,235,'İstanbul (Avrupa)',1,212,'34'),
 (83,235,'İstanbul (Anadolu)',1,216,'34');
/*!40000 ALTER TABLE `tbl_sbt_ulke_il` ENABLE KEYS */;


--
-- Definition of table `tbl_sbt_ulke_il_bolge`
--

DROP TABLE IF EXISTS `tbl_sbt_ulke_il_bolge`;
CREATE TABLE `tbl_sbt_ulke_il_bolge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ulke_id` int(11) NOT NULL DEFAULT '-1',
  `ad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `ulke_id` (`ulke_id`),
  CONSTRAINT `fk_sbt_ulke_il_bolge_ulke_id` FOREIGN KEY (`ulke_id`) REFERENCES `tbl_sbt_ulke` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_ulke_il_bolge`
--

/*!40000 ALTER TABLE `tbl_sbt_ulke_il_bolge` DISABLE KEYS */;
INSERT INTO `tbl_sbt_ulke_il_bolge` (`id`,`ulke_id`,`ad`) VALUES 
 (1,235,'MARMARA'),
 (2,235,'KARADENİZ'),
 (3,235,'EGE'),
 (4,235,'AKDENİZ'),
 (5,235,'İÇ ANADOLU'),
 (6,235,'DOĞU ANADOLU'),
 (7,235,'GÜNEYDOĞU ANADOLU');
/*!40000 ALTER TABLE `tbl_sbt_ulke_il_bolge` ENABLE KEYS */;


--
-- Definition of table `tbl_sbt_ulke_ilce`
--

DROP TABLE IF EXISTS `tbl_sbt_ulke_ilce`;
CREATE TABLE `tbl_sbt_ulke_ilce` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `il_id` int(11) DEFAULT NULL,
  `ad` varchar(255) NOT NULL DEFAULT '',
  `merkez` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `merkez` (`merkez`),
  KEY `il_id` (`il_id`),
  CONSTRAINT `fk_sbt_ulke_ilce_il_id` FOREIGN KEY (`il_id`) REFERENCES `tbl_sbt_ulke_il` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=968 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_ulke_ilce`
--

/*!40000 ALTER TABLE `tbl_sbt_ulke_ilce` DISABLE KEYS */;
INSERT INTO `tbl_sbt_ulke_ilce` (`id`,`il_id`,`ad`,`merkez`) VALUES 
 (1,81,'Merkez',1),
 (2,81,'Aladag',0),
 (3,81,'Ceyhan',0),
 (4,81,'Feke',0),
 (5,81,'Imamoglu',0),
 (6,81,'Karaisali',0),
 (7,81,'Karatas',0),
 (8,81,'Kozan',0),
 (9,81,'Pozanti',0),
 (10,81,'Saimbeyli',0),
 (11,81,'Seyhan',0),
 (12,81,'Tufanbeyli',0),
 (13,81,'Yumurtalik',0),
 (14,81,'Yüregir',0),
 (15,1,'Merkez',1),
 (16,1,'Besni',0),
 (17,1,'Çelikhan',0),
 (18,1,'Gerger',0),
 (19,1,'Gölbasi',0),
 (20,1,'Kahta',0),
 (21,1,'Samsat',0),
 (22,1,'Sincik',0),
 (23,1,'Tut',0),
 (24,2,'Merkez',1),
 (25,2,'Basmakçi',0),
 (26,2,'Bayat',0),
 (27,2,'Bolvadin',0),
 (28,2,'Çobanlar',0),
 (29,2,'Çay',0),
 (30,2,'Dazkiri',0),
 (31,2,'Dinar',0),
 (32,2,'Emirdag',0),
 (33,2,'Evciler',0),
 (34,2,'Hocalar',0),
 (35,2,'Ihsaniye',0),
 (36,2,'Iscehisar',0),
 (37,2,'Kizilören',0),
 (38,2,'Sandikli',0),
 (39,2,'Sincanli',0),
 (40,2,'Sultandagi',0),
 (41,2,'Suhut',0),
 (42,3,'Merkez',1),
 (43,3,'Diyadin',0),
 (44,3,'Dogubeyazit',0),
 (45,3,'Eleskirt',0),
 (46,3,'Hamur',0),
 (47,3,'Patnos',0),
 (48,3,'Tasliçay',0),
 (49,3,'Tutak',0),
 (50,5,'Merkez',1),
 (51,5,'Göynücek',0),
 (52,5,'Gümüshacikö',0),
 (53,5,'Hamamözü',0),
 (54,5,'Merzifon',0),
 (55,5,'Suluova',0),
 (56,5,'Tasova',0),
 (57,6,'Merkez',1),
 (58,6,'Akyurt',0),
 (59,6,'Altindag',0),
 (60,6,'Ayas',0),
 (61,6,'Bala',0),
 (62,6,'Beypazari',0),
 (63,6,'Çamlidere',0),
 (64,6,'Çankaya',0),
 (65,6,'Çubuk',0),
 (66,6,'Elmadag',0),
 (67,6,'Etimesgut',0),
 (68,6,'Evren',0),
 (69,6,'Gölbasi',0),
 (70,6,'Güdül',0),
 (71,6,'Haymana',0),
 (72,6,'Kalecik',0),
 (73,6,'Kazan',0),
 (74,6,'Keçiören',0),
 (75,6,'Kizilcahama',0),
 (76,6,'Mamak',0),
 (77,6,'Nallihan',0),
 (78,6,'Polatli',0),
 (79,6,'Sincan',0),
 (80,6,'Sereflikoçh',0),
 (81,6,'Yenimahalle',0),
 (82,7,'Merkez',1),
 (83,7,'Akseki',0),
 (84,7,'Alanya',0),
 (85,7,'Demre',0),
 (86,7,'Elmali',0),
 (87,7,'Finike',0),
 (88,7,'Gazipasa',0),
 (89,7,'Gündogmus',0),
 (90,7,'Ibradi',0),
 (91,7,'Kale',0),
 (92,7,'Kas',0),
 (93,7,'Kemer',0),
 (94,7,'Korkuteli',0),
 (95,7,'Kumluca',0),
 (96,7,'Manavgat',0),
 (97,7,'Serik',0),
 (98,9,'Merkez',1),
 (99,9,'Ardanuç',0),
 (100,9,'Arhavi',0),
 (101,9,'Borçka',0),
 (102,9,'Hopa',0),
 (103,9,'Murgul',0),
 (104,9,'Savsat',0),
 (105,9,'Yusufeli',0),
 (106,10,'Merkez',1),
 (107,10,'Bozdogan',0),
 (108,10,'Buharkent',0),
 (109,10,'Çine',0),
 (110,10,'Germencik',0),
 (111,10,'Incirliova',0),
 (112,10,'Karacasu',0),
 (113,10,'Karpuzlu',0),
 (114,10,'Koçarli',0),
 (115,10,'Kösk',0),
 (116,10,'Kusadasi',0),
 (117,10,'Kuyucak',0),
 (118,10,'Nazilli',0),
 (119,10,'Söke',0),
 (120,10,'Sultanhisar',0),
 (121,10,'Yenihisar',0),
 (122,10,'Yenipazar',0),
 (123,11,'Merkez',1),
 (124,11,'Ayvalik',0),
 (125,11,'Akçay',0),
 (126,11,'Balya',0),
 (127,11,'Bandirma',0),
 (128,11,'Bigadiç',0),
 (129,11,'Burhaniye',0),
 (130,11,'Dursunbey',0),
 (131,11,'Edremit',0),
 (132,11,'Erdek',0),
 (133,11,'Gönen',0),
 (134,11,'Gömeç',0),
 (135,11,'Havran',0),
 (136,11,'Ivrindi',0),
 (137,11,'Kepsut',0),
 (138,11,'Manyas',0),
 (139,11,'Marmara',0),
 (140,11,'Savastepe',0),
 (141,11,'Sindirgi',0),
 (142,11,'Susurluk',0),
 (143,15,'Merkez',1),
 (144,15,'Bozöyük',0),
 (145,15,'Gölpazari',0),
 (146,15,'Inhisar',0),
 (147,15,'Osmaneli',0),
 (148,15,'Pazaryeri',0),
 (149,15,'Sögüt',0),
 (150,15,'Yenipazar',0),
 (151,16,'Merkez',1),
 (152,16,'Adakli',0),
 (153,16,'Genç',0),
 (154,16,'Karliova',0),
 (155,16,'Kigi',0),
 (156,16,'Solhan',0),
 (157,16,'Yayladere',0),
 (158,16,'Yedisu',0),
 (159,17,'Merkez',1),
 (160,17,'Adilcevaz',0),
 (161,17,'Ahlat',0),
 (162,17,'Güroymak',0),
 (163,17,'Hizan',0),
 (164,17,'Mutki',0),
 (165,17,'Tatvan',0),
 (166,18,'Merkez',1),
 (167,18,'Dörtdivan',0),
 (168,18,'Gerede',0),
 (169,18,'Göynük',0),
 (170,18,'Kibriscik',0),
 (171,18,'Mengen',0),
 (172,18,'Mudurnu',0),
 (173,18,'Seben',0),
 (174,18,'Yeniçaga',0),
 (175,19,'Merkez',1),
 (176,19,'Altinyayla',0),
 (177,19,'Aglasun',0),
 (178,19,'Bucak',0),
 (179,19,'Çavdir',0),
 (180,19,'Çeltikçi',0),
 (181,19,'Gölhisar',0),
 (182,19,'Karamanli',0),
 (183,19,'Kemer',0),
 (184,19,'Tefenni',0),
 (185,19,'Yesilova',0),
 (186,20,'Merkez',1),
 (187,20,'Büyükorhan',0),
 (188,20,'Gemlik',0),
 (189,20,'Gürsu',0),
 (190,20,'Harmancik',0),
 (191,20,'Inegöl',0),
 (192,20,'Iznik',0),
 (193,20,'Karacabey',0),
 (194,20,'Keles',0),
 (195,20,'Kestel',0),
 (196,20,'Mudanya',0),
 (197,20,'Mustafakema',0),
 (198,20,'Nilüfer',0),
 (199,20,'Orhaneli',0),
 (200,20,'Orhangazi',0),
 (201,20,'Osmangazi',0),
 (202,20,'Yenisehir',0),
 (203,20,'Yildirim',0),
 (204,21,'Merkez',1),
 (205,21,'Ayvacik',0),
 (206,21,'Bayramiç',0),
 (207,21,'Bozcaada',0),
 (208,21,'Biga',0),
 (209,21,'Çan',0),
 (210,21,'Eceabat',0),
 (211,21,'Ezine',0),
 (212,21,'Gelibolu',0),
 (213,21,'Gökçeada',0),
 (214,21,'Lapseki',0),
 (215,21,'Yenice',0),
 (216,22,'Merkez',1),
 (217,22,'Atkaracalar',0),
 (218,22,'Bayramören',0),
 (219,22,'Çerkes',0),
 (220,22,'Eldivan',0),
 (221,22,'Ilgaz',0),
 (222,22,'Kizilirmak',0),
 (223,22,'Korgun',0),
 (224,22,'Kursunlu',0),
 (225,22,'Orta',0),
 (226,22,'Ovacik',0),
 (227,22,'Sabanözü',0),
 (228,22,'Yaprakli',0),
 (229,23,'Merkez',1),
 (230,23,'Alaca',0),
 (231,23,'Bayat',0),
 (232,23,'Bogazkale',0),
 (233,23,'Dodurga',0),
 (234,23,'Iskilip',0),
 (235,23,'Kargi',0),
 (236,23,'Laçin',0),
 (237,23,'Mecitözü',0),
 (238,23,'Oguzlar',0),
 (239,23,'Ortaköy',0),
 (240,23,'Osmancik',0),
 (241,23,'Sungurlu',0),
 (242,23,'Ugurludag',0),
 (243,24,'Merkez',1),
 (244,24,'Acipayam',0),
 (245,24,'Akköy',0),
 (246,24,'Babadag',0),
 (247,24,'Baklan',0),
 (248,24,'Bekilli',0),
 (249,24,'Beyagaç',0),
 (250,24,'Buldan',0),
 (251,24,'Bozkurt',0),
 (252,24,'Çal',0),
 (253,24,'Çameli',0),
 (254,24,'Çardak',0),
 (255,24,'Çivril',0),
 (256,24,'Güney',0),
 (257,24,'Honaz',0),
 (258,24,'Kale',0),
 (259,24,'Sarayköy',0),
 (260,24,'Serinhisar',0),
 (261,24,'Tavas',0),
 (262,25,'Merkez',1),
 (263,25,'Bismil',0),
 (264,25,'Çermik',0),
 (265,25,'Çinar',0),
 (266,25,'Çüngüs',0),
 (267,25,'Dicle',0),
 (268,25,'Egil',0),
 (269,25,'Ergani',0),
 (270,25,'Hani',0),
 (271,25,'Hazro',0),
 (272,25,'Kocaköy',0),
 (273,25,'Kulp',0),
 (274,25,'Lice',0),
 (275,25,'Silvan',0),
 (276,27,'Merkez',1),
 (277,27,'Enez',0),
 (278,27,'Havsa',0),
 (279,27,'Ipsala',0),
 (280,27,'Kesan',0),
 (281,27,'Lalapasa',0),
 (282,27,'Meriç',0),
 (283,27,'Süloglu',0),
 (284,27,'Uzunköprü',0),
 (285,28,'Merkez',1),
 (286,28,'Agin',0),
 (287,28,'Alacakaya',0),
 (288,28,'Aricak',0),
 (289,28,'Baskil',0),
 (290,28,'Karakoçan',0),
 (291,28,'Keban',0),
 (292,28,'Kovancilar',0),
 (293,28,'Maden',0),
 (294,28,'Palu',0),
 (295,28,'Sivrice',0),
 (296,29,'Merkez',1),
 (297,29,'Çayirli',0),
 (298,29,'Iliç',0),
 (299,29,'Kemah',0),
 (300,29,'Kemaliye',0),
 (301,29,'Otlukbeli',0),
 (302,29,'Refahiye',0),
 (303,29,'Tercan',0),
 (304,29,'Üzümlü',0),
 (305,30,'Merkez',1),
 (306,30,'Askale',0),
 (307,30,'Çat',0),
 (308,30,'Hinis',0),
 (309,30,'Horasan',0),
 (310,30,'Ilica',0),
 (311,30,'Ispir',0),
 (312,30,'Karaçoban',0),
 (313,30,'Karayazi',0),
 (314,30,'Köprüköy',0),
 (315,30,'Narman',0),
 (316,30,'Oltu',0),
 (317,30,'Olur',0),
 (318,30,'Pasinler',0),
 (319,30,'Pazaryolu',0),
 (320,30,'Senkaya',0),
 (321,30,'Tekman',0),
 (322,30,'Tortum',0),
 (323,30,'Uzundere',0),
 (324,31,'Merkez',1),
 (325,31,'Alpu',0),
 (326,31,'Beylikova',0),
 (327,31,'Çifteler',0),
 (328,31,'Günyüzü',0),
 (329,31,'Han',0),
 (330,31,'Inönü',0),
 (331,31,'Mahmudiye',0),
 (332,31,'Mihalgazi',0),
 (333,31,'Mihaliççik',0),
 (334,31,'Saricakaya',0),
 (335,31,'Seyitgazi',0),
 (336,31,'Sivrihisar',0),
 (337,32,'Merkez',1),
 (338,32,'Araban',0),
 (339,32,'Islahiye',0),
 (340,32,'Kilis',0),
 (341,32,'Kargamis',0),
 (342,32,'Nizip',0),
 (343,32,'Nurdagi',0),
 (344,32,'Oguzeli',0),
 (345,32,'Sahinbey',0),
 (346,32,'Sehitkamil',0),
 (347,32,'Yavuzeli',0),
 (348,33,'Merkez',1),
 (349,33,'Alucra',0),
 (350,33,'Bulancak',0),
 (351,33,'Çamoluk',0),
 (352,33,'Çanakçi',0),
 (353,33,'Dereli',0),
 (354,33,'Dogankent',0),
 (355,33,'Espiye',0),
 (356,33,'Eynesil',0),
 (357,33,'Görele',0),
 (358,33,'Güce',0),
 (359,33,'Kesap',0),
 (360,33,'Piraziz',0),
 (361,33,'Sebinkarahisar',0),
 (362,33,'Tirebolu',0),
 (363,33,'Yaglidere',0),
 (364,34,'Merkez',1),
 (365,34,'Kelkit',0),
 (366,34,'Köse',0),
 (367,34,'Kürtün',0),
 (368,34,'Siran',0),
 (369,34,'Torul',0),
 (370,35,'Merkez',1),
 (371,35,'Çukurca',0),
 (372,35,'Semdinli',0),
 (373,35,'Yüksekova',0),
 (374,36,'Merkez',1),
 (375,36,'Altinözü',0),
 (376,36,'Belen',0),
 (377,36,'Dörtyol',0),
 (378,36,'Erzin',0),
 (379,36,'Hassa',0),
 (380,36,'Iskenderun',0),
 (381,36,'Kirikhan',0),
 (382,36,'Kumlu',0),
 (383,36,'Reyhanli',0),
 (384,36,'Samandagi',0),
 (385,36,'Yayladagi',0),
 (386,38,'Merkez',1),
 (387,38,'Aksu',0),
 (388,38,'Atabey',0),
 (389,38,'Egirdir',0),
 (390,38,'Gelendost',0),
 (391,38,'Gönen',0),
 (392,38,'Keçiborlu',0),
 (393,38,'Senirkent',0),
 (394,38,'Sütçüler',0),
 (395,38,'Sarkikaraag',0),
 (396,38,'Uluborlu',0),
 (397,38,'Yenisarbade',0),
 (398,38,'Yalvaç',0),
 (399,39,'Merkez',1),
 (400,39,'Anamur',0),
 (401,39,'Aydincik',0),
 (402,39,'Bozyazi',0),
 (403,39,'Çamliyayla',0),
 (404,39,'Erdemli',0),
 (405,39,'Gülnar',0),
 (406,39,'Mut',0),
 (407,39,'Silifke',0),
 (408,39,'Tarsus',0),
 (410,82,'Adalar',0),
 (417,82,'Beykoz',0),
 (427,82,'Kadiköy',0),
 (431,82,'Maltepe',0),
 (432,82,'Pendik',0),
 (435,82,'Sultanbeyli',0),
 (436,82,'Sile',0),
 (438,82,'Tuzla',0),
 (439,82,'Ümraniye',0),
 (440,82,'Üsküdar',0),
 (443,41,'Merkez',1),
 (444,41,'Aliaga',0),
 (445,41,'Bayindir',0),
 (446,41,'Balçova',0),
 (447,41,'Bergama',0),
 (448,41,'Beydag',0),
 (449,41,'Bornova',0),
 (450,41,'Buca',0),
 (451,41,'Çesme',0),
 (452,41,'Çigli',0),
 (453,41,'Dikili',0),
 (454,41,'Foça',0),
 (455,41,'Gaziemir',0),
 (456,41,'Güzelbahçe',0),
 (457,41,'Karaburun',0),
 (458,41,'Karsiyaka',0),
 (459,41,'Kemalpasa',0),
 (460,41,'Kinik',0),
 (461,41,'Kiraz',0),
 (462,41,'Konak',0),
 (463,41,'Menderes',0),
 (464,41,'Menemen',0),
 (465,41,'Narlidere',0),
 (466,41,'Ödemis',0),
 (467,41,'Seferihisar',0),
 (468,41,'Selçuk',0),
 (469,41,'Tire',0),
 (470,41,'Torbali',0),
 (471,41,'Urla',0),
 (472,45,'Merkez',1),
 (473,45,'Akyaka',0),
 (474,45,'Arpaçay',0),
 (475,45,'Digor',0),
 (476,45,'Kagizman',0),
 (477,45,'Sarikamis',0),
 (478,45,'Selim',0),
 (479,45,'Susuz',0),
 (480,46,'Merkez',1),
 (481,46,'Abana',0),
 (482,46,'Agli',0),
 (483,46,'Araç',0),
 (484,46,'Azdavay',0),
 (485,46,'Bozkurt',0),
 (486,46,'Cide',0),
 (487,46,'Çatalzeytin',0),
 (488,46,'Daday',0),
 (489,46,'Devrekani',0),
 (490,46,'Doganyurt',0),
 (491,46,'Hanönü',0),
 (492,46,'Ihsangazi',0),
 (493,46,'Inebolu',0),
 (494,46,'Küre',0),
 (495,46,'Pinarbasi',0),
 (496,46,'Seydiler',0),
 (497,46,'Senpazar',0),
 (498,46,'Tasköprü',0),
 (499,46,'Tosya',0),
 (500,47,'Merkez',1),
 (501,47,'Akkisla',0),
 (502,47,'Bünyan',0),
 (503,47,'Develi',0),
 (504,47,'Felahiye',0),
 (505,47,'Hacilar',0),
 (506,47,'Incesu',0),
 (507,47,'Kocasinan',0),
 (508,47,'Melikgazi',0),
 (509,47,'Özvatan',0),
 (510,47,'Pinarbasi',0),
 (511,47,'Sarioglan',0),
 (512,47,'Sariz',0),
 (513,47,'Talas',0),
 (514,47,'Tomarza',0),
 (515,47,'Yahyali',0),
 (516,47,'Yesilhisar',0),
 (517,50,'Merkez',1),
 (518,50,'Babaeski',0),
 (519,50,'Demirköy',0),
 (520,50,'Kofçaz',0),
 (521,50,'Lüleburgaz',0),
 (522,50,'Pehlivanköy',0),
 (523,50,'Pinarhisar',0),
 (524,50,'Vize',0),
 (525,51,'Merkez',1),
 (526,51,'Akçakent',0),
 (527,51,'Akpinar',0),
 (528,51,'Boztepe',0),
 (529,51,'Çiçekdagi',0),
 (530,51,'Kaman',0),
 (531,51,'Mucur',0),
 (532,52,'Merkez',1),
 (533,52,'Darica',0),
 (534,52,'Gebze',0),
 (535,52,'Gölcük',0),
 (536,52,'Kandira',0),
 (537,52,'Karamürsel',0),
 (538,52,'Körfez',0),
 (539,53,'Merkez',1),
 (540,53,'Ahirli',0),
 (541,53,'Akören',0),
 (542,53,'Aksehir',0),
 (543,53,'Altinekin',0),
 (544,53,'Beysehir',0),
 (545,53,'Bozkir',0),
 (546,53,'Derebucak',0),
 (547,53,'Cihanbeyli',0),
 (548,53,'Çumra',0),
 (549,53,'Çeltik',0),
 (550,53,'Derbent',0),
 (551,53,'Doganhisar',0),
 (552,53,'Emirgazi',0),
 (553,53,'Eregli',0),
 (554,53,'Güneysinir',0),
 (555,53,'Halkapinar',0),
 (556,53,'Hadim',0),
 (557,53,'Hüyük',0),
 (558,53,'Ilgin',0),
 (559,53,'Kadinhani',0),
 (560,53,'Karapinar',0),
 (561,53,'Karatay',0),
 (562,53,'Kulu',0),
 (563,53,'Meram',0),
 (564,53,'Sarayönü',0),
 (565,53,'Selçuklu',0),
 (566,53,'Seydisehir',0),
 (567,53,'Taskent',0),
 (568,53,'Tuzlukçu',0),
 (569,53,'Yalihöyük',0),
 (570,53,'Yunak',0),
 (571,54,'Merkez',1),
 (572,54,'Altintas',0),
 (573,54,'Aslanapa',0),
 (574,54,'Cavdarhisar',0),
 (575,54,'Domaniç',0),
 (576,54,'Dumlupinar',0),
 (577,54,'Emet',0),
 (578,54,'Gediz',0),
 (579,54,'Hisarcik',0),
 (580,54,'Pazarlar',0),
 (581,54,'Simav',0),
 (582,54,'Saphane',0),
 (583,54,'Tavsanli',0),
 (584,55,'Merkez',1),
 (585,55,'Akçadag',0),
 (586,55,'Arapgir',0),
 (587,55,'Arguvan',0),
 (588,55,'Battalgazi',0),
 (589,55,'Darende',0),
 (590,55,'Dogansehir',0),
 (591,55,'Doganyol',0),
 (592,55,'Hekimhan',0),
 (593,55,'Kale',0),
 (594,55,'Kuluncak',0),
 (595,55,'Pötürge',0),
 (596,55,'Yazihan',0),
 (597,55,'Yesilyurt',0),
 (598,56,'Merkez',1),
 (599,56,'Ahmetli',0),
 (600,56,'Akhisar',0),
 (601,56,'Alasehir',0),
 (602,56,'Demirci',0),
 (603,56,'Gölmarmara',0),
 (604,56,'Gördes',0),
 (605,56,'Kirkagaç',0),
 (606,56,'Köprübasi',0),
 (607,56,'Kula',0),
 (608,56,'Salihli',0),
 (609,56,'Sarigöl',0),
 (610,56,'Saruhanli',0),
 (611,56,'Selendi',0),
 (612,56,'Soma',0),
 (613,56,'Turgutlu',0),
 (614,42,'Merkez',1),
 (615,42,'Afsin',0),
 (616,42,'Andirin',0),
 (617,42,'Çaglayancer',0),
 (618,42,'Ekinözü',0),
 (619,42,'Elbistan',0),
 (620,42,'Göksun',0),
 (621,42,'Nurhak',0),
 (622,42,'Pazarcik',0),
 (623,42,'Türkoglu',0),
 (624,57,'Merkez',1),
 (625,57,'Dargeçit',0),
 (626,57,'Derik',0),
 (627,57,'Kiziltepe',0),
 (628,57,'Mazidagi',0),
 (629,57,'Midyat',0),
 (630,57,'Nusaybin',0),
 (631,57,'Ömerli',0),
 (632,57,'Savur',0),
 (633,57,'Yesilli',0),
 (634,58,'Merkez',1),
 (635,58,'Bodrum',0),
 (636,58,'Dalaman',0),
 (637,58,'Datça',0),
 (638,58,'Fethiye',0),
 (639,58,'Kavaklidere',0),
 (640,58,'Köycegiz',0),
 (641,58,'Marmaris',0),
 (642,58,'Milas',0),
 (643,58,'Ortaca',0),
 (644,58,'Ula',0),
 (645,58,'Yatagan',0),
 (646,59,'Merkez',1),
 (647,59,'Bulanik',0),
 (648,59,'Hasköy',0),
 (649,59,'Korkut',0),
 (650,59,'Malazgirt',0),
 (651,59,'Varto',0),
 (652,60,'Merkez',1),
 (653,60,'Acigöl',0),
 (654,60,'Avanos',0),
 (655,60,'Derinkuyu',0),
 (656,60,'Gülsehir',0),
 (657,60,'Hacibektas',0),
 (658,60,'Kozakli',0),
 (659,60,'Ürgüp',0),
 (660,61,'Merkez',1),
 (661,61,'Altunhisar',0),
 (662,61,'Bor',0),
 (663,61,'Çamardi',0),
 (664,61,'Çiftlik',0),
 (665,61,'Ulukisla',0),
 (666,62,'Merkez',1),
 (667,62,'Akkus',0),
 (668,62,'Aybasti',0),
 (669,62,'Çamas',0),
 (670,62,'Çatalpinar',0),
 (671,62,'Çaybasi',0),
 (672,62,'Fatsa',0),
 (673,62,'Gölköy',0),
 (674,62,'Gölyali',0),
 (675,62,'Gürgentepe',0),
 (676,62,'Ikizce',0),
 (677,62,'Korgan',0),
 (678,62,'Kabadüz',0),
 (679,62,'Kabatas',0),
 (680,62,'Kumru',0),
 (681,62,'Mesudiye',0),
 (682,62,'Persembe',0),
 (683,62,'Ulubey',0),
 (684,62,'Ünye',0),
 (685,64,'Merkez',1),
 (686,64,'Ardesen',0),
 (687,64,'Çamlihemsin',0),
 (688,64,'Çayeli',0),
 (689,64,'Derepazari',0),
 (690,64,'Findikli',0),
 (691,64,'Güneysu',0),
 (692,64,'Hemsin',0),
 (693,64,'Ikizdere',0),
 (694,64,'Iyidere',0),
 (695,64,'Kalkandere',0),
 (696,64,'Pazar',0),
 (697,65,'Merkez',1),
 (698,65,'Akyazi',0),
 (699,65,'Ferizli',0),
 (700,65,'Geyve',0),
 (701,65,'Hendek',0),
 (702,65,'Karapürçek',0),
 (703,65,'Karasu',0),
 (704,65,'Kaynarca',0),
 (705,65,'Kocaali',0),
 (706,65,'Pamukova',0),
 (707,65,'Sapanca',0),
 (708,65,'Sögütlü',0),
 (709,65,'Tarakli',0),
 (710,66,'Merkez',1),
 (711,66,'Alaçam',0),
 (712,66,'Asarcik',0),
 (713,66,'Ayvacik',0),
 (714,66,'Bafra',0),
 (715,66,'Çarsamba',0),
 (716,66,'Havza',0),
 (717,66,'Kavak',0),
 (718,66,'Ladik',0),
 (719,66,'19mayis',0),
 (720,66,'Salipazari',0),
 (721,66,'Tekkeköy',0),
 (722,66,'Terme',0),
 (723,66,'Vezirköprü',0),
 (724,66,'Yakakent',0),
 (725,67,'Merkez',1),
 (726,67,'Aydinlar',0),
 (727,67,'Baykan',0),
 (728,67,'Eruh',0),
 (729,67,'Kozluk',0),
 (730,67,'Kurtalan',0),
 (731,67,'Pervari',0),
 (732,67,'Sirvan',0),
 (733,68,'Merkez',1),
 (734,68,'Ayancik',0),
 (735,68,'Boyabat',0),
 (736,68,'Dikmen',0),
 (737,68,'Duragan',0),
 (738,68,'Erfelek',0),
 (739,68,'Gerze',0),
 (740,68,'Saraydüzü',0),
 (741,68,'Türkeli',0),
 (742,69,'Merkez',1),
 (743,69,'Akincilar',0),
 (744,69,'Altinyayla',0),
 (745,69,'Divrigi',0),
 (746,69,'Dogansar',0),
 (747,69,'Gemerek',0),
 (748,69,'Gölova',0),
 (749,69,'Gürün',0),
 (750,69,'Hafik',0),
 (751,69,'Imranli',0),
 (752,69,'Kangal',0),
 (753,69,'Koyulhisar',0),
 (754,69,'Susehri',0),
 (755,69,'Sarkisla',0),
 (756,69,'Ulas',0),
 (757,69,'Yildizeli',0),
 (758,69,'Zara',0),
 (759,72,'Merkez',1),
 (760,72,'Çerkezköy',0),
 (761,72,'Çorlu',0),
 (762,72,'Hayrabolu',0),
 (763,72,'Malkara',0),
 (764,72,'Marmaraeregli',0),
 (765,72,'Muratli',0),
 (766,72,'Saray',0),
 (767,72,'Sarköy',0),
 (768,73,'Merkez',1),
 (769,73,'Almus',0),
 (770,73,'Artova',0),
 (771,73,'Basçiftlik',0),
 (772,73,'Erbaa',0),
 (773,73,'Niksar',0),
 (774,73,'Pazar',0),
 (775,73,'Resadiye',0),
 (776,73,'Sulusaray',0),
 (777,73,'Turhal',0),
 (778,73,'Yesilyurt',0),
 (779,73,'Zile',0),
 (780,74,'Merkez',1),
 (781,74,'Akçaabat',0),
 (782,74,'Arakli',0),
 (783,74,'Arsin',0),
 (784,74,'Besikdüzü',0),
 (785,74,'Çarsibasi',0),
 (786,74,'Çaykara',0),
 (787,74,'Dernekpazar',0),
 (788,74,'Düzköy',0),
 (789,74,'Hayrat',0),
 (790,74,'Köprübasi',0),
 (791,74,'Maçka',0),
 (792,74,'Of',0),
 (793,74,'Sürmene',0),
 (794,74,'Salpazari',0),
 (795,74,'Tonya',0),
 (796,74,'Vakfikebir',0),
 (797,74,'Yomra',0),
 (798,75,'Merkez',1),
 (799,75,'Çemisgezek',0),
 (800,75,'Hozat',0),
 (801,75,'Mazgirt',0),
 (802,75,'Nazimiye',0),
 (803,75,'Ovacik',0),
 (804,75,'Pertek',0),
 (805,75,'Pülümür',0),
 (806,70,'Merkez',1),
 (807,70,'Akçakale',0),
 (808,70,'Birecik',0),
 (809,70,'Bozova',0),
 (810,70,'Ceylanpinar',0),
 (811,70,'Halfeti',0),
 (812,70,'Harran',0),
 (813,70,'Hilvan',0),
 (814,70,'Siverek',0),
 (815,70,'Suruç',0),
 (816,70,'Viransehir',0),
 (817,76,'Merkez',1),
 (818,76,'Banaz',0),
 (819,76,'Esme',0),
 (820,76,'Karahalli',0),
 (821,76,'Sivasli',0),
 (822,76,'Ulubey',0),
 (823,77,'Merkez',1),
 (824,77,'Bahçesaray',0),
 (825,77,'Baskale',0),
 (826,77,'Çaldiran',0),
 (827,77,'Çatak',0),
 (828,77,'Edremit',0),
 (829,77,'Ercis',0),
 (830,77,'Gevas',0),
 (831,77,'Gürpinar',0),
 (832,77,'Muradiye',0),
 (833,77,'Özalp',0),
 (834,77,'Saray',0),
 (835,79,'Merkez',1),
 (836,79,'Akdagmadeni',0),
 (837,79,'Aydincik',0),
 (838,79,'Bogazliyan',0),
 (839,79,'Çandir',0),
 (840,79,'Çayiralan',0),
 (841,79,'Çekerek',0),
 (842,79,'Kadisehri',0),
 (843,79,'Sarikaya',0),
 (844,79,'Saraykent',0),
 (845,79,'Sorgun',0),
 (846,79,'Sefaatli',0),
 (847,79,'Yenifakili',0),
 (848,79,'Yerköy',0),
 (849,80,'Merkez',1),
 (850,80,'Alapli',0),
 (851,80,'Çamoluk',0),
 (852,80,'Çaycuma',0),
 (853,80,'Devrek',0),
 (854,80,'Eflani',0),
 (855,80,'Eregli',0),
 (856,80,'Gökçebey',0),
 (857,4,'Merkez',1),
 (858,4,'Agaçören',0),
 (859,4,'Eskil',0),
 (860,4,'Gülagaç',0),
 (861,4,'Güzelyurt',0),
 (862,4,'Ortaköy',0),
 (863,4,'Sariyahsi',0),
 (864,14,'Merkez',1),
 (865,14,'Aydintepe',0),
 (866,14,'Demirözü',0),
 (867,44,'Merkez',1),
 (868,44,'Ayranci',0),
 (869,44,'Basyayla',0),
 (870,44,'Ermenek',0),
 (871,44,'Kazimkarabekir',0),
 (872,44,'Sariveliler',0),
 (873,49,'Merkez',1),
 (874,49,'Bahsili',0),
 (875,49,'Bagliseyh',0),
 (876,49,'Çelebi',0),
 (877,49,'Delice',0),
 (878,49,'Karakeçili',0),
 (879,49,'Keskin',0),
 (880,49,'Sulakyurt',0),
 (881,49,'Yahsihan',0),
 (882,13,'Merkez',1),
 (883,13,'Gercüs',0),
 (884,13,'Hasankeyf',0),
 (885,13,'Besiri',0),
 (886,13,'Kozluk',0),
 (887,13,'Sason',0),
 (888,71,'Merkez',1),
 (889,71,'Beytüsseba',0),
 (890,71,'Uludere',0),
 (891,71,'Cizre',0),
 (892,71,'Idil',0),
 (893,71,'Silopi',0),
 (894,71,'Güçlükonak',0),
 (895,12,'Merkez',1),
 (896,12,'Amasra',0),
 (897,12,'Kurucasile',0),
 (898,12,'Ulus',0),
 (899,8,'Merkez',1),
 (900,8,'Çildir',0),
 (901,8,'Damal',0),
 (902,8,'Göle',0),
 (903,8,'Hanak',0),
 (904,8,'Posof',0),
 (905,37,'Merkez',1),
 (906,37,'Aralik',0),
 (907,37,'Karakoyunlu',0),
 (908,37,'Tuzluca',0),
 (909,78,'Merkez',1),
 (910,78,'Altinova',0),
 (911,78,'Armutlu',0),
 (912,78,'Cinarcik',0),
 (913,78,'Ciftlikkoy',0),
 (914,78,'Termal',0),
 (915,43,'Merkez',1),
 (916,43,'Eflani',0),
 (917,43,'Eskipazar',0),
 (918,43,'Ovacik',0),
 (919,43,'Safranbolu',0),
 (920,43,'Yenice',0),
 (921,48,'Merkez',1),
 (922,48,'Elbeyli',0),
 (923,48,'Musabeyli',0),
 (924,48,'Polateli',0),
 (925,63,'Merkez',1),
 (926,63,'Bahçe',0),
 (927,63,'Hasanbeyli',0),
 (928,63,'Düziçi',0),
 (929,63,'Kadirli',0),
 (930,63,'Sunbas',0),
 (931,63,'Toprakkale',0),
 (932,26,'Merkez',1),
 (933,26,'Akçakoca',0),
 (934,26,'Cumayeri',0),
 (935,26,'Çilimli',0),
 (936,26,'Gölyaka',0),
 (937,26,'Gümüsova',0),
 (938,26,'Kaynasli',0),
 (939,26,'Yigilca',0),
 (940,82,'Ataşehir',0),
 (941,82,'Çekmeköy',0),
 (942,82,'Sancaktepe',0),
 (943,83,'Arnavutköy',0),
 (944,83,'Avcılar',0),
 (945,83,'Bağcılar',0),
 (946,83,'Bahçelievler',0),
 (947,83,'Bakırköy',0),
 (948,83,'Başakşehir',0),
 (949,83,'Bayrampaşa',0),
 (950,83,'Beşiktaş',0),
 (951,83,'Beylikdüzü',0),
 (952,83,'Beyoğlu',0),
 (953,83,'Büyükçekmece',0),
 (954,83,'Çatalca',0),
 (955,83,'Esenler',0),
 (956,83,'Esenyurt',0),
 (957,83,'Eyüp',0),
 (958,83,'Fatih',0),
 (959,83,'Gaziosmanpaşa',0),
 (960,83,'Güngören',0),
 (961,83,'Kağıthane',0),
 (962,83,'Küçükçekmece',0),
 (963,83,'Sarıyer',0),
 (964,83,'Silivri',0),
 (965,83,'Sultangazi',0),
 (966,83,'Şişli',0),
 (967,83,'Zeytinburnu',0);
/*!40000 ALTER TABLE `tbl_sbt_ulke_ilce` ENABLE KEYS */;


--
-- Definition of table `tbl_scriptler`
--

DROP TABLE IF EXISTS `tbl_scriptler`;
CREATE TABLE `tbl_scriptler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL DEFAULT '-1',
  `baslik` varchar(255) NOT NULL DEFAULT '',
  `script` longtext NOT NULL,
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `menu_id` (`menu_id`),
  KEY `onay` (`onay`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_scriptler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_scriptler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_scriptler_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `tbl_menuler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_scriptler`
--

/*!40000 ALTER TABLE `tbl_scriptler` DISABLE KEYS */;
INSERT INTO `tbl_scriptler` (`id`,`menu_id`,`baslik`,`script`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,3,'SCRIPT 1','<script>alert(0)</script>',0,999,'2012-03-05 00:53:10',999,'2012-03-12 03:08:24'),
 (2,2,'deneme','<script>alert(1)</script>',0,999,'2012-03-05 01:07:52',999,'2012-03-12 03:08:24'),
 (3,4,'deneme','<script>alert(9)</script>',0,999,'2012-03-12 02:37:59',999,'2012-03-12 03:08:24'),
 (5,1,'a','<script>alert(4)</script>',0,999,'2012-04-18 02:09:08',999,'2012-04-18 02:09:16');
/*!40000 ALTER TABLE `tbl_scriptler` ENABLE KEYS */;


--
-- Definition of trigger `trg_scriptler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_scriptler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_scriptler_ek` BEFORE INSERT ON `tbl_scriptler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_scriptler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_scriptler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_scriptler_gun` BEFORE UPDATE ON `tbl_scriptler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_sepetler`
--

DROP TABLE IF EXISTS `tbl_sepetler`;
CREATE TABLE `tbl_sepetler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(128) NOT NULL DEFAULT '',
  `kullanici_id` int(11) NOT NULL DEFAULT '-1',
  `urun_id` int(11) NOT NULL DEFAULT '-1',
  `adet` int(11) NOT NULL DEFAULT '1',
  `durum` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 pasif, 1 aktif',
  `tarih` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `urun_id` (`urun_id`),
  KEY `adet` (`adet`),
  KEY `session_id` (`session_id`),
  KEY `tarih` (`tarih`),
  KEY `kullanici_id` (`kullanici_id`),
  KEY `durum` (`durum`),
  CONSTRAINT `fk_sepetler_kullanici_id` FOREIGN KEY (`kullanici_id`) REFERENCES `tbl_kullanicilar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sepetler_urun_id` FOREIGN KEY (`urun_id`) REFERENCES `tbl_urunler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sepetler`
--

/*!40000 ALTER TABLE `tbl_sepetler` DISABLE KEYS */;
INSERT INTO `tbl_sepetler` (`id`,`session_id`,`kullanici_id`,`urun_id`,`adet`,`durum`,`tarih`) VALUES 
 (48,'1lrjuoxqqw3qhnnkp0qunbkl',1,34,1,1,'2012-04-29 03:52:16'),
 (49,'1lrjuoxqqw3qhnnkp0qunbkl',1,35,1,1,'2012-04-29 03:52:18'),
 (50,'1lrjuoxqqw3qhnnkp0qunbkl',1,41,1,1,'2012-04-29 03:52:22'),
 (51,'1lrjuoxqqw3qhnnkp0qunbkl',1,38,1,1,'2012-04-29 03:52:25'),
 (52,'1lrjuoxqqw3qhnnkp0qunbkl',1,42,1,1,'2012-04-29 03:52:30'),
 (53,'1lrjuoxqqw3qhnnkp0qunbkl',1,38,1,1,'2012-04-29 04:02:36'),
 (54,'1lrjuoxqqw3qhnnkp0qunbkl',1,34,1,1,'2012-04-29 04:04:07'),
 (55,'1lrjuoxqqw3qhnnkp0qunbkl',1,35,1,1,'2012-04-29 04:04:13'),
 (56,'njy1vgpvzhyfrurvoglt1f0l',1,41,1,1,'2012-04-29 22:27:17'),
 (57,'njy1vgpvzhyfrurvoglt1f0l',1,35,1,1,'2012-04-30 01:12:53'),
 (58,'njy1vgpvzhyfrurvoglt1f0l',1,35,1,1,'2012-04-30 01:32:25'),
 (59,'ahxg5xx4t0urylmfmi1zywx1',1,35,1,1,'2012-04-30 10:32:26'),
 (60,'ahxg5xx4t0urylmfmi1zywx1',1,41,1,1,'2012-04-30 13:17:51'),
 (61,'ahxg5xx4t0urylmfmi1zywx1',1,44,1,1,'2012-04-30 13:20:38'),
 (62,'ahxg5xx4t0urylmfmi1zywx1',1,44,1,1,'2012-04-30 13:56:10'),
 (63,'wjimmpcznv4ff1fok5dwzvak',1,35,1,1,'2012-05-02 01:39:18'),
 (64,'esnbal2oqhqqmsywgpsuhxb2',1,44,1,1,'2012-05-02 13:23:11'),
 (66,'2xcoj5qosddaj20iqb24wfjs',1,35,1,1,'2012-05-02 20:52:18'),
 (67,'ydsa0xdaami5bhxy4dry211l',1,35,1,1,'2012-05-03 22:22:51'),
 (72,'vzh4peywlksyr14npbo2uodn',1,34,5,1,'2012-05-06 10:50:12'),
 (73,'sft1rq15pulgkkcrcaq0o42t',1,35,5,1,'2012-05-06 17:02:30'),
 (74,'sft1rq15pulgkkcrcaq0o42t',1,35,1,1,'2012-05-06 17:43:59'),
 (75,'sft1rq15pulgkkcrcaq0o42t',1,35,1,1,'2012-05-06 18:07:13'),
 (76,'sft1rq15pulgkkcrcaq0o42t',1,35,1,1,'2012-05-06 18:20:23'),
 (77,'sft1rq15pulgkkcrcaq0o42t',11,35,1,1,'2012-05-06 18:33:18'),
 (78,'sft1rq15pulgkkcrcaq0o42t',11,35,1,1,'2012-05-06 18:44:09'),
 (79,'sft1rq15pulgkkcrcaq0o42t',11,34,1,1,'2012-05-06 18:52:12'),
 (80,'sft1rq15pulgkkcrcaq0o42t',1,35,1,1,'2012-05-06 18:55:57'),
 (81,'sft1rq15pulgkkcrcaq0o42t',1,35,1,1,'2012-05-07 01:20:07'),
 (82,'gdq30hwaz3tr01zpz12x5ilz',1,35,1,1,'2012-05-07 13:38:32'),
 (83,'oocfbdtmw1mr2v0f51duirtq',1,35,1,1,'2012-05-11 00:19:57'),
 (84,'y4lfsrp4zkerxv53ptrdmons',1,58,2,1,'2012-07-05 23:44:26'),
 (85,'0g2on4dbadgyptqkgrjzhyx2',1,35,1,1,'2012-07-05 23:44:37'),
 (86,'0g2on4dbadgyptqkgrjzhyx2',1,38,1,1,'2012-07-05 23:44:47'),
 (87,'gfou4hbtsetv0hieukbju0sw',1,58,2,0,'2012-07-06 12:22:59'),
 (88,'gfou4hbtsetv0hieukbju0sw',1,55,1,0,'2012-07-06 12:23:06'),
 (89,'gfou4hbtsetv0hieukbju0sw',1,34,1,0,'2012-07-06 12:23:13');
/*!40000 ALTER TABLE `tbl_sepetler` ENABLE KEYS */;


--
-- Definition of trigger `trg_sepetler`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_sepetler`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_sepetler` BEFORE INSERT ON `tbl_sepetler` FOR EACH ROW BEGIN
SET NEW.tarih = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_siparis_durumlar`
--

DROP TABLE IF EXISTS `tbl_siparis_durumlar`;
CREATE TABLE `tbl_siparis_durumlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dil_id` int(11) NOT NULL DEFAULT '-1',
  `siparis_durum_id` int(11) NOT NULL DEFAULT '-1',
  `text` varchar(255) NOT NULL,
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `dil_id` (`dil_id`),
  KEY `sabitler_id` (`siparis_durum_id`),
  KEY `onay` (`onay`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_siparis_durumlar_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparis_durumlar_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparis_durumlar_dil_id` FOREIGN KEY (`dil_id`) REFERENCES `tbl_diller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparis_durumlar_siparis_durum_id` FOREIGN KEY (`siparis_durum_id`) REFERENCES `tbl_sbt_siparis_durum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_siparis_durumlar`
--

/*!40000 ALTER TABLE `tbl_siparis_durumlar` DISABLE KEYS */;
INSERT INTO `tbl_siparis_durumlar` (`id`,`dil_id`,`siparis_durum_id`,`text`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (10,999,10,'ALICI BULUNAMADI. SİPARİŞ İPTAL EDİLDİ.',1,999,'2012-03-26 01:14:01',NULL,NULL),
 (11,999,1,'HAZIRLANIYOR.',1,999,'2012-03-26 01:14:01',NULL,'2012-03-26 01:30:23'),
 (22,999,2,'ÖDEME BEKLENİYOR.',1,999,'2012-03-26 01:14:01',NULL,'2012-03-26 01:30:24'),
 (33,999,3,'ÖDEME TAMAMLANDI. ÜRÜN(LER) TEDARİK SÜRECİNDE.',1,999,'2012-03-26 01:14:01',NULL,'2012-03-26 01:30:25'),
 (44,999,4,'TAŞIMA (KARGO) FİRMASINA VERİLDİ.',1,999,'2012-03-26 01:14:01',NULL,'2012-03-26 01:30:28'),
 (55,999,5,'ÜRÜN(LER) TESLİM EDİLDİ.',1,999,'2012-03-26 01:14:01',NULL,'2012-03-26 01:30:31'),
 (66,999,6,'ÖDEME GERÇEKLEŞMEDİ. SİPARİŞ İPTAL EDİLDİ.',1,999,'2012-03-26 01:14:01',NULL,'2012-03-26 01:30:32'),
 (77,999,7,'ADRES BİLGİSİ YANLIŞ. SİPARİŞ İPTAL EDİLDİ.',1,999,'2012-03-26 01:14:01',NULL,'2012-03-26 01:30:33'),
 (88,999,8,'KARGO TESLİM EDİLEMEDİ. ÜRÜN(LER) GERİ GELDİ.',1,999,'2012-03-26 01:14:01',NULL,'2012-03-26 01:30:34'),
 (99,999,9,'SİPARİŞ YENİDEN KARGOYA VERİLDİ.',1,999,'2012-03-26 01:14:01',NULL,'2012-03-26 01:30:35');
/*!40000 ALTER TABLE `tbl_siparis_durumlar` ENABLE KEYS */;


--
-- Definition of trigger `trg_siparis_durumlar_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_siparis_durumlar_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_siparis_durumlar_ek` BEFORE INSERT ON `tbl_siparis_durumlar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_siparis_durumlar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_siparis_durumlar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_siparis_durumlar_gun` BEFORE UPDATE ON `tbl_siparis_durumlar` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_siparisler`
--

DROP TABLE IF EXISTS `tbl_siparisler`;
CREATE TABLE `tbl_siparisler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kullanici_id` int(11) NOT NULL DEFAULT '-1',
  `no` varchar(20) DEFAULT '',
  `kargo_adres_id` int(11) NOT NULL DEFAULT '-1',
  `fatura_adres_id` int(11) NOT NULL DEFAULT '-1',
  `vergi_bilgileri_id` int(11) DEFAULT '-1',
  `tutar` double(11,5) DEFAULT NULL,
  `indirim_id` int(11) DEFAULT NULL,
  `indirim_tutar` double(11,5) DEFAULT NULL,
  `indirimli_tutar` double(11,5) DEFAULT NULL,
  `kdv_tutar` double(11,5) DEFAULT NULL,
  `kargo_tutar` double(11,5) DEFAULT NULL,
  `toplam_tutar` double(11,5) DEFAULT NULL,
  `para_birimi_id` int(11) NOT NULL DEFAULT '-1',
  `odeme_sekli_id` int(11) NOT NULL DEFAULT '-1',
  `kur_tarih` date DEFAULT NULL,
  `tarih` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `kullanici_id` (`kullanici_id`),
  KEY `odeme_sekli_id` (`odeme_sekli_id`),
  KEY `indirim_id` (`indirim_id`),
  KEY `para_birimi_id` (`para_birimi_id`),
  KEY `tarih_ek` (`tarih`),
  KEY `no` (`no`),
  KEY `tutar` (`tutar`),
  KEY `toplam_tutar` (`toplam_tutar`),
  KEY `indirim_tutar` (`indirim_tutar`),
  KEY `kdv_tutar` (`kdv_tutar`),
  KEY `kargo_tutar` (`kargo_tutar`),
  KEY `fatura_adres_id` (`fatura_adres_id`),
  KEY `kargo_adres_id` (`kargo_adres_id`),
  KEY `vergi_bilgileri_id` (`vergi_bilgileri_id`),
  CONSTRAINT `fk_siparisler_fatura_adres_id` FOREIGN KEY (`fatura_adres_id`) REFERENCES `tbl_cpy_siparisler_kullanicilar_adresler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_indirim_id` FOREIGN KEY (`indirim_id`) REFERENCES `tbl_cpy_siparisler_indirimler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_kargo_adres_id` FOREIGN KEY (`kargo_adres_id`) REFERENCES `tbl_cpy_siparisler_kullanicilar_adresler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_kullanici_id` FOREIGN KEY (`kullanici_id`) REFERENCES `tbl_kullanicilar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_odeme_sekli_id` FOREIGN KEY (`odeme_sekli_id`) REFERENCES `tbl_sbt_odeme_sekli` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_para_birimi_id` FOREIGN KEY (`para_birimi_id`) REFERENCES `tbl_sbt_para_birim` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_vergi_bilgileri_id` FOREIGN KEY (`vergi_bilgileri_id`) REFERENCES `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_siparisler`
--

/*!40000 ALTER TABLE `tbl_siparisler` DISABLE KEYS */;
INSERT INTO `tbl_siparisler` (`id`,`kullanici_id`,`no`,`kargo_adres_id`,`fatura_adres_id`,`vergi_bilgileri_id`,`tutar`,`indirim_id`,`indirim_tutar`,`indirimli_tutar`,`kdv_tutar`,`kargo_tutar`,`toplam_tutar`,`para_birimi_id`,`odeme_sekli_id`,`kur_tarih`,`tarih`) VALUES 
 (14,1,'1',58,59,32,4964.39000,NULL,0.00000,0.00000,893.60000,221.00000,6078.99000,1,1,'2012-04-27','2012-04-29 03:57:47'),
 (15,1,'290412-1-15',60,61,33,452.40000,NULL,0.00000,0.00000,81.43000,0.00000,533.83000,1,1,'2012-04-27','2012-04-29 04:03:44'),
 (16,1,'290412-1-16',62,63,34,2120.70000,NULL,0.00000,0.00000,381.73000,221.00000,2723.43000,1,1,'2012-04-27','2012-04-29 04:04:55'),
 (17,1,'300412-1-17',64,65,35,1538.29000,NULL,0.00000,0.00000,276.90000,0.00000,1815.19000,1,2,'2012-04-27','2012-04-30 01:12:07'),
 (18,1,'300412-1-18',66,67,36,1466.70000,NULL,0.00000,0.00000,264.01000,21.00000,1751.71000,1,2,'2012-04-27','2012-04-30 01:32:01'),
 (19,1,'300412-1-19',68,69,37,1466.70000,NULL,0.00000,0.00000,264.01000,21.00000,1751.71000,1,2,'2012-04-27','2012-04-30 01:33:35'),
 (20,1,'300412-1-20',70,71,38,1466.70000,NULL,0.00000,0.00000,264.01000,21.00000,1751.71000,1,1,'2012-04-27','2012-04-30 13:16:24'),
 (21,1,'300412-1-21',72,73,39,1538.29000,NULL,0.00000,0.00000,276.90000,0.00000,1815.19000,1,2,'2012-04-27','2012-04-30 13:18:49'),
 (22,1,'300412-1-22',74,75,40,1538.29000,NULL,0.00000,0.00000,276.90000,0.00000,1815.19000,1,2,'2012-04-27','2012-04-30 13:20:09'),
 (23,1,'300412-1-23',76,77,41,143.64000,NULL,0.00000,0.00000,25.86000,0.00000,169.50000,1,2,'2012-04-27','2012-04-30 13:21:28'),
 (24,1,'300412-1-24',78,79,42,143.64000,NULL,0.00000,0.00000,25.86000,0.00000,169.50000,1,2,'2012-04-27','2012-04-30 13:57:12'),
 (25,1,'020512-1-25',80,81,42,1462.85000,NULL,0.00000,0.00000,263.31000,21.00000,1747.16000,1,2,'2012-04-30','2012-05-02 13:20:51'),
 (26,1,'020512-1-26',82,83,42,143.64000,NULL,0.00000,0.00000,25.86000,0.00000,169.50000,1,2,'2012-04-30','2012-05-02 13:28:01'),
 (27,1,'030512-1-27',84,85,42,1465.02000,NULL,0.00000,0.00000,263.71000,21.00000,1749.73000,1,1,'2012-05-02','2012-05-03 00:22:12'),
 (28,1,'050512-1-28',86,87,42,1462.35000,NULL,0.00000,0.00000,263.22000,21.00000,1746.57000,1,2,'2012-05-04','2012-05-05 00:41:38'),
 (29,1,'060512-1-29',88,89,42,3270.00000,NULL,0.00000,0.00000,588.60000,2700.00000,6558.60000,1,2,'2012-05-04','2012-05-06 16:49:11'),
 (30,1,'060512-1-30',90,91,42,7311.74000,NULL,0.00000,0.00000,1316.12000,2702.50000,11330.36000,1,2,'2012-05-04','2012-05-06 17:03:55'),
 (31,1,'060512-1-31',92,93,42,1462.35000,NULL,0.00000,0.00000,263.22000,285.00000,2010.57000,1,2,'2012-05-04','2012-05-06 17:44:56'),
 (32,1,'060512-1-32',94,95,42,1462.35000,NULL,0.00000,0.00000,263.22000,285.00000,2010.57000,1,2,'2012-05-04','2012-05-06 18:08:09'),
 (33,11,'060512-1-33',96,97,51,1462.35000,NULL,0.00000,0.00000,263.22000,285.00000,2010.57000,1,1,'2012-05-04','2012-05-06 18:36:47'),
 (34,11,'060512-11-34',98,99,52,1462.35000,NULL,0.00000,0.00000,263.22000,285.00000,2010.57000,1,1,'2012-05-04','2012-05-06 18:44:49'),
 (35,11,'060512-11-35',100,101,53,654.00000,NULL,0.00000,0.00000,117.72000,140.00000,911.72000,1,2,'2012-05-04','2012-05-06 18:53:06'),
 (36,1,'060512-11-36',102,103,42,1462.35000,NULL,0.00000,0.00000,263.22000,285.00000,2010.57000,1,1,'2012-05-04','2012-05-06 18:55:32'),
 (37,1,'060512-1-37',104,105,42,1462.35000,NULL,0.00000,0.00000,263.22000,285.00000,2010.57000,1,2,'2012-05-04','2012-05-06 18:56:55'),
 (38,1,'070512-1-38',106,107,42,1462.35000,NULL,0.00000,0.00000,263.22000,285.00000,2010.57000,1,1,'2012-05-04','2012-05-07 13:27:22'),
 (39,1,'080512-1-39',108,109,42,1469.37000,NULL,0.00000,0.00000,264.49000,285.00000,2018.86000,1,1,'2012-05-07','2012-05-08 09:51:08'),
 (40,1,'200512-1-40',110,111,58,1525.33000,NULL,0.00000,0.00000,274.56000,285.00000,2084.89000,1,1,'2012-05-18','2012-05-20 13:35:00'),
 (41,1,'050712-1-41',112,113,59,2967.49000,NULL,0.00000,0.00000,534.15000,12.00000,3513.64000,1,1,'2012-07-05','2012-07-05 23:45:28');
/*!40000 ALTER TABLE `tbl_siparisler` ENABLE KEYS */;


--
-- Definition of trigger `trg_siparisler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_siparisler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_siparisler_ek` BEFORE INSERT ON `tbl_siparisler` FOR EACH ROW BEGIN
SET NEW.tarih = NOW();
SET NEW.no = (SELECT IF(MAX(id)<=>null,1,CONCAT(DATE_FORMAT(CURDATE(),'%d%m%y'),'-',(SELECT kullanici_id FROM tbl_siparisler USE INDEX(id) WHERE id=(SELECT MAX(id) FROM tbl_siparisler USE INDEX(id))),'-',MAX(id)+1)) FROM tbl_siparisler USE INDEX (id));
END $$

DELIMITER ;

--
-- Definition of table `tbl_siparisler_durumlar`
--

DROP TABLE IF EXISTS `tbl_siparisler_durumlar`;
CREATE TABLE `tbl_siparisler_durumlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kullanici_id` int(11) NOT NULL DEFAULT '-1',
  `siparis_id` int(11) NOT NULL DEFAULT '-1',
  `siparis_durum_id` int(11) NOT NULL DEFAULT '-1',
  `tarih` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen Admin',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `kullanici_id` (`kullanici_id`),
  KEY `tarih_ek` (`tarih`),
  KEY `siparis_durum_id` (`siparis_durum_id`),
  KEY `siparis_id` (`siparis_id`),
  KEY `admin_id_ek` (`admin_id_ek`),
  CONSTRAINT `fk_siparisler_durumlar_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_durumlar_kullanici_id` FOREIGN KEY (`kullanici_id`) REFERENCES `tbl_kullanicilar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_durumlar_siparis_durum_id` FOREIGN KEY (`siparis_durum_id`) REFERENCES `tbl_sbt_siparis_durum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_durumlar_siparis_siparis_id` FOREIGN KEY (`siparis_id`) REFERENCES `tbl_siparisler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_siparisler_durumlar`
--

/*!40000 ALTER TABLE `tbl_siparisler_durumlar` DISABLE KEYS */;
INSERT INTO `tbl_siparisler_durumlar` (`id`,`kullanici_id`,`siparis_id`,`siparis_durum_id`,`tarih`,`admin_id_ek`) VALUES 
 (1,1,15,2,'2012-07-06 01:06:27',NULL),
 (2,1,15,3,'2012-07-06 01:06:47',999);
/*!40000 ALTER TABLE `tbl_siparisler_durumlar` ENABLE KEYS */;


--
-- Definition of trigger `trg_siparisler_durumlar_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_siparisler_durumlar_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_siparisler_durumlar_ek` BEFORE INSERT ON `tbl_siparisler_durumlar` FOR EACH ROW BEGIN
SET NEW.tarih = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_siparisler_gonderimler`
--

DROP TABLE IF EXISTS `tbl_siparisler_gonderimler`;
CREATE TABLE `tbl_siparisler_gonderimler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siparis_id` int(11) DEFAULT '-1',
  `kargo_id` int(11) NOT NULL DEFAULT '-1',
  `takip_no` varchar(255) DEFAULT NULL,
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `urun_id` (`takip_no`),
  KEY `siparis_id` (`siparis_id`),
  KEY `kargo_id` (`kargo_id`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_siparisler_gonderimler_admin_id_ek` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_gonderimler_admin_id_gun` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_gonderimler_kargo_id` FOREIGN KEY (`kargo_id`) REFERENCES `tbl_sbt_kargo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_gonderimler_siparis_id` FOREIGN KEY (`siparis_id`) REFERENCES `tbl_siparisler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_siparisler_gonderimler`
--

/*!40000 ALTER TABLE `tbl_siparisler_gonderimler` DISABLE KEYS */;
INSERT INTO `tbl_siparisler_gonderimler` (`id`,`siparis_id`,`kargo_id`,`takip_no`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (6,14,1,NULL,NULL,'2012-04-29 03:57:48',NULL,NULL),
 (7,15,1,NULL,NULL,'2012-04-29 04:03:44',NULL,NULL),
 (8,16,1,NULL,NULL,'2012-04-29 04:04:56',NULL,NULL),
 (9,20,3,NULL,NULL,'2012-04-30 13:16:25',NULL,NULL),
 (10,22,1,NULL,NULL,'2012-04-30 13:20:10',NULL,NULL),
 (11,23,3,NULL,NULL,'2012-04-30 13:21:28',NULL,NULL),
 (12,24,1,NULL,NULL,'2012-04-30 13:57:12',NULL,NULL),
 (13,25,2,NULL,NULL,'2012-05-02 13:20:52',NULL,NULL),
 (14,27,1,NULL,NULL,'2012-05-03 00:22:13',NULL,NULL),
 (15,28,1,NULL,NULL,'2012-05-05 00:41:39',NULL,NULL),
 (16,29,1,NULL,NULL,'2012-05-06 16:49:12',NULL,NULL),
 (17,30,1,NULL,NULL,'2012-05-06 17:03:55',NULL,NULL),
 (18,31,1,NULL,NULL,'2012-05-06 17:44:57',NULL,NULL),
 (19,32,1,NULL,NULL,'2012-05-06 18:08:09',NULL,NULL),
 (20,33,1,NULL,NULL,'2012-05-06 18:36:47',NULL,NULL),
 (21,34,1,NULL,NULL,'2012-05-06 18:44:49',NULL,NULL),
 (22,35,1,NULL,NULL,'2012-05-06 18:53:06',NULL,NULL),
 (23,36,1,NULL,NULL,'2012-05-06 18:55:33',NULL,NULL),
 (24,37,1,NULL,NULL,'2012-05-06 18:56:55',NULL,NULL),
 (25,38,1,NULL,NULL,'2012-05-07 13:27:24',NULL,NULL),
 (26,39,3,NULL,NULL,'2012-05-08 09:51:09',NULL,NULL),
 (27,40,1,NULL,NULL,'2012-05-20 13:35:02',NULL,NULL),
 (28,41,1,NULL,NULL,'2012-07-05 23:45:29',NULL,NULL),
 (29,41,1,NULL,NULL,'2012-07-06 13:20:16',NULL,NULL),
 (30,41,1,NULL,NULL,'2012-07-06 13:28:04',NULL,NULL),
 (31,41,1,NULL,NULL,'2012-07-06 14:46:47',NULL,NULL);
/*!40000 ALTER TABLE `tbl_siparisler_gonderimler` ENABLE KEYS */;


--
-- Definition of trigger `trg_siparisler_gonderimler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_siparisler_gonderimler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_siparisler_gonderimler_ek` BEFORE INSERT ON `tbl_siparisler_gonderimler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_siparisler_gonderimler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_siparisler_gonderimler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_siparisler_gonderimler_gun` BEFORE UPDATE ON `tbl_siparisler_gonderimler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_siparisler_odemeler_kk`
--

DROP TABLE IF EXISTS `tbl_siparisler_odemeler_kk`;
CREATE TABLE `tbl_siparisler_odemeler_kk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kullanici_id` int(11) NOT NULL DEFAULT '-1',
  `siparis_id` int(11) DEFAULT '-1',
  `banka_id` int(11) NOT NULL DEFAULT '-1',
  `sanal_pos_id` int(11) NOT NULL DEFAULT '-1',
  `ad_soyad` varchar(255) DEFAULT NULL,
  `kart_no` varchar(255) DEFAULT NULL,
  `son_kullanim` varchar(255) DEFAULT NULL,
  `kredi_karti_oranlar_id` int(11) DEFAULT '-1',
  `komisyon_tutar` double(11,5) DEFAULT NULL,
  `toplam_tutar` double(11,5) DEFAULT NULL,
  `para_birimi_id` int(11) NOT NULL DEFAULT '-1',
  `tarih` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `siparis_id` (`siparis_id`),
  KEY `tarih` (`tarih`),
  KEY `kullanici_id` (`kullanici_id`),
  KEY `kredi_karti_oranlar_id` (`kredi_karti_oranlar_id`),
  KEY `komisyon_tutar` (`komisyon_tutar`),
  KEY `toplam_tutar` (`toplam_tutar`),
  KEY `para_birimi_id` (`para_birimi_id`),
  KEY `sanal_pos_id` (`sanal_pos_id`),
  KEY `banka_id` (`banka_id`) USING BTREE,
  CONSTRAINT `fk_siparisler_odemeler_kk_banka_id` FOREIGN KEY (`banka_id`) REFERENCES `tbl_sbt_banka` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_odemeler_kk_kullanici_id` FOREIGN KEY (`kullanici_id`) REFERENCES `tbl_kullanicilar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_odemeler_kk_oranlar_id` FOREIGN KEY (`kredi_karti_oranlar_id`) REFERENCES `tbl_cpy_siparisler_kredi_karti_oranlar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_odemeler_kk_para_birimi_id` FOREIGN KEY (`para_birimi_id`) REFERENCES `tbl_sbt_para_birim` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_odemeler_kk_sanal_pos_id` FOREIGN KEY (`sanal_pos_id`) REFERENCES `tbl_sbt_sanal_pos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_odemeler_kk_siparis_id` FOREIGN KEY (`siparis_id`) REFERENCES `tbl_siparisler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_siparisler_odemeler_kk`
--

/*!40000 ALTER TABLE `tbl_siparisler_odemeler_kk` DISABLE KEYS */;
INSERT INTO `tbl_siparisler_odemeler_kk` (`id`,`kullanici_id`,`siparis_id`,`banka_id`,`sanal_pos_id`,`ad_soyad`,`kart_no`,`son_kullanim`,`kredi_karti_oranlar_id`,`komisyon_tutar`,`toplam_tutar`,`para_birimi_id`,`tarih`) VALUES 
 (3,1,22,1,1,'Hüseyin Yıldırım','1111111111111111','01/2011',3,NULL,1815.19000,1,'2012-04-30 13:20:10'),
 (4,1,23,1,1,'Hüseyin Yıldırım','1111111111111111','02/2015',4,NULL,169.50000,1,'2012-04-30 13:21:28'),
 (5,1,24,1,1,'Hüseyin Yıldırım','1111111111111111','01/2011',5,10.17000,179.67000,1,'2012-04-30 13:57:12'),
 (6,1,25,1,1,'Hüseyin Yıldırım','1111111111111111','01/2014',6,157.24440,1904.40440,1,'2012-05-02 13:20:52'),
 (7,1,28,1,1,'Hüseyin Yıldırım','1111111111111111','02/2014',7,52.39710,1798.96710,1,'2012-05-05 00:41:39'),
 (8,1,29,1,1,'Hüseyin Yıldırım','1111111111111111','02/2013',8,65.58600,6624.18600,1,'2012-05-06 16:49:12'),
 (9,1,30,1,1,'Hüseyin Yıldırım','1111111111111111','02/2014',9,113.30360,11443.66360,1,'2012-05-06 17:03:55'),
 (10,1,31,1,1,'Hüseyin Yıldırım','1111111111111111','03/2014',10,20.10570,2030.67570,1,'2012-05-06 17:44:57'),
 (11,1,32,1,1,'Hüseyin Yıldırım','1111111111111111','02/2013',11,40.21140,2050.78140,1,'2012-05-06 18:08:09'),
 (12,11,35,1,1,'Hüseyin Yıldırım','1111111111111111','03/2013',12,9.11720,920.83720,1,'2012-05-06 18:53:06'),
 (13,1,37,1,1,'Hüseyin Yıldırım','1111111111111111','03/2014',13,60.31710,2070.88710,1,'2012-05-06 18:56:55');
/*!40000 ALTER TABLE `tbl_siparisler_odemeler_kk` ENABLE KEYS */;


--
-- Definition of trigger `trg_siparisler_odemeler_kk`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_siparisler_odemeler_kk`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_siparisler_odemeler_kk` BEFORE INSERT ON `tbl_siparisler_odemeler_kk` FOR EACH ROW BEGIN
SET NEW.tarih = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_siparisler_urunler`
--

DROP TABLE IF EXISTS `tbl_siparisler_urunler`;
CREATE TABLE `tbl_siparisler_urunler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siparis_id` int(11) DEFAULT '-1',
  `sepet_id` int(11) NOT NULL DEFAULT '-1',
  `siparisler_urunler_id` int(11) NOT NULL DEFAULT '-1',
  `adet` int(11) NOT NULL DEFAULT '1',
  `tarih` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `adet` (`adet`),
  KEY `tarih` (`tarih`),
  KEY `siparis_id` (`siparis_id`),
  KEY `siparisler_urunler_id` (`siparisler_urunler_id`),
  KEY `sepet_id` (`sepet_id`),
  CONSTRAINT `fk_siparisler_urunler_sepet_id` FOREIGN KEY (`sepet_id`) REFERENCES `tbl_sepetler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_urunler_siparisler_urun_id` FOREIGN KEY (`siparisler_urunler_id`) REFERENCES `tbl_cpy_siparisler_urunler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_urunler_siparis_id` FOREIGN KEY (`siparis_id`) REFERENCES `tbl_siparisler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_siparisler_urunler`
--

/*!40000 ALTER TABLE `tbl_siparisler_urunler` DISABLE KEYS */;
INSERT INTO `tbl_siparisler_urunler` (`id`,`siparis_id`,`sepet_id`,`siparisler_urunler_id`,`adet`,`tarih`) VALUES 
 (43,14,48,67,1,'2012-04-29 03:57:47'),
 (44,14,49,68,1,'2012-04-29 03:57:47'),
 (45,14,50,69,1,'2012-04-29 03:57:48'),
 (46,14,51,70,1,'2012-04-29 03:57:48'),
 (47,14,52,71,1,'2012-04-29 03:57:48'),
 (48,15,53,72,1,'2012-04-29 04:03:44'),
 (49,16,54,73,1,'2012-04-29 04:04:55'),
 (50,16,55,74,1,'2012-04-29 04:04:56'),
 (51,17,56,75,1,'2012-04-30 01:12:08'),
 (52,18,57,76,1,'2012-04-30 01:32:01'),
 (53,19,58,77,1,'2012-04-30 01:33:35'),
 (54,20,59,78,1,'2012-04-30 13:16:25'),
 (55,21,60,79,1,'2012-04-30 13:18:49'),
 (56,23,61,80,1,'2012-04-30 13:21:28'),
 (57,24,62,81,1,'2012-04-30 13:57:12'),
 (58,25,63,82,1,'2012-05-02 13:20:52'),
 (59,26,64,83,1,'2012-05-02 13:28:01'),
 (60,27,66,84,1,'2012-05-03 00:22:12'),
 (61,28,67,85,1,'2012-05-05 00:41:38'),
 (62,29,72,86,5,'2012-05-06 16:49:11'),
 (63,30,73,87,5,'2012-05-06 17:03:55'),
 (64,31,74,88,1,'2012-05-06 17:44:57'),
 (65,32,75,89,1,'2012-05-06 18:08:09'),
 (66,33,77,90,1,'2012-05-06 18:36:47'),
 (67,34,78,91,1,'2012-05-06 18:44:49'),
 (68,35,79,92,1,'2012-05-06 18:53:06'),
 (69,36,76,93,1,'2012-05-06 18:55:33'),
 (70,37,80,94,1,'2012-05-06 18:56:55'),
 (71,38,81,95,1,'2012-05-07 13:27:23'),
 (72,39,82,96,1,'2012-05-08 09:51:09'),
 (73,40,83,97,1,'2012-05-20 13:35:01'),
 (74,41,84,98,2,'2012-07-05 23:45:28'),
 (75,41,85,99,1,'2012-07-05 23:45:28'),
 (76,41,86,100,1,'2012-07-05 23:45:28');
/*!40000 ALTER TABLE `tbl_siparisler_urunler` ENABLE KEYS */;


--
-- Definition of trigger `trg_siparisler_urunler`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_siparisler_urunler`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_siparisler_urunler` BEFORE INSERT ON `tbl_siparisler_urunler` FOR EACH ROW BEGIN
SET NEW.tarih = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_textler`
--

DROP TABLE IF EXISTS `tbl_textler`;
CREATE TABLE `tbl_textler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dil_id` int(11) NOT NULL DEFAULT '-1',
  `sabitler_id` int(11) NOT NULL DEFAULT '-1',
  `text` longtext NOT NULL,
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `dil_id` (`dil_id`),
  KEY `sabitler_id` (`sabitler_id`),
  KEY `onay` (`onay`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_textler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_textler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_textler_dil_id` FOREIGN KEY (`dil_id`) REFERENCES `tbl_diller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_textler_sabitler_id` FOREIGN KEY (`sabitler_id`) REFERENCES `tbl_sbt_sabit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_textler`
--

/*!40000 ALTER TABLE `tbl_textler` DISABLE KEYS */;
INSERT INTO `tbl_textler` (`id`,`dil_id`,`sabitler_id`,`text`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,999,1,'Ürün Adı',1,999,'2011-12-04 21:42:13',999,'2012-03-21 01:45:03'),
 (2,999,2,'Ürün Kodu',1,999,'2011-12-04 21:42:13',999,'2011-12-04 21:42:16'),
 (3,999,3,'detaylar »',1,999,'2011-12-04 21:42:13',999,'2011-12-04 22:52:02'),
 (4,999,4,'Kategoriler',1,999,'2011-12-04 21:42:13',999,'2011-12-04 21:42:18'),
 (5,999,5,'Uygulama Resimleri',1,999,'2011-12-04 21:42:13',999,'2011-12-04 21:42:19'),
 (6,999,6,'Uygulama Videoları',1,999,'2011-12-04 21:42:13',999,'2011-12-04 21:42:19'),
 (7,999,7,'Etiketler',1,999,'2011-12-04 21:42:13',999,'2011-12-04 21:42:20'),
 (8,999,8,'Mail Listesi',1,999,'2011-12-04 21:42:13',999,'2011-12-04 21:42:20'),
 (9,999,9,'İletişim',1,999,'2011-12-04 21:42:13',999,'2012-05-06 20:37:47'),
 (10,999,10,'Geri Bildirimlere Önem Veriyoruz',1,999,'2011-12-04 21:42:13',999,'2011-12-04 21:42:23'),
 (11,999,11,'Ad Soyad',1,999,'2011-12-04 21:42:13',999,'2011-12-04 21:42:23'),
 (12,999,12,'Mail',1,999,'2011-12-04 21:42:13',999,'2011-12-04 21:42:24'),
 (13,999,13,'Telefon',1,999,'2011-12-04 21:42:13',999,'2011-12-04 21:42:25'),
 (14,999,14,'Görüşler',1,999,'2011-12-04 21:42:13',999,'2011-12-04 21:42:26'),
 (15,999,15,'Sizlere sunduğumuz hizmet kalitesinin geliştirilmesi sizlerden aldığımız öneri, görüş ve eleştirilerin değerlendirilmesiyle doğru orantılı olarak gelişmektedir.\n<br/><br/>\nSürekli gelişim sürecimize destek olacak öneri ve beklentilerinizi bizlerle paylaşmanızdan memnuniyet duyacağız.\n<br/><br/>\nMesajlarınız tarafımızdan titizlikle incelenecek ve alınacak aksiyonlara temel oluşturacaktır. Sizlerin beklentilerini ve memnuniyetini arttırarak, \"%100 müşteri memnuniyeti\" anlayışımızı birlikte daha ileriye taşımak dileğiyle.',1,999,'2011-12-04 21:42:13',999,'2011-12-04 21:44:26'),
 (16,999,16,'makine sağlayıcınız',1,999,'2011-12-04 21:42:13',999,'2011-12-04 22:35:44'),
 (17,999,17,'ÜRÜNLER',1,999,'2011-12-04 21:42:13',999,'2011-12-04 23:43:25'),
 (18,999,18,'Gönder',1,999,'2011-12-04 22:19:31',999,'2011-12-04 22:20:00'),
 (19,999,19,'Adres ve Mail Bilgileri',1,999,'2011-12-04 23:48:17',999,'2012-03-05 23:39:34'),
 (20,999,20,'İletişim Formu',1,999,'2011-12-05 00:36:22',999,'2012-05-06 20:37:27'),
 (21,999,21,'Ürün Açıklaması',1,999,'2011-12-10 18:16:02',999,'2011-12-10 18:16:45'),
 (22,999,22,'Ürün Resimleri',1,999,'2011-12-10 18:16:09',999,'2011-12-10 18:16:25'),
 (23,999,23,'Ürün Videoları',1,999,'2011-12-10 18:16:37',999,'2012-03-09 00:32:52'),
 (24,999,24,'Hakkımızda',1,999,'2011-12-17 15:12:27',999,'2012-05-06 20:34:56'),
 (25,999,25,'SERASMAC HAKKINDA',1,999,'2011-12-17 15:16:08',999,'2012-03-09 00:32:16'),
 (26,999,26,'Türk sanayisine, 1992 yilindan beri ürettigi basarili ürünlerle hizmet veren firmamiz; tamamen yerli imalat ve emekle gerçeklestirdigi ürünlerini, ülkemizin en büyük firmalari yaninda küçük atölyelerinde de görmek mümkündür.\n<br/><br/>\nÇok genis olan müsteri portföyümüzün, firmamiz ürünlerine göstermis oldugu ilgi ve buna bagli olarak ürünlerimizin yüksek performansi, SERASMAC markasini aranan ve tercih edilen marka konumuna getirmistir. Bu nedenle markamiz ürünleri taklit edilir hale gelmistir. Ülkemiz seramik sanayisinin ihtiyacina cevap vermeyi hedef alan kurulusumuz, ileri teknoloji destegi ile, bu alandaki yeni arastirma ve gelistirme hizmetlerine hiz vermistir.\n<br/><br/>\nBu güne kadar firmamizca imal edilen ürünlerimiz, çesitli sanayi kuruluslarinda basari ile hizmete devam etmekte ve siz sayin müsterilerimizden aldigimiz övgüler, bu alandaki çalismalarimiza daha bir sevk katmaktadir. Kamara firinlar konusunda önder olan kurulusumuz, kalitesini kanitlamis bulunmaktadir. Seri ve özel boyutta üretmekte oldugumuz elektrikli firinlar tamamen Avrupa patentli malzemeler ile üretilmektedir. Firmamiz satis sonrasi verdigi hizmetler ile de ürünlerinin yakindan takipçisidir. Tüm mamullerimiz bir yil garantili olup, bakimlari da tarafimizdan yapilmaktadir.\n<br/><br/>\nFirma olarak hedefimiz; müsterilerimize, firmamizdaki gelismeleri aktarmak ve müsterilerimizin bu konudaki ihtiyaçlarina en kisa sürede cevap verebilmektir. Firmamiz simdiye kadar gördügü destek ve güvene layik olmak amaciyla siz sayin müsterilerimizin hizmetindedir.',1,999,'2011-12-17 16:28:48',999,'2012-04-16 00:46:28'),
 (27,999,27,'SERAS MAKİNA HAKKINDA',1,999,'2011-12-17 16:39:59',999,'2012-03-09 00:32:17'),
 (28,999,28,'BELGELERİMİZ',1,999,'2011-12-17 16:45:43',999,'2012-03-09 00:32:14'),
 (29,999,29,'Lütfen adınızı ve soyadınızı yazın.',1,999,'2011-12-18 00:37:32',999,'2012-03-09 00:32:13'),
 (30,999,30,'Lütfen mail adresinizi yazın.',1,999,'2011-12-18 00:37:32',999,'2012-03-09 00:32:15'),
 (31,999,31,'Lütfen geçerli bir mail adresi yazın.',1,999,'2011-12-18 00:37:32',999,'2012-03-09 00:32:15'),
 (32,999,32,'Lütfen telefonu belirtin.',1,999,'2011-12-18 00:37:32',999,'2012-03-09 00:32:26'),
 (33,999,33,'Lütfen görüşünüzü, yorumunuzu veya şikayetinizi bildirin.',1,999,'2011-12-18 00:37:32',999,'2012-03-09 00:32:30'),
 (34,999,34,'Lütfen güvenlik kodunu yazın.',1,999,'2011-12-18 00:37:32',999,'2012-03-09 00:32:29'),
 (35,999,35,'Güvenlik kodu 5 karakterden küçük olamaz.',1,999,'2011-12-18 00:37:32',999,'2012-03-09 00:32:32'),
 (36,2,0,'hede hödö hedeööö',1,999,'2011-12-18 01:22:33',999,'2012-03-09 00:32:33'),
 (37,999,36,'Güvenlik kodunu yanlış girdiniz. \\n\\Lütfen kontrol ederek yeniden deneyiniz.',1,999,'2012-01-31 00:59:56',999,'2012-01-31 01:04:04'),
 (38,999,37,'Bilgileriniz başarıyla gönderilmiştir.',1,999,'2012-01-31 01:05:00',999,'2012-01-31 01:05:13'),
 (41,999,38,'Markalar',1,999,'2012-03-05 02:10:36',999,'2012-04-16 00:45:49'),
 (43,999,39,'TÜM KATEGORİLER',1,999,'2012-03-09 00:32:04',999,'2012-03-09 00:32:28'),
 (46,999,40,'TÜM MARKALAR',1,999,'2012-03-09 02:26:10',999,'2012-03-09 02:26:24'),
 (48,999,41,'ETİKET',1,999,'2012-03-10 10:58:39',999,'2012-03-11 12:55:48'),
 (51,999,42,'KATEGORİ',1,999,'2012-03-10 10:59:35',999,'2012-03-11 12:55:45'),
 (52,999,43,'MARKA',1,999,'2012-03-10 11:00:00',999,'2012-03-11 12:55:44'),
 (54,999,44,'Tüm Ürünler',1,999,'2012-03-10 11:22:10',999,'2012-03-11 12:55:43'),
 (55,999,45,'ARA',1,999,'2012-03-11 12:55:28',999,'2012-03-11 12:55:43'),
 (56,999,46,'Ürünlerde Ara',1,999,'2012-03-11 12:58:17',999,'2012-03-11 13:05:29'),
 (57,999,47,'Aradığınız kelimeye ait bir ürün bulunamadı. Lütfen yeni bir arama yapın.',1,999,'2012-03-12 00:12:24',999,'2012-03-12 00:12:32'),
 (58,999,48,'Lütfen aramak istediğiniz kelimeyi belirtin.',1,999,'2012-03-12 00:38:14',999,'2012-03-12 00:38:17'),
 (59,999,49,'Aramak istediğiniz kelime en az 3 karakterden oluşmak zorundadır.',1,NULL,'2012-03-12 00:39:01',NULL,NULL),
 (60,999,60,'Üye Kayit Formu',1,999,'2012-04-22 19:19:13',NULL,NULL),
 (61,999,61,'Nerdesin:',1,999,'2012-04-22 19:19:13',999,'2012-04-28 18:15:26'),
 (62,999,62,'Ana Sayfa',1,999,'2012-04-22 19:19:13',NULL,NULL),
 (63,999,63,'Sizin Için Seçtiklerimiz',1,999,'2012-04-22 19:19:13',NULL,NULL),
 (64,999,64,'Türkiye\'nin en büyük tekne mağazasına hoşgeldiniz.',1,999,'2012-04-22 19:19:13',NULL,'2012-05-04 20:54:06'),
 (65,999,65,'E-Posta Adresiniz',1,999,'2012-04-22 19:19:13',999,'2012-04-28 18:15:29'),
 (66,999,66,'Sifre',1,999,'2012-04-22 19:19:13',NULL,NULL),
 (67,999,67,'Beni Hatirla',1,999,'2012-04-22 19:19:13',NULL,NULL),
 (68,999,68,'Sifremi unuttum?',1,999,'2012-04-22 19:19:13',NULL,NULL),
 (69,999,69,'Yeni üye ol',1,999,'2012-04-22 19:19:13',999,'2012-04-07 01:58:50'),
 (70,999,70,'Adiniz Soyadiniz',1,999,'2012-04-22 19:19:13',999,'2012-04-07 10:41:32'),
 (71,999,71,'Sifre',1,999,'2012-04-22 19:19:13',999,'2012-04-07 10:41:32'),
 (73,999,72,'Sifre Tekrar',1,999,'2012-04-22 19:19:13',NULL,NULL),
 (74,999,73,'Telefon',1,999,'2012-04-22 19:19:13',NULL,NULL),
 (75,999,74,'Kayit Ol',1,999,'2012-04-22 19:19:13',NULL,NULL),
 (76,999,75,'KATEGORILER',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (77,999,76,'MARKALAR',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (78,999,77,'EN ÇOK SATILANLAR',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (79,999,78,'INDIRIMLI ÜRÜNLER',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (80,999,79,'SEPETIM',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (81,999,80,'YENI ÜRÜNLER',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (82,999,81,'KARGO',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (83,999,82,'HABER SERVISI',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (84,999,83,'Marin Boat ile ilgili güncel gelismelerden ilk siz haberdar olmak için:',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (85,999,84,'Lütfen adinizi giriniz.',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (86,999,85,'Lütfen e-posta adresinizi giriniz.',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (87,999,86,'Lütfen e-posta adresinizi kontrol ediniz.',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (88,999,87,'Lütfen sifrenizi giriniz.',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (89,999,88,'Lütfen sifresinizi tekrar giriniz.',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (90,999,89,'Lütfen sifrelerinizi kontrol ediniz.',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (91,999,90,'Lütfen telefon numaranizi giriniz.',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (92,999,91,'Üye kayit isleminiz basariyla gerçeklesmistir. Lütfen belirttiginiz e-posta adresine gönderilen onaylama linkine tiklayiniz.',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (93,999,92,'Girdiginiz e-posta adresi zaten kayitlidir.',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (94,999,93,'Giriş Yap',1,999,'2012-04-22 19:19:14',NULL,'2012-05-22 00:15:50'),
 (95,999,94,'Kullanici adi bulunamadi. Lütfen kullanici adinizi kontrol ederek yeniden yaziniz.',1,999,'2012-04-22 19:19:14',NULL,'2012-04-29 20:09:07'),
 (96,999,95,'Hesabiniz aktif olmadigi için üye girisi yapamazsiniz!',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (97,999,96,'Eksik veya yanlis sifre girdiniz. Lütfen sifrenizi kontrol ederek yeniden deneyiniz.',1,999,'2012-04-22 19:19:14',NULL,'2012-04-29 20:09:16'),
 (98,999,97,'Alışveriş Sepetim',1,999,'2012-04-22 19:19:14',NULL,'2012-05-22 00:15:44'),
 (99,999,98,'Üye Girişi',1,999,'2012-04-22 19:19:14',NULL,'2012-05-22 00:15:32'),
 (100,999,99,'Çıkış Yap',1,999,'2012-04-22 19:19:14',NULL,'2012-05-22 00:15:30'),
 (101,999,100,'Müşteri Hizmetleri',1,999,'2012-04-22 19:19:14',NULL,'2012-05-22 00:15:24'),
 (102,999,101,'Sipariş Takibi',1,999,'2012-04-22 19:19:14',NULL,'2012-05-22 00:15:20'),
 (103,999,102,'Üyelik Bilgilerim',1,999,'2012-04-22 19:19:14',999,'2012-04-28 18:15:24'),
 (104,999,103,'Sepete Ekle',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (105,999,104,'Ürünü İncele',1,999,'2012-04-22 19:19:14',NULL,'2012-05-22 00:15:15'),
 (106,999,105,'Yazdır',1,999,'2012-04-22 19:19:14',NULL,'2012-05-22 00:15:12'),
 (107,999,106,'Favorilere Ekle',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (108,999,107,'Stokta Yok',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (109,999,108,'Yorum Yaz',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (110,999,109,'Hemen Al',1,999,'2012-04-22 19:19:14',999,'2012-04-28 18:15:23'),
 (111,999,110,'Sepeti Güncelle',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (112,999,111,'Seçilenleri Sil',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (113,999,112,'Alışverişi Tamamla',1,999,'2012-04-22 19:19:14',NULL,'2012-05-03 22:42:06'),
 (114,999,113,'Ürün Adı',1,999,'2012-04-22 19:19:14',NULL,'2012-05-03 22:42:09'),
 (115,999,114,'Birim Fiyat',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (116,999,115,'Adet',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (117,999,116,'Toplam Fiyat',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (118,999,117,'Sepetim',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (119,999,118,'Adres Bilgileri',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (120,999,119,'Ödeme Bilgileri',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (121,999,120,'Sipariş Onayı',1,999,'2012-04-22 19:19:14',NULL,'2012-05-03 22:42:19'),
 (122,999,121,'Ürün Bilgisi',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (123,999,122,'Ürün Yorumları',1,999,'2012-04-22 19:19:14',NULL,'2012-05-22 00:14:58'),
 (125,999,123,'Taksit Seçenekleri',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (126,999,124,'Ürün Resimleri',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (127,999,125,'Ürün Videolari',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (128,999,126,'Önerileriniz',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (129,999,127,'Sepetinizde stoğu bulunmayan ürünler sepetinizden silinmiştir.',1,999,'2012-04-22 19:19:14',NULL,'2012-05-22 00:14:50'),
 (130,999,128,'Taksitlendirme seçenegi bulunmuyor.',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (131,999,129,'Taksit',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (132,999,130,'Taksit Tutarı',1,999,'2012-04-22 19:19:15',NULL,'2012-05-22 00:14:38'),
 (133,999,131,'Toplam Tutar',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (134,999,132,'Ürün için eklenmiş resim bulunmuyor!',1,999,'2012-04-22 19:19:15',NULL,'2012-05-22 00:14:32'),
 (135,999,133,'Ürün için eklenmiş video bulunmuyor!',1,999,'2012-04-22 19:19:15',NULL,'2012-05-22 00:14:26'),
 (136,999,134,'Toplam',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (137,999,135,'KDV',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (138,999,136,'Genel Toplam',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (139,999,137,'Alışveriş sepetinizde ürün bulunmuyor!',1,999,'2012-04-22 19:19:15',NULL,'2012-05-22 00:14:19'),
 (140,999,138,'Fatura Bilgileri',1,999,'2012-04-22 19:19:15',999,'2012-04-13 15:26:12'),
 (141,999,139,'Teslimat Bilgileri',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (142,999,140,'Lütfen Seçiniz',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (143,999,141,'Yeni Adres Ekle',1,999,'2012-04-22 19:19:15',999,'2012-04-18 16:52:44'),
 (144,999,142,'Kaydet',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (145,999,143,'Bireysel',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (146,999,144,'Kurumsal',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (147,999,145,'Fatura Tipi',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (148,999,146,'Firma Adı',1,999,'2012-04-22 19:19:15',NULL,'2012-05-22 00:14:00'),
 (149,999,147,'İsim Soyisim',1,999,'2012-04-22 19:19:15',NULL,'2012-05-22 00:13:57'),
 (150,999,148,'Adres',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (151,999,149,'Posta Kodu',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (152,999,150,'Ülke',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (153,999,151,'İl',1,999,'2012-04-22 19:19:15',NULL,'2012-05-22 00:13:49'),
 (154,999,152,'İlçe',1,999,'2012-04-22 19:19:15',NULL,'2012-05-22 00:13:47'),
 (155,999,153,'Açik Adres',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (156,999,154,'Vergi Dairesi',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (157,999,155,'Vergi No',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (158,999,156,'TC Kimlik No',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (159,999,157,'Devam Et',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (160,999,158,'Banka Havalesi',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (161,999,159,'Kredi Kartı',1,999,'2012-04-22 19:19:15',NULL,'2012-05-22 00:13:33'),
 (162,999,160,'Kapıda Ödeme',1,999,'2012-04-22 19:19:15',NULL,'2012-05-22 00:13:31'),
 (163,999,161,'Paypal',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (164,999,162,'PTT',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:19:36'),
 (165,999,163,'Banka:',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:19:37'),
 (166,999,164,'Hesap Sahibi:',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:19:38'),
 (167,999,165,'Sube:',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:19:39'),
 (168,999,166,'Hesap No:',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:19:39'),
 (169,999,167,'IBAN No:',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:19:40'),
 (171,999,168,'Ödeme Yap',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (172,999,169,'Kart Üzerindeki İsim',1,999,'2012-04-22 19:19:15',999,'2012-05-22 00:13:23'),
 (173,999,170,'Kart Tipi',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:35:58'),
 (174,999,171,'Son Kullanma Tarihi',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:35:58'),
 (175,999,172,'Kart Numarası',1,999,'2012-04-22 19:19:15',999,'2012-05-22 00:13:16'),
 (176,999,173,'Güvenlik Kodu',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:36:00'),
 (177,999,174,'Banka Adı',1,999,'2012-04-22 19:19:15',999,'2012-05-22 00:13:12'),
 (178,999,175,'Bankanızı Seçiniz',1,999,'2012-04-22 19:19:15',999,'2012-05-22 00:13:09'),
 (179,999,176,'Listede Yok',1,999,'2012-04-22 19:19:15',999,'2012-04-19 12:29:24'),
 (180,999,177,'Ay',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (181,999,178,'Yıl',1,999,'2012-04-22 19:19:15',NULL,'2012-05-22 00:12:58'),
 (182,999,179,'Detaylı bilgi',1,999,'2012-04-22 19:19:15',NULL,'2012-05-22 00:12:56'),
 (183,999,180,'Güncelle',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (184,999,181,'Sifremi degistirmek istiyorum',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (185,999,182,'Yeni Sifreniz',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (186,999,183,'Yeni Sifreniz Tekrar',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (187,999,184,'Üyelik bilgileriniz basariyla güncellenmistir.',1,999,'2012-04-22 19:19:15',999,'2012-04-22 15:07:12'),
 (188,999,185,'Lütfen suan ki sifrenizi kontrol ediniz.',1,999,'2012-04-22 19:19:16',999,'2012-04-22 15:07:13'),
 (189,999,186,'Beklenmedik bir hata oluştu.',1,999,'2012-04-23 01:46:43',NULL,NULL),
 (190,999,187,'Siparişiniz bulunmuyor.',1,999,'2012-04-23 11:50:31',NULL,NULL),
 (191,999,188,'Sipariş No',1,999,'2012-04-23 12:06:59',999,'2012-04-23 12:07:18'),
 (192,999,189,'Toplam Tutar',1,999,'2012-04-23 12:07:07',999,'2012-04-23 12:07:18'),
 (193,999,190,'Durumu',1,999,'2012-04-23 12:07:15',999,'2012-04-23 12:07:18'),
 (194,999,191,'Sipariş Detayı',1,999,'2012-04-23 12:09:14',NULL,NULL),
 (195,999,192,'Sipariş Tarihi',1,999,'2012-04-23 13:38:10',NULL,NULL),
 (196,999,193,'Ödeme Şekli',1,999,'2012-04-23 17:12:06',NULL,NULL),
 (198,999,194,'KDV Dahil Fiyatı',1,999,'2012-04-24 23:35:22',999,'2012-04-24 23:35:45'),
 (199,999,195,'İndirimli Fiyatı',1,999,'2012-04-24 23:35:29',999,'2012-04-24 23:35:45'),
 (200,999,196,'Fiyatı',1,999,'2012-04-24 23:35:35',999,'2012-04-24 23:35:45'),
 (201,999,197,'Markalar',1,999,'2012-04-24 23:35:42',999,'2012-04-24 23:35:45'),
 (202,999,198,'Ödeme Bildirimi Yap',1,999,'2012-04-25 00:32:37',999,'2012-04-25 13:21:02'),
 (203,999,199,'Ödeme Bildirimi',1,999,'2012-04-25 13:21:35',NULL,NULL),
 (204,999,200,'EFT/Havale Yapılacak Banka',1,999,'2012-04-26 12:09:20',NULL,NULL),
 (205,999,201,'Ödeme Tipi',1,999,'2012-04-26 12:15:31',999,'2012-04-26 12:15:46'),
 (206,999,202,'İşlem No',1,999,'2012-04-26 12:15:37',999,'2012-04-26 12:15:46'),
 (207,999,203,'Ödeme Tarihi',1,999,'2012-04-26 12:15:44',999,'2012-04-26 12:15:46'),
 (208,999,204,'EFT',1,999,'2012-04-26 12:18:12',999,'2012-04-26 12:19:30'),
 (209,999,205,'Havale',1,999,'2012-04-26 12:19:21',999,'2012-04-26 12:19:30'),
 (210,999,206,'Diğer Ödeme Tipi',1,999,'2012-04-26 12:19:28',999,'2012-04-26 12:19:30'),
 (211,999,207,'Lütfen marka seçiniz',1,999,'2012-04-27 01:11:24',NULL,NULL),
 (212,999,208,'Ürün Kodu',1,999,'2012-04-27 01:25:52',NULL,NULL),
 (213,999,209,'Ödeme bildiriniz başarıyla kayıt edilmiştir.',1,999,'2012-04-27 16:22:19',NULL,NULL),
 (214,999,210,'Kargo Bilgileri',1,999,'2012-04-27 20:36:12',NULL,NULL),
 (215,999,211,'Seç',1,999,'2012-04-27 21:31:19',999,'2012-04-27 21:31:42'),
 (216,999,212,'Kargo Firması',1,999,'2012-04-27 21:31:26',999,'2012-04-27 21:31:42'),
 (217,999,213,'Not',1,999,'2012-04-27 21:31:33',999,'2012-04-27 21:31:42'),
 (218,999,214,'Size Özel Fiyatı',1,999,'2012-04-27 21:31:39',999,'2012-04-27 21:31:42'),
 (219,999,215,'Geri',1,999,'2012-04-27 22:17:32',NULL,NULL),
 (220,999,216,'Ücretsiz Kargo',1,999,'2012-04-28 14:23:59',NULL,NULL),
 (221,999,217,'Kargo Payı',1,999,'2012-04-29 03:06:35',NULL,NULL),
 (222,999,218,'Lütfen şifre giriniz.',1,999,'2012-04-29 19:21:59',999,'2012-04-29 19:22:20'),
 (223,999,219,'Lütfen şifrenizi tekrar giriniz.',1,999,'2012-04-29 19:22:06',999,'2012-04-29 19:22:21'),
 (224,999,220,'Şifrelerinizi kontrol ediniz.',1,999,'2012-04-29 19:22:10',999,'2012-04-29 19:22:22'),
 (225,999,221,'Ekle',1,999,'2012-04-29 22:08:43',NULL,NULL),
 (226,999,222,'Fatura adresini seçiniz.',1,999,'2012-04-29 22:45:59',999,'2012-04-29 22:46:11'),
 (227,999,223,'Teslimat adresini seçiniz.',1,999,'2012-04-29 22:46:04',999,'2012-04-29 22:46:11'),
 (228,999,224,'Lütfen eft/havale yapmak istediğiniz bankayı seçiniz.',1,999,'2012-04-30 00:58:47',NULL,NULL),
 (229,999,225,'Etiketler',1,999,'2012-05-01 22:46:18',NULL,NULL),
 (230,999,226,'Şifremi unuttum?',1,999,'2012-05-02 01:08:03',NULL,NULL),
 (231,999,227,'Şifremi Gönder',1,999,'2012-05-02 01:09:40',NULL,NULL),
 (232,999,228,'Sepete Git',1,999,'2012-05-02 11:41:02',999,'2012-05-02 11:41:22'),
 (233,999,229,'Üye Girişi',1,999,'2012-05-02 11:41:08',999,'2012-05-02 11:41:22'),
 (234,999,230,'Üye İşlemleri',1,999,'2012-05-02 11:41:19',999,'2012-05-02 11:41:22'),
 (235,999,231,'Kasaya Git',1,999,'2012-05-02 11:41:43',NULL,NULL),
 (236,999,232,'Bu kategoriye ait eklenmiş ürün bulunmuyor.',1,999,'2012-05-02 15:11:07',NULL,NULL),
 (237,999,233,'<p> <strong>ÜYELİK           SÖZLEŞMESİ</strong></p>\r\n<p> <strong>1.           Taraflar</strong></p>\r\n<p> <strong>a)</strong> <a href=\"http://www.hepsiburada.com/\">www.marinboat.com</a>  internet sitesinin faaliyetlerini           yürüten Atatük Mh. Mustafa Kemal Paşa Cd. Ata Sk. No:5 İstanbul adresinde mukim Marin Boat Denizcilik Ltd. Şti. (Bundan böyle &ldquo;Marin Boat&rdquo; olarak anılacaktır).</p>\r\n<p> <strong>b)</strong> <a href=\"http://www.hepsiburada.com/\">www.marinboat.com</a>  internet sitesine üye olan internet           kullanıcısı (&quot;Üye&quot;)</p>\r\n<p> <strong>2.           Sözleşmenin Konusu</strong></p>\r\n<p> İşbu           Sözleşme&rsquo;nin konusu Marin Boat\'ın sahip olduğu internet sitesi <a href=\"http://www.hepsiburada.com/\">www.marinboat.com</a> &lsquo;dan üyenin faydalanma şartlarının           belirlenmesidir.</p>\r\n<p> <strong>3.           Tarafların Hak ve Yükümlülükleri</strong></p>\r\n<p> <strong>3.1.</strong> Üye, <a href=\"http://www.hepsiburada.com/\">www.marinboat.com</a>  internet sitesine üye olurken verdiği           kişisel ve diğer sair bilgilerin kanunlar önünde doğru olduğunu, Marin Boat\'ın           bu bilgilerin gerçeğe aykırılığı nedeniyle uğrayacağı tüm zararları aynen ve           derhal tazmin edeceğini beyan ve taahhüt eder.</p>\r\n<p> <strong>3.2.</strong> Üye, Marin Boat           tarafından kendisine verilmiş olan şifreyi başka kişi ya da kuruluşlara veremez,           üyenin söz konusu şifreyi kullanma hakkı bizzat kendisine aittir. Bu sebeple           doğabilecek tüm sorumluluk ile üçüncü kişiler veya yetkili merciler tarafından           Marin Boat\'a karşı ileri sürülebilecek tüm iddia ve taleplere karşı,           Marin Boat\'ın sözkonusu izinsiz kullanımdan kaynaklanan her türlü tazminat ve           sair talep hakkı saklıdır.</p>\r\n<p> <strong>3.3.</strong> Üye <a href=\"http://www.hepsiburada.com/\">www.marinboat.com</a>  internet sitesini kullanırken yasal           mevzuat hükümlerine riayet etmeyi ve bunları ihlal etmemeyi baştan kabul ve           taahhüt eder. Aksi takdirde, doğacak tüm hukuki ve cezai yükümlülükler tamamen           ve münhasıran üyeyi bağlayacaktır.</p>\r\n<p> <strong>3.4.</strong> Üye, <a href=\"http://www.hepsiburada.com/\">www.marinboat.com</a>  internet sitesini hiçbir şekilde kamu           düzenini bozucu, genel ahlaka aykırı, başkalarını rahatsız ve taciz edici           şekilde, yasalara aykırı bir amaç için, başkalarının fikri ve telif haklarına           tecavüz edecek şekilde kullanamaz. Ayrıca, üye başkalarının hizmetleri           kullanmasını önleyici veya zorlaştırıcı faaliyet (spam, virus, truva atı, vb.)           ve işlemlerde bulunamaz.</p>\r\n<p> <strong>3.5.</strong> <a href=\"http://www.hepsiburada.com/\">www.marinboat.com</a>  internet sitesinde üyeler tarafından           beyan edilen, yazılan, kullanılan fikir ve düşünceler, tamamen üyelerin kendi           kişisel görüşleridir ve görüş sahibini bağlar. Bu görüş ve düşüncelerin           Marin Boat\'la hiçbir ilgi ve bağlantısı yoktur. Marin Boat\'ın üyenin beyan           edeceği fikir ve görüşler nedeniyle üçüncü kişilerin uğrayabileceği zararlardan           ve üçüncü kişilerin beyan edeceği fikir ve görüşler nedeniyle üyenin           uğrayabileceği zararlardan dolayı herhangi bir sorumluluğu bulunmamaktadır.</p>\r\n<p> <strong>3.6.</strong> Marin Boat, üye           verilerinin yetkisiz kişilerce okunmasından ve üye yazılım ve verilerine           gelebilecek zararlardan dolayı sorumlu olmayacaktır. Üye, <a href=\"http://www.hepsiburada.com/\">www.marinboat.com</a>  internet sitesinin kullanılmasından           dolayı uğrayabileceği herhangi bir zarar yüzünden Marin Boat\'dan tazminat talep           etmemeyi peşinen kabul etmiştir.</p>\r\n<p> <strong>3.7.</strong> Üye, diğer           internet kullanıcılarının yazılımlarına ve verilerine izinsiz olarak ulaşmamayı           veya bunları kullanmamayı kabul etmiştir. Aksi takdirde, bundan doğacak hukuki           ve cezai sorumluluklar tamamen üyeye aittir.</p>\r\n<p> <strong>3.8.</strong> İşbu üyelik           sözleşmesi içerisinde sayılan maddelerden bir ya da birkaçını ihlal eden üye           işbu ihlal nedeniyle cezai ve hukuki olarak şahsen sorumlu olup, Marin Boat\'ı           bu ihlallerin hukuki ve cezai sonuçlarından ari tutacaktır. Ayrıca; işbu ihlal           nedeniyle, olayın hukuk alanına intikal ettirilmesi halinde, Marin Boat\'ın           üyeye karşı üyelik sözleşmesine uyulmamasından dolayı tazminat talebinde           bulunma hakkı saklıdır.</p>\r\n<p> <strong>3.9.</strong> Marin Boat\'ın           her zaman tek taraflı olarak gerektiğinde üyenin üyeliğini silme, müşteriye ait           dosya, belge ve bilgileri silme hakkı vardır. Üye iş bu tasarrufu önceden kabul           eder. Bu durumda, Marin Boat\'ın hiçbir sorumluluğu yoktur.</p>\r\n<p> <strong>3.10.</strong> <a href=\"http://www.hepsiburada.com/\">www.marinboat.com</a>  internet sitesi yazılım ve tasarımı           Marin Boat mülkiyetinde olup, bunlara ilişkin telif hakkı ve/veya diğer fikri           mülkiyet hakları ilgili kanunlarca korunmakta olup, bunlar  üye tarafından izinsiz kullanılamaz,           iktisap edilemez ve değiştirilemez. Bu web sitesinde adı geçen başkaca şirketler           ve ürünleri sahiplerinin ticari markalarıdır ve ayrıca fikri mülkiyet hakları           kapsamında korunmaktadır.</p>\r\n<p> <strong>3.11.</strong> Marin Boat           tarafından <a href=\"http://www.hepsiburada.com/\">www.marinboat.com</a>  internet sitesinin iyileştirilmesi,           geliştirilmesine yönelik olarak ve/veya yasal mevzuat çerçevesinde siteye           erişmek için kullanılan İnternet servis sağlayıcısının adı ve Internet Protokol           (IP) adresi, Siteye erişilen tarih ve saat, sitede bulunulan sırada erişilen           sayfalar ve siteye doğrudan bağlanılmasını sağlayan Web sitesinin Internet           adresi gibi bir takım bilgiler toplanabilir.</p>\r\n<p> <strong>3.12.</strong> Marin Boat           kullanıcılarına daha iyi hizmet sunmak, ürünlerini ve hizmetlerini iyileştirmek,           sitenin kullanımını kolaylaştırmak için kullanımını kullanıcılarının özel           tercihlerine ve ilgi alanlarına yönelik çalışmalarda üyelerin kişisel           bilgilerini kullanabilir. Marin Boat, üyenin <a href=\"http://www.hepsiburada.com/\">www.marinboat.com</a>  internet sitesi üzerinde yaptığı           hareketlerin kaydını bulundurma hakkını saklı tutar.</p>\r\n<p> <strong>3.13.</strong> Marin Boat\'a üye olan kişi, yürürlükte bulunan           ve/veya yürürlüğe alınacak uygulamalar kapsamında Marin Boat iştiraki olan tüm şirketler tarafından  kendisine ürün ve hizmet           tanıtımları, reklamlar, kampanyalar, avantajlar, anketler  ve diğer müşteri           memnuniyeti uygulamaları sunulmasına izin verdiğini beyan ve kabul eder.  Üye,           Marin Boat\'a üye olurken ve/veya başka yollarla geçmişte vermiş olduğu ve/veya           gelecekte vereceği kişisel ve alışveriş bilgilerinin ve alışveriş ve/veya           tüketici davranış bilgilerinin  yukarıdaki amaçlarla toplanmasına, DOL            iştiraki olan tüm şirketler ile paylaşılmasına, Marin Boat iştiraki           olan tüm şirketler tarafından kullanılmasına ve arşivlenmesine izin verdiğini           beyan ve kabul eder. Üye aksini bildirmediği sürece  üyeliği sona erdiğinde de            verilerin toplanmasına, Marin Boat iştiraki olan tüm şirketler ile paylaşılmasına,           Marin Boat iştiraki olan tüm şirketler tarafından kullanılmasına ve           arşivlenmesine izin verdiğini beyan ve kabul eder. Üye aksini bildirmediği            sürece Marin Boat iştiraki olan tüm şirketlerin  kendisi ile            internet, telefon, SMS,  vb iletişim kanalları kullanarak irtibata geçmesine           izin verdiğini beyan ve kabul eder. Üye yukarıda bahsi geçen bilgilerin           toplanması,  paylaşılması, kullanılması, arşivlenmesi ve kendisine erişilmesi           nedeniyle doğrudan ve/veya dolaylı maddi ve/veya manevi menfi ve/veya müsbet,           velhasıl herhangi bir zarara uğradığı konusunda talepte bulunmayacağını ve           Marin Boat iştiraki olan şirketleri sorumlu tutmayacağını beyan ve kabul           eder. Üye veri paylaşım tercihlerini değiştirmek isterse, bu talebini           Marin Boat\'ın müşteri hizmetleri çağrı merkezlerine  iletebilir.</p>\r\n<p> <strong>3.14.</strong> Marin Boat,           üyenin kişisel bilgilerini yasal bir zorunluluk olarak istendiğinde veya (a)           yasal gereklere uygun hareket etmek veya Marin Boat\'a tebliğ edilen yasal           işlemlere uymak; (b) Marin Boat ve Marin Boat web sitesi ailesinin haklarını           ve mülkiyetini korumak ve savunmak için gerekli olduğuna iyi niyetle kanaat           getirdiği hallerde açıklayabilir.</p>\r\n<p> <strong>3.15.</strong> Marin Boat web           sitesinin virus ve benzeri amaçlı yazılımlardan arındırılmış olması için mevcut           imkanlar dahilinde tedbir alınmıştır. Bunun yanında nihai güvenliğin sağlanması           için kullanıcının, kendi virus koruma sistemini tedarik etmesi ve gerekli           korunmayı sağlaması gerekmektedir. Bu bağlamda üye Marin Boat web sitesi\'ne           girmesiyle, kendi yazılım ve işletim sistemlerinde oluşabilecek tüm hata ve           bunların doğrudan yada dolaylı sonuçlarından kendisinin sorumlu olduğunu kabul           etmiş sayılır.</p>\r\n<p> <strong>3.16.</strong> Marin Boat,           sitenin içeriğini dilediği zaman değiştirme, kullanıcılara sağlanan herhangi bir           hizmeti değiştirme yada sona erdirme veya Marin Boat web sitesi\'nde kayıtlı           kullanıcı bilgi ve verilerini silme hakkını saklı tutar.</p>\r\n<p> <strong>3.17.</strong> Marin Boat,           üyelik sözleşmesinin koşullarını hiçbir şekil ve surette ön ihbara ve/veya           ihtara gerek kalmaksızın her zaman değiştirebilir, güncelleyebilir veya iptal           edebilir. Değiştirilen, güncellenen yada yürürlükten kaldırılan her hüküm ,           yayın tarihinde tüm üyeler bakımından hüküm ifade edecektir.</p>\r\n<p> <strong>3.18.</strong> Taraflar,           Marin Boat\'a ait tüm bilgisayar kayıtlarının tek ve gerçek münhasır delil           olarak, HUMK madde 287\'ye uygun şekilde esas alınacağını ve söz konusu           kayıtların bir delil sözleşmesi teşkil ettiği hususunu kabul ve beyan eder.</p>\r\n<p> <strong>3.19.</strong> Marin Boat, iş bu üyelik sözleşmesi           uyarınca, üyelerinin kendisinde kayıtlı elektronik posta adreslerine           bilgilendirme mailleri ve cep telefonlarına bilgilendirme SMS&rsquo;leri gönderme           yetkisine sahip olmakla beraber, üye işbu üyelik sözleşmesini onaylamasıyla           beraber bilgilendirme maillerinin elektronik posta adresine ve bilgilendirme           SMS&rsquo;lerinin cep telefonuna gönderilmesini kabul etmiş sayılacaktır. Üye mail           ve/veya SMS almaktan vazgeçmek istemesi durumunda &ldquo;Benim Sayfam&rdquo; bölümündeki           &ldquo;Tercihlerim&rdquo; kısmından mail ve/veya SMS gönderim iptal işlemini           gerçekleştirebilecektir.</p>\r\n<p> <strong>4.           Sözleşmenin Feshi</strong></p>\r\n<p> İşbu sözleşme           üyenin üyeliğini iptal etmesi veya Marin Boat tarafından üyeliğinin iptal           edilmesine kadar yürürlükte kalacaktır. Marin Boat üyenin üyelik sözleşmesinin           herhangi bir hükmünü ihlal etmesi durumunda üyenin üyeliğini iptal ederek           sözleşmeyi tek taraflı olarak feshedebilecektir.</p>\r\n<p> <strong>5.           İhtilaflerin Halli</strong></p>\r\n<p> İşbu sözleşmeye           ilişkin ihtilaflerde İstanbul Mahkemeleri ve İcra Daireleri yetkilidir.</p>\r\n<p> <strong>6.           Yürürlük</strong></p>\r\n<p> Üyenin, üyelik           kaydı yapması üyenin üyelik sözleşmesinde yer alan tüm maddeleri okuduğu ve           üyelik sözleşmesinde yer alan maddeleri kabul ettiği anlamına gelir. İşbu           Sözleşme üyenin üye olması anında akdedilmiş ve karşılıklı olarak yürürlülüğe girmiştir.</p>',1,999,'2012-05-02 21:57:49',NULL,NULL),
 (238,999,234,'Üyelik sözleşmesini okudum, anladım ve onaylıyorum.',1,999,'2012-05-02 22:23:37',NULL,NULL),
 (239,999,235,'Kayıt olmak için lütfen, üyelik sözleşmesini okuyup onaylayınız.',1,999,'2012-05-02 22:33:04',NULL,NULL),
 (240,999,236,'<p><strong>SATIŞ SÖZLEŞMESİ</strong></p>\r\n<p><strong>A- TARAFLAR:</strong></p>\r\n<p>I- Satıcı : Marin Moat</p>\r\n<p>Adres : Atatürk Mh. Mustafa Kemal Paşa Cd. Atam Sk. No:3 İstanbul</p>\r\n<p>Kısaca : SATICI</p>\r\n<p>II- Alıcı : Adres :</p>\r\n<p>Kısaca : ALICI</p>\r\n<p><strong>B- KAPSAM VE SÜRE:</strong></p>\r\n<p>1) SATICI ile ALICI arasındaki aksi yazılı olarak kararlaştırılmayan tüm ticari ilişki ve işlemler, bu sözleşme hükümlerine tabidir.Bu sözleşme taraflar arasında daha önce sözleşmelere bağlanan ve/veya sözleşme olmaksızın gerçekleşen tüm ticari ilişki ve işlemlere de uygulanır.</p>\r\n<p>2) Bu sözleşme, taraflardan birisi tarafından gönderilen sözleşmenin feshine ilişkin ihbarın, muhataba ulaşmasına kadar geçerlidir.Ayrıca, ALICI’nın, herhangi bir borcunu gününde ödememesi ve/veya ALICI’ya SATICI tarafından keşide edilen poliçenin ademi kabul ve ademi tediyeden protesto edilmiş olması halinde, işbu sözleşme, hiçbir ihtar gerekmeksizin kendiliğinden feshedilmiş olacak ve SATICI’ya, bakiye alacağını tahsil için, ALICI aleyhine yasal yollara başvurma hakkını bahsedecektir.Ancak, işbu sözleşme hükümleri, feshe rağmen, SATICI’nın alacağı ödeninceye kadar uygulanacaktır.</p>\r\n<p><strong>C- SATIŞLAR:</strong></p>\r\n<p>1) Taraflar arasındaki, satışa konu emtianın, cinsi, kalitesi, miktarı, tutarı, ödeme şekli ve varsa özel şartlarını içeren sipariş belgeleri, özel bağlantı teklif belgeleri, sipariş mektupları, müşteri siparişi teyidi, faturalar ve yazılı özel anlaşmalar, bu sözleşmenin ayrılmaz parçası sayılır.Sözkonusu belgeler ile özel olarak düzenlenmeyen konularda, işbu sözleşme şarları geçerlidir.</p>\r\n<p>2) Taraflar arasında yazılı olarak kararlaştırılmamış ise satış konusu emtianın satış fiyatı fatura tarihinde SATICI’nın cari satış fiyatıdır.SATICI, fatura ve/veya teslim edilmemiş emtianın fiyat ve satış şartlarını ihbarsız değiştirebilir.</p>\r\n<p>3) Bu sözleşme, satışlar ve satışlarla ilgili tüm belgelerden ve kıymetli evraktan kaynaklanan tüm giderler ile vergi, resim ve harçların sorumluluğu ALICI’ya aittir ve ALICI tarafından ödenecektir.</p>\r\n<p><strong>D- BELGE VE ÖDEMELER I- ÖDEMELER</strong></p>\r\n<p>1) SATICI ve ALICI arasındaki ticari ilişki ve işlemlerden doğan hak ve borçların gününde ifası esastır.</p>\r\n<p>2) ALICI, satışa konu emtia bedelleri ile sair hususlardan doğan borçlarını, bunlara ait irsaliye ve/veya faturanın tanzimi anında, SATICI’nın kabul edeceği ödeme şekilleri ile kabul edilmez ise nakden kapatacaktır.</p>\r\n<p>3) Taraflar arasındaki bütün tediyelerin ispatı, imzalı makbuzla yapılmış olmasına bağlıdır.</p>\r\n<p>4) ALICI’nın ödemeleri, öncelikle SATICI’ya olan vade farkı ve temerrüt faizi borçalrına mahsup edilir.Nakten veya çek ile yapılan ödemeler, SATICI’nın doğmuş ve doğacak vade farkı ve temerrüt faizi alacaklarından vazgeçtiğini göstermez ve SATICI’nın bunları ALICI’dan talep hakları saklıdır.</p>\r\n<p>5) Fatura bedeli; mal bedeli ve/veya kur farkı, vade farkı ile temerrüt faizine uyuglanacak KDV’den oluşur.</p>\r\n<p>6) SATICI tarafından yapılan satışların bedelleri, ALICI tarafından vadeli ödenecek ise SATICI’nın tayin ve tespit ettiği şekilde ALICI’nın teminata bağlanması halinde vadeli satış mümkündür.</p>\r\n<p>7) Teminat olarak alınan kıymetlerin gerektirdiği masraflar esas itibariyle ALICI’ya aittir.SATICI uygun gördüğü taktirde bunların tamamını veya bir kısmını üstlenip üstlenmemekte serbesttir.ALICI’nın bu konuda herhangi bir talepte bulunma hakkı yoktur.</p>\r\n<p>8) ALICI’nın gösterdiği teminatlar SATICI tarafından yeterli bulunmadığı taktirde, SATICI, ALICI’nın vereceği siparişleri kabul edip etmemekte serbesttir.ALICI’nın bu konuda herhangi bir talepte bulunma hakkı yoktur.</p>\r\n<p>9) ALICI, borçlarına karşılık SATICI’nın yazılı kabülü ve vade farkı ayrıca hesaplanmak ve ödenmek üzere ve TTK’na göre düzenlemiş ve vergise keşide eden tarafından ödenmiş çek ve/veya bonoları SATICI’ya ciro ederek verebilir.SATICI, ALICI tarafından ciro edilen çeklerin postada veya bankada veya herhangi bir şekilde kaybından veya yok olmasından sorumlu tutulamaz.</p>\r\n<p>10) ALICI tarafından, SATICI’ya verilen kambiyo senetlerinin gününde tahsil edilmemesi veya herhangi bir nedenle zayii halinde, bunların turarı ile yapılan masrafları ve ödeme tarihine kadar %7 oranında temerrüt faizi, SATICI’nın ihbarı üzerine, nakden ve def’aten ödenir.Bu ihbarın, herhangi bir nedenler gecikmesinin sorumluluğu, nakit ödeme yerine kambiyo senedi veren ALICI’ya aittir.</p>\r\n<p>11) ALICI’nın keşide veya ciro edilerek SATICI’ya verdiği çek ve bonoların günlerinde ödenmemesi durumunda, bunların bedelleri SATICI’nın ilk ihbarında ALICI tarafından, vade gününden itibaren vade farkları da eklenerek SATICI’ya ödenecektir.Aksi halde, bu borç dahil ALICI’nın, SATICI’ya olan tüm borçları müeccel hale gelecektir.</p>\r\n<p>12) Harp, çatışma, dahili kargaşa, işgal, sabotaj, grev, lokavt, işçi ve memur direnişi, sel, deprem, yangın, ham veya yarımamul madde, yarı mamul madde ve malzeme ithal veya dahili piyasadan temininin mümkün olmaması, enerji kısıtlaması gibi SATICI’nın ihtiyarında olmayan sebeplerle satış akdinin SATICI tarafından yerine getirilmemesi/getirilememesi ve bunlarla sınırlı olmamak üzere kanunen kabul edilen sair mücbir sebep hallerinde, SATICI’nın ALICI’ya karşı hiçbir sorumluluğu yoktur.</p>\r\n<p><strong>II- HESAPLARIN KAPATILMASI VE VADE FARKLARI</strong></p>\r\n<p>1) SATICI’nın ALICI’ya kestiği her fatura, faturada belirtilen sürede, bedeli nakten ve/veya SATICI’nın yazılı kabülüne bağlı olmak üzere bu sözleşmede, belirtilen nitelikte çek ve/veya bonolarla kapatılır.Bono ve/veya çek verilerek kapatılan fatura bedellerinde, faturada belirtilen ödeme gününün aşılması halinde aylık %7 oranında vade farkı uygulanır.</p>\r\n<p>2) Hesapların, ALICI tarafından süresinde kapatılmaması halinde, ALICI’nın SATICI’ya senet ve/veya çekle kapatılmış olanlarda dahil, tüm borçları ve vade farkları, SATICI’nın herhangi bir ihbarına gerek olmaksızın müeccel olur.</p>\r\n<p>3) ALICI geciken ödemeleri için SATICI’ya aylık %7 vade farkı ödemeyi kabul etmiştir.</p>\r\n<p>4) ALICI’nın SATICI’ya verdiği çek ve bonoların ALICI’ya iade edilmiş olması, bunların bedellerinin ödendiğine dair SATICI tarafından düzenlenmiş ve imzalanmış bir makbuz olmadıkça, bedellerinin, masraflarının ve vade farklarının SATICI’ya ödendiğini ve SATICI’nın bunlardan vazgeçtiğini göstermez.</p>\r\n<p><strong>III- DEĞİŞİKLİKLER VE FESİH</strong></p>\r\n<p>1) Sözleşme ve temerrüt faizi oranlarında değişiklikler, SATICI tarafından yazılı olarak ALICI’ya iadeli mektupla gönderildiği tarihten itibaren uygulanır.Bu faiz oranlarını kabul etmeyen ALICI, borçlarını nakten ve def’aten ödemek zorundadır.Yeni faiz oranının yazılı olarak bildirilmediği hallerde faturada belirtilmemiş ise bu sözleşmede belirtilen %7 faiz oranı uygulanır.</p>\r\n<p>2) ALICI’nın, bu sözleşme hükümlerine aykırı davranışı halinde SATICI tüm haklarının ifasını ve alacaklarının ödenmesini ALICI’dan derhal talep hakkında sahiptir ve ALICI buna uymak zorundadır.Buna uyulmadığı taktirde SATICI’nın ALICI’daki tüm hak ve alacakları herhangi bir ihbara gerek kalmaksızın muaccel hale gelir.</p>\r\n<p>3) Taraflardan birisinin, TTK hükümlerine göre diğer tarafa yapacağı yazılı ihbar ile sözleşm feshedilir.Kim tarafından feshedilirse edilsin ALICI tüm borçlarını SATICI’ya nakden ve def’aten ödemek zorundadır.</p>\r\n<p><strong>E- GENEL HÜKÜMLER:</strong></p>\r\n<p><strong>I- İHBAR, İHTAR, TEYİD VE ADRES DEĞİŞİKLİKLERİ</strong></p>\r\n<p>1) Taraflar arasındaki her türlü ihbar, ihtar ve teyitler ile bunlara karşı itirazlar; telgraf, iadeli taahhütlü mektup veya noter aracılığı ile yapılır.</p>\r\n<p>2) Taraflar, adres değişikliklerini diğer tarafa 7(yedi) gün içerisinde yazılı olarak ihbar zorundadır.Bu ihbar yapılmadığı taktirde, sözleşmede mevcut adrese gönderilen tebligatlat, hukuken geçerli bir tebligatın tüm hukuki sonuçlarını doğuracaktır.</p>\r\n<p><strong>II- YETKİLİLERİN DEĞİŞMESİ VE DEVİR</strong></p>\r\n<p>1) ALICI, kendisini temsile yetkili şahıslar değiştiği taktirde bu durumu SATICI’ya anında bildirmek ve hazırlanan yeni imza sirkülerini tebliğ etmek zorundadır.ALICI, aksine davrandığı bu davranışının sonuçlarına katlanacaktır.</p>\r\n<p>2) Bu sözleşme, tarafların bütün kanuni ve akdi haleflerini bağlar ve akdi ve kanuni halefleri leh ve aleyhine hüküm ifade eder.ALICI sözleşme konusu işi ve doğacak haklarını SATICI’nın yazılı izni olmaksızını herhangi bir başkasına devir ve temlik edemez.</p>\r\n<p><strong>III- SÖZLEŞMENİN DEĞİŞİMİ VE İHTİLAF HALLERİ</strong></p>\r\n<p>1) Bu anlaşma ancak, tarafların yetkili mercilerince imzalanan ek sözleşme ile değiştirilebilir.Sürekli uygulamalar dahi, yazılı ve imzalı bir değişiklik yok ise, sözleşmenin değiştirildiği anlamında yorumlanamaz ve bu tür uygulamalar dayanılarak herhangi bir hak iddia edilemez.</p>\r\n<p>2) Bu sözleşmeden kaynaklanan ya da sözleşme ile ilgili ihtilafların halinde, HUMK</p>\r\n<p>287. maddesi gereğince SATICI’nın defter, kayıt ve belegeleri yegane delil ve İstanbul Mahkemeleri ve İcra Daireleri, münhasıran yetkili kabul edilmiştir. İşbu sözleşme tüm ekleriyle bir bütündür ve .................. tarihinde iki nüsha olarak tanzim ve taraflarca okunduktan sonra imza edilmiştir.</p>\r\n<p>SATICI / ALICI</p>',1,999,'2012-05-02 23:27:03',NULL,NULL),
 (241,999,237,'Garanti ve İade Şartları',1,999,'2012-05-02 23:50:27',999,'2012-05-02 23:50:42'),
 (242,999,238,'Gizlilik Politikası',1,999,'2012-05-02 23:50:33',999,'2012-05-02 23:50:42'),
 (243,999,239,'Satış Sözleşmesi',1,999,'2012-05-02 23:50:40',999,'2012-05-02 23:50:42'),
 (244,999,240,'<p><strong>Gizlilik Politikası</strong></p>\r\n<p>www.marinboat.com adresinden alışveriş yapmak için kayıt olmanız gerekmektedir. Kayıt olurken kullandığınız kişisel bilgiler (ad, soyad, kullanıcıadı, e-posta adresi, posta adresi, kredi kartı bilgileri, satın aldıklarınız vb.) kesinlikle başka kişi ve kuruluşlara verilmez. Bu bilgiler sizlere daha iyi hizmet verebilmemiz amacıyla kullanılır. Bilgileriniz yüksek güvenlik düzeyinde çalışan sunucularımızda, firma ürün veritabanının korunduğu sistemde tutulmaktadır.</p>\r\n<p>www.marinboat.com Globalsign sertifika ve lisansına sahiptir. Yaptığınız tüm işlemler 128 bit şifreleme ile gerçekleşmektedir. Sistemimize kaydettiğiniz kişisel bilgilerinize sadece siz ulaşabilir ve siz değiştirebilirsiniz. Başka birinin sizinle ilgili bilgilere ulaşması ve bunları değiştirmesi mümkün değildir.</p>\r\n<p>İstediğiniz zaman sitemize üyeliğinizi iptal edebilirsiniz.</p>\r\n<p>Üyeliğinizi sildiğinizde tüm kişisel bilgileriniz veritabanımızdan silinir. </p>\r\n',1,999,'2012-05-02 23:57:05',999,'2012-05-02 23:59:29'),
 (247,999,241,'Hesap Numaralarımız',1,999,'2012-05-03 00:06:03',NULL,NULL),
 (248,999,242,'Eklenmiş banka hesap numaramız bulunmamaktadır.',1,999,'2012-05-03 00:10:21',NULL,NULL),
 (249,999,243,'Bu markaya ait eklenmiş ürün bulunmuyor.',1,999,'2012-05-03 12:09:29',NULL,NULL),
 (250,999,244,'Arama Sonuçları',1,999,'2012-05-03 20:32:55',NULL,NULL),
 (251,999,245,'<p>{{FirmaLogo}}</p>\r\n<p>Sayın {{MusteriAdi}};</p>\r\n<p>Sitemize üye olduğunuz için teşekkür ederiz. Üyelik bilgileriniz aşağıdaki gibidir.</p>\r\n<p><strong>Kullanıcı adınız:</strong> {{MusteriEposta}}<br />\r\n<strong>Şifreniz:</strong> {{MusteriSifre}}</p>\r\n<p>Sitemizde alışverişe devam etmek için lütfen aşağıdaki bağlantıya tıklayıp üyeliğinizi aktif etmeniz gerekmektedir. Eğer aktivasyon linki aktif değilse, lütfen linki kopyalayıp kullandığınız tarayıcınızın adres bölümüne yapıştırınız.</p>\r\n<p>{{AktivasyonLink}}</p>\r\n<p>Bize göstermiş olduğunuz ilgi ve alakadan dolayı teşekkür ederiz.</p>\r\n<p>Saygılarımızla.</p>\r\n<p>{{FirmaAdi}}</p>',1,999,'2012-05-03 23:43:10',NULL,NULL),
 (252,999,246,'Üyelik Aktivasyon',1,999,'2012-05-03 23:54:06',NULL,NULL),
 (253,999,247,'<p>{{FirmaLogo}}</p>\r\n<p>Sayın {{MusteriAdi}};</p>\r\n<p>Bu e-posta sitemiz üzerimden yeni şifre talebi yapıldığı için tarafınıza gönderilmiştir. Eğer böyle bir işlem yapmadıysanız lütfen bu e-postayı önemsemeyip siliniz.</p>\r\n<p>Üyelik bilgileriniz aşağıdaki gibidir.</p>\r\n<p><strong>Kullanıcı adınız:</strong> {{MusteriEposta}}</p>\r\n<p>Şifrenizi yenilemek için lütfen aşağıdaki bağlantıya tıklayıp, açılan sayfada yeni şifrenizi yazmanız gerekmektedir. Eğer şifre yenileme linki aktif değilse, lütfen linki kopyalayıp kullandığınız tarayıcınızın adres bölümüne yapıştırınız.</p>\r\n<p>{{SifreDegistirLink}}</p>\r\n<p>Bize göstermiş olduğunuz ilgi ve alakadan dolayı teşekkür ederiz.</p>\r\n<p>Saygılarımızla.</p>\r\n<p>{{FirmaAdi}}</p>',1,999,'2012-05-04 00:45:21',999,'2012-05-04 01:01:46'),
 (254,999,248,'Yeni Şifre Talebi',1,999,'2012-05-04 00:50:42',NULL,NULL),
 (255,999,249,'Sistemde kayıtlı olan e-posta adresinize şifrenizi yenilemek için link gönderdik. Lütfen e-posta adresinizi kontrol ediniz.',1,999,'2012-05-04 00:53:15',NULL,NULL),
 (256,999,250,'Sistemde kayıtlı değilsiniz.',1,999,'2012-05-04 00:54:14',NULL,NULL),
 (257,999,251,'Şifre yenileme kodunuz hatalıdır. Lütfen tekrar yeni şifre talebinde bulununuz.',1,999,'2012-05-04 11:13:41',NULL,NULL),
 (258,999,252,'Yeni şifreniz başarıyla oluşturulmuştur. Hesabınıza yeni şifrenizle giriş yapabilirsiniz.',1,999,'2012-05-04 11:33:10',NULL,NULL),
 (259,999,253,'Hesabınız aktif edilmiştir. Üye giriş paneline yönlendiriliyorsunuz.',1,999,'2012-05-04 11:45:28',NULL,NULL),
 (260,999,254,'Onay kodunuz hatalıdır. Lütfen bizimle irtibat kurunuz.',1,999,'2012-05-04 11:46:28',NULL,NULL),
 (261,999,255,'Hesabınız zaten aktif durumdadır.',1,999,'2012-05-04 11:50:45',NULL,NULL),
 (262,999,256,'Yeniliklerden haberdar olmak istiyorum.',1,999,'2012-05-04 17:05:42',999,'2012-05-06 23:54:42'),
 (263,999,257,'Haber listemize kayıdınız başarıyla yapılmıştır.',1,999,'2012-05-04 20:56:01',NULL,NULL),
 (264,999,258,'E-posta adresiniz haber listemizde zaten mevcuttur.',1,999,'2012-05-04 20:57:00',NULL,NULL),
 (265,999,259,'<p>Sayın {{MusteriAdi}};</p>\r\n<p>{{SiparisNo}} nolu siparişiniz başarıyla tamamlanmıştır.</p>\r\n<p>Siparişinizin durumu hakkında detaylı bilgiye &quot;<a href=\"/order-tracking.aspx\">Sipariş Takibi</a>&quot; sayfasından ulaşabilirsiniz.</p>',1,999,'2012-05-04 23:53:09',NULL,NULL),
 (266,999,260,'<p>{{FirmaLogo}}</p>\r\n<p>Sayın {{MusteriAdi}};</p>\r\n<p>{{SiparisNo}} nolu siparişiniz başarıyla tamamlanmıştır. Sipariş detayları aşağıdaki gibidir.</p>\r\n<table>\r\n  <tr>\r\n    <td><strong>Sipariş No</strong></td>\r\n    <td><strong>:</strong></td>\r\n    <td>{{SiparisNo}}</td>\r\n  </tr>\r\n  <tr>\r\n    <td><strong>Ödeme Türü</strong></td>\r\n    <td><strong>:</strong></td>\r\n    <td>{{OdemeTur}}</td>\r\n  </tr>\r\n  <tr>\r\n    <td><strong>Ödenecek Tutar</strong></td>\r\n    <td><strong>:</strong></td>\r\n    <td>{{OdenecekTutar}}</td>\r\n  </tr>\r\n  <tr>\r\n    <td valign=\"top\"><strong>Diğer Bilgiler</strong></td>\r\n    <td valign=\"top\"><strong>:</strong></td>\r\n    <td>{{Aciklama}}</td>\r\n  </tr>\r\n</table>\r\n<br />\r\n<p>Siparişinizin durumu hakkında detaylı bilgiye &quot;Sipariş Takibi&quot; sayfasından ulaşabilirsiniz.</p>\r\n<p>{{FirmaAdi}}</p>',1,999,'2012-05-05 00:29:57',999,'2012-05-06 23:54:40'),
 (267,999,261,'{{SiparisNo}} nolu şipariş detayları',1,999,'2012-05-05 00:31:38',NULL,NULL),
 (268,999,262,'İptal',1,999,'2012-05-06 10:01:51',NULL,NULL),
 (269,999,263,'Vade Farkı',1,999,'2012-05-06 10:33:34',999,'2012-05-06 23:54:39'),
 (270,999,264,'Ödemenizin daha hızlı kontrol edilmesi için lütfen havale/eft açıklamasına sipariş numarasını yazınız.',1,999,'2012-05-06 18:41:24',NULL,NULL),
 (271,999,265,'Geçmiş ve güncel siparişlerinizin durumunu, kargo bilgilerini ve cari işlemlerini bu sayfalardan kontrol edebilirsiniz.',1,999,'2012-05-06 23:28:51',NULL,NULL),
 (272,999,266,'Üyelik bilgilerinizi güncelleme işlemlerini bu sayfalardan yapabilirsiniz.',1,999,'2012-05-06 23:29:41',NULL,NULL),
 (273,999,267,'Şirketimize ait banka hesap bilgilerini bu sayfalardan bulabilirsiniz.',1,999,'2012-05-06 23:30:07',999,'2012-05-06 23:54:36'),
 (274,999,268,'Siparişlerinizin tutarlarını ödedikten sonra bize daha hızlı bildirim yapmak için bu sayfadan bize bildirimde bulunabilirsiniz.',1,999,'2012-05-06 23:49:41',999,'2012-05-06 23:54:38'),
 (275,999,269,'Bize Sorun',1,999,'2012-05-06 23:54:29',NULL,NULL),
 (276,999,270,'Mağaza, ürün, iade, arıza, teknik sorunlar ve diğer konular hakkında istek, öneri ve şikayetlerinizi bu sayfalardan bize bildirebilirsiniz.',1,999,'2012-05-06 23:55:59',999,'2012-05-06 23:56:04'),
 (277,999,271,'Ürünler',1,999,'2012-05-15 12:12:44',NULL,NULL),
 (278,999,272,'Çok Satılanlara Göre',1,999,'2012-05-15 12:22:38',999,'2012-05-15 12:23:28'),
 (279,999,273,'Puanına Göre',1,999,'2012-05-15 12:22:47',999,'2012-05-15 12:23:28'),
 (280,999,274,'Fiyata Göre (Artan)',1,999,'2012-05-15 12:23:09',999,'2012-05-15 12:23:28'),
 (281,999,275,'Eklenme Tarihine Göre',1,999,'2012-05-15 12:23:15',999,'2012-05-15 12:23:28'),
 (282,999,276,'Ürün İsmine Göre',1,999,'2012-05-15 12:23:24',999,'2012-05-15 12:23:28'),
 (283,999,277,'&raquo; Ürün adedini değiştirmek için, &quot;Adet&quot; başlığı altında sıralanan ilgili ürün kutucuğuna istediğiniz rakamı girip &quot;Sepeti Güncelle&quot; tuşuna,<br />\r\n&raquo; Sepetinizdeki bir ürünü silmek için, ürün görselinin yanındaki kutucuğu işaretleyip &quot;Seçilenleri Sil&quot; tuşuna,<br />\r\n&raquo; Sepetinizi boşaltmak için ürün görseli yanındaki en üst kutucuğunu işaretleyip &quot;Sil&quot; tuşuna,<br />\r\n&raquo; Sepetinizdeki ürünleri satın almak için &quot;Alışverişi Tamamla&quot; tuşuna basın. (Bu adımdan sonra bile satın almaktan vazgeçebilirsiniz.)',1,999,'2012-05-19 12:19:23',999,'2012-05-19 12:21:46'),
 (284,999,278,'Önemli Bilgiler',1,999,'2012-05-19 12:48:26',NULL,NULL),
 (285,999,279,'&raquo; Siparişinizin gecikmemesi için, Havale/EFT işlemlerinde açıklama bölümüne sipariş numaranızı girmeniz gereklidir. Açıklama bölümüne bunun dışında bir şey yazmanıza gerek yoktur. Sipariş numaranızı &quot;Sipariş Onayı&quot; sayfasından sonra ekranda görebilirsiniz.<br />\r\n&raquo; EFT yaparken alıcı olarak {{FirmaAdi}} belirtilmelidir.',1,999,'2012-05-19 12:58:25',999,'2012-07-05 11:57:29'),
 (286,999,280,'Merhaba',1,999,'2012-05-22 00:05:53',NULL,NULL),
 (287,999,281,'Fatura adres bilgileri düzenlenmiştir.',1,999,'2012-06-26 17:59:05',999,'2012-07-05 11:57:27'),
 (288,999,282,'Sil',1,999,'2012-06-26 18:35:49',NULL,NULL),
 (289,999,283,'Seçtiğiniz fatura adresi silinmiştir.',1,999,'2012-06-27 12:38:26',NULL,NULL),
 (290,999,284,'Seçtiğiniz teslimat adresi silinmiştir.',1,999,'2012-06-27 12:38:52',NULL,NULL),
 (291,999,285,'Teslimat adres bilgisi düzenlenmiştir.',1,999,'2012-06-27 13:31:48',999,'2012-06-27 13:32:05'),
 (292,999,286,'Yeni fatura adres bilgisi eklenmiştir.',1,999,'2012-06-27 13:31:55',999,'2012-06-27 13:32:05'),
 (293,999,287,'Yeni teslimat adres bilgisi eklenmiştir.',1,999,'2012-06-27 13:32:02',999,'2012-06-27 13:32:05'),
 (294,999,288,'Taksit seçeneklerini ve kredi kartı puan kullanımını kullandığınız kredi kartına göre devam eden sayfadan seçebilirsiniz.<br /><br />Worldcard, Bonus Card, Shop&Miles, CardFinans, Maximum Kart, Axess, Advantage, AsyaCard, Türkiye Finans Kredi Kartları ve bu sayılan kart özelliklerine sahip diğer banka kredi kartları ile taksitli ve/veya puanlı alışveriş yapabilirsiniz.',1,999,'2012-07-05 11:57:20',NULL,'2012-07-05 12:00:01');
/*!40000 ALTER TABLE `tbl_textler` ENABLE KEYS */;


--
-- Definition of trigger `trg_textler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_textler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_textler_ek` BEFORE INSERT ON `tbl_textler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_textler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_textler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_textler_gun` BEFORE UPDATE ON `tbl_textler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_urunler`
--

DROP TABLE IF EXISTS `tbl_urunler`;
CREATE TABLE `tbl_urunler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dil_id` int(11) NOT NULL DEFAULT '-1',
  `kod_id` int(11) DEFAULT NULL,
  `resim_id` int(11) DEFAULT NULL,
  `resim_kategori_id` int(11) DEFAULT NULL,
  `video_kategori_id` int(11) DEFAULT NULL,
  `ad` varchar(110) NOT NULL DEFAULT '',
  `on_aciklama` longtext NOT NULL,
  `aciklama` longtext NOT NULL,
  `en` int(11) DEFAULT NULL COMMENT 'CM',
  `boy` int(11) DEFAULT NULL COMMENT 'CM',
  `yukseklik` int(11) DEFAULT NULL COMMENT 'CM',
  `desi` float(11,2) DEFAULT NULL,
  `kg` float(11,2) DEFAULT NULL,
  `fiyat` double(11,5) DEFAULT NULL,
  `para_birimi_id` int(11) NOT NULL DEFAULT '-1',
  `kdv_id` int(11) DEFAULT NULL,
  `kargo_hesaplama_id` int(11) NOT NULL DEFAULT '-1',
  `indirim_id` int(11) DEFAULT NULL,
  `stok` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 yok, 1 var',
  `yeni` tinyint(1) DEFAULT '0' COMMENT '0 hayır, 1 yeni ürün',
  `anasayfa` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 anasayfada yok, 1 ise var',
  `onay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ise onaysız, 1 ise onaylı',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `dil_id` (`dil_id`),
  KEY `onay` (`onay`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `resim_kategori_id` (`resim_kategori_id`),
  KEY `video_kategori_id` (`video_kategori_id`),
  KEY `kod_id` (`kod_id`),
  KEY `anasayfa` (`anasayfa`),
  KEY `resim_id` (`resim_id`),
  KEY `para_birimi_id` (`para_birimi_id`),
  KEY `kdv_id` (`kdv_id`),
  KEY `stok` (`stok`),
  KEY `kargo_hesaplama_id` (`kargo_hesaplama_id`) USING BTREE,
  KEY `en` (`en`),
  KEY `boy` (`boy`),
  KEY `yukseklik` (`yukseklik`),
  KEY `kg` (`kg`),
  KEY `yeni` (`yeni`),
  KEY `indirim_id` (`indirim_id`),
  CONSTRAINT `fk_kargo_hesaplama_id` FOREIGN KEY (`kargo_hesaplama_id`) REFERENCES `tbl_sbt_kargo_hesaplama_tip` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_dil_id` FOREIGN KEY (`dil_id`) REFERENCES `tbl_diller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_indirim_id` FOREIGN KEY (`indirim_id`) REFERENCES `tbl_indirimler` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_kdv_id` FOREIGN KEY (`kdv_id`) REFERENCES `tbl_sbt_kdv` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_kod_id` FOREIGN KEY (`kod_id`) REFERENCES `tbl_kodlar` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_para_birimi_id` FOREIGN KEY (`para_birimi_id`) REFERENCES `tbl_sbt_para_birim` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_resim_id` FOREIGN KEY (`resim_id`) REFERENCES `tbl_dosyalar` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_resim_kategori_id` FOREIGN KEY (`resim_kategori_id`) REFERENCES `tbl_dosyalar_kategori` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_video_id` FOREIGN KEY (`video_kategori_id`) REFERENCES `tbl_dosyalar_kategori` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_urunler`
--

/*!40000 ALTER TABLE `tbl_urunler` DISABLE KEYS */;
INSERT INTO `tbl_urunler` (`id`,`dil_id`,`kod_id`,`resim_id`,`resim_kategori_id`,`video_kategori_id`,`ad`,`on_aciklama`,`aciklama`,`en`,`boy`,`yukseklik`,`desi`,`kg`,`fiyat`,`para_birimi_id`,`kdv_id`,`kargo_hesaplama_id`,`indirim_id`,`stok`,`yeni`,`anasayfa`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (34,999,1,115,NULL,NULL,'Şişme Bot 281','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',30,20,50,1.00,NULL,654.00000,1,1,5,NULL,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-05-20 16:10:06'),
 (35,999,2,116,1,2,'Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,2.00,NULL,987.00000,2,1,5,1,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-05-20 16:10:08'),
 (36,999,3,117,NULL,NULL,'Şişme Bot 283','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',15,20,35,3.00,NULL,123.00000,1,1,5,NULL,1,1,0,1,999,'2012-04-22 20:35:38',999,'2012-05-06 11:35:47'),
 (37,999,1,118,1,2,'Şişme Bot 284','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,951.00000,1,1,1,2,1,0,0,1,999,'2012-04-22 20:35:38',999,'2012-03-30 14:39:09'),
 (38,999,2,119,NULL,NULL,'Şişme Bot 285','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,258.00000,2,1,1,NULL,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-04-24 22:38:41'),
 (39,999,3,120,1,2,'Şişme Bot 287','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,215.00000,1,1,1,1,1,0,0,1,999,'2012-04-22 20:35:38',999,'2012-03-30 14:39:08'),
 (40,999,1,115,NULL,NULL,'Şişme Bot 288','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,754.00000,1,1,1,NULL,1,1,0,1,999,'2012-04-22 20:35:38',999,'2012-03-30 14:39:08'),
 (41,999,2,116,1,2,'Şişme Bot 289','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,965.00000,2,1,1,2,1,1,1,1,999,'2012-04-22 20:35:38',999,'2012-04-28 11:31:42'),
 (42,999,3,117,NULL,NULL,'ŞİŞME BOT 290','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,853.00000,1,1,1,NULL,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-04-27 16:46:45'),
 (43,999,1,118,1,2,'Şişme Bot 291','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,625.00000,1,1,1,NULL,1,0,0,1,999,'2012-04-22 20:35:38',999,'2012-03-30 14:39:07'),
 (44,999,2,119,NULL,NULL,'Şişme Bot 292','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,158.00000,1,1,1,2,1,1,1,1,999,'2012-04-22 20:35:38',999,'2012-03-30 14:39:07'),
 (45,999,3,120,1,2,'Şişme Bot 293','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,458.00000,2,1,1,NULL,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-04-28 11:31:47'),
 (46,999,1,115,NULL,NULL,'Şişme Bot 294','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,1095.00000,1,1,1,NULL,1,0,0,1,999,'2012-04-22 20:35:38',999,'2012-03-30 14:39:07'),
 (47,999,2,115,1,2,'Şişme Bot 295','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,985.00000,2,1,1,NULL,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-05-20 16:24:33'),
 (48,999,3,116,NULL,NULL,'Şişme Bot 296','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,785.00000,1,1,1,2,1,1,1,1,999,'2012-04-22 20:35:38',999,'2012-03-30 14:39:06'),
 (49,999,1,117,1,2,'Şişme Bot 297','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,236.00000,1,1,1,NULL,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-03-30 14:39:06'),
 (50,999,2,118,NULL,NULL,'Şişme Bot 298','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,1248.00000,2,1,1,NULL,1,0,0,1,999,'2012-04-22 20:35:38',999,'2012-04-24 22:38:44'),
 (51,999,3,119,1,2,'Şişme Bot 299','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,478.00000,1,1,1,1,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-03-30 14:39:06'),
 (53,999,1,120,1,2,'Şişme Bot 300','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,963.00000,2,1,1,NULL,1,1,1,1,999,'2012-04-22 20:35:38',999,'2012-04-28 11:31:45'),
 (55,999,2,115,1,2,'Şişme Bot 301','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,1142.00000,1,1,1,NULL,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-03-30 14:39:05'),
 (57,999,3,116,1,2,'Şişme Bot 302','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,555.00000,2,1,1,NULL,1,0,0,1,999,'2012-04-22 20:35:38',999,'2012-04-24 22:38:45'),
 (58,999,1,117,NULL,NULL,'Şişme Bot 303','gfgfdgfgfgf<br/>g<br/>fg<br/>f<br/>gf','gfgfdgfgfgf<br/>g<br/>fg<br/>f<br/>gf',0,0,0,0.00,0.00,588.00000,1,1,1,1,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-05-20 16:25:24'),
 (59,999,2,118,NULL,NULL,'Şişme Bot 304','gfdgdfgdfg<br/>\r\n<br/>\r\nfdg<br/>\r\n<br/>\r\nfd<br/>\r\n<br/>\r\ngfd<br/>\r\n<br/>\r\ng<br/>\r\n<br/>\r\nfg<br/>\r\n<br/>\r\nfdg<br/>\r\n<br/>\r\nfg<br/>\r\n<br/>\r\ndf','gfdgdfgdfg<br/>\r\nfdg<br/>\r\nfd<br/>\r\ngfd<br/>\r\ng<br/>\r\nfg<br/>\r\nfdg<br/>\r\nfg<br/>\r\ndf',NULL,NULL,NULL,NULL,NULL,487.00000,1,1,1,NULL,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-03-30 14:39:05');
/*!40000 ALTER TABLE `tbl_urunler` ENABLE KEYS */;


--
-- Definition of trigger `trg_urunler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_urunler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_urunler_ek` BEFORE INSERT ON `tbl_urunler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_urunler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_urunler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_urunler_gun` BEFORE UPDATE ON `tbl_urunler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_urunler_etiketler`
--

DROP TABLE IF EXISTS `tbl_urunler_etiketler`;
CREATE TABLE `tbl_urunler_etiketler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etiket_id` int(11) NOT NULL DEFAULT '-1',
  `urun_id` int(11) NOT NULL DEFAULT '-1',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `etiket_id` (`etiket_id`),
  KEY `urun_id` (`urun_id`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  CONSTRAINT `fk_urunler_etiketler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_etiketler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_etiketler_etiket_id` FOREIGN KEY (`etiket_id`) REFERENCES `tbl_etiketler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_etiketler_urun_id` FOREIGN KEY (`urun_id`) REFERENCES `tbl_urunler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_urunler_etiketler`
--

/*!40000 ALTER TABLE `tbl_urunler_etiketler` DISABLE KEYS */;
INSERT INTO `tbl_urunler_etiketler` (`id`,`etiket_id`,`urun_id`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (2,67,34,999,'2012-05-01 22:55:01',NULL,NULL),
 (3,68,35,999,'2012-05-01 22:55:07',999,'2012-05-03 10:56:38'),
 (4,69,36,999,'2012-05-01 22:55:13',999,'2012-05-03 10:56:35'),
 (5,70,37,999,'2012-05-01 22:55:20',999,'2012-05-03 10:56:34'),
 (8,71,38,999,'2012-05-03 10:56:10',999,'2012-05-03 10:56:33'),
 (9,72,39,999,'2012-05-03 10:56:31',NULL,NULL),
 (10,73,34,999,'2012-05-03 10:56:48',NULL,NULL),
 (11,74,34,999,'2012-05-03 10:56:57',NULL,NULL),
 (14,76,34,999,'2012-05-03 10:57:18',NULL,NULL);
/*!40000 ALTER TABLE `tbl_urunler_etiketler` ENABLE KEYS */;


--
-- Definition of trigger `trg_urunler_etiketler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_urunler_etiketler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_urunler_etiketler_ek` BEFORE INSERT ON `tbl_urunler_etiketler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_urunler_etiketler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_urunler_etiketler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_urunler_etiketler_gun` BEFORE UPDATE ON `tbl_urunler_etiketler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_urunler_kategoriler`
--

DROP TABLE IF EXISTS `tbl_urunler_kategoriler`;
CREATE TABLE `tbl_urunler_kategoriler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `urun_id` int(11) NOT NULL DEFAULT '-1',
  `kategori_id` int(11) NOT NULL DEFAULT '-1',
  `ana` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Ana kategori',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `urun_id` (`urun_id`),
  KEY `kategori_id` (`kategori_id`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `ana` (`ana`),
  CONSTRAINT `fk_urunler_kategoriler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_kategoriler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_kategoriler_kategori_id` FOREIGN KEY (`kategori_id`) REFERENCES `tbl_kategoriler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_kategoriler_urun_id` FOREIGN KEY (`urun_id`) REFERENCES `tbl_urunler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_urunler_kategoriler`
--

/*!40000 ALTER TABLE `tbl_urunler_kategoriler` DISABLE KEYS */;
INSERT INTO `tbl_urunler_kategoriler` (`id`,`urun_id`,`kategori_id`,`ana`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,34,12,1,999,'2012-04-27 16:46:45',999,'2012-05-03 11:24:43'),
 (2,35,12,1,999,'2012-04-27 16:46:45',999,'2012-05-03 11:24:56'),
 (3,36,12,1,999,'2012-04-27 16:46:45',999,'2012-05-03 11:24:59'),
 (4,37,12,1,999,'2012-04-27 16:46:46',999,'2012-05-03 11:25:00'),
 (5,38,12,1,999,'2012-04-27 16:46:46',999,'2012-05-03 11:25:01'),
 (6,39,34,1,999,'2012-04-27 16:46:46',999,'2012-05-03 11:25:03'),
 (7,34,37,0,999,'2012-04-27 16:46:46',999,'2012-05-02 14:20:05'),
 (8,34,39,0,999,'2012-04-27 16:46:46',999,'2012-05-02 14:20:00'),
 (9,40,41,1,999,'2012-04-27 16:46:46',999,'2012-05-03 11:25:04'),
 (10,41,20,1,999,'2012-05-02 14:19:15',999,'2012-05-03 11:25:14'),
 (11,42,21,1,999,'2012-05-02 14:19:20',999,'2012-05-03 11:25:14'),
 (12,43,22,1,999,'2012-05-02 14:19:25',999,'2012-05-03 11:25:15'),
 (13,43,23,1,999,'2012-05-02 14:19:31',999,'2012-05-03 11:25:16'),
 (14,44,24,1,999,'2012-05-02 14:19:36',999,'2012-05-03 11:25:17'),
 (15,45,25,1,999,'2012-05-02 14:19:43',999,'2012-05-03 11:25:18'),
 (16,46,26,1,999,'2012-05-02 14:19:49',999,'2012-05-03 11:25:09');
/*!40000 ALTER TABLE `tbl_urunler_kategoriler` ENABLE KEYS */;


--
-- Definition of trigger `trg_urunler_kategoriler_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_urunler_kategoriler_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_urunler_kategoriler_ek` BEFORE INSERT ON `tbl_urunler_kategoriler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_urunler_kategoriler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_urunler_kategoriler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_urunler_kategoriler_gun` BEFORE UPDATE ON `tbl_urunler_kategoriler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_urunler_markalar`
--

DROP TABLE IF EXISTS `tbl_urunler_markalar`;
CREATE TABLE `tbl_urunler_markalar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `urun_id` int(11) NOT NULL DEFAULT '-1',
  `marka_id` int(11) NOT NULL DEFAULT '-1',
  `ana` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Ana marka',
  `admin_id_ek` int(11) DEFAULT NULL COMMENT 'Ekleyen admin',
  `tarih_ek` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `urun_id` (`urun_id`),
  KEY `admin_id_ek` (`admin_id_ek`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `marka_id` (`marka_id`),
  KEY `ana` (`ana`),
  CONSTRAINT `fk_urunler_markalar_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_markalar_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_markalar_marka_id` FOREIGN KEY (`marka_id`) REFERENCES `tbl_markalar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_urunler_markalar_urun_id` FOREIGN KEY (`urun_id`) REFERENCES `tbl_urunler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_urunler_markalar`
--

/*!40000 ALTER TABLE `tbl_urunler_markalar` DISABLE KEYS */;
INSERT INTO `tbl_urunler_markalar` (`id`,`urun_id`,`marka_id`,`ana`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,34,1,0,999,'2012-04-27 16:46:45',999,'2012-05-01 23:10:35'),
 (2,34,2,0,999,'2012-04-27 16:46:45',999,'2012-05-01 23:10:36'),
 (3,34,3,0,999,'2012-04-27 16:46:45',999,'2012-05-01 23:10:37'),
 (4,34,4,0,999,'2012-04-27 16:46:45',999,'2012-05-01 23:10:38'),
 (7,35,4,0,999,'2012-05-02 23:14:34',NULL,NULL),
 (8,36,4,0,999,'2012-05-02 23:14:39',NULL,NULL),
 (9,37,4,0,999,'2012-05-02 23:14:44',NULL,NULL),
 (10,38,4,0,999,'2012-05-02 23:14:49',NULL,NULL);
/*!40000 ALTER TABLE `tbl_urunler_markalar` ENABLE KEYS */;


--
-- Definition of trigger `trg_urunler_markalar_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_urunler_markalar_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_urunler_markalar_ek` BEFORE INSERT ON `tbl_urunler_markalar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_urunler_markalar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_urunler_markalar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_urunler_markalar_gun` BEFORE UPDATE ON `tbl_urunler_markalar` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
END $$

DELIMITER ;

--
-- Definition of table `tbl_ziyaretler`
--

DROP TABLE IF EXISTS `tbl_ziyaretler`;
CREATE TABLE `tbl_ziyaretler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tip` int(1) DEFAULT '-1' COMMENT '0 ÜRÜN, 1 KATEGORİ, 2 ETİKET, 3 MARKA',
  `urun_id` int(11) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `etiket_id` int(11) DEFAULT NULL,
  `marka_id` int(11) DEFAULT NULL,
  `tarih` datetime DEFAULT NULL COMMENT 'Eklenme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `urun_id` (`urun_id`),
  KEY `kategori_id` (`kategori_id`),
  KEY `etiket_id` (`etiket_id`),
  KEY `tarih` (`tarih`),
  KEY `marka_id` (`marka_id`),
  KEY `tip` (`tip`),
  CONSTRAINT `fk_ziyaretler_etiket_id` FOREIGN KEY (`etiket_id`) REFERENCES `tbl_etiketler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ziyaretler_kategori_id` FOREIGN KEY (`kategori_id`) REFERENCES `tbl_kategoriler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ziyaretler_marka_id` FOREIGN KEY (`marka_id`) REFERENCES `tbl_markalar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ziyaretler_urun_id` FOREIGN KEY (`urun_id`) REFERENCES `tbl_urunler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_ziyaretler`
--

/*!40000 ALTER TABLE `tbl_ziyaretler` DISABLE KEYS */;
INSERT INTO `tbl_ziyaretler` (`id`,`tip`,`urun_id`,`kategori_id`,`etiket_id`,`marka_id`,`tarih`) VALUES 
 (3,2,NULL,NULL,68,NULL,'2012-04-16 00:50:15'),
 (4,2,NULL,NULL,68,NULL,'2012-04-16 00:50:17'),
 (5,2,NULL,NULL,67,NULL,'2012-04-16 00:50:19'),
 (6,2,NULL,NULL,72,NULL,'2012-04-16 00:50:21'),
 (8,2,NULL,NULL,68,NULL,'2012-04-16 00:50:25'),
 (9,2,NULL,NULL,68,NULL,'2012-04-16 00:50:27'),
 (22,3,NULL,NULL,NULL,2,'2012-04-16 00:51:21'),
 (25,2,NULL,NULL,67,NULL,'2012-04-16 01:34:55'),
 (26,2,NULL,NULL,76,NULL,'2012-04-16 01:34:58'),
 (29,2,NULL,NULL,76,NULL,'2012-04-16 01:35:04'),
 (30,2,NULL,NULL,76,NULL,'2012-04-16 02:13:33'),
 (31,2,NULL,NULL,76,NULL,'2012-04-16 02:14:06'),
 (32,2,NULL,NULL,76,NULL,'2012-04-16 02:14:30'),
 (35,2,NULL,NULL,67,NULL,'2012-04-16 02:20:44'),
 (36,2,NULL,NULL,68,NULL,'2012-04-16 02:20:46'),
 (37,0,34,NULL,NULL,NULL,'2012-05-03 20:46:22'),
 (38,0,34,NULL,NULL,NULL,'2012-05-03 20:48:30'),
 (39,1,NULL,37,NULL,NULL,'2012-05-03 20:49:20'),
 (40,1,NULL,25,NULL,NULL,'2012-05-03 20:50:05'),
 (41,1,NULL,19,NULL,NULL,'2012-05-03 20:51:48'),
 (43,1,NULL,26,NULL,NULL,'2012-05-03 20:52:00'),
 (44,0,46,NULL,NULL,NULL,'2012-05-03 20:52:09'),
 (45,3,NULL,NULL,NULL,4,'2012-05-03 20:55:22'),
 (46,0,34,NULL,NULL,NULL,'2012-05-03 21:13:52'),
 (47,0,34,NULL,NULL,NULL,'2012-05-03 21:16:21'),
 (48,0,34,NULL,NULL,NULL,'2012-05-03 21:16:32'),
 (49,0,34,NULL,NULL,NULL,'2012-05-03 21:16:35'),
 (50,0,34,NULL,NULL,NULL,'2012-05-03 21:18:13'),
 (51,0,34,NULL,NULL,NULL,'2012-05-03 21:18:16'),
 (52,0,34,NULL,NULL,NULL,'2012-05-03 21:18:36'),
 (53,0,34,NULL,NULL,NULL,'2012-05-03 21:22:40'),
 (54,3,NULL,NULL,NULL,1,'2012-05-03 22:00:42'),
 (55,0,36,NULL,NULL,NULL,'2012-05-03 22:00:48'),
 (56,1,NULL,32,NULL,NULL,'2012-05-03 22:00:54'),
 (57,0,36,NULL,NULL,NULL,'2012-05-04 15:56:54'),
 (58,0,36,NULL,NULL,NULL,'2012-05-04 15:57:10'),
 (59,0,36,NULL,NULL,NULL,'2012-05-04 15:57:13'),
 (60,0,35,NULL,NULL,NULL,'2012-05-05 18:28:14'),
 (61,1,NULL,12,NULL,NULL,'2012-05-05 18:50:55'),
 (62,0,38,NULL,NULL,NULL,'2012-05-06 12:30:39'),
 (63,3,NULL,NULL,NULL,1,'2012-05-07 01:05:44'),
 (64,3,NULL,NULL,NULL,1,'2012-05-07 01:07:07'),
 (65,1,NULL,12,NULL,NULL,'2012-05-07 01:11:05'),
 (66,1,NULL,12,NULL,NULL,'2012-05-07 01:11:24'),
 (67,0,34,NULL,NULL,NULL,'2012-05-07 01:11:31'),
 (68,0,35,NULL,NULL,NULL,'2012-05-07 01:12:36'),
 (69,0,35,NULL,NULL,NULL,'2012-05-07 21:18:56'),
 (70,1,NULL,12,NULL,NULL,'2012-05-13 23:21:26'),
 (71,1,NULL,12,NULL,NULL,'2012-05-13 23:22:04'),
 (72,3,NULL,NULL,NULL,1,'2012-05-13 23:22:47'),
 (73,3,NULL,NULL,NULL,3,'2012-05-13 23:23:52'),
 (74,1,NULL,12,NULL,NULL,'2012-05-13 23:24:46'),
 (75,1,NULL,31,NULL,NULL,'2012-05-13 23:48:02'),
 (76,1,NULL,12,NULL,NULL,'2012-05-15 00:48:46'),
 (77,1,NULL,12,NULL,NULL,'2012-05-15 00:49:07'),
 (78,3,NULL,NULL,NULL,1,'2012-05-15 00:50:48'),
 (79,3,NULL,NULL,NULL,1,'2012-05-15 00:51:55'),
 (80,1,NULL,12,NULL,NULL,'2012-05-15 12:04:09'),
 (81,1,NULL,12,NULL,NULL,'2012-05-15 12:07:21'),
 (82,1,NULL,12,NULL,NULL,'2012-05-15 12:07:31'),
 (83,1,NULL,12,NULL,NULL,'2012-05-15 12:09:28'),
 (84,1,NULL,12,NULL,NULL,'2012-05-15 12:09:49'),
 (85,1,NULL,12,NULL,NULL,'2012-05-15 12:10:07'),
 (86,1,NULL,12,NULL,NULL,'2012-05-15 12:13:35'),
 (87,0,34,NULL,NULL,NULL,'2012-05-15 12:13:44'),
 (88,0,34,NULL,NULL,NULL,'2012-05-15 12:14:46'),
 (89,1,NULL,12,NULL,NULL,'2012-05-15 12:15:20'),
 (90,1,NULL,12,NULL,NULL,'2012-05-15 12:24:43'),
 (91,1,NULL,12,NULL,NULL,'2012-05-17 23:04:30'),
 (92,1,NULL,12,NULL,NULL,'2012-05-17 23:09:06'),
 (93,1,NULL,12,NULL,NULL,'2012-05-17 23:22:03'),
 (94,1,NULL,12,NULL,NULL,'2012-05-17 23:23:27'),
 (95,1,NULL,12,NULL,NULL,'2012-05-17 23:23:47'),
 (96,0,44,NULL,NULL,NULL,'2012-05-18 09:36:32'),
 (97,0,44,NULL,NULL,NULL,'2012-05-18 20:19:48'),
 (98,1,NULL,22,NULL,NULL,'2012-05-18 20:19:53'),
 (99,1,NULL,22,NULL,NULL,'2012-05-18 20:20:31'),
 (100,3,NULL,NULL,NULL,2,'2012-05-18 20:21:01'),
 (101,3,NULL,NULL,NULL,2,'2012-05-18 20:21:32'),
 (102,0,41,NULL,NULL,NULL,'2012-05-18 23:04:20'),
 (103,0,41,NULL,NULL,NULL,'2012-05-18 23:06:33'),
 (104,1,NULL,21,NULL,NULL,'2012-05-23 02:02:06'),
 (105,1,NULL,27,NULL,NULL,'2012-05-23 02:02:15'),
 (106,0,58,NULL,NULL,NULL,'2012-05-24 23:32:59'),
 (107,0,58,NULL,NULL,NULL,'2012-05-25 00:11:19'),
 (108,0,58,NULL,NULL,NULL,'2012-05-25 00:14:47'),
 (109,0,58,NULL,NULL,NULL,'2012-05-25 00:21:56'),
 (110,1,NULL,12,NULL,NULL,'2012-06-04 09:41:10'),
 (111,0,34,NULL,NULL,NULL,'2012-06-04 09:41:31'),
 (112,0,34,NULL,NULL,NULL,'2012-06-04 09:42:00'),
 (113,0,34,NULL,NULL,NULL,'2012-06-04 09:42:04'),
 (114,1,NULL,12,NULL,NULL,'2012-06-06 12:07:48'),
 (115,0,41,NULL,NULL,NULL,'2012-06-06 12:08:00'),
 (116,3,NULL,NULL,NULL,7,'2012-06-06 12:09:12'),
 (117,1,NULL,18,NULL,NULL,'2012-06-06 12:09:34'),
 (118,1,NULL,12,NULL,NULL,'2012-06-06 15:22:09'),
 (119,3,NULL,NULL,NULL,2,'2012-06-06 15:23:09'),
 (120,0,55,NULL,NULL,NULL,'2012-06-08 20:50:38'),
 (121,1,NULL,27,NULL,NULL,'2012-06-22 19:47:29'),
 (122,1,NULL,27,NULL,NULL,'2012-06-22 19:48:20');
/*!40000 ALTER TABLE `tbl_ziyaretler` ENABLE KEYS */;


--
-- Definition of trigger `trg_ziyaretler`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_ziyaretler`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_ziyaretler` BEFORE INSERT ON `tbl_ziyaretler` FOR EACH ROW BEGIN
SET NEW.tarih = NOW();
END $$

DELIMITER ;

--
-- Definition of view `view_dosyalar_kategori`
--

DROP TABLE IF EXISTS `view_dosyalar_kategori`;
DROP VIEW IF EXISTS `view_dosyalar_kategori`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `view_dosyalar_kategori` AS select `c`.`id` AS `id`,(case when (`c`.`tip` = 0) then 'RESİM' when (`c`.`tip` = 1) then 'VIDEO' else 'DİĞER' end) AS `tip`,`c`.`ad` AS `ad`,ifnull((select `t`.`id` from `tbl_dosyalar_kategori` `t` USE INDEX (`id`) where (`t`.`id` = `c`.`kategori_id`)),0) AS `ust_kategori_id`,ifnull((select `k`.`ad` from `tbl_dosyalar_kategori` `k` USE INDEX (`id`) where (`k`.`id` = `c`.`kategori_id`)),NULL) AS `ust_kategori_baslik` from `tbl_dosyalar_kategori` `c` USE INDEX (`id`);

--
-- Definition of view `view_kategoriler`
--

DROP TABLE IF EXISTS `view_kategoriler`;
DROP VIEW IF EXISTS `view_kategoriler`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `view_kategoriler` AS select `c`.`id` AS `id`,`c`.`dil_id` AS `dil_id`,`c`.`ad` AS `ad`,ifnull((select `t`.`id` from `tbl_kategoriler` `t` USE INDEX (`id`) where (`t`.`id` = `c`.`kategori_id`)),0) AS `ust_kategori_id`,ifnull((select `k`.`ad` from `tbl_kategoriler` `k` USE INDEX (`id`) where (`k`.`id` = `c`.`kategori_id`)),NULL) AS `ust_kategori_baslik` from `tbl_kategoriler` `c` USE INDEX (`id`) where (`c`.`onay` = 1);

--
-- Definition of view `view_sayfa`
--

DROP TABLE IF EXISTS `view_sayfa`;
DROP VIEW IF EXISTS `view_sayfa`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `view_sayfa` AS select `s`.`id` AS `text_id`,`d`.`dil` AS `dil`,`s`.`sabitler_id` AS `sabitler_id`,cast((select `k`.`aciklama` from `tbl_sbt_sabit` `k` USE INDEX (`id`) where (`k`.`id` = `s`.`sabitler_id`)) as char(500) charset utf8) AS `sabit`,cast(`s`.`text` as char(500) charset utf8) AS `text`,`t`.`sayfa` AS `sayfa`,(case when (`s`.`onay` = 0) then 'HAYIR' when (`s`.`onay` = 1) then 'EVET' end) AS `onay` from ((`tbl_textler` `s` join `tbl_sbt_sabit` `t`) join `tbl_diller` `d`) where ((`t`.`xml` = 1) and (`s`.`sabitler_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`));

--
-- Definition of view `view_sayfa_kontrol`
--

DROP TABLE IF EXISTS `view_sayfa_kontrol`;
DROP VIEW IF EXISTS `view_sayfa_kontrol`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `view_sayfa_kontrol` AS select (select `k`.`id` from `tbl_textler` `k` USE INDEX (`id`) where (`k`.`sabitler_id` = `t`.`id`)) AS `text_id`,if(((select `s`.`text` from `tbl_textler` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`sabitler_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) <=> NULL),'YOK','VAR') AS `sonuc`,`t`.`id` AS `sabitler_id`,`t`.`sayfa` AS `sayfa`,`d`.`dil` AS `dil`,`t`.`aciklama` AS `sabit`,if(((select `s`.`text` from `tbl_textler` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`sabitler_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) <=> NULL),NULL,cast((select `s`.`text` from `tbl_textler` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`sabitler_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) as char(500) charset utf8)) AS `text`,(select (case when (`s`.`onay` = 0) then 'HAYIR' when (`s`.`onay` = 1) then 'EVET' else NULL end) from `tbl_textler` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`sabitler_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) AS `onay` from (`tbl_sbt_sabit` `t` join `tbl_diller` `d` USE INDEX (`id`)) where (`t`.`xml` = 1) order by `d`.`id`,`t`.`id`;

--
-- Definition of view `view_siparis_durumlar`
--

DROP TABLE IF EXISTS `view_siparis_durumlar`;
DROP VIEW IF EXISTS `view_siparis_durumlar`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `view_siparis_durumlar` AS select `s`.`id` AS `text_id`,`t`.`dil` AS `dil`,`s`.`siparis_durum_id` AS `sabitler_id`,`k`.`ad` AS `sabit`,`s`.`text` AS `text`,(case when (`s`.`onay` = 0) then 'HAYIR' when (`s`.`onay` = 1) then 'EVET' end) AS `onay` from ((`tbl_siparis_durumlar` `s` join `tbl_diller` `t` on((`s`.`dil_id` = `t`.`id`))) join `tbl_sbt_siparis_durum` `k` on((`s`.`siparis_durum_id` = `k`.`id`))) order by `s`.`siparis_durum_id`;

--
-- Definition of view `view_siparis_durumlar_kontrol`
--

DROP TABLE IF EXISTS `view_siparis_durumlar_kontrol`;
DROP VIEW IF EXISTS `view_siparis_durumlar_kontrol`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `view_siparis_durumlar_kontrol` AS select (select `k`.`id` from `tbl_siparis_durumlar` `k` USE INDEX (`id`) where (`k`.`siparis_durum_id` = `t`.`id`)) AS `text_id`,if(((select `s`.`text` from `tbl_siparis_durumlar` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`siparis_durum_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) <=> NULL),'YOK','VAR') AS `sonuc`,`t`.`id` AS `siparis_durum_id`,`d`.`dil` AS `dil`,`t`.`ad` AS `sabit`,if(((select `s`.`text` from `tbl_siparis_durumlar` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`siparis_durum_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) <=> NULL),NULL,cast((select `s`.`text` from `tbl_siparis_durumlar` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`siparis_durum_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) as char(500) charset utf8)) AS `text`,(select (case when (`s`.`onay` = 0) then 'HAYIR' when (`s`.`onay` = 1) then 'EVET' else NULL end) from `tbl_siparis_durumlar` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`siparis_durum_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) AS `onay` from (`tbl_sbt_siparis_durum` `t` join `tbl_diller` `d` USE INDEX (`id`)) order by `d`.`id`,`t`.`id`;

--
-- Definition of view `view_tablo_detaylari`
--

DROP TABLE IF EXISTS `view_tablo_detaylari`;
DROP VIEW IF EXISTS `view_tablo_detaylari`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `view_tablo_detaylari` AS select `t`.`TABLE_NAME` AS `TABLE_NAME`,`t`.`TABLE_TYPE` AS `TABLE_TYPE`,`t`.`ENGINE` AS `ENGINE`,`t`.`ROW_FORMAT` AS `ROW_FORMAT`,`t`.`TABLE_ROWS` AS `TABLE_ROWS`,`t`.`AVG_ROW_LENGTH` AS `AVG_ROW_LENGTH`,`t`.`INDEX_LENGTH` AS `INDEX_LENGTH`,`t`.`AUTO_INCREMENT` AS `AUTO_INCREMENT`,`t`.`CREATE_TIME` AS `CREATE_TIME`,`t`.`UPDATE_TIME` AS `UPDATE_TIME`,`t`.`CHECK_TIME` AS `CHECK_TIME`,`t`.`TABLE_COLLATION` AS `TABLE_COLLATION`,`t`.`CREATE_OPTIONS` AS `CREATE_OPTIONS`,`t`.`TABLE_COMMENT` AS `TABLE_COMMENT` from `information_schema`.`tables` `t` where ((`t`.`TABLE_SCHEMA` = 'shop2') and (`t`.`TABLE_NAME` <> 'view_tablo_detaylari')) order by `t`.`TABLE_NAME`;

--
-- Definition of view `view_text`
--

DROP TABLE IF EXISTS `view_text`;
DROP VIEW IF EXISTS `view_text`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `view_text` AS select `s`.`id` AS `text_id`,`d`.`dil` AS `dil`,`s`.`sabitler_id` AS `sabitler_id`,cast((select `k`.`aciklama` from `tbl_sbt_sabit` `k` USE INDEX (`id`) where (`k`.`id` = `s`.`sabitler_id`)) as char(500) charset utf8) AS `sabit`,cast(`s`.`text` as char(500) charset utf8) AS `text`,(case when (`s`.`onay` = 0) then 'HAYIR' when (`s`.`onay` = 1) then 'EVET' end) AS `onay` from ((`tbl_textler` `s` join `tbl_sbt_sabit` `t`) join `tbl_diller` `d`) where ((`t`.`xml` = 0) and (`s`.`sabitler_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`));

--
-- Definition of view `view_text-sayfa_kontrol`
--

DROP TABLE IF EXISTS `view_text-sayfa_kontrol`;
DROP VIEW IF EXISTS `view_text-sayfa_kontrol`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `view_text-sayfa_kontrol` AS select (select `k`.`id` from `tbl_textler` `k` USE INDEX (`id`) where (`k`.`sabitler_id` = `t`.`id`)) AS `text_id`,if(((select `s`.`text` from `tbl_textler` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`sabitler_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) <=> NULL),'YOK','VAR') AS `sonuc`,`t`.`id` AS `sabitler_id`,if((`t`.`xml` = 1),'XML',NULL) AS `tip`,`t`.`sayfa` AS `sayfa`,`d`.`dil` AS `dil`,`t`.`aciklama` AS `sabit`,if(((select `s`.`text` from `tbl_textler` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`sabitler_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) <=> NULL),NULL,cast((select `s`.`text` from `tbl_textler` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`sabitler_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) as char(500) charset utf8)) AS `text`,(select (case when (`s`.`onay` = 0) then 'HAYIR' when (`s`.`onay` = 1) then 'EVET' else NULL end) from `tbl_textler` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`sabitler_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) AS `onay` from (`tbl_sbt_sabit` `t` join `tbl_diller` `d` USE INDEX (`id`)) order by `d`.`id`,`t`.`id`;

--
-- Definition of view `view_text_kontrol`
--

DROP TABLE IF EXISTS `view_text_kontrol`;
DROP VIEW IF EXISTS `view_text_kontrol`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `view_text_kontrol` AS select (select `k`.`id` from `tbl_textler` `k` USE INDEX (`id`) where (`k`.`sabitler_id` = `t`.`id`)) AS `text_id`,if(((select `s`.`text` from `tbl_textler` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`sabitler_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) <=> NULL),'YOK','VAR') AS `sonuc`,`t`.`id` AS `sabitler_id`,`d`.`dil` AS `dil`,`t`.`aciklama` AS `sabit`,if(((select `s`.`text` from `tbl_textler` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`sabitler_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) <=> NULL),NULL,cast((select `s`.`text` from `tbl_textler` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`sabitler_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) as char(500) charset utf8)) AS `text`,(select (case when (`s`.`onay` = 0) then 'HAYIR' when (`s`.`onay` = 1) then 'EVET' else NULL end) from `tbl_textler` `s` USE INDEX (`id`) USE INDEX (`dil_id`) where ((`s`.`sabitler_id` = `t`.`id`) and (`s`.`dil_id` = `d`.`id`))) AS `onay` from (`tbl_sbt_sabit` `t` join `tbl_diller` `d` USE INDEX (`id`)) where (`t`.`xml` = 0) order by `d`.`id`,`t`.`id`;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
