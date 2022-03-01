const db = require('../models');

const topicCancel = db.topicCancel;

const Op = db.Sequelize.Op;

exports.create = (req, res) => {
    // Create a topic
    const body = {
        id_topic: req.body.id_topic,
        reason: req.body.reason
    };
    console.log(body)
    // Save topic in the database
    topicCancel.create(body)
        .then(data => {
            res.status(200).json({ data })
        })
        .catch(err => {
            res.status(500).json({
                message:
                    err.message || "Đã xảy ra lỗi khi tạo đề tài!"
            });
        });
};