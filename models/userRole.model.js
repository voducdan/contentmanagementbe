module.exports = (sequelize, Sequelize) => {
    const userRole = sequelize.define("userRole",
        {
            id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
            user_id: { type: Sequelize.INTEGER },
            role_id: { type: Sequelize.INTEGER },
        }
        , {
            timestamps: false,
            tableName: 'user_role'
        });
    return userRole;
};