const express = require('express');
const router = express.Router();
const User = require('../models/user'); // Import your User model
const bcrypt = require('bcrypt');


// Define the signup route
router.post('/signup', async (req, res) => {
  const { email, password } = req.body;

  try {
    // Check if the user already exists
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(409).json({ message: 'User already exists' });
    }

    // Hash the password before saving it
    const hashedPassword = await bcrypt.hash(password, 10);

    // Create a new user
    const newUser = new User({
      email,
      password: hashedPassword,
    });

    // Save the user to the database
    await newUser.save();

    res.status(201).json({ message: 'User created successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});



// Define the login route
//router.post('/login', async (req, res) => {
//  const { email, password } = req.body;
//console.log("connect ");
//
//  try {
//    // Find the user by email
//    const user = await User.findOne({ email });
//
//    if (!user) {
//      return res.status(404).json({ message: 'User not found' });
//    }
//
//    // Check the password
//    if (user.password !== password) {
//      return res.status(401).json({ message: 'Incorrect password' });
//    }
//
//    // Successful login
//    res.status(200).json({ message: 'Login successful' });
//  } catch (error) {
//    console.error(error);
//    res.status(500).json({ message: 'Server error' });
//  }
//});

// Define the login route
router.post('/login', async (req, res) => {
  const { email, password } = req.body;

  try {
    // Find the user by email
    const user = await User.findOne({ email });

    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    // Compare the provided password with the hashed password in the database
    const passwordMatch = await bcrypt.compare(password, user.password);

    if (!passwordMatch) {
      return res.status(401).json({ message: 'Incorrect password' });
    }

    // Successful login
    res.status(200).json({ message: 'Login successful' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

module.exports = router;