const express = require("express");
const router = express.Router();
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');

const { Schema, model } = mongoose;

const hotelSchema = new Schema({
  hotelName: String,
  email: String,
  password: String,
  address: String,
  city: String,
  description: String,
  availableRooms: Array,
  images: Array,
  tags: Array,
  rate: Number,
},{ collection: 'Hotel' });

const Hotel = model('Hotel', hotelSchema);

router.post('/all', async (req, res) => {
  try {
    const allHotels = await Hotel.find();
    res.status(200).json( allHotels );
  } catch (error) {
    console.error('Error fetching hotels:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

module.exports = { Hotel, router };
