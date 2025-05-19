CREATE VIEW FlightDetails AS
SELECT 
    f.flight_id,
    f.departure_time,
    f.arrival_time,
    f.gate_number,
    dep.airport_name AS departure_airport,
    dep.city AS departure_city,
    dep.country AS departure_country,
    arr.airport_name AS arrival_airport,
    arr.city AS arrival_city,
    arr.country AS arrival_country,
    al.airline_name,
    ap.model AS airplane_model,
    ap.total_seats,
    (SELECT COUNT(*) FROM Tickets t WHERE t.flight_id = f.flight_id) AS sold_tickets,
    ap.total_seats - (SELECT COUNT(*) FROM Tickets t WHERE t.flight_id = f.flight_id) AS available_seats
FROM 
    Flights f
JOIN 
    Airports dep ON f.departure_airport_id = dep.airport_id
JOIN 
    Airports arr ON f.arrival_airport_id = arr.airport_id
JOIN 
    Airplanes ap ON f.airplane_id = ap.airplane_id
JOIN 
    Airlines al ON ap.airline_id = al.airline_id;

CREATE OR REPLACE VIEW PassengerTickets AS
SELECT 
    p.passenger_id,
    p.last_name,
    p.first_name,
    p.passport_number,
    t.ticket_id,
    t.purchase_date,
    f.flight_id,
    f.departure_time,
    f.arrival_time,
    dep.airport_name AS departure_airport,
    arr.airport_name AS arrival_airport,
    s.seat_number,
    s.class,
    s.position_type,
    s.price,
    s.is_emergency_exit,
    ap.model AS airplane_model,
    al.airline_name
FROM 
    Passengers p
JOIN 
    Tickets t ON p.passenger_id = t.passenger_id
JOIN 
    Flights f ON t.flight_id = f.flight_id
JOIN 
    Seats s ON t.seat_id = s.seat_id
JOIN 
    Airplanes ap ON f.airplane_id = ap.airplane_id
JOIN 
    Airlines al ON ap.airline_id = al.airline_id
JOIN 
    Airports dep ON f.departure_airport_id = dep.airport_id
JOIN 
    Airports arr ON f.arrival_airport_id = arr.airport_id;
