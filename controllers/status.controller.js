const db = require('../models');

const Status = db.statuses;

const Op = db.Sequelize.Op;

// Retrieve all Tutorials from the database.
exports.findAll = (req, res) => {
    const tab = req.query.tab;
    Status.findAll(
        {
            where: {
                tab: tab
            }
        }
    )
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
