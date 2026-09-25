-- Sample Data Insertions

INSERT INTO Guest (Name, Street, City, PostalCode, Email) VALUES
('Ali Karimov', 'Yunusabad 7', 'Tashkent', '100093', 'ali.karimov@mail.com'),
('Dilnoza Akhmedova', 'Chilonzor 9', 'Tashkent', '100115', 'dilnoza@mail.com'),
('Sardor Rakhmonov', 'Shaykhontohur 14', 'Tashkent', '100120', 'sardor.r@mail.com'),
('Malika Davronova', 'Amir Temur 32', 'Samarkand', '140100', 'malika.d@example.com'),
('Javlon Sobirov', 'Navoiy 11', 'Bukhara', '200100', 'javlon_s@example.com'),
('Aziza Kodirova', 'Fergana Yangi Shahar 5', 'Fergana', '150100', 'aziza.k@example.com'),
('Sherzod Murodov', 'Zarafshan 4', 'Navoi', '210100', 'sher.m@example.com');

INSERT INTO PhoneNumber (PhoneNumber, GuestID) VALUES
('+998901234567', 1),
('+998909876543', 1),
('+998933210987', 2),
('+998977001122', 3),
('+998935551122', 4),
('+998907700221', 5),
('+998933344556', 6),
('+998998887766', 7);

INSERT INTO RoomType (TypeName, DefaultPrice) VALUES
('Standard', 350000),
('Deluxe', 750000),
('Family Suite', 980000),
('Economy', 250000);

INSERT INTO Room (RoomNumber, Floor, RoomTypeID) VALUES
('101', 1, 1),
('102', 1, 2),
('103', 1, 4),
('201', 2, 1),
('202', 2, 3),
('203', 2, 2),
('301', 3, 3),
('302', 3, 2);

INSERT INTO Booking (CheckInDate, CheckOutDate, BookingStatus, GuestID, RoomID) VALUES
('2024-11-10', '2024-11-12', 'Completed', 1, 1),
('2024-12-01', '2024-12-05', 'Completed', 2, 2),
('2025-01-15', '2025-01-18', 'Completed', 3, 5),
('2025-02-02', '2025-02-04', 'Cancelled', 4, 3),
('2025-03-20', '2025-03-22', 'Completed', 5, 4),
('2025-04-10', '2025-04-15', 'In Progress', 6, 6),
('2025-05-01', '2025-05-03', 'Completed', 7, 7);

INSERT INTO Payment (Amount, PaymentDate, BookingID) VALUES
(700000, '2024-11-10', 1),
(3000000, '2024-12-01', 2),
(2800000, '2025-01-15', 3),
(0, '2025-02-02', 4),
(700000, '2025-03-20', 5),
(3750000, '2025-04-10', 6),
(980000, '2025-05-01', 7);

INSERT INTO Invoice (CreatedDate, TotalAmount, BookingID) VALUES
('2024-11-12', 700000, 1),
('2024-12-05', 3000000, 2),
('2025-01-18', 2800000, 3),
('2025-02-04', 0, 4),
('2025-03-22', 700000, 5),
('2025-04-15', 3750000, 6),
('2025-05-03', 980000, 7);

INSERT INTO Feedback (Rating, BookingID) VALUES
(5, 1),
(4, 2),
(3, 3),
(4, 5),
(5, 7);

INSERT INTO Service (ServiceName, ServicePrice) VALUES
('Laundry', 40000),
('Breakfast', 60000),
('Airport Pickup', 150000),
('Extra Bed', 80000),
('Room Cleaning', 30000);

INSERT INTO Staff (Name, Shift) VALUES
('Kamila Yusufova', 'Morning'),
('Bekzod Akromov', 'Night'),
('Dilshod Mamadaliyev', 'Morning'),
('Zarina Rasulova', 'Evening'),
('Ulugbek Nasrullaev', 'Morning');

INSERT INTO Receptionist (StaffID) VALUES (1), (4);
INSERT INTO Housekeeper (StaffID) VALUES (3), (5);
INSERT INTO Manager (StaffID) VALUES (2);

INSERT INTO ServiceUsage (UsageDate, BookingID, ServiceID, StaffID) VALUES
('2024-11-10', 1, 1, 3),
('2024-12-02', 2, 2, 1),
('2025-01-16', 3, 5, 3),
('2025-03-20', 5, 3, 2),
('2025-04-11', 6, 4, 1);
