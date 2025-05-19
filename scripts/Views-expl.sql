SELECT 
    flight_id,
    airline_name,
    departure_time,
    arrival_time,
    departure_city || ' (' || departure_airport || ')' AS departure,
    arrival_city || ' (' || arrival_airport || ')' AS arrival,
    available_seats
FROM FlightDetails
WHERE departure_city = 'Москва' AND arrival_city = 'Санкт-Петербург'
AND departure_time BETWEEN '2025-01-01' AND '2025-11-30'
ORDER BY departure_time;

SELECT 
    ticket_id,
    departure_time,
    departure_airport,
    arrival_airport,
    seat_number,
    class,
    price
FROM PassengerTickets
WHERE last_name = 'Иванов' AND first_name = 'Иван'
ORDER BY departure_time DESC;

SELECT 
    last_name,
    first_name,
    passport_number,
    seat_number,
    class,
    position_type,
    is_emergency_exit
FROM PassengerTickets
WHERE flight_id = 1
ORDER BY seat_number;