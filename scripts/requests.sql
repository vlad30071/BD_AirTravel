--Найти 5 самых дорогих билетов бизнес-класса, купленных в последние 2 года
SELECT t.ticket_id, p.last_name, p.first_name, s.price, f.departure_time
FROM Tickets t
JOIN Seats s ON t.seat_id = s.seat_id
JOIN Passengers p ON t.passenger_id = p.passenger_id
JOIN Flights f ON t.flight_id = f.flight_id
WHERE s.class = 'Бизнес' 
  AND t.purchase_date >= CURRENT_DATE - INTERVAL '2 year'
ORDER BY s.price DESC
LIMIT 5;

--Авиакомпании, у которых средняя стоимость билета первого класса превышает 50000 рублей
SELECT a.airline_name, AVG(s.price) as avg_price
FROM Seats s
JOIN Airplanes ap ON s.airplane_id = ap.airplane_id
JOIN Airlines a ON ap.airline_id = a.airline_id
WHERE s.class = 'Первый'
GROUP BY a.airline_name
HAVING AVG(s.price) > 50000
ORDER BY avg_price DESC;

--всех пассажиров, летавших из аэропортов Москвы
SELECT DISTINCT p.last_name, p.first_name, p.passport_number
FROM Passengers p
JOIN Tickets t ON p.passenger_id = t.passenger_id
JOIN Flights f ON t.flight_id = f.flight_id
WHERE f.departure_airport_id IN (
    SELECT airport_id FROM Airports WHERE city = 'Москва'
)
ORDER BY p.last_name;

--самолеты, на которых еще не продано ни одного билета
SELECT ap.airplane_id, ap.model, a.airline_name
FROM Airplanes ap
JOIN Airlines a ON ap.airline_id = a.airline_id
WHERE NOT EXISTS (
    SELECT 1 FROM Tickets t
    JOIN Flights f ON t.flight_id = f.flight_id
    WHERE f.airplane_id = ap.airplane_id
);

--Вывести топ-3 самых загруженных рейса по количеству проданных билетов
SELECT f.flight_id, 
       dep.airport_name as departure, 
       arr.airport_name as arrival,
       COUNT(t.ticket_id) as tickets_sold,
       RANK() OVER (ORDER BY COUNT(t.ticket_id) DESC) as rank
FROM Flights f
JOIN Airports dep ON f.departure_airport_id = dep.airport_id
JOIN Airports arr ON f.arrival_airport_id = arr.airport_id
LEFT JOIN Tickets t ON f.flight_id = t.flight_id
GROUP BY f.flight_id, dep.airport_name, arr.airport_name
ORDER BY tickets_sold DESC
LIMIT 3;

--Найти аэропорты, из которых выполнялись рейсы на самолетах с количеством мест больше среднего
SELECT DISTINCT a.airport_name, a.city, a.country
FROM Airports a
FULL JOIN Flights f ON a.airport_id = f.departure_airport_id
WHERE f.airplane_id = ANY (
    SELECT airplane_id FROM Airplanes 
    WHERE total_seats > (SELECT AVG(total_seats) FROM Airplanes)
)
ORDER BY a.city;

--Вывести динамику изменения средней цены билетов по месяцам
SELECT 
    DATE_TRUNC('month', t.purchase_date) as month,
    AVG(s.price) as avg_price,
    SUM(AVG(s.price)) OVER (ORDER BY DATE_TRUNC('month', t.purchase_date)) as running_avg
FROM Tickets t
JOIN Seats s ON t.seat_id = s.seat_id
WHERE t.purchase_date IS NOT NULL
GROUP BY DATE_TRUNC('month', t.purchase_date)
ORDER BY month;

--Найти пассажиров, которые купили билеты дороже всех билетов эконом-класса
SELECT p.last_name, p.first_name, MAX(s.price) as max_price_paid
FROM Passengers p
JOIN Tickets t ON p.passenger_id = t.passenger_id
JOIN Seats s ON t.seat_id = s.seat_id
GROUP BY p.passenger_id
HAVING MAX(s.price) > ALL (
    SELECT price FROM Seats WHERE class = 'Эконом'
)
ORDER BY max_price_paid DESC;

--Вывести историю изменений цен на места с указанием предыдущей и следующей цены
SELECT 
    s.seat_id,
    s.seat_number,
    ph.changed_timestamp,
    ph.old_price,
    ph.new_price,
    LAG(ph.new_price) OVER (PARTITION BY s.seat_id ORDER BY ph.changed_timestamp) as prev_price,
    LEAD(ph.new_price) OVER (PARTITION BY s.seat_id ORDER BY ph.changed_timestamp) as next_price
FROM Price_history ph
JOIN Seats s ON ph.seat_id = s.seat_id
ORDER BY s.seat_id, ph.changed_timestamp;

--Найти 5 следующих рейсов из заданного аэропорта (пропустив первые 3), для которых есть свободные места бизнес-класса
SELECT f.flight_id, f.departure_time, f.arrival_time, 
       arr.airport_name as destination,
       (SELECT COUNT(*) FROM Seats s 
        WHERE s.airplane_id = f.airplane_id 
        AND s.class = 'Бизнес'
        AND NOT EXISTS (
            SELECT 1 FROM Tickets t 
            WHERE t.seat_id = s.seat_id 
            AND t.flight_id = f.flight_id
        )) as free_business_seats
FROM Flights f
JOIN Airports arr ON f.arrival_airport_id = arr.airport_id
RIGHT JOIN (
    SELECT flight_id FROM Flights 
    WHERE departure_airport_id = (SELECT airport_id FROM Airports WHERE airport_name = 'Шереметьево')
    AND departure_time > CURRENT_TIMESTAMP
    ORDER BY departure_time
    LIMIT 5 OFFSET 3
) upcoming ON f.flight_id = upcoming.flight_id
ORDER BY f.departure_time;