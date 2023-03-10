SELECT t.Train_name
    FROM Passenger p, Train t, Booked b
        WHERE b.Train_number = t.Train_number AND b.Passenger_ssn = (SELECT p.Ssn WHERE p.First_name = 'James' AND p.Last_name = 'Butt');

SELECT DISTINCT p.First_name, p.Last_name
    FROM Passenger p, Booked b, Train t
        WHERE b.Status = 'Booked' AND b.Passenger_ssn = p.Ssn AND b.Train_number = (SELECT t.Train_number FROM Train WHERE t.Available LIKE '%Wednesday%' OR t.Available LIKE 'Weekdays');

SELECT t.Train_number, t.Train_name, t.S_station, t.D_station
    FROM Passenger p, Train t, Booked b
        WHERE t.Train_number = b.Train_number AND b.Passenger_ssn = (SELECT P.Ssn WHERE ((date('now') - p.bdate) BETWEEN 50 AND 60));
	
SELECT s.Train_name, s.Train_date, s.P_seats_occup + s.G_seats_occup
    FROM Train_status s, Train t
        WHERE s.Train_name = (SELECT t.Train_name FROM Train WHERE t.Train_number = 1);

SELECT p.First_name, p.Last_name,
    FROM Passenger p, Booked b, Train t
        WHERE b.status = 'booked' AND b.Passenger_ssn = p.Ssn AND b.Train_number = (SELECT t.train_number FROM Train WHERE t.Train_name = 'Paris');

SELECT p.First_name, p.Last_name, t.Train_name
    FROM Passenger p, Booked b, Train t
        WHERE b.status = 'WaitL' AND b.Train_number = t.Train_number AND b.Passenger_ssn = p.Ssn;

SELECT *
    FROM Passenger
	WHERE Phone LIKE '%605%'
	    ORDER BY First_name DESC;

SELECT p.First_name, p.Last_name
    FROM Passenger p , Booked b, Train t
	WHERE b.Status = 'Booked' AND b.Passenger_ssn = p.Ssn AND b.Train_number = (SELECT t.Train_number FROM Train WHERE t.Available LIKE '%Thursday%' OR t.Available LIKE '%Weekdays%')
	    ORDER BY p.First_name ASC;
