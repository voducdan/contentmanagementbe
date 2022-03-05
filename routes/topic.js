var express = require('express');
var router = express.Router();
const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, path.join(__dirname, '..', 'public', 'images'))
    },
    filename: function (req, file, cb) {
        const uniqueSuffix = Date.now() + '_' + Math.round(Math.random() * 1E9)
        cb(null, uniqueSuffix + '_' + file.originalname)
    }
})

const upload = multer({ storage: storage })

const topics = require("../controllers/topic.controller");
const authMiddleware = require("../middleware/checkAuth.middleware");

/* GET home page. */
router.get('/', authMiddleware.checkToken, authMiddleware.authorize('admin', 'copyright', 'produce', 'upload'), topics.findAll);
router.get('/:topicId', authMiddleware.checkToken, authMiddleware.authorize('admin', 'copyright', 'produce', 'upload'), topics.findOne);
router.post('/', authMiddleware.checkToken, authMiddleware.authorize('admin', 'copyright', 'produce', 'upload'), topics.create);
router.put('/', authMiddleware.checkToken, authMiddleware.authorize('admin', 'copyright', 'produce', 'upload'), upload.single('coverImg'), topics.update);

module.exports = router;
