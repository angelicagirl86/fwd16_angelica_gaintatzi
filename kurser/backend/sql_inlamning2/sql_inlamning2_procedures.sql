DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_f6_antal_patient_i_rabies`(IN `Rabies` INT(11))
    NO SQL
BEGIN
SELECT count(Patient.PatientID)
AS RabiesPatientNumber
FROM Patient_Diagnose
JOIN Diagnose ON Patient_Diagnose.DiagnoseID = Diagnose.DiagnoseID
JOIN Patient ON Patient_Diagnose.PatientID = Patient.PatientID
WHERE DiagnoseName = 'Rabies';
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_f2_antal_patient`(IN `PatientNumber` INT(11))
    NO SQL
BEGIN
SELECT COUNT(PatientID) FROM Patient;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_f3_medicine_och_dose_for_en_viss_diagnose`(IN `DiagnoseTreatment` VARCHAR(255))
    NO SQL
BEGIN
SELECT MedicineID, MedicineName, MedicineDose, DiagnoseName
AS DiagnoseTreatment
FROM Medicine
INNER JOIN Diagnose ON Medicine.MedicineID = Diagnose.DiagnoseID
WHERE DiagnoseName = DiagnoseTreatment;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_f1_antal_patienter_i_olika_diagnose`(IN `DiagnosePatientNumber` INT(11))
    NO SQL
BEGIN
SELECT COUNT(*), DiagnoseID FROM Patient_Diagnose GROUP BY DiagnoseID;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_f5_vilka_patient_behandlas_av_en_doctor`(IN `DoctorTreatment` VARCHAR(255))
BEGIN
SELECT Patient.PatientID, Patient.PatientName, Patient.PatientLastName, Doctor.DoctorID, Doctor.DoctorFirstName, Doctor.DoctorLastName
AS DoctorTreatment
FROM Patient
INNER JOIN Doctor ON Patient.fk_DoctorID = Doctor.DoctorID
WHERE Doctor.DoctorLastName = DoctorTreatment;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_f4_vilka_nurse_som_behandlar_en_viss_patient`(IN `TreatedbyNurse` VARCHAR(255))
    NO SQL
BEGIN
SELECT Patient.PatientID, Patient.PatientName, Patient.PatientLastName, Nurse.NurseID, Nurse.NurseFirstName, Nurse.NurseLastName
AS TreatedbyNurse
FROM Patient_Nurse
INNER JOIN Patient ON Patient_Nurse.PatientID = Patient.PatientID
INNER JOIN Nurse ON Patient_Nurse.NurseID = Nurse.NurseID
WHERE Patient.PatientLastName = TreatedbyNurse;
END$$
DELIMITER ;
