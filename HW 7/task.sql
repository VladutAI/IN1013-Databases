CREATE VIEW samsBills AS
SELECT 
    w.first_name,
    w.surname,
    b.bill_date,
    c.cust_name,
    b.bill_total
FROM 
    Bills b
JOIN 
    Waiters w ON b.waiter_id = w.waiter_id
JOIN 
    Customers c ON b.customer_id = c.customer_id
WHERE 
    w.first_name = 'Sam' AND w.surname = 'Pitt';

SELECT *
FROM samsBills
WHERE bill_total > 400;

CREATE VIEW roomTotals AS
SELECT 
    r.room_name,
    SUM(b.bill_total) AS total_sum
FROM 
    Bills b
JOIN 
    Rooms r ON b.room_id = r.room_id
GROUP BY 
    r.room_name;

CREATE VIEW teamTotals AS
SELECT 
    CONCAT(w.first_name, ' ', w.surname) AS headwaiter_name,
    SUM(b.bill_total) AS total_sum
FROM 
    Bills b
JOIN 
    Waiters w ON b.waiter_id = w.waiter_id
GROUP BY 
    w.first_name, w.surname;
