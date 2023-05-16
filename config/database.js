const Sequelize = require("sequelize");
const { MYSQL_DB, MYSQL_USER, MYSQL_PASSWORD, MYSQL_HOST, MYSQL_PORT } = require(".");

const db = {};
const sequelize = new Sequelize(MYSQL_DB, MYSQL_USER, MYSQL_PASSWORD, {
    logging: false,
    host: MYSQL_HOST,
    port: MYSQL_PORT,
    dialect: "mysql",
    timezone: "+05:30",
    pool: {
        max: 5,
        min: 0,
        acquire: 100000,
        idle: 20000
    },
    define: {
        freezeTableName: true,
        plain: true
    },
    dialectOptions: {
        //useUTC: false, //for reading from database
        dateStrings: true,
        typeCast: function(field, next) { // for reading from database
            if (field.type === 'DATETIME') {
                return field.string()
            }
            if (field.type === 'DATE') {
                return field.string()
            }
            return next()
        },
    },
});

db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;