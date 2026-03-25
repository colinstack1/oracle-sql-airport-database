-- ============================================================
-- Oracle SQL Airport Database Project
-- Author: Colin Stack
-- File: insert_data.sql
-- Description: Inserts sample data for airports, employees,
--              flights, passengers, baggage, management, and crew.
-- ============================================================

-- Airports
INSERT INTO airport VALUES ('ATL', 'United States', 'Atlanta', 'Georgia');
INSERT INTO airport VALUES ('SAN', 'United States', 'San Diego', 'California');
INSERT INTO airport VALUES ('LAX', 'United States', 'Los Angeles', 'California');
INSERT INTO airport VALUES ('DFW', 'United States', 'Dallas', 'Texas');
INSERT INTO airport VALUES ('MSP', 'United States', 'Minneapolis', 'Minnesota');

-- Employees
INSERT INTO employee VALUES ('DU00001', 'Jane', '123-456-7890', 'Jane.D@airport.com', '1236 Wallice, Dallas Texas', 'Passenger Service Agent', 40000);
INSERT INTO employee VALUES ('DU02561', 'Hamlet', '745-754-2390', 'Hamlet.y@airport.com', '8987 Quinn Atlanta, Georgia', 'Aircraft Cleaner', 25000);
INSERT INTO employee VALUES ('DU78541', 'Mark', '547-636-0984', 'Mark.v@airport.com', '9083 Gambit Los Angeles, California', 'Gate Crew', 30000);
INSERT INTO employee VALUES ('DU93833', 'Sophia', '983-909-2323', 'Sophia.v@airport.com', '1214 Saline, Michigan', 'Gate Crew', 30000);
INSERT INTO employee VALUES ('DU88932', 'Jackie', '776-009-2324', 'Jackie.v@airport.com', '1653 Cherry Road, Ohio', 'Gate Crew', 30000);
INSERT INTO employee VALUES ('DU85321', 'Poe', '890-487-2634', 'Poe.s@airport.com', '1236 Wallice Dallas, Texas', 'Aircraft Fueler', 75000);
INSERT INTO employee VALUES ('DU35473', 'Luke', '145-442-1296', 'Luke.s@airport.com', '666 Dark Side San Diego, California', 'Security', 20000);
INSERT INTO employee VALUES ('DU35584', 'Jake', '133-888-1669', 'Jake2.s@airport.com', '8892 Bright Way Ann Arbor, Michigan', 'Security', 20000);
INSERT INTO employee VALUES ('IGIBGg99', 'Kenny', '984-334-2345', 'Kenny.s@airport.com', '654 BackWay Dr, Nevada', 'Flight Attendant', 150001);
INSERT INTO employee VALUES ('UGBGJGG78', 'John', '954-554-5642', 'John.s@airport.com', '9833 Computer Service Way, Texas', 'Flight Attendant', 150002);
INSERT INTO employee VALUES ('IGHIGNG22', 'Jane', '456-534-5333', 'Jane2.s@airport.com', '981 Table Turn St, Michigan', 'Flight Attendant', 150003);
INSERT INTO employee VALUES ('UGBGUG88', 'Micheal', '444-777-1111', 'Micheal.s@airport.com', '111 Rosa S, Michigan', 'Flight Attendant', 150004);
INSERT INTO employee VALUES ('777222111', 'Ryan', '133-888-1669', 'Ryan.s@airport.com', '893 Vice Presidents Street, Washington', 'Pilot', 150000);
INSERT INTO employee VALUES ('888333444', 'Kenneth', '982-222-1232', 'Kenneth.s@airport.com', '6139 Michigan Ave, Michigan', 'Pilot', 150005);
INSERT INTO employee VALUES ('FFGINGI99', 'Jackson', '111-543-1234', 'Jackson.s@airport.com', '7738 Apple Drive Chicago, Illinois', 'Manager', 88000);
INSERT INTO employee VALUES ('HGJGUF983', 'Logan', '167-678-5555', 'Logan.s@airport.com', '2222 Peoples Street New York City, New York', 'Manager', 88000);
INSERT INTO employee VALUES ('HDKSNSS88', 'Emma', '467-197-4344', 'Emma.s@airport.com', '124 Pickard Street Portland, New Jersey', 'Manager', 87700);
INSERT INTO employee VALUES ('PPLSMFF12', 'Leslie', '232-578-9876', 'Leslie.s@airport.com', '3938 Happy Shower Way Ann Arbor, Michigan', 'Manager', 90000);
INSERT INTO employee VALUES ('JBFHIGE234', 'Nathan', '222-444-4478', 'Nathan.s@airport.com', '5654 Waze Triangle, New York', 'Manager', 79000);
INSERT INTO employee VALUES ('FGINGL98', 'Colin', '332-676-4444', 'Colin.s@airport.com', '7684 Bright Way Farmington, Michigan', 'CEO', 100000);

