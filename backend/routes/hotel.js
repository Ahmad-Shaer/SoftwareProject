const express = require("express");
const router = express.Router();
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');

const { Schema, model } = mongoose;

const hotelSchema = new Schema({
  username: String,
  email: String,
  password: String,
  country: String,
  city: String,
  phoneNumber: String,
  description : String,
  rooms: Array,
  images: Array,
});
const Hotel = model('Hotel', userSchema);

router.post('/hotel', async (req, res) => {

});

router.post('/function', async (req, res) => {

});

module.exports = router;