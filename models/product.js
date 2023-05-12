const Sequelize = require("sequelize");
const db = require("../config/database");
const {productCategorySchema} =require("./productCategory");
const {productInventorySchema} =require("./productInventory");

const productSchema = db.sequelize.define(
  "product",
  {
    id: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },

    name: Sequelize.STRING,
    category_id: Sequelize.INTEGER,
    inventory_id: Sequelize.INTEGER,
    price: Sequelize.INTEGER,

    created_at : {
        type: Sequelize.DATE,
        allowNull: true,
        defaultValue: Sequelize.NOW
      },

    modified_at : {
        type: Sequelize.DATE,
        allowNull: true
      },

    deleted_at : {
        type: Sequelize.DATE,
        allowNull: true
      }
  },
  {
    timestamps: false,
  }
);

productCategorySchema.hasMany(productSchema,{ foreignKey:'category_id'});
productSchema.belongsTo(productCategorySchema,{ foreignKey:'category_id'});

productInventorySchema.hasOne(productSchema, { foreignKey: 'inventory_id' });
productSchema.belongsTo(productInventorySchema, { foreignKey: 'inventory_id' });

module.exports = {productSchema}