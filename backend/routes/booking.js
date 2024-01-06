const express = require("express");
const router = express.Router();
const mongoose = require('mongoose');

const { Schema, model } = mongoose;

const bookingSchema = new Schema({
  checkInDate: String,
  checkOutDate: String,
  roomType: [String],
  numberOfAdults: Number,
  email: String,
  phoneNumber: String,
});

const Booking = model('Booking', bookingSchema);

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

    console.log('Booking saved:', savedBooking);
    res.status(201).json({ message: 'Booking saved successfully', booking: savedBooking });
  } catch (error) {
    console.error('Error saving booking:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

module.exports = router;
