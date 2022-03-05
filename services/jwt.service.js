const jwt = require('jsonwebtoken');

const getSignedJWT = function () {
    return jwt.sign({ _id: this._id }, process.env.JWT_SECRET);
};

module.exports = {
    getSignedJWT
}