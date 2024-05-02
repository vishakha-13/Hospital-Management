CREATE DATABASE Hospital_management_system;
USE Hospital_management_system;


CREATE TABLE Doctor(
d_id INT PRIMARY KEY,
doc_name VARCHAR(50) NOT NULL,
area_of_treatment VARCHAR(40) NOT NULL,
doctor_charges DECIMAL(10,2));
DESC Doctor;


CREATE TABLE Patient(
p_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
phone_number INT NOT NULL UNIQUE,
gender ENUM('Male'
,
'Female'),
age INT NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
area_of_treatment VARCHAR(50) NOT NULL,
slot VARCHAR(20) NOT NULL,
d_id INT NOT NULL,
FOREIGN KEY(d_id) REFERENCES Doctor(d_id));
DESC Patient;

ALTER TABLE Patient MODIFY COLUMN phone_number BIGINT NOT NULL;


CREATE TABLE Room(
room_id INT PRIMARY KEY,
room_charges DECIMAL(10,2) DEFAULT 0.0,
P_id INT NOT NULL,
FOREIGN KEY (p_id) REFERENCES Patient (p_id));
DESC Room;



CREATE TABLE Bill(
bill_num INT PRIMARY KEY,
p_id INT, d_id INT,
room_id INT,
total_charges INT,
FOREIGN KEY (p_id) REFERENCES Patient(p_id),
FOREIGN KEY (d_id) REFERENCES Doctor(d_id),
FOREIGN KEY (room_id) REFERENCES Room(room_id));
DESC Bill;