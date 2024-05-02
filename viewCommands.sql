ALTER TABLE Patient MODIFY COLUMN phone_number BIGINT NOT NULL;

select * from Bill;
/*Retrieve the details of patients along with the room they are assigned to, the
name of the doctor treating them, and the corresponding doctor's charges.*
SELECT
Patient.name AS patient_name,
Room.room_id,
Doctor.doc_name AS doctor_name,
Doctor.doctor_charges
FROM
Patient
INNER JOIN
Room ON Patient.p_id = Room.p_id
INNER JOIN
Doctor ON Patient.d_id = Doctor.d_id;
/*Retrieve the area of treatment along with the maximum, minimum, and
total charges for doctors in each area. Round the charges to two decimal
places. Show only those areas where the total charges for doctors exceed
$1000. Sort the results by the total charges in descending order.*/
SELECT area_of_treatment,
ROUND(MAX(doctor_charges), 2) AS max_charges,
ROUND(MIN(doctor_charges), 2) AS min_charges,
ROUND(SUM(doctor_charges), 2) AS total_charges
FROM Doctor
GROUP BY area_of_treatment
HAVING total_charges > 1000
ORDER BY total_charges DESC;


/*Retrieve the average age of patients treated by each doctor.*/
SELECT
Doctor.doc_name AS doctor_name,
AVG(Patient.age) AS average_patient_age
FROM
Patient
INNER JOIN
Doctor ON Patient.d_id = Doctor.d_id
GROUP BY
Doctor.doc_name;
/*Retrieve the details of patients whose names contain the letter 'a' followed
by exactly two characters, regardless of case.*
SELECT
*
FROM
Patient
WHERE
name LIKE '%a_%' OR name LIKE '%A_%';
/*Create a trigger that automatically calculates the total charges for a bill
whenever a new bill is inserted.*
DELIMITER //
CREATE TRIGGER calculate_total_charges
AFTER INSERT ON Bill
FOR EACH ROW
23
BEGIN
UPDATE Bill
SET total_charges = (SELECT doctor_charges FROM Doctor WHERE d_id
= NEW.d_id) + (SELECT room_charges FROM Room WHERE room_id =
NEW.room_id)
WHERE bill_num = NEW.bill_num;
END//
DELIMITER ;
Select * from Bill;
–VIEW–
/*This view will provide details about rooms and the bills associated with
them.*
CREATE VIEW Room_Bill_Info_View AS
SELECT
r.room_id AS Room_ID,
r.room_charges AS Room_Charges,
p.name AS Patient_Name,
b.bill_num AS Bill_Number,
b.total_charges AS Total_Charges
FROM
Room r
JOIN
Patient p ON r.p_id = p.p_id
JOIN
Bill b ON r.room_id = b.room_id;
SELECT * FROM Room_Bill_Info_View;
24
/*This view will provide a detailed summary of bills, including information
about the patient, doctor, and room charges.*/
CREATE VIEW Detailed_Bill_View AS
SELECT
b.bill_num AS Bill_Number,
p.name AS Patient_Name,
d.doc_name AS Doctor_Name,
r.room_id AS Room_ID,
b.total_charges AS Total_Charges
FROM
Bill b
JOIN
Patient p ON b.p_id = p.p_id
JOIN
Doctor d ON b.d_id = d.d_id
JOIN
Room r ON b.room_id = r.room_id;
SELECT * FROM Detailed_Bill_View;


drop table bill;
drop table room;
drop table patient;
drop table doctor; 
drop database Hospital_management_system;