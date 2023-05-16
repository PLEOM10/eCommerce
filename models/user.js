const Sequelize = require("sequelize");
const db = require("../config/database");

const userSchema = db.sequelize.define(
  "user",
  {
    id: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },

    username: Sequelize.STRING,
    password: Sequelize.STRING,
    first_name: Sequelize.STRING,
    last_name: Sequelize.STRING,
    telephone: Sequelize.STRING,
    email: Sequelize.STRING,
    created_at : {
        type: Sequelize.DATE,
        allowNull: true,
        defaultValue: Sequelize.NOW
      },

    modified_at : {
        type: Sequelize.DATE,
        allowNull: true,
      },
      user_type:{
        type:Sequelize.ENUM(["CUSTOMER","ADMIN"]),
        defaultValue:"CUSTOMER"
      }

  },
  {
    timestamps: false,
  }
);




module.exports = {userSchema}