const express = require("express");
const router = express.Router();
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');

const { Schema, model } = mongoose;

const userSchema = new Schema({
  NumberOfBeds: String,
  Price: Number,
});
const Rooms = model('Rooms', userSchema);


module.exports = {Rooms }  ;