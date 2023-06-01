//customer messages - 1001 to 1100

const message = {
    200: {
        message: "",
        httpCode: 200,
        status: 1,
    },
    201: {
        message: "Record Created Successfully",
        httpCode: 201,
        status: 1,
    },

    204: {
        message: "No record found",
        httpCode: 200,
        status: 1,
    },
    400: {
        message: "Bad Request",
        httpCode: 400,
        status: 0,
    },
    401: {
        message: "You are not authorized to perform this action.",
        httpCode: 401,
        status: 0,
    },
    500: {
        message: "Error occured while processing request, please try again later",
        httpCode: 200,
        status: 0,
    },
};

module.exports = message;