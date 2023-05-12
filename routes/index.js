const product = require("../modules/products/productRouter");
const user = require("../modules/user/userRouter");

module.exports = router => {
  user(router);
  product(router);
  return router;
}