const db = require('../models');
const hashService = require('../services/hash.services');
const jwtService = require('../services/jwt.service');


const User = db.users;
const Role = db.roles;

const Op = db.Sequelize.Op;

exports.login = (req, res) => {
    const { email, password } = req.body;
    User.findOne(
        {
            where: {
                email: email
            },
            include: [
                {
                    model: Role,
                    required: true
                }
            ]
        }
    )
        .then(async user => {
            if (user) {
                const hashedPwd = user.password;
                const isPasswordMatch = await hashService.checkPassword(password, hashedPwd);
                if (isPasswordMatch) {
                    const token = jwtService.getSignedJWT(user.id);
                    res.status(200).json({ token: token });
                }
                else {
                    res.status(403).json({
                        message:
                            "Email hoặc password không đúng"
                    });
                }
            }
            else {
                res.status(403).json({
                    message:
                        "Email hoặc password không đúng"
                });
            }
        })
        .catch(err => {
            res.status(500).json({
                message:
                    err.message || "Đã xảy ra lỗi khi lấy thông tin đề tài!"
            });
        });
};

exports.register = (req, res) => {
    const { email, password, role } = req.body;
    User.findOne(
        {
            where: {
                email: email
            }
        }
    )
        .then(async user => {
            if (!user) {
                const hashedPwd = await hashService.hashStr(password);
                const userData = {
                    email,
                    password: hashedPwd,
                    role_id: role
                }
                User.create(userData)
                    .then(newUser => {
                        const token = jwtService.getSignedJWT(newUser.id);
                        res.status(200).json({ token: token });
                    })
            }
            else {
                res.status(400).json({
                    message:
                        "Email đã tồn tại"
                });
            }
        })
        .catch(err => {
            res.status(500).json({
                message:
                    err.message || "Đã xảy ra lỗi khi lấy thông tin đề tài!"
            });
        });
};
