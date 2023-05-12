const Sequelize = require("sequelize");
const db = require("../config/database");

const productInventorySchema = db.sequelize.define(
  "product_inventory",
  {
    id: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },

    quantity: Sequelize.INTEGER,

    created_at : {
        type: Sequelize.DATE,
        allowNull: true,
        defaultValue: Sequelize.NOW
      },

    modified_at : {
        type: Sequelize.DATE,
        allowNull: true,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP')
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




module.exports = {productInventorySchema}