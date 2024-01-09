const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');
const cors = require('cors');

const app = express();
app.use(bodyParser.json());
app.use(cors());
const uri = 'mongodb://localhost:27017/';
mongoose.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true });

const bookingroute = require("./routes/booking.js");
const userRoute = require("./routes/user.js");
app.use("/user",userRoute);
app.use("",bookingroute);
const port = 8000;
app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});
