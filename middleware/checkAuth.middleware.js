const jwt = require('jsonwebtoken');
const db = require('../models');

const User = db.users;
const Role = db.roles;

exports.checkToken = async (req, res, next) => {
    let token;
    if (
        req.headers.authorization &&
        req.headers.authorization.startsWith('Bearer')
    ) {
        token = req.headers.authorization.split(' ')[1];
    }
    if (!token) {
        res.status(403).json({
            message: "Unauthenticate"
        });
        return;
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        req.user = await User.findOne({
            where: {
                id: decoded.id
            },
            include: [
                {
                    model: Role,
                    required: true
                }
            ]
        });
        next();
    } catch (error) {
        res.status(403).json({
            message:
                error.message || "Unauthenticate"
        });
    }
};

exports.authorize = (...roles) => {
    return (req, res, next) => {
        const userRole = req.user.role.role;
        if (!roles.includes(userRole)) {
            res.status(401).json({
                message: "Unauthorized"
            });
            return;
        }
        next();
    };
};
