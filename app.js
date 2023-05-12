var createError = require('http-errors');
var express = require('express');
const router = express.Router();
const routes = require("./routes/index.js");
var path = require('path');
var cookieParser = require('cookie-parser');
const cors = require("cors");
var app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

//Routes
app.use("/", routes(router));

//error
app.use((error, req, res, next) => {
  if (!error) {
    return next();
  }
  console.log(error)
  res.status(error.status || 500).send({
    status: error.status || 500,
    error: {
      message: error.message || error
    },
    data: error.data || ''
  });
});

module.exports = app;
