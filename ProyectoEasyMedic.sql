CREATE DATABASE  IF NOT EXISTS `easymedic` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `easymedic`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: easymedic
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
-- Table structure for table ` antecedente_inf`
--

DROP TABLE IF EXISTS ` antecedente_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE ` antecedente_inf` (
  `idAntecedente_Inf` int(11) NOT NULL AUTO_INCREMENT,
  `TipoAntecedente` varchar(10) NOT NULL,
  `NroIntervenciones` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAntecedente_Inf`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table ` antecedente_inf`
--

LOCK TABLES ` antecedente_inf` WRITE;
/*!40000 ALTER TABLE ` antecedente_inf` DISABLE KEYS */;
INSERT INTO ` antecedente_inf` VALUES (1,'P',1);
/*!40000 ALTER TABLE ` antecedente_inf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alergeno`
--

DROP TABLE IF EXISTS `alergeno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alergeno` (
  `idAlergeno` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idAlergeno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alergeno`
--

LOCK TABLES `alergeno` WRITE;
/*!40000 ALTER TABLE `alergeno` DISABLE KEYS */;
/*!40000 ALTER TABLE `alergeno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antecedente_cardiologo`
--

DROP TABLE IF EXISTS `antecedente_cardiologo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antecedente_cardiologo` (
  `idantecente` int(11) NOT NULL,
  `idinforme` int(11) NOT NULL,
  `Cigarrillos` varchar(5) NOT NULL,
  `Hipertenso` varchar(5) NOT NULL,
  `Diabetico` varchar(5) NOT NULL,
  PRIMARY KEY (`idantecente`,`idinforme`),
  KEY `informeFK_12_idx` (`idinforme`),
  CONSTRAINT `antecedenteFK_3` FOREIGN KEY (`idantecente`) REFERENCES ` antecedente_inf` (`idAntecedente_Inf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `informeFK_12` FOREIGN KEY (`idinforme`) REFERENCES `informe` (`idInforme`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedente_cardiologo`
--

LOCK TABLES `antecedente_cardiologo` WRITE;
/*!40000 ALTER TABLE `antecedente_cardiologo` DISABLE KEYS */;
/*!40000 ALTER TABLE `antecedente_cardiologo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antecedente_oftalmogologo`
--

DROP TABLE IF EXISTS `antecedente_oftalmogologo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antecedente_oftalmogologo` (
  `idantecente` int(11) NOT NULL,
  `idinforme` int(11) NOT NULL,
  `Formula` varchar(10) NOT NULL,
  `TipoLentes` varchar(10) NOT NULL,
  PRIMARY KEY (`idantecente`,`idinforme`),
  KEY `informeFK_14_idx` (`idinforme`),
  CONSTRAINT `antecedenteFK_5` FOREIGN KEY (`idantecente`) REFERENCES ` antecedente_inf` (`idAntecedente_Inf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `informeFK_14` FOREIGN KEY (`idinforme`) REFERENCES `informe` (`idInforme`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedente_oftalmogologo`
--

LOCK TABLES `antecedente_oftalmogologo` WRITE;
/*!40000 ALTER TABLE `antecedente_oftalmogologo` DISABLE KEYS */;
/*!40000 ALTER TABLE `antecedente_oftalmogologo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antecedente_pediatrico`
--

DROP TABLE IF EXISTS `antecedente_pediatrico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antecedente_pediatrico` (
  `idantecedente` int(11) NOT NULL,
  `idinforme` int(11) NOT NULL,
  `Vacuna` varchar(5) NOT NULL,
  `Asmatico` varchar(5) NOT NULL,
  PRIMARY KEY (`idantecedente`,`idinforme`),
  KEY `informeFK_13_idx` (`idinforme`),
  CONSTRAINT `antecedenteFK_4` FOREIGN KEY (`idantecedente`) REFERENCES ` antecedente_inf` (`idAntecedente_Inf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `informeFK_13` FOREIGN KEY (`idinforme`) REFERENCES `informe` (`idInforme`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedente_pediatrico`
--

LOCK TABLES `antecedente_pediatrico` WRITE;
/*!40000 ALTER TABLE `antecedente_pediatrico` DISABLE KEYS */;
/*!40000 ALTER TABLE `antecedente_pediatrico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cita` (
  `idCita` int(11) NOT NULL AUTO_INCREMENT,
  `idMedico` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL,
  `TipoCita` varchar(10) NOT NULL,
  `Hora` varchar(20) NOT NULL,
  `Fecha` date NOT NULL,
  `EstadoCita` varchar(10) NOT NULL,
  PRIMARY KEY (`idCita`),
  KEY `pacienteFK_1_idx` (`idPaciente`),
  KEY `medicoFK_3_idx` (`idMedico`),
  CONSTRAINT `medicoFK_4` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pacienteFK_1` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilidad`
--

DROP TABLE IF EXISTS `disponibilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disponibilidad` (
  `idDisponibilidad` int(11) NOT NULL AUTO_INCREMENT,
  `Dia` varchar(10) NOT NULL,
  `Hora` varchar(15) NOT NULL,
  PRIMARY KEY (`idDisponibilidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilidad`
--

LOCK TABLES `disponibilidad` WRITE;
/*!40000 ALTER TABLE `disponibilidad` DISABLE KEYS */;
INSERT INTO `disponibilidad` VALUES (3,'Lunes','8:30am - 4:00pm');
/*!40000 ALTER TABLE `disponibilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedad`
--

DROP TABLE IF EXISTS `enfermedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedad` (
  `idEnfermedad` int(11) NOT NULL AUTO_INCREMENT,
  `NombreE` varchar(45) NOT NULL,
  PRIMARY KEY (`idEnfermedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedad`
--

LOCK TABLES `enfermedad` WRITE;
/*!40000 ALTER TABLE `enfermedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidad` (
  `idespecialidad` int(11) NOT NULL AUTO_INCREMENT,
  `Especialidad` varchar(45) NOT NULL,
  PRIMARY KEY (`idespecialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `NroFactura` int(11) NOT NULL AUTO_INCREMENT,
  `idCita` int(11) NOT NULL,
  `FechaF` date NOT NULL,
  `MontoF` int(11) NOT NULL,
  PRIMARY KEY (`NroFactura`),
  KEY `citaFK_idx` (`idCita`),
  CONSTRAINT `citaFK` FOREIGN KEY (`idCita`) REFERENCES `cita` (`idCita`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_cardiologico`
--

DROP TABLE IF EXISTS `i_cardiologico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_cardiologico` (
  `idInforme` int(11) NOT NULL,
  `idmedico` int(11) NOT NULL,
  `PresionArterial` varchar(45) NOT NULL,
  `Pulso` varchar(45) NOT NULL,
  PRIMARY KEY (`idInforme`,`idmedico`),
  KEY `informeFK_2_idx` (`idInforme`),
  KEY `medicoFK_10_idx` (`idmedico`),
  CONSTRAINT `informeFK_5` FOREIGN KEY (`idInforme`) REFERENCES `informe` (`idInforme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `medicoFK_10` FOREIGN KEY (`idmedico`) REFERENCES `medico` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_cardiologico`
--

LOCK TABLES `i_cardiologico` WRITE;
/*!40000 ALTER TABLE `i_cardiologico` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_cardiologico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_oftalmologo`
--

DROP TABLE IF EXISTS `i_oftalmologo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_oftalmologo` (
  `idInforme` int(11) NOT NULL,
  `idmedico` int(11) NOT NULL,
  `Grado_vision` varchar(45) NOT NULL,
  `Presion_intraocular` varchar(45) NOT NULL,
  PRIMARY KEY (`idInforme`,`idmedico`),
  KEY `medicoFK_11_idx` (`idmedico`),
  CONSTRAINT `informeFK_4` FOREIGN KEY (`idInforme`) REFERENCES `informe` (`idInforme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `medicoFK_11` FOREIGN KEY (`idmedico`) REFERENCES `medico` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_oftalmologo`
--

LOCK TABLES `i_oftalmologo` WRITE;
/*!40000 ALTER TABLE `i_oftalmologo` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_oftalmologo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_pediatra`
--

DROP TABLE IF EXISTS `i_pediatra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i_pediatra` (
  `idinforme` int(11) NOT NULL,
  `idmedico` int(11) NOT NULL,
  `Peso` int(11) NOT NULL,
  `Altura` int(11) NOT NULL,
  PRIMARY KEY (`idinforme`,`idmedico`),
  KEY `medicoFK_idx` (`idmedico`),
  CONSTRAINT `informeFK_9` FOREIGN KEY (`idinforme`) REFERENCES `informe` (`idInforme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `medicoFK_9` FOREIGN KEY (`idmedico`) REFERENCES `medico` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_pediatra`
--

LOCK TABLES `i_pediatra` WRITE;
/*!40000 ALTER TABLE `i_pediatra` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_pediatra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informe`
--

DROP TABLE IF EXISTS `informe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informe` (
  `idInforme` int(11) NOT NULL AUTO_INCREMENT,
  `idPaciente` int(11) NOT NULL,
  `Sintoma` varchar(45) DEFAULT NULL,
  `Diagnostico` varchar(45) NOT NULL,
  `Instruccion` varchar(45) DEFAULT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`idInforme`),
  KEY `pacienteFK_2_idx` (`idPaciente`),
  CONSTRAINT `pacienteFK_2` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informe`
--

LOCK TABLES `informe` WRITE;
/*!40000 ALTER TABLE `informe` DISABLE KEYS */;
INSERT INTO `informe` VALUES (1,1,'Dolor de cabeza','Paciente con difteria','Echarse crema antes de dormir','2017-11-12');
/*!40000 ALTER TABLE `informe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamento` (
  `idMedicamento` int(11) NOT NULL AUTO_INCREMENT,
  `NombreM` varchar(45) NOT NULL,
  `Equivalente` varchar(45) NOT NULL,
  PRIMARY KEY (`idMedicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico` (
  `idPersona` int(11) NOT NULL,
  `idMedico` int(11) NOT NULL AUTO_INCREMENT,
  `CarnetMedico` int(11) NOT NULL,
  `Especialidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMedico`),
  UNIQUE KEY `CarnetMedico_UNIQUE` (`CarnetMedico`),
  KEY `personaFK_2_idx` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (2,1,74829267,NULL),(9,2,8737182,NULL);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `idPersona` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoSangre` int(11) NOT NULL,
  `SeguroSocial` int(11) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `LugarNacimiento` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `EdoCivil` varchar(10) NOT NULL,
  PRIMARY KEY (`idPaciente`),
  KEY `persona_FK1_idx` (`idPersona`),
  KEY `tiposangreFK_idx` (`idTipoSangre`),
  CONSTRAINT `persona_FK1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tiposangreFK` FOREIGN KEY (`idTipoSangre`) REFERENCES `tiposangre` (`idTipoSangre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,1,1,653821,'1996-11-26','Caracas','Terrazas del Avila','S'),(18,2,1,5125651,'1960-08-15','Caracas','Las Mercedes','S'),(19,3,2,9876543,'1993-11-11','Su Casa','La Casona','S'),(20,4,2,7474743,'2017-11-12','Mi casa tambien','Mi casa','S');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula` int(11) NOT NULL,
  `PNombre` varchar(45) NOT NULL,
  `SNombre` varchar(45) NOT NULL,
  `PApellido` varchar(45) NOT NULL,
  `SApellido` varchar(45) NOT NULL,
  `Sexo` varchar(45) NOT NULL,
  PRIMARY KEY (`idPersona`),
  UNIQUE KEY `CedulaP_UNIQUE` (`Cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,25504187,'Kevin','Eduardo','Salamanca','Gonzalez','M'),(9,13958754,'Nathan','Gampel','100%','Activo','M'),(11,20123567,'Rafael','Mainframe','Matienzo','IBM','M'),(14,5963672,'Alejandro','Carlos','Troncone','Herrera','M'),(15,523567,'Freddy','Jorge','Guevara','Ramos','M'),(18,4124141,'Maria','Pilar','Cuenca','ER','F'),(19,742258,'Pablo','Perez','Paco','Pedro','M'),(20,9494949,'Funciona','Por favor','Please','Bitte','M');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_antecedente_alergeno`
--

DROP TABLE IF EXISTS `rel_antecedente_alergeno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_antecedente_alergeno` (
  `idAntecedente` int(11) NOT NULL,
  `idAlergeno` int(11) NOT NULL,
  PRIMARY KEY (`idAntecedente`,`idAlergeno`),
  KEY `alergenoFK_idx` (`idAlergeno`),
  CONSTRAINT `alergenoFK` FOREIGN KEY (`idAlergeno`) REFERENCES `alergeno` (`idAlergeno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `antecedenteFK_2` FOREIGN KEY (`idAntecedente`) REFERENCES ` antecedente_inf` (`idAntecedente_Inf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_antecedente_alergeno`
--

LOCK TABLES `rel_antecedente_alergeno` WRITE;
/*!40000 ALTER TABLE `rel_antecedente_alergeno` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_antecedente_alergeno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_inf_endermedad`
--

DROP TABLE IF EXISTS `rel_inf_endermedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_inf_endermedad` (
  `idInforme` int(11) NOT NULL,
  `idEnfermedad` int(11) NOT NULL,
  PRIMARY KEY (`idInforme`,`idEnfermedad`),
  KEY `enfermedadFK_idx` (`idEnfermedad`),
  CONSTRAINT `enfermedadFK` FOREIGN KEY (`idEnfermedad`) REFERENCES `enfermedad` (`idEnfermedad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `informeFK_2` FOREIGN KEY (`idInforme`) REFERENCES `informe` (`idInforme`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_inf_endermedad`
--

LOCK TABLES `rel_inf_endermedad` WRITE;
/*!40000 ALTER TABLE `rel_inf_endermedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_inf_endermedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_inf_medicamento`
--

DROP TABLE IF EXISTS `rel_inf_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_inf_medicamento` (
  `idInforme` int(11) NOT NULL,
  `idMedicamento` int(11) NOT NULL,
  PRIMARY KEY (`idInforme`,`idMedicamento`),
  KEY `medicamentoFK_idx` (`idMedicamento`),
  CONSTRAINT `informeFK` FOREIGN KEY (`idInforme`) REFERENCES `informe` (`idInforme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `medicamentoFK` FOREIGN KEY (`idMedicamento`) REFERENCES `medicamento` (`idMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_inf_medicamento`
--

LOCK TABLES `rel_inf_medicamento` WRITE;
/*!40000 ALTER TABLE `rel_inf_medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_inf_medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacionmed_disp`
--

DROP TABLE IF EXISTS `relacionmed_disp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacionmed_disp` (
  `idMedico` int(11) NOT NULL,
  `idDisponibilidad` int(11) NOT NULL,
  PRIMARY KEY (`idMedico`,`idDisponibilidad`),
  KEY `disponibilidadFK_idx` (`idDisponibilidad`),
  CONSTRAINT `disponibilidadFK` FOREIGN KEY (`idDisponibilidad`) REFERENCES `disponibilidad` (`idDisponibilidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `medicoFK` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacionmed_disp`
--

LOCK TABLES `relacionmed_disp` WRITE;
/*!40000 ALTER TABLE `relacionmed_disp` DISABLE KEYS */;
INSERT INTO `relacionmed_disp` VALUES (2,3);
/*!40000 ALTER TABLE `relacionmed_disp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_paciente`
--

DROP TABLE IF EXISTS `telefono_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefono_paciente` (
  `idPaciente` int(11) NOT NULL,
  `Telefono_paciente` int(11) NOT NULL,
  PRIMARY KEY (`Telefono_paciente`),
  KEY `pacienteFK_3_idx` (`idPaciente`),
  CONSTRAINT `pacienteFK_3` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_paciente`
--

LOCK TABLES `telefono_paciente` WRITE;
/*!40000 ALTER TABLE `telefono_paciente` DISABLE KEYS */;
INSERT INTO `telefono_paciente` VALUES (1,74832947),(4,12345567);
/*!40000 ALTER TABLE `telefono_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposangre`
--

DROP TABLE IF EXISTS `tiposangre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposangre` (
  `idTipoSangre` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoSangre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposangre`
--

LOCK TABLES `tiposangre` WRITE;
/*!40000 ALTER TABLE `tiposangre` DISABLE KEYS */;
INSERT INTO `tiposangre` VALUES (1,'O+'),(2,'O-');
/*!40000 ALTER TABLE `tiposangre` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-14 20:13:04
