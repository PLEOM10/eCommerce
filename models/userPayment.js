const Sequelize = require("sequelize");
const db = require("../config/database");
const userSchema = require("./user");

const userPaymentSchema = db.sequelize.define(
  "user",
  {
    id: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },

    user_id:Sequelize.INTEGER,
    payment_type:Sequelize.INTEGER,
    provider:Sequelize.STRING,
    account_no:Sequelize.STRING,
  },
  {
    timestamps: false,
  }
);

userSchema.hasMany(userPaymentSchema,{ foreignKey:'user_id'});
userPaymentSchema.belongsTo(userSchema,{ foreignKey:'user_id'});


module.exports = {userPaymentSchema}