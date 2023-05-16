const Sequelize = require("sequelize");
const db = require("../config/database");
const {orderDetailsSchema} = require("./orderDetails");
const {productSchema} =require("./product");

const orderItemsSchema = db.sequelize.define(
  "order_items",
  {
    id: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },

    order_id: Sequelize.INTEGER,
    product_id: Sequelize.INTEGER,
    quantity: Sequelize.STRING,
    
    created_at : {
        type: Sequelize.DATE,
        allowNull: true,
        defaultValue: Sequelize.NOW
      },

      modified_at : {
        type: Sequelize.DATE,
        allowNull: true,
      }
    
  },
  {
    timestamps: false,
  }
);

orderDetailsSchema.hasMany(orderItemsSchema,{ foreignKey:'order_id'});
orderItemsSchema.belongsTo(orderDetailsSchema,{ foreignKey:'order_id'});

productSchema.hasOne(orderItemsSchema,{ foreignKey:'product_id'});
orderItemsSchema.belongsTo(productSchema,{ foreignKey:'product_id'});


module.exports = {orderItemsSchema}