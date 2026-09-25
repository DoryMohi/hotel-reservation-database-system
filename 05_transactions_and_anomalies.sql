-- Transaction Activities and Concurrency Simulations

-- Activity 1: Booking & Payment Transaction
SET XACT_ABORT ON;
BEGIN TRANSACTION;
BEGIN TRY
    SELECT RoomID FROM Room WHERE RoomID = 4;
    INSERT INTO Booking (CheckInDate, CheckOutDate, BookingStatus, GuestID, RoomID)
    VALUES ('2025-06-10','2025-06-12','Confirmed', 2, 4);
    
    DECLARE @bID INT = SCOPE_IDENTITY();
    
    INSERT INTO Payment (Amount, PaymentDate, BookingID)
    VALUES (750000, GETDATE(), @bID);
    
    INSERT INTO Invoice (CreatedDate, TotalAmount, BookingID)
    VALUES (GETDATE(), 750000, @bID);
    
    COMMIT TRANSACTION;
    PRINT 'Transaction committed (Activity A)';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Transaction rolled back (Activity A)';
END CATCH;

-- Activity 2: Service Usage Transaction
SET XACT_ABORT ON;
BEGIN TRANSACTION;
BEGIN TRY
    SELECT ServiceID FROM Service WHERE ServiceID = 3;
    SELECT BookingID FROM Booking WHERE BookingID = 10;
    
    INSERT INTO ServiceUsage (UsageDate, BookingID, ServiceID, StaffID)
    VALUES (GETDATE(), 10, 3, 2);
    
    COMMIT TRANSACTION;
    PRINT 'Transaction committed (Activity B)';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Transaction rolled back (Activity B)';
END CATCH;

-- Concurrency Anomaly Simulation: Lost Update
-- Session 1 & Session 2 (Run concurrently in separate windows)
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRAN;
DECLARE @old DECIMAL(10,2);
SELECT @old = TotalAmount FROM Invoice WHERE BookingID = 2;
WAITFOR DELAY '00:00:02';
UPDATE Invoice SET TotalAmount = @old + 30000 WHERE BookingID = 2;
COMMIT;

-- Concurrency Anomaly Simulation: Deadlock
-- Window A:
BEGIN TRAN;
UPDATE Booking SET BookingStatus = 'Updating T1' WHERE BookingID = 2;
WAITFOR DELAY '00:00:05';
UPDATE Payment SET Amount = Amount + 10 WHERE PaymentID = 2;

-- Window B:
BEGIN TRAN;
UPDATE Payment SET Amount = Amount + 20 WHERE PaymentID = 2;
WAITFOR DELAY '00:00:05';
UPDATE Booking SET BookingStatus = 'Updated by T2' WHERE BookingID = 2;
