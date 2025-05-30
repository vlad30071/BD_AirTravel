INSERT INTO Passengers (last_name, first_name, passport_number, date_of_bithday, phone_number, email)
values
('Иванов', 'Иван', 1234567890, '1985-05-15', '+79161234567', 'ivanov@example.com'),
('Петрова', 'Мария', 3876543210, '1990-11-22', '+79169876543', 'petrova@example.com'),
('Сидоров', 'Алексей', 1567890123, '1978-03-08', '+79154567890', 'sidorov@example.com'),
('Кузнецова', 'Елена', 7210987654, '1995-07-30', '+79153210987', 'kuznetsova@example.com'),
('Васильев', 'Дмитрий', 1543210987, '1982-09-14', '+79156543210', 'vasiliev@example.com'),
('Смирнов', 'Александр', 8678901234, '1992-08-25', '+79155678901', 'smirnov.alex@example.com'),
('Козлова', 'Ольга', 1456789012, '1988-04-12', '+79153456789', 'kozlova.olga@example.com'),
('Федоров', 'Михаил', 3890123456, '1975-11-30', '+79157890123', 'fedorov.m@example.com'),
('Николаева', 'Анна', 1345678901, '1998-02-18', '+79152345678', 'nikolaeva.anna@example.com'),
('Орлов', 'Денис', 6901234567, '1983-07-22', '+79158901234', 'orlov.denis@example.com'),
('Зайцева', 'Екатерина', 2567890123, '1991-09-05', '+79154567890', 'zaitseva.ek@example.com'),
('Белов', 'Павел', 5789012345, '1979-12-14', '+79156789012', 'belov.pavel@example.com'),
('Григорьева', 'Наталья', 7234509876, '1987-03-27', '+79151234509', 'grigorieva.n@example.com'),
('Титов', 'Артем', 4876123450, '1994-06-08', '+79159876123', 'titov.artem@example.com'),
('Крылова', 'Виктория', 1432167890, '1980-10-31', '+79155432167', 'krylova.vika@example.com');

INSERT INTO Airports (airport_name, city, country)
VALUES 
('Шереметьево', 'Москва', 'Россия'),
('Пулково', 'Санкт-Петербург', 'Россия'),
('Домодедово', 'Москва', 'Россия'),
('Хитроу', 'Лондон', 'Великобритания'),
('Шарль де Голль', 'Париж', 'Франция'),
('Внуково', 'Москва', 'Россия'),
('Кольцово', 'Екатеринбург', 'Россия'),
('Сочи', 'Сочи', 'Россия'),
('Толмачёво', 'Новосибирск', 'Россия'),
('Франкфурт-на-Майне', 'Франкфурт', 'Германия'),
('Схипхол', 'Амстердам', 'Нидерланды'),
('Джон Кеннеди', 'Нью-Йорк', 'США'),
('Дубай', 'Дубай', 'ОАЭ'),
('Сингапур Чанги', 'Сингапур', 'Сингапур'),
('Ханеда', 'Токио', 'Япония');

INSERT INTO Airlines (airline_name, country)
VALUES 
('Аэрофлот', 'Россия'),
('S7 Airlines', 'Россия'),
('British Airways', 'Великобритания'),
('Air France', 'Франция'),
('Lufthansa', 'Германия'),
('Уральские авиалинии', 'Россия'),
('Россия', 'Россия'),
('Utair', 'Россия'),
('Emirates', 'ОАЭ'),
('Qatar Airways', 'Катар'),
('Turkish Airlines', 'Турция'),
('Singapore Airlines', 'Сингапур'),
('Cathay Pacific', 'Гонконг'),
('Qantas', 'Австралия'),
('Delta Air Lines', 'США');

INSERT INTO Airplanes (model, total_seats, commisioning_time, airline_id)
VALUES 
('Boeing 737-800', 189, '2018-05-10', 1),
('Airbus A320', 180, '2019-03-15', 2),
('Boeing 777-300ER', 402, '2017-11-22', 3),
('Airbus A350', 324, '2020-01-30', 4),
('Boeing 787-9', 294, '2019-07-14', 5),
('Sukhoi Superjet 100', 98, '2019-03-12', 1),
('Irkut MC-21-300', 163, '2021-07-25', 1),
('Boeing 737-800', 158, '2018-05-18', 2),
('Airbus A320neo', 168, '2020-02-10', 2),
('Boeing 737-500', 108, '2015-11-30', 3),
('Airbus A380-800', 489, '2017-01-15', 4),
('Boeing 777-300ER', 354, '2019-08-22', 4),
('Airbus A350-1000', 369, '2022-03-05', 5),
('Boeing 787-9', 302, '2021-11-18', 5),
('Airbus A321neo', 194, '2020-09-14', 6),
('Boeing 737 MAX 8', 178, '2022-01-30', 6),
('Airbus A330-300', 285, '2018-07-12', 7),
('Boeing 787-10', 337, '2023-02-28', 7),
('Bombardier CRJ-200', 50, '2016-04-05', 2),
('Embraer E190', 104, '2017-10-15', 3),
('ATR 72-600', 72, '2019-05-20', 1),
('Boeing 747-8F', 0, '2018-12-10', 4),
('Boeing 777F', 0, '2020-06-25', 5),
('Mil Mi-8', 24, '2015-09-01', 3),
('Tupolev Tu-204', 176, '2014-07-18', 1),
('Ilyushin Il-96-300', 262, '2016-11-22', 1),
('Comac C919', 158, '2023-09-15', 7),
('Airbus A220-300', 135, '2022-08-12', 6),
('Gulfstream G650', 18, '2021-04-05', 5),
('Bombardier Global 7500', 19, '2022-10-30', 4);

