-- Create Database
CREATE DATABASE BankingSystem;
USE BankingSystem;
-- Tables
-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255),
    dob DATE
);

-- Branches Table
CREATE TABLE Branches (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100) NOT NULL,
    branch_city VARCHAR(100) NOT NULL
);

-- Accounts Table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    branch_id INT,
    account_type VARCHAR(20), -- Savings, Current
    balance DECIMAL(12,2),
    opened_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

-- Transactions Table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    transaction_type VARCHAR(20), -- Deposit, Withdrawal, Transfer
    amount DECIMAL(12,2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

-- Loans Table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    branch_id INT,
    loan_amount DECIMAL(12,2),
    loan_type VARCHAR(50), -- Home, Personal, Car, Education
    issue_date DATE,
    due_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);
-- Insert Data
-- Customers (20 Records)
INSERT INTO Customers (name, phone, email, address, dob) VALUES
('Amit Sharma', '9876543210', 'amit.sharma@email.com', 'Delhi, India', '1990-05-12'),
('Priya Mehta', '9988776655', 'priya.mehta@email.com', 'Mumbai, India', '1988-11-25'),
('Rajesh Kumar', '9090909090', 'rajesh.kumar@email.com', 'Pune, India', '1995-07-18'),
('Sneha Patel', '9123456789', 'sneha.patel@email.com', 'Ahmedabad, India', '1992-03-09'),
('Karan Verma', '9812345678', 'karan.verma@email.com', 'Bangalore, India', '1987-12-02'),
('Anjali Singh', '9823456789', 'anjali.singh@email.com', 'Chennai, India', '1991-08-15'),
('Vikas Gupta', '9834567890', 'vikas.gupta@email.com', 'Hyderabad, India', '1985-04-22'),
('Neha Reddy', '9845678901', 'neha.reddy@email.com', 'Kolkata, India', '1993-09-30'),
('Rohit Das', '9856789012', 'rohit.das@email.com', 'Lucknow, India', '1996-01-19'),
('Meera Joshi', '9867890123', 'meera.joshi@email.com', 'Jaipur, India', '1989-06-07'),
('Arjun Nair', '9878901234', 'arjun.nair@email.com', 'Kochi, India', '1994-02-12'),
('Pooja Rao', '9889012345', 'pooja.rao@email.com', 'Goa, India', '1992-10-03'),
('Deepak Yadav', '9890123456', 'deepak.yadav@email.com', 'Indore, India', '1990-07-14'),
('Shweta Mishra', '9901234567', 'shweta.mishra@email.com', 'Nagpur, India', '1988-09-22'),
('Manish Kapoor', '9912345678', 'manish.kapoor@email.com', 'Bhopal, India', '1991-04-05'),
('Komal Jain', '9923456789', 'komal.jain@email.com', 'Surat, India', '1993-12-29'),
('Alok Tiwari', '9934567890', 'alok.tiwari@email.com', 'Kanpur, India', '1987-11-17'),
('Riya Sen', '9945678901', 'riya.sen@email.com', 'Patna, India', '1995-06-11'),
('Saurabh Malhotra', '9956789012', 'saurabh.malhotra@email.com', 'Chandigarh, India', '1992-01-23'),
('Tanya Bhatia', '9967890123', 'tanya.bhatia@email.com', 'Delhi, India', '1996-08-15');

-- Branches (10 Records)
INSERT INTO Branches (branch_name, branch_city) VALUES
('Connaught Place Branch', 'Delhi'),
('Andheri Branch', 'Mumbai'),
('Shivaji Nagar Branch', 'Pune'),
('Navrangpura Branch', 'Ahmedabad'),
('MG Road Branch', 'Bangalore'),
('T. Nagar Branch', 'Chennai'),
('Banjara Hills Branch', 'Hyderabad'),
('Salt Lake Branch', 'Kolkata'),
('Hazratganj Branch', 'Lucknow'),
('MI Road Branch', 'Jaipur');

