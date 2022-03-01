var express = require('express');
var router = express.Router();

const topicCancel = require("../controllers/topicCancel.controller.js");

/* GET home page. */
router.post('/', topicCancel.create);

module.exports = router;
