-- Create the Bank_Management_System database
CREATE DATABASE IF NOT EXISTS Bank_Management_System;
USE Bank_Management_System;

-- Table for Registered Accounts
CREATE TABLE Registered_Accounts(
    User_Name VARCHAR(25) UNIQUE NOT NULL PRIMARY KEY,
    User_Password VARCHAR(25) NOT NULL,
    Verification_Code VARCHAR(10) NOT NULL
);

-- Table for Customer Personal Information
CREATE TABLE Customer_Personal_Info(
    Customer_ID VARCHAR(6) PRIMARY KEY,
    User_Name VARCHAR(25) UNIQUE NOT NULL,
    Customer_Name VARCHAR(25) NOT NULL,
    Date_Of_Birth DATE,
    Guardian_Name VARCHAR(25) NOT NULL,
    Permanent_Address VARCHAR(50) NOT NULL,
    Secondary_Address VARCHAR(50),
    Postal_Code VARCHAR(8),
    Email_ID VARCHAR(25) UNIQUE,
    Gender CHAR(6),
    CNIC_Number VARCHAR(15) UNIQUE,
    CHECK (Email_ID REGEXP '^[a-zA-Z0-9_]+@[a-zA-Z0-9_]+\\.[a-zA-Z]{2,}$'),
    CHECK (CNIC_Number REGEXP '^[0-9]{5}-[0-9]{7}-[0-9]$'),
    FOREIGN KEY (User_Name) REFERENCES Registered_Accounts(User_Name) 
);

-- Table for Account Information
CREATE TABLE Account_Info(
    Account_No BIGINT(16) UNIQUE NOT NULL PRIMARY KEY,
    Customer_ID VARCHAR(6) NOT NULL,
    Account_Type VARCHAR(10),
    Registration_Date DATE,
    Activation_Date DATE,
    Initial_Deposit BIGINT(10),
    Current_Balance BIGINT(20),
    FOREIGN KEY(Customer_ID) REFERENCES Customer_Personal_Info(Customer_ID)
);