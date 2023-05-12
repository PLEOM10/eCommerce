const helper = require("../../utils/helper");
const orderService = require("./orderService");
const { getOrderReq } = require("./orderValidate");
const createHttpError = require('http-errors');



getOrder = async (req, res, next) => {
  try {
    let isValid = await getOrderReq.validateAsync(req.body);
    if(isValid instanceof Error){ 
      return next(isValid);
    }
    let body = req.body;
    let result = await orderService.getOrder(body);
    let re={result}
    helper.send(res, "Orders", re);
  } catch (error) {
    if(error.isJoi)
      return next(createHttpError(400, {message: error.message}));
    next(error)
  }
}




module.exports = {
  getOrder
}