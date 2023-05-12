const Sequelize = require("sequelize");
const db = require("../config/database");
const userSchema = require("./user");
const paymentDetailsSchema = require("./paymentDetails");

const orderDetailsSchema = db.sequelize.define(
  "order_details",
  {
    id: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },

    user_id: Sequelize.INTEGER,
    total: Sequelize.STRING,
    payment_id: Sequelize.INTEGER,
    
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

userSchema.hasOne(orderDetailsSchema,{ foreignKey:'user_id'});
orderDetailsSchema.belongsTo(userSchema,{ foreignKey:'user_id'});

paymentDetailsSchema.hasOne(orderDetailsSchema,{ foreignKey:'payment_id'});
orderDetailsSchema.belongsTo(paymentDetailsSchema,{ foreignKey:'payment_id'});

module.exports = {orderDetailsSchema}