-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 203.245.44.74    Database: allintonight
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.13-MariaDB

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
-- Table structure for table `cancle`
--

DROP TABLE IF EXISTS `cancle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancle` (
  `rsno` int(11) DEFAULT NULL,
  `refund_price` int(11) DEFAULT NULL,
  `pay_name` varchar(20) DEFAULT NULL,
  `cancle_date` date DEFAULT NULL,
  `cancled` char(1) DEFAULT 'n',
  `cancleOk_date` date DEFAULT NULL,
  `rname` varchar(20) DEFAULT NULL,
  `rphone` varchar(20) DEFAULT NULL,
  KEY `rsno` (`rsno`),
  CONSTRAINT `cancle_ibfk_1` FOREIGN KEY (`rsno`) REFERENCES `reservation` (`rsno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancle`
--

LOCK TABLES `cancle` WRITE;
/*!40000 ALTER TABLE `cancle` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `mno` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(12) NOT NULL,
  `password` varchar(12) NOT NULL,
  `name` varchar(12) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`mno`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'admin','admin123','관리자','admin@naver.com','010-0000-0000'),(2,'aaa','aaa','홍길동','aaa@aaa.aaa','010-1234-5678'),(3,'bbb','bbb','성춘향','bbb@bbb.bbb','010-1234-5679'),(4,' hong123','12345','홍길동','hong@gmail.com','010-2222-3333'),(5,'ddd','1234',' dddd','fff@ddd.fff','010-0000-0222'),(6,'jisu','jisu111','지수','jisu@aaa.bbb','010-1234-5788'),(7,'test11','1234','테스트','test@ttt.com','010-2222-2222'),(8,'lee121','1234','이순자','lee@naver.com','010-2222-3877'),(9,'dddff','1234','연습','ddd@naver.com','010-9992-3333'),(10,'hong11','hong1234','홍홍홍','hong@naver.com','010-2222-2222'),(11,'regi','regi','가입','bb@naver.com','010-9999-9999'),(12,'ffff','fff','김ㅇㅇ','mmm@gmail.com','010-0000-0222'),(13,'kor','kor','이몽룡','a@a.co.kr','1'),(14,'seran','1234','seran','limowl@naver.com','010-1234-5678'),(15,'wonwon','1234','백수원','suwon11@naver.com','010-2222-3333'),(16,'team1','team1','이순신','korea@naver.com','010-1234-5678'),(17,'korea','12345','장영실','zys@naver.com','010'),(18,'bangjiye','wldP','방지예','b@g.com','010-1234-5678');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(3000) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'ff','11','11','11','2020-10-10 00:00:00');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay`
--

DROP TABLE IF EXISTS `pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay` (
  `rsno` int(11) DEFAULT NULL,
  `paid_amount` int(11) DEFAULT NULL,
  `pay_name` varchar(20) DEFAULT NULL,
  `imp_uid` varchar(30) DEFAULT NULL,
  `apply_num` varchar(30) DEFAULT NULL,
  `bank_name` varchar(30) DEFAULT NULL,
  `bank_num` varchar(30) DEFAULT NULL,
  `pay_method` char(1) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  KEY `pay` (`rsno`),
  CONSTRAINT `pay` FOREIGN KEY (`rsno`) REFERENCES `reservation` (`rsno`) ON DELETE CASCADE,
  CONSTRAINT `pay_ibfk_1` FOREIGN KEY (`rsno`) REFERENCES `reservation` (`rsno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay`
--

LOCK TABLES `pay` WRITE;
/*!40000 ALTER TABLE `pay` DISABLE KEYS */;
INSERT INTO `pay` VALUES (10062,100000,'변사또',NULL,NULL,'국민은행','112-111-15243988','m',NULL),(10063,100000,'성춘향',NULL,NULL,'외환은행','112-211-152439','m','2020-10-20'),(10064,240000,'최진사',NULL,NULL,'농협중앙회','112-8624863-2','m',NULL),(10065,100,'null','imp_747959205572','test_apply_num',NULL,NULL,'c','2020-10-20'),(10066,100,'null','imp_175360219478','test_apply_num',NULL,NULL,'c','2020-10-20'),(10067,100,'null','imp_146955266349','test_apply_num',NULL,NULL,'c','2020-10-21'),(10068,200000,'최진사',NULL,NULL,'새마을금고','112-042589-011','m','2020-10-21'),(10069,140000,'쭈연',NULL,NULL,'우리은행','111-222','m',NULL),(10070,100,'null','imp_480728290243','test_apply_num',NULL,NULL,'c','2020-10-21'),(10071,200000,'이순신',NULL,NULL,'우리은행','111-222-333-1','m',NULL);
/*!40000 ALTER TABLE `pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(3000) DEFAULT NULL,
  `upload_file` varchar(150) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'박민기','1234','aaa@aaa','안녕하세요','테슬라짱!!','moedelY.jpg','2020-10-20 14:56:40'),(2,'홍길동','1234','aaa@qwe','아버지를 아버지라','어머니를 어머니라부르지 못하고','common.jpeg','2020-10-20 14:57:34'),(3,'수원','111','suwon@naver.com','안녕','안녕',NULL,'2020-10-20 14:57:37'),(4,'제니','111','jj@naver.com ',' 뚜룹','뚜룹',NULL,'2020-10-20 14:58:03'),(5,'김구','1234','aaa@aaa','이정재는 밀정이다','밀정이다','google.png','2020-10-20 14:58:09'),(6,'지수','1111','jisu@naver.com','jiji','지지',NULL,'2020-10-20 14:58:26'),(7,'장첸','1234','aaa@aaa','1억은너무 적소','5억은 받아야겠소','moedelS.jpg','2020-10-20 14:58:45'),(8,'네번째','4444','222@naver.com','사번','사번',NULL,'2020-10-20 14:58:49'),(9,'오번','5555','555@naver.com','hoho','오오오',NULL,'2020-10-20 14:59:13'),(10,'도민호','1234','3333@qaaa','여기 좋아보여요','ㅂㅂㅂㅂㅂㅂ','moedelX.jpg','2020-10-20 14:59:25'),(11,'나그네','1234','naswing@naver.com','여행','역시 TEAM1 숙소 명성대로 예쁘네요!\r\n다음 번에도 꼭 방문하고 싶습니다.\r\n\r\n','family.jpg','2020-10-20 15:00:57'),(12,'레모네이드','1234','LEMON','','식도락입니다~~\r\n\r\n너무 맛있었어요 ~~','food.jpg','2020-10-20 15:05:52'),(13,'2345','2345','','dd\'','33',NULL,'2020-10-20 15:05:21'),(14,'이순신','1234','abc@naver.com','여행후기','좋은여행이였습니다~!','review01-3.jpg','2020-10-21 09:43:16'),(15,'1234','1234','1234','1234','1234','IMG_0137.JPG','2020-10-21 12:32:31');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_comment`
--

DROP TABLE IF EXISTS `post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_comment` (
  `cno` int(11) NOT NULL,
  `no` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `comment` varchar(2000) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_comment`
--

LOCK TABLES `post_comment` WRITE;
/*!40000 ALTER TABLE `post_comment` DISABLE KEYS */;
INSERT INTO `post_comment` VALUES (1,11,'seran','1234','1234','2020-10-20 15:04:21'),(2,14,'임영웅','1234','좋은후기 감사합니다','2020-10-21 09:43:45'),(3,15,'1234','1234','1234','2020-10-21 12:33:24');
/*!40000 ALTER TABLE `post_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qna` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(12) NOT NULL,
  `password` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `content` varchar(4000) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `secret` int(10) DEFAULT NULL,
  `comment` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,'질문','1111','qq@naver.com','얼마','얼마입니까','2020-10-20 14:59:46',1,NULL),(2,'박민기','1234','aaa@qwe','문의드려요','여기는 어디죠?','2020-10-20 14:59:53',0,'글쎄여'),(3,'입니까','1212','www@naver.com','입니까','얼마예요 ?','2020-10-20 15:00:08',0,NULL),(4,'홍길동','1234','qaaa2@aaa2','가격이 궁금해요','얼마죠?','2020-10-20 15:00:16',1,NULL),(5,'문의글','1212','fff@naver.com','문의','문의합니다','2020-10-20 15:00:28',0,NULL),(6,'김구','1234','aaa@aaa','궁금한게 많아요','너무 많아요','2020-10-20 15:00:46',0,NULL),(7,'익명','1212','sss@naver.com','익명글','익명','2020-10-20 15:00:48',0,NULL),(8,'홍길순','1234','aaa@qwe','문의 남깁니다','여기는 어디죠?','2020-10-20 15:01:08',1,NULL),(9,'익명입니다','222','sss','sss','익명','2020-10-20 15:01:12',0,'ㅎㅎㅎ'),(10,'도민호','1234','aaaa2@awqe','문의드려요!!!eqwe','문의드립니다','2020-10-20 15:01:29',0,'반갑습니당.'),(11,'여행자','1234','lili','혹시 달방 가능한가요?','								안녕~~\r\n							','2020-10-20 15:24:30',0,NULL),(12,'이순신','1234','abc@naver.com','질문드립니다','애견동반 가능한가요?','2020-10-21 09:44:48',1,'애견동반 가능합니다\r\n즐거운 여행 되세요~^^');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `rsno` int(11) NOT NULL AUTO_INCREMENT,
  `mno` int(11) DEFAULT NULL,
  `rno` int(11) DEFAULT NULL,
  `rname` varchar(11) DEFAULT NULL,
  `remail` varchar(20) DEFAULT NULL,
  `rphone` varchar(20) DEFAULT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `usemen` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `pay_ment` char(1) DEFAULT NULL,
  `paid` char(1) DEFAULT NULL,
  `pay_name` varchar(11) DEFAULT NULL,
  `res_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rsno`),
  KEY `mno` (`mno`),
  KEY `rno` (`rno`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`mno`) REFERENCES `member` (`mno`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`rno`) REFERENCES `room` (`rno`)
) ENGINE=InnoDB AUTO_INCREMENT=10073 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (10061,NULL,2,'ㄱㄱㄱ','ttt@naver.com','010-000-0000','2020-10-24','2020-10-25',2,10000,'m','y','','2020-10-20 07:27:55'),(10062,NULL,1,'변사또','aaa@aaa.co.kr','010-1234-5678','2020-10-21','2020-10-22',1,100000,'m','y','변사또','2020-10-20 08:05:04'),(10063,NULL,1,'성춘향','aaa@aaa.co.kr','010-1234-5678','2020-10-22','2020-10-22',1,100000,'m','y','성춘향','2020-10-20 08:54:44'),(10064,2,4,'홍길동','aaa@aaa.aaa','010-1234-5678','2020-10-21','2020-10-23',4,240000,'m','y','최진사','2020-10-20 09:25:05'),(10065,NULL,3,'aa','121@naver.com','000-0000-0000','2020-10-22','2020-10-23',1,200000,'c','y','null','2020-10-20 10:50:00'),(10066,NULL,1,'익명','ik@commm.ca','010-0002-2222','2020-10-29','2020-10-30',1,100000,'c','y','null','2020-10-20 11:29:56'),(10067,2,4,'홍길동','aaa@aaa.aaa','010-1234-5678','2020-10-23','2020-10-25',1,220000,'c','y','null','2020-10-20 23:53:33'),(10068,2,3,'홍길동','aaa@aaa.aaa','010-1234-5678','2020-10-23','2020-10-24',1,200000,'m','y','최진사','2020-10-21 00:51:59'),(10069,2,2,'홍길동','aaa@aaa.aaa','010-1234-5678','2020-10-30','2020-10-31',1,140000,'m','y','쭈연','2020-10-21 00:47:13'),(10070,16,4,'이순신','korea@naver.com','010-1234-5678','2020-10-30','2020-10-31',1,240000,'c','y','null','2020-10-21 00:40:15'),(10071,16,3,'이순신','korea@naver.com','010-1234-5678','2020-10-29','2020-10-30',1,200000,'m','y','이순신','2020-10-21 00:47:04');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `rno` int(11) NOT NULL,
  `rname` varchar(20) NOT NULL,
  `men` int(11) DEFAULT NULL,
  `weekday` int(11) DEFAULT NULL,
  `weekend` int(11) DEFAULT NULL,
  `sweekday` int(11) DEFAULT NULL,
  PRIMARY KEY (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'혼자방',1,100000,150000,200000),(2,'같이방',2,100000,150000,200000),(3,'가족방',4,200000,250000,300000),(4,'서브펜션',4,200000,250000,300000);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-02 14:26:34