INSERT INTO Flights (departure_time, arrival_time, gate_number, airplane_id, departure_airport_id, arrival_airport_id)
VALUES 
('2025-06-15 08:00:00', '2025-06-15 10:30:00', 15, 1, 1, 2),
('2025-06-15 12:30:00', '2025-06-15 16:45:00', 22, 2, 2, 3),
('2025-06-16 09:15:00', '2025-06-16 12:30:00', 8, 3, 1, 4),
('2025-06-16 14:00:00', '2025-06-16 17:20:00', 12, 4, 3, 5),
('2025-06-17 07:30:00', '2025-06-17 11:45:00', 5, 5, 4, 1),
('2025-11-15 07:30:00', '2025-11-15 09:45:00', 10, 1, 1, 2),
('2025-11-15 12:15:00', '2025-11-15 16:30:00', 22, 3, 2, 3),
('2025-11-16 08:00:00', '2025-11-16 12:20:00', 15, 5, 3, 4),
('2025-11-16 14:30:00', '2025-11-16 16:45:00', 5, 2, 1, 5),
('2025-11-17 09:00:00', '2025-11-17 11:15:00', 8, 4, 1, 6),
('2025-11-18 13:20:00', '2025-11-18 23:50:00', 33, 7, 5, 10),
('2025-11-19 08:45:00', '2025-11-19 19:30:00', 42, 9, 6, 9),
('2025-11-20 10:30:00', '2025-11-20 12:00:00', 12, 6, 7, 8),
('2025-11-21 16:20:00', '2025-11-21 18:45:00', 7, 8, 8, 7),
('2024-11-22 11:00:00', '2024-11-22 14:30:00', 55, 10, 9, 11),
('2024-11-23 18:15:00', '2024-11-24 07:45:00', 61, 12, 10, 11),
('2024-12-15 09:30:00', '2024-12-15 12:45:00', 18, 13, 3, 1),
('2024-12-20 13:00:00', '2024-12-20 15:15:00', 21, 14, 4, 2),
('2024-11-24 22:10:00', '2024-11-25 01:40:00', 9, 15, 5, 6),
('2024-11-25 03:30:00', '2024-11-25 06:00:00', 14, 16, 6, 5),
('2024-11-26 07:45:00', '2024-11-26 08:30:00', 3, 17, 7, 12),
('2024-11-27 11:20:00', '2024-11-27 12:05:00', 6, 18, 12, 7),
('2024-11-28 14:50:00', '2024-11-28 18:20:00', 25, 19, 8, 13),
('2024-11-29 10:15:00', '2024-11-29 14:45:00', 30, 20, 13, 8),
('2024-11-30 23:30:00', '2024-12-01 09:15:00', 88, 21, 9, 10),
('2024-12-02 02:00:00', '2024-12-02 11:30:00', 77, 22, 10, 9),
('2024-12-05 08:00:00', '2024-12-05 10:30:00', 45, 23, 3, 14),
('2024-12-10 19:45:00', '2024-12-10 22:15:00', 52, 24, 14, 3),
('2024-12-15 12:00:00', '2024-12-15 12:45:00', 99, 25, 1, 4),
('2024-12-15 12:00:00', '2024-12-15 12:30:00', 9, 23, 2, 4);

