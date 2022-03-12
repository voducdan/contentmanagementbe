const jwt = require('jsonwebtoken');
const db = require('../models');

const Role = db.roles;
const UserRole = db.userRole;

function checkUserRole(user, rolesList) {
    const userRoles = user.map(i => i.role.role);
    for (let i of userRoles) {
        if (rolesList.includes(i)) {
            return true;
        }
    }
    return false;
}

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
        const user = await UserRole.findAll({
            where: {
                user_id: decoded.id
            },
            include: [
                {
                    model: Role,
                    required: true
                }
            ]
        });
        req.user = user;
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
        try {
            if (!checkUserRole(req.user, roles)) {
                res.status(401).json({
                    message: "Unauthorized"
                });
                return;
            }
            req.userRoles = req.user.map(i => i.role.role);
            next();
        }
        catch (error) {
            console.log(error.message);
            res.status(500).json({
                message:
                    error.message || "Unauthenticate"
            });
        }
    };
};
