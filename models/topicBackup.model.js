module.exports = (sequelize, Sequelize) => {
    const topicsBackup = sequelize.define("topicsBackup",
        {
            id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
            topic_id: { type: Sequelize.INTEGER },
            original_name: { type: Sequelize.STRING },
            vi_name: { type: Sequelize.STRING },
            short_description: { type: Sequelize.TEXT },
            author: { type: Sequelize.STRING },
            copyright_trustee: { type: Sequelize.STRING },
            keywords: { type: Sequelize.TEXT },
            status_id: {
                type: Sequelize.INTEGER
            },
            category_level_1: { type: Sequelize.INTEGER },
            category_level_2: { type: Sequelize.STRING },
            description: { type: Sequelize.TEXT },
            type_of_sale: { type: Sequelize.STRING },
            contracted_at: { type: Sequelize.DATE },
            contract_term: { type: Sequelize.INTEGER },
            cover_price: { type: Sequelize.FLOAT },
            royalty: { type: Sequelize.FLOAT },
            copyright_price: { type: Sequelize.FLOAT },
            translation_cost: { type: Sequelize.FLOAT },
            produce_cost: { type: Sequelize.FLOAT },
            buy_permission: { type: Sequelize.STRING },
            partner_note: { type: Sequelize.TEXT },
            voice_note: { type: Sequelize.TEXT },
            contract_note: { type: Sequelize.TEXT },
            cover_url: { type: Sequelize.STRING },
            translation: { type: Sequelize.BOOLEAN },
            tab: { type: Sequelize.INTEGER },
            expected_completion_day: {
                type: 'TIMESTAMP',
                defaultValue: null,
                allowNull: true
            },
            completed_at: {
                type: 'TIMESTAMP',
                defaultValue: null,
                allowNull: true
            },
            completed_produce_at: {
                type: 'TIMESTAMP',
                defaultValue: null,
                allowNull: true
            },
            completed_upload_at: {
                type: 'TIMESTAMP',
                defaultValue: null,
                allowNull: true
            },
            last_modified_status: {
                type: 'TIMESTAMP',
                defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
                allowNull: false
            },
            created_at: {
                type: 'TIMESTAMP',
                defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
                allowNull: false
            },
            created_on_produce_tab: {
                type: 'TIMESTAMP',
                allowNull: true
            },
            created_on_upload_tab: {
                type: 'TIMESTAMP',
                allowNull: true
            },
            updated_at: {
                type: 'TIMESTAMP',
                defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
                allowNull: false
            }
        }
        , {
            timestamps: false,
            tableName: 'topics_backup'
        });
    return topicsBackup;
};