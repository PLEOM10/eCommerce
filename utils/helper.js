var path = require("path");

send = (res, message, data = "", status = 200) => {
    let result = {
        status,
        message,
        data
    }
    res.status(status).send(result);

};



module.exports = {
    send
};