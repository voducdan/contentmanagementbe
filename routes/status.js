var express = require('express');
var router = express.Router();

const statuses = require("../controllers/status.controller");

/* GET home page. */
router.get('/', statuses.findAll);

module.exports = router;
