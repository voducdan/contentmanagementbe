var express = require('express');
var router = express.Router();

const categories = require("../controllers/category.controller");

/* GET home page. */
router.get('/', categories.findAll);

module.exports = router;
