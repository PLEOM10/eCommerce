const dotenv = require('dotenv');

dotenv.config();

module.exports = {

  HOST: process.env.HOST ,
  PORT: process.env.PORT,
  NODE_ENV: process.env.NODE_ENV ,

  JWT_SECRET: process.env.JWT_SECRET ,
  
  MYSQL_DB: process.env.MYSQL_DB ,
  MYSQL_USER: process.env.MYSQL_USER ,
  MYSQL_PASSWORD: process.env.MYSQL_PASSWORD,
  MYSQL_HOST: process.env.MYSQL_HOST,
  MYSQL_PORT: process.env.MYSQL_PORT
};
