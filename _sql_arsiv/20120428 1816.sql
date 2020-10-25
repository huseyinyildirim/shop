-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.17-log


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
  `TABLE_COMMENT` varchar(2048)
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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
 (14,'tbl_giris_cikislar',13,'2012-04-27 16:44:20','HTTP_CACHE_CONTROL:no-cache\r\nHTTP_CONNECTION:keep-alive\r\nHTTP_PRAGMA:no-cache\r\nHTTP_CONTENT_LENGTH:112\r\nHTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8\r\nHTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nHTTP_ACCEPT_ENCODING:gzip, deflate\r\nHTTP_ACCEPT_LANGUAGE:tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nHTTP_COOKIE:__utma=111872281.978857877.1332501739.1332535395.1332543163.4; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=jx4r3ir3eqs344mnj0n5gqwc\r\nHTTP_HOST:localhost:94\r\nHTTP_REFERER:http://localhost:94/admin/\r\nHTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nHTTP_X_EXT.NET:delta=true\r\nHTTP_X_REQUESTED_WITH:XMLHttpRequest\r\n','Cache-Control: no-cache\r\nConnection: keep-alive\r\nPragma: no-cache\r\nContent-Length: 112\r\nContent-Type: application/x-www-form-urlencoded; charset=UTF-8\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\nAccept-Encoding: gzip, deflate\r\nAccept-Language: tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3\r\nCookie: __utma=111872281.978857877.1332501739.1332535395.1332543163.4; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=jx4r3ir3eqs344mnj0n5gqwc\r\nHost: localhost:94\r\nReferer: http://localhost:94/admin/\r\nUser-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0\r\nX-Ext.Net: delta=true\r\nX-Requested-With: XMLHttpRequest\r\n','/LM/W3SVC/14/ROOT','D:\\Inetpub\\Proje\\alisveris\\','','','','','','','','','','','','','','','112','application/x-www-form-urlencoded; charset=UTF-8','CGI/1.1','off','','','','','14','/LM/W3SVC/14','127.0.0.1','/admin/default.aspx','D:\\Inetpub\\Proje\\alisveris\\admin\\default.aspx','_dc=1335534258085','127.0.0.1','127.0.0.1','20927','POST','/admin/default.aspx','localhost','94','0','HTTP/1.1','Microsoft-IIS/7.5','/admin/default.aspx','keep-alive','text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',NULL,'gzip, deflate','tr-tr,tr;q=0.8,en-us;q=0.5,en;q=0.3','__utma=111872281.978857877.1332501739.1332535395.1332543163.4; __utmz=111872281.1332501739.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); ASP.NET_SessionId=jx4r3ir3eqs344mnj0n5gqwc','localhost:94','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0','Reserved','RD','','0.00000000','0.00000000');
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
  CONSTRAINT `tbl_aramalar_dil_id` FOREIGN KEY (`dil_id`) REFERENCES `tbl_diller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

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
 (75,999,'yuf','2012-04-16 02:15:13');
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
  CONSTRAINT `tbl_bottomlar_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_bottomlar_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_bottomlar_dil_id` FOREIGN KEY (`dil_id`) REFERENCES `tbl_diller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_bottomlar`
--

/*!40000 ALTER TABLE `tbl_bottomlar` DISABLE KEYS */;
INSERT INTO `tbl_bottomlar` (`id`,`dil_id`,`baslik`,`text`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (2,999,'Copyright ©2012 SERAS MACHINES All Rights Reserved.','SERASMAC and the SERASMAC logo are trademarks or registered trademarks of SERAS MACHINES Co. Ltd.\n<br />All other trademarks and logos belong to their respective owners. All rights reserved.',1,999,'2012-03-09 00:45:36',999,'2012-03-09 00:45:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='KOPYA TABLOSU';

--
-- Dumping data for table `tbl_cpy_odeme_bildirimler_hesap_nolar`
--

/*!40000 ALTER TABLE `tbl_cpy_odeme_bildirimler_hesap_nolar` DISABLE KEYS */;
INSERT INTO `tbl_cpy_odeme_bildirimler_hesap_nolar` (`id`,`hesap_nolar_id`,`banka_id`,`sube`,`sube_kodu`,`hesap_sahibi`,`hesap_no`,`iban`,`aciklama`,`tarih`) VALUES 
 (1,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-04-25 01:01:19'),
 (2,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-04-25 01:23:34'),
 (3,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-04-25 02:03:18'),
 (4,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-04-25 17:58:34'),
 (5,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-04-26 22:47:29'),
 (6,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-04-26 23:35:15'),
 (7,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-04-27 00:21:35'),
 (9,1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,'2012-04-27 14:48:08');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='KOPYA TABLOSU';

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='KOPYA TABLOSU';

--
-- Dumping data for table `tbl_cpy_siparisler_kullanicilar_adresler`
--

/*!40000 ALTER TABLE `tbl_cpy_siparisler_kullanicilar_adresler` DISABLE KEYS */;
INSERT INTO `tbl_cpy_siparisler_kullanicilar_adresler` (`id`,`kullanicilar_adresler_id`,`kullanici_id`,`tip`,`baslik`,`ulke_id`,`eyalet`,`il`,`il_id`,`ilce`,`ilce_id`,`posta_kodu`,`adres`,`acik_adres`,`tarih`) VALUES 
 (36,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-23 20:52:18'),
 (37,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-23 20:52:18'),
 (38,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-25 01:23:34'),
 (39,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-25 01:23:34'),
 (40,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-25 02:03:18'),
 (41,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-25 02:03:18'),
 (42,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-25 17:58:32'),
 (43,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-25 17:58:32'),
 (44,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-26 22:47:28'),
 (45,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-26 22:47:28'),
 (46,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-26 23:35:14'),
 (47,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-26 23:35:14'),
 (48,4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-04-27 00:21:35'),
 (49,2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-04-27 00:21:35');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='KOPYA TABLOSU';

--
-- Dumping data for table `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler`
--

/*!40000 ALTER TABLE `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler` DISABLE KEYS */;
INSERT INTO `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler` (`id`,`kullanicilar_vergi_bilgiler_id`,`kullanici_id`,`adres_id`,`tip`,`vergi_dairesi`,`vergi_no`,`tc_kimlik_no`,`tarih`) VALUES 
 (21,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-23 20:52:18'),
 (22,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-25 01:23:34'),
 (23,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-25 02:03:18'),
 (24,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-25 17:58:32'),
 (25,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-26 22:47:28'),
 (26,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-26 23:35:14'),
 (27,1,1,2,1,'Kurumlar','925 014 6664','','2012-04-27 00:21:35');
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='KOPYA TABLOSU';

--
-- Dumping data for table `tbl_cpy_siparisler_urunler`
--

/*!40000 ALTER TABLE `tbl_cpy_siparisler_urunler` DISABLE KEYS */;
INSERT INTO `tbl_cpy_siparisler_urunler` (`id`,`urunler_id`,`dil_id`,`dil`,`kod_id`,`kod`,`resim_id`,`resim`,`resim_kategori_id`,`resim_kategori`,`video_kategori_id`,`video_kategori`,`ad`,`on_aciklama`,`aciklama`,`en`,`boy`,`yukseklik`,`desi`,`kg`,`fiyat`,`para_birimi_id`,`kdv_id`,`kargo_hesaplama_id`,`indirim_id`,`indirim_ad`,`indirim_yuzde`,`tarih`) VALUES 
 (31,38,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 285','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,258.00000,1,1,1,NULL,NULL,NULL,'2012-04-23 20:52:18'),
 (32,44,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 292','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,158.00000,1,1,1,2,'BAHAR KAMPANYASI %10',1.100,'2012-04-23 20:52:19'),
 (33,49,999,'TÜRKÇE',1,'SER-000',117,'product_03.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 297','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,236.00000,1,1,1,NULL,NULL,NULL,'2012-04-23 20:52:19'),
 (34,47,999,'TÜRKÇE',2,'SER-001',115,'product_01.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 295','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,985.00000,1,1,1,NULL,NULL,NULL,'2012-04-23 20:52:19'),
 (35,51,999,'TÜRKÇE',3,'SER-003',119,'product_05.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 299','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,478.00000,1,1,1,1,'KDV BİZDEN %18',1.180,'2012-04-23 20:52:19'),
 (36,38,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 285','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,258.00000,2,1,1,NULL,NULL,NULL,'2012-04-25 01:23:34'),
 (37,44,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 292','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,158.00000,1,1,1,2,'BAHAR KAMPANYASI %10',1.100,'2012-04-25 01:23:35'),
 (38,47,999,'TÜRKÇE',2,'SER-001',115,'product_01.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 295','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,985.00000,2,1,1,NULL,NULL,NULL,'2012-04-25 01:23:35'),
 (39,48,999,'TÜRKÇE',3,'SER-003',116,'product_02.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 296','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,785.00000,1,1,1,2,'BAHAR KAMPANYASI %10',1.100,'2012-04-25 01:23:35'),
 (40,38,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 285','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,258.00000,2,1,1,NULL,NULL,NULL,'2012-04-25 02:03:18'),
 (41,44,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 292','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,158.00000,1,1,1,2,'BAHAR KAMPANYASI %10',1.100,'2012-04-25 02:03:18'),
 (42,47,999,'TÜRKÇE',2,'SER-001',115,'product_01.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 295','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,985.00000,2,1,1,NULL,NULL,NULL,'2012-04-25 02:03:18'),
 (43,48,999,'TÜRKÇE',3,'SER-003',116,'product_02.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 296','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,785.00000,1,1,1,2,'BAHAR KAMPANYASI %10',1.100,'2012-04-25 02:03:18'),
 (44,38,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 285','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,258.00000,2,1,1,NULL,NULL,NULL,'2012-04-25 17:58:32'),
 (45,44,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 292','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,158.00000,1,1,1,2,'BAHAR KAMPANYASI %10',1.100,'2012-04-25 17:58:33'),
 (46,48,999,'TÜRKÇE',3,'SER-003',116,'product_02.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 296','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,785.00000,1,1,1,2,'BAHAR KAMPANYASI %10',1.100,'2012-04-25 17:58:33'),
 (47,47,999,'TÜRKÇE',2,'SER-001',115,'product_01.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 295','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,985.00000,2,1,1,NULL,NULL,NULL,'2012-04-25 17:58:33'),
 (48,38,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 285','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,258.00000,2,1,1,NULL,NULL,NULL,'2012-04-26 22:47:28'),
 (49,38,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 285','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,258.00000,2,1,1,NULL,NULL,NULL,'2012-04-26 23:35:15'),
 (50,44,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 292','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,158.00000,1,1,1,2,'BAHAR KAMPANYASI %10',1.100,'2012-04-26 23:35:15'),
 (51,47,999,'TÜRKÇE',2,'SER-001',115,'product_01.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 295','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,985.00000,2,1,1,NULL,NULL,NULL,'2012-04-26 23:35:15'),
 (52,48,999,'TÜRKÇE',3,'SER-003',116,'product_02.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 296','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,785.00000,1,1,1,2,'BAHAR KAMPANYASI %10',1.100,'2012-04-26 23:35:15'),
 (53,51,999,'TÜRKÇE',3,'SER-003',119,'product_05.jpg',NULL,NULL,2,'VIDEO - BOŞ KATEGORİ','Şişme Bot 299','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,478.00000,1,1,1,1,'KDV BİZDEN %18',1.180,'2012-04-26 23:35:15'),
 (54,38,999,'TÜRKÇE',2,'SER-001',119,'product_05.jpg',NULL,NULL,NULL,NULL,'Şişme Bot 285','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,258.00000,2,1,1,NULL,NULL,NULL,'2012-04-27 00:21:35');
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_etiketler`
--

