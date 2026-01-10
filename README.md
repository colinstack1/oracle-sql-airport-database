# oracle-sql-airport-database

# Oracle SQL Airport Database Project

## Overview
This project demonstrates the design and implementation of a relational database
for an airport management system using **Oracle SQL**.

The database models real-world airport operations including:
- Employees
- Airports
- Flights
- Aircraft
- Passengers
- Reservations

This project was designed with **data integrity, normalization, and query efficiency**
in mind and is suitable for academic and professional demonstration purposes.

---

## Technologies Used
- Oracle SQL
- SQL Developer / VS Code Oracle Extension
- Relational Database Design
- ER Modeling

---

## Project Structure
- **schema/** – Table creation scripts with constraints
- **data/** – Sample data insertion scripts
- **queries/** – SQL queries demonstrating joins, filters, and reporting
- **diagrams/** – Entity Relationship Diagram (ERD)
- **output/** – Sample query outputs (simulated)

---

## Database Features
- Primary and Foreign Key constraints
- NOT NULL and UNIQUE constraints
- Proper normalization (3NF)
- Meaningful naming conventions
- Realistic sample data

---

## Example Query
```sql
SELECT e.employee_id, e.first_name, e.last_name, a.airport_name
FROM employee e
JOIN airport a ON e.airport_id = a.airport_id;
