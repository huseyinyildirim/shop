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

CREATE DEFINER = `root`@`%` TRIGGER `trg_admin_ek` BEFORE INSERT ON `tbl_adminler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_admin_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_admin_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trg_admin_gun` BEFORE UPDATE ON `tbl_adminler` FOR EACH ROW BEGIN
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

CREATE DEFINER = `root`@`%` TRIGGER `trg_all_http_tarih` BEFORE INSERT ON `tbl_all_http` FOR EACH ROW BEGIN
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

CREATE DEFINER = `root`@`%` TRIGGER `trg_aramalar` BEFORE INSERT ON `tbl_aramalar` FOR EACH ROW BEGIN
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

CREATE DEFINER = `root`@`%` TRIGGER `trg_bottomlar_ek` BEFORE INSERT ON `tbl_bottomlar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_bottomlar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_bottomlar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trg_bottomlar_gun` BEFORE UPDATE ON `tbl_bottomlar` FOR EACH ROW BEGIN
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='KOPYA TABLOSU';

--
-- Dumping data for table `tbl_cpy_odeme_bildirimler_hesap_nolar`
--

/*!40000 ALTER TABLE `tbl_cpy_odeme_bildirimler_hesap_nolar` DISABLE KEYS */;
INSERT INTO `tbl_cpy_odeme_bildirimler_hesap_nolar` (`id`,`hesap_nolar_id`,`banka_id`,`sube`,`sube_kodu`,`hesap_sahibi`,`hesap_no`,`iban`,`aciklama`,`tarih`) VALUES 
 (33,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-07-30 01:40:39'),
 (34,2,18,'Antalya','743','Hüseyin Yıldırım','6889831','TR01234567890102345678965255555554',NULL,'2012-07-30 01:54:42'),
 (35,3,17,'Alaşehir','1000','Hatice Yıldırım','7436895','TR01234567890102345678965255555553',NULL,'2012-07-30 01:56:10');
/*!40000 ALTER TABLE `tbl_cpy_odeme_bildirimler_hesap_nolar` ENABLE KEYS */;


--
-- Definition of trigger `trg_cpy_odeme_bildirimler_hesap_nolar`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_cpy_odeme_bildirimler_hesap_nolar`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trg_cpy_odeme_bildirimler_hesap_nolar` BEFORE INSERT ON `tbl_cpy_odeme_bildirimler_hesap_nolar` FOR EACH ROW BEGIN

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

CREATE DEFINER = `root`@`%` TRIGGER `trg_cpy_siparisler_indirimler` BEFORE INSERT ON `tbl_cpy_siparisler_indirimler` FOR EACH ROW BEGIN

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
/*!40000 ALTER TABLE `tbl_cpy_siparisler_kredi_karti_oranlar` ENABLE KEYS */;


--
-- Definition of trigger `trg_cpy_siparisler_kredi_karti_oranlar`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_cpy_siparisler_kredi_karti_oranlar`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trg_cpy_siparisler_kredi_karti_oranlar` BEFORE INSERT ON `tbl_cpy_siparisler_kredi_karti_oranlar` FOR EACH ROW BEGIN

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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COMMENT='KOPYA TABLOSU';

--
-- Dumping data for table `tbl_cpy_siparisler_kullanicilar_adresler`
--

/*!40000 ALTER TABLE `tbl_cpy_siparisler_kullanicilar_adresler` DISABLE KEYS */;
INSERT INTO `tbl_cpy_siparisler_kullanicilar_adresler` (`id`,`kullanicilar_adresler_id`,`kullanici_id`,`tip`,`baslik`,`ulke_id`,`eyalet`,`il`,`il_id`,`ilce`,`ilce_id`,`posta_kodu`,`adres`,`acik_adres`,`tarih`) VALUES 
 (120,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Manavgat',96,'076001','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-07-30 01:40:38'),
 (121,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Merkez',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-07-30 01:40:38'),
 (122,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Manavgat',96,'076001','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-07-30 01:54:41'),
 (123,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Merkez',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-07-30 01:54:41'),
 (124,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Manavgat',96,'076001','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-07-30 01:56:10'),
 (125,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Merkez',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-07-30 01:56:10');
/*!40000 ALTER TABLE `tbl_cpy_siparisler_kullanicilar_adresler` ENABLE KEYS */;


--
-- Definition of trigger `trg_cpy_siparisler_kullanicilar_adresler`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_cpy_siparisler_kullanicilar_adresler`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trg_cpy_siparisler_kullanicilar_adresler` BEFORE INSERT ON `tbl_cpy_siparisler_kullanicilar_adresler` FOR EACH ROW BEGIN

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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='KOPYA TABLOSU';

--
-- Dumping data for table `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler`
--

/*!40000 ALTER TABLE `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler` DISABLE KEYS */;
INSERT INTO `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler` (`id`,`kullanicilar_vergi_bilgiler_id`,`kullanici_id`,`adres_id`,`tip`,`vergi_dairesi`,`vergi_no`,`tc_kimlik_no`,`tarih`) VALUES 
 (63,1,1,2,1,'Kurumlar','925 014 6664','','2012-07-30 01:40:38'),
 (64,1,1,2,1,'Kurumlar','925 014 6664','','2012-07-30 01:54:41'),
 (65,1,1,2,1,'Kurumlar','925 014 6664','','2012-07-30 01:56:10');
/*!40000 ALTER TABLE `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler` ENABLE KEYS */;


--
-- Definition of trigger `trg_cpy_siparisler_kullanicilar_vergi_bilgiler`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_cpy_siparisler_kullanicilar_vergi_bilgiler`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trg_cpy_siparisler_kullanicilar_vergi_bilgiler` BEFORE INSERT ON `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler` FOR EACH ROW BEGIN

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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='KOPYA TABLOSU';

--
-- Dumping data for table `tbl_cpy_siparisler_urunler`
--

/*!40000 ALTER TABLE `tbl_cpy_siparisler_urunler` DISABLE KEYS */;
INSERT INTO `tbl_cpy_siparisler_urunler` (`id`,`urunler_id`,`dil_id`,`dil`,`kod_id`,`kod`,`resim_id`,`resim`,`resim_kategori_id`,`resim_kategori`,`video_kategori_id`,`video_kategori`,`ad`,`on_aciklama`,`aciklama`,`en`,`boy`,`yukseklik`,`desi`,`kg`,`fiyat`,`para_birimi_id`,`kdv_id`,`kargo_hesaplama_id`,`indirim_id`,`indirim_ad`,`indirim_yuzde`,`tarih`) VALUES 
 (101,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,2.00,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-07-30 01:40:38'),
 (102,38,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 285','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,258.00000,2,1,1,NULL,NULL,NULL,'2012-07-30 01:40:38'),
 (103,58,999,'TÜRKÇE',1,'SER-000',117,'product_03.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 303','gfgfdgfgfgf<br/>g<br/>fg<br/>f<br/>gf','gfgfdgfgfgf<br/>g<br/>fg<br/>f<br/>gf',0,0,0,0.00,0.00,588.00000,1,1,1,1,'KDV BİZDEN %18',1.180,'2012-07-30 01:40:38'),
 (104,55,999,'TÜRKÇE',2,'SER-001',115,'product_01.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 301','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,1142.00000,1,1,1,NULL,NULL,NULL,'2012-07-30 01:40:38'),
 (105,55,999,'TÜRKÇE',2,'SER-001',115,'product_01.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 301','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,1142.00000,1,1,1,NULL,NULL,NULL,'2012-07-30 01:54:42'),
 (106,58,999,'TÜRKÇE',1,'SER-000',117,'product_03.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 303','gfgfdgfgfgf<br/>g<br/>fg<br/>f<br/>gf','gfgfdgfgfgf<br/>g<br/>fg<br/>f<br/>gf',0,0,0,0.00,0.00,588.00000,1,1,1,1,'KDV BİZDEN %18',1.180,'2012-07-30 01:54:42'),
 (107,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,2.00,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-07-30 01:54:42'),
 (108,34,999,'TÜRKÇE',1,'SER-000',115,'product_01.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 281','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',30,20,50,1.00,NULL,654.00000,1,1,5,NULL,NULL,NULL,'2012-07-30 01:54:42'),
 (109,35,999,'TÜRKÇE',2,'SER-001',116,'product_02.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,2.00,NULL,987.00000,2,1,5,1,'KDV BİZDEN %18',1.180,'2012-07-30 01:56:10'),
 (110,38,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 285','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,258.00000,2,1,1,NULL,NULL,NULL,'2012-07-30 01:56:10'),
 (111,42,999,'TÜRKÇE',3,'SER-003',117,'product_03.jpg',NULL,NULL,NULL,NULL,'ŞİŞME BOT 290','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,853.00000,1,1,1,NULL,NULL,NULL,'2012-07-30 01:56:10');
/*!40000 ALTER TABLE `tbl_cpy_siparisler_urunler` ENABLE KEYS */;


--
-- Definition of trigger `trg_cpy_siparisler_urunler`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_cpy_siparisler_urunler`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trg_cpy_siparisler_urunler` BEFORE INSERT ON `tbl_cpy_siparisler_urunler` FOR EACH ROW BEGIN

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

CREATE DEFINER = `root`@`%` TRIGGER `trg_diller_ek` BEFORE INSERT ON `tbl_diller` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_diller_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_diller_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trg_diller_gun` BEFORE UPDATE ON `tbl_diller` FOR EACH ROW BEGIN
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

CREATE DEFINER = `root`@`%` TRIGGER `trg_dosyalar_ek` BEFORE INSERT ON `tbl_dosyalar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_dosyalar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_dosyalar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trg_dosyalar_gun` BEFORE UPDATE ON `tbl_dosyalar` FOR EACH ROW BEGIN
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

CREATE DEFINER = `root`@`%` TRIGGER `trg_dosyalar_kategori_ek` BEFORE INSERT ON `tbl_dosyalar_kategori` FOR EACH ROW BEGIN

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

CREATE DEFINER = `root`@`%` TRIGGER `trg_dosyalar_kategori_gun` BEFORE UPDATE ON `tbl_dosyalar_kategori` FOR EACH ROW BEGIN

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

CREATE DEFINER = `root`@`%` TRIGGER `trg_dosyalar_kategoriler_ek` BEFORE INSERT ON `tbl_dosyalar_kategoriler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_dosyalar_kategoriler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_dosyalar_kategoriler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trg_dosyalar_kategoriler_gun` BEFORE UPDATE ON `tbl_dosyalar_kategoriler` FOR EACH ROW BEGIN
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

CREATE DEFINER = `root`@`%` TRIGGER `trg_etiketler_ek` BEFORE INSERT ON `tbl_etiketler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_etiketler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_etiketler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trg_etiketler_gun` BEFORE UPDATE ON `tbl_etiketler` FOR EACH ROW BEGIN
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

CREATE DEFINER = `root`@`%` TRIGGER `trg_firma_adresler_ek` BEFORE INSERT ON `tbl_firma_adresler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_firma_adresler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_firma_adresler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trg_firma_adresler_gun` BEFORE UPDATE ON `tbl_firma_adresler` FOR EACH ROW BEGIN
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

CREATE DEFINER = `root`@`%` TRIGGER `trg_giris_cikislar` BEFORE INSERT ON `tbl_giris_cikislar` FOR EACH ROW BEGIN
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

CREATE DEFINER = `root`@`%` TRIGGER `trg_giris_cikislar_hatalar` BEFORE INSERT ON `tbl_giris_cikislar_hatalar` FOR EACH ROW BEGIN
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
) ENGINE=InnoDB AUTO_INCREMENT=943 DEFAULT CHARSET=utf8;

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
 (894,14,1.11860,1.13330,NULL,NULL,'2012-07-12','2012-07-13 10:15:14'),
 (895,2,1.79670,1.80540,NULL,NULL,'2012-07-20','2012-07-23 02:11:40'),
 (896,9,1.78170,1.78980,NULL,NULL,'2012-07-20','2012-07-23 02:11:40'),
 (897,4,0.29565,0.29711,NULL,NULL,'2012-07-20','2012-07-23 02:11:40'),
 (898,8,0.25782,0.26050,NULL,NULL,'2012-07-20','2012-07-23 02:11:40'),
 (899,7,1.82860,1.84040,NULL,NULL,'2012-07-20','2012-07-23 02:11:40'),
 (900,11,0.29572,0.29771,NULL,NULL,'2012-07-20','2012-07-23 02:11:41'),
 (901,13,2.28280,2.29800,NULL,NULL,'2012-07-20','2012-07-23 02:11:41'),
 (902,12,0.48053,0.48140,NULL,NULL,'2012-07-20','2012-07-23 02:11:41'),
 (903,10,6.32560,6.40890,NULL,NULL,'2012-07-20','2012-07-23 02:11:41'),
 (904,3,1.86720,1.87940,NULL,NULL,'2012-07-20','2012-07-23 02:11:41'),
 (905,5,2.19980,2.21040,NULL,NULL,'2012-07-20','2012-07-23 02:11:41'),
 (906,6,2.81910,2.83380,NULL,NULL,'2012-07-20','2012-07-23 02:11:41'),
 (907,16,0.05576,0.05649,NULL,NULL,'2012-07-20','2012-07-23 02:11:41'),
 (908,15,0.47570,0.48197,NULL,NULL,'2012-07-20','2012-07-23 02:11:41'),
 (909,17,0.01454,0.01473,NULL,NULL,'2012-07-20','2012-07-23 02:11:41'),
 (910,14,1.11540,1.13010,NULL,NULL,'2012-07-20','2012-07-23 02:11:41'),
 (911,2,1.81620,1.82500,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (912,9,1.78300,1.79110,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (913,4,0.29545,0.29690,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (914,8,0.25967,0.26237,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (915,7,1.82720,1.83900,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (916,11,0.29739,0.29940,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (917,13,2.31810,2.33350,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (918,12,0.48576,0.48664,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (919,10,6.38520,6.46930,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (920,3,1.86500,1.87720,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (921,5,2.19800,2.20860,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (922,6,2.81610,2.83080,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (923,16,0.05504,0.05576,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (924,15,0.46986,0.47605,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (925,17,0.01470,0.01489,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (926,14,1.11460,1.12930,NULL,NULL,'2012-07-24','2012-07-24 23:03:24'),
 (927,2,1.81000,1.81870,NULL,NULL,'2012-07-27','2012-07-27 19:49:18'),
 (928,9,1.79510,1.80320,NULL,NULL,'2012-07-27','2012-07-27 19:49:18'),
 (929,4,0.29875,0.30022,NULL,NULL,'2012-07-27','2012-07-27 19:49:18'),
 (930,8,0.26139,0.26411,NULL,NULL,'2012-07-27','2012-07-27 19:49:18'),
 (931,7,1.84770,1.85960,NULL,NULL,'2012-07-27','2012-07-27 19:49:18'),
 (932,11,0.29873,0.30075,NULL,NULL,'2012-07-27','2012-07-27 19:49:18'),
 (933,13,2.31070,2.32610,NULL,NULL,'2012-07-27','2012-07-27 19:49:18'),
 (934,12,0.48409,0.48496,NULL,NULL,'2012-07-27','2012-07-27 19:49:18'),
 (935,10,6.37230,6.45620,NULL,NULL,'2012-07-27','2012-07-27 19:49:18'),
 (936,3,1.88410,1.89640,NULL,NULL,'2012-07-27','2012-07-27 19:49:18'),
 (937,5,2.22270,2.23340,NULL,NULL,'2012-07-27','2012-07-27 19:49:18'),
 (938,6,2.84100,2.85590,NULL,NULL,'2012-07-27','2012-07-27 19:49:18'),
 (939,16,0.05561,0.05634,NULL,NULL,'2012-07-27','2012-07-27 19:49:18'),
 (940,15,0.47825,0.48455,NULL,NULL,'2012-07-27','2012-07-27 19:49:18'),
 (941,17,0.01464,0.01483,NULL,NULL,'2012-07-27','2012-07-27 19:49:18'),
 (942,14,1.12700,1.14180,NULL,NULL,'2012-07-27','2012-07-27 19:49:18');
/*!40000 ALTER TABLE `tbl_gunluk_kurlar` ENABLE KEYS */;


--
-- Definition of trigger `trg_gunluk_kurlar_tarih`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_gunluk_kurlar_tarih`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trg_gunluk_kurlar_tarih` BEFORE INSERT ON `tbl_gunluk_kurlar` FOR EACH ROW BEGIN
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

CREATE DEFINER = `root`@`%` TRIGGER `trg_haberler_ek` BEFORE INSERT ON `tbl_haberler` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_haberler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_haberler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`%` TRIGGER `trg_haberler_gun` BEFORE UPDATE ON `tbl_haberler` FOR EACH ROW BEGIN
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

CREATE DEFINER = `root`@`%` TRIGGER `trg_headerlar_ek` BEFORE INSERT ON `tbl_headerlar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;
