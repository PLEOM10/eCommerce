const {orderDetailsSchema} = require("../../models/orderDetails");
const {orderItemsSchema}=require("../../models/orderItems")
const {productSchema}=require("../../models/product")
const {userSchema}=require("../../models/user")

getOrder =  async(body)=>{
    let result = { data:null };
    const {id} = body;
  
    let order =await orderDetailsSchema.findAll({
        where:{
            id:id
        },
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

    if(order){
        result.code=201
        result.data=order
    }else{
        result.code=204
        result.data=[]
    }
    return result
  }

  orderProduct =  async(payload,body)=>{
    let result = { data:null };
    const {product_id,quantity} = body;
    
    
    let user= await userSchema.findOne({
        where:{
            id:payload.id
        },
    }) 

    let product= await productSchema.findOne({
        where:{
            id:product_id
        },
        attributes:['name','price']
    })

    let total=quantity * product.price;

    let order =await orderDetailsSchema.create({
        user_id:payload.id,
        total:total
    }) 

    let order_id=order.id;

    let order_items=await orderItemsSchema.create({
        order_id:order_id,
        product_id:product_id,
        quantity:quantity
    })
 
    result.data=order_items
    result.product=product.name
    result.email=user.email
    return result
  }
  
module.exports = {
    getOrder,
    orderProduct
}