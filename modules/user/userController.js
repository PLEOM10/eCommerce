const helper = require("../../utils/helper");
const userService = require("./userService");
const { signUpReq, logInReq } = require("./userValidate");
const createHttpError = require('http-errors');

signUp = async(req, res, next) => {
    try {
        let isValid = await signUpReq.validateAsync(req.body);
        if (isValid instanceof Error) {
            return next(isValid)
        }
        let body = req.body;
        let result = await userService.signUp(body);
        helper.send(res, result.message, result.data, result.code);
    } catch (error) {
        if (error.isJoi)
            return next(createHttpError(400, { message: error.message }));
        next(error);
    }
}

logIn = async(req, res, next) => {
    try {
        let isValid = await logInReq.validateAsync(req.body);
        if (isValid instanceof Error) {
            return next(isValid);
        }
        let body = req.body;
        let result = await userService.logIn(body);
        let re = { name: result.data.first_name + " " + result.data.last_name, token: result.data.token, user_type: result.data.user_type, id: result.data.id }
        helper.send(res, "Login Successful", re);
    } catch (error) {
        if (error.isJoi)
            return next(createHttpError(400, { message: error.message }));
        next(error)
    }
}

userDetails = async(req, res, next) => {
    try {
        let result = await userService.userDetails();
        helper.send(res, result.message, result.data, result.code);
    } catch (error) {
        next(error);
    }
}

module.exports = {
    signUp,
    logIn,
    userDetails
}