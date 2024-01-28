const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');
const cors = require('cors');

const app = express();
app.use(bodyParser.json());
app.use(cors());
const uri = 'mongodb://localhost:27017/Project';
mongoose.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true });

const { router : bookingRoute}  = require("./routes/booking.js");
const { router : hotelRoute}  = require("./routes/hotel.js");
const { router: userRoute} = require("./routes/user.js");
const { router : opRoute} = require("./API/operations.js");
app.use("/user",userRoute);
app.use("",bookingRoute);
app.use("/hotel",hotelRoute);
app.use("/",opRoute);
const port = 8000;
app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});
