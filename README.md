# Oracle SQL Airport Database Project

## Overview
This project demonstrates the design and implementation of a normalized relational database for an airport management system using **Oracle SQL**.

The database models core airport operations including:
- Employees
- Airports
- Flights
- Flight schedules
- Aircraft assignments
- Passengers
- Seats
- Baggage
- Management structure
- Flight crew assignments

This project was designed to showcase:
- Relational database design
- Primary and foreign key constraints
- Data integrity and normalization
- Reporting queries using joins and aggregates
- Clean SQL organization for portfolio presentation

## Technologies Used
- Oracle SQL
- SQL Developer / SQL*Plus
- Relational Database Design
- Entity Relationships and Constraints

## Project Structure
- **schema/** – table creation script with constraints and safe rerun logic
- **data/** – sample data insertion script
- **queries/** – reporting and portfolio queries
- **output/** – sample query output examples

## Key Features
- Safe object drops for rerunnable execution
- Primary key, foreign key, unique, and check constraints
- Normalized schema design
- Sample business-oriented reporting queries
- Operational metrics such as flight load factor

## Example Query
```sql
SELECT f.flight_id,
       f.max_seats,
       COUNT(p.passenger_id) AS passenger_count,
       ROUND(COUNT(p.passenger_id) / f.max_seats * 100, 2) AS load_factor_pct
FROM flight f
LEFT JOIN passenger p ON p.flight_id = f.flight_id
GROUP BY f.flight_id, f.max_seats
ORDER BY load_factor_pct DESC;
```

## How to Run
1. Run `schema/create_tables.sql`
2. Run `data/insert_data.sql`
3. Run `queries/portfolio_queries.sql`

## What This Project Demonstrates
- Real-world database modeling
- Strong SQL fundamentals
- Joins, aggregation, and derived metrics
- Clean documentation and portfolio-ready organization

## Author
**Colin Stack**
