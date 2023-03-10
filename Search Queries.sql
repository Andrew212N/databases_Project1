SELECT t.Train_name
    FROM Passenger p, Train t, Booked b
        WHERE b.Train_number = t.Train_number AND b.Passenger_ssn = (SELECT p.Ssn WHERE p.First_name = 'James' AND p.Last_name = 'Butt');

SELECT DISTINCT p.First_name, p.Last_name
    FROM Passenger p, Booked b, Train t
        WHERE b.Status = 'Booked' AND b.Passenger_ssn = p.Ssn AND b.Train_number = (SELECT t.Train_number FROM Train WHERE t.Available LIKE '%Wednesday%' OR t.Available LIKE 'Weekdays');

SELECT t.Train_number, t.Train_name, t.S_station, t.D_station
    FROM Passenger p, Train t, Booked b
        WHERE t.Train_number = b.Train_number AND b.Passenger_ssn = (SELECT P.Ssn WHERE ((date('now') - p.bdate) BETWEEN 50 AND 60));

SELECT *
    FROM Passenger
	WHERE Phone LIKE '%605%'
	    ORDER BY First_name DESC;

SELECT p.First_name, p.Last_name
    FROM Passenger p , Booked b, Train t
	WHERE b.Status = 'Booked' AND b.Passenger_ssn = p.Ssn AND b.Train_number = (SELECT t.Train_number FROM Train WHERE t.Available LIKE '%Thursday%' OR t.Available LIKE '%Weekdays%')
	    ORDER BY p.First_name ASC;