-- Accounts (20 Records)
INSERT INTO Accounts (customer_id, branch_id, account_type, balance, opened_date) VALUES
(1, 1, 'Savings', 50000, '2020-01-15'),
(2, 2, 'Current', 150000, '2019-07-20'),
(3, 3, 'Savings', 25000, '2021-03-10'),
(4, 4, 'Savings', 75000, '2018-09-05'),
(5, 5, 'Current', 180000, '2019-02-11'),
(6, 6, 'Savings', 40000, '2020-06-25'),
(7, 7, 'Savings', 95000, '2018-11-13'),
(8, 8, 'Current', 60000, '2021-01-05'),
(9, 9, 'Savings', 30000, '2020-04-19'),
(10, 10, 'Savings', 120000, '2017-08-29'),
(11, 1, 'Savings', 55000, '2020-02-10'),
(12, 2, 'Current', 80000, '2021-05-14'),
(13, 3, 'Savings', 90000, '2019-11-23'),
(14, 4, 'Current', 110000, '2021-07-19'),
(15, 5, 'Savings', 45000, '2018-12-30'),
(16, 6, 'Current', 135000, '2019-03-15'),
(17, 7, 'Savings', 25000, '2021-09-09'),
(18, 8, 'Current', 70000, '2020-08-20'),
(19, 9, 'Savings', 95000, '2019-10-11'),
(20, 10, 'Current', 160000, '2018-05-05');

-- Transactions (50+ Records)
INSERT INTO Transactions (account_id, transaction_type, amount, transaction_date) VALUES
(1, 'Deposit', 10000, '2021-05-10'),
(1, 'Withdrawal', 5000, '2021-06-15'),
(2, 'Deposit', 25000, '2021-08-20'),
(2, 'Withdrawal', 12000, '2021-09-12'),
(3, 'Deposit', 7000, '2021-09-25'),
(3, 'Withdrawal', 2000, '2021-10-10'),
(4, 'Deposit', 12000, '2021-12-01'),
(4, 'Withdrawal', 4000, '2021-12-20'),
(5, 'Deposit', 20000, '2021-01-20'),
(5, 'Withdrawal', 10000, '2021-03-12'),
(6, 'Deposit', 8000, '2021-05-22'),
(6, 'Withdrawal', 3000, '2021-06-14'),
(7, 'Deposit', 15000, '2021-07-30'),
(7, 'Withdrawal', 7000, '2021-09-18'),
(8, 'Deposit', 22000, '2021-11-11'),
(8, 'Withdrawal', 12000, '2021-12-02'),
(9, 'Deposit', 5000, '2022-01-10'),
(9, 'Withdrawal', 2000, '2022-02-05'),
(10, 'Deposit', 35000, '2022-03-22'),
(10, 'Withdrawal', 15000, '2022-04-19'),
(11, 'Deposit', 18000, '2021-02-15'),
(11, 'Withdrawal', 6000, '2021-03-20'),
(12, 'Deposit', 25000, '2021-05-25'),
(12, 'Withdrawal', 10000, '2021-06-30'),
(13, 'Deposit', 14000, '2021-07-05'),
(13, 'Withdrawal', 9000, '2021-08-10'),
(14, 'Deposit', 20000, '2021-08-15'),
(14, 'Withdrawal', 12000, '2021-09-15'),
(15, 'Deposit', 11000, '2021-10-10'),
(15, 'Withdrawal', 5000, '2021-10-20'),
(16, 'Deposit', 19000, '2021-11-01'),
(16, 'Withdrawal', 8000, '2021-11-25'),
(17, 'Deposit', 6000, '2022-01-05'),
(17, 'Withdrawal', 2000, '2022-01-25'),
(18, 'Deposit', 23000, '2022-02-10'),
(18, 'Withdrawal', 10000, '2022-02-28'),
(19, 'Deposit', 17000, '2022-03-15'),
(19, 'Withdrawal', 7000, '2022-04-05'),
(20, 'Deposit', 30000, '2022-05-12'),
(20, 'Withdrawal', 15000, '2022-05-28');

