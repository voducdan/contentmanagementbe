const dbConfig = require('../config/db.config');

const Sequelize = require('sequelize');

const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
    host: dbConfig.HOST,
    dialect: dbConfig.dialect,
    logging: false,

    pool: {
        max: dbConfig.pool.max,
        min: dbConfig.pool.min,
        acquire: dbConfig.pool.acquire,
        idle: dbConfig.pool.idle
    }
});

const topics = require("./topic.model")(sequelize, Sequelize);
const topicsBackup = require("./topicBackup.model")(sequelize, Sequelize);
const statuses = require("./status.model")(sequelize, Sequelize);
const topicCancel = require("./topicCancel.model")(sequelize, Sequelize);
const categories = require("./category.model")(sequelize, Sequelize);
const logs = require("./log.model")(sequelize, Sequelize);
const users = require("./user.model")(sequelize, Sequelize);
const roles = require("./role.model")(sequelize, Sequelize);

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.topics = topics;
db.statuses = statuses;
db.topicCancel = topicCancel;
db.categories = categories;
db.logs = logs;
db.users = users;
db.roles = roles;
db.topicsBackup = topicsBackup;

topics.hasOne(statuses, {
    foreignKey: 'id',
    sourceKey: 'status_id'
});
users.hasOne(roles, {
    foreignKey: 'id',
    sourceKey: 'role_id'
});
topics.hasOne(categories, {
    foreignKey: 'id',
    sourceKey: 'category_level_1'
});
topicCancel.belongsTo(topics, {
    foreignKey: 'id_topic',
    sourceKey: 'topic_id',
    onDelete: 'cascade'
});
logs.belongsTo(users, {
    foreignKey: 'id',
    sourceKey: 'user_id'
});

module.exports = db;