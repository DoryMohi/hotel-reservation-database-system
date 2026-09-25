-- Cascading Deletion Logic to maintain referential integrity

DELETE FROM ServiceUsage WHERE BookingID = 3;
DELETE FROM Feedback WHERE BookingID = 3;
DELETE FROM Invoice WHERE BookingID = 3;
DELETE FROM Payment WHERE BookingID = 3;
DELETE FROM Booking WHERE BookingID = 3;
