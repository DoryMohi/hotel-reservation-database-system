# 🏨 Hotel & Guesthouse Management Database System (SQL & NoSQL)

A comprehensive database engineering project designed for a guesthouse management system ("SunnySun Guesthouse"), featuring relational data modeling (3NF), SQL Server DDL/DML, ACID transaction management, role-based security, and a parallel MongoDB NoSQL implementation.

---

## 📌 Features & Implementation

### 1. Relational Database Design (SQL Server)
* **3NF Normalization:** Decomposed transitive dependencies between `Room` and `RoomType` to ensure `DefaultPrice` depends strictly on `RoomTypeID`.
* **Table-per-Subclass Inheritance:** Implemented `Staff` specialization (`Receptionist`, `Housekeeper`, `Manager`).
* **Cascading Delete Handling:** Relational integrity deletion scripts for linked entities (`ServiceUsage`, `Feedback`, `Invoice`, `Payment`).
* **Role-Based Access Control (RBAC):** Configured `ReportingRole`, `DataImporterRole`, and `ApplicationRole` following the Principle of Least Privilege.
* **Transactions & Concurrency:** Modeled ACID transactions and evaluated concurrency anomalies (**Lost Updates**, **Inconsistent Analysis**, **Deadlocks**).

### 2. NoSQL Implementation (MongoDB)
* Modeled document collections (`guests`, `rooms`, `bookings`, `payments`, `serviceUsage`) using `mongosh`.
* Embedded arrays (e.g., storing multiple contact numbers per guest) to eliminate join tables.
* Performed CRUD queries and atomic update operations.

---

## 📁 Repository Structure

* `sql/01_schema_ddl.sql` — Table definitions and foreign key constraints
* `sql/02_sample_data.sql` — Seed data insertions
* `sql/03_delete_cascade.sql` — Referential integrity deletion scripts
* `sql/04_security_roles.sql` — SQL Server RBAC role definitions
* `sql/05_transactions_and_anomalies.sql` — Transactions and deadlock test scripts
* `mongodb/hotel_nosql.js` — MongoDB document collections and queries

---

## 🎓 Academic Context

Developed for the **Database Systems** (5BUIS009C) module at Westminster International University in Tashkent.
