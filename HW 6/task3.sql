SELECT DISTINCT w.FirstName, w.LastName
FROM Waiters w
JOIN Bills b ON w.WaiterID = b.WaiterID
WHERE b.CustomerName = 'Tanya Singh';

SELECT b.Date
FROM Bills b
JOIN Rooms r ON b.RoomID = r.RoomID
JOIN Waiters w ON w.WaiterID = b.WaiterID
WHERE w.FirstName = 'Charles' AND w.HeadWaiterID IS NULL
  AND r.RoomName = 'Green'
  AND b.Date LIKE '2016-02%';

SELECT DISTINCT w.FirstName, w.LastName
FROM Waiters w
JOIN Waiters zoe ON w.HeadWaiterID = zoe.HeadWaiterID
WHERE zoe.FirstName = 'Zoe' AND zoe.LastName = 'Ball'
  AND w.WaiterID != zoe.WaiterID;

SELECT b.CustomerName, b.Amount, CONCAT(w.FirstName, ' ', w.LastName) AS WaiterName
FROM Bills b
JOIN Waiters w ON b.WaiterID = w.WaiterID
ORDER BY b.Amount DESC;

SELECT DISTINCT w.FirstName, w.LastName
FROM Waiters w
JOIN Teams t ON w.WaiterID = t.WaiterID
WHERE t.TeamID IN (
  SELECT DISTINCT t1.TeamID
  FROM Teams t1
  WHERE t1.BillID IN ('00014', '00017')
);

SELECT DISTINCT w.FirstName, w.LastName
FROM Waiters w
JOIN Teams t ON w.WaiterID = t.WaiterID
JOIN Rooms r ON t.RoomID = r.RoomID
JOIN Bills b ON t.BillID = b.BillID
WHERE r.RoomName = 'Blue' AND b.Date = '160312';
