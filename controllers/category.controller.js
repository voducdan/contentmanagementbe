const db = require('../models');

const Category = db.categories;

const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
    const parentId = req.query.parent;
    let filterStatement = null;
    if (parentId) {
        filterStatement = {
            parent_id: parentId
        }
    }
    else {
        filterStatement = {
            parent_id: {
                [Op.eq]: null
            }
        }
    }


    Category.findAll(
        {
            where: filterStatement
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
