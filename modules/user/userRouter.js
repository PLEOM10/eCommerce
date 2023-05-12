
const userController = require("./userController");
const validate = require("../../middleware/index");

module.exports = router => {
  router.post("/signUp", userController.signUp),
  router.post("/logIn", userController.logIn),
  router.get("/users", userController.userDetails)
}