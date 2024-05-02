
**Hospital Management System**

The Hospital Management System project is designed to optimize healthcare administration and enhance patient care delivery. It comprises modules for Doctor Management, Patient Management, Patient Treatment, and Room Assignments, encompassing various entities crucial to the hospital management domain.

**Problem Statement**

The current hospital management system relies on traditional pen-and-paper methods and file management systems on computers. This approach leads to several issues:

Duplication of Data
Update Issues
Lack of Report Generation
No Backup
Security and Privacy Issues
Solution
This project aims to implement a Database Management System (DBMS) to replace the traditional method of storing and managing data, addressing the aforementioned issues.

**Project Background**

The Hospital Management System project utilizes MySQL as the DBMS. MySQL is an open-source relational database management system widely used for managing structured data, providing robust features for data storage, retrieval, and management.

**Description of the Project**

Welcome to our Hospital Management System project, where we efficiently organize the operations of a medical facility. Within our system:

Each doctor is uniquely identified by their ID (d_id) and has essential details such as name, specialized area of treatment, and charges for their services.
Every patient possesses a patient ID (p_id) and provides personal information including name, phone number, gender, age, email, and area of treatment. Additionally, patients are scheduled for appointments denoted by slots and are linked to a specific doctor through their doctor ID.
Bills are generated for patient services, containing a bill number, room charges, patient details, treatment area, patient's age, doctor charges, and the total incurred expenses.
Rooms are part of our system, each with a unique room ID and corresponding room charges.
ER Diagram Creation
The development of the Schema for RDBMS started with the Entity-Relationship Model(ER Model). Then the ER Model was mapped to the Relational Model.

**Description of ER Diagram**

The data description of each of these entities is as follows:

Doctor
Attributes: doc_name, doctor_id (PK), area_of_treatment, doctor_charges
Patient
Attributes: name, phone_number, email, p_id (PK), age, gender, area_of_treatment, slot, doctor_id (FK)
Bill
Attributes: bill_num (PK), doctor_id (FK), room_id (FK), p_id (FK), total_charges
Room
Attributes: room_id (PK), room_charges, p_id (FK)


**Conversion of ER Diagram into Tables**


Strong Entities: Doctor, Patient, Bill, Room
Weak Entities: None
Mapping Cardinalities
One-to-One Relationship Types: PATIENT is assigned ROOM.
One-to-Many Relationship Types: DOCTOR treats PATIENT, PATIENT issued BILL.
Mapping multivalued attributes: No multivalued attributes.
Mapping N-array Entities: No N-array Entities.
**Normalization of Tables up to 3-NF**

First Normal Form (1NF): All attributes contain atomic values.
Second Normal Form (2NF): All non-key attributes are fully functionally dependent on the entire primary key.
Third Normal Form (3NF): No transitive dependencies exist in the database.
This Hospital Management System streamlines medical processes, enhancing patient care and administrative efficiency.



