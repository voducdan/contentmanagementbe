const bcrypt = require('bcryptjs');

const hashStr = async function (password) {
    const salt = await bcrypt.genSalt(10);
    hashedPassword = await bcrypt.hash(password, salt);
    return hashedPassword
}

const checkPassword = async function (rawPassword, hashedPassword) {
    return await bcrypt.compare(rawPassword, hashedPassword);
};

module.exports = {
    hashStr,
    checkPassword
}