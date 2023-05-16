const product = require("../modules/products/productRouter");
const user = require("../modules/user/userRouter");
const order = require("../modules/order/orderRouter");

module.exports = router => {
  user(router);
  product(router);
  order(router);
  return router;
}