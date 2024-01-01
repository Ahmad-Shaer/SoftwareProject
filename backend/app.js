const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');

const app = express();
app.use(bodyParser.json());

const uri = 'mongodb+srv://ahmad:ahmad2010@cluster0.j6s5ksr.mongodb.net/';
mongoose.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true });

const { Schema, model } = mongoose;

const userSchema = new Schema({
  username: String,
  email: String,
  password: String,
  country: String,
  city: String,
  phoneNumber: String,
});

const User = model('User', userSchema);
const userRoute = require("./routes/user.js");
app.use("/user",userRoute);
const port = 3000;
app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});
