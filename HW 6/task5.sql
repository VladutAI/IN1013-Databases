SELECT w.FirstName, w.LastName, b.Date, COUNT(b.BillID) AS BillCount
FROM Bills b
JOIN Waiters w ON b.WaiterID = w.WaiterID
GROUP BY w.FirstName, w.LastName, b.Date
HAVING COUNT(b.BillID) >= 2;

SELECT r.RoomName, COUNT(t.TableID) AS TableCount
FROM Rooms r
JOIN Tables t ON r.RoomID = t.RoomID
WHERE t.Capacity > 6
GROUP BY r.RoomName;

SELECT r.RoomName, SUM(b.Amount) AS TotalAmount
FROM Bills b
JOIN Rooms r ON b.RoomID = r.RoomID
GROUP BY r.RoomName;

SELECT hw.FirstName, hw.LastName, SUM(b.Amount) AS TotalBillAmount
FROM Bills b
JOIN Waiters w ON b.WaiterID = w.WaiterID
JOIN Waiters hw ON w.HeadWaiterID = hw.WaiterID
GROUP BY hw.FirstName, hw.LastName
ORDER BY TotalBillAmount DESC;

SELECT CustomerName
FROM Bills
GROUP BY CustomerName
HAVING AVG(Amount) > 400;

SELECT w.FirstName, w.LastName, COUNT(b.BillID) AS BillCount
FROM Bills b
JOIN Waiters w ON b.WaiterID = w.WaiterID
GROUP BY w.FirstName, w.LastName, b.Date
HAVING COUNT(b.BillID) >= 3;
