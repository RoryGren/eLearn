# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: shared64.accountservergroup.com (MySQL 5.6.32-78.1)
# Database: c350324_ii-eLearning
# Generation Time: 2020-01-09 11:10:46 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table AttribCat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AttribCat`;

CREATE TABLE `AttribCat` (
  `AttribCatId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`AttribCatId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Attributes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Attributes`;

CREATE TABLE `Attributes` (
  `AttribId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`AttribId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Chapter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Chapter`;

CREATE TABLE `Chapter` (
  `CourseId` int(10) unsigned NOT NULL,
  `ChapterId` int(11) unsigned NOT NULL,
  `ChCode` varchar(10) NOT NULL DEFAULT '',
  `ChDescription` varchar(150) NOT NULL DEFAULT '',
  `Status` tinyint(4) NOT NULL DEFAULT '1',
  `CreateDate` datetime NOT NULL,
  `CreateUserId` int(11) NOT NULL DEFAULT '1',
  `ModDate` datetime NOT NULL,
  `ModUserId` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`CourseId`,`ChapterId`),
  CONSTRAINT `FK_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Chapter` WRITE;
/*!40000 ALTER TABLE `Chapter` DISABLE KEYS */;

INSERT INTO `Chapter` (`CourseId`, `ChapterId`, `ChCode`, `ChDescription`, `Status`, `CreateDate`, `CreateUserId`, `ModDate`, `ModUserId`)
VALUES
	(1,1,'OV','OverView',1,'2017-03-15 00:00:00',1,'2017-03-15 00:00:00',1),
	(1,2,'PandV','Projects and Versions',1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1),
	(1,3,'Build','Building Your Project',1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1),
	(1,4,'Rep','Reporting',1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1),
	(1,5,'ImpExp','Importing and Exporting',1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1);

/*!40000 ALTER TABLE `Chapter` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Company`;

CREATE TABLE `Company` (
  `CompanyId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CompanyCode` varchar(10) NOT NULL DEFAULT '',
  `CompanyDesc` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`CompanyId`),
  UNIQUE KEY `Un_CoyCode` (`CompanyId`),
  KEY `IDX_CoyDesc` (`CompanyDesc`),
  KEY `IDX_CoyCode` (`CompanyCode`)
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=latin1;

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;

INSERT INTO `Company` (`CompanyId`, `CompanyCode`, `CompanyDesc`)
VALUES
	(0,'UNK','Unknown'),
	(1,'','AB Consulting'),
	(2,'','Abaqulusi Municipality'),
	(3,'AECOM','AECOM'),
	(4,'','Afri-Coast Engineers'),
	(5,'','Afrique du Sud Engineering Projects'),
	(6,'','AJ Services'),
	(7,'','Albrecht Knight Mvulana & Assoc'),
	(8,'','Aleche Consulting Engineers'),
	(9,'','Amaqhawe Consulting Engineers'),
	(10,'Ampcon','AMPCON Consulting Engineers'),
	(11,'','AngloAmerican'),
	(12,'','AngloCoal'),
	(13,'','AngloGoldAshanti'),
	(14,'','Anolyte Agencies'),
	(15,'','AOS Consulting Engineers'),
	(16,'','AR Edwards & Associates'),
	(17,'','AR Engineering'),
	(18,'','ArcelorMittal'),
	(19,'ARUP','ARUP'),
	(20,'Asande','Asande Projects'),
	(21,'AUR','Aurecon'),
	(22,'','AVMIN (Anglo Vaal Mining)'),
	(23,'','Baitsanape Engineering Services'),
	(24,'BAK','Bakone Group'),
	(25,'','Bali Engineering Consultants'),
	(26,'','Ballenden & Robb'),
	(27,'','BDE Consulting Engineers'),
	(28,'BEMA','BE Morgan (BEMA) / S&C Lavalin'),
	(29,'','Bekhakho'),
	(30,'BFBA','BFBA Consultants'),
	(31,'','BHP Billiton'),
	(32,'Bigen','Bigen Africa'),
	(33,'BJC','BJC Consulting Engineers (Pty) Ltd'),
	(34,'','Blaauwberg Municipality'),
	(35,'','BN Buziba & Associates'),
	(36,'BNM','BNM Technology'),
	(37,'Bono','Bono Engineering Services'),
	(38,'BOSCH','Bosch Projects'),
	(39,'','Boston Ink Electrical Consultants'),
	(40,'','Botswana Power Corporation'),
	(41,'','Breedevallei Municipality'),
	(42,'','Brits Electricity'),
	(43,'BTMN','BTMN Engineers'),
	(44,'','Buffalo City Municipality'),
	(45,'','Burmeister & Partners'),
	(46,'','BuroTech'),
	(47,'BVI','BVI Consulting Engineers'),
	(48,'','CA du Toit (Pty) Ltd'),
	(49,'','Calibre'),
	(50,'','Cape Peninsula University of Technology'),
	(51,'','Cape Town Municipality'),
	(52,'CARIFRO','Carifro Consulting Engineers'),
	(53,'','CDP Engineering Consultants'),
	(54,'','Cebisa Tshezi Engineering Services'),
	(55,'','CED'),
	(56,'CEMIG','CEMIG'),
	(57,'CENTLEC','Centlec'),
	(58,'','Charl Electrical Engineering'),
	(59,'','Charles Pein & Partners'),
	(60,'','Chocho Gilson & Associates'),
	(61,'','Chris van der Walt & Ass'),
	(62,'','City of Cape Town'),
	(63,'','CivilConsult'),
	(64,'','CJ Lourens Consulting Engineers'),
	(65,'CKR CAPE','CKR Cape Consulting Engineers'),
	(66,'CKR','CKR Consulting Engineers'),
	(67,'','Clinkscales Maughan-Brown'),
	(68,'CNR','CNR Consulting'),
	(69,'','Columbus'),
	(70,'','Conradie & Venter'),
	(71,'','Consolidated Power Engineering'),
	(72,'','Consolidated Power Projects'),
	(73,'','Consolidated Power System Consultants'),
	(74,'','CPV Consulting Engineers'),
	(75,'','Croswell Engineers'),
	(76,'CVG','CVG Consulting Engineers'),
	(77,'','CVW Mechanical & Electrical'),
	(78,'','CyberServe??'),
	(79,'','Dario Campetti Engineers'),
	(80,'','De Villiers & Moore'),
	(81,'DVK','De Villiers Khan Inc.'),
	(82,'','De Vos Paxton Consulting Engineers'),
	(83,'','Debswana (De Beers)'),
	(84,'','Dept. Public Works - Limpopo'),
	(85,'','DevServe'),
	(86,'','DigSilent'),
	(87,'Dihlase','Dihlase Consulting'),
	(88,'','DJJ Conradie & Partners CC'),
	(89,'DJP','DJP Power Services'),
	(90,'DLV','DLV Phambili'),
	(91,'','Dolphin Coast'),
	(92,'DRA','DRA - Dowding Reynard & Ass'),
	(93,'','Driger Consulting'),
	(94,'','Duke Engineering'),
	(95,'','Dyelec'),
	(96,'ESquare','E Square Engineering'),
	(97,'','E&G Africa'),
	(98,'','Eastern Cape Technicon'),
	(99,'ECE','ECE Trust'),
	(100,'','Edenvale / Modderfontein MLC'),
	(101,'','Eksteen & Le Roux'),
	(102,'','Ekurhuleni Municipality'),
	(103,'','El Pro Consultants'),
	(104,'','Electrical Expertise'),
	(105,'','Elektroplan Consulting Engineers'),
	(106,'','Element Consulting Engineers'),
	(107,'Elukani','Elukani Engineering Projects'),
	(108,'ELUNDINI','Elundini Municipality'),
	(109,'','Emcon Consulting Engineers'),
	(110,'','eMfuleni Municipality'),
	(111,'ENE','ENE Consulting Solution'),
	(112,'','EON Consulting'),
	(113,'','Eritrean Electric Corporation (EEC)'),
	(114,'','ESBI Engineering & Facility Management'),
	(115,'ESK','Eskom'),
	(116,'','Eskom - Rocheville'),
	(117,'','Eskom - TSI'),
	(118,'','Estcourt Municipality'),
	(119,'ETK','eThekwini Municipality'),
	(120,'','Ethiopian Electric Power Corporation'),
	(121,'ETSA','ETSA'),
	(122,'','Evans Consulting Engineers'),
	(123,'EVZ','EVZ Consulting Engineers'),
	(124,'EyaBantu','Eya Bantu'),
	(125,'','EyeSizwe'),
	(126,'','Eyethu Engineers'),
	(127,'','FCE Consulting Engineers'),
	(128,'','Ferdsult Engineering Services'),
	(129,'','FJ Kruger (Ago Infra)'),
	(130,'','Foskor'),
	(131,'','Fourier Electrical'),
	(132,'','G4 Consulting Engineers'),
	(133,'','General Engineering & Technical Services'),
	(134,'','Geopower (EM Power Consulting)'),
	(135,'','GFS Electrical'),
	(136,'Gibb','Gibb'),
	(137,'','GJA Consulting Engineers'),
	(138,'','Goba'),
	(139,'','Graaff-Reinet Electricity'),
	(140,'','Greater Germiston Electricity'),
	(141,'','Gridlogic'),
	(142,'','Gryphon Engineering Solutions'),
	(143,'GTM','GTM Consulting Engineers'),
	(144,'HAMSA','HAMSA Consulting Engineers'),
	(145,'','Harmonious Technical'),
	(146,'','HATCH'),
	(147,'','HDM Engineering'),
	(148,'','Helderberg Municipality'),
	(149,'','Hendrik Coetzer Engineering CC'),
	(150,'','Henk Meyer Consultants'),
	(151,'','Heyns van Rooyen'),
	(152,'','High Voltage System Engineers'),
	(153,'','Hlengani Engineering'),
	(154,'','Igoda Consulting Engineers'),
	(155,'IGS','IGS Consulting Engineers'),
	(156,'','IHM Heavy Minerals (Ticor)'),
	(157,'','Ikhwezi'),
	(158,'','Ilangabi Holdings'),
	(159,'IMPLATS','Impala Platinum'),
	(160,'','Infinity Alliance'),
	(161,'','Ingcali Consulting Engineers'),
	(162,'','Integrate Consulting Engineers'),
	(163,'','INTERGRAPH MIDDLE EAST LLC'),
	(164,'','IntoTec Electrical Engineering & Consulting'),
	(165,'','Iritron'),
	(166,'','Isenzeko Engineering'),
	(167,'ISIMO','ISIMO Engineers'),
	(168,'','IST Data'),
	(169,'','Ithembalethu Consulting'),
	(170,'','IVE Engineering Supplies'),
	(171,'','IZAZI Consulting Engineers'),
	(172,'','Izingodla Engineering'),
	(173,'','JMJ Electrical Projects'),
	(174,'','Johan Barnard'),
	(175,'','Johann de Bruyn Consulting Engineers'),
	(176,'','Johannesburg Metro Council'),
	(177,'','John Blair'),
	(178,'','JW du Preez'),
	(179,'','Kahama Mining'),
	(180,'','Katanga Mining'),
	(181,'','Khanyisa Africa Consulting'),
	(182,'','Khanyisani'),
	(183,'','Khephe Engineering'),
	(184,'','Kimberly-Clark'),
	(185,'','Knight Piesold'),
	(186,'','Knysna Municipality'),
	(187,'','Kokstad Municipality'),
	(188,'','Komapi S Consulting cc'),
	(189,'KOUKAB','Koukab Energy Consultants'),
	(190,'','Kroonstad Municipality'),
	(191,'','Kruger National Park'),
	(192,'KSZ','KSD Municipality'),
	(193,'','Kuyaduduma Consulting Engineers'),
	(194,'','Ladysmith Municipality'),
	(195,'','Lafarge'),
	(196,'LAMNS','LAMNS & Associates'),
	(197,'','Langeberg Municipality'),
	(198,'','Leberegane Engineering Services'),
	(199,'LEBOHANG','Lebohang Project Management (Pty) Ltd'),
	(200,'','Lebone - PE'),
	(201,'','Lebone Engineering'),
	(202,'','Leeba'),
	(203,'','Lesedi Engineering'),
	(204,'','Leshika Engineers Northern Province'),
	(205,'','Lesotho Electricity Company'),
	(206,'','LOST / STOLEN DONGLES'),
	(207,'LTA','LTA'),
	(208,'LTE','LTE Consulting'),
	(209,'','Luck @ it'),
	(210,'','Lufuno Mphaphuli and Associates'),
	(211,'','Lukhanji Municipality'),
	(212,'','Lyners'),
	(213,'Lyon','Lyon & Associates'),
	(214,'','Maboko Nkuna Technologies'),
	(215,'','Mafube Coal Mining'),
	(216,'','Magmee'),
	(217,'','Magula Erasmus Consulting Services'),
	(218,'','Makana Municipality'),
	(219,'','Mashau Salphina Electrical'),
	(220,'','Matatiele Municipality'),
	(221,'','Math Engineering'),
	(222,'MATLA','Matla Consulting'),
	(223,'','Matlosana Municipality'),
	(224,'','Matsapa Projects'),
	(225,'','Mazihlasele Business Enterprise'),
	(226,'','MBSA Consulting'),
	(227,'','Mega High Voltage'),
	(228,'','Meyer Consulting Engineers'),
	(229,'','MGM Consulting Engineers'),
	(230,'','Ministry of Mines and Energy'),
	(231,'','Mjazi Trading'),
	(232,'','MJC Professional services'),
	(233,'MLK','MLK Consulting Services'),
	(234,'','MMAL (Madonsela, Mackenzie & Loretz)'),
	(235,'','Mogale / Krugersdorp Municiplaity'),
	(236,'','Mondi'),
	(237,'','Mormond Electrical Contractors'),
	(238,'','Mothapo Consulting Engineers'),
	(239,'MOTLA','Motla Consulting Engineers'),
	(240,'','MPN - Brazil'),
	(241,'','MPPM Consulting Engineers'),
	(242,'','Msukaligwa Municipality'),
	(243,'','Msunduzi Municipality'),
	(244,'','MT Development'),
	(245,'','Mullah & Associates'),
	(246,'','MVM Africa Consulting Engineers'),
	(247,'','Mvula Engineering'),
	(248,'','MXN Electrocon Projects'),
	(249,'','N.Mikosi & Associates'),
	(250,'','National Ports Authority'),
	(251,'','Nduluka Consulting Engineers'),
	(252,'','Necon Engineering Consultants'),
	(253,'','NECSA'),
	(254,'','Neelo Africa'),
	(255,'','Nelspruit Municipality (Mbombela)'),
	(256,'','Network Protection Technologies'),
	(257,'','Ngolela Engineering'),
	(258,'','Nkuthalo Wouter Engelbrecht'),
	(259,'','Nkwazi Consulting Engineers'),
	(260,'','Noratec Consulting Engineers'),
	(261,'','Norconsult'),
	(262,'NWU','North West University'),
	(263,'','Northern Gauteng Technikon'),
	(264,'','Northlite'),
	(265,'','Nurizon Consulting'),
	(266,'','NWE Consulting Engineers'),
	(267,'','Nzembe Consulting'),
	(268,'','Optimal Engineering'),
	(269,'','Optimum Colliery (BHPBilliton)'),
	(270,'Orteng','Orteng Equipamentos e Sistemas Ltda'),
	(271,'','Paarl Municipality'),
	(272,'','Palabora Mining Company'),
	(273,'PALACE','Palace Engineering'),
	(274,'','Parima Consulting'),
	(275,'','PB Power Ltd'),
	(276,'','PD Naidoo & Associates'),
	(277,'','Pendo Energy Solutions'),
	(278,'','Peter Wright of semane'),
	(279,'','Pienaar & Erwee'),
	(280,'','Pienaar & Erwee - Pietersburg'),
	(281,'','Pienaar & Erwee - Pretoria'),
	(282,'PIKE','Pike Electric'),
	(283,'','PJ Technologies (Cape) cc'),
	(284,'','PL Consultants (BergmanIngerop)'),
	(285,'','Plantech Associates'),
	(286,'PLP','PLP Consulting Engineers'),
	(287,'','Polokwane Smelter / Rustenburg Mines'),
	(288,'','Polokwane TLC'),
	(289,'','Port Shepstone Municipality'),
	(290,'POS','PositiveCarry Engineering'),
	(291,'','Power Networks'),
	(292,'','Powerplan Engineers'),
	(293,'','PPC Cement'),
	(294,'PPE','PPE Technologies'),
	(295,'','Pretoria City Council'),
	(296,'','ProHousing'),
	(297,'','PSMT Consulting Engineers'),
	(298,'','Randfontein Local Municipality'),
	(299,'','Raphal Consulting Engineers'),
	(300,'','Raubicon'),
	(301,'','Rawlins Wales & Partners'),
	(302,'RDV','RDV Consulting Electrical Engineers'),
	(303,'','Redwing Technologies'),
	(304,'REI','REI Management Systems'),
	(305,'','Richard Nzuza & Ass'),
	(306,'RBM','Richards Bay Minerals'),
	(307,'','RMM & S Rural'),
	(308,'','Rob Anderson and Associates'),
	(309,'','Rosh Pinah Zinc Corp'),
	(310,'','Roshcon'),
	(311,'','Roshqott'),
	(312,'RHDHV','Royal HaskoningDHV'),
	(313,'','RPS Ilangabi Engineering'),
	(314,'','Rural Area Electricity'),
	(315,'','Rural Maintenance'),
	(316,'','Rustenburg Municipality'),
	(317,'','SAF Consulting'),
	(318,'','Saldanha Bay Municipality'),
	(319,'','SAMO Engineering'),
	(320,'SAPPI','SAPPI'),
	(321,'','Sappi - Ngodwana'),
	(322,'','Sasol Coal'),
	(323,'SAZI','Sazi Consulting Engineers'),
	(324,'','Schalk Rabe Engineering'),
	(325,'','Selanya Consulting Engineers'),
	(326,'','Semane'),
	(327,'SENET','SENET'),
	(328,'','Sengikhona Solutions'),
	(329,'','Senqu Municipality'),
	(330,'','Setec'),
	(331,'','Shilangane Engineering'),
	(332,'','Sibgem Management and Consulting'),
	(333,'','Siemens'),
	(334,'','Siminto Electrical Services'),
	(335,'','Siphiwe Engineering & Technologies'),
	(336,'','Sivest'),
	(337,'','SMEC'),
	(338,'','SNA Consulting Electrical Eng'),
	(339,'SNM','SNM Electrical Engineering'),
	(340,'','Sol Plaatje Municipality'),
	(341,'','South Zambezi'),
	(342,'','South32'),
	(343,'','SPK Engineers'),
	(344,'','SSA Consulting Engineers'),
	(345,'','Standerton Electricity'),
	(346,'','Starlogic'),
	(347,'','Stellenbosch electricity'),
	(348,'','Stemele Bosch Africa (Pty) Ltd'),
	(349,'','Steve Tshwete Local Municipality'),
	(350,'','Sun Electrical & Refrigeration'),
	(351,'','Swaziland Electricity Board'),
	(352,'','SWTech'),
	(353,'TANESCO','Tanzania Electric Supply Company Limited'),
	(354,'','Taylor & Associates'),
	(355,'TCS','TCS'),
	(356,'TCS','TCS Consulting Engineers'),
	(357,'','Test-a-relay'),
	(358,'TFMC','TFMC'),
	(359,'Thabile','Thabile Engineering'),
	(360,'','Thabo Consulting Engineers'),
	(361,'','Thake Electrical'),
	(362,'','Thami Toni and Associates'),
	(363,'','Theewaterskloof Municipality'),
	(364,'','Thendo Nyadzani Madzhie Electrical Construction'),
	(365,'','Theshani Trading Enterprise'),
	(366,'','Thlokomelo Management'),
	(367,'','Threecor Electrical'),
	(368,'','Tladi Consulting Services'),
	(369,'','Tongaat Hulett'),
	(370,'','TP Electrical'),
	(371,'TAP','TransAfrica Projects'),
	(372,'','TRANSNET'),
	(373,'','Triocon Consulting Engineers'),
	(374,'','Tsekema Consulting Engineers'),
	(375,'','Tsepa Consulting CC'),
	(376,'','Tshemo Mining Services'),
	(377,'','Tshepang Electrical'),
	(378,'','Tswaing Electricity Project Management (Akasia)'),
	(379,'TWP','TWP (Townshend van der Walt & Partners)'),
	(380,'','Tygerberg TLC'),
	(381,'','Tzaneen Electricity'),
	(382,'','Ubukhoni Engineering'),
	(383,'','Uganda Electricity Distribution Company'),
	(384,'','Ugesi Consulting'),
	(385,'','Ukhozi'),
	(386,'ULUNGENI','Ulungeni Consulting Engineers'),
	(387,'','Umbono Engineering'),
	(388,'','Umeme'),
	(389,'UMEME','Umeme Limited'),
	(390,'','Umhlatuze Municipality'),
	(391,'UJ','University of Johannesburg'),
	(392,'UKZN','University of Kwazulu Natal'),
	(393,'','University of Lagos'),
	(394,'','University of Namibia'),
	(395,'UND','University of Natal - Dbn'),
	(396,'TUKS','University of Pretoria'),
	(397,'US','University of Stellenbosch'),
	(398,'','Unotech International'),
	(399,'','Usizo Engineering'),
	(400,'','Vaal Triangle Technikon'),
	(401,'VeldDuToit','Veld Du Toit Inc'),
	(402,'VKE','VKE Consulting Engineers'),
	(403,'','Vokon Afrika Consulting'),
	(404,'VWP','VWP Engineers and Project Managers'),
	(405,'WSU','Walter Sisulu University'),
	(406,'','Walvis Bay Municipality / ERONGO RED'),
	(407,'','Webotec'),
	(408,'','Werner Engelbrecht'),
	(409,'','Windhoek Consulting Engineers'),
	(410,'WJL','WJ & L Electrical'),
	(411,'','Wood & Grieve Engineers'),
	(412,'WP','Worley Parsons'),
	(413,'','Worley Parsons SA'),
	(414,'WSP','WSP Consulting'),
	(415,'','Xstrata Alloys'),
	(416,'YBG','YBG Consulting'),
	(417,'ZECO','Zanzibar Electricity Corporation'),
	(418,'ZD PROJECT','ZD Project Management'),
	(419,'ZEAL','Zeal Engineering'),
	(420,'ZSM','ZSM Consulting'),
	(421,'II','Inspired Interfaces');

/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Course`;

CREATE TABLE `Course` (
  `CourseId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Code` varchar(10) NOT NULL DEFAULT '',
  `Description` varchar(255) NOT NULL DEFAULT '',
  `Status` tinyint(4) NOT NULL DEFAULT '1',
  `CreateDate` datetime NOT NULL,
  `CreateUserId` int(11) NOT NULL DEFAULT '1',
  `ModDate` datetime NOT NULL,
  `ModUserId` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`CourseId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;

INSERT INTO `Course` (`CourseId`, `Code`, `Description`, `Status`, `CreateDate`, `CreateUserId`, `ModDate`, `ModUserId`)
VALUES
	(1,'1701','PowerOffice Projects',1,'2017-03-01 11:31:00',1,'2017-03-01 11:31:00',1),
	(2,'1702','PowerOffice Mat Res',1,'2017-06-30 00:00:00',1,'2017-06-30 00:00:00',1),
	(3,'1703','PowerOffice for QS',1,'2017-06-30 00:00:00',1,'2017-06-30 00:00:00',1);

/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table FieldHeaderMap
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FieldHeaderMap`;

CREATE TABLE `FieldHeaderMap` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Field` varchar(25) DEFAULT NULL,
  `Desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

LOCK TABLES `FieldHeaderMap` WRITE;
/*!40000 ALTER TABLE `FieldHeaderMap` DISABLE KEYS */;

INSERT INTO `FieldHeaderMap` (`id`, `Field`, `Desc`)
VALUES
	(1,'FName','First Name'),
	(2,'SName','Surname'),
	(3,'CompanyDesc','Company'),
	(4,'UserName','Username'),
	(5,'Email','Email'),
	(6,'Hash','Password'),
	(7,'LastLogin','Last Login'),
	(8,'Description','Description'),
	(9,'Desc','Description');

/*!40000 ALTER TABLE `FieldHeaderMap` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table iiBin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `iiBin`;

CREATE TABLE `iiBin` (
  `iiRowid` int(18) NOT NULL AUTO_INCREMENT,
  `iiBinId` int(11) unsigned NOT NULL,
  `iiBinTypeId` int(11) unsigned NOT NULL,
  `iiBinCode` char(5) NOT NULL,
  `MainPoints` varchar(100) DEFAULT NULL,
  `Data` varchar(100) NOT NULL DEFAULT '',
  `Transcript` varchar(100) DEFAULT '',
  PRIMARY KEY (`iiBinId`,`iiBinTypeId`),
  UNIQUE KEY `UNQiiRowId` (`iiRowid`),
  KEY `fkiiBinType` (`iiBinTypeId`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

LOCK TABLES `iiBin` WRITE;
/*!40000 ALTER TABLE `iiBin` DISABLE KEYS */;

INSERT INTO `iiBin` (`iiRowid`, `iiBinId`, `iiBinTypeId`, `iiBinCode`, `MainPoints`, `Data`, `Transcript`)
VALUES
	(1,2,3,'RunPO','MPRunningPO.html','POGC0102.mp4','TSRunningPO.html'),
	(3,4,3,'JOVie','MPPOJOV.html','POJC0104.mp4','TSPOJOV.html'),
	(4,5,3,'JMenu','MPPOJMenu.html','POJC0105.mp4','TSPOJMenu.html'),
	(2,3,3,'LogIn','MPLogin.html','POGC0103.mp4','TSLogin.html'),
	(5,6,3,'JTool','MPPOJToolbars.html','POJC0106.mp4','TSPOJToolbars.html'),
	(6,7,3,'JOpt','MPPOOptions.html','POJC0107.mp4','TSPOOptions.html'),
	(7,1,3,'What','MPWhatIsPO.html','POGC0101.mp4','TSWhatIsPO.html'),
	(8,8,3,'JVOVi','MPPOJandVOV.html','POJC0201.mp4','TSPOJandVOV.html'),
	(9,9,3,'POJCr','MPPOJCreate.html','POJC0202.mp4','TSPOJCreate.html'),
	(10,10,3,'POJVC','MPPOJVerCreate','POJC0203.mp4','TSPOJVerCreate.html'),
	(11,11,3,'POJVA','MPPOJVerAttrib','POJC0204.mp4','TSPOJVerAttrib.html'),
	(12,12,3,'POJBO','MPPOJBOM','POJC0301.mp4','TSPOJBOM.html'),
	(13,13,3,'POJQF','MPPOJQF','POJC0302.mp4','TSPOJQF.html'),
	(14,14,3,'POJAF','MPPOJAF','POJC0303.mp4','TSPOJAF.html'),
	(15,15,3,'POJWC','MPPOJWC','POJC0304.mp4','TSPOJWC.html'),
	(16,16,3,'POJDD','MPPOJDAD','POJC0305.mp4','TSPOJDAD.html'),
	(17,17,3,'POJMo','MPPOJMod','POJC0306.mp4','TSPOJMod.html'),
	(18,18,3,'POJDC','MPPOJDesc','POJC0307.mp4','TSPOJDesc.html'),
	(19,19,3,'POJCM','MPPOJCpoy','POJC0308.mp4','TSPOJCopyMerge.html'),
	(20,20,3,'POJUA','MPPOJUser','POJC0309.mp4','TSPOJUser.html'),
	(21,21,3,'POJC','MPPOJCosting','POJC0401.mp4','TSPOJCosting.html'),
	(22,22,3,'POJQC','MPPOJQuickCost','POJC0402.mp4','TSPOJQuickCost.html'),
	(23,23,3,'POJR','MPPOJReportin','POJC0403.mp4','TSPOJReporting.html'),
	(24,24,3,'POJDX','MPPOJDXOverview','POJC0501.mp4','TSPOJDXOverview.html'),
	(25,25,3,'POJEX','MPPOJExporting','POJC0502.mp4','TSPOJExporting.html'),
	(26,26,3,'POJEF','MPPOJExportFile','POJC0503.mp4','TSPOJExportFile.html'),
	(27,27,3,'POJIM','MPPOJImporting','POJC0504.mp4','TSPOJImporting.html');

/*!40000 ALTER TABLE `iiBin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table iiBinType
# ------------------------------------------------------------

DROP TABLE IF EXISTS `iiBinType`;

CREATE TABLE `iiBinType` (
  `iiBinTypeId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iiBinTypeCode` char(5) NOT NULL,
  `iiBinTypeDescription` char(20) NOT NULL,
  `iiBinTypeStatus` tinyint(4) NOT NULL DEFAULT '1',
  `CreateDate` datetime NOT NULL,
  `CreateUserId` int(11) NOT NULL,
  PRIMARY KEY (`iiBinTypeId`),
  KEY `fkBinTypeCreateUser` (`CreateUserId`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

LOCK TABLES `iiBinType` WRITE;
/*!40000 ALTER TABLE `iiBinType` DISABLE KEYS */;

INSERT INTO `iiBinType` (`iiBinTypeId`, `iiBinTypeCode`, `iiBinTypeDescription`, `iiBinTypeStatus`, `CreateDate`, `CreateUserId`)
VALUES
	(1,'ogg','Video_Ogg',1,'2017-03-06 00:00:00',1),
	(2,'webm','Video-Webm',1,'2017-03-06 00:00:00',1),
	(3,'mp4','Video-MP4',1,'2017-03-06 00:00:00',1),
	(4,'mp3','Audio-mp3',1,'2017-03-06 00:00:00',1),
	(5,'text','Text',1,'2017-03-06 00:00:00',1);

/*!40000 ALTER TABLE `iiBinType` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table iiSalt-Unused
# ------------------------------------------------------------

DROP TABLE IF EXISTS `iiSalt-Unused`;

CREATE TABLE `iiSalt-Unused` (
  `SaltId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PersonId` int(10) unsigned DEFAULT NULL,
  `Table` char(10) NOT NULL DEFAULT '',
  `Salt` varchar(255) NOT NULL DEFAULT '',
  `CreateDate` datetime NOT NULL,
  `ExpiryDate` datetime NOT NULL,
  PRIMARY KEY (`SaltId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

LOCK TABLES `iiSalt-Unused` WRITE;
/*!40000 ALTER TABLE `iiSalt-Unused` DISABLE KEYS */;

INSERT INTO `iiSalt-Unused` (`SaltId`, `PersonId`, `Table`, `Salt`, `CreateDate`, `ExpiryDate`)
VALUES
	(1,1,'Learner','cZ63Ck737UuLAkTHVYZh2h3rHCWYSXsUNoNgyKawvu8WFRtqGjxyqrQYTDNB','2017-06-22 10:23:18','2019-06-22 08:23:18'),
	(2,2,'Learner','uJumP3bm8hkuF3afVWXNmbczPIpkx03RAo4fi5shcCCIwCOioBVBDY1ixgtU','2017-06-22 10:26:09','2019-06-22 08:26:09'),
	(3,3,'Learner','P77ZjqSPt26RkjEmTjFlgiopIrPovLCaIz0SPJy9BuQMDlYnuuzACNQb5wpr','2017-06-22 10:35:51','2019-06-22 08:35:51'),
	(4,4,'Learner','Yd2mqwpcD27L0e8JMVKReG7KT1x5C6ara2ErpUuSMrtDvrc8dMPijNS2FgY8','2017-06-22 10:37:00','2019-06-22 08:37:00');

/*!40000 ALTER TABLE `iiSalt-Unused` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table iiUser
# ------------------------------------------------------------

DROP TABLE IF EXISTS `iiUser`;

CREATE TABLE `iiUser` (
  `iiUserId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iiUserLogin` varchar(20) NOT NULL,
  `iiUserHash` varchar(255) NOT NULL DEFAULT '',
  `iiUserFirstName` char(50) NOT NULL,
  `iiUserSurname` varchar(50) NOT NULL,
  `iiCreateDate` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `iiCreateUserId` int(11) NOT NULL DEFAULT '1',
  `iiModDate` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `iiModUserId` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iiUserId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `iiUser` WRITE;
/*!40000 ALTER TABLE `iiUser` DISABLE KEYS */;

INSERT INTO `iiUser` (`iiUserId`, `iiUserLogin`, `iiUserHash`, `iiUserFirstName`, `iiUserSurname`, `iiCreateDate`, `iiCreateUserId`, `iiModDate`, `iiModUserId`)
VALUES
	(1,'RoryGren','','Rory','Grenfell','2017-01-01 00:00:00',1,'2017-01-01 00:00:00',1),
	(2,'RicusR','','Ricus','Roux','2017-01-01 00:00:00',1,'2017-01-01 00:00:00',1);

/*!40000 ALTER TABLE `iiUser` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Learner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Learner`;

CREATE TABLE `Learner` (
  `LearnerId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL DEFAULT 'error',
  `Hash` varchar(255) NOT NULL DEFAULT '',
  `Email` varchar(100) NOT NULL DEFAULT '',
  `FName` varchar(50) NOT NULL DEFAULT '',
  `SName` varchar(50) NOT NULL DEFAULT '',
  `SAIDNo` varchar(20) NOT NULL DEFAULT '',
  `CompanyId` int(10) unsigned NOT NULL DEFAULT '1',
  `LearnerStatus` int(10) unsigned DEFAULT '1',
  `LastLogin` datetime DEFAULT NULL,
  `CreateUser` int(10) unsigned NOT NULL DEFAULT '1',
  `CreateDate` datetime NOT NULL,
  `ModUser` int(10) unsigned NOT NULL DEFAULT '1',
  `ModDate` datetime NOT NULL,
  PRIMARY KEY (`LearnerId`),
  UNIQUE KEY `UserName_U` (`UserName`),
  UNIQUE KEY `IDNo_U` (`SAIDNo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

LOCK TABLES `Learner` WRITE;
/*!40000 ALTER TABLE `Learner` DISABLE KEYS */;

INSERT INTO `Learner` (`LearnerId`, `UserName`, `Hash`, `Email`, `FName`, `SName`, `SAIDNo`, `CompanyId`, `LearnerStatus`, `LastLogin`, `CreateUser`, `CreateDate`, `ModUser`, `ModDate`)
VALUES
	(1,'joe@soap.co.za','$2y$10$plxoknc/TfhLjMz3mlFYauuDBKXOduGKgb02p4eZeZ3pfc8vuz98m','joe@soap.co.za','Joseph','Soap','7805121234082',19,1,'2018-10-11 11:07:36',1,'2017-08-23 10:23:46',1,'2017-08-23 10:23:46'),
	(2,'mike.vdm@interfaces.co.za','$2y$10$vz71Yiy0Eg3JkGCm8Lzix.LKsd4QHNsx8NuWqcbI0zBWF4p7BEfc2','mike.vdm@interfaces.co.za','Michael','van der Merwe','123456789',421,1,NULL,1,'2018-01-26 07:52:20',1,'2018-01-26 07:52:20'),
	(3,'francois@interfaces.co.za','$2y$10$rBAWkMJVrhqnzLihjRJWdezpAOhVMvpdwSFpDLWqbjzIEwuKtE4c6','francois@interfaces.co.za','Francois','Nortje','123421341234',421,1,'2018-02-15 07:38:31',1,'2018-01-26 07:54:21',1,'2018-01-26 07:54:21'),
	(4,'cobus@interfaces.co.za','$2y$10$m3L7e28dqK8K5FjrLaZHquVtyqPIeJPionsrhXiMyDrm3LiNl/7GW','cobus@interfaces.co.za','Cobus','Roux','234532453245',421,1,NULL,1,'2018-01-26 07:54:51',1,'2018-01-26 07:54:51'),
	(5,'tom@interfaces.co.za','$2y$10$3XXmjuUb6xydJaZwtMAP5ODDa6pvVB/w1OSIMH8Ew9BlGQFH8mIu.','tom@interfaces.co.za','Tom','Phillips','54325232345',421,1,NULL,1,'2018-01-26 07:55:25',1,'2018-01-26 07:55:25'),
	(6,'gina@interfaces.co.za','$2y$10$bNdTMyDMd1xkRN85H3Fo6eMPF.CycCrjxxBVjI0EWOhSvcYBEa0s.','gina@interfaces.co.za','Gina','Phillips','543223455423',421,1,NULL,1,'2018-01-26 07:56:37',1,'2018-01-26 07:56:37'),
	(7,'rory@interfaces.co.za','$2y$10$NwFc6b2wv2JARKGuWf1Z5uou5H0Nngvxk.1MXibk0ufsVx1sg9DAm','rory@interfaces.co.za','Rory','Grenfell','6203255126082',421,1,'2019-05-24 09:28:40',1,'2018-01-26 08:04:47',1,'2018-01-26 08:04:47'),
	(8,'vdMerweC@eskom.co.za','$2y$10$w9rxmHIwiKT.QVEZ8bAeg.HNflBu6.eO.AGAJx2bSrHAFL/FxIH3i','vdMerweC@eskom.co.za','Carel','van der Merwe','12345678987456',115,1,NULL,1,'2018-02-19 13:05:37',1,'2018-02-19 13:05:37'),
	(9,'RamjasD@eskom.co.za','$2y$10$72arBCs27agmjHQbQCAAfO8JVcyC/n/vztnQd4/xBLDswCFe6G/E2','RamjasD@eskom.co.za','Dhanjay','Ramjass','7603225121080',115,1,'2018-07-05 12:05:02',1,'2018-02-21 10:03:39',1,'2018-02-21 10:03:39'),
	(11,'rory@grenweb.co.za','$2y$10$2LerA05Xu1sJyAKUp.qVDeDfnGRs5bwK8Bnex3zoDZYam.7K4tUFu','rory@grenweb.co.za','Rory','Gren','6203255126081',7,1,'2020-01-09 09:18:03',1,'2019-05-24 09:22:46',1,'2019-05-24 09:22:46'),
	(12,'ricus@interfaces.co.za','$2y$10$TGYDXU2H1mZ9DTH3e5TUeejUyMhDeIzqJxmRYTZ1IRP8AKKH.oHZ.','ricus@interfaces.co.za','Ricus','Roux','1234',1,1,'2019-10-08 08:11:57',1,'2019-10-08 08:11:36',1,'2019-10-08 08:11:36'),
	(13,'joseph@soap.com','$2y$10$4SpAA8hNu8jYnQx1AtHNmu/t3kOAtU/Je5LLlisrlXxU3UIqUZBAa','joseph@soap.com','Joseph','MacSoap','52032500811234',16,1,'2020-01-08 08:50:03',1,'2020-01-08 08:49:22',1,'2020-01-08 08:49:22');

/*!40000 ALTER TABLE `Learner` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table LearnerCourse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LearnerCourse`;

CREATE TABLE `LearnerCourse` (
  `LearnerId` int(11) unsigned NOT NULL,
  `CourseId` int(11) unsigned NOT NULL,
  `Progress` blob,
  `Assess` blob,
  `RegDate` datetime DEFAULT NULL,
  `LastAccessDate` datetime DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `CompleteDate` datetime DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`LearnerId`,`CourseId`),
  KEY `FK_LearnerCourseId` (`CourseId`),
  CONSTRAINT `FK_LearnerCourseId` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `LearnerCourse` WRITE;
/*!40000 ALTER TABLE `LearnerCourse` DISABLE KEYS */;

INSERT INTO `LearnerCourse` (`LearnerId`, `CourseId`, `Progress`, `Assess`, `RegDate`, `LastAccessDate`, `StartDate`, `CompleteDate`, `ExpiryDate`)
VALUES
	(1,1,X'7B2231223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2231222C22537461747573223A22566965776564222C22537461727444617465223A22323031382D30322D31345430363A34303A31342E3435385A222C22436F6D706C65746544617465223A22323031382D30322D31345430363A34313A35382E3935305A227D2C2232223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2232222C22537461747573223A22566965776564222C22537461727444617465223A22323031382D30322D31345430363A34323A30362E3632345A222C22436F6D706C65746544617465223A22323031382D30322D31345430363A34323A31392E3335335A227D2C2233223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2233222C22537461747573223A22566965776564222C22537461727444617465223A22323031382D30322D31345430393A34383A34382E3032325A222C22436F6D706C65746544617465223A22323031382D30322D31345430393A34393A34372E3032375A227D2C2234223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2234222C22537461747573223A22566965776564222C22537461727444617465223A22323031382D30322D32365431323A32343A31342E3732365A222C22436F6D706C65746544617465223A22323031382D30322D32375430393A30313A35352E3630375A227D2C2235223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2235222C22537461747573223A22566965776564222C22537461727444617465223A22323031382D30322D32375430393A33323A34322E3732395A222C22436F6D706C65746544617465223A22323031382D30322D32385431373A34333A34372E3937345A227D2C2236223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2236222C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2237223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2237222C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2238223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2231222C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2239223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2232222C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30322D31395430393A35353A32302E3738365A222C22436F6D706C65746544617465223A6E756C6C7D2C223130223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2233222C22537461747573223A22566965776564222C22537461727444617465223A22323031382D30322D31395430393A35353A33342E3233345A222C22436F6D706C65746544617465223A22323031382D30322D31395431323A30303A32312E3835395A227D2C223131223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2234222C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223132223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2231222C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30342D30365430393A34393A30392E3939375A222C22436F6D706C65746544617465223A6E756C6C7D2C223133223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2232222C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223134223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2233222C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223135223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2234222C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30342D30365430393A34383A35362E3730325A222C22436F6D706C65746544617465223A6E756C6C7D2C223136223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2235222C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223137223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2236222C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30342D30365430393A34393A33352E3233365A222C22436F6D706C65746544617465223A6E756C6C7D2C223138223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2237222C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223139223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2238222C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30342D30365430393A34393A31362E3632325A222C22436F6D706C65746544617465223A6E756C6C7D2C223230223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2239222C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30322D32315431303A33343A35342E3832305A222C22436F6D706C65746544617465223A6E756C6C7D2C223231223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2231222C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223232223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2232222C22537461747573223A22566965776564222C22537461727444617465223A22323031382D30322D31345430363A34323A32392E3135315A222C22436F6D706C65746544617465223A22323031382D30322D31345430363A34323A34382E3332365A227D2C223233223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2233222C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223234223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2231222C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223235223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2232222C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223236223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2233222C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223237223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2234222C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30342D30365430393A34353A35312E3535355A222C22436F6D706C65746544617465223A6E756C6C7D2C224C6173744163636573736564223A7B22536563526F774964223A223137222C224C61737441637469766543686170746572223A2233222C22536563436F6465223A2233222C224461746554696D65223A22313937302D30312D30312030303A30303A3030227D2C224669727374416363657373223A22323031382D30322D31342030383A34303A3039222C2250726F6772657373223A7B22546F74616C223A32372C22436F6D706C657465223A302C22566965776564546F74616C223A377D2C22436F757273654D6F64566572223A307D',NULL,'2017-08-23 10:23:46',NULL,NULL,NULL,NULL),
	(2,1,NULL,NULL,'2018-01-26 07:52:20',NULL,NULL,NULL,NULL),
	(3,1,X'7B2231223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2231222C22526F774964223A312C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30322D31355430353A33393A32392E3534385A222C22436F6D706C65746544617465223A6E756C6C7D2C2232223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2232222C22526F774964223A322C22537461747573223A22566965776564222C22537461727444617465223A22323031382D30322D31355430353A34303A34372E3232365A222C22436F6D706C65746544617465223A22323031382D30322D31355430353A34313A30372E3530385A227D2C2233223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2233222C22526F774964223A332C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30322D31355430353A34313A32302E3532305A222C22436F6D706C65746544617465223A6E756C6C7D2C2234223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2234222C22526F774964223A342C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30322D31355430353A34313A33372E3532335A222C22436F6D706C65746544617465223A6E756C6C7D2C2235223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2235222C22526F774964223A352C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2236223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2236222C22526F774964223A362C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2237223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2237222C22526F774964223A372C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30322D31355430353A35313A32332E3638375A222C22436F6D706C65746544617465223A6E756C6C7D2C2238223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2231222C22526F774964223A382C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2239223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2232222C22526F774964223A392C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223130223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2233222C22526F774964223A31302C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223131223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2234222C22526F774964223A31312C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223132223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2231222C22526F774964223A31322C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30322D31355430353A35313A34372E3937335A222C22436F6D706C65746544617465223A6E756C6C7D2C223133223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2232222C22526F774964223A31332C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223134223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2233222C22526F774964223A31342C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223135223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2234222C22526F774964223A31352C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223136223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2235222C22526F774964223A31362C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30322D31355430353A35313A35352E3537375A222C22436F6D706C65746544617465223A6E756C6C7D2C223137223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2236222C22526F774964223A31372C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223138223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2237222C22526F774964223A31382C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223139223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2238222C22526F774964223A31392C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223230223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2239222C22526F774964223A32302C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223231223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2231222C22526F774964223A32312C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223232223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2232222C22526F774964223A32322C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223233223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2233222C22526F774964223A32332C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223234223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2231222C22526F774964223A32342C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223235223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2232222C22526F774964223A32352C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223236223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2233222C22526F774964223A32362C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223237223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2234222C22526F774964223A32372C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C224C6173744163636573736564223A7B22536563526F774964223A31362C224C61737441637469766543686170746572223A2233222C22536563436F6465223A2233222C224461746554696D65223A22313937302D30312D30312030303A30303A3030227D2C224669727374416363657373223A22323031382D30322D31352030373A33383A3333222C2250726F6772657373223A7B22546F74616C223A32372C22436F6D706C657465223A302C22566965776564546F74616C223A317D2C22436F757273654D6F64566572223A307D',NULL,'2018-01-26 07:54:21',NULL,NULL,NULL,NULL),
	(4,1,NULL,NULL,'2018-01-26 07:54:51',NULL,NULL,NULL,NULL),
	(5,1,NULL,NULL,'2018-01-26 07:55:25',NULL,NULL,NULL,NULL),
	(6,1,NULL,NULL,'2018-01-26 07:56:37',NULL,NULL,NULL,NULL),
	(7,1,X'7B2231223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2231222C22526F774964223A312C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2232223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2232222C22526F774964223A322C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2233223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2233222C22526F774964223A332C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2234223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2234222C22526F774964223A342C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2235223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2235222C22526F774964223A352C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2236223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2236222C22526F774964223A362C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2237223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2237222C22526F774964223A372C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2238223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2231222C22526F774964223A382C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2239223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2232222C22526F774964223A392C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223130223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2233222C22526F774964223A31302C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223131223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2234222C22526F774964223A31312C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223132223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2231222C22526F774964223A31322C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223133223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2232222C22526F774964223A31332C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223134223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2233222C22526F774964223A31342C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223135223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2234222C22526F774964223A31352C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223136223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2235222C22526F774964223A31362C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223137223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2236222C22526F774964223A31372C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223138223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2237222C22526F774964223A31382C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223139223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2238222C22526F774964223A31392C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223230223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2239222C22526F774964223A32302C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223231223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2231222C22526F774964223A32312C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223232223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2232222C22526F774964223A32322C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223233223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2233222C22526F774964223A32332C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223234223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2231222C22526F774964223A32342C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223235223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2232222C22526F774964223A32352C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223236223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2233222C22526F774964223A32362C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223237223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2234222C22526F774964223A32372C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C224C6173744163636573736564223A7B22536563526F774964223A302C224C61737441637469766543686170746572223A302C22536563436F6465223A302C224461746554696D65223A22313937302D30312D30312030303A30303A3030227D2C224669727374416363657373223A22323031392D30352D32342030393A32383A3431222C2250726F6772657373223A7B22546F74616C223A32372C22436F6D706C657465223A307D2C22436F757273654D6F64566572223A307D',NULL,'2018-01-26 08:04:47',NULL,NULL,NULL,NULL),
	(8,1,NULL,NULL,'2018-02-19 13:05:37',NULL,NULL,NULL,NULL),
	(9,1,X'7B2231223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2231222C22526F774964223A312C22537461747573223A22566965776564222C22537461727444617465223A22323031382D30322D32365431303A33313A32322E3830365A222C22436F6D706C65746544617465223A22323031382D30322D32365431303A33343A31332E3733375A227D2C2232223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2232222C22526F774964223A322C22537461747573223A22566965776564222C22537461727444617465223A22323031382D30322D32365431303A33343A32302E3131305A222C22436F6D706C65746544617465223A22323031382D30322D32365431303A33363A30342E3733325A227D2C2233223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2233222C22526F774964223A332C22537461747573223A22566965776564222C22537461727444617465223A22323031382D30322D32365431303A33363A30382E3431345A222C22436F6D706C65746544617465223A22323031382D30322D32365431303A33383A30352E3630355A227D2C2234223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2234222C22526F774964223A342C22537461747573223A22566965776564222C22537461727444617465223A22323031382D30322D32365431313A32353A33312E3639355A222C22436F6D706C65746544617465223A22323031382D30322D32365431313A32393A32372E3935345A227D2C2235223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2235222C22526F774964223A352C22537461747573223A22566965776564222C22537461727444617465223A22323031382D30322D32365431313A32393A34352E3439325A222C22436F6D706C65746544617465223A22323031382D30322D32365431313A33333A33352E3831365A227D2C2236223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2236222C22526F774964223A362C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30322D32365431313A33333A34302E3536385A222C22436F6D706C65746544617465223A6E756C6C7D2C2237223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2237222C22526F774964223A372C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30322D32365431313A33343A34382E3633305A222C22436F6D706C65746544617465223A6E756C6C7D2C2238223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2231222C22526F774964223A382C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2239223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2232222C22526F774964223A392C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223130223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2233222C22526F774964223A31302C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223131223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2234222C22526F774964223A31312C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223132223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2231222C22526F774964223A31322C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223133223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2232222C22526F774964223A31332C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223134223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2233222C22526F774964223A31342C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223135223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2234222C22526F774964223A31352C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223136223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2235222C22526F774964223A31362C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223137223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2236222C22526F774964223A31372C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223138223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2237222C22526F774964223A31382C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223139223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2238222C22526F774964223A31392C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223230223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2239222C22526F774964223A32302C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223231223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2231222C22526F774964223A32312C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223232223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2232222C22526F774964223A32322C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223233223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2233222C22526F774964223A32332C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223234223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2231222C22526F774964223A32342C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30372D30355431303A30373A32302E3933375A222C22436F6D706C65746544617465223A6E756C6C7D2C223235223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2232222C22526F774964223A32352C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223236223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2233222C22526F774964223A32362C22537461747573223A2253746172746564222C22537461727444617465223A22323031382D30372D30355431303A30373A33392E3737305A222C22436F6D706C65746544617465223A6E756C6C7D2C223237223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2234222C22526F774964223A32372C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C224C6173744163636573736564223A7B22536563526F774964223A322C224C61737441637469766543686170746572223A2231222C22536563436F6465223A2231222C224461746554696D65223A22313937302D30312D30312030303A30303A3030227D2C224669727374416363657373223A22323031382D30322D32362031323A32393A3533222C2250726F6772657373223A7B22546F74616C223A32372C22436F6D706C657465223A302C22566965776564546F74616C223A357D2C22436F757273654D6F64566572223A307D',NULL,'2018-02-21 10:03:39',NULL,NULL,NULL,NULL),
	(11,1,X'7B2231223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2231222C22526F774964223A312C22537461747573223A22566965776564222C22537461727444617465223A22323031392D30352D32345430373A32333A34382E3738375A222C22436F6D706C65746544617465223A22323031392D30352D32345430373A32343A35332E3739385A227D2C2232223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2232222C22526F774964223A322C22537461747573223A2253746172746564222C22537461727444617465223A22323031392D30392D32335430363A34393A31372E3531345A222C22436F6D706C65746544617465223A6E756C6C7D2C2233223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2233222C22526F774964223A332C22537461747573223A22566965776564222C22537461727444617465223A22323031392D30392D32335430363A34393A32392E3233375A222C22436F6D706C65746544617465223A22323031392D30392D32335430363A34393A34322E3830345A227D2C2234223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2234222C22526F774964223A342C22537461747573223A2253746172746564222C22537461727444617465223A22323032302D30312D30385431323A31383A30322E3833325A222C22436F6D706C65746544617465223A6E756C6C7D2C2235223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2235222C22526F774964223A352C22537461747573223A22566965776564222C22537461727444617465223A22323032302D30312D30395430383A35383A34382E3839355A222C22436F6D706C65746544617465223A22323032302D30312D30395430393A32333A34322E3033335A227D2C2236223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2236222C22526F774964223A362C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2237223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2237222C22526F774964223A372C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2238223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2231222C22526F774964223A382C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2239223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2232222C22526F774964223A392C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223130223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2233222C22526F774964223A31302C22537461747573223A2253746172746564222C22537461727444617465223A22323032302D30312D30395430373A35393A35312E3238355A222C22436F6D706C65746544617465223A6E756C6C7D2C223131223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2234222C22526F774964223A31312C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223132223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2231222C22526F774964223A31322C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223133223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2232222C22526F774964223A31332C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223134223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2233222C22526F774964223A31342C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223135223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2234222C22526F774964223A31352C22537461747573223A2253746172746564222C22537461727444617465223A22323032302D30312D30395430373A35393A35372E3539385A222C22436F6D706C65746544617465223A6E756C6C7D2C223136223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2235222C22526F774964223A31362C22537461747573223A2253746172746564222C22537461727444617465223A22323032302D30312D30385431323A31393A34382E3636345A222C22436F6D706C65746544617465223A6E756C6C7D2C223137223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2236222C22526F774964223A31372C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223138223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2237222C22526F774964223A31382C22537461747573223A2253746172746564222C22537461727444617465223A22323032302D30312D30395430383A30303A30392E3334325A222C22436F6D706C65746544617465223A6E756C6C7D2C223139223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2238222C22526F774964223A31392C22537461747573223A2253746172746564222C22537461727444617465223A22323032302D30312D30395430383A30303A30352E3838365A222C22436F6D706C65746544617465223A6E756C6C7D2C223230223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2239222C22526F774964223A32302C22537461747573223A2253746172746564222C22537461727444617465223A22323032302D30312D30395430383A30303A30322E3035325A222C22436F6D706C65746544617465223A6E756C6C7D2C223231223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2231222C22526F774964223A32312C22537461747573223A2253746172746564222C22537461727444617465223A22323032302D30312D30385431323A31393A34302E3730375A222C22436F6D706C65746544617465223A6E756C6C7D2C223232223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2232222C22526F774964223A32322C22537461747573223A2253746172746564222C22537461727444617465223A22323032302D30312D30395430383A30303A33342E3330325A222C22436F6D706C65746544617465223A6E756C6C7D2C223233223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2233222C22526F774964223A32332C22537461747573223A2253746172746564222C22537461727444617465223A22323032302D30312D30395430383A30303A33372E3637315A222C22436F6D706C65746544617465223A6E756C6C7D2C223234223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2231222C22526F774964223A32342C22537461747573223A22566965776564222C22537461727444617465223A22323031392D30352D32345430373A32363A30382E3434325A222C22436F6D706C65746544617465223A22323032302D30312D30395430373A35323A31372E3932385A227D2C223235223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2232222C22526F774964223A32352C22537461747573223A2253746172746564222C22537461727444617465223A22323032302D30312D30395430383A30303A34362E3437375A222C22436F6D706C65746544617465223A6E756C6C7D2C223236223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2233222C22526F774964223A32362C22537461747573223A2253746172746564222C22537461727444617465223A22323032302D30312D30395430383A30303A35302E3235365A222C22436F6D706C65746544617465223A6E756C6C7D2C223237223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2234222C22526F774964223A32372C22537461747573223A2253746172746564222C22537461727444617465223A22323032302D30312D30395430383A30303A35332E3831325A222C22436F6D706C65746544617465223A6E756C6C7D2C224C6173744163636573736564223A7B22536563526F774964223A352C224C61737441637469766543686170746572223A2231222C22536563436F6465223A2231222C224461746554696D65223A22313937302D30312D30312030303A30303A3030227D2C224669727374416363657373223A22323031392D30352D32342030393A32333A3030222C2250726F6772657373223A7B22546F74616C223A32372C22436F6D706C657465223A302C22566965776564546F74616C223A347D2C22436F757273654D6F64566572223A307D',NULL,'2019-05-24 09:22:46',NULL,NULL,NULL,NULL),
	(12,1,X'7B2231223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2231222C22526F774964223A312C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2232223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2232222C22526F774964223A322C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2233223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2233222C22526F774964223A332C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2234223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2234222C22526F774964223A342C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2235223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2235222C22526F774964223A352C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2236223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2236222C22526F774964223A362C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2237223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2237222C22526F774964223A372C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2238223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2231222C22526F774964223A382C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2239223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2232222C22526F774964223A392C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223130223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2233222C22526F774964223A31302C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223131223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2234222C22526F774964223A31312C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223132223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2231222C22526F774964223A31322C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223133223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2232222C22526F774964223A31332C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223134223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2233222C22526F774964223A31342C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223135223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2234222C22526F774964223A31352C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223136223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2235222C22526F774964223A31362C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223137223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2236222C22526F774964223A31372C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223138223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2237222C22526F774964223A31382C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223139223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2238222C22526F774964223A31392C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223230223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2239222C22526F774964223A32302C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223231223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2231222C22526F774964223A32312C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223232223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2232222C22526F774964223A32322C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223233223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2233222C22526F774964223A32332C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223234223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2231222C22526F774964223A32342C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223235223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2232222C22526F774964223A32352C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223236223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2233222C22526F774964223A32362C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223237223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2234222C22526F774964223A32372C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C224C6173744163636573736564223A7B22536563526F774964223A302C224C61737441637469766543686170746572223A302C22536563436F6465223A302C224461746554696D65223A22313937302D30312D30312030303A30303A3030227D2C224669727374416363657373223A22323031392D31302D30382030383A31313A3538222C2250726F6772657373223A7B22546F74616C223A32372C22436F6D706C657465223A307D2C22436F757273654D6F64566572223A307D',NULL,'2019-10-08 08:11:36',NULL,NULL,NULL,NULL),
	(13,1,X'7B2231223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2231222C22526F774964223A312C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2232223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2232222C22526F774964223A322C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2233223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2233222C22526F774964223A332C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2234223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2234222C22526F774964223A342C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2235223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2235222C22526F774964223A352C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2236223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2236222C22526F774964223A362C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2237223A7B22436861707465724964223A2231222C2253656374696F6E4964223A2237222C22526F774964223A372C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2238223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2231222C22526F774964223A382C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C2239223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2232222C22526F774964223A392C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223130223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2233222C22526F774964223A31302C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223131223A7B22436861707465724964223A2232222C2253656374696F6E4964223A2234222C22526F774964223A31312C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223132223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2231222C22526F774964223A31322C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223133223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2232222C22526F774964223A31332C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223134223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2233222C22526F774964223A31342C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223135223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2234222C22526F774964223A31352C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223136223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2235222C22526F774964223A31362C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223137223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2236222C22526F774964223A31372C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223138223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2237222C22526F774964223A31382C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223139223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2238222C22526F774964223A31392C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223230223A7B22436861707465724964223A2233222C2253656374696F6E4964223A2239222C22526F774964223A32302C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223231223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2231222C22526F774964223A32312C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223232223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2232222C22526F774964223A32322C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223233223A7B22436861707465724964223A2234222C2253656374696F6E4964223A2233222C22526F774964223A32332C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223234223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2231222C22526F774964223A32342C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223235223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2232222C22526F774964223A32352C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223236223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2233222C22526F774964223A32362C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C223237223A7B22436861707465724964223A2235222C2253656374696F6E4964223A2234222C22526F774964223A32372C22537461747573223A302C22537461727444617465223A22313937302D30312D3031222C22436F6D706C65746544617465223A6E756C6C7D2C224C6173744163636573736564223A7B22536563526F774964223A302C224C61737441637469766543686170746572223A302C22536563436F6465223A302C224461746554696D65223A22313937302D30312D30312030303A30303A3030227D2C224669727374416363657373223A22323032302D30312D30382030383A35303A3034222C2250726F6772657373223A7B22546F74616C223A32372C22436F6D706C657465223A307D2C22436F757273654D6F64566572223A307D',NULL,'2020-01-08 08:49:22',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `LearnerCourse` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table LearnerSalt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LearnerSalt`;

CREATE TABLE `LearnerSalt` (
  `SaltId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `LearnerId` int(10) unsigned NOT NULL,
  `Status` tinyint(3) NOT NULL DEFAULT '1',
  `Salt` varchar(255) NOT NULL DEFAULT '',
  `CreateDate` datetime NOT NULL,
  `ExpiryDate` datetime NOT NULL,
  PRIMARY KEY (`SaltId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

LOCK TABLES `LearnerSalt` WRITE;
/*!40000 ALTER TABLE `LearnerSalt` DISABLE KEYS */;

INSERT INTO `LearnerSalt` (`SaltId`, `LearnerId`, `Status`, `Salt`, `CreateDate`, `ExpiryDate`)
VALUES
	(1,1,1,'gVNqkzomAsoQcdcTFFy5ftfAVJu8LypRj28tsmGSEVyGYBqt6Poc8tCU3XSE','2017-08-23 10:23:46','2019-08-23 08:23:46'),
	(2,2,1,'QAqlMX7CI8oBgMKGmC9XpQlndJdn3tocTX2hVaffmrgaQ7WNe7EpTIHHY1Qn','2018-01-26 07:52:20','2020-01-26 05:52:20'),
	(3,3,1,'6xicpmk93KfwAKrWBm4LCb6QoNWqqTLcAn0JfOQU3AdTemqc2HTBfdSBNs01','2018-01-26 07:54:21','2020-01-26 05:54:21'),
	(4,4,1,'1zxxyK4N3NYqfQVTRAQglv4ceE37eNBIOnhRbbn2h1rXLG7AwmBhNdIhiHnj','2018-01-26 07:54:51','2020-01-26 05:54:51'),
	(5,5,1,'D9h8G5bNVRCOUhQfoIPNtBL37zQSKTMs8AohD3r5AKjR9qebzj034QFaySZb','2018-01-26 07:55:25','2020-01-26 05:55:25'),
	(6,6,1,'9b5cB5SED8X90HjDQjeXdBUCdf2e4V3Ns8QRcaqxSsokOomIzOP96dJx3OTp','2018-01-26 07:56:37','2020-01-26 05:56:37'),
	(7,7,1,'tmUPEnlEjEKvOiXQnj86ItHnx7lHH68Di6VtCGF22Zb3GlhlXcHDL8UY2Tbq','2018-01-26 08:04:47','2020-01-26 06:04:47'),
	(8,8,1,'dWMTwffs9VEtRpCpkYzptXe0KUsudgDobAXDTMS8ltmU7dn6G91q9EANMMtK','2018-02-19 13:05:37','2020-02-19 11:05:42'),
	(9,9,1,'YWmPkh1WcqXHFp1k9t8PSKoNaCT3LKYImz1eJVRGjz0qux3PTXT9gyB0dQ9U','2018-02-21 10:03:39','2020-02-21 08:03:39'),
	(10,10,1,'e0BqKbJjPXQQ6f17ytmc6WcSf2xwgfck6EAGFaQlXx1UDSS1c438Q6RWYfj4','2019-05-24 09:19:51','2021-05-24 07:19:51'),
	(11,11,1,'Gr5DFBwBO6VrsvaOjDub37QNtHqyR1InjDRP5dgK922sn26xvrypoe3ILj6t','2019-05-24 09:22:46','2021-05-24 07:22:46'),
	(12,12,1,'VRdQGwXrKncFVufsrElbBEVg5oFDa2uVKyCgUqxuEz0qU6IbBTc2nY8jdEMd','2019-10-08 08:11:36','2021-10-08 06:11:36'),
	(13,13,1,'67BZ39NZhDiE6SHVm34ETBoZw9ae9YN6VeVPezEm3NQZvnLHhFc06qPtqQxp','2020-01-08 08:49:22','2022-01-08 06:49:22');

/*!40000 ALTER TABLE `LearnerSalt` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Section
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Section`;

CREATE TABLE `Section` (
  `CourseId` int(10) unsigned NOT NULL,
  `ChapterId` int(11) unsigned NOT NULL,
  `SectionId` int(11) unsigned NOT NULL,
  `SecCode` varchar(10) NOT NULL DEFAULT '',
  `SecDescription` varchar(150) NOT NULL DEFAULT '',
  `SecGlyph` varchar(50) DEFAULT NULL,
  `SecContent` blob,
  `SecBinRowId` int(10) unsigned NOT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '1',
  `CreateDate` datetime NOT NULL,
  `CreateUserId` int(11) NOT NULL DEFAULT '1',
  `ModDate` datetime NOT NULL,
  `ModUserId` int(11) NOT NULL DEFAULT '1',
  `RowId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`CourseId`,`ChapterId`,`SectionId`),
  UNIQUE KEY `RowId` (`RowId`),
  KEY `FK_CourseChapter` (`ChapterId`),
  KEY `FK_Sec_BinRowId` (`SecBinRowId`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

LOCK TABLES `Section` WRITE;
/*!40000 ALTER TABLE `Section` DISABLE KEYS */;

INSERT INTO `Section` (`CourseId`, `ChapterId`, `SectionId`, `SecCode`, `SecDescription`, `SecGlyph`, `SecContent`, `SecBinRowId`, `Status`, `CreateDate`, `CreateUserId`, `ModDate`, `ModUserId`, `RowId`)
VALUES
	(1,1,1,'What is PO','What Is PowerOffice?','fa fa-gift',NULL,7,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,1),
	(1,1,2,'Run PO','Running PowerOffice','fa fa-play',X'7B22696942696E496422203A20317D',1,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,2),
	(1,1,3,'Login','Logging In','fa fa-sign-in',NULL,2,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,3),
	(1,1,4,'Proj','Projects Module Overview','glyphicon glyphicon-th-large',NULL,3,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,4),
	(1,1,5,'Menu','Menu Bars','fa fa-list',NULL,4,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,5),
	(1,1,6,'Toolbars','Toolbars','fa fa-wrench',NULL,5,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,6),
	(1,1,7,'Options','Options','glyphicon glyphicon-list-alt',NULL,6,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,7),
	(1,2,1,'PandV','Projects and Versions','glyphicon glyphicon-eye-open',NULL,8,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,8),
	(1,2,2,'CreateP','Creating a new Project','glyphicon glyphicon-blackboard',NULL,9,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,9),
	(1,2,3,'CreateV','Creating a new Version','fa fa-pencil-square-o',NULL,10,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,10),
	(1,2,4,'VAttrib','Version Attributes','fa fa-magic',NULL,11,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,11),
	(1,3,1,'BOM','Building your BOM','fa fa-exchange',NULL,12,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,12),
	(1,3,2,'QF','Using the Quick Filter','fa fa-filter',NULL,13,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,13),
	(1,3,3,'AF','Using the Advanced Filter','glyphicon glyphicon-filter',NULL,14,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,14),
	(1,3,4,'Wild','Wild Card Symbols','glyphicon glyphicon-asterisk',NULL,15,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,15),
	(1,3,5,'DandD','Dragging and Dropping','glyphicon glyphicon-random',NULL,16,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,16),
	(1,3,6,'Mod','Modifying Your Project','glyphicon glyphicon-edit',NULL,17,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,17),
	(1,3,7,'Node','Descriptions and Comments','glyphicon glyphicon-pencil',NULL,18,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,18),
	(1,3,8,'CandM','Copying and Merging','glyphicon glyphicon-copy',NULL,19,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,19),
	(1,3,9,'Users','Giving Other Users Access','fa fa-user',NULL,20,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,20),
	(1,4,1,'Cost','Costing','fa fa-money',NULL,21,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,21),
	(1,4,2,'QC','Quick Cost','fa fa-usd',NULL,22,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,22),
	(1,4,3,'Rep','Reporting','fa fa-file-text-o',NULL,23,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,23),
	(1,5,1,'Ov','Overview','glyphicon glyphicon-eye-open',NULL,24,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,24),
	(1,5,2,'Ex','Exporting','glyphicon glyphicon-export',NULL,25,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,25),
	(1,5,3,'WhatEx','What is Exported','fa fa-question-circle',NULL,26,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,26),
	(1,5,4,'Imp','Importing','glyphicon glyphicon-import',NULL,27,1,'2017-03-31 00:00:00',1,'2017-03-31 00:00:00',1,27);

/*!40000 ALTER TABLE `Section` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Status`;

CREATE TABLE `Status` (
  `StatusId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `StatusCode` varchar(5) NOT NULL DEFAULT '',
  `StatusDesc` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`StatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `Status` WRITE;
/*!40000 ALTER TABLE `Status` DISABLE KEYS */;

INSERT INTO `Status` (`StatusId`, `StatusCode`, `StatusDesc`)
VALUES
	(1,'Act','Active / Published'),
	(2,'Pre','PrePublish Testing'),
	(3,'Dev','Under Development');

/*!40000 ALTER TABLE `Status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table VersionControl
# ------------------------------------------------------------

DROP TABLE IF EXISTS `VersionControl`;

CREATE TABLE `VersionControl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CourseId` int(10) unsigned NOT NULL,
  `Version` int(10) unsigned NOT NULL DEFAULT '0',
  `ReleaseDate` datetime NOT NULL,
  `Details` blob NOT NULL,
  `CreateDate` datetime NOT NULL,
  `CreateUser` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `VersionControl` WRITE;
/*!40000 ALTER TABLE `VersionControl` DISABLE KEYS */;

INSERT INTO `VersionControl` (`id`, `CourseId`, `Version`, `ReleaseDate`, `Details`, `CreateDate`, `CreateUser`)
VALUES
	(1,1,0,'2018-02-07 00:00:00',X'4F726967696E616C2052656C65617365','2018-02-07 11:05:00',1);

/*!40000 ALTER TABLE `VersionControl` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
