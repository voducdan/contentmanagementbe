const db = require('../models');

const Topic = db.topics;
const Status = db.statuses;

const Op = db.Sequelize.Op;

// Retrieve all topic from the database.
exports.findAll = (req, res) => {

    Topic.findAll({
        include: [{
            model: Status,
            required: true
        }]
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

exports.create = (req, res) => {
    // Create a topic
    const topic = {
        original_name: req.body.originalName,
        vi_name: req.body.viName,
        short_description: req.body.shortDescription,
        author: req.body.author,
        copyright_trustee: req.body.copyrightTrustee,
        keywords: req.body.keywords,
        translation: req.body.translation,
        status_id: req.body.status || 1,
        category_level_1: null,
        category_level_2: null,
        description: null,
        type_of_sale: null,
        contracted_at: null,
        contract_term: null,
        cover_price: null,
        royalty: null,
        copyright_price: null,
        translation_cost: null,
        buy_permission: null,
        partner_note: null,
        voice_note: null,
        contract_note: null,
        cover_url: null
    };

    // Save topic in the database
    Topic.create(topic)
        .then(data => {
            Topic.findOne(
                {
                    where: {
                        id: data.id
                    },
                    include: [{
                        model: Status,
                        required: true
                    }]
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
        const { body } = req;
        await Topic.update(body, {
            where: {
                id: body.id
            }
        });
        const topic = await Topic.findAll({
            include: [{
                model: Status,
                required: true
            }],
            where: {
                id: body.id
            }
        })
        res.status(200).json({ data: topic[0] });
    }
    catch (err) {
        res.status(500).json({
            message:
                err.message || "Đã xảy ra lỗi khi cập nhật đề tài!"
        });
    }
};