-- Flights
INSERT INTO flight VALUES ('QE2468', 'A14', 467, '2343');
INSERT INTO flight VALUES ('YG8754', 'B63', 295, '2344');
INSERT INTO flight VALUES ('PO0013', 'E4', 420, '2345');
INSERT INTO flight VALUES ('LQ2643', 'A20', 440, '2346');
INSERT INTO flight VALUES ('MN2638', 'B2', 853, '2347');

-- Flight information
INSERT INTO flight_info VALUES ('QE2468', 'A14', TO_DATE('2024-06-04','YYYY-MM-DD'), 'ATL', 'MSP', NULL);
INSERT INTO flight_info VALUES ('YG8754', 'B63', TO_DATE('2024-06-04','YYYY-MM-DD'), 'SAN', 'DFW', NULL);
INSERT INTO flight_info VALUES ('PO0013', 'E4', TO_DATE('2024-06-03','YYYY-MM-DD'), 'LAX', 'MSP', NULL);
INSERT INTO flight_info VALUES ('LQ2643', 'A20', TO_DATE('2024-06-06','YYYY-MM-DD'), 'DFW', 'SAN', NULL);
INSERT INTO flight_info VALUES ('MN2638', 'B2', TO_DATE('2024-06-01','YYYY-MM-DD'), 'MSP', 'ATL', NULL);

-- Airplane types
INSERT INTO airplane_type VALUES ('QE2468', 467, 'Boeing', '747');
INSERT INTO airplane_type VALUES ('YG8754', 295, 'Boeing', '757');
INSERT INTO airplane_type VALUES ('PO0013', 420, 'Ilyushin', 'Il-96M');
INSERT INTO airplane_type VALUES ('LQ2643', 440, 'Airbus', 'A330-300');
INSERT INTO airplane_type VALUES ('MN2638', 853, 'Airbus', 'A380');

-- Passengers
INSERT INTO passenger VALUES ('B623495346', 'Linda', 'Bond', 'K', 'Lin35@gmail.com', '734-834-5543', 'AWF01852', 'QE2468');
INSERT INTO passenger VALUES ('C1234567', 'James', 'Cooper', 'P', 'CoopDog74@gmail.com', '844-456-9943', 'AWF01843', 'YG8754');
INSERT INTO passenger VALUES ('S8765432', 'John', 'Smith', 'W', 'Johnnytest@gmail.com', '332-223-1234', 'AWF01853', 'PO0013');
INSERT INTO passenger VALUES ('M4446688', 'Adit', 'McCane', 'G', 'AditCane@gmail.com', '555-555-5555', 'AWF05243', 'LQ2643');
INSERT INTO passenger VALUES ('G2244445', 'Pratik', 'Gomes', 'B', 'GomesB@gmail.com', '606-000-9504', 'AWF18543', 'MN2638');

-- Seats
INSERT INTO seat VALUES ('A4', 'AWF01852');
INSERT INTO seat VALUES ('F21', 'AWF01843');
INSERT INTO seat VALUES ('E14', 'AWF01853');
INSERT INTO seat VALUES ('C12', 'AWF05243');
INSERT INTO seat VALUES ('B1', 'AWF18543');

-- Baggage
INSERT INTO baggage VALUES ('BR123456', 'B623495346', 'ATL', 2);
INSERT INTO baggage VALUES ('BR654321', 'C1234567', 'SAN', 3);
INSERT INTO baggage VALUES ('BR441133', 'S8765432', 'LAX', 4);
INSERT INTO baggage VALUES ('BR998877', 'M4446688', 'DFW', 0);
INSERT INTO baggage VALUES ('BR554364', 'G2244445', 'MSP', 1);

-- Management
INSERT INTO management VALUES ('FFGINGI99', 'FGINGL98', 'Passenger Service Agent');
INSERT INTO management VALUES ('HGJGUF983', 'FGINGL98', 'Aircraft Cleaner');
INSERT INTO management VALUES ('HDKSNSS88', 'FGINGL98', 'Gate Crew');
INSERT INTO management VALUES ('PPLSMFF12', 'FGINGL98', 'Aircraft Fueler');
INSERT INTO management VALUES ('JBFHIGE234', 'FGINGL98', 'Security');

-- Flight crew
INSERT INTO flight_crew VALUES ('IGIBGg99', 'QE2468', 'Flight Attendant', '888333444');
INSERT INTO flight_crew VALUES ('UGBGJGG78', 'YG8754', 'Flight Attendant', '777222111');
INSERT INTO flight_crew VALUES ('IGHIGNG22', 'PO0013', 'Flight Attendant', '777222111');
INSERT INTO flight_crew VALUES ('UGBGUG88', 'LQ2643', 'Flight Attendant', '888333444');
INSERT INTO flight_crew VALUES ('888333444', 'MN2638', 'Pilot', '888333444');

COMMIT;
