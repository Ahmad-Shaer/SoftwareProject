const express = require("express");
const router = express.Router();
const mongoose = require('mongoose');

const { Schema, model } = mongoose;

const BookingSchema = new Schema({
  from: String,
  to: String,
  hotelName: String,
  cost: Number,
}, { collection: 'bookings' });

const Booking = model('Booking', BookingSchema);  // Registration for Booking model

const { User : User} = require('./user.js');
const { Hotel: Hotel} = require("./hotel.js");

router.post('/bookings', async (req, res) => {
  try {
    const {
    email,
      from,
      to,
      hotelName,
      cost,
    } = req.body;
    console.log(email + " " +  hotelName + " " + from.toString() + " " + to.toString() + " " + cost.toString());
    const newBooking = new Booking({
      from,
      to,
      hotelName,
      cost,
    });

    const savedBooking = await newBooking.save();

    await User.findOneAndUpdate(
      { email: email },
      { $push: { bookingsID: savedBooking._id } },
      { new: true }
    );

    res.status(201).json({ message: 'Booking saved successfully', booking: savedBooking });
  } catch (error) {
    console.error('Error saving booking:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

module.exports = {Booking, router} ;
