-- ============================================================
-- Oracle SQL Airport Database Project
-- Author: Colin Stack
-- File: create_tables.sql
-- Description: Safely drops existing objects and creates the
--              normalized airport database schema.
-- ============================================================

SET ECHO ON;
SET LINESIZE 120;
SET PAGESIZE 120;

-- ============================================================
-- SAFE DROPS (RERUN FRIENDLY)
-- ============================================================

BEGIN
   EXECUTE IMMEDIATE 'DROP VIEW v_employee_basic';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE seat CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE baggage CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE passenger CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE flight_crew CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE management CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE airplane_type CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE flight_info CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE flight CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE airport CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE employee CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

-- ============================================================
-- CORE TABLES
-- ============================================================

CREATE TABLE employee (
   employee_id VARCHAR2(10) NOT NULL,
   first_name  VARCHAR2(20) NOT NULL,
   phone       VARCHAR2(12),
   email       VARCHAR2(40),
   address     VARCHAR2(60),
   job_title   VARCHAR2(100),
   salary      NUMBER(9) CHECK (salary >= 0),
   CONSTRAINT pk_employee PRIMARY KEY (employee_id)
);

CREATE TABLE airport (
   airport_code VARCHAR2(3) NOT NULL,
   country      VARCHAR2(30),
   city         VARCHAR2(30),
   state        VARCHAR2(30),
   CONSTRAINT pk_airport PRIMARY KEY (airport_code)
);

CREATE TABLE flight (
   flight_id    VARCHAR2(10) NOT NULL,
   flight_gate  VARCHAR2(3) NOT NULL,
   max_seats    NUMBER(4) CHECK (max_seats > 0),
   airline_code VARCHAR2(10),
   CONSTRAINT pk_flight PRIMARY KEY (flight_id),
   CONSTRAINT uq_flight_gate UNIQUE (flight_gate)
);

CREATE TABLE flight_info (
   flight_id       VARCHAR2(10) NOT NULL,
   flight_gate     VARCHAR2(3) NOT NULL,
   flight_date     DATE NOT NULL,
   depart_airport  VARCHAR2(3) NOT NULL,
   arrive_airport  VARCHAR2(3) NOT NULL,
   layover_airport VARCHAR2(3),
   CONSTRAINT pk_flight_info PRIMARY KEY (flight_id),
   CONSTRAINT fk_fi_flight FOREIGN KEY (flight_id)
      REFERENCES flight (flight_id),
   CONSTRAINT fk_fi_gate FOREIGN KEY (flight_gate)
      REFERENCES flight (flight_gate),
   CONSTRAINT fk_fi_depart FOREIGN KEY (depart_airport)
      REFERENCES airport (airport_code),
   CONSTRAINT fk_fi_arrive FOREIGN KEY (arrive_airport)
      REFERENCES airport (airport_code),
   CONSTRAINT fk_fi_layover FOREIGN KEY (layover_airport)
      REFERENCES airport (airport_code)
);

CREATE TABLE airplane_type (
   flight_id    VARCHAR2(10) NOT NULL,
   seat_count   NUMBER(4) NOT NULL CHECK (seat_count > 0),
   manufacturer VARCHAR2(20) NOT NULL,
   model        VARCHAR2(20) NOT NULL,
   CONSTRAINT pk_airplane_type PRIMARY KEY (flight_id),
   CONSTRAINT fk_ap_flight FOREIGN KEY (flight_id)
      REFERENCES flight (flight_id)
);

-- ============================================================
-- PASSENGERS AND RELATED TABLES
-- ============================================================

CREATE TABLE passenger (
   passenger_id   VARCHAR2(10) NOT NULL,
   first_name     VARCHAR2(20) NOT NULL,
   last_name      VARCHAR2(20) NOT NULL,
   middle_initial VARCHAR2(1),
   email          VARCHAR2(50),
   phone          VARCHAR2(12),
   ticket_number  VARCHAR2(8) NOT NULL,
   flight_id      VARCHAR2(10) NOT NULL,
   CONSTRAINT pk_passenger PRIMARY KEY (passenger_id),
   CONSTRAINT uq_passenger_ticket UNIQUE (ticket_number),
   CONSTRAINT fk_passenger_flight FOREIGN KEY (flight_id)
      REFERENCES flight_info (flight_id)
);

CREATE TABLE seat (
   seat_number   VARCHAR2(3) NOT NULL,
   ticket_number VARCHAR2(8) NOT NULL,
   CONSTRAINT pk_seat PRIMARY KEY (seat_number),
   CONSTRAINT uq_seat_ticket UNIQUE (ticket_number),
   CONSTRAINT fk_seat_ticket FOREIGN KEY (ticket_number)
      REFERENCES passenger (ticket_number)
);

CREATE TABLE baggage (
   bag_code       VARCHAR2(8) NOT NULL,
   passenger_id   VARCHAR2(10) NOT NULL,
   origin_airport VARCHAR2(3) NOT NULL,
   bag_count      NUMBER(2) NOT NULL CHECK (bag_count >= 0),
   CONSTRAINT pk_baggage PRIMARY KEY (bag_code),
   CONSTRAINT fk_bag_passenger FOREIGN KEY (passenger_id)
      REFERENCES passenger (passenger_id),
   CONSTRAINT fk_bag_origin FOREIGN KEY (origin_airport)
      REFERENCES airport (airport_code)
);

-- ============================================================
-- MANAGEMENT AND FLIGHT CREW
-- ============================================================

CREATE TABLE management (
   manager_id VARCHAR2(10) NOT NULL,
   ceo_id     VARCHAR2(10) NOT NULL,
   department VARCHAR2(40) NOT NULL,
   CONSTRAINT pk_management PRIMARY KEY (manager_id),
   CONSTRAINT uq_management_dept UNIQUE (department),
   CONSTRAINT fk_mgmt_mgr FOREIGN KEY (manager_id)
      REFERENCES employee (employee_id),
   CONSTRAINT fk_mgmt_ceo FOREIGN KEY (ceo_id)
      REFERENCES employee (employee_id)
);

CREATE TABLE flight_crew (
   crew_member_id VARCHAR2(10) NOT NULL,
   flight_id      VARCHAR2(10) NOT NULL,
   role           VARCHAR2(20) NOT NULL,
   pilot_id       VARCHAR2(10),
   CONSTRAINT pk_flight_crew PRIMARY KEY (crew_member_id, flight_id),
   CONSTRAINT fk_fc_crew FOREIGN KEY (crew_member_id)
      REFERENCES employee (employee_id),
   CONSTRAINT fk_fc_flight FOREIGN KEY (flight_id)
      REFERENCES flight_info (flight_id),
   CONSTRAINT fk_fc_pilot FOREIGN KEY (pilot_id)
      REFERENCES employee (employee_id)
);

-- ============================================================
-- REPORTING VIEW
-- ============================================================

CREATE OR REPLACE VIEW v_employee_basic AS
   SELECT employee_id,
          first_name,
          job_title,
          salary
     FROM employee;
