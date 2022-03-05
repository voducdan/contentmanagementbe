module.exports = (sequelize, Sequelize) => {
    const roles = sequelize.define("roles",
        {
            id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
            role: { type: Sequelize.STRING }
        }
        , {
            timestamps: false,
            tableName: 'roles'
        });
    return roles;
};