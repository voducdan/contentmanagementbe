const db = require('../models');

const Topic = db.topics;
const Status = db.statuses;
const TopicCancel = db.topicCancel;

const Op = db.Sequelize.Op;

// Retrieve all topic from the database.
exports.findAll = (req, res) => {
    const tab = req.query.tab;
    Topic.findAll({
        include: [{
            model: Status,
            required: true
        }],
        where: {
            tab: tab
        }
    })
        .then(data => {
            res.status(200).json({ data });
        })
        .catch(err => {
            res.status(500).json({
                message:
                    err.message || "Đã xảy ra lỗi khi lấy thông tin đề tài!"
            });
        });
};
exports.findOne = (req, res) => {
    const topicId = req.params.topicId;
    Topic.max('tab', { where: { 'topic_id': topicId } })
        .then(data => {
            Topic.findOne({
                include: [
                    {
                        model: Status,
                        required: true
                    }
                ],
                where: {
                    tab: data,
                    topic_id: topicId
                }
            })
                .then(topicMeta => {
                    if ([10, 11].includes(topicMeta.status_id)) {
                        TopicCancel.findOne({
                            where: {
                                id_topic: topicMeta.topic_id
                            }
                        })
                            .then(topicCancel => {
                                res.status(200).json({ data: topicMeta, topicCancel: topicCancel });
                            })
                            .catch(err => {
                                res.status(500).json({
                                    message:
                                        err.message || "Đã xảy ra lỗi khi lấy thông tin đề tài!"
                                });
                            })
                    }
                    else {
                        res.status(200).json({ data: topicMeta });
                    }
                })
                .catch(err => {
                    res.status(500).json({
                        message:
                            err.message || "Đã xảy ra lỗi khi lấy thông tin đề tài!"
                    });
                });
        })

};

exports.create = (req, res) => {
    // Create a topic
    const topic = req.body;
    // Save topic in the database
    Topic.create(topic)
        .then(data => {
            Topic.findOne(
                {
                    where: {
                        id: data.id
                    },
                    include: [
                        {
                            model: Status,
                            required: true
                        }
                    ]
                }
            )
                .then(returnedTopic => { res.status(200).json({ data: returnedTopic }); })

        })
        .catch(err => {
            res.status(500).json({
                message:
                    err.message || "Đã xảy ra lỗi khi tạo đề tài!"
            });
        });
};

exports.update = async (req, res) => {
    try {
        const coverImg = req.file;
        const { body } = req;
        if (coverImg) {
            body['cover_url'] = coverImg.path;
        }
        await Topic.update(body, {
            where: {
                id: body.id
            }
        });
        const topic = await Topic.findOne({
            include: [{
                model: Status,
                required: true
            }],
            where: {
                id: body.id
            }
        })
        if ([10, 11].includes(topic.status_id)) {
            TopicCancel.findOne({
                where: {
                    id_topic: topicMeta.topic_id
                }
            })
                .then(topicCancel => {
                    res.status(200).json({ data: topic, topicCancel: topicCancel });
                })
                .catch(err => {
                    res.status(500).json({
                        message:
                            err.message || "Đã xảy ra lỗi khi lấy thông tin đề tài!"
                    });
                })
        }
        else {
            res.status(200).json({ data: topic });
        }
    }
    catch (err) {
        res.status(500).json({
            message:
                err.message || "Đã xảy ra lỗi khi cập nhật đề tài!"
        });
    }
};
