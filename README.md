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
SELECT fi.flight_id,
       fi.flight_date,
       f.flight_gate,
       dep.city AS departure_city,
       arr.city AS arrival_city
FROM flight_info fi
JOIN flight f ON f.flight_id = fi.flight_id
JOIN airport dep ON dep.airport_code = fi.depart_airport
JOIN airport arr ON arr.airport_code = fi.arrive_airport;
