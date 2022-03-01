module.exports = (sequelize, Sequelize) => {
    const statuses = sequelize.define("statuses",
        {
            id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
            name: { type: Sequelize.STRING },
            tab: { type: Sequelize.INTEGER },
            prefill: { type: Sequelize.INTEGER }
        }
        , {
            timestamps: false,
            tableName: 'statuses'
        });
    return statuses;
};