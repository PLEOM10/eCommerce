var createError = require('http-errors');
var express = require('express');
const router = express.Router();
const routes = require("./routes/index.js");
var path = require('path');
var cookieParser = require('cookie-parser');
const cors = require("cors");
var app = express();
const cron = require('node-cron')
const { viewOrder } = require("./utils/job.js")

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
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

cron.schedule("0 0 10 * * *", async function() {
    let orders = await viewOrder()
    console.log(JSON.stringify(orders.data, null, 3))
}, {
    scheduled: true,
    timezone: "Asia/Kolkata"
});

module.exports = app;