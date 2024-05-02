INSERT INTO Doctor(d_id,doc_name,area_of_treatment, doctor_charges)
VALUES (1,
"Dr.Drisana"
,
"Pediatrics"
, 1500.00),
(2,
"Dr.John Doe"
,
"Cardiology"
, 2000.00),
(3,
"Dr.Olivia Smith"
,
"Gynaecology"
, 2500.00),
(4,
"Dr.Jane Smith"
,
"Neurology"
,1800.00);





INSERT INTO Patient (p_id, name, phone_number, gender, age, email,
area_of_treatment, slot, d_id)
VALUES
(101,
'Jack Brown'
, 1234567890,
'Male'
, 35,
'jack@example.com'
,
'Cardiology'
,
'Morning'
, 2),
(102,
'Bob Johnson'
, 9876543280,
'Male'
, 45,
'bob@example.com'
,
'Neurology'
,
'Afternoon'
, 4),
(103,
'Charlie Brown'
, 5551234567,
'Male'
, 28,
'charlie@example.com'
,
'Pediatrics'
,
'Morning'
, 1),
(104,
'Diana Lee'
, 1112223333,
'Female'
, 50,
'diana@example.com'
,
'Neurology'
,
'Evening'
, 4),

(105,
'Ella Chen'
, 9998887777,
'Female'
, 40,
'ella@example.com'
,
'Gynaecology'
,
'Afternoon'
, 3),
(106,
'Frank Wilson'
, 7779998888,
'Male'
, 55,
'frank@example.com'
,
'Cardiology'
,
'Evening'
, 2),
(107,
'Grace Taylor'
, 2223334444,
'Female'
, 30,
'grace@example.com'
,
'Pediatrics'
,
'Afternoon'
, 1),
(108,
'Ivy White'
, 8887776666,
'Female'
, 25,
'ivy@example.com'
,
'Gynaecology'
,
'Evening'
, 3);


INSERT INTO Room (room_id, p_id, room_charges)
VALUES
(1001, 101, 0.00),
(1002, 102, 300.00),
(1003, 103, 0.00),
(1004, 104, 400.00),
(1005, 105, 0.00),
(1006, 106, 450.00),
(1007, 107, 350.00),
(1008, 108, 450.00);


INSERT INTO Bill (bill_num,p_id, d_id, room_id, total_charges)
SELECT
12000 + ROW_NUMBER() OVER () AS bill_num,
Patient.p_id,
Doctor.d_id,
Room.room_id,
(Doctor.doctor_charges + Room.room_charges) AS total_charges
FROM Patient
JOIN
Room ON Patient.p_id = Room.p_id
JOIN
Doctor ON Patient.d_id = Doctor.d_id;