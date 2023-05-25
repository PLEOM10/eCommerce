const orderController = require("./orderController");
const validate = require("../../middleware/index")

module.exports = router => {
    router.post("/getOrder", validate.validateAuthToken(["ADMIN"]), orderController.getOrder),
        router.post("/getMyOrder/:id", validate.validateAuthToken(["CUSTOMER"]), orderController.getMyOrder),
        router.put("/changeStatus", validate.validateAuthToken(["ADMIN"]), orderController.changeStatus),
        router.post("/orderProduct", validate.validateAuthToken(["CUSTOMER"]), orderController.orderProduct),
        router.get("/getCount", validate.validateAuthToken(["ADMIN"]), orderController.getCount),
        router.put("/changePaymentStatus", orderController.changePaymentStatus)
}