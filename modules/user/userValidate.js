const Joi = require('joi');
const message = require('../../utils/msgs');

const username = Joi.string().required().min(3).max(20).pattern(/^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$/).messages({
    'string.base': `username should be a type of 'text'`,
    'string.empty': `username cannot be an empty field`,
    'string.min': `username should have a minimum length of 8`,
    'string.max': `username cannot have length greater than 20`,
    'string.pattern.base': `username pattern incorrect`,
    'any.required': `username is a required field`
});
const password = Joi.string().required().min(3).max(20).messages({
    'string.base': `password should be a type of 'text'`,
    'string.empty': `password cannot be an empty field`,
    'string.min': `password should have a minimum length of 8`,
    'string.max': `password cannot have length greater than 20`,
    'any.required': `password is a required field`
});
const first_name = Joi.string().required().min(3).max(10).pattern(/^[A-Za-z]+$/).messages({
    'string.base': `first name should be a type of 'text'`,
    'string.empty': `first name cannot be an empty field`,
    'string.min': `first name should have a minimum length of 8`,
    'string.max': `first name cannot have length greater than 20`,
    'string.pattern.base': `first name pattern incorrect`,
    'any.required': `first name is a required field`
});
const last_name = Joi.string().required().min(3).max(10).pattern(/^[A-Za-z]+$/).messages({
    'string.base': `last_name should be a type of 'text'`,
    'string.empty': `last_name cannot be an empty field`,
    'string.min': `last_name should have a minimum length of 8`,
    'string.max': `last_name cannot have length greater than 20`,
    'string.pattern.base': `last_name pattern incorrect`,
    'any.required': `last_name is a required field`
});
const telephone = Joi.string().length(10).pattern(/^[0-9]+$/).required().messages({
    'string.base': `telephone should be a type of 'text'`,
    'string.empty': `telephone cannot be an empty field`,
    'string.length': `telephone should have a length of 10`,
    'string.pattern.base': `telephone pattern incorrect`,
    'any.required': `telephone is a required field`
});

signUpReq = Joi.object({
    username,
    password,
    first_name,
    last_name,
    telephone
})

logInReq = Joi.object({
    username,
    password
})

module.exports = {
    signUpReq,
    logInReq
}