var express = require('express');
var router = express.Router();

const topics = require("../controllers/topic.controller");

/* GET home page. */
router.get('/', topics.findAll);
router.post('/', topics.create);
router.put('/', topics.update);

module.exports = router;
