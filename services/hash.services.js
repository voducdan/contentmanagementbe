const bcrypt = require('bcryptjs');

const hashStr = async function () {
    const salt = await bcrypt.genSalt(10);
    this.password = await bcrypt.hash(this.password, salt);
}

module.exports = {
    hashStr
}