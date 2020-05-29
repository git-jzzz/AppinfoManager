/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.28 : Database - appinfodb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`appinfodb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `appinfodb`;

/*Table structure for table `ad_promotion` */

DROP TABLE IF EXISTS `ad_promotion`;

CREATE TABLE `ad_promotion` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `appId` bigint(30) DEFAULT NULL COMMENT 'appId（来源于：app_info表的主键id）',
  `adPicPath` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '广告图片存储路径',
  `adPV` bigint(50) DEFAULT NULL COMMENT '广告点击量',
  `carouselPosition` int(30) DEFAULT NULL COMMENT '轮播位（1-n）',
  `startTime` datetime DEFAULT NULL COMMENT '起效时间',
  `endTime` datetime DEFAULT NULL COMMENT '失效时间',
  `createdBy` bigint(30) DEFAULT NULL COMMENT '创建者（来源于backend_user用户表的用户id）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(30) DEFAULT NULL COMMENT '更新者（来源于backend_user用户表的用户id）',
  `modifyDate` datetime DEFAULT NULL COMMENT '最新更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ad_promotion` */

/*Table structure for table `app_category` */

DROP TABLE IF EXISTS `app_category`;

CREATE TABLE `app_category` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `categoryCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分类编码',
  `categoryName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分类名称',
  `parentId` bigint(30) DEFAULT NULL COMMENT '父级节点id',
  `createdBy` bigint(30) DEFAULT NULL COMMENT '创建者（来源于backend_user用户表的用户id）',
  `creationTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(30) DEFAULT NULL COMMENT '更新者（来源于backend_user用户表的用户id）',
  `modifyDate` datetime DEFAULT NULL COMMENT '最新更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `app_category` */

insert  into `app_category`(`id`,`categoryCode`,`categoryName`,`parentId`,`createdBy`,`creationTime`,`modifyBy`,`modifyDate`) values (1,'ALL_APP','全部应用',0,1,'2016-08-12 18:11:47',NULL,NULL),(2,'ALL_GAME','全部游戏',0,1,'2016-08-12 18:11:47',NULL,NULL),(3,'APP_001','系统工具',1,1,'2016-08-12 18:11:47',NULL,NULL),(4,'APP_002','桌面插件',1,1,'2016-08-12 18:11:47',NULL,NULL),(5,'APP_003','主题美化',1,1,'2016-08-12 18:11:47',NULL,NULL),(6,'APP_004','社交聊天',1,1,'2016-08-12 18:11:47',NULL,NULL),(7,'APP_005','资讯阅读',1,1,'2016-08-12 18:11:47',NULL,NULL),(8,'APP_006','通讯网络',1,1,'2016-08-12 18:11:47',NULL,NULL),(9,'APP_007','影音娱乐',1,1,'2016-08-12 18:11:47',NULL,NULL),(10,'APP_008','摄影图片 ',1,1,'2016-08-12 18:11:47',NULL,NULL),(11,'APP_009','生活服务',1,1,'2016-08-12 18:11:47',NULL,NULL),(12,'APP_010','实用工具 ',1,1,'2016-08-12 18:11:47',NULL,NULL),(13,'APP_011','文档商务',1,1,'2016-08-12 18:11:47',NULL,NULL),(14,'APP_012','金融财经',1,1,'2016-08-12 18:11:47',NULL,NULL),(15,'APP_013','运动健康',1,1,'2016-08-12 18:11:47',NULL,NULL),(16,'APP_014','学习教育 ',1,1,'2016-08-12 18:11:47',NULL,NULL),(17,'APP_015','旅行交通',1,1,'2016-08-12 18:11:47',NULL,NULL),(18,'APP_016','购物',1,1,'2016-08-12 18:11:47',NULL,NULL),(19,'GAME_001','休闲游戏',2,1,'2016-08-12 18:11:47',NULL,NULL),(20,'GAME_002','益智游戏',2,1,'2016-08-12 18:11:47',NULL,NULL),(21,'GAME_003','棋牌游戏',2,1,'2016-08-12 18:11:47',NULL,NULL),(22,'GAME_004','体育赛车',2,1,'2016-08-12 18:11:47',NULL,NULL),(23,'GAME_005','动作射击',2,1,'2016-08-12 18:11:47',NULL,NULL),(24,'GAME_006','掌上网游',2,1,'2016-08-12 18:11:47',NULL,NULL),(25,'GAME_007','策略塔防',2,1,'2016-08-12 18:11:47',NULL,NULL),(26,'GAME_008','角色扮演',2,1,'2016-08-12 18:11:47',NULL,NULL),(27,'GAME_009','模拟经营 ',2,1,'2016-08-12 18:11:47',NULL,NULL),(28,'GAME_010','音乐游戏 ',2,1,'2016-08-12 18:11:47',NULL,NULL),(29,'APP_001_01','输入法',3,1,'2016-08-12 18:11:47',NULL,NULL),(30,'APP_001_02','文件管理',3,1,'2016-08-12 18:11:47',NULL,NULL),(31,'APP_001_03','清理优化',3,1,'2016-08-12 18:11:47',NULL,NULL),(32,'APP_001_04','安全防护',3,1,'2016-08-12 18:11:47',NULL,NULL),(33,'APP_001_05','备份还原',3,1,'2016-08-12 18:11:47',NULL,NULL),(34,'APP_001_06','辅助加强',3,1,'2016-08-12 18:11:47',NULL,NULL),(35,'APP_002_01','桌面',4,1,'2016-08-12 18:11:47',NULL,NULL),(36,'APP_002_02','插件',4,1,'2016-08-12 18:11:47',NULL,NULL),(37,'APP_002_03','锁屏',4,1,'2016-08-12 18:11:47',NULL,NULL),(38,'GAME_001_01','跳舞',19,1,'2016-08-12 18:11:47',NULL,NULL),(39,'GAME_001_02','涂鸦',19,1,'2016-08-12 18:11:47',NULL,NULL),(40,'GAME_001_03','虐心',19,1,'2016-08-12 18:11:47',NULL,NULL),(41,'GAME_001_04','冒险',19,1,'2016-08-12 18:11:47',NULL,NULL),(42,'GAME_002_01','消除',20,1,'2016-08-12 18:11:47',NULL,NULL),(43,'GAME_001_02','解谜',20,1,'2016-08-12 18:11:47',NULL,NULL),(44,'GAME_001_03','物理',20,1,'2016-08-12 18:11:47',NULL,NULL),(45,'GAME_003_01','麻将',21,1,'2016-08-12 18:11:47',NULL,NULL),(46,'GAME_003_02','扑克',21,1,'2016-08-12 18:11:47',NULL,NULL),(47,'GAME_004_01','赛车',22,1,'2016-08-12 18:11:47',NULL,NULL),(48,'GAME_004_02','足球',22,1,'2016-08-12 18:11:47',NULL,NULL),(49,'GAME_004_03','篮球',22,1,'2016-08-12 18:11:47',NULL,NULL),(50,'GAME_004_04','摩托',22,1,'2016-08-12 18:11:47',NULL,NULL),(109,'儿童','111',22,1,'2020-04-23 17:10:33',1,'2020-04-23 17:18:52');

/*Table structure for table `app_info` */

DROP TABLE IF EXISTS `app_info`;

CREATE TABLE `app_info` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `softwareName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '软件名称',
  `aPKName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'APK名称（唯一）',
  `supportROM` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '支持ROM',
  `interfaceLanguage` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '界面语言',
  `softwareSize` decimal(20,2) DEFAULT NULL COMMENT '软件大小（单位：M）',
  `updateDate` date DEFAULT NULL COMMENT '更新日期',
  `devId` bigint(30) DEFAULT NULL COMMENT '开发者id（来源于：dev_user表的开发者id）',
  `appInfo` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '应用简介',
  `status` bigint(30) DEFAULT NULL COMMENT '状态（来源于：data_dictionary，1 待审核 2 审核通过 3 审核不通过 4 已上架 5 已下架）',
  `onSaleDate` datetime DEFAULT NULL COMMENT '上架时间',
  `offSaleDate` datetime DEFAULT NULL COMMENT '下架时间',
  `flatformId` bigint(30) DEFAULT NULL COMMENT '所属平台（来源于：data_dictionary，1 手机 2 平板 3 通用）',
  `categoryLevel3` bigint(30) DEFAULT NULL COMMENT '所属三级分类（来源于：data_dictionary）',
  `downloads` bigint(30) DEFAULT NULL COMMENT '下载量（单位：次）',
  `createdBy` bigint(30) DEFAULT NULL COMMENT '创建者（来源于dev_user开发者信息表的用户id）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(30) DEFAULT NULL COMMENT '更新者（来源于dev_user开发者信息表的用户id）',
  `modifyDate` datetime DEFAULT NULL COMMENT '最新更新时间',
  `categoryLevel1` bigint(30) DEFAULT NULL COMMENT '所属一级分类（来源于：data_dictionary）',
  `categoryLevel2` bigint(30) DEFAULT NULL COMMENT '所属二级分类（来源于：data_dictionary）',
  `logoPicPath` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'LOGO图片url路径',
  `logoLocPath` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'LOGO图片的服务器存储路径',
  `versionId` bigint(30) DEFAULT NULL COMMENT '最新的版本id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `app_info` */

insert  into `app_info`(`id`,`softwareName`,`aPKName`,`supportROM`,`interfaceLanguage`,`softwareSize`,`updateDate`,`devId`,`appInfo`,`status`,`onSaleDate`,`offSaleDate`,`flatformId`,`categoryLevel3`,`downloads`,`createdBy`,`creationDate`,`modifyBy`,`modifyDate`,`categoryLevel1`,`categoryLevel2`,`logoPicPath`,`logoLocPath`,`versionId`) values (48,'劲乐团U:O2Jam U','com.momocorp.o2jamu','2.3及更高版本','英文软件','56.00',NULL,1,'劲乐团U O2Jam U是一款音乐节拍游戏，跟着音乐的节奏点击屏幕即可，就是跳舞机，需要网络支持。\n注意：部分机型会卡死在启动界面或fc，结束进程后重新开启游戏就正常了。',1,NULL,NULL,1,38,1000,1,'2016-08-22 11:43:02',1,'2019-11-07 15:00:53',2,19,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',NULL),(49,'LBE安全大师','com.lbe.security','2.2及更高版本','简体中文','9.00',NULL,1,'欢迎您使用LBE安全大师，Android平台上首款主动式防御软件，第一款具备实时监控与拦截能力的安全软件。\n安全大师基于业界首创的API拦截技术，能够实时监控与拦截系统中的敏感操作，动态拦截来自已知和未知的各种威胁。避免各类吸费软件，广告软件乃至木马病毒窃取您手机内的隐私信息以及可能产生的经济损失。\n安全大师同时提供了强大的定制功能与完善的提示机制，您更可以精确控制系统中每一个应用的权限，同时不放过任何一次可疑的操作。对于没有获取root权限的用户，您依旧可以使用我们的流量控制，电话短信防火墙，系统优化清理等功能。',1,NULL,NULL,1,32,2000,1,'2016-08-22 11:47:11',1,'2019-11-07 15:01:15',2,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',NULL),(50,'应用锁:Smart App Protector','com.sp.protector.free','2.3及更高版本','简体中文','3.00',NULL,1,'Smart App Protector是一款应用锁定程序，可以实现当您打开某个应用时进行密码保护，从而保护用户的隐私问题。',1,NULL,NULL,2,32,5000,1,'2016-08-22 11:49:12',1,'2019-11-07 15:01:34',2,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',NULL),(51,'谷歌拼音输入法','com.google.android.inputmethod.pinyin','4.2及更高版本','简体中文','16.00',NULL,1,'谷歌拼音输入法是一款专门用于输入中文的输入法，提供了多种方便的输入方式：\r\n- 全键盘拼音支持中文滑行输入和智能纠错\r\n- 9键键盘拼音支持中文滑行输入\r\n- 笔画键盘\r\n- 全屏和半屏手写键盘\r\n- 英文键盘\r\n- 模糊拼音\r\n- 双拼\r\n- 针对各种不同屏幕尺寸优化的UI布局\r\n- 语音输入\r\n不仅支持输入简体中文、繁体中文，还支持标点符号、表情符号、拉丁字符和数字。语音输入法使用基于互联网的语音识别服务，以提供高精度的输入匹配。\r\n\r\n注意：要在你的Android设备上使用该输入法，请在 “设置”→“语言和输入法”中开启。\r\n\r\n如需输入粤语，请下载谷歌粤语输入法\r\nhttps://play.google.com/store/apps/details?id=com.google.android.apps.inputmethod.cantonese\r\n\r\n如需使用注音或者倉頡输入繁体中文，请下载谷歌注音输入法\r\nhttps://play.google.com/store/apps/details?id=com.google.android.apps.inputmethod.zhuyin',3,NULL,NULL,3,29,8000,1,'2016-08-22 11:53:23',NULL,NULL,1,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',37),(53,'关屏锁定:Screen Off and Lock','com.katecca.screenofflockdonate','2.2及更高版本','简体中文','1.00',NULL,1,'关屏锁定Screen Off and Lock能实现只需点击一下即可关闭屏幕及锁定手机，支持设定关屏动画及音效 ，不是widget，可以放在任何地方，同时支持通知栏激活或者长按搜索键激活。',1,NULL,NULL,1,37,20,1,'2016-08-22 13:07:11',1,'2019-11-07 15:01:08',2,4,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',NULL),(54,'重力锁屏:Gravity Screen Off Pro','com.plexnor.gravityscreenoffpro','2.2及更高版本','英文软件','1.00',NULL,1,'重力锁屏Gravity Screen Off Pro可以让手机在特定的条件下自动开启/关闭屏幕（例如放入口袋、放在桌面上、在传感器前挥手、移动手机等），而且识别度相当准确，你可以在设置中随意设置任意角度，当你把手机按这个角度（或者比这个角度小）放入口袋、桌面上时，屏幕就会自动关闭。日常使用起来节省了不少手动开屏/关屏的时间，这个才是真正的与科技接轨！\n功能说明：\n* 支持识别手机是否在口袋中，可以自定义在口袋中识别设备放置的角度、方向；\n* 支持识别手机是否在桌面上，可以自定义在桌面上识别设备放置的角度；\n* 识别设备正面、反面放置；\n* 可以是使用距离传感器、重力传感器进行识别；\n* 可以通过识别动作（例如挥手、移动手机等）来开启/关闭屏幕）；\n* 可以自定识别灵敏度；\n* 支持在插入而且后启用传感器来自动开启/关闭屏幕；\n* 支持开机自动启用服务；\n* 可以在通知栏显示启用/停用服务的快捷方式。',1,NULL,NULL,1,37,23,1,'2016-08-22 13:08:24',1,'2019-11-07 15:01:02',2,4,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',NULL),(55,'机械迷城:Machinarium','air.net.machinarium.Machinarium.GP','2.3及更高版本','英文软件','11.00',NULL,1,'机械迷城Machinarium是一款解密冒险游戏，玩家可以在城市里随意的走动，跟场景或是其他同样是机器人互动，了解他们的需求以及帮忙他们，一步一步往事件的核心探索。 ',3,NULL,NULL,1,43,277,1,'2016-08-22 13:09:44',1,'2019-11-08 08:47:36',2,20,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',36),(56,'Dont Starve饥荒','com.kleientertainment.doNotStarvePocket','4.0.3及更高版本','英文软件','4.00',NULL,1,'Don`t Starve: Pocket Edition移动版将深受超过4百万玩家喜爱的热门PC游戏移植到了安卓平台。现在你可以随时随地进入充满科学和魔法元素的世界，体验原汁原味的荒野生存游戏！\r\n你扮演威尔逊，一位被困住并传送到神秘荒野世界的勇敢无畏的绅士科学家。如果威尔逊希望逃出生天并找到回家的路，他必须充分利用所处的环境及这里的各种生物。\r\n进入一个光怪陆离而未经探索的世界，这里充满了奇怪的生物以及形形色色的危险和意外。收集资源以制作符合你的生存风格的物品和建筑。一路解开这块奇怪大陆上的各种谜团。',4,NULL,'2016-08-22 13:28:16',2,41,390,1,'2016-08-22 13:11:51',1,NULL,2,19,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',42),(57,'机械世界:Apparatus','com.bithack.apparatus','1.6及更高版本','英文软件','11.00',NULL,1,'在机械世界Apparatus游戏中你需要利用木板、钉子、绳索、圆轮等等各种道具搭建从简单到复杂的机械结构，使得小球可以最终滚落到蓝色方框中。可以利用的可不止重力，包括杠杆原理、滑轮等等，尤其是后面的关卡，你需要足够灵活的头脑才能解决问题，可玩性还是非常高的。',3,NULL,NULL,1,44,255,1,'2016-08-22 13:13:27',1,'2019-11-07 15:00:28',2,20,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',41),(58,'沙盘玩具:The Powder Toy','com.doodleapps.powdertoy','2.2及更高版本','英文软件','1.00',NULL,1,'沙盘玩具The Powder Toy是一款模拟类游戏。想过自己建造核电站吗？或者自己做一个CPU？你甚至可以创建一个虚拟网络。沙盘玩具可以模拟空气的压力，速度，热，重力和无数的不同物质之间的相互作用，游戏提供各种形态的建材，用以构建复杂的机器或是电子元件，你可以模拟超酷的爆炸或是布线出复杂的机器人。欢迎提交您的作品。',5,NULL,'2016-08-22 13:27:42',3,44,2000,1,'2016-08-22 13:14:56',1,NULL,2,20,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',40),(61,'1','1','1','1','1.00',NULL,1,'1',1,NULL,NULL,1,29,1,1,'2019-11-04 10:59:46',1,'2019-11-07 15:00:14',2,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',NULL),(62,'1','12','1','1','1.00',NULL,1,'1',1,NULL,NULL,1,29,1,1,'2019-11-04 11:01:44',1,'2019-11-07 15:00:07',2,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',NULL),(63,'1','12','1','1','1.00',NULL,1,'1',1,NULL,NULL,1,29,1,1,'2019-11-04 11:02:27',1,'2019-11-07 14:59:58',2,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',NULL),(64,'12','3','1','1','1.00',NULL,1,'1',1,NULL,NULL,1,29,1,1,'2019-11-04 11:10:43',1,'2019-11-07 14:59:49',2,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',NULL),(65,'3','32','3','3','3.00',NULL,1,'3',1,NULL,NULL,1,29,3,1,'2019-11-04 11:12:14',1,'2019-11-07 14:59:27',2,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',NULL),(66,'5','5','5','5','5.00',NULL,1,'5',3,NULL,NULL,1,29,5,1,'2019-11-04 11:14:06',1,'2019-11-07 14:59:02',2,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',59),(67,'6','6','6','6','6.00',NULL,1,'6',4,NULL,NULL,1,29,6,1,'2019-11-04 11:17:41',1,'2019-11-06 14:12:45',1,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',57),(73,'32','322','32','32','32.00',NULL,1,'23',4,NULL,NULL,1,29,23,NULL,'2019-11-04 11:37:02',1,'2019-11-06 14:12:32',1,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',51),(74,'676767','67','com.erh','english','32.00',NULL,1,'6767',4,NULL,NULL,1,29,12,NULL,'2019-11-04 11:38:20',1,'2019-11-06 15:10:12',1,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',58),(78,'001','com.bai','223','english  chinese','2.00',NULL,1,'测试',3,NULL,NULL,1,29,4,NULL,'2019-11-06 15:45:57',1,'2019-11-09 10:53:51',2,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',65),(79,'photo shop','phtoshop.om','fd','chinese','12.00',NULL,1,'美化图片',2,NULL,NULL,2,36,1,NULL,'2019-11-07 08:56:30',1,'2020-05-19 17:26:48',2,4,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',62),(81,'56','56','56','56','56.00',NULL,1,'56',2,NULL,NULL,1,29,56,NULL,'2019-11-07 09:11:16',1,'2019-11-08 15:17:17',2,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',60),(82,'ss','ss','ss','ss','1.00',NULL,1,'ssd',2,NULL,NULL,1,42,2,NULL,'2019-11-07 13:45:43',1,'2020-05-11 15:46:23',2,20,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',63),(83,'eer','rt','rt','rt','3.00',NULL,1,'                            23232323\n                        ',3,NULL,NULL,1,29,23,NULL,'2019-11-07 15:02:27',1,'2020-04-28 17:21:22',2,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',64),(85,'1','12323','1','1','1.00',NULL,1,'sdsd   ',2,NULL,NULL,2,42,1,NULL,'2019-11-09 17:01:18',1,'2019-11-09 17:05:34',2,20,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',67),(90,'test','test','test','test','11.00',NULL,1,'sdfsdf',3,NULL,NULL,1,29,11,NULL,'2020-04-28 17:30:09',1,'2020-05-19 17:26:36',1,3,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',68),(95,'1','1111','1','1','1.00',NULL,1,'1111',1,NULL,NULL,1,36,1,NULL,'2020-04-30 16:48:50',NULL,NULL,1,4,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',NULL),(100,'test','tester','er','er','12.00',NULL,1,'ere',4,NULL,NULL,1,39,12,NULL,'2020-05-08 10:35:19',1,'2020-05-16 14:26:14',2,19,'http://localhost:8081//upload/img/2f667d39-98a8-4738-9122-706960152b97.PNG','5d2ba4bf-46cb-48cb-835a-7dfb5a5bab78.PNG',77),(104,'sdf1','测试服1','安卓','chinese','12.00',NULL,5,'提交1',2,NULL,NULL,3,38,23,NULL,'2020-05-20 08:05:24',5,'2020-05-20 08:07:27',2,19,'http://localhost:8081/upload/img/79e6e11f-de0d-42ab-9494-bc59eb5c1ca9.PNG','79e6e11f-de0d-42ab-9494-bc59eb5c1ca9.PNG',80),(105,'test','teste','an','chinese','12.00',NULL,1,'test',4,NULL,NULL,3,30,12,NULL,'2020-05-20 17:42:06',1,'2020-05-20 17:43:12',1,3,'http://localhost:8081/upload/img/d5812aca-b001-43a6-bc94-e6cebed90c00.PNG','d5812aca-b001-43a6-bc94-e6cebed90c00.PNG',81),(106,'asd','sdfsdfsdf','sdfs','sdf','12.00',NULL,1,'测试asasd-askdpj',4,NULL,NULL,2,39,12,NULL,'2020-05-21 16:27:18',1,'2020-05-21 16:28:55',2,19,'http://localhost:8081/upload/img/b8d4439e-edc6-4d50-ab51-c90c520a8b09.PNG','b8d4439e-edc6-4d50-ab51-c90c520a8b09.PNG',82);

/*Table structure for table `app_version` */

DROP TABLE IF EXISTS `app_version`;

CREATE TABLE `app_version` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `appId` bigint(30) DEFAULT NULL COMMENT 'appId（来源于：app_info表的主键id）',
  `versionNo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '版本号',
  `versionInfo` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '版本介绍',
  `publishStatus` bigint(30) DEFAULT NULL COMMENT '发布状态（来源于：data_dictionary，1 不发布 2 已发布 3 预发布）',
  `downloadLink` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `versionSize` decimal(20,2) DEFAULT NULL COMMENT '版本大小（单位：M）',
  `createdBy` bigint(30) DEFAULT NULL COMMENT '创建者（来源于dev_user开发者信息表的用户id）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(30) DEFAULT NULL COMMENT '更新者（来源于dev_user开发者信息表的用户id）',
  `modifyDate` datetime DEFAULT NULL COMMENT '最新更新时间',
  `apkLocPath` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'apk文件的服务器存储路径',
  `apkFileName` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上传的apk文件名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `app_version` */

insert  into `app_version`(`id`,`appId`,`versionNo`,`versionInfo`,`publishStatus`,`downloadLink`,`versionSize`,`createdBy`,`creationDate`,`modifyBy`,`modifyDate`,`apkLocPath`,`apkFileName`) values (33,58,'V1.1.1','V1.1.1版本简介',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','1.00',1,'2016-08-22 13:17:47',NULL,NULL,'\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(34,57,'V1.1.1','              V1.1.1版本简介',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','11.00',1,'2016-08-22 13:19:42',1,'2016-08-22 13:19:54','\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(35,56,'V1.1.1','              V1.1.1简介',2,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','4.00',1,'2016-08-22 13:21:12',1,'2016-08-22 13:28:07','\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(36,55,'V1.1.1','              V1.1.1简介',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','11.00',1,'2016-08-22 13:21:40',1,'2016-08-22 13:21:57','\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(37,51,'V1.1.1','V1.1.1简介',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','16.00',1,'2016-08-22 13:24:07',NULL,NULL,'\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(38,52,'V1.1.1','V1.1.1简介',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','3.00',1,'2016-08-22 13:24:35',NULL,NULL,'\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(39,58,'V1.1.2','V1.1.2',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','2.00',1,'2016-08-22 13:26:15',NULL,NULL,'\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(40,58,'V1.1.3','V1.1.3简介',2,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','2.00',1,'2016-08-22 13:26:47',1,'2016-08-22 13:27:42','\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(41,57,'V1.1.2','              V1.1.2简介',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','11.00',1,'2016-08-22 13:27:32',1,'2016-08-22 15:08:04','\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(42,56,'V1.1.2','V1.1.2简介',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','4.00',1,'2016-08-22 15:00:32',NULL,NULL,'\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(50,74,'v1','测试',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','12.00',1,'2019-11-05 12:55:50',NULL,NULL,'\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(51,73,'c1','测试',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','2.00',1,'2019-11-05 13:02:04',NULL,NULL,'\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(57,67,'v2','2323',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','12.00',1,'2019-11-06 14:12:45',NULL,NULL,'\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(58,74,'v2','测试',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','12.00',1,'2019-11-06 15:10:12',NULL,NULL,'\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(59,66,'b2','23',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','32.20',1,'2019-11-06 15:10:49',1,'2019-11-06 15:11:02','\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(60,81,'c1','56',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','34.00',1,'2019-11-07 09:11:37',NULL,NULL,'\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(62,79,'m9','43',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','2.00',1,'2019-11-07 09:19:06',1,'2019-11-07 10:52:20','\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(63,82,'54','sd',3,'http://localhost:8080/AppInfoSys/statics/apk/dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','45.00',1,'2019-11-07 13:46:05',1,'2019-11-07 13:48:51','\\statics\\apk\\dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk','dfcd8e9f-1b29-4c64-aad2-a5b33605a8cb.apk'),(64,83,'m2','332',3,'http://localhost:8080/AppInfoSys/statics/apk/8a94dd9a-b2a4-4e94-8db0-772dbdfc1559.apk','12.00',1,'2019-11-07 15:02:50',NULL,NULL,'\\statics\\apk\\8a94dd9a-b2a4-4e94-8db0-772dbdfc1559.apk','8a94dd9a-b2a4-4e94-8db0-772dbdfc1559.apk'),(65,78,'v1.1','测试',3,'http://localhost:8080/AppInfoSys/statics/apk/4790a0f8-1461-4561-98b5-345167fc739d.apk','2.00',1,'2019-11-09 10:53:51',NULL,NULL,'\\statics\\apk\\4790a0f8-1461-4561-98b5-345167fc739d.apk','4790a0f8-1461-4561-98b5-345167fc739d.apk'),(67,85,'v1','121223',3,NULL,'12.00',1,'2019-11-09 17:01:52',1,'2019-11-09 17:02:13',NULL,NULL),(68,90,'001','35',3,'http://localhost:8080/AppInfoSys/statics/apk/c8d49815-53ec-4503-9098-d1acf68813ac.apk','35.00',1,'2020-04-28 17:31:03',1,'2020-04-28 17:31:18','\\statics\\apk\\c8d49815-53ec-4503-9098-d1acf68813ac.apk','c8d49815-53ec-4503-9098-d1acf68813ac.apk'),(75,100,'sdf','sdf',3,'','12.00',1,'2020-05-12 09:28:07',NULL,NULL,'',''),(76,100,'12','12',3,'http://localhost:8081/upload/apk/0d342972-2023-4109-a1e3-7631a7fcb691.apk','12.00',1,'2020-05-12 09:39:46',NULL,NULL,'0d342972-2023-4109-a1e3-7631a7fcb691.apk','0d342972-2023-4109-a1e3-7631a7fcb691.apk'),(77,100,'w','12',3,'http://localhost:8081/upload/apk/4f903294-aa95-4eef-8b9d-28a788e006a6.apk','21.00',1,'2020-05-16 14:26:14',NULL,NULL,'4f903294-aa95-4eef-8b9d-28a788e006a6.apk','4f903294-aa95-4eef-8b9d-28a788e006a6.apk'),(80,104,'s1','简介',3,'http://localhost:8081/upload/apk/07a6c6c3-695d-4a1e-ad9d-63f0d25555a4.apk','893.00',5,'2020-05-20 08:06:08',NULL,NULL,'07a6c6c3-695d-4a1e-ad9d-63f0d25555a4.apk','07a6c6c3-695d-4a1e-ad9d-63f0d25555a4.apk'),(81,105,'sdf','测试',3,'http://localhost:8081/upload/apk/11e72972-7dde-4b74-96c5-d0d664bb0da0.apk','12.00',1,'2020-05-20 17:42:37',NULL,NULL,'11e72972-7dde-4b74-96c5-d0d664bb0da0.apk','11e72972-7dde-4b74-96c5-d0d664bb0da0.apk'),(82,106,'sdf','12',3,'http://localhost:8081/upload/apk/0c77ae3b-d164-482c-8fee-dd0fb9a81004.apk','121.00',1,'2020-05-21 16:27:56',1,'2020-05-21 16:28:06','0c77ae3b-d164-482c-8fee-dd0fb9a81004.apk','0c77ae3b-d164-482c-8fee-dd0fb9a81004.apk');

/*Table structure for table `backend_user` */

DROP TABLE IF EXISTS `backend_user`;

CREATE TABLE `backend_user` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户编码',
  `userName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名称',
  `userType` bigint(30) DEFAULT NULL COMMENT '用户角色类型（来源于数据字典表，分为：超管、财务、市场、运营、销售）',
  `createdBy` bigint(30) DEFAULT NULL COMMENT '创建者（来源于backend_user用户表的用户id）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(30) DEFAULT NULL COMMENT '更新者（来源于backend_user用户表的用户id）',
  `modifyDate` datetime DEFAULT NULL COMMENT '最新更新时间',
  `userPassword` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `backend_user` */

insert  into `backend_user`(`id`,`userCode`,`userName`,`userType`,`createdBy`,`creationDate`,`modifyBy`,`modifyDate`,`userPassword`) values (1,'admin','系统管理员',1,1,'2016-08-20 00:13:41',NULL,NULL,'123456'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `data_dictionary` */

DROP TABLE IF EXISTS `data_dictionary`;

CREATE TABLE `data_dictionary` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `typeCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型编码',
  `typeName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型名称',
  `valueId` bigint(30) DEFAULT NULL COMMENT '类型值ID',
  `valueName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型值Name',
  `createdBy` bigint(30) DEFAULT NULL COMMENT '创建者（来源于backend_user用户表的用户id）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(30) DEFAULT NULL COMMENT '更新者（来源于backend_user用户表的用户id）',
  `modifyDate` datetime DEFAULT NULL COMMENT '最新更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `data_dictionary` */

insert  into `data_dictionary`(`id`,`typeCode`,`typeName`,`valueId`,`valueName`,`createdBy`,`creationDate`,`modifyBy`,`modifyDate`) values (1,'USER_TYPE','用户类型',1,'超级管理员',1,'2016-08-12 18:11:47',NULL,NULL),(2,'USER_TYPE','用户类型',2,'财务',1,'2016-08-12 18:11:47',NULL,NULL),(3,'USER_TYPE','用户类型',3,'市场',1,'2016-08-12 18:11:47',NULL,NULL),(4,'USER_TYPE','用户类型',4,'运营',1,'2016-08-12 18:11:47',NULL,NULL),(5,'USER_TYPE','用户类型',5,'销售',1,'2016-08-12 18:11:47',NULL,NULL),(6,'APP_STATUS','APP状态',1,'待审核',1,'2016-08-12 18:11:47',NULL,NULL),(7,'APP_STATUS','APP状态',2,'审核通过',1,'2016-08-12 18:11:47',NULL,NULL),(8,'APP_STATUS','APP状态',3,'审核未通过',1,'2016-08-12 18:11:47',NULL,NULL),(9,'APP_STATUS','APP状态',4,'已上架',1,'2016-08-12 18:11:47',NULL,NULL),(10,'APP_STATUS','APP状态',5,'已下架',1,'2016-08-12 18:11:47',NULL,NULL),(11,'APP_FLATFORM','所属平台',1,'手机',1,'2016-08-12 18:11:47',NULL,NULL),(12,'APP_FLATFORM','所属平台',2,'平板',1,'2016-08-12 18:11:47',NULL,NULL),(14,'PUBLISH_STATUS','发布状态',1,'不发布',1,'2016-08-12 18:11:47',NULL,NULL),(15,'PUBLISH_STATUS','发布状态',2,'已发布',1,'2016-08-12 18:11:47',NULL,NULL),(16,'PUBLISH_STATUS','发布状态',3,'预发布',1,'2016-08-12 18:11:47',NULL,NULL),(13,'APP_FLATFORM','所属平台',3,'通用',1,'2016-08-12 18:11:47',NULL,NULL);

/*Table structure for table `dev_user` */

DROP TABLE IF EXISTS `dev_user`;

CREATE TABLE `dev_user` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `devCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发者帐号',
  `devName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发者名称',
  `devPassword` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发者密码',
  `devEmail` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发者电子邮箱',
  `devInfo` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发者简介',
  `createdBy` bigint(30) DEFAULT NULL COMMENT '创建者（来源于backend_user用户表的用户id）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(30) DEFAULT NULL COMMENT '更新者（来源于backend_user用户表的用户id）',
  `modifyDate` datetime DEFAULT NULL COMMENT '最新更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dev_user` */

insert  into `dev_user`(`id`,`devCode`,`devName`,`devPassword`,`devEmail`,`devInfo`,`createdBy`,`creationDate`,`modifyBy`,`modifyDate`) values (1,'jz','蒋征','123456','root_jz@163.com','修改',1,'2016-08-20 00:13:41',NULL,NULL),(5,'sdf','史蒂夫','123456','123@163.com','史蒂夫',1,'2016-08-20 00:13:41',NULL,NULL),(6,'23','水电费','史蒂夫','771953496@qq.com','修改',NULL,NULL,NULL,NULL),(7,'23','水电费','史蒂夫','root_jz@163.com','修改',NULL,NULL,NULL,NULL),(8,'23','水电费','sdf','root_jz@163.com','修改',NULL,NULL,NULL,NULL),(9,'23','水电费','史蒂夫','sdf','sdf',NULL,NULL,NULL,NULL),(10,'test1','修改1','史蒂夫','sdf','sdf',NULL,NULL,NULL,NULL),(11,'sdf','sdf','sdf','sdf','sdf',NULL,NULL,NULL,NULL),(12,'','','','','',NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
