const express = require("express");
const router = express.Router();
const mongoose = require('mongoose');

const { Schema, model } = mongoose;

const bookingSchema = new Schema({
  checkInDate: String,
  checkOutDate: String,
  roomType: [String],
  hotelID: String,
  totalPrice: Number,
  discount: Number,
  numberOfAdults: Number,
  email: String,
  phoneNumber: String,
});

const Booking = model('Booking', bookingSchema);
const User = model('User');

router.post('/bookings', async (req, res) => {
  try {
    const {
      checkInDate,
      checkOutDate,
      roomType,
      numberOfAdults,
      email,
      phoneNumber,
    } = req.body;

    const newBooking = new Booking({
      checkInDate,
      checkOutDate,
      roomType,
      numberOfAdults,
      email,
      phoneNumber,
    });

    const savedBooking = await newBooking.save();


    await User.findOneAndUpdate(
      { email: email },
      { $push: { bookingsID: savedBooking._id } },
      { new: true }
    );

    console.log('Booking saved:', savedBooking);
    res.status(201).json({ message: 'Booking saved successfully', booking: savedBooking });
  } catch (error) {
    console.error('Error saving booking:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

module.exports = router;
