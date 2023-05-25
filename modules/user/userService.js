const { userSchema } = require("../../models/user");
const jwt = require('jsonwebtoken');
const authUtil = require("../../utils/login");
const { JWT_SECRET } = require("../../config");
const bcrypt = require("bcryptjs");

signUp = async(body) => {
    let result = { data: null };
    var { username, password, first_name, last_name, telephone, email } = body;
    let unq = await userSchema.findOne({
        where: {
            email: email
        }
    })
    if (!unq) {
        password = bcrypt.hashSync(password, 10)
        let user = await userSchema.create({
            username: username,
            password: password,
            first_name: first_name,
            last_name: last_name,
            telephone: telephone,
            email: email
        });
        result.code = 201;
        result.message = "Account Created"
        result.data = user;
        return result;
    } else {
        result.code = 500
        result.message = "Account with this email Exists"
        result.data = []
        return result
    }
}

logIn = async(body) => {
    const { username, password } = body;
    let result = { data: null };
    let id = await authUtil.verifyAuth(username, password);
    let user = await userSchema.findOne({
        where: {
            id: id
        }
    })
    if (user) {
        let payload = {
            id: user.id,
            telephone: user.telephone,
            role: user.user_type
        };
        let options = { expiresIn: "72h" };
        let token = jwt.sign(payload, JWT_SECRET, options);
        let resObj = Object.assign({}, user, {
            id: id,
            first_name: user.first_name,
            last_name: user.last_name,
            token: token,
            user_type: user.user_type

        });
        result.data = resObj;
    }
    return result
};

userDetails = async() => {
    let result = { data: null };
    const users = await userSchema.findAll({
        where: {
            user_type: "CUSTOMER"
        }
    })
    if (users) {
        result.data = users;
        result.code = 200;
    } else {
        result.code = 204;
        result.data = [];
        result.message = "No Record Found";
    }
    return result;

}

module.exports = {
    signUp,
    logIn,
    userDetails
}