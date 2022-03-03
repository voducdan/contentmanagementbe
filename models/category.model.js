module.exports = (sequelize, Sequelize) => {
    const categories = sequelize.define("categories",
        {
            id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
            name: {type:Sequelize.STRING},
            parent_id: {type:Sequelize.INTEGER},
            root_id: {type:Sequelize.INTEGER},
            code: {type:Sequelize.STRING},
            type: {type:Sequelize.STRING},
            position: {type:Sequelize.INTEGER},
            visible_mobile: {type:Sequelize.BOOLEAN},
            visible_web: {type:Sequelize.BOOLEAN},
            sub_name: {type:Sequelize.INTEGER},
            deleted_at: {type:'TIMESTAMP'},
            created_at: {type:'TIMESTAMP'},
            updated_at: {type:'TIMESTAMP'}
        }
        , {
            timestamps: false,
            tableName: 'categories'
        });
    return categories;
};