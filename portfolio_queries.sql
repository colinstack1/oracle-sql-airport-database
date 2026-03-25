-- ============================================================
-- Oracle SQL Airport Database Project
-- Author: Colin Stack
-- File: portfolio_queries.sql
-- Description: Portfolio-ready SQL queries demonstrating joins,
--              reporting, aggregates, and derived metrics.
-- ============================================================

-- ============================================================
-- Q1. Flight route info with departure and arrival cities
-- ============================================================
SELECT fi.flight_id,
       fi.flight_date,
       f.flight_gate,
       dep.city AS departure_city,
       arr.city AS arrival_city
  FROM flight_info fi
  JOIN flight f
    ON f.flight_id = fi.flight_id
  JOIN airport dep
    ON dep.airport_code = fi.depart_airport
  JOIN airport arr
    ON arr.airport_code = fi.arrive_airport
 ORDER BY fi.flight_date, fi.flight_id;

-- ============================================================
-- Q2. Passenger counts and flight load factor
-- ============================================================
SELECT f.flight_id,
       f.max_seats,
       COUNT(p.passenger_id) AS passenger_count,
       ROUND(COUNT(p.passenger_id) / f.max_seats * 100, 2) AS load_factor_pct
  FROM flight f
  LEFT JOIN passenger p
    ON p.flight_id = f.flight_id
 GROUP BY f.flight_id, f.max_seats
 ORDER BY load_factor_pct DESC;

-- ============================================================
-- Q3. Flight manifest with seat assignment and baggage count
-- ============================================================
SELECT p.flight_id,
       p.last_name,
       p.first_name,
       s.seat_number,
       NVL(b.bag_count, 0) AS bag_count
  FROM passenger p
  LEFT JOIN seat s
    ON s.ticket_number = p.ticket_number
  LEFT JOIN baggage b
    ON b.passenger_id = p.passenger_id
 ORDER BY p.flight_id, s.seat_number;

-- ============================================================
-- Q4. Managers, departments, and CEO name
-- ============================================================
SELECT m.department,
       mgr.first_name AS manager_name,
       ceo.first_name AS ceo_name
  FROM management m
  JOIN employee mgr
    ON mgr.employee_id = m.manager_id
  JOIN employee ceo
    ON ceo.employee_id = m.ceo_id
 ORDER BY m.department;

-- ============================================================
-- Q5. Crew roster per flight with pilot name
-- ============================================================
SELECT fc.flight_id,
       crew.first_name AS crew_member,
       fc.role,
       pilot.first_name AS pilot_name
  FROM flight_crew fc
  JOIN employee crew
    ON crew.employee_id = fc.crew_member_id
  LEFT JOIN employee pilot
    ON pilot.employee_id = fc.pilot_id
 ORDER BY fc.flight_id, fc.role;

-- ============================================================
-- Q6. Busiest departure airports by number of flights
-- ============================================================
SELECT depart_airport,
       COUNT(*) AS total_departures
  FROM flight_info
 GROUP BY depart_airport
 ORDER BY total_departures DESC, depart_airport;

-- ============================================================
-- Q7. Highest-paid employee in each job title using a subquery
-- ============================================================
SELECT e.job_title,
       e.first_name,
       e.salary
  FROM employee e
 WHERE e.salary = (
       SELECT MAX(e2.salary)
         FROM employee e2
        WHERE e2.job_title = e.job_title
 )
 ORDER BY e.job_title;

-- ============================================================
-- Optional: Display all tables for review
-- ============================================================
SELECT * FROM airport;
SELECT * FROM flight;
SELECT * FROM flight_info;
SELECT * FROM passenger;
SELECT * FROM seat;
SELECT * FROM baggage;
SELECT * FROM employee;
SELECT * FROM management;
SELECT * FROM flight_crew;
