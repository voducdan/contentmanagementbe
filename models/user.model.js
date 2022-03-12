module.exports = (sequelize, Sequelize) => {
    const users = sequelize.define("users",
        {
            id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
            email: { type: Sequelize.STRING },
            password: { type: Sequelize.STRING },
            created_at: {
                type: 'TIMESTAMP',
                defaultValue: Sequelize.literal('CURRENT_TIMESTAMP')
            },
        }
        , {
            timestamps: false,
            tableName: 'users'
        });
    return users;
};