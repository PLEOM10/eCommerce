const {orderDetailsSchema} = require("../models/orderDetails");
const {orderItemsSchema}=require("../models/orderItems")
const {productSchema}=require("../models/product")

viewOrder=async()=>{
    let result = { data:null };
  
    let order =await orderDetailsSchema.findAll({
        attributes:['total'],
        include:[{
            model:orderItemsSchema,
            attributes:['quantity'],
            include:[{
                model:productSchema,
                attributes:['name','price']
            }]
        }]
    })

    
        result.code=201
        result.data=order
    
    return result
  }




module.exports = {
  viewOrder
}