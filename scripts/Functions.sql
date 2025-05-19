CREATE FUNCTION calculate_flight_revenue(p_flight_id INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
    total_revenue INTEGER := 0;
BEGIN
    SELECT COALESCE(SUM(s.price), 0)
    INTO total_revenue
    FROM Tickets t
    JOIN Seats s ON t.seat_id = s.seat_id
    WHERE t.flight_id = p_flight_id;
    
    RETURN total_revenue;
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Ошибка при расчете дохода: %', SQLERRM;
        RETURN 0;
END;
$$;