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
const validate = require("./middleware/index.js");
const Razorpay = require('razorpay')


app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
//Routes
app.use("/", routes(router));
//customer products
app.get('/products', (req, res) => {
    res.render('index', {});
});

// customer  orders
app.get('/myOrders', (req, res) => {
    res.render('myOrders', {});
});

//admin home page
app.get('/admin', (req, res) => {
    res.render('admin', {});
});

// order status by count
app.get('/orderCount', (req, res) => {
    res.render('count', {});
});
//cart
app.get('/myCart', (req, res) => {
    res.render('cart', {});
});
//payment
app.post("/payment", async(req, res) => {
        let { amount } = req.body;
        var instance = new Razorpay({ key_id: 'rzp_test_0GpnKLHZLZKsPm', key_secret: 'hPNf09RqkFTExU7YdYcc5F9G' })
        let order = await instance.orders.create({
            amount: amount * 100,
            currency: "INR",
            receipt: "receipt#1",
        })
        res.status(201).json({
            success: true,
            order,
            amount
        })
    })
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