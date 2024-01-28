const express = require("express");
const router = express.Router();
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');

const { Schema, model } = mongoose;

const { User : User}  = require("../routes/user.js");
const { Booking : Booking}  = require("../routes/booking.js");
const { Hotel: Hotel} = require("../routes/hotel.js");


router.post("/user/notification", async (req, res) => {
    try {
        const { email } = req.body;
        const UserData = await User.findOne({ email });
        const allNotification = UserData.notification;
        res.status(200).json(allNotification);
    } catch (error) {
        console.error('Error fetching notifications:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

router.post('/myBookings', async (req, res) => {
  try {
    const { email } = req.body;

    const existingUser = await User.findOne({ email });

    if (!existingUser) {
      return res.status(404).json({ message: 'User not found' });
    }

    const bookingsData = await Promise.all(existingUser.bookingsID.map(async (bookingID) => {
      const booking = await Booking.findById(bookingID);

      if (!booking) {
        console.error(`Booking with ID ${bookingID} not found`);
        return null;
      }

      return booking;
    }));

    const validBookingsData = bookingsData.filter(booking => booking !== null);
    res.status(200).json(validBookingsData);
  } catch (error) {
    console.error('Error fetching bookings:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

router.post('/addToFavourites', async (req, res) => {
    try {
        const { email, hotelID } = req.body;

        const existingUser = await User.findOne({ email });

        if (!existingUser) {
          return res.status(404).json({ message: 'User not found' });
        }

        const isHotelInFavourites = existingUser.favourites.includes(hotelID);

        if (isHotelInFavourites) {
          await User.findOneAndUpdate(
            { email: email },
            { $pull: { favourites: hotelID } },
            { new: true }
          );
          res.status(200).json({ message: 'Hotel removed from favourites' });
        } else {
          await User.findOneAndUpdate(
            { email: email },
            { $addToSet: { favourites: hotelID } },
            { new: true }
          );
          res.status(200).json({ message: 'Hotel added to favourites' });
        }
    } catch (error) {
        console.error('Error adding to favourites:', error);
        res.status(500).json({ message: 'Internal server error' });
      }
});


router.post('/myFavourites', async (req, res) => {
    try {
        const { email } = req.body;

        const existingUser = await User.findOne({ email });

        if (!existingUser) {
          return res.status(404).json({ message: 'User not found' });
        }

        const favouritesData = await Promise.all(existingUser.favourites.map(async (HotelID) => {
          const hotel = await Hotel.findById(HotelID);

          if (!hotel) {
            console.error(`Hotel with ID ${HotelID} not found`);
            return null;
          }

          return hotel;
        }));

        const validHotelsData = favouritesData.filter(hotel => hotel !== null);

        res.status(200).json({ message: 'Hotels retrieved successfully', Hotels: validHotelsData });
      } catch (error) {
        console.error('Error fetching Hotels:', error);
        res.status(500).json({ message: 'Internal server error' });
      }
});


module.exports = {router};