-- Loans (20 Records)
INSERT INTO Loans (customer_id, branch_id, loan_amount, loan_type, issue_date, due_date) VALUES
(1, 1, 500000, 'Home Loan', '2020-05-01', '2030-05-01'),
(2, 2, 200000, 'Car Loan', '2019-08-15', '2025-08-15'),
(3, 3, 150000, 'Education Loan', '2021-04-10', '2026-04-10'),
(4, 4, 300000, 'Car Loan', '2018-10-01', '2023-10-01'),
(5, 5, 100000, 'Personal Loan', '2019-05-12', '2022-05-12'),
(6, 6, 250000, 'Home Loan', '2020-07-19', '2030-07-19'),
(7, 7, 75000, 'Education Loan', '2018-12-01', '2024-12-01'),
(8, 8, 180000, 'Car Loan', '2021-02-20', '2026-02-20'),
(9, 9, 90000, 'Personal Loan', '2020-06-25', '2023-06-25'),
(10, 10, 400000, 'Home Loan', '2017-09-10', '2027-09-10'),
(11, 1, 220000, 'Car Loan', '2021-01-15', '2026-01-15'),
(12, 2, 175000, 'Personal Loan', '2021-03-10', '2024-03-10'),
(13, 3, 280000, 'Home Loan', '2020-09-05', '2030-09-05'),
(14, 4, 95000, 'Education Loan', '2021-06-11', '2026-06-11'),
(15, 5, 125000, 'Car Loan', '2019-11-20', '2025-11-20'),
(16, 6, 50000, 'Personal Loan', '2020-12-14', '2023-12-14'),
(17, 7, 320000, 'Home Loan', '2021-04-08', '2031-04-08'),
(18, 8, 85000, 'Car Loan', '2019-02-22', '2024-02-22'),
(19, 9, 130000, 'Personal Loan', '2020-07-19', '2025-07-19'),
(20, 10, 210000, 'Education Loan', '2018-03-25', '2023-03-25');


-- 1. Fetch all customer names and their phone numbers--
SELECT name, phone FROM Customers;

-- 2. List all customers who live in Chennai.
SELECT name, address FROM Customers
WHERE address LIKE '%Chennai%';

-- 3. Display all branches located in Bangalore.
SELECT branch_name FROM Branches
WHERE branch_city = 'Bangalore';

-- 4. Show account details of customers who have a balance greater than ₹1,00,000.
SELECT a.account_id, c.name, a.balance
FROM Accounts a
JOIN Customers c ON a.customer_id = c.customer_id
WHERE a.balance > 100000;

-- 5. Find all transactions that happened in the year 2021.
SELECT * FROM Transactions
WHERE YEAR(transaction_date) = 2021;

-- 6. Display each customer’s name along with their branch name where their account is held.
SELECT c.name, b.branch_name
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Branches b ON a.branch_id = b.branch_id;

-- 7. Show all customers who have taken a loan along with their loan type and amount.
SELECT c.name, l.loan_type, l.loan_amount
FROM Customers c
JOIN Loans l ON c.customer_id = l.customer_id;

-- 8. Get customers who have both an account and a loan.
SELECT DISTINCT c.name
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Loans l ON c.customer_id = l.customer_id;

-- 9. Display the account balance of each customer along with their branch city.
SELECT c.name, a.balance, b.branch_city
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Branches b ON a.branch_id = b.branch_id;

-- 10. Show customers who made withdrawals greater than ₹10,000.
SELECT DISTINCT c.name, t.amount
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
WHERE t.transaction_type = 'Withdrawal' AND t.amount > 10000;

-- 11. Find the total balance across all accounts.
SELECT SUM(balance) AS total_balance FROM Accounts;

-- 12. Get the average loan amount for each loan type.
SELECT loan_type, AVG(loan_amount) AS avg_loan
FROM Loans
GROUP BY loan_type; 

-- 13. Find the branch with the maximum number of customers.
SELECT b.branch_name, COUNT(a.account_id) AS total_customers
FROM Branches b
JOIN Accounts a ON b.branch_id = a.branch_id
GROUP BY b.branch_name
ORDER BY total_customers DESC
LIMIT 1;

-- 14. Display the top 3 customers with the highest balances.
SELECT c.name, a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
ORDER BY a.balance DESC
LIMIT 3;

-- 15. Calculate total deposits and withdrawals for each account.
SELECT a.account_id,
       SUM(CASE WHEN t.transaction_type = 'Deposit' THEN t.amount ELSE 0 END) AS total_deposits,
       SUM(CASE WHEN t.transaction_type = 'Withdrawal' THEN t.amount ELSE 0 END) AS total_withdrawals
FROM Accounts a
LEFT JOIN Transactions t ON a.account_id = t.account_id
GROUP BY a.account_id;

-- 
