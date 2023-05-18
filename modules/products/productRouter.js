const productController = require("./productController");
const validate = require("../../middleware/index");

module.exports = router => {
    router.post("/addProduct", validate.validateAuthToken(["ADMIN"]), productController.addProduct),
        router.get("/viewProduct", validate.validateAuthToken(["CUSTOMER"]), productController.viewProduct)
}