-- Индекс для поиска рейсов по дате вылета
CREATE INDEX idx_flights_departure_time ON Flights(departure_time);

-- Индекс для поиска рейсов по аэропорту вылета
CREATE INDEX idx_flights_departure_airport ON Flights(departure_airport_id);

-- Индекс для поиска рейсов по аэропорту прибытия
CREATE INDEX idx_flights_arrival_airport ON Flights(arrival_airport_id);

-- Составной индекс для поиска рейсов по маршруту
CREATE INDEX idx_flights_route ON Flights(departure_airport_id, arrival_airport_id);

-- Индекс для поиска билетов по пассажиру
CREATE INDEX idx_tickets_passenger ON Tickets(passenger_id);

-- Индекс для поиска билетов по рейсу
CREATE INDEX idx_tickets_flight ON Tickets(flight_id);

-- Индекс для поиска билетов по дате покупки
CREATE INDEX idx_tickets_purchase_date ON Tickets(purchase_date);

-- Составной индекс для часто используемого соединения рейса и места
CREATE INDEX idx_tickets_flight_seat ON Tickets(flight_id, seat_id);