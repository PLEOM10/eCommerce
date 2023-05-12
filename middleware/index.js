const helper = require('../utils/helper');
const jwt = require("jsonwebtoken");
const { JWT_SECRET } = require('../config');

module.exports = {
    validateAuthToken: (user_roles = []) => {
        return (req, res, next) => {
            const authorizationHeader = req.headers.authorization;
            let result;

            if(typeof user_roles === 'string') {
                user_roles = [user_roles]
            }
            if (authorizationHeader) {
                const token = req.headers.authorization.split(' ')[1]; 
                const options = {
                    expiresIn: '72h'
                };
                try {
                    
                    result = jwt.verify(token, JWT_SECRET, options);
                    
                    req.decoded = result;
                    
                    if(user_roles.length && !user_roles.includes(result.role)) {
                        return helper.send(res, "Unauthorized",[], 401)
                    }            
                    next();
                } catch (err) {
                    if (err.name) {
                        if (err.name == 'TokenExpiredError') {
                            err.message = 'Authentication error, Token expired.'
                        }
                        let result;
                        helper.send(res, err.message, "", 401);
                    }
                    
                }
            } else {
                let result;
                let errMsg = 'Authentication error, Token required.'
                helper.send(res, errMsg, "", 401);
            }
        }
    }
    ,
    getAuthTokenPayload:(req)=>{
        const authorizationHeader = req.headers.authorization;
        let result;
        if (authorizationHeader) {
            const token = req.headers.authorization.split(' ')[1]; // Bearer <token>
            const options = {
                expiresIn: '72h'
            };
            try {
                result = jwt.verify(token, JWT_SECRET, options);
            } catch (err) {
                result = null;
            }
        }else{
            result = null;
        }
        return result;
    }
};