// MongoDB Document Database Setup & Queries

use HotelDB;

// Create collections
db.createCollection("guests");
db.createCollection("rooms");
db.createCollection("bookings");
db.createCollection("payments");
db.createCollection("serviceUsage");

// Insert Documents
db.guests.insertMany([
  {
    guestID: 1,
    name: "Alice Johnson",
    city: "Tashkent",
    email: "alice@example.com",
    phones: ["+998901234567"]
  },
  {
    guestID: 2,
    name: "Bob Smith",
    city: "Samarkand",
    email: "bob@example.com",
    phones: ["+998931112233", "+998901112233"]
  }
]);

db.rooms.insertMany([
  { roomID: 1, type: "Standard", price: 350000 },
  { roomID: 2, type: "Deluxe", price: 500000 }
]);

db.bookings.insertOne({
  bookingID: 10,
  guestID: 2,
  roomID: 2,
  checkIn: "2025-06-10",
  checkOut: "2025-06-12",
  status: "Confirmed"
});

db.payments.insertOne({
  paymentID: 1,
  bookingID: 10,
  amount: 750000,
  date: "2025-06-10"
});

db.serviceUsage.insertOne({
  usageID: 1,
  bookingID: 10,
  serviceName: "Room Cleaning",
  staffID: 2,
  date: "2025-06-11"
});

// Example Queries
db.guests.find();
db.bookings.find({ guestID: 2 });
db.rooms.find({ price: { $lt: 400000 } });

// Update Record
db.bookings.updateOne(
  { bookingID: 10 },
  { $set: { status: "Checked Out" } }
);
