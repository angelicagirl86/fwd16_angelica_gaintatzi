-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 05, 2017 at 11:08 PM
-- Server version: 5.6.35
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `Asylum`
--
CREATE DATABASE IF NOT EXISTS `Asylum` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `Asylum`;

-- --------------------------------------------------------

--
-- Table structure for table `Diagnose`
--

CREATE TABLE `Diagnose` (
  `DiagnoseID` int(11) NOT NULL,
  `DiagnoseName` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Diagnose`
--

INSERT INTO `Diagnose` (`DiagnoseID`, `DiagnoseName`) VALUES
(1, 'Bipolar disorder'),
(2, 'Sleep disorder'),
(3, 'Insanity'),
(4, 'Stress'),
(5, 'Sleep disorder'),
(6, 'Schizophrenia'),
(7, 'Depression'),
(8, 'Borderline personality disorder'),
(9, 'Delusion'),
(10, 'Adjustment disorder'),
(11, 'Pyromania'),
(12, 'Munchausen syndrome'),
(13, 'Impulse control disorder'),
(14, 'Delirium'),
(15, 'Kleptomania'),
(16, 'Seasonal affective disorder'),
(17, 'Mental retardation'),
(18, 'Psychosis'),
(19, 'Mood disorder'),
(20, 'Post traumatic stress disorder'),
(23, 'Rabies');

-- --------------------------------------------------------

--
-- Table structure for table `Doctor`
--

CREATE TABLE `Doctor` (
  `DoctorID` int(11) NOT NULL,
  `DoctorFirstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DoctorLastName` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Doctor`
--

INSERT INTO `Doctor` (`DoctorID`, `DoctorFirstName`, `DoctorLastName`) VALUES
(1, 'Dr.Herbert', 'West'),
(2, 'Dr.Anthony', 'Edward'),
(3, 'Dr.John', 'Seward'),
(4, 'Dr.Abraham', 'Van Helsing'),
(5, 'Dr.Victor', 'Frankenstein');

-- --------------------------------------------------------

--
-- Stand-in structure for view `f1_antal_patienter_i_olika_diagnose`
-- (See below for the actual view)
--
CREATE TABLE `f1_antal_patienter_i_olika_diagnose` (
`COUNT(*)` bigint(21)
,`DiagnoseID` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `f2_antal_patienter`
-- (See below for the actual view)
--
CREATE TABLE `f2_antal_patienter` (
`COUNT(PatientID)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `f3_medicine_och_dose_för_en_viss_diagnose`
-- (See below for the actual view)
--
CREATE TABLE `f3_medicine_och_dose_för_en_viss_diagnose` (
`MedicineID` int(11)
,`MedicineName` varchar(255)
,`MedicineDose` float
,`DiagnoseTreatment` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `f4_vilka_nurse_som_behandlar_en_viss_patient`
-- (See below for the actual view)
--
CREATE TABLE `f4_vilka_nurse_som_behandlar_en_viss_patient` (
`PatientID` int(11)
,`PatientName` varchar(255)
,`PatientLastName` varchar(255)
,`NurseID` int(11)
,`NurseFirstName` varchar(255)
,`NurseLastName` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `f5_vilka_patient_behandlas_av_en_doctor`
-- (See below for the actual view)
--
CREATE TABLE `f5_vilka_patient_behandlas_av_en_doctor` (
`PatientID` int(11)
,`PatientName` varchar(255)
,`PatientLastName` varchar(255)
,`DoctorID` int(11)
,`DoctorFirstName` varchar(255)
,`DoctorLastName` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `f6_antal_patient_i_rabies`
-- (See below for the actual view)
--
CREATE TABLE `f6_antal_patient_i_rabies` (
`count(Patient.PatientID)` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `Medicine`
--

CREATE TABLE `Medicine` (
  `MedicineID` int(11) NOT NULL,
  `MedicineName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MedicineDose` float NOT NULL,
  `fk_DiagnoseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Medicine`
--

INSERT INTO `Medicine` (`MedicineID`, `MedicineName`, `MedicineDose`, `fk_DiagnoseID`) VALUES
(1, 'Prozac', 0.3, 1),
(2, 'Zoloft', 0.1, 2),
(3, 'Paxil', 0.5, 3),
(4, 'Celexa', 0.2, 4),
(5, 'Lexapro', 1, 5),
(6, 'Luvox', 0.7, 6),
(7, 'Effexor', 1.2, 7),
(8, 'Cymbalta', 0.2, 8),
(9, 'Khedezla', 0.1, 9),
(10, 'Pristiq', 0.4, 10),
(11, 'Fetzima', 0.4, 11),
(12, 'Elavil', 0.8, 12),
(13, 'Pamelor', 1.1, 13),
(14, 'Sinequan', 1, 14),
(15, 'Imipramine', 0.9, 15),
(16, 'Wellbutrin', 0.4, 16),
(17, 'Trentellix', 0.2, 17),
(18, 'Viibryd', 0.05, 18),
(19, 'Remeron', 0.6, 19),
(20, 'Valium', 1, 20),
(21, 'Ativan', 0.7, 1),
(22, 'Xanax', 0.9, 2),
(23, 'Nardil', 0.07, 4),
(24, 'Parnate', 0.3, 5),
(25, 'Rabies Immune Globulin', 1, 23);

-- --------------------------------------------------------

--
-- Table structure for table `Nurse`
--

CREATE TABLE `Nurse` (
  `NurseID` int(11) NOT NULL,
  `NurseFirstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NurseLastName` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Nurse`
--

INSERT INTO `Nurse` (`NurseID`, `NurseFirstName`, `NurseLastName`) VALUES
(1, 'Betty', 'Green'),
(2, 'Tammy', 'York'),
(3, 'Betsy', 'Connell'),
(4, 'Amy', 'Nicholls'),
(5, 'Maggie', 'O’Connor'),
(6, 'Caroline', 'Ellis'),
(7, 'Abby', 'Russell'),
(8, 'Annie', 'Wilkes');

-- --------------------------------------------------------

--
-- Table structure for table `Patient`
--

CREATE TABLE `Patient` (
  `PatientID` int(11) NOT NULL,
  `PatientName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PatientLastName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fk_DoctorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Patient`
--

INSERT INTO `Patient` (`PatientID`, `PatientName`, `PatientLastName`, `fk_DoctorID`) VALUES
(1, 'Angelica', 'Gaintatzi', 1),
(2, 'Dragana', 'Jankovic', 4),
(3, 'David', 'Szmak', 2),
(4, 'Carlos', 'Demirovic', 3),
(5, 'Anders', 'Rochester', 5),
(6, 'Malena', 'Brinkheden', 1),
(7, 'Ly', 'Lam Le', 2),
(8, 'Anton', 'Hallström', 2),
(9, 'Ivan', 'Lundberg', 4),
(10, 'Francisco', 'Palma', 3),
(11, 'Tim', 'Nilsson', 4),
(12, 'Kim', 'Persson', 5),
(13, 'Nomi', 'Lone', 3),
(14, 'Nicklas Theodor', 'Uhde', 5),
(15, 'Daniel', 'Sandberg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Patient_Diagnose`
--

CREATE TABLE `Patient_Diagnose` (
  `PatientID` int(11) NOT NULL,
  `DiagnoseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Patient_Diagnose`
--

INSERT INTO `Patient_Diagnose` (`PatientID`, `DiagnoseID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(6, 6),
(7, 7),
(8, 8),
(10, 9),
(9, 10),
(12, 11),
(11, 12),
(13, 13),
(14, 14),
(15, 15),
(15, 16),
(1, 23),
(2, 23),
(5, 23),
(15, 23);

-- --------------------------------------------------------

--
-- Table structure for table `Patient_Nurse`
--

CREATE TABLE `Patient_Nurse` (
  `PatientID` int(11) NOT NULL,
  `NurseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Patient_Nurse`
--

INSERT INTO `Patient_Nurse` (`PatientID`, `NurseID`) VALUES
(5, 1),
(13, 1),
(1, 2),
(5, 2),
(6, 2),
(14, 2),
(2, 3),
(7, 3),
(15, 3),
(3, 4),
(8, 4),
(4, 5),
(9, 5),
(10, 6),
(11, 7),
(12, 8);

-- --------------------------------------------------------

--
-- Structure for view `f1_antal_patienter_i_olika_diagnose`
--
DROP TABLE IF EXISTS `f1_antal_patienter_i_olika_diagnose`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `asylum`.`f1_antal_patienter_i_olika_diagnose`  AS  select count(0) AS `COUNT(*)`,`asylum`.`patient_diagnose`.`DiagnoseID` AS `DiagnoseID` from `asylum`.`patient_diagnose` group by `asylum`.`patient_diagnose`.`DiagnoseID` ;

-- --------------------------------------------------------

--
-- Structure for view `f2_antal_patienter`
--
DROP TABLE IF EXISTS `f2_antal_patienter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `asylum`.`f2_antal_patienter`  AS  select count(`asylum`.`patient`.`PatientID`) AS `COUNT(PatientID)` from `asylum`.`patient` ;

-- --------------------------------------------------------

--
-- Structure for view `f3_medicine_och_dose_för_en_viss_diagnose`
--
DROP TABLE IF EXISTS `f3_medicine_och_dose_för_en_viss_diagnose`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `asylum`.`f3_medicine_och_dose_för_en_viss_diagnose`  AS  select `asylum`.`medicine`.`MedicineID` AS `MedicineID`,`asylum`.`medicine`.`MedicineName` AS `MedicineName`,`asylum`.`medicine`.`MedicineDose` AS `MedicineDose`,`asylum`.`diagnose`.`DiagnoseName` AS `DiagnoseTreatment` from (`asylum`.`medicine` join `asylum`.`diagnose` on((`asylum`.`medicine`.`MedicineID` = `asylum`.`diagnose`.`DiagnoseID`))) where (`asylum`.`diagnose`.`DiagnoseName` = 'Bipolar disorder') ;

-- --------------------------------------------------------

--
-- Structure for view `f4_vilka_nurse_som_behandlar_en_viss_patient`
--
DROP TABLE IF EXISTS `f4_vilka_nurse_som_behandlar_en_viss_patient`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `asylum`.`f4_vilka_nurse_som_behandlar_en_viss_patient`  AS  select `asylum`.`patient`.`PatientID` AS `PatientID`,`asylum`.`patient`.`PatientName` AS `PatientName`,`asylum`.`patient`.`PatientLastName` AS `PatientLastName`,`asylum`.`nurse`.`NurseID` AS `NurseID`,`asylum`.`nurse`.`NurseFirstName` AS `NurseFirstName`,`asylum`.`nurse`.`NurseLastName` AS `NurseLastName` from ((`asylum`.`patient_nurse` join `asylum`.`patient` on((`asylum`.`patient_nurse`.`PatientID` = `asylum`.`patient`.`PatientID`))) join `asylum`.`nurse` on((`asylum`.`patient_nurse`.`NurseID` = `asylum`.`nurse`.`NurseID`))) where (`asylum`.`patient`.`PatientLastName` = 'Rochester') ;

-- --------------------------------------------------------

--
-- Structure for view `f5_vilka_patient_behandlas_av_en_doctor`
--
DROP TABLE IF EXISTS `f5_vilka_patient_behandlas_av_en_doctor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `asylum`.`f5_vilka_patient_behandlas_av_en_doctor`  AS  select `asylum`.`patient`.`PatientID` AS `PatientID`,`asylum`.`patient`.`PatientName` AS `PatientName`,`asylum`.`patient`.`PatientLastName` AS `PatientLastName`,`asylum`.`doctor`.`DoctorID` AS `DoctorID`,`asylum`.`doctor`.`DoctorFirstName` AS `DoctorFirstName`,`asylum`.`doctor`.`DoctorLastName` AS `DoctorLastName` from (`asylum`.`patient` join `asylum`.`doctor` on((`asylum`.`patient`.`fk_DoctorID` = `asylum`.`doctor`.`DoctorID`))) where (`asylum`.`doctor`.`DoctorLastName` = 'West') ;

-- --------------------------------------------------------

--
-- Structure for view `f6_antal_patient_i_rabies`
--
DROP TABLE IF EXISTS `f6_antal_patient_i_rabies`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `asylum`.`f6_antal_patient_i_rabies`  AS  select count(`asylum`.`patient`.`PatientID`) AS `count(Patient.PatientID)` from ((`asylum`.`patient_diagnose` join `asylum`.`patient` on((`asylum`.`patient_diagnose`.`PatientID` = `asylum`.`patient`.`PatientID`))) join `asylum`.`diagnose` on((`asylum`.`patient_diagnose`.`DiagnoseID` = `asylum`.`diagnose`.`DiagnoseID`))) where (`asylum`.`diagnose`.`DiagnoseName` = 'Rabies') ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Diagnose`
--
ALTER TABLE `Diagnose`
  ADD PRIMARY KEY (`DiagnoseID`);

--
-- Indexes for table `Doctor`
--
ALTER TABLE `Doctor`
  ADD PRIMARY KEY (`DoctorID`);

--
-- Indexes for table `Medicine`
--
ALTER TABLE `Medicine`
  ADD PRIMARY KEY (`MedicineID`),
  ADD KEY `diagnose_medicine` (`fk_DiagnoseID`);

--
-- Indexes for table `Nurse`
--
ALTER TABLE `Nurse`
  ADD PRIMARY KEY (`NurseID`);

--
-- Indexes for table `Patient`
--
ALTER TABLE `Patient`
  ADD PRIMARY KEY (`PatientID`),
  ADD KEY `patient_doctor` (`fk_DoctorID`);

--
-- Indexes for table `Patient_Diagnose`
--
ALTER TABLE `Patient_Diagnose`
  ADD PRIMARY KEY (`PatientID`,`DiagnoseID`),
  ADD KEY `patient_diagnose_2` (`DiagnoseID`);

--
-- Indexes for table `Patient_Nurse`
--
ALTER TABLE `Patient_Nurse`
  ADD PRIMARY KEY (`PatientID`,`NurseID`),
  ADD KEY `patient_nurse_2` (`NurseID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Diagnose`
--
ALTER TABLE `Diagnose`
  MODIFY `DiagnoseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `Doctor`
--
ALTER TABLE `Doctor`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Medicine`
--
ALTER TABLE `Medicine`
  MODIFY `MedicineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `Nurse`
--
ALTER TABLE `Nurse`
  MODIFY `NurseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `Patient`
--
ALTER TABLE `Patient`
  MODIFY `PatientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Medicine`
--
ALTER TABLE `Medicine`
  ADD CONSTRAINT `diagnose_medicine` FOREIGN KEY (`fk_DiagnoseID`) REFERENCES `Diagnose` (`DiagnoseID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Patient`
--
ALTER TABLE `Patient`
  ADD CONSTRAINT `patient_doctor` FOREIGN KEY (`fk_DoctorID`) REFERENCES `Doctor` (`DoctorID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Patient_Diagnose`
--
ALTER TABLE `Patient_Diagnose`
  ADD CONSTRAINT `patient_diagnose_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`PatientID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `patient_diagnose_2` FOREIGN KEY (`DiagnoseID`) REFERENCES `Diagnose` (`DiagnoseID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Patient_Nurse`
--
ALTER TABLE `Patient_Nurse`
  ADD CONSTRAINT `patient_nurse_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`PatientID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `patient_nurse_2` FOREIGN KEY (`NurseID`) REFERENCES `Nurse` (`NurseID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