INSERT INTO Seats (seat_number, class, position_type, price, is_emergency_exit, airplane_id)
VALUES 
(1, 'Первый', 'У окна', 50000, 'Нет', 1),
(2, 'Первый', 'У прохода', 48000, 'Нет', 1),
(10, 'Бизнес', 'У окна', 35000, 'Нет', 1),
(11, 'Бизнес', 'Посередине', 32000, 'Нет', 1),
(25, 'Эконом', 'У окна', 15000, 'Да', 1),
(26, 'Эконом', 'У прохода', 14000, 'Нет', 1),
(1, 'Первый', 'У окна', 45000, 'Нет', 2),
(2, 'Первый', 'У прохода', 43000, 'Нет', 2),
(10, 'Бизнес', 'У окна', 30000, 'Нет', 2),
(25, 'Эконом', 'У окна', 12000, 'Да', 2),
(1, 'Первый', 'У окна', 75000, 'Нет', 1),
(2, 'Первый', 'У прохода', 72000, 'Нет', 1),
(3, 'Первый', 'У окна', 75000, 'Нет', 1),
(4, 'Первый', 'У прохода', 72000, 'Нет', 1),
(5, 'Бизнес', 'У окна', 50000, 'Нет', 1),
(6, 'Бизнес', 'Посередине', 48000, 'Нет', 1),
(7, 'Бизнес', 'У прохода', 49000, 'Нет', 1),
(8, 'Бизнес', 'У окна', 50000, 'Нет', 1),
(9, 'Эконом', 'У окна', 25000, 'Да', 1),
(10, 'Эконом', 'Посередине', 22000, 'Нет', 1),
(11, 'Эконом', 'У прохода', 23000, 'Нет', 1),
(12, 'Эконом', 'У окна', 25000, 'Нет', 1),
(13, 'Эконом', 'Посередине', 22000, 'Нет', 1),
(14, 'Эконом', 'У прохода', 23000, 'Нет', 1),
(15, 'Эконом', 'У окна', 25000, 'Да', 1),
(1, 'Первый', 'У окна', 80000, 'Нет', 2),
(2, 'Первый', 'У прохода', 77000, 'Нет', 2),
(3, 'Бизнес', 'У окна', 55000, 'Нет', 2),
(4, 'Бизнес', 'Посередине', 52000, 'Нет', 2),
(5, 'Бизнес', 'У прохода', 53000, 'Нет', 2),
(6, 'Эконом', 'У окна', 27000, 'Да', 2),
(7, 'Эконом', 'Посередине', 24000, 'Нет', 2),
(8, 'Эконом', 'У прохода', 25000, 'Нет', 2),
(9, 'Эконом', 'У окна', 27000, 'Нет', 2),
(10, 'Эконом', 'Посередине', 24000, 'Нет', 2);

INSERT INTO Tickets (purchase_date, seat_id, flight_id, passenger_id)
VALUES 
('2023-05-20 14:30:00', 1, 1, 1),
('2023-05-21 09:15:00', 2, 1, 2),
('2023-05-22 16:45:00', 3, 1, 3),
('2023-05-23 11:20:00', 4, 1, 4),
('2023-05-24 13:10:00', 5, 1, 5),
('2023-11-01 09:15:22', 6, 1, 1),
('2023-11-02 14:30:45', 7, 2, 2),
('2023-11-03 11:20:33', 8, 2, 3),
('2023-11-04 16:45:12', 9, 2, 4),
('2023-11-05 10:10:08', 10, 1, 5),
('2023-11-06 13:25:51', 11, 1, 6),
('2023-11-07 08:40:27', 12, 1, 7),
('2023-11-08 17:55:39', 13, 1, 8),
('2023-11-09 12:30:14', 14, 1, 9),
('2023-11-10 15:45:03', 15, 1, 10),
('2023-11-11 07:20:18', 16, 1, 1),
('2023-11-12 18:35:42', 17, 1, 2),
('2023-11-13 09:50:29', 18, 1, 3),
('2023-11-14 14:05:57', 19, 1, 4),
('2023-11-15 11:40:36', 20, 1, 5),
('2023-11-16 16:15:24', 21, 2, 6),
('2023-11-17 10:30:11', 22, 2, 7),
('2023-11-18 13:45:48', 23, 2, 8),
('2023-11-19 08:20:05', 24, 2, 9),
('2023-11-20 17:35:33', 25, 2, 10),
('2023-11-21 12:10:19', 26, 2, 1),
('2023-11-22 15:25:47', 27, 2, 2),
('2023-11-23 06:50:22', 28, 2, 3),
('2023-11-24 19:05:54', 29, 2, 4),
('2023-11-25 14:40:31', 30, 2, 5);

INSERT INTO Price_history (old_price, new_price, seat_id)
VALUES 
(NULL, 50000, 1),
(50000, 52000, 1),
(52000, 50000, 1),
(NULL, 15000, 5),
(15000, 16000, 5),
(NULL, 45000, 7),
(45000, 47000, 7),
(NULL, 12000, 10),
(12000, 13000, 10),
(25000, 27000, 9),
(27000, 26000, 9),
(22000, 24000, 10),
(24000, 23000, 10),
(23000, 25000, 11),
(25000, 24000, 11);