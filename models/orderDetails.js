const Sequelize = require("sequelize");
const db = require("../config/database");
const { userSchema } = require("./user");

const orderDetailsSchema = db.sequelize.define(
    "order_details", {
        id: {
            type: Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey: true,
        },

        user_id: Sequelize.INTEGER,
        total: Sequelize.INTEGER,

        created_at: {
            type: Sequelize.DATE,
            allowNull: true,
            defaultValue: Sequelize.NOW
        },

        modified_at: {
            type: Sequelize.DATE,
            allowNull: true,
        },

        status: Sequelize.ENUM(["PLACED", "ACCEPTED", "CANCELLED"]),
        payment_status: Sequelize.ENUM(["UNPAID", "PAID"]),

    }, {
        timestamps: false,
    }
);

userSchema.hasOne(orderDetailsSchema, { foreignKey: 'user_id' });
orderDetailsSchema.belongsTo(userSchema, { foreignKey: 'user_id' });



module.exports = { orderDetailsSchema }