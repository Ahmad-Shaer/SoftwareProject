const express = require("express");
const router = express.Router();
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');

const { Schema, model } = mongoose;

const userSchema = new Schema({
  username: String,
  email: String,
  password: String,
  country: String,
  city: String,
  phoneNumber: String,
  isAdmin : Boolean,
  favourites : Array,
  bookingsID: Array,
  notification: Array,
},{ collection: 'users' });
const User = model('User', userSchema);

router.post('/signup', async (req, res) => {
  try {
    const { username, email, password, country, city, phoneNumber } = req.body;
    const isAdmin = false ;
    // Hash the password before saving it
    const hashedPassword = await bcrypt.hash(password, 10);

    const newUser = new User({
      username,
      email,
      password: hashedPassword,
      country,
      city,
      phoneNumber,
      isAdmin,
    });

    const savedUser = await newUser.save();

    console.log('User saved:', savedUser);
    res.status(201).json({ message: 'User signed up successfully', user: savedUser });
  } catch (error) {
    console.error('Error signing up user:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

router.post('/login', async (req, res) => {
  try {
    const { email, password } = req.body;

    // Check if user with provided email exists
    const existingUser = await User.findOne({ email });
    if (!existingUser) {
      return res.status(401).json({ message: 'Invalid credentials' });
    }

    // Compare hashed password
    const isPasswordValid = await bcrypt.compare(password, existingUser.password);

    if (!isPasswordValid) {
      return res.status(401).json({ message: 'Invalid credentials' });
    }

    // Login successful
    res.status(200).json({existingUser });
  } catch (error) {
    console.error('Error during login:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

module.exports = {User, router }  ;