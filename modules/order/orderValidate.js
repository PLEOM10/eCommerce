const Joi = require('joi');

const id= Joi.number().integer()
const product_id= Joi.number().integer().required()
const quantity= Joi.number().integer().required()


getOrderReq = Joi.object({
  id
})

orderProductReq = Joi.object({
    product_id,
    quantity
  })

module.exports = {
  getOrderReq,
  orderProductReq
}
