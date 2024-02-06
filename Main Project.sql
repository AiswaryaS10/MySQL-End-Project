CREATE DATABASE Library;

USE Library;

-- 1. Branch Table
CREATE TABLE Branch(
Branch_no INT PRIMARY KEY,
Manager_Id INT,
Branch_address VARCHAR(30),
Contact_no int
);

-- 2. Employee Table
CREATE TABLE Employee(
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(30),
Position VARCHAR(30),
Salary INT,
Branch_no INT,
FOREIGN KEY (Branch_no) REFERENCES Branch (Branch_no)
);

-- 3. Customer Table
CREATE TABLE Customer(
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(30),
Reg_date DATE
);

-- 4. Create the IssueStatus table
CREATE TABLE IssueStatus (
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(30),
Issue_date DATE,
Isbn_book INT,
FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- 5. Create the ReturnStatus table
CREATE TABLE ReturnStatus (
Return_Id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(30),
Return_date DATE,
Isbn_book2 INT,
FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- 6. Create the Books table
CREATE TABLE Books (
ISBN INT PRIMARY KEY,
Book_title VARCHAR(30),
Category VARCHAR(30),
Rental_Price INT,
Status ENUM('yes', 'no'),
Author VARCHAR(30),
Publisher VARCHAR(30)
);

-- Insert values into the Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) 
VALUES (1, 101, '123 Main St', '12345'),
       (2, 102, '456 Elm St', '93219'),
	   (3, 103, '647 Main St', '24360'),
	   (4, 104, '234 Seashore St', '23685'),
       (5, 105, '678 Macao St', '66787');
       

-- Insert values into the Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES (1, 'Johny Thomas', 'Manager', 60000, 1),
       (2, 'Suman Smith', 'Clerk', 40000, 1),
       (3, 'Bob Johnson', 'Manager', 55000, 2),
       (4, 'Alice Brown', 'Clerk', 38000, 2),
       (5, 'Madhu S', 'Assistant', 40000, 3);

-- Insert values into the Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) 
VALUES (1, 'Mittu L', 'H 12 Gandhi Nagar', '2021-12-15'),
	   (2, 'Koshy Mathew', 'H 3 Albayan', '2022-01-10'),
       (3, 'Anu Mol', 'H 45 St Sthephen', '2017-10-04'),
       (4, 'Kesav Thambi', 'H 55 Gandhi Nagar', '2020-03-02'),
       (5, 'Mahesh Babu', 'H 24 Commercial Street', '2022-01-01');

-- Insert values into the IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES (101, 1, 'Book1', '2022-01-05', 12345),
       (102, 2, 'Book2', '2023-02-10', 78901),
       (103, 3, 'Book3', '2020-09-20', 28374),
       (104, 4, 'Book4', '2022-01-22', 35246),
       (105, 5, 'Book5', '2023-06-11', 24356);

-- Insert values into the ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES (1, 1, 'Book1', '2023-01-20', 12345),
       (2, 2, 'Book2', '2023-03-15', 78901),
       (3, 3, 'Book3', '2023-04-23', 28374),
       (4, 4, 'Book4', '2023-05-30', 35246),
       (5, 5, 'Book5', '2023-06-20', 24356);

-- Insert values into the Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES (12346, 'Book1', 'Fiction', 10, 'yes', 'John Smith', 'ABC Publishing'),
       (78902, 'Book2', 'Non-fiction', 12, 'no', 'Jane Doe', 'XYZ Publishing'),
       (28375, 'Book3', 'Novel', 40, 'yes', 'Macao Freddy', 'ABC Publishing'),
	   (35247, 'Book4', 'Story', 20, 'no', 'Meera Manorama', 'UV Publishing'),
       (24358, 'Book5', 'Drama', 50, 'yes', 'Alfred Dezooza', 'HS Publishing');

SELECT * FROM Branch;
SELECT * FROM Employee;
SELECT * FROM Customer;
SELECT * FROM IssueStatus;
SELECT * FROM ReturnStatus;
SELECT * FROM Books;

-- 1. 
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

-- 2. 
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- 3. 
SELECT b.Book_title, c.Customer_name 
FROM Books b
INNER JOIN IssueStatus i ON b.ISBN = i.Isbn_book
INNER JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- 4. 
SELECT Category, COUNT(*) AS Total_Books FROM Books GROUP BY Category;

-- 5. 
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- 6. 
SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. 
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;

-- 8. 
SELECT DISTINCT c.Customer_name
FROM Customer c
INNER JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE DATE_FORMAT(i.Issue_date, '%Y-%m') = '2023-06';

-- 9. 
SELECT Book_title FROM Books WHERE Category = 'History';

-- 10. 
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;











       
       
       
       
       
       
       