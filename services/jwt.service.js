const jwt = require('jsonwebtoken');

const getSignedJWT = function (id) {
    return jwt.sign({ id }, process.env.JWT_SECRET);
};

module.exports = {
    getSignedJWT
}