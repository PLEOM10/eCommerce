const helper = require("../../utils/helper");
const orderService = require("./orderService");
const { getOrderReq } = require("./orderValidate");
const createHttpError = require('http-errors');
const mail = require("../../utils/mail")

getOrder = async(req, res, next) => {
    try {
        let isValid = await getOrderReq.validateAsync(req.body);
        if (isValid instanceof Error) {
            return next(isValid);
        }
        let body = req.body;
        let payload = req.decoded;
        let result = await orderService.getOrder(body);
        let re = { result }
        helper.send(res, "Order Details", re);
    } catch (error) {
        if (error.isJoi)
            return next(createHttpError(400, { message: error.message }));
        next(error)
    }
}


orderProduct = async(req, res, next) => {
    try {
        let isValid = await orderProductReq.validateAsync(req.body);
        if (isValid instanceof Error) {
            return next(isValid);
        }
        let body = req.body;
        let payload = req.decoded;
        let result = await orderService.orderProduct(payload, body);
        let re = { result }
        helper.send(res, "Order Successful", re);
        mail.sendMail(result.email, result.product, body.quantity);
    } catch (error) {
        if (error.isJoi)
            return next(createHttpError(400, { message: error.message }));
        next(error)
    }
}
changeStatus = async(req, res, next) => {
    try {
        body = req.body;
        let result = await orderService.changeStatus(body);
        let re = { result }
        helper.send(res, "Status Updated", re);
        mail.acceptMail(result.email, result.name, result.quantity);
    } catch (error) {
        if (error.isJoi)
            return next(createHttpError(400, { message: error.message }));
        next(error)
    }
}
changePaymentStatus = async(req, res, next) => {
    try {
        body = req.body;
        let result = await orderService.changePaymentStatus(body);
        let re = { result }
        helper.send(res, "Status Updated", re);
    } catch (error) {
        if (error.isJoi)
            return next(createHttpError(400, { message: error.message }));
        next(error)
    }
}

getCount = async(req, res, next) => {
    try {
        let result = await orderService.getCount();
        let re = { result }
        helper.send(res, "Counts Received", re)
    } catch (error) {
        if (error.isJoi)
            return next(createHttpError(400, { message: error.message }));
        next(error)
    }
}

module.exports = {
    getOrder,
    changeStatus,
    orderProduct,
    getCount,
    changePaymentStatus
}