-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: master_floor
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `partner`
--

DROP TABLE IF EXISTS `partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner` (
  `id_partner` int NOT NULL AUTO_INCREMENT,
  `id_type_partner` int NOT NULL,
  `name_partner` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `patronymic` varchar(100) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `address` longtext NOT NULL,
  `INN` varchar(10) NOT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`id_partner`),
  KEY `id_type_partner_idx` (`id_type_partner`),
  CONSTRAINT `id_type_partner` FOREIGN KEY (`id_type_partner`) REFERENCES `type_partner` (`id_type_partner`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner`
--

LOCK TABLES `partner` WRITE;
/*!40000 ALTER TABLE `partner` DISABLE KEYS */;
INSERT INTO `partner` VALUES (1,1,'База Строитель','Иванова','Александра','Ивановна','aleksandraivanova@ml.ru','493 123 45 67','652050, Кемеровская область, город Юрга, ул. Лесная, 15','2222455179',7),(2,2,'Паркет 29','Петров','Василий','Петрович','vppetrov@vl.ru','987 123 56 78','164500, Архангельская область, город Северодвинск, ул. Строителей, 18','3333888520',7),(3,3,'Стройсервис','Соловьев','Андрей','Николаевич','ansolovev@st.ru','812 223 32 00','188910, Ленинградская область, город Приморск, ул. Парковая, 21','4440391035',7),(4,4,'Ремонт и отделка','Воробьева','Екатерина','Валерьевна','ekaterina.vorobeva@ml.ru','444 222 33 11','143960, Московская область, город Реутов, ул. Свободы, 51','1111520857',5),(5,1,'МонтажПро','Степанов','Степан','Сергеевич','stepanov@stepan.ru','912 888 33 33','309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122','5552431140',10);
/*!40000 ALTER TABLE `partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_product`
--

DROP TABLE IF EXISTS `partner_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_product` (
  `id_product` int NOT NULL,
  `id_partner` int NOT NULL,
  `count` int NOT NULL,
  `date_sale` date NOT NULL,
  PRIMARY KEY (`id_product`,`id_partner`),
  KEY `id_partner_fk_idx` (`id_partner`),
  CONSTRAINT `id_partner_fk` FOREIGN KEY (`id_partner`) REFERENCES `partner` (`id_partner`),
  CONSTRAINT `id_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_product`
--

LOCK TABLES `partner_product` WRITE;
/*!40000 ALTER TABLE `partner_product` DISABLE KEYS */;
INSERT INTO `partner_product` VALUES (5012543,2,1250,'2023-05-17'),(5012543,4,4500,'2024-05-14'),(7028748,1,37400,'2024-06-07'),(7028748,4,59050,'2023-03-20'),(7028748,5,670000,'2023-11-10'),(7750282,1,12350,'2023-12-18'),(7750282,2,1000,'2024-06-07'),(7750282,4,37200,'2024-03-12'),(7750282,5,50000,'2023-09-19'),(8758385,1,15500,'2023-03-23'),(8758385,2,7550,'2024-07-01'),(8758385,3,7250,'2023-01-22'),(8758385,5,35000,'2024-04-15'),(8858958,2,35000,'2022-12-02'),(8858958,3,2500,'2024-07-05'),(8858958,5,25000,'2024-06-12');
/*!40000 ALTER TABLE `partner_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `id_type_product` int NOT NULL,
  `name_product` longtext NOT NULL,
  `min_price` double(8,2) NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `id_type_fk_idx` (`id_type_product`),
  CONSTRAINT `id_type_fk` FOREIGN KEY (`id_type_product`) REFERENCES `type_product` (`id_type_product`)
) ENGINE=InnoDB AUTO_INCREMENT=8858959 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (5012543,4,'Пробковое напольное клеевое покрытие 32 класс 4 мм',5450.59),(7028748,1,'Ламинат Дуб серый 32 класс 8 мм с фаской',3890.41),(7750282,1,'Ламинат Дуб дымчато-белый 33 класс 12 мм',1799.33),(8758385,3,'Паркетная доска Ясень темный однополосная 14 мм',4456.90),(8858958,3,'Инженерная доска Дуб Французская елка однополосная 12 мм',7330.99);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_partner`
--

DROP TABLE IF EXISTS `type_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_partner` (
  `id_type_partner` int NOT NULL AUTO_INCREMENT,
  `name_type_partner` varchar(45) NOT NULL,
  PRIMARY KEY (`id_type_partner`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_partner`
--

LOCK TABLES `type_partner` WRITE;
/*!40000 ALTER TABLE `type_partner` DISABLE KEYS */;
INSERT INTO `type_partner` VALUES (1,'ЗАО'),(2,'ООО'),(3,'ПАО'),(4,'ОАО');
/*!40000 ALTER TABLE `type_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_product`
--

DROP TABLE IF EXISTS `type_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_product` (
  `id_type_product` int NOT NULL AUTO_INCREMENT,
  `name_type_product` varchar(100) NOT NULL,
  `coef_type_product` double(3,2) NOT NULL,
  PRIMARY KEY (`id_type_product`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_product`
--

LOCK TABLES `type_product` WRITE;
/*!40000 ALTER TABLE `type_product` DISABLE KEYS */;
INSERT INTO `type_product` VALUES (1,'Ламинат',2.35),(2,'Массивная доска',5.15),(3,'Паркетная доска',4.34),(4,'Пробковое покрытие',1.50);
/*!40000 ALTER TABLE `type_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-07 12:19:09
