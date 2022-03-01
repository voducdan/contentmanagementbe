module.exports = (sequelize, Sequelize) => {
    const topicCanceled = sequelize.define("topicCanceled",
        {
            id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
            id_topic: { type: Sequelize.INTEGER },
            reason: { type: Sequelize.STRING }
        }
        , {
            timestamps: false,
            tableName: 'topic_canceled',
            freezeTableName: true
        });
    return topicCanceled;
};