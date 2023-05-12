const Sequelize = require("sequelize");
const db = require("../config/database");

const paymentDetailsSchema = db.sequelize.define(
  "payment_details",
  {
    id: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },

    order_id: Sequelize.INTEGER,
    amount: Sequelize.INTEGER,
    provider: Sequelize.STRING,
    status: {
        type: Sequelize.ENUM(['ORDERED', 'ACCEPTED', 'DELIVERED']),
        defaultValue: "ORDERED"
    },

    created_at : {
        type: Sequelize.DATE,
        allowNull: true,
        defaultValue: Sequelize.NOW
      },

      modified_at : {
        type: Sequelize.DATE,
        allowNull: true,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP')
      }
    
  },
  {
    timestamps: false,
  }
);


module.exports = {paymentDetailsSchema}