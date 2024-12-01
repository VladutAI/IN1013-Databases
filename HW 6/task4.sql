SELECT DISTINCT b.CustomerName
FROM Bills b
JOIN Waiters w ON b.WaiterID = w.WaiterID
WHERE b.Amount > 450.00
  AND w.WaiterID IN (
    SELECT WaiterID
    FROM Waiters
    WHERE HeadWaiterID IS NULL
      AND FirstName = 'Charles'
  );

SELECT w.FirstName, w.LastName
FROM Waiters w
WHERE w.WaiterID = (
  SELECT HeadWaiterID
  FROM Waiters
  WHERE WaiterID = (
    SELECT WaiterID
    FROM Bills
    WHERE CustomerName = 'Nerida' AND Date = '2016-01-11'
  )
);

SELECT DISTINCT CustomerName
FROM Bills
WHERE Amount = (SELECT MIN(Amount) FROM Bills);

SELECT DISTINCT w.FirstName, w.LastName
FROM Waiters w
WHERE w.WaiterID NOT IN (SELECT DISTINCT WaiterID FROM Bills);

SELECT b.CustomerName, hw.FirstName AS HeadWaiterFirstName, hw.LastName AS HeadWaiterLastName, r.RoomName
FROM Bills b
JOIN Waiters w ON b.WaiterID = w.WaiterID
JOIN Waiters hw ON w.HeadWaiterID = hw.WaiterID
JOIN Rooms r ON b.RoomID = r.RoomID
WHERE b.Amount = (SELECT MAX(Amount) FROM Bills);
