const orderController = require("./orderController");
const validate = require("../../middleware/index")

module.exports = router => {
    router.post("/getOrder", validate.validateAuthToken(["ADMIN", "CUSTOMER"]), orderController.getOrder),
        router.put("/changeStatus", validate.validateAuthToken(["ADMIN"]), orderController.changeStatus),
        router.post("/orderProduct", validate.validateAuthToken(["CUSTOMER"]), orderController.orderProduct),
        router.get("/getCount", validate.validateAuthToken(["ADMIN"]), orderController.getCount),
        router.put("/changePaymentStatus", orderController.changePaymentStatus)
}