/*!40000 ALTER TABLE `tbl_etiketler` DISABLE KEYS */;
INSERT INTO `tbl_etiketler` (`id`,`dil_id`,`ad`,`anasayfa`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (67,999,'deneme',1,1,999,'2012-02-27 02:39:35',999,'2012-03-14 22:54:07'),
 (68,999,'deneme 2',1,1,999,'2012-02-27 02:39:35',999,'2012-03-14 22:54:07'),
 (69,999,'deneme',1,1,999,'2012-02-27 02:41:43',999,'2012-03-14 22:54:07'),
 (70,999,'deneme22',1,1,999,'2012-02-27 02:41:45',999,'2012-03-14 22:54:07'),
 (71,999,'deneme2',1,1,999,'2012-02-27 02:43:18',999,'2012-03-14 22:54:07'),
 (72,999,'abc',1,1,999,'2012-02-27 02:43:18',999,'2012-03-14 22:54:07'),
 (73,999,'gfgfdgdf',1,1,999,'2012-02-27 03:14:29',999,'2012-03-14 22:54:07'),
 (74,999,'deneme',1,1,999,'2012-02-28 23:49:32',999,'2012-03-14 22:54:07'),
 (76,999,'deneme5q',1,1,999,'2012-03-02 01:22:59',999,'2012-03-14 22:54:07'),
 (77,999,'deneme2',1,1,999,'2012-03-05 01:48:23',999,'2012-03-14 22:54:07'),
 (78,999,'deneme1234',1,1,999,'2012-03-05 01:48:23',999,'2012-03-14 22:54:07'),
 (79,999,'denemeeeeee',1,1,999,'2012-03-05 01:48:23',999,'2012-03-14 22:54:07'),
 (80,999,'hmm',1,1,999,'2012-03-05 02:00:24',999,'2012-03-14 22:54:07'),
 (81,999,' ipsum',1,1,999,'2012-03-05 02:00:24',999,'2012-03-14 22:54:07'),
 (82,999,' lorem',1,1,999,'2012-03-05 02:00:24',999,'2012-03-14 22:54:07'),
 (83,999,' tipsum',1,1,999,'2012-03-05 02:00:25',999,'2012-03-14 22:54:07'),
 (84,999,' hede',1,1,999,'2012-03-05 02:00:25',999,'2012-03-14 22:54:07'),
 (85,999,'',0,0,999,'2012-04-27 16:46:46',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
 (13,0,999,NULL,0,'2012-04-27 16:44:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8;

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
 (334,14,1.17500,1.19050,NULL,NULL,'2012-04-27','2012-04-27 17:30:41');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_hesap_nolar`
--

/*!40000 ALTER TABLE `tbl_hesap_nolar` DISABLE KEYS */;
INSERT INTO `tbl_hesap_nolar` (`id`,`banka_id`,`sube`,`sube_kodu`,`hesap_sahibi`,`hesap_no`,`iban`,`aciklama`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,1,'KÜTAHYA','488','FATİH ÜNAL','1234567890','TR01234567890102345678965255555555',NULL,1,999,'2012-03-26 23:03:01',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_iletisimler`
--

/*!40000 ALTER TABLE `tbl_iletisimler` DISABLE KEYS */;
INSERT INTO `tbl_iletisimler` (`id`,`ad_soyad`,`mail`,`telefon`,`gorusler`,`tarih`,`okundu`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,'FATIH ÜNAL','fatih@acoder.info','009053323132722','fffgfg<br/>fdgdf<br/>g<br/>dfg<br/>fd<br/>g<br/>dfg<br/>df<br/>gdf<br/>g','2012-03-13 01:37:02',1,999,'2012-03-13 02:18:12'),
 (2,'D','deneme@deneme.com','555555555555555','<br/>Sizlere sundugumuz hizmet kalitesinin gelistirilmesi sizlerden aldigimiz öneri, görüs ve elestirilerin degerlendirilmesiyle dogru orantili olarak gelismektedir. <br/><br/>Sürekli gelisim sürecimize destek olacak öneri ve beklentilerinizi bizlerle paylasmanizdan memnuniyet duyacagiz. <br/><br/>Mesajlariniz tarafimizdan titizlikle incelenecek ve alinacak aksiyonlara temel olusturacaktir. Sizlerin beklentilerini ve memnuniyetini arttirarak, \"%100 müsteri memnuniyeti\" anlayisimizi birlikte daha ileriye tasimak dilegiyle.','2012-03-13 02:54:47',1,999,'2012-03-13 02:57:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

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
 (55,0,999,NULL,'tbl_urunler_etiketler',1,0,'2012-04-27 16:46:46');
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
  `fiyat` double(11,5) DEFAULT NULL,
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
INSERT INTO `tbl_kargo_ulke_bolge` (`id`,`kargo_id`,`bolge_id`,`fiyat`) VALUES 
 (1,1,1,4.00000);
/*!40000 ALTER TABLE `tbl_kargo_ulke_bolge` ENABLE KEYS */;


--
-- Definition of table `tbl_kargo_ulke_il_bolge`
--

DROP TABLE IF EXISTS `tbl_kargo_ulke_il_bolge`;
CREATE TABLE `tbl_kargo_ulke_il_bolge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kargo_id` int(11) NOT NULL DEFAULT '-1',
  `bolge_id` int(11) NOT NULL DEFAULT '-1',
  `fiyat` double(11,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `kargo_id` (`kargo_id`),
  KEY `desi` (`fiyat`),
  KEY `bolge_id` (`bolge_id`),
  CONSTRAINT `fk_sbt_kargo_ulke_il_bolge_bolge_id` FOREIGN KEY (`bolge_id`) REFERENCES `tbl_sbt_ulke_il_bolge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sbt_kargo_ulke_il_bolge_kargo_id` FOREIGN KEY (`kargo_id`) REFERENCES `tbl_sbt_kargo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kargo_ulke_il_bolge`
--

/*!40000 ALTER TABLE `tbl_kargo_ulke_il_bolge` DISABLE KEYS */;
INSERT INTO `tbl_kargo_ulke_il_bolge` (`id`,`kargo_id`,`bolge_id`,`fiyat`) VALUES 
 (1,1,1,5.00000);
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
INSERT INTO `tbl_kategoriler` (`id`,`dil_id`,`kategori_tip`,`kategori_id`,`ad`,`ust`,`sira`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (12,999,0,0,'Şişme Botlar',1,0,1,999,'2012-04-23 01:22:47',999,'2012-03-28 11:45:45'),
 (13,999,0,0,'Akü ve Aksesuarları',0,0,1,999,'2012-04-23 01:22:47',999,'2012-03-28 09:58:25'),
 (18,999,0,0,'Bağlantı Elemanları',1,0,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 11:35:04'),
 (19,999,0,0,'Balık Bulucular',0,0,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 09:58:37'),
 (20,999,0,0,'Boya &amp; Bakım',0,0,1,999,'2012-04-23 01:22:47',NULL,'2012-04-26 23:42:26'),
 (21,999,0,0,'Can Yelekleri',1,0,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 11:35:05'),
 (22,999,0,0,'Çapa ve Baş Makaralar',0,0,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 09:58:57'),
 (23,999,0,0,'Deniz Motorları',0,0,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 09:59:06'),
 (24,999,0,0,'Dümen &amp; Kumanda',1,0,1,999,'2012-04-23 01:22:47',NULL,'2012-04-26 23:42:41'),
 (25,999,0,0,'Elektrik &amp; Elektronik',0,0,1,999,'2012-04-23 01:22:47',NULL,'2012-04-26 23:42:43'),
 (26,999,0,0,'Güverte',1,0,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 11:35:10'),
 (27,999,0,0,'Göstergeler',1,0,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 11:35:08'),
 (29,999,0,0,'Havalandırma',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:11:30'),
 (30,999,1,12,'Dinghy Botlar',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:04'),
 (31,999,1,12,'Izgara Tabanlı Botlar',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:04'),
 (32,999,1,12,'Şişme Tabanlı Botlar',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:05'),
 (33,999,1,12,'Ahşap Tabanlı Botlar',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:05'),
 (34,999,1,12,'Alüminyum Tabanlı Botlar',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:06'),
 (35,999,1,12,'Fiber Tabanlı Botlar',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:06'),
 (36,999,1,13,'Akü Aksesuarları',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:07'),
 (37,999,1,13,'Akü İzolatörü',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:11'),
 (38,999,1,13,'Akü Şalteri',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:11'),
 (39,999,1,13,'Devre Kesiciler',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:11'),
 (40,999,1,13,'Deka Marin Akü Bakımsız',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:11'),
 (41,999,1,13,'Aküler',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:13'),
 (43,999,1,18,'Babalar',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:13'),
 (44,999,1,18,'Çelik Halat',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:13'),
 (45,999,1,18,'Fırdöndü',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:13'),
 (46,999,1,18,'Halka Köprü',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:16'),
 (47,999,1,18,'Karabina',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:16'),
 (48,999,1,18,'Klemens',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:16'),
 (49,999,1,18,'Radansa',0,1,1,999,'2012-04-23 01:22:47',NULL,'2012-03-28 10:27:16');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kullanicilar`
--

/*!40000 ALTER TABLE `tbl_kullanicilar` DISABLE KEYS */;
INSERT INTO `tbl_kullanicilar` (`id`,`ad_soyad`,`sifre`,`mail`,`alan_kodu_id`,`gsm`,`onay`,`tarih_ek`,`tarih_gun`,`admin_id_gun`) VALUES 
 (1,'Fatih ÜNAL','5353F8D9D31D435F9D49BDA3968DC7B3','fatih@acoder.info',90,'5332317372',1,'2012-03-26 22:40:19','2012-04-23 11:17:25',NULL);
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
 (2,1,0,'Vitamin Turizm Tic. Ltd. Şti.',235,'','Antalya',7,'Muratpaşa',82,'07320','Fener Mh. 1964 Sk. Akanay Apt. No:5 K:1 D:3-4',NULL,'2012-03-28 00:49:17','2012-04-23 20:43:37'),
 (4,1,1,'Hüseyin Yıldırım',235,NULL,'Antalya',7,'Kepez',82,'07600','Habibler Mh. 5538 Sk. No:17 Lale Sitesi A Blok K:3 D:7','Doğanay Düğün Salonunun günay batısında kalan bina','2012-03-28 00:49:39','2012-04-23 20:50:55');
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
  UNIQUE KEY `kullanici_id` (`kullanici_id`),
  KEY `id` (`id`),
  KEY `tarih_ek` (`tarih_ek`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `tip` (`tip`),
  KEY `vergi_no` (`vergi_no`),
  KEY `tc_kimlik_no` (`tc_kimlik_no`),
  KEY `adres_id` (`adres_id`),
  CONSTRAINT `fk_kullanicilar_vergi_bilgiler_adres_id` FOREIGN KEY (`adres_id`) REFERENCES `tbl_kullanicilar_adresler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kullanicilar_vergi_bilgiler_kullanici_id` FOREIGN KEY (`kullanici_id`) REFERENCES `tbl_kullanicilar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kullanicilar_vergi_bilgiler`
--

/*!40000 ALTER TABLE `tbl_kullanicilar_vergi_bilgiler` DISABLE KEYS */;
INSERT INTO `tbl_kullanicilar_vergi_bilgiler` (`id`,`kullanici_id`,`adres_id`,`tip`,`vergi_dairesi`,`vergi_no`,`tc_kimlik_no`,`tarih_ek`,`tarih_gun`) VALUES 
 (1,1,2,1,'Kurumlar','925 014 6664','','2012-03-26 22:42:26','2012-04-23 20:44:16');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_maillist_mailler`
--

/*!40000 ALTER TABLE `tbl_maillist_mailler` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_markalar`
--

/*!40000 ALTER TABLE `tbl_markalar` DISABLE KEYS */;
INSERT INTO `tbl_markalar` (`id`,`ad`,`ikon`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,'SERASMAC',NULL,1,999,'2012-01-29 10:32:31',999,'2012-03-14 22:53:58'),
 (2,'DENEME MARKASI',NULL,1,NULL,'2012-01-30 02:14:27',999,'2012-03-14 22:53:58'),
 (3,'fdfdfd3333333333',NULL,1,999,'2012-01-30 02:25:39',999,'2012-03-14 22:53:58'),
 (4,'SERASMACO',NULL,1,999,'2012-03-02 01:35:49',999,'2012-03-14 22:53:58');
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
 (1,999,0,'Anasayfa','',1,999,'2011-12-17 02:59:01',999,'2012-04-25 16:53:21'),
 (2,999,1,'Ürünler','',1,999,'2011-12-17 02:59:01',999,'2012-04-25 16:53:21'),
 (3,999,2,'Hakkımızda','',1,999,'2011-12-17 02:59:01',999,'2012-04-25 16:53:20'),
 (4,999,3,'İletişim','',1,999,'2011-12-17 02:59:01',999,'2012-04-25 16:53:20'),
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_odeme_bildirimler`
--

/*!40000 ALTER TABLE `tbl_odeme_bildirimler` DISABLE KEYS */;
INSERT INTO `tbl_odeme_bildirimler` (`id`,`kullanici_id`,`siparis_id`,`odeme_bildirimler_hesap_nolar_id`,`tip`,`islem_no`,`odeme_tarih`,`tutar`,`para_birimi_id`,`tarih`) VALUES 
 (1,1,6,4,0,NULL,NULL,3791.59000,1,'2012-04-25 17:58:34'),
 (2,1,7,5,0,NULL,NULL,534.87000,1,'2012-04-26 22:47:29'),
 (3,1,8,6,0,NULL,NULL,4236.00000,1,'2012-04-26 23:35:15'),
 (4,1,9,7,0,NULL,NULL,534.87000,1,'2012-04-27 00:21:36');
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
-- Definition of table `tbl_sanal_poslar`
--

DROP TABLE IF EXISTS `tbl_sanal_poslar`;
CREATE TABLE `tbl_sanal_poslar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banka_id` int(11) NOT NULL DEFAULT '-1',
  `magaza_no` varchar(255) NOT NULL DEFAULT '',
  `api_kullanicisi` varchar(255) NOT NULL,
  `sifre` varchar(255) NOT NULL DEFAULT '',
  `3d_secure` tinyint(1) NOT NULL DEFAULT '0',
  `on_otorizasyon` tinyint(1) NOT NULL DEFAULT '0',
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
  KEY `banka_id` (`banka_id`),
  CONSTRAINT `fk_sanal_poslar_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sanal_poslar_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sanal_poslar_banka_id` FOREIGN KEY (`banka_id`) REFERENCES `tbl_sbt_banka` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sanal_poslar`
--

/*!40000 ALTER TABLE `tbl_sanal_poslar` DISABLE KEYS */;
INSERT INTO `tbl_sanal_poslar` (`id`,`banka_id`,`magaza_no`,`api_kullanicisi`,`sifre`,`3d_secure`,`on_otorizasyon`,`onay`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,1,'111111111','488','şireli şifre',0,0,1,999,'2012-03-26 23:03:01',NULL,'2012-04-21 01:48:39');
/*!40000 ALTER TABLE `tbl_sanal_poslar` ENABLE KEYS */;


--
-- Definition of trigger `trg_sanal_poslar_ek`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_sanal_poslar_ek`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_sanal_poslar_ek` BEFORE INSERT ON `tbl_sanal_poslar` FOR EACH ROW BEGIN
SET NEW.tarih_ek = NOW();
END $$

DELIMITER ;

--
-- Definition of trigger `trg_sanal_poslar_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_sanal_poslar_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_sanal_poslar_gun` BEFORE UPDATE ON `tbl_sanal_poslar` FOR EACH ROW BEGIN
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
 (1,'AKBANK','AKBANK',NULL,NULL),
 (2,'ALBARAKA TÜRK KATILIM BANKASI','ALBARAKA',NULL,NULL),
 (3,'ALTERNATİFBANK','ALTERNATİFBANK',NULL,NULL),
 (4,'ANADOLUBANK','ANADOLUBANK',NULL,NULL),
 (5,'ARAP TÜRK BANKASI','ARAP TÜRK BANKASI',NULL,NULL),
 (6,'ASYA KATILIM BANKASI','BANK ASYA',NULL,NULL),
 (7,'CITIBANK','CITIBANK',NULL,NULL),
 (8,'DENİZBANK','DENİZBANK',NULL,NULL),
 (9,'DEUTSCHE BANK','DEUTSCHE BANK',NULL,NULL),
 (10,'EUROBANK TEKFEN','EUROBANK',NULL,NULL),
 (11,'FİBABANKA','FİBA',NULL,NULL),
 (12,'FİNANSBANK','FİNANS',NULL,NULL),
 (13,'HSBC BANK','HSBC',NULL,NULL),
 (14,'ING BANK','ING',NULL,NULL),
 (15,'KUVEYT TÜRK KATILIM BANKASI','KUVEYT TÜRK',NULL,NULL),
 (16,'ŞEKERBANK','ŞEKERBANK',NULL,NULL),
 (17,'TÜRKİYE İŞ BANKASI','İŞ BANKASI',NULL,NULL),
 (18,'TÜRKİYE FİNANS KATILIM BANKASI','TÜRKİYE FİNANS',NULL,NULL),
 (19,'TÜRKİYE GARANTİ BANKASI','GARANTİ',NULL,NULL),
 (20,'TÜRKİYE HALK BANKASI','HALK BANKASI',NULL,NULL),
 (21,'TÜRKİYE VAKIFLAR BANKASI','VAKIF BANK',NULL,NULL),
 (22,'TÜRK EKONOMİ BANKASI','EKONOMİ',NULL,NULL),
 (23,'T.C. ZİRAAT BANKASI','ZİRAAT',NULL,NULL),
 (24,'TEKSTİL BANKASI','TEKSTİL BANK',NULL,NULL),
 (25,'TURKISH BANK','TURKISH',NULL,NULL),
 (26,'TURKLAND BANK','TURKLAND',NULL,NULL),
 (27,'YAPI VE KREDİ BANKASI','YAPI KREDİ',NULL,NULL);
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
 (1,'SERAS MACHINES','SERAS MACHINES Co. Ltd.','SERASMAC','serasmac.com','serasmac@serasmac.com','SERASMAC, SERAS MAC, SERAS MACHINES Co. Ltd., SERASMAK, SERAS, SERAS MAKINE, SERAS MAKINA, SERASMAK, SERAS MAK, SERAS MAKINA, SERAS MAKINE','SERASMAC - SERAS MACHINES Co. Ltd.','<script type=\"text/javascript\">\n\n  var _gaq = _gaq || [];\n  _gaq.push([\'_setAccount\', \'UA-30102156-1\']);\n  _gaq.push([\'_trackPageview\']);\n\n  (function() {\n    var ga = document.createElement(\'script\'); ga.type = \'text/javascript\'; ga.async = true;\n    ga.src = (\'https:\' == document.location.protocol ? \'https://ssl\' : \'http://www\') + \'.google-analytics.com/ga.js\';\n    var s = document.getElementsByTagName(\'script\')[0]; s.parentNode.insertBefore(ga, s);\n  })();\n\n</script>',NULL,'turkcell','turkcell','turkcell','turkcell','turkcell','turkcell',NULL,999,'2012-04-16 02:07:32');
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
 (1,0,'Yurtiçi Kargo','yurtici.jpg',NULL,1.00000,0.40000,7.00000,100.00000,999.00),
 (2,0,'Mng Kargo','mng.jpg',NULL,1.10000,0.45000,7.20000,100.00000,999.00),
 (3,0,'Fillo Kargo','fillo.jpg',NULL,NULL,NULL,NULL,NULL,NULL),
 (4,0,'Horoz Kargo','horoz.jpg',NULL,NULL,NULL,NULL,NULL,NULL),
 (5,0,'Ptt Kargo','ptt.jpg',NULL,NULL,NULL,NULL,NULL,NULL),
 (6,0,'Aras Kargo','aras.jpg',NULL,NULL,NULL,NULL,NULL,NULL);
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
 (1,'fatih@acoder.info','123456','mail.acoder.info','587',999,'2012-02-12 23:20:32');
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
  `xml` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `xml` (`xml`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COMMENT='SABIT TABLOSU';

--
-- Dumping data for table `tbl_sbt_sabit`
--

/*!40000 ALTER TABLE `tbl_sbt_sabit` DISABLE KEYS */;
INSERT INTO `tbl_sbt_sabit` (`id`,`aciklama`,`sayfa`,`xml`) VALUES 
 (1,'Ürünler kısmı sorting için - Ürün Adı',NULL,0),
 (2,'Ürünler kısmı sorting için - Ürün Kodu',NULL,0),
 (3,'Ürün detayı için - Detaylar',NULL,0),
 (4,'Anasayfa sağ başlık - Kategoriler',NULL,0),
 (5,'Anasayfa sağ başlık - Uygulama Resimleri',NULL,0),
 (6,'Anasayfa sağ başlık - Uygulama Videoları',NULL,0),
 (7,'Anasayfa sağ başlık - Etiketler',NULL,0),
 (8,'Anasayfa sağ başlık - Mail Listesi',NULL,0),
 (9,'Sayfa başlığı - İletişim',NULL,0),
 (10,'İletişim üstü başlık\n',NULL,0),
 (11,'İletişim input - Ad Soyad',NULL,0),
 (12,'İletişim input - Mail',NULL,0),
 (13,'İletişim input - Telefon',NULL,0),
 (14,'İletişim input - Görüşler',NULL,0),
 (15,'İletişim de ki edebiyat bölümü',NULL,0),
 (16,'Logo altında ki slogan - makine sağlayıcınız',NULL,0),
 (17,'Sayfa başlığı - Ürünler',NULL,0),
 (18,'İletişim input - Gönder',NULL,0),
 (19,'İletişim Sağ - Adres ve Mail Bilgileri',NULL,0),
 (20,'İletişim - Başlık (iletişim formu)',NULL,0),
 (21,'Ürün sayfası - Açıklama',NULL,0),
 (22,'Ürün sayfası - Resimler',NULL,0),
 (23,'Ürün sayfası - Videolar',NULL,0),
 (24,'Sayfa başlığı - Hakkımızda',NULL,0),
 (25,'Hakkımızda - Başlık (SERASMAC Hakkında)',NULL,0),
 (26,'Hakkımızda Sayfası - İçerik',NULL,0),
 (27,'Hakkımızda Sayfası - Başlık',NULL,0),
 (28,'Sayfa başlığı - Belgeler',NULL,0),
 (29,'İletişim - Form Kontrol 1','contact',1),
 (30,'İletişim - Form Kontrol 2','contact',1),
 (31,'Iletisim - Form Kontrol 3','contact',1),
 (32,'Iletisim - Form Kontrol 4','contact',1),
 (33,'Iletisim - Form Kontrol 5','contact',1),
 (34,'Iletisim - Form Kontrol 6','contact',1),
 (35,'Iletisim - Form Kontrol 7','contact',1),
 (36,'Güvenlik kodu yanlış',NULL,0),
 (37,'Bilgileriniz başarıyla gönderilmiştir.',NULL,0),
 (38,'Anasayfa sağ başlık - Markalar',NULL,0),
 (39,'TÜM KATEGORİLER',NULL,0),
 (40,'TÜM MARKALAR',NULL,0),
 (41,'Sayfa başlığı - Etiket',NULL,0),
 (42,'Sayfa başlığı - Kategori',NULL,0),
 (43,'Sayfa başlığı - Marka',NULL,0),
 (44,'Sayfa başlığı - Tüm Ürünler',NULL,0),
 (45,'Arama Butonu',NULL,0),
 (46,'Arama Text (Ürünlerde Ara)',NULL,0),
 (47,'Arama - Sonuç bulamazsa',NULL,0),
 (48,'Arama - Kelime giriniz','search',1),
 (49,'Arama - Kelime 3 karakterden küçük olmasın','search',1),
 (50,'HAZIRLANIYOR.',NULL,0),
 (51,'ÖDEME BEKLENIYOR.',NULL,0),
 (52,'ÖDEME TAMAMLANDI. ÜRÜN(LER) TEDARIK SÜRECINDE.',NULL,0),
 (53,'TASIMA (KARGO) FIRMASINA VERILDI.',NULL,0),
 (54,'ÜRÜN(LER) TESLIM EDILDI.',NULL,0),
 (55,'ÖDEME GERÇEKLESMEDI. SIPARIS IPTAL EDILDI.',NULL,0),
 (56,'ADRES BILGISI YANLIS. SIPARIS IPTAL EDILDI.',NULL,0),
 (57,'KARGO TESLIM EDILEMEDI. ÜRÜN(LER) GERI GELDI.',NULL,0),
 (58,'SIPARIS YENIDEN KARGOYA VERILDI.',NULL,0),
 (59,'ALICI BULUNAMADI. SIPARIS IPTAL EDILDI.',NULL,0),
 (60,'Üye Kayit Formu',NULL,0),
 (61,'Nerdesin:',NULL,0),
 (62,'Ana Sayfa',NULL,0),
 (63,'Sizin Için Seçtiklerimiz',NULL,0),
 (64,'Türkiye\'nin en büyük tekne magazasina hosgeldiniz.',NULL,0),
 (65,'E-Posta Adresiniz',NULL,0),
 (66,'Sifre',NULL,0),
 (67,'Beni hatirla',NULL,0),
 (68,'Sifremi unuttum?',NULL,0),
 (69,'Yeni üye ol',NULL,0),
 (70,'Adiniz Soyadiniz',NULL,0),
 (71,'Sifre',NULL,0),
 (72,'Sifre Tekrar',NULL,0),
 (73,'Telefon',NULL,0),
 (74,'Kayit Ol',NULL,0),
 (75,'KATEGORILER',NULL,0),
 (76,'MARKALAR',NULL,0),
 (77,'EN ÇOK SATILANLAR',NULL,0),
 (78,'INDIRIMLI ÜRÜNLER',NULL,0),
 (79,'SEPETIM',NULL,0),
 (80,'YENI ÜRÜNLER',NULL,0),
 (81,'KARGO',NULL,0),
 (82,'HABER SERVISI',NULL,0),
 (83,'Marin Boat ile ilgili güncel gelismelerden ilk siz haberdar olmak için:',NULL,0),
 (84,'Lütfen adinizi giriniz.',NULL,0),
 (85,'Lütfen e-posta adresinizi giriniz.',NULL,0),
 (86,'Lütfen e-posta adresinizi kontrol ediniz.',NULL,0),
 (87,'Lütfen sifrenizi giriniz.',NULL,0),
 (88,'Lütfen sifresinizi tekrar giriniz.',NULL,0),
 (89,'Lütfen sifrelerinizi kontrol ediniz.',NULL,0),
 (90,'Lütfen telefon numaranizi giriniz.',NULL,0),
 (91,'Üye kayit isleminiz basariyla gerçeklesmistir. Lütfen belirttiginiz e-posta adresine gönderilen onaylama linkine tiklayiniz.',NULL,0),
 (92,'Girdiginiz e-posta adresi zaten kayitlidir.',NULL,0),
 (93,'Giris Yap',NULL,0),
 (94,'Kullanici adi bulunamadi. Lütfen kullanici adinizi kontrol ederek yeniden yaziniz.',NULL,0),
 (95,'Hesabiniz aktif olmadigi için üye girisi yapamazsiniz!',NULL,0),
 (96,'Eksik veya yanlis sifre girdiniz. Lütfen sifrenizi kontrol ederek yeniden deneyiniz.',NULL,0),
 (97,'Alisveris Sepetim',NULL,0),
 (98,'Üye Girisi',NULL,0),
 (99,'Çikis Yap',NULL,0),
 (100,'Müsteri Hizmetleri',NULL,0),
 (101,'Siparis Takibi',NULL,0),
 (102,'Üyelik Bilgilerim',NULL,0),
 (103,'Sepete Ekle',NULL,0),
 (104,'Ürünü Incele',NULL,0),
 (105,'Yazdir',NULL,0),
 (106,'Favorilere Ekle',NULL,0),
 (107,'Stokta Yok',NULL,0),
 (108,'Yorum Yaz',NULL,0),
 (109,'Hemen Al',NULL,0),
 (110,'Sepeti Güncelle',NULL,0),
 (111,'Seçilenleri Sil',NULL,0),
 (112,'Alisverisi Tamamla',NULL,0),
 (113,'Ürün Adi',NULL,0),
 (114,'Birim Fiyat',NULL,0),
 (115,'Adet',NULL,0),
 (116,'Toplam Fiyat',NULL,0),
 (117,'Sepetim',NULL,0),
 (118,'Adres Bilgileri',NULL,0),
 (119,'Ödeme Bilgileri',NULL,0),
 (120,'Siparis Onayi',NULL,0),
 (121,'Ürün Bilgisi',NULL,0),
 (122,'Ürün Yorumlari',NULL,0),
 (123,'Taksik Seçenekleri',NULL,0),
 (124,'Ürün Resimleri',NULL,0),
 (125,'Ürün Videolari',NULL,0),
 (126,'Önerileriniz',NULL,0),
 (127,'Sepetinizde stogu bulunmayan ürünler sepetinizden silinmistir.',NULL,0),
 (128,'Taksitlendirme seçenegi bulunmuyor.',NULL,0),
 (129,'Taksit',NULL,0),
 (130,'Taksit Tutari',NULL,0),
 (131,'Toplam Tutar',NULL,0),
 (132,'Ürün için eklenmis resim bulunmuyor!',NULL,0),
 (133,'Ürün için eklenmis video bulunmuyor!',NULL,0),
 (134,'Toplam',NULL,0),
 (135,'KDV',NULL,0),
 (136,'Genel Toplam',NULL,0),
 (137,'Alisveris sepetinizde ürün bulunmuyor!',NULL,0),
 (138,'Fatura Bilgileri',NULL,0),
 (139,'Teslimat Bilgileri',NULL,0),
 (140,'Lütfen Seçiniz:',NULL,0),
 (141,'Yeni Adres Ekle',NULL,0),
 (142,'Kaydet',NULL,0),
 (143,'Bireysel',NULL,0),
 (144,'Kurumsal',NULL,0),
 (145,'Fatura Tipi',NULL,0),
 (146,'Firma Adi',NULL,0),
 (147,'Isim Soyisim',NULL,0),
 (148,'Adres',NULL,0),
 (149,'Posta Kodu',NULL,0),
 (150,'Ülke',NULL,0),
 (151,'Il',NULL,0),
 (152,'Ilçe',NULL,0),
 (153,'Açik Adres',NULL,0),
 (154,'Vergi Dairesi',NULL,0),
 (155,'Vergi No',NULL,0),
 (156,'TC Kimlik No',NULL,0),
 (157,'Devam Et',NULL,0),
 (158,'Banka Havalesi',NULL,0),
 (159,'Kredi Karti',NULL,0),
 (160,'Kapida Ödeme',NULL,0),
 (161,'Paypal',NULL,0),
 (162,'PTT',NULL,0),
 (163,'Banka:',NULL,0),
 (164,'Hesap Sahibi:',NULL,0),
 (165,'Sube:',NULL,0),
 (166,'Hesap No:',NULL,0),
 (167,'IBAN No:',NULL,0),
 (168,'Ödeme Yap',NULL,0),
 (169,'Kart Üzerindeki Isim',NULL,0),
 (170,'Kart Tipi',NULL,0),
 (171,'Son Kullanma Tarihi',NULL,0),
 (172,'Kart Numarasi',NULL,0),
 (173,'Güvenlik Kodu',NULL,0),
 (174,'Banka Adi',NULL,0),
 (175,'Bankanizi Seçiniz',NULL,0),
 (176,'Listede Yok',NULL,0),
 (177,'Ay',NULL,0),
 (178,'Yil',NULL,0),
 (179,'Detayli bilgi',NULL,0),
 (180,'Güncelle',NULL,0),
 (181,'Sifremi degistirmek istiyorum',NULL,0),
 (182,'Yeni Sifreniz',NULL,0),
 (183,'Yeni Sifreniz Tekrar',NULL,0),
 (184,'Üyelik bilgileriniz basariyla güncellenmistir.',NULL,0),
 (185,'Lütfen suan ki sifrenizi kontrol ediniz.',NULL,0),
 (186,'Beklenmedik bir hata oluştu.',NULL,0),
 (187,'Siparişiniz bulunmuyor.',NULL,0),
 (188,'Sipariş No',NULL,0),
 (189,'Toplam Tutar',NULL,0),
 (190,'Durumu',NULL,0),
 (191,'Sipariş Detayı',NULL,0),
 (192,'Sipariş Tarihi',NULL,0),
 (193,'Ödeme Şekli',NULL,0),
 (194,'KDV Dahil Fiyatı',NULL,0),
 (195,'İndirimli Fiyatı',NULL,0),
 (196,'Fiyatı',NULL,0),
 (197,'Markalar',NULL,0),
 (198,'Ödeme Bildirimi Yap',NULL,0),
 (199,'Ödeme Bildirimi',NULL,0),
 (200,'EFT/Havale Yapılacak Banka',NULL,0),
 (201,'Ödeme Tipi',NULL,0),
 (202,'İşlem No',NULL,0),
 (203,'Ödeme Tarihi',NULL,0),
 (204,'EFT',NULL,0),
 (205,'Havale',NULL,0),
 (206,'Diğer Ödeme Tipi',NULL,0),
 (207,'Lütfen marka seçiniz',NULL,0),
 (208,'Ürün Kodu',NULL,0),
 (209,'Ödeme bildiriniz başarıyla kayıt edilmiştir.',NULL,0),
 (210,'Kargo Bilgileri',NULL,0),
 (211,'Seç',NULL,0),
 (212,'Kargo Firması',NULL,0),
 (213,'Not',NULL,0),
 (214,'Size Özel Fiyatı',NULL,0),
 (215,'Geri',NULL,0),
 (216,'Ücretsiz Kargo',NULL,0);
/*!40000 ALTER TABLE `tbl_sbt_sabit` ENABLE KEYS */;


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
  CONSTRAINT `tbl_scriptler_admin_id_ek` FOREIGN KEY (`admin_id_ek`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_scriptler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_scriptler_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `tbl_menuler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sepetler`
--

/*!40000 ALTER TABLE `tbl_sepetler` DISABLE KEYS */;
INSERT INTO `tbl_sepetler` (`id`,`session_id`,`kullanici_id`,`urun_id`,`adet`,`durum`,`tarih`) VALUES 
 (1,'lml405w0u4zf2wgmeackbarv',1,44,1,1,'2012-04-23 00:52:33'),
 (2,'lml405w0u4zf2wgmeackbarv',1,38,3,1,'2012-04-23 10:42:01'),
 (3,'lml405w0u4zf2wgmeackbarv',1,48,3,1,'2012-04-23 10:35:33'),
 (4,'lml405w0u4zf2wgmeackbarv',1,51,2,1,'2012-04-23 10:35:45'),
 (5,'tjwtrh0ze2gdit22jfjnjfvi',1,38,1,1,'2012-04-23 10:35:24'),
 (6,'tjwtrh0ze2gdit22jfjnjfvi',1,48,1,1,'2012-04-23 10:35:30'),
 (7,'tjwtrh0ze2gdit22jfjnjfvi',1,49,1,1,'2012-04-23 10:35:38'),
 (8,'tjwtrh0ze2gdit22jfjnjfvi',1,51,1,1,'2012-04-23 10:35:41'),
 (9,'tjwtrh0ze2gdit22jfjnjfvi',1,44,2,1,'2012-04-23 10:58:31'),
 (10,'tjwtrh0ze2gdit22jfjnjfvi',1,38,1,1,'2012-04-23 11:17:52'),
 (11,'1hdzoyvxisf3o1k0re5f0ixz',1,38,2,1,'2012-04-23 20:49:44'),
 (12,'1hdzoyvxisf3o1k0re5f0ixz',1,44,2,1,'2012-04-23 20:49:56'),
 (13,'1hdzoyvxisf3o1k0re5f0ixz',1,49,1,1,'2012-04-23 20:50:02'),
 (14,'1hdzoyvxisf3o1k0re5f0ixz',1,47,3,1,'2012-04-23 20:50:07'),
 (15,'1hdzoyvxisf3o1k0re5f0ixz',1,51,2,1,'2012-04-23 20:50:12'),
 (16,'1hdzoyvxisf3o1k0re5f0ixz',1,38,2,1,'2012-04-24 23:37:32'),
 (17,'tloujucp4fi3qdqn0fml5mkc',1,44,1,1,'2012-04-24 23:37:36'),
 (18,'tloujucp4fi3qdqn0fml5mkc',1,47,1,1,'2012-04-24 23:37:39'),
 (19,'tloujucp4fi3qdqn0fml5mkc',1,48,1,1,'2012-04-24 23:37:41'),
 (20,'tloujucp4fi3qdqn0fml5mkc',1,38,2,1,'2012-04-25 01:59:44'),
 (21,'tloujucp4fi3qdqn0fml5mkc',1,44,1,1,'2012-04-25 01:59:37'),
 (22,'tloujucp4fi3qdqn0fml5mkc',1,47,1,1,'2012-04-25 01:59:40'),
 (23,'tloujucp4fi3qdqn0fml5mkc',1,48,1,1,'2012-04-25 01:59:44'),
 (24,'ogayfyqgnzewu50ylvuao0q4',1,38,1,1,'2012-04-25 17:41:53'),
 (25,'ogayfyqgnzewu50ylvuao0q4',1,44,2,1,'2012-04-25 17:41:58'),
 (26,'ogayfyqgnzewu50ylvuao0q4',1,48,1,1,'2012-04-25 17:42:01'),
 (27,'ogayfyqgnzewu50ylvuao0q4',1,47,1,1,'2012-04-25 17:42:02'),
 (28,'5px5qjcjeszbvmzg4scngvw2',1,38,1,1,'2012-04-26 17:14:43'),
 (29,'0sc5faitrufxn2frl1o5vb4t',1,38,1,1,'2012-04-26 23:33:36'),
 (30,'0sc5faitrufxn2frl1o5vb4t',1,44,2,1,'2012-04-26 23:33:42'),
 (31,'0sc5faitrufxn2frl1o5vb4t',1,47,1,1,'2012-04-26 23:33:45'),
 (32,'0sc5faitrufxn2frl1o5vb4t',1,48,1,1,'2012-04-26 23:33:49'),
 (33,'0sc5faitrufxn2frl1o5vb4t',1,51,1,1,'2012-04-26 23:33:52'),
 (34,'0sc5faitrufxn2frl1o5vb4t',1,38,1,1,'2012-04-27 00:03:35'),
 (35,'tj0xyohs1ocy45i3oeywqrr2',1,34,2,0,'2012-04-27 20:34:54'),
 (36,'tj0xyohs1ocy45i3oeywqrr2',1,35,1,0,'2012-04-27 20:35:03'),
 (37,'tj0xyohs1ocy45i3oeywqrr2',1,36,1,0,'2012-04-27 20:35:10');
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
  `siparis_durum_id` int(11) NOT NULL DEFAULT '-1',
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
  `admin_id_gun` int(11) DEFAULT NULL COMMENT 'Güncelleyen admin',
  `tarih_gun` datetime DEFAULT NULL COMMENT 'Güncelleme tarihi',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `kullanici_id` (`kullanici_id`),
  KEY `odeme_sekli_id` (`odeme_sekli_id`),
  KEY `indirim_id` (`indirim_id`),
  KEY `para_birimi_id` (`para_birimi_id`),
  KEY `tarih_ek` (`tarih`),
  KEY `admin_id_gun` (`admin_id_gun`),
  KEY `tarih_gun` (`tarih_gun`),
  KEY `no` (`no`),
  KEY `siparis_durum_id` (`siparis_durum_id`),
  KEY `tutar` (`tutar`),
  KEY `toplam_tutar` (`toplam_tutar`),
  KEY `indirim_tutar` (`indirim_tutar`),
  KEY `kdv_tutar` (`kdv_tutar`),
  KEY `kargo_tutar` (`kargo_tutar`),
  KEY `fatura_adres_id` (`fatura_adres_id`),
  KEY `kargo_adres_id` (`kargo_adres_id`),
  KEY `vergi_bilgileri_id` (`vergi_bilgileri_id`),
  CONSTRAINT `fk_siparisler_admin_id_gun` FOREIGN KEY (`admin_id_gun`) REFERENCES `tbl_adminler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_fatura_adres_id` FOREIGN KEY (`fatura_adres_id`) REFERENCES `tbl_cpy_siparisler_kullanicilar_adresler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_indirim_id` FOREIGN KEY (`indirim_id`) REFERENCES `tbl_cpy_siparisler_indirimler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_kargo_adres_id` FOREIGN KEY (`kargo_adres_id`) REFERENCES `tbl_cpy_siparisler_kullanicilar_adresler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_kullanici_id` FOREIGN KEY (`kullanici_id`) REFERENCES `tbl_kullanicilar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_odeme_sekli_id` FOREIGN KEY (`odeme_sekli_id`) REFERENCES `tbl_sbt_odeme_sekli` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_para_birimi_id` FOREIGN KEY (`para_birimi_id`) REFERENCES `tbl_sbt_para_birim` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_siparis_durum_id` FOREIGN KEY (`siparis_durum_id`) REFERENCES `tbl_sbt_siparis_durum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_vergi_bilgileri_id` FOREIGN KEY (`vergi_bilgileri_id`) REFERENCES `tbl_cpy_siparisler_kullanicilar_vergi_bilgiler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_siparisler`
--

/*!40000 ALTER TABLE `tbl_siparisler` DISABLE KEYS */;
INSERT INTO `tbl_siparisler` (`id`,`kullanici_id`,`no`,`siparis_durum_id`,`kargo_adres_id`,`fatura_adres_id`,`vergi_bilgileri_id`,`tutar`,`indirim_id`,`indirim_tutar`,`indirimli_tutar`,`kdv_tutar`,`kargo_tutar`,`toplam_tutar`,`para_birimi_id`,`odeme_sekli_id`,`kur_tarih`,`tarih`,`admin_id_gun`,`tarih_gun`) VALUES 
 (3,1,'1',2,36,37,21,4804.44222,NULL,0.00000,0.00000,864.79960,0.00000,5669.24182,1,1,'2012-04-24','2012-04-23 20:52:18',NULL,'2012-04-26 22:48:19'),
 (4,1,'250412-1-4',2,38,39,22,3528.76000,NULL,0.00000,0.00000,424.50000,0.00000,3953.26000,1,1,'2012-04-24','2012-04-25 01:23:34',NULL,'2012-04-26 22:48:22'),
 (5,1,'250412-1-5',2,40,41,23,3528.76000,NULL,0.00000,0.00000,635.19000,0.00000,4163.95000,1,1,'2012-04-24','2012-04-25 02:03:18',NULL,'2012-04-26 22:48:24'),
 (6,1,'250412-1-6',2,42,43,24,3213.21000,NULL,0.00000,0.00000,578.38000,0.00000,3791.59000,1,1,'2012-04-25','2012-04-25 17:58:32',NULL,'2012-04-26 22:48:29'),
 (7,1,'260412-1-7',2,44,45,25,453.28000,NULL,0.00000,0.00000,81.59000,0.00000,534.87000,1,1,'2012-04-26','2012-04-26 22:47:28',NULL,NULL),
 (8,1,'260412-1-8',2,46,47,26,3589.83000,NULL,0.00000,0.00000,646.17000,0.00000,4236.00000,1,1,'2012-04-26','2012-04-26 23:35:15',NULL,NULL),
 (9,1,'270412-1-9',2,48,49,27,453.28000,NULL,0.00000,0.00000,81.59000,0.00000,534.87000,1,1,'2012-04-26','2012-04-27 00:21:35',NULL,NULL);
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
-- Definition of trigger `trg_siparisler_gun`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_siparisler_gun`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_siparisler_gun` BEFORE UPDATE ON `tbl_siparisler` FOR EACH ROW BEGIN
SET NEW.tarih_gun = NOW();
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_siparisler_gonderimler`
--

/*!40000 ALTER TABLE `tbl_siparisler_gonderimler` DISABLE KEYS */;
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
  CONSTRAINT `fk_siparisler_odemeler_kk_kullanici_id` FOREIGN KEY (`kullanici_id`) REFERENCES `tbl_kullanicilar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_odemeler_kk_oranlar_id` FOREIGN KEY (`kredi_karti_oranlar_id`) REFERENCES `tbl_cpy_siparisler_kredi_karti_oranlar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_odemeler_kk_para_birimi_id` FOREIGN KEY (`para_birimi_id`) REFERENCES `tbl_sbt_para_birim` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_odemeler_kk_sanal_pos_id` FOREIGN KEY (`sanal_pos_id`) REFERENCES `tbl_sanal_poslar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_siparisler_odemeler_kk_siparis_id` FOREIGN KEY (`siparis_id`) REFERENCES `tbl_siparisler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_siparisler_odemeler_kk`
--

/*!40000 ALTER TABLE `tbl_siparisler_odemeler_kk` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_siparisler_urunler`
--

/*!40000 ALTER TABLE `tbl_siparisler_urunler` DISABLE KEYS */;
INSERT INTO `tbl_siparisler_urunler` (`id`,`siparis_id`,`sepet_id`,`siparisler_urunler_id`,`adet`,`tarih`) VALUES 
 (7,3,11,31,2,'2012-04-23 20:52:19'),
 (8,3,12,32,2,'2012-04-23 20:52:19'),
 (9,3,13,33,1,'2012-04-23 20:52:19'),
 (10,3,14,34,3,'2012-04-23 20:52:19'),
 (11,3,15,35,2,'2012-04-23 20:52:19'),
 (12,4,16,36,2,'2012-04-25 01:23:35'),
 (13,4,17,37,1,'2012-04-25 01:23:35'),
 (14,4,18,38,1,'2012-04-25 01:23:35'),
 (15,4,19,39,1,'2012-04-25 01:23:35'),
 (16,5,20,40,2,'2012-04-25 02:03:18'),
 (17,5,21,41,1,'2012-04-25 02:03:18'),
 (18,5,22,42,1,'2012-04-25 02:03:18'),
 (19,5,23,43,1,'2012-04-25 02:03:18'),
 (20,6,24,44,1,'2012-04-25 17:58:33'),
 (21,6,25,45,2,'2012-04-25 17:58:33'),
 (22,6,26,46,1,'2012-04-25 17:58:33'),
 (23,6,27,47,1,'2012-04-25 17:58:34'),
 (24,7,28,48,1,'2012-04-26 22:47:28'),
 (25,8,29,49,1,'2012-04-26 23:35:15'),
 (26,8,30,50,2,'2012-04-26 23:35:15'),
 (27,8,31,51,1,'2012-04-26 23:35:15'),
 (28,8,32,52,1,'2012-04-26 23:35:15'),
 (29,8,33,53,1,'2012-04-26 23:35:15'),
 (30,9,34,54,1,'2012-04-27 00:21:35');
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
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;

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
 (9,999,9,'İLETİŞİM',1,999,'2011-12-04 21:42:13',999,'2011-12-04 23:36:40'),
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
 (20,999,20,'İLETİŞİM FORMU',1,999,'2011-12-05 00:36:22',999,'2012-03-09 00:32:54'),
 (21,999,21,'Ürün Açıklaması',1,999,'2011-12-10 18:16:02',999,'2011-12-10 18:16:45'),
 (22,999,22,'Ürün Resimleri',1,999,'2011-12-10 18:16:09',999,'2011-12-10 18:16:25'),
 (23,999,23,'Ürün Videoları',1,999,'2011-12-10 18:16:37',999,'2012-03-09 00:32:52'),
 (24,999,24,'HAKKIMIZDA',1,999,'2011-12-17 15:12:27',999,'2012-03-09 00:32:17'),
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
 (64,999,64,'Türkiye\'nin en büyük tekne magazasina hosgeldiniz.',1,999,'2012-04-22 19:19:13',NULL,NULL),
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
 (94,999,93,'Giris Yap',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (95,999,94,'Kullanici adi bulunamadi.<br/>Lütfen kullanici adinizi kontrol ederek yeniden yaziniz.',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (96,999,95,'Hesabiniz aktif olmadigi için üye girisi yapamazsiniz!',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (97,999,96,'Eksik veya yanlis sifre girdiniz.<br/>Lütfen sifrenizi kontrol ederek yeniden deneyiniz.',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (98,999,97,'Alisveris Sepetim',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (99,999,98,'Üye Girisi',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (100,999,99,'Çikis Yap',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (101,999,100,'Müsteri Hizmetleri',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (102,999,101,'Siparis Takibi',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (103,999,102,'Üyelik Bilgilerim',1,999,'2012-04-22 19:19:14',999,'2012-04-28 18:15:24'),
 (104,999,103,'Sepete Ekle',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (105,999,104,'Ürünü Incele',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (106,999,105,'Yazdir',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (107,999,106,'Favorilere Ekle',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (108,999,107,'Stokta Yok',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (109,999,108,'Yorum Yaz',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (110,999,109,'Hemen Al',1,999,'2012-04-22 19:19:14',999,'2012-04-28 18:15:23'),
 (111,999,110,'Sepeti Güncelle',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (112,999,111,'Seçilenleri Sil',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (113,999,112,'Alisverisi Tamamla',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (114,999,113,'Ürün Adi',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (115,999,114,'Birim Fiyat',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (116,999,115,'Adet',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (117,999,116,'Toplam Fiyat',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (118,999,117,'Sepetim',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (119,999,118,'Adres Bilgileri',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (120,999,119,'Ödeme Bilgileri',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (121,999,120,'Siparis Onayi',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (122,999,121,'Ürün Bilgisi',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (123,999,122,'Ürün Yorumlari',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (125,999,123,'Taksit Seçenekleri',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (126,999,124,'Ürün Resimleri',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (127,999,125,'Ürün Videolari',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (128,999,126,'Önerileriniz',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (129,999,127,'Sepetinizde stogu bulunmayan ürünler sepetinizden silinmistir.',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (130,999,128,'Taksitlendirme seçenegi bulunmuyor.',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (131,999,129,'Taksit',1,999,'2012-04-22 19:19:14',NULL,NULL),
 (132,999,130,'Taksit Tutari',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (133,999,131,'Toplam Tutar',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (134,999,132,'Ürün için eklenmis resim bulunmuyor!',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (135,999,133,'Ürün için eklenmis video bulunmuyor!',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (136,999,134,'Toplam',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (137,999,135,'KDV',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (138,999,136,'Genel Toplam',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (139,999,137,'Alisveris sepetinizde ürün bulunmuyor!',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (140,999,138,'Fatura Bilgileri',1,999,'2012-04-22 19:19:15',999,'2012-04-13 15:26:12'),
 (141,999,139,'Teslimat Bilgileri',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (142,999,140,'Lütfen Seçiniz',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (143,999,141,'Yeni Adres Ekle',1,999,'2012-04-22 19:19:15',999,'2012-04-18 16:52:44'),
 (144,999,142,'Kaydet',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (145,999,143,'Bireysel',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (146,999,144,'Kurumsal',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (147,999,145,'Fatura Tipi',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (148,999,146,'Firma Adi',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (149,999,147,'Isim Soyisim',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (150,999,148,'Adres',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (151,999,149,'Posta Kodu',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (152,999,150,'Ülke',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (153,999,151,'Il',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (154,999,152,'Ilçe',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (155,999,153,'Açik Adres',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (156,999,154,'Vergi Dairesi',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (157,999,155,'Vergi No',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (158,999,156,'TC Kimlik No',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (159,999,157,'Devam Et',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (160,999,158,'Banka Havalesi',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (161,999,159,'Kredi Karti',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (162,999,160,'Kapida Ödeme',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (163,999,161,'Paypal',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (164,999,162,'PTT',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:19:36'),
 (165,999,163,'Banka:',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:19:37'),
 (166,999,164,'Hesap Sahibi:',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:19:38'),
 (167,999,165,'Sube:',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:19:39'),
 (168,999,166,'Hesap No:',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:19:39'),
 (169,999,167,'IBAN No:',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:19:40'),
 (171,999,168,'Ödeme Yap',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (172,999,169,'Kart Üzerindeki Isim',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:35:57'),
 (173,999,170,'Kart Tipi',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:35:58'),
 (174,999,171,'Son Kullanma Tarihi',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:35:58'),
 (175,999,172,'Kart Numarasi',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:35:59'),
 (176,999,173,'Güvenlik Kodu',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:36:00'),
 (177,999,174,'Banka Adi',1,999,'2012-04-22 19:19:15',999,'2012-04-19 11:36:01'),
 (178,999,175,'Bankanizi Seçiniz',1,999,'2012-04-22 19:19:15',999,'2012-04-19 12:29:25'),
 (179,999,176,'Listede Yok',1,999,'2012-04-22 19:19:15',999,'2012-04-19 12:29:24'),
 (180,999,177,'Ay',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (181,999,178,'Yil',1,999,'2012-04-22 19:19:15',NULL,NULL),
 (182,999,179,'Detayli bilgi',1,999,'2012-04-22 19:19:15',NULL,NULL),
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
 (220,999,216,'Ücretsiz Kargo',1,999,'2012-04-28 14:23:59',NULL,NULL);
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
 (34,999,1,115,NULL,NULL,'Şişme Bot 281','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',30,20,50,10.00,NULL,654.00000,1,1,5,NULL,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-04-28 13:19:49'),
 (35,999,2,116,1,2,'Şişme Bot 282','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',20,10,40,2.60,NULL,987.00000,2,1,5,1,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-04-28 13:19:48'),
 (36,999,3,117,NULL,NULL,'Şişme Bot 283','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',15,20,35,3.50,NULL,123.00000,1,1,5,NULL,1,1,0,1,999,'2012-04-22 20:35:38',999,'2012-04-28 13:19:48'),
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
 (47,999,2,115,1,2,'Şişme Bot 295','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,985.00000,2,1,1,NULL,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-04-24 22:38:47'),
 (48,999,3,116,NULL,NULL,'Şişme Bot 296','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,785.00000,1,1,1,2,1,1,1,1,999,'2012-04-22 20:35:38',999,'2012-03-30 14:39:06'),
 (49,999,1,117,1,2,'Şişme Bot 297','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,236.00000,1,1,1,NULL,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-03-30 14:39:06'),
 (50,999,2,118,NULL,NULL,'Şişme Bot 298','Lorem ipsum, lipsum ... hede hödö.','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,1248.00000,2,1,1,NULL,1,0,0,1,999,'2012-04-22 20:35:38',999,'2012-04-24 22:38:44'),
 (51,999,3,119,1,2,'Şişme Bot 299','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,478.00000,1,1,1,1,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-03-30 14:39:06'),
 (53,999,1,120,1,2,'Şişme Bot 300','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,963.00000,2,1,1,NULL,1,1,1,1,999,'2012-04-22 20:35:38',999,'2012-04-28 11:31:45'),
 (55,999,2,115,1,2,'Şişme Bot 301','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,1142.00000,1,1,1,NULL,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-03-30 14:39:05'),
 (57,999,3,116,1,2,'Şişme Bot 302','DENEME ÜRÜNÜ, bir siirdir yasamak','<table summary=\"\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n<tbody>\n\n<tr>\n<td class=\"tdb\" width=\"135\"><strong>Model</strong></td>\n<td><strong>SerasMac</strong><strong> 1512 Lazer Kesim Makinesi</strong></td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Çalisma Alani</td>\n<td>150cm*120cm</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Gücü</td>\n<td>100W</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Lazer Tüp</td>\n<td>CO2 Lazer tüp ,su sogutmali</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kazima Hizi</td>\n<td>0-6000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Kesme Hizi</td>\n<td>0-5000mm/min</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Güç Kaynagi</td>\n<td>220V/50HZ , 110V/60HZ</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Formatlar</td>\n<td>BMP, PLT, DST, DXF, AI</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Destekledigi Yazilimlar</td>\n<td>CorelDraw, PhotoShop, AutoCAD,TAJIMA</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Sürücü Sistemi</td>\n<td>3 fazli step motor</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Net Agirlik</td>\n<td>450kg</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Ekstra özellikler</td>\n<td>Yükseklik ayarli çaslisma tablasi, kirmizi isik göstergesi, autofocus</td>\n</tr>\n\n<tr>\n<td class=\"tdb\" width=\"135\">Islenebilen Malzemeler</td>\n<td>Akrilik, kristal, cam, seramik, mermer, metal kaplama, kumas, deri, ahsap vb</td>\n</tr>\n\n<tr>\n<td colspan=\"2\" width=\"540\"><em><strong>24 ay garantili, 6 ay lazer tüp garantisi</strong></em><p><strong><em>Lazer Tüp, Kontrol Karti, Su sogutma sistemi, lens, ayna, gibi yedek parçalar her zaman stoklarimizda mevcuttur.</em></strong></p></td>\n</tr>\n\n</tbody>\n</table>',NULL,NULL,NULL,NULL,NULL,555.00000,2,1,1,NULL,1,0,0,1,999,'2012-04-22 20:35:38',999,'2012-04-24 22:38:45'),
 (58,999,1,117,NULL,NULL,'Şişme Bot 303','gfgfdgfgfgf<br/>g<br/>fg<br/>f<br/>gf','gfgfdgfgfgf<br/>g<br/>fg<br/>f<br/>gf',NULL,NULL,NULL,NULL,NULL,588.00000,1,1,1,1,1,0,1,1,999,'2012-04-22 20:35:38',999,'2012-04-28 11:31:44'),
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_urunler_etiketler`
--

/*!40000 ALTER TABLE `tbl_urunler_etiketler` DISABLE KEYS */;
INSERT INTO `tbl_urunler_etiketler` (`id`,`etiket_id`,`urun_id`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,85,42,999,'2012-04-27 16:46:46',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_urunler_kategoriler`
--

/*!40000 ALTER TABLE `tbl_urunler_kategoriler` DISABLE KEYS */;
INSERT INTO `tbl_urunler_kategoriler` (`id`,`urun_id`,`kategori_id`,`ana`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,42,12,0,999,'2012-04-27 16:46:45',NULL,NULL),
 (2,42,30,0,999,'2012-04-27 16:46:45',NULL,NULL),
 (3,42,31,0,999,'2012-04-27 16:46:45',NULL,NULL),
 (4,42,32,0,999,'2012-04-27 16:46:46',NULL,NULL),
 (5,42,33,0,999,'2012-04-27 16:46:46',NULL,NULL),
 (6,42,34,0,999,'2012-04-27 16:46:46',NULL,NULL),
 (7,42,37,0,999,'2012-04-27 16:46:46',NULL,NULL),
 (8,42,39,0,999,'2012-04-27 16:46:46',NULL,NULL),
 (9,42,41,0,999,'2012-04-27 16:46:46',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_urunler_markalar`
--

/*!40000 ALTER TABLE `tbl_urunler_markalar` DISABLE KEYS */;
INSERT INTO `tbl_urunler_markalar` (`id`,`urun_id`,`marka_id`,`ana`,`admin_id_ek`,`tarih_ek`,`admin_id_gun`,`tarih_gun`) VALUES 
 (1,42,1,0,999,'2012-04-27 16:46:45',NULL,NULL),
 (2,42,2,0,999,'2012-04-27 16:46:45',NULL,NULL),
 (3,42,3,0,999,'2012-04-27 16:46:45',NULL,NULL),
 (4,42,4,0,999,'2012-04-27 16:46:45',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

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
 (36,2,NULL,NULL,68,NULL,'2012-04-16 02:20:46');
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
