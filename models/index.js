const dbConfig = require('../config/db.config');

const Sequelize = require('sequelize');

const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
    host: dbConfig.HOST,
    dialect: dbConfig.dialect,

    pool: {
        max: dbConfig.pool.max,
        min: dbConfig.pool.min,
        acquire: dbConfig.pool.acquire,
        idle: dbConfig.pool.idle
    }
});

const topics = require("./topic.model")(sequelize, Sequelize);
const statuses = require("./status.model")(sequelize, Sequelize);
const topicCancel = require("./topicCancel.model")(sequelize, Sequelize);
const categories = require("./category.model")(sequelize, Sequelize);

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.topics = topics;
db.statuses = statuses;
db.topicCancel = topicCancel;
db.categories = categories;

topics.hasOne(statuses, {
    foreignKey: 'id',
    sourceKey: 'status_id'
});
topics.hasOne(statuses, {
    foreignKey: 'id',
    sourceKey: 'status_id'
});
topics.hasOne(categories, {
    foreignKey: 'id',
    sourceKey: 'category_level_2'
});
topics.hasOne(categories, {
    foreignKey: 'id',
    sourceKey: 'category_level_1'
});
topicCancel.belongsTo(topics, {
    foreignKey: 'id_topic',
    sourceKey: 'topic_id'
});

module.exports = db;