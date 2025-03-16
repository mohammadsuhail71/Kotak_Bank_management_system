-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: Kotak_Bank_mysql
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `account_number` varchar(20) NOT NULL,
  `customer_id` int NOT NULL,
  `account_type` enum('Savings','Current','FD') NOT NULL,
  `balance` decimal(15,2) DEFAULT '0.00',
  `branch_id` int DEFAULT NULL,
  `opened_date` date NOT NULL,
  PRIMARY KEY (`account_number`),
  KEY `customer_id` (`customer_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('KOTAK123456',1,'Savings',50000.00,1,'2020-01-15'),('KOTAK123457',2,'Current',120000.00,NULL,'2021-05-20'),('KOTAK123458',3,'FD',200000.00,3,'2022-03-10'),('KOTAK123459',4,'Savings',75000.00,4,'2019-11-25'),('KOTAK123460',5,'Current',90000.00,NULL,'2020-08-14'),('KOTAK123461',6,'Savings',30000.00,6,'2021-07-30'),('KOTAK123462',7,'FD',150000.00,7,'2022-02-05'),('KOTAK123463',8,'Savings',60000.00,8,'2020-09-12'),('KOTAK123464',9,'Current',180000.00,NULL,'2019-04-18'),('KOTAK123465',10,'Savings',45000.00,10,'2021-12-01'),('KOTAK123466',11,'FD',250000.00,11,'2022-06-15'),('KOTAK123467',12,'Savings',55000.00,12,'2020-03-22'),('KOTAK123468',13,'Current',80000.00,NULL,'2021-08-10'),('KOTAK123469',14,'Savings',35000.00,14,'2019-10-05'),('KOTAK123470',15,'FD',300000.00,15,'2022-04-20'),('KOTAK123471',16,'Savings',70000.00,16,'2020-11-15'),('KOTAK123472',17,'Current',95000.00,NULL,'2021-09-25'),('KOTAK123473',18,'Savings',40000.00,18,'2019-06-30'),('KOTAK123474',19,'FD',175000.00,19,'2022-07-05'),('KOTAK123475',20,'Savings',48000.00,20,'2020-12-12');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'Kotak Mumbai Main','Mumbai'),(2,'Kotak Delhi Central','Delhi'),(3,'Kotak Bangalore Tech','Bangalore'),(4,'Kotak Hyderabad City','Hyderabad'),(5,'Kotak Chennai Coast','Chennai'),(6,'Kotak Kolkata East','Kolkata'),(7,'Kotak Pune West','Pune'),(8,'Kotak Ahmedabad North','Ahmedabad'),(9,'Kotak Jaipur Heritage','Jaipur'),(10,'Kotak Lucknow Central','Lucknow'),(11,'Kotak Chandigarh Sector 17','Chandigarh'),(12,'Kotak Bhopal Lakeview','Bhopal'),(13,'Kotak Surat Diamond','Surat'),(14,'Kotak Nagpur Orange','Nagpur'),(15,'Kotak Indore Trade','Indore'),(16,'Kotak Patna Historic','Patna'),(17,'Kotak Coimbatore Textile','Coimbatore'),(18,'Kotak Vizag Port','Visakhapatnam'),(19,'Kotak Thane Suburban','Thane'),(20,'Kotak Agra Taj','Agra');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `alt_phone` varchar(15) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Rahul','Kumar','Sharma','rahul@example.com','9876543210',NULL,'Mumbai'),(2,'Priya',NULL,'Patel','priya@example.com','9876543211','9876543212','Delhi'),(3,'Amit','Ramesh','Verma','amit@example.com','9876543213',NULL,'Bangalore'),(4,'Sneha',NULL,'Singh','sneha@example.com','9876543214',NULL,'Hyderabad'),(5,'Vikram','Raj','Gupta','vikram@example.com','9876543215','9876543216','Chennai'),(6,'Anjali','Priya','Mehta','anjali@example.com','9876543217',NULL,'Kolkata'),(7,'Ravi',NULL,'Joshi','ravi@example.com','9876543218','9876543219','Pune'),(8,'Neha','Sunil','Malhotra','neha@example.com','9876543220',NULL,'Ahmedabad'),(9,'Sanjay',NULL,'Reddy','sanjay@example.com','9876543221',NULL,'Jaipur'),(10,'Pooja','Anil','Desai','pooja@example.com','9876543222','9876543223','Lucknow'),(11,'Arun',NULL,'Iyer','arun@example.com','9876543224',NULL,'Chandigarh'),(12,'Kavita','Vijay','Rao','kavita@example.com','9876543225','9876543226','Bhopal'),(13,'Rajesh',NULL,'Thakur','rajesh@example.com','9876543227',NULL,'Surat'),(14,'Swati','Mohan','Chopra','swati@example.com','9876543228','9876543229','Nagpur'),(15,'Alok',NULL,'Bansal','alok@example.com','9876543230',NULL,'Indore'),(16,'Meera','Prakash','Srivastava','meera@example.com','9876543231','9876543232','Patna'),(17,'Vivek',NULL,'Dubey','vivek@example.com','9876543233',NULL,'Coimbatore'),(18,'Anita','Suresh','Shukla','anita@example.com','9876543234','9876543235','Visakhapatnam'),(19,'Rohan',NULL,'Gandhi','rohan@example.com','9876543236',NULL,'Thane'),(20,'Divya','Rajat','Sinha','divya@example.com','9876543237','9876543238','Agra');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `branch_id` int DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Aarav','Shah',1,'Manager',75000.00,'2018-01-15'),(2,'Isha','Patil',2,'Clerk',35000.00,'2020-03-22'),(3,'Rohan','Mehta',3,NULL,42000.00,'2019-07-10'),(4,'Priya','Singh',4,'Loan Officer',50000.00,'2021-05-05'),(5,'Vijay','Kumar',5,NULL,NULL,'2022-01-30'),(6,'Anaya','Desai',6,'Clerk',32000.00,'2020-11-12'),(7,'Karan','Joshi',7,'Manager',78000.00,'2017-09-18'),(8,'Sanya','Reddy',8,'Clerk',34000.00,'2021-08-25'),(9,'Rahul','Verma',9,NULL,45000.00,'2019-04-14'),(10,'Neha','Iyer',10,'Loan Officer',52000.00,'2020-06-09'),(11,'Arjun','Malhotra',11,'Manager',76000.00,'2018-12-01'),(12,'Mira','Gupta',12,'Clerk',33000.00,'2022-02-15'),(13,'Amit','Sharma',13,NULL,NULL,'2021-03-20'),(14,'Pooja','Rao',14,'Clerk',31000.00,'2020-07-07'),(15,'Vikram','Thakur',15,'Manager',77000.00,'2016-10-10'),(16,'Anjali','Dubey',16,NULL,48000.00,'2019-11-21'),(17,'Raj','Sinha',17,'Clerk',34000.00,'2021-09-05'),(18,'Sunita','Chopra',18,'Loan Officer',51000.00,'2020-04-18'),(19,'Alok','Bansal',19,'Manager',79000.00,'2015-08-30'),(20,'Kiran','Srivastava',20,'Clerk',32000.00,'2022-05-12');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `loan_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('Personal','Home','Car') NOT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (1,1,500000.00,'Home','Approved','2022-01-10','2027-01-10'),(2,2,200000.00,'Personal','Pending','2022-05-15',NULL),(3,3,300000.00,'Car','Approved','2022-03-20','2025-03-20'),(4,4,1000000.00,'Home','Pending','2022-07-01',NULL),(5,5,150000.00,'Personal','Rejected','2022-02-05',NULL),(6,6,400000.00,'Home','Approved','2022-04-12','2032-04-12'),(7,7,250000.00,'Car','Pending','2022-06-20',NULL),(8,8,600000.00,'Home','Approved','2022-08-15','2030-08-15'),(9,9,100000.00,'Personal','Pending','2022-09-10',NULL),(10,10,350000.00,'Car','Approved','2022-10-05','2026-10-05'),(11,11,700000.00,'Home','Pending','2022-11-20',NULL),(12,12,180000.00,'Personal','Approved','2022-12-01','2024-12-01'),(13,13,220000.00,'Car','Rejected','2023-01-15',NULL),(14,14,800000.00,'Home','Approved','2023-02-10','2033-02-10'),(15,15,120000.00,'Personal','Pending','2023-03-05',NULL),(16,16,450000.00,'Car','Approved','2023-04-20','2028-04-20'),(17,17,950000.00,'Home','Pending','2023-05-12',NULL),(18,18,160000.00,'Personal','Approved','2023-06-01','2025-06-01'),(19,19,280000.00,'Car','Pending','2023-07-10',NULL),(20,20,550000.00,'Home','Approved','2023-08-05','2035-08-05');
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `account_number` varchar(20) NOT NULL,
  `type` enum('Deposit','Withdrawal','Transfer') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `related_account` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `account_number` (`account_number`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_number`) REFERENCES `accounts` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'KOTAK123456','Deposit',10000.00,'2025-03-16 10:52:52',NULL),(2,'KOTAK123457','Withdrawal',5000.00,'2025-03-16 10:52:52',NULL),(3,'KOTAK123458','Transfer',20000.00,'2025-03-16 10:52:52','KOTAK123456'),(4,'KOTAK123459','Deposit',15000.00,'2025-03-16 10:52:52',NULL),(5,'KOTAK123460','Transfer',10000.00,'2025-03-16 10:52:52','KOTAK123457'),(6,'KOTAK123461','Withdrawal',3000.00,'2025-03-16 10:52:52',NULL),(7,'KOTAK123462','Deposit',50000.00,'2025-03-16 10:52:52',NULL),(8,'KOTAK123463','Transfer',12000.00,'2025-03-16 10:52:52','KOTAK123460'),(9,'KOTAK123464','Withdrawal',8000.00,'2025-03-16 10:52:52',NULL),(10,'KOTAK123465','Deposit',7000.00,'2025-03-16 10:52:52',NULL),(11,'KOTAK123466','Transfer',25000.00,'2025-03-16 10:52:52','KOTAK123462'),(12,'KOTAK123467','Withdrawal',4500.00,'2025-03-16 10:52:52',NULL),(13,'KOTAK123468','Deposit',9000.00,'2025-03-16 10:52:52',NULL),(14,'KOTAK123469','Transfer',6000.00,'2025-03-16 10:52:52','KOTAK123465'),(15,'KOTAK123470','Withdrawal',10000.00,'2025-03-16 10:52:52',NULL),(16,'KOTAK123471','Deposit',12000.00,'2025-03-16 10:52:52',NULL),(17,'KOTAK123472','Transfer',15000.00,'2025-03-16 10:52:52','KOTAK123470'),(18,'KOTAK123473','Withdrawal',2000.00,'2025-03-16 10:52:52',NULL),(19,'KOTAK123474','Deposit',30000.00,'2025-03-16 10:52:52',NULL),(20,'KOTAK123475','Transfer',8000.00,'2025-03-16 10:52:52','KOTAK123473');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-16 16:59:19
