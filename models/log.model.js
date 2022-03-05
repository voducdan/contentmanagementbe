module.exports = (sequelize, Sequelize) => {
    const logs = sequelize.define("logs",
        {
            id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
            user_id: { type: Sequelize.INTEGER },
            updated_column: { type: Sequelize.STRING },
            old_value: { type: Sequelize.STRING },
            new_value: { type: Sequelize.STRING },
            updated_at: { type: 'TIMESTAMP' }
        }
        , {
            timestamps: false,
            tableName: 'logs'
        });
    return logs;
};