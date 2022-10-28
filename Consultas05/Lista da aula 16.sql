CREATE DATABASE  IF NOT EXISTS `pokemon` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pokemon`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: pokemon
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `habilidade`
--

DROP TABLE IF EXISTS `habilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habilidade` (
  `idHabilidade` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `força` int(11) DEFAULT NULL,
  PRIMARY KEY (`idHabilidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidade`
--

LOCK TABLES `habilidade` WRITE;
/*!40000 ALTER TABLE `habilidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `habilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidade_pokemon`
--

DROP TABLE IF EXISTS `habilidade_pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habilidade_pokemon` (
  `Habilidade_idHabilidade` int(11) NOT NULL,
  `Pokemon_idPokemon` int(11) NOT NULL,
  PRIMARY KEY (`Habilidade_idHabilidade`,`Pokemon_idPokemon`),
  KEY `fk_Habilidade_has_Pokemon_Pokemon1_idx` (`Pokemon_idPokemon`),
  KEY `fk_Habilidade_has_Pokemon_Habilidade_idx` (`Habilidade_idHabilidade`),
  CONSTRAINT `fk_Habilidade_has_Pokemon_Habilidade` FOREIGN KEY (`Habilidade_idHabilidade`) REFERENCES `habilidade` (`idHabilidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Habilidade_has_Pokemon_Pokemon1` FOREIGN KEY (`Pokemon_idPokemon`) REFERENCES `pokemon` (`idPokemon`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidade_pokemon`
--

LOCK TABLES `habilidade_pokemon` WRITE;
/*!40000 ALTER TABLE `habilidade_pokemon` DISABLE KEYS */;
/*!40000 ALTER TABLE `habilidade_pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `idItem` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `descrição` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_treinador`
--

DROP TABLE IF EXISTS `item_treinador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_treinador` (
  `Treinador_idTreinador` int(11) NOT NULL,
  `Item_idItem` int(11) NOT NULL,
  PRIMARY KEY (`Treinador_idTreinador`,`Item_idItem`),
  KEY `fk_Treinador_has_Item_Item1_idx` (`Item_idItem`),
  KEY `fk_Treinador_has_Item_Treinador1_idx` (`Treinador_idTreinador`),
  CONSTRAINT `fk_Treinador_has_Item_Item1` FOREIGN KEY (`Item_idItem`) REFERENCES `item` (`idItem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Treinador_has_Item_Treinador1` FOREIGN KEY (`Treinador_idTreinador`) REFERENCES `treinador` (`idTreinador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_treinador`
--

LOCK TABLES `item_treinador` WRITE;
/*!40000 ALTER TABLE `item_treinador` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_treinador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon` (
  `idPokemon` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPokemon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_treinador`
--

DROP TABLE IF EXISTS `pokemon_treinador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_treinador` (
  `Pokemon_idPokemon` int(11) NOT NULL,
  `Treinador_idTreinador` int(11) NOT NULL,
  PRIMARY KEY (`Pokemon_idPokemon`,`Treinador_idTreinador`),
  KEY `fk_Pokemon_has_Treinador_Treinador1_idx` (`Treinador_idTreinador`),
  KEY `fk_Pokemon_has_Treinador_Pokemon1_idx` (`Pokemon_idPokemon`),
  CONSTRAINT `fk_Pokemon_has_Treinador_Pokemon1` FOREIGN KEY (`Pokemon_idPokemon`) REFERENCES `pokemon` (`idPokemon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pokemon_has_Treinador_Treinador1` FOREIGN KEY (`Treinador_idTreinador`) REFERENCES `treinador` (`idTreinador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_treinador`
--

LOCK TABLES `pokemon_treinador` WRITE;
/*!40000 ALTER TABLE `pokemon_treinador` DISABLE KEYS */;
/*!40000 ALTER TABLE `pokemon_treinador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treinador`
--

DROP TABLE IF EXISTS `treinador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treinador` (
  `idTreinador` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTreinador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treinador`
--

LOCK TABLES `treinador` WRITE;
/*!40000 ALTER TABLE `treinador` DISABLE KEYS */;
/*!40000 ALTER TABLE `treinador` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-25 20:34:45
