var express = require('express');
var router = express.Router();

const users = require("../controllers/user.controller");

/* GET home page. */
router.post('/login', users.login);
router.post('/register', users.register);

module.exports = router;
