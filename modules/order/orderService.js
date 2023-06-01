const { orderDetailsSchema } = require("../../models/orderDetails");
const { orderItemsSchema } = require("../../models/orderItems")
const { productSchema } = require("../../models/product")
const { productInventorySchema } = require("../../models/productInventory")
const { userSchema } = require("../../models/user")

getOrder = async(id) => {
    let result = { data: null };

    let order = await orderDetailsSchema.findAll({
        attributes: ['id', 'total', 'status', 'payment_status'],
        include: [{
                model: orderItemsSchema,
                attributes: ['quantity'],
                include: [{
                    model: productSchema,
                    attributes: ['name', 'price']
                }]
            },
            {
                model: userSchema,
                attributes: ['email']
            }
        ]
    })
    result.code = 201
    result.data = order

    return result
}

orderProduct = async(payload, body) => {
    let result = { data: null };
    const { product_id, quantity } = body;

    let user = await userSchema.findOne({
        where: {
            id: payload.id
        },
    })

    let product = await productSchema.findOne({
        where: {
            id: product_id
        },
        attributes: ['name', 'price', 'inventory_id']
    })

    let total = quantity * product.price;

    let order = await orderDetailsSchema.create({
        user_id: payload.id,
        total: total
    })

    let order_id = order.id;

    let order_items = await orderItemsSchema.create({
        order_id: order_id,
        product_id: product_id,
        quantity: quantity
    })

    let productInventory = await productInventorySchema.findOne({
        where: {
            id: product.inventory_id
        }
    })

    productInventory.quantity = productInventory.quantity - quantity
    await productInventory.save()

    result.data = order_items
    result.product = product.name
    result.email = user.email
    result.id = order_id
    return result
}

changeStatus = async(body) => {
    let result = { data: null }
    let order = await orderDetailsSchema.findOne({
        where: {
            id: body.id
        },
    })
    order.status = "ACCEPTED";
    await order.save();
    result.code = 200;
    result.data = order;
    result.email = body.email;
    result.name = body.name;
    result.quantity = body.quantity;
    return result;
}

changePaymentStatus = async(body) => {
    let result = { data: null }
    let order = await orderDetailsSchema.findOne({
        where: {
            id: body.id
        },
    })
    order.payment_status = "PAID";
    order.status = "PLACED";
    await order.save();
    result.code = 200;
    result.data = order;
    return result;
}
getCount = async() => {
    let result = {}
    let statusPlaced = await orderDetailsSchema.count({
        where: {
            status: "PLACED"
        }
    })

    let placed = await orderDetailsSchema.findAll({
        where: {
            status: "PLACED"
        },
        attributes: ['id', 'total', 'status', 'payment_status'],
        include: [{
                model: orderItemsSchema,
                attributes: ['quantity'],
                include: [{
                    model: productSchema,
                    attributes: ['name', 'price']
                }]
            },
            {
                model: userSchema,
                attributes: ['email']
            }
        ]
    })

    let statusAccepted = await orderDetailsSchema.count({
        where: {
            status: "ACCEPTED"
        }
    })

    let accepted = await orderDetailsSchema.findAll({
        where: {
            status: "ACCEPTED"
        },
        attributes: ['id', 'total', 'status', 'payment_status'],
        include: [{
                model: orderItemsSchema,
                attributes: ['quantity'],
                include: [{
                    model: productSchema,
                    attributes: ['name', 'price']
                }]
            },
            {
                model: userSchema,
                attributes: ['email']
            }
        ]
    })

    let statusCancelled = await orderDetailsSchema.count({
        where: {
            status: "CANCELLED"
        }
    })

    let cancelled = await orderDetailsSchema.findAll({
        where: {
            status: "CANCELLED"
        },
        attributes: ['id', 'total', 'status', 'payment_status'],
        include: [{
                model: orderItemsSchema,
                attributes: ['quantity'],
                include: [{
                    model: productSchema,
                    attributes: ['name', 'price']
                }]
            },
            {
                model: userSchema,
                attributes: ['email']
            }
        ]
    })
    result.placed = statusPlaced
    result.accepted = statusAccepted
    result.cancelled = statusCancelled
    result.allPlaced = placed
    result.allAccepted = accepted
    result.allCancelled = cancelled
    return result
}

module.exports = {
    getOrder,
    orderProduct,
    changeStatus,
    getCount,
    changePaymentStatus
}