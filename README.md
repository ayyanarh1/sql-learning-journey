# 📚 My SQL Learning Journey

A collection of SQL projects and tasks completed as part of my 
database learning journey. Each chapter covers different SQL concepts 
built from scratch using MySQL Workbench.

---

## 🗂️ Projects

### 01 - Sales Management Database
A sales management system inspired by the Classic Models dataset.

**Tables:** ProductLines, Offices, Employees, Customers, Products, Orders, OrderDetails, Payments

**Topics Covered:**
- CREATE TABLE with constraints and foreign keys
- INSERT INTO with real data
- SELECT with WHERE and multiple conditions
- ORDER BY, LIMIT
- UPDATE with CONCAT and REPLACE
- GROUP BY and COUNT
- Aggregate functions (SUM, AVG, MIN, MAX, COUNT)
- HAVING clause
- Subqueries
- YEAR(), LIKE for date filtering

---

### 02 - Hotel Reservations Database
A fully designed hotel management system built from scratch.

**Tables:** Hotels, RoomTypes, Rooms, Guests, Reservations, Services, Payments, Staff

**Topics Covered:**
- CREATE TABLE with composite PRIMARY KEY
- Self-referencing FOREIGN KEY (Staff → Manager)
- Composite FOREIGN KEY (Rooms)
- ALTER TABLE (ADD COLUMN, RENAME COLUMN)
- INSERT INTO across 8 related tables
- INNER JOIN, LEFT JOIN, RIGHT JOIN, CROSS JOIN
- UNION (FULL JOIN simulation)
- DATEDIFF for date calculations
- COALESCE for NULL handling
- CONCAT for combining columns
- ORDER BY ASC / DESC

---

## 🛠️ Tools Used
- MySQL 8.0
- MySQL Workbench

---

## 📈 Progress

| Chapter | Topic | Status |
|---|---|---|
| Chapter 3 | Sales Management DB | ✅ Completed |
| Chapter 4 | Aggregate Functions | ✅ Completed |
| Chapter 5 | Hotel Reservations + JOINs | ✅ Completed |
| Chapter 6 | Views & Indexes | ⏳ Coming soon |
| Chapter 7 | Stored Procedures | ⏳ Coming soon |
| Chapter 8 | Triggers & Transactions | ⏳ Coming soon |

---

## 💡 Key Concepts Learned

| Concept | Example |
|---|---|
| Composite Primary Key | `PRIMARY KEY (roomNumber, hotelCode)` |
| Self Join | Staff table manager hierarchy |
| HAVING vs WHERE | HAVING filters after GROUP BY |
| INSERT IGNORE | Skip duplicate key errors |
| COALESCE | Replace NULL with default value |

---

## 🙋 About
Self-learning SQL from scratch — practicing real world 
database design and query writing daily.
