CREATE TABLE Passengers (
    passenger_id SERIAL PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    passport_number VARCHAR(15) NOT NULL,
    date_of_bithday DATE,
    phone_number VARCHAR(15),
    email VARCHAR(255) NOT NULL UNIQUE,
    
    CONSTRAINT chk_assport_number_format CHECK (passport_number ~ '^[0-9]{10}$'),
    CONSTRAINT chk_phone_format CHECK (phone_number ~ '^\+?[0-9]{3,15}$'),
    CONSTRAINT chk_email_format CHECK (email ~ '^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
);

CREATE TABLE Airports (
  airport_id SERIAL PRIMARY KEY,
  airport_name VARCHAR(255) NOT NULL,
  city VARCHAR(255),
  country VARCHAR(255)
);

CREATE TABLE Airlines (
	airline_id SERIAL PRIMARY KEY,
    airline_name VARCHAR(255) NOT NULL,
    country VARCHAR(255)
);

CREATE TABLE Airplanes (
    airplane_id SERIAL PRIMARY KEY,
    model VARCHAR(255),
    total_seats INTEGER NOT NULL,
    commisioning_time DATE NOT NULL,
    airline_id INTEGER NOT NULL,

    CONSTRAINT fk_airline FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id)
);

CREATE TABLE Flights (
    flight_id SERIAL PRIMARY KEY,
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    gate_number INTEGER NOT NULL,
    airplane_id INTEGER NOT NULL,
    departure_airport_id INTEGER NOT NULL,
    arrival_airport_id INTEGER NOT NULL,
    
    CONSTRAINT chk_valid_times CHECK (arrival_time > departure_time),
    CONSTRAINT chk_different_airports CHECK (departure_airport_id <> arrival_airport_id),
    CONSTRAINT fk_airplane FOREIGN KEY (airplane_id) REFERENCES Airplanes(airplane_id),
    CONSTRAINT fk_departure_airport FOREIGN KEY (departure_airport_id) REFERENCES Airports(airport_id),
    CONSTRAINT fk_arrival_airport FOREIGN KEY (arrival_airport_id)REFERENCES Airports(airport_id)
);

CREATE TABLE Seats (
    seat_id SERIAL PRIMARY KEY,
    seat_number INTEGER NOT NULL,
    class VARCHAR(10) NOT NULL,
    position_type VARCHAR(20) NOT NULL,
    price INTEGER NOT NULL,
    is_emergency_exit VARCHAR(10) NOT NULL,
    airplane_id INTEGER NOT NULL,

    CONSTRAINT chk_class CHECK (class IN ('Эконом', 'Бизнес', 'Первый')),
    CONSTRAINT chk_position_type CHECK (position_type IN ('У окна', 'Посередине', 'У прохода')),
    CONSTRAINT chk_emergency_exit CHECK (is_emergency_exit IN ('Да', 'Нет')),

    CONSTRAINT fk_airplane FOREIGN KEY (airplane_id) REFERENCES Airplanes(airplane_id)
);

CREATE TABLE Tickets (
    ticket_id SERIAL PRIMARY KEY,
    purchase_date TIMESTAMP,
    seat_id INTEGER NOT NULL,
    flight_id INTEGER NOT NULL,
    passenger_id INTEGER NOT NULL,
    
    CONSTRAINT fk_seat FOREIGN KEY (seat_id) REFERENCES Seats(seat_id),
    CONSTRAINT fk_flight FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    CONSTRAINT fk_passenger FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);

CREATE TABLE Price_history (
  history_id SERIAL PRIMARY KEY,
  old_price INTEGER,
  new_price INTEGER NOT NULL,
  changed_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  seat_id INTEGER NOT NULL,
  
  CONSTRAINT fk_seat FOREIGN KEY (seat_id) REFERENCES Seats(seat_id)
);
