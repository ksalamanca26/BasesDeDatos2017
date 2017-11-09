CREATE DATABASE  IF NOT EXISTS `medictype` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `medictype`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: medictype
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `antecedente`
--

DROP TABLE IF EXISTS `antecedente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antecedente` (
  `idAntecedente` int(11) NOT NULL AUTO_INCREMENT,
  `idPaciente` int(11) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Tipo` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idAntecedente`,`idPaciente`),
  KEY `idpaceinteFK_idx` (`idPaciente`),
  CONSTRAINT `idpaceinteFK` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedente`
--

LOCK TABLES `antecedente` WRITE;
/*!40000 ALTER TABLE `antecedente` DISABLE KEYS */;
INSERT INTO `antecedente` VALUES (1,1,'La persona no tiene antecedentes familiares','F'),(2,2,'Reacciones alergicas desde temprana','P');
/*!40000 ALTER TABLE `antecedente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cita` (
  `idCita` int(11) NOT NULL AUTO_INCREMENT,
  `idMedico` int(11) DEFAULT NULL,
  `idPaciente` int(11) DEFAULT NULL,
  `Tipocita` varchar(1) DEFAULT NULL,
  `Fecha` varchar(45) DEFAULT NULL,
  `Hora` varchar(45) DEFAULT NULL,
  `Estadocita` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idCita`),
  KEY `idmedicoFK_2_idx` (`idMedico`),
  KEY `idpacienteFK_2_idx` (`idPaciente`),
  CONSTRAINT `idmedicoFK_2` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idpacienteFK_2` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (1,1,2,'N','31/10/2017','10:00am','C'),(2,2,1,'N','29/10/2017','8:00am','C');
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultorio`
--

DROP TABLE IF EXISTS `consultorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultorio` (
  `Nroconsultorio` int(11) NOT NULL AUTO_INCREMENT,
  `idMedico` int(11) DEFAULT NULL,
  `Fecha` varchar(45) NOT NULL,
  `Hora` varchar(45) NOT NULL,
  `Disponibilidad` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Nroconsultorio`,`Fecha`,`Hora`),
  KEY `idmedico_FK_idx` (`idMedico`),
  CONSTRAINT `idmedico_FK` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorio`
--

LOCK TABLES `consultorio` WRITE;
/*!40000 ALTER TABLE `consultorio` DISABLE KEYS */;
INSERT INTO `consultorio` VALUES (3,2,'Martes','7:00am-12:00','D'),(4,1,'Domingo','7:00am-12:00','D');
/*!40000 ALTER TABLE `consultorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `NroFactura` int(11) NOT NULL AUTO_INCREMENT,
  `idCita` int(11) DEFAULT NULL,
  `MontoF` int(11) DEFAULT NULL,
  `FechaF` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NroFactura`),
  KEY `idcitaFK_idx` (`idCita`),
  CONSTRAINT `idcitaFK` FOREIGN KEY (`idCita`) REFERENCES `cita` (`idCita`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,1,70000,'29/10/2017'),(2,2,70000,'31/10/2017');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamento` (
  `idMedicamento` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Equivalente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMedicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
INSERT INTO `medicamento` VALUES (1,'Aspirina','Atamel'),(2,'loratadina','desloratadina');
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico` (
  `idMedico` int(11) NOT NULL,
  `CedulaM` int(11) DEFAULT NULL,
  `PNombre` varchar(45) DEFAULT NULL,
  `SNombre` varchar(45) DEFAULT NULL,
  `PApellido` varchar(45) DEFAULT NULL,
  `SApellido` varchar(45) DEFAULT NULL,
  `Especialidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMedico`),
  UNIQUE KEY `CedulaM_UNIQUE` (`CedulaM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,12345,'Juan','Raul','Guevara','Potro','Internista'),(2,6789009,'Alicia','Lucia','Rodriguez','Alvarez','Radiologo'),(3,10456123,'Ivan','Mena','Rutriccio','Armas','Traumatologo');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `idPaciente` int(11) NOT NULL AUTO_INCREMENT,
  `CedulaP` int(11) DEFAULT NULL,
  `SeguroSocial` int(11) DEFAULT NULL,
  `PNombre` varchar(45) DEFAULT NULL,
  `SNombre` varchar(45) DEFAULT NULL,
  `PApellido` varchar(45) DEFAULT NULL,
  `SApellido` varchar(45) DEFAULT NULL,
  `Sexo` varchar(1) DEFAULT NULL,
  `TipoSangre` varchar(5) DEFAULT NULL,
  `FechaNacimiento` varchar(45) DEFAULT NULL,
  `EdoCivil` varchar(1) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPaciente`),
  UNIQUE KEY `CedulaP_UNIQUE` (`CedulaP`),
  UNIQUE KEY `SeguroSocial_UNIQUE` (`SeguroSocial`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,20123567,54321,'Alberto','Jose','Conan','Perez','M','O+','1993-03-15','S',414123456),(2,17117358,12345,'Sara','Eliana','Marcano','Halguitter','F','O-','1989-07-24','C',414876543),(3,523567,87591,'Arnaldo','Juan','Rutto','Noda','M','O+','1958-09-10','V',414927364),(4,8524891,85749,'Ivan','Jos','Rineli','Pino','M','O+','1969-03-16','C',414123456);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_informe`
--

DROP TABLE IF EXISTS `rel_informe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_informe` (
  `idInforme` int(11) NOT NULL AUTO_INCREMENT,
  `idMedico` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL,
  `idMedicamento` int(11) NOT NULL,
  `Diagnostico` varchar(45) DEFAULT NULL,
  `Instrucciones` varchar(45) DEFAULT NULL,
  `Fecha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idInforme`,`idMedico`,`idPaciente`,`idMedicamento`),
  KEY `idmedicoFK_2_idx` (`idMedico`),
  KEY `idpaceinteFK_3_idx` (`idPaciente`),
  KEY `idmedicamentoFk_idx` (`idMedicamento`),
  CONSTRAINT `idmedicamentoFk` FOREIGN KEY (`idMedicamento`) REFERENCES `medicamento` (`idMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idmedicoFK_3` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idpaceinteFK_3` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_informe`
--

LOCK TABLES `rel_informe` WRITE;
/*!40000 ALTER TABLE `rel_informe` DISABLE KEYS */;
INSERT INTO `rel_informe` VALUES (1,1,2,2,'Paciente con fuertes reacciones alergicas..','Tomar el antialergico cada 8 horas','31/10/2017'),(2,2,1,1,'Paciente con fuertes dolores de cabeza...','Tomar la pastilla cada 12 horas y reposo','29/10/2017');
/*!40000 ALTER TABLE `rel_informe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sintoma`
--

DROP TABLE IF EXISTS `sintoma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sintoma` (
  `idInforme` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idInforme`,`Nombre`),
  CONSTRAINT `idinformeFK` FOREIGN KEY (`idInforme`) REFERENCES `rel_informe` (`idInforme`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sintoma`
--

LOCK TABLES `sintoma` WRITE;
/*!40000 ALTER TABLE `sintoma` DISABLE KEYS */;
INSERT INTO `sintoma` VALUES (1,'Alergia'),(2,'Migrana');
/*!40000 ALTER TABLE `sintoma` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-31  2:27:02
