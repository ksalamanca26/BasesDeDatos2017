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
-- Table structure for table `antecendente_inf`
--

DROP TABLE IF EXISTS `antecendente_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antecendente_inf` (
  `idAntecendente_Inf` int(11) NOT NULL AUTO_INCREMENT,
  `TipoAntecedente` varchar(10) NOT NULL,
  `NroIntervenciones` int(11) DEFAULT NULL,
  `Vacunado` varchar(45) DEFAULT NULL,
  `Asmatico` varchar(5) DEFAULT NULL,
  `Cigarrillos` varchar(5) DEFAULT NULL,
  `Hipertenso` varchar(5) DEFAULT NULL,
  `Diabetico` varchar(5) DEFAULT NULL,
  `Formula` varchar(45) DEFAULT NULL,
  `TipoLentes` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idAntecendente_Inf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecendente_inf`
--

LOCK TABLES `antecendente_inf` WRITE;
/*!40000 ALTER TABLE `antecendente_inf` DISABLE KEYS */;
/*!40000 ALTER TABLE `antecendente_inf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardiologo`
--

DROP TABLE IF EXISTS `cardiologo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardiologo` (
  `idMedico` int(11) NOT NULL,
  `idCardiologo` int(11) NOT NULL AUTO_INCREMENT,
  `Hemodinamista` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idCardiologo`),
  KEY `medicoFK_5_idx` (`idMedico`),
  CONSTRAINT `medicoFK_5` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardiologo`
--

LOCK TABLES `cardiologo` WRITE;
/*!40000 ALTER TABLE `cardiologo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardiologo` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilidad`
--

LOCK TABLES `disponibilidad` WRITE;
/*!40000 ALTER TABLE `disponibilidad` DISABLE KEYS */;
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
  `idCardiologo` int(11) NOT NULL,
  `PresionArterial` varchar(45) NOT NULL,
  `Pulso` varchar(45) NOT NULL,
  PRIMARY KEY (`idInforme`,`idCardiologo`),
  KEY `informeFK_2_idx` (`idInforme`),
  KEY `cardiologoFK_idx` (`idCardiologo`),
  CONSTRAINT `cardiologoFK` FOREIGN KEY (`idCardiologo`) REFERENCES `cardiologo` (`idCardiologo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `informeFK_5` FOREIGN KEY (`idInforme`) REFERENCES `informe` (`idInforme`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `idOftalmologo` int(11) NOT NULL,
  `Grado_vision` varchar(45) NOT NULL,
  `Presion_intraocular` varchar(45) NOT NULL,
  PRIMARY KEY (`idInforme`,`idOftalmologo`),
  KEY `oftalmologoFK_idx` (`idOftalmologo`),
  CONSTRAINT `informeFK_4` FOREIGN KEY (`idInforme`) REFERENCES `informe` (`idInforme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `oftalmologoFK` FOREIGN KEY (`idOftalmologo`) REFERENCES `oftalmologo` (`idOftalmologo`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `idInforme` int(11) NOT NULL,
  `idPediatra` int(11) NOT NULL,
  `Peso` int(11) NOT NULL,
  `Altura` int(11) NOT NULL,
  PRIMARY KEY (`idInforme`,`idPediatra`),
  KEY `pediatraFK_idx` (`idPediatra`),
  CONSTRAINT `informeFK_3` FOREIGN KEY (`idInforme`) REFERENCES `informe` (`idInforme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pediatraFK` FOREIGN KEY (`idPediatra`) REFERENCES `pediatra` (`idPediatra`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `idAntecedente` int(11) NOT NULL,
  `Sintoma` varchar(45) DEFAULT NULL,
  `Diagnostico` varchar(45) NOT NULL,
  `Instruccion` varchar(45) DEFAULT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`idInforme`),
  KEY `pacienteFK_2_idx` (`idPaciente`),
  KEY `antecedenteFK_idx` (`idAntecedente`),
  CONSTRAINT `antecedenteFK` FOREIGN KEY (`idAntecedente`) REFERENCES `antecendente_inf` (`idAntecendente_Inf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pacienteFK_2` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informe`
--

LOCK TABLES `informe` WRITE;
/*!40000 ALTER TABLE `informe` DISABLE KEYS */;
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
  PRIMARY KEY (`idMedico`),
  UNIQUE KEY `CarnetMedico_UNIQUE` (`CarnetMedico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oftalmologo`
--

DROP TABLE IF EXISTS `oftalmologo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oftalmologo` (
  `idMedico` int(11) NOT NULL,
  `idOftalmologo` int(11) NOT NULL AUTO_INCREMENT,
  `Retinologo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idOftalmologo`),
  KEY `medicoFK_3_idx` (`idMedico`),
  CONSTRAINT `medicoFK_3` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oftalmologo`
--

LOCK TABLES `oftalmologo` WRITE;
/*!40000 ALTER TABLE `oftalmologo` DISABLE KEYS */;
/*!40000 ALTER TABLE `oftalmologo` ENABLE KEYS */;
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
  `FechaNaciemiento` date NOT NULL,
  `LugarNacimiento` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `EdoCivil` varchar(10) NOT NULL,
  PRIMARY KEY (`idPaciente`),
  KEY `persona_FK1_idx` (`idPersona`),
  KEY `tiposangreFK_idx` (`idTipoSangre`),
  CONSTRAINT `persona_FK1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tiposangreFK` FOREIGN KEY (`idTipoSangre`) REFERENCES `tiposangre` (`idTipoSangre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pediatra`
--

DROP TABLE IF EXISTS `pediatra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pediatra` (
  `idMedico` int(11) NOT NULL,
  `idPediatra` int(11) NOT NULL AUTO_INCREMENT,
  `Inmunologo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idPediatra`),
  KEY `medicoFK_2_idx` (`idMedico`),
  CONSTRAINT `medicoFK_2` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pediatra`
--

LOCK TABLES `pediatra` WRITE;
/*!40000 ALTER TABLE `pediatra` DISABLE KEYS */;
/*!40000 ALTER TABLE `pediatra` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
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
  CONSTRAINT `antecedenteFK_2` FOREIGN KEY (`idAntecedente`) REFERENCES `antecendente_inf` (`idAntecendente_Inf`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposangre`
--

LOCK TABLES `tiposangre` WRITE;
/*!40000 ALTER TABLE `tiposangre` DISABLE KEYS */;
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

-- Dump completed on 2017-11-12  0:19:26
