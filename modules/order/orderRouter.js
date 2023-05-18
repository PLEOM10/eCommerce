const orderController = require("./orderController");
const validate = require("../../middleware/index")

module.exports = router => {
    router.get("/getOrder", validate.validateAuthToken(["ADMIN"]), orderController.getOrder),
        router.put("/changeStatus", validate.validateAuthToken(["ADMIN"]), orderController.changeStatus),
        router.post("/orderProduct", validate.validateAuthToken(["CUSTOMER"]), orderController.orderProduct)
}