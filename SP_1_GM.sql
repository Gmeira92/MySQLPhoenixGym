create database phoenixgym;
use phoenixgym;
drop table if exists members;
create table members
(
Membership_id int auto_increment,
First_Name varchar (50),
Last_Name 	varchar(50),
Phone_Number varchar(50), 
Address		varchar(50),
City 		varchar(50),
State 		varchar(2),
Zip_Code	varchar(20),
Client_Weight decimal(9,2),
Client_Height decimal(9,2),
Constraint Membership_ID_PK Primary KEY (membership_id)
/*create table level PK constraint on membership_id here*/
);

create table gym_classes
(
Class_ID int auto_increment,
Class_Type varchar(50),
Class_Day varchar (50),
Constraint Class_ID_PK Primary KEY (Class_ID)
/*create table level PK constraint on class_id here*/
);

create table instructors
(
Instructor_ID int auto_increment,
First_Name varchar (50),
Last_Name varchar (50),
Address varchar (80),
Age Decimal (9,2),
Race varchar (50),
Constraint Instructor_ID_PK Primary KEY (Instructor_ID)
/*create table level PK constraint on instructor_id here*/
);

create table payment_info
(
Membership_ID int auto_increment,
Credit_Card_Company varchar(50),
Credit_Card_Number decimal(16,0),
CC_Security_Code decimal(9,2),
Payment_Type varchar(50),
CC_Expiration varchar(5),
Bank_Name varchar(50),
Bank_Account_Number decimal(16,0),
Constraint Membership_ID_PK Primary KEY (Membership_ID),
Constraint Membership_ID_OTO Foreign key (membership_ID) references members (membership_id) 
/*create table level PK constraint on membership_id here*/
/*create table level FK constraint on membership_id(members table) here*/
);

create table Instructors_Class_Join
(
Join_id int auto_increment , 
/*Join_id will be this tables PK (int auto-increment)*/
Instructor_ID int,
Class_ID int,
Start_Time decimal(9,2),
End_Time decimal(9,2),
constraint Join_id_PK primary key (join_id),
Constraint instructor_ID_fk Foreign key (instructor_ID) references instructors (instructor_id),
Constraint class_ID_fk Foreign key (class_ID) references gym_classes (class_id)
/*create table level PK constraint on join_id here*/
/*create table level FK constraint on instructor_id(instructors table) here*/
/*create table level FK constraint on class_id(gym_classes table) here*/  
);
create table invoices /*create after instructor-class-join table*/
(
Invoice_ID int auto_increment,
Join_id int, 
Membership_ID int,
Billing_Date varchar(50),
Billing_Amount varchar(50),
Paid_Date varchar(50),
constraint invoice_id primary key (invoice_id),
Constraint join_ID_fk Foreign key (join_ID) references Instructors_Class_Join (join_id),
Constraint membership_ID_fk Foreign key (membership_ID) references members (membership_ID)
/*create table level PK constraint on invoice_id here*/
/*create table level FK constraint on join_id(Instructors_Class_Join table) here*/
/*create table level FK constraint on membership_id(members table) here*/  
);
