const db = require('../models');

const Topic = db.topics;
const Status = db.statuses;
const TopicCancel = db.topicCancel;
const Log = db.logs;
const TopicsBackup = db.topicsBackup;

const Op = db.Sequelize.Op;

const TABS = {
    1: 'copyright',
    2: 'produce',
    3: 'upload'
}

// Retrieve all topic from the database.
exports.findAll = (req, res) => {
    const tab = req.query.tab;
    if (!req.userRoles.includes('admin') && !req.userRoles.includes(TABS[tab])) {
        res.status(401).json({
            message: "Unauthorized"
        });
        return;
    }
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
exports.findMaxTab = (req, res) => {
    const topicId = req.params.topicId;
    const tab = Number(req.query.tab);
    console.log(topicId)

    Topic.findOne({
        where: {
            topic_id: topicId,
            tab: tab + 1
        }
    })
        .then(data => {
            if (data) {
                res.status(200).json({ status: data.status_id });
            }
            else {
                res.status(200).json({ status: null });
            }
        })
        .catch(err => {
            console.log(err.message)
            res.status(500).json({
                message:
                    err.message
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
                                console.log(err.message)
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
                    console.log(err.message)
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
            console.log(err.message)
            res.status(500).json({
                message:
                    err.message || "Đã xảy ra lỗi khi tạo đề tài!"
            });
        });
};

exports.update = async (req, res) => {
    try {
        const { body } = req;
        for (let key in body){
            if(body[key] === 'null'){
                body[key] = null
            }
        }
        const type = req.headers.type;
        if (type === 'metadata' && (!req.userRoles.includes('admin') && !req.userRoles.includes('copyright'))) {
            res.status(401).json({
                message: "Unauthorized"
            });
            return;
        }

        const coverImg = req.file;
        if (coverImg) {
            body['cover_url'] = coverImg.path;
        }

        const previousTopic = await Topic.findOne({
            include: [{
                model: Status,
                required: true
            }],
            where: {
                id: body.id
            }
        })

        await Topic.update(body, {
            where: {
                id: body.id
            }
        });

        for (let i in body) {
            if (![
                'expected_completion_day',
                'completed_at',
                'completed_produce_at',
                'completed_upload_at',
                'last_modified_status',
                'created_at',
                'created_on_produce_tab',
                'created_on_upload_tab',
                'updated_at',
                'status'
            ].includes(i) && String(body[i]) !== String(previousTopic[i])) {
                let log = {
                    user_id: req.user.id,
                    updated_column: i,
                    old_value: previousTopic[i],
                    new_value: body[i],
                }
                await Log.create(log)
            }
        }

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
                    id_topic: topic.topic_id
                }
            })
                .then(topicCancel => {
                    res.status(200).json({ data: topic, topicCancel: topicCancel });
                })
                .catch(err => {
                    console.log(err.message)
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
        console.log(err.message)
        res.status(500).json({
            message:
                err.message || "Đã xảy ra lỗi khi cập nhật đề tài!"
        });
    }
};

exports.delete = async (req, res) => {
    const topicId = req.params.topicId;
    try {
        if (!req.userRoles.includes('admin')) {
            res.status(401).json({
                message: "Unauthorized"
            });
            return;
        }
        const deletedTopic = await Topic.findOne({
            where: {
                topic_id: topicId
            }
        });
        const deletedTopicValue = deletedTopic.dataValues;
        await TopicCancel.destroy({
            where: {
                id_topic: deletedTopic.topic_id
            }
        });
        await Topic.destroy(
            {
                where: {
                    topic_id: deletedTopicValue.topic_id
                }
            }
        );
        await TopicsBackup.create(deletedTopicValue);
        res.status(200).json({ data: deletedTopicValue });
    }
    catch (err) {
        console.log(err.message)
        res.status(500).json({
            message:
                err.message
        });
    };
}
