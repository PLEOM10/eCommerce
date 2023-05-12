const Joi = require('joi');

const id= Joi.number().integer().required();
const name = Joi.string().required();
const category_id = Joi.number().integer().required();
const inventory_id = Joi.number().integer().required();
const price = Joi.number().integer().required();

addProductReq = Joi.object({
  id,
  name,
  category_id,
  inventory_id,
  price
})

viewProductReq=Joi.object({
  category_id
})

module.exports = {
  addProductReq,
  viewProductReq
}