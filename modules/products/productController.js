const helper = require("../../utils/helper");
const productService = require("./productService");
const { addProductReq } = require("./productValidate");
const createHttpError = require('http-errors');

addProduct = async(req,res,next)=>{
    try {
        let isValid = await addProductReq.validateAsync(req.body);
        if(isValid instanceof Error){
          return next(isValid)
        }
        let body = req.body;
        let payload =req.decoded;
        let result  = await productService.addProduct(req,payload,body);
        helper.send(res, "Product Added", result.data);
      } catch (error) {
        if(error.isJoi)
          return next(createHttpError(400, {message: error.message}));
        next(error);
   }
}

viewProduct = async(req,res,next)=>{
  try {
      let isValid = await viewProductReq.validateAsync(req.body);
      if(isValid instanceof Error){
        return next(isValid)
      }
      let body = req.body;
      let result  = await productService.viewProduct(body);
      helper.send(res, result.message, result.data);
    } catch (error) {
      if(error.isJoi)
        return next(createHttpError(400, {message: error.message}));
      next(error);
 }
}


module.exports = {
  addProduct,
  viewProduct
}