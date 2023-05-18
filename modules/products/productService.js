const { productSchema } = require("../../models/product");
const { productCategorySchema } = require("../../models/productCategory")
const { productInventorySchema } = require("../../models/productInventory")

addProduct = async(req, payload, body) => {
    let result = { data: null };
    const {
        id,
        name,
        category_id,
        inventory_id,
        price
    } = body;

    let product = new productSchema()
    product.id = id;
    product.name = name;
    product.category_id = category_id;
    product.inventory_id = inventory_id;
    product.price = price;
    await product.save();
    result.code = 201;
    result.data = product;
    return result;
}

viewProduct = async(body) => {

    let result = { data: null, message: null };
    if (body.category_id) {
        const category_id = body.category_id;
        const product = await productSchema.findAll({
            where: {
                category_id: category_id
            },
            attributes: ['id', 'name', 'price'],
            include: [{
                model: productCategorySchema,
                attributes: [
                    ['name', 'category']
                ]
            }, {
                model: productInventorySchema,
                attributes: [
                    ['quantity', 'stock available']
                ]
            }]
        })
        if (product) {
            result.data = product;
            result.message = "Products";
        } else {
            result.data = [];
            result.message = "Category Doesnot exist"
        }
    } else {
        const allProducts = await productSchema.findAll({
            attributes: ['id', 'name', 'price'],
            include: [{
                model: productCategorySchema,
                attributes: [
                    ['name', 'category']
                ]
            }, {
                model: productInventorySchema,
                attributes: [
                    ['quantity', 'stock']
                ]
            }]
        });
        result.data = allProducts;
        result.message = "All Products"
    }
    return result
}


module.exports = {
    addProduct,
    viewProduct
}