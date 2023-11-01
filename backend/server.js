//const express = require('express');
//const mongoose = require('mongoose');
//const bodyParser = require('body-parser');
//const app = express();
//const port = 3000;
//
//// Connect to MongoDB using mongoose
//mongoose.connect('mongodb+srv://ruaana112001:tdVn9bYpQ3mYb5Iy@cluster0.0yoi0p6.mongodb.net/?retryWrites=true&w=majority', {
//  useNewUrlParser: true,
//  useUnifiedTopology: true,
//});
//
//// Define middleware
//app.use(bodyParser.json());
//
//// Define routes
//app.use('/api/auth', require('./routes/auth'));
//
//app.listen(port, () => {
//  console.log(`Server is running on port ${port}`);
//});
const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const app = express();
const port = 4000;

// Connect to MongoDB using mongoose
mongoose.connect('mongodb+srv://ruaana112001:tdVn9bYpQ3mYb5Iy@cluster0.0yoi0p6.mongodb.net/?retryWrites=true&w=majority',
//{
//  useNewUrlParser: true,
//  useUnifiedTopology: true,
//}
)
  .then(() => {
    console.log('Connected to MongoDB');
  })
  .catch((error) => {
    console.error('Error connecting to MongoDB: ', error);
  });

// Define middleware
app.use(bodyParser.json());

// Define routes
app.use('/api/auth', require('./routes/auth'));

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});