CREATE DATABASE Library;

USE Library;

CREATE TABLE Branch(
Branch_no INT PRIMARY KEY,
Manager_Id INT,
Branch_address VARCHAR(30),
Contact_no int
);

CREATE TABLE Employee(
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(30),
Position VARCHAR(30),
Salary INT,
Branch_no INT,
FOREIGN KEY (Branch_no) REFERENCES Branch (Branch_no)
);

CREATE TABLE Customer(
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(30),
Reg_date DATE
);

CREATE TABLE Books(
ISBN INT PRIMARY KEY,
Book_title VARCHAR(30),
Category VARCHAR(30),
Rental_price INT,
Status Boolean, 
Author VARCHAR(30),
Publisher VARCHAR(30)
); 

CREATE TABLE ReturnStatus(
Return_Id INT PRIMARY KEY,
Return_cust VARCHAR(30),
Return_book_name VARCHAR(30),
Return_date DATE,
ISBN INT,
FOREIGN KEY (ISBN) REFERENCES Books (ISBN)
);