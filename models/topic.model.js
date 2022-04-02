module.exports = (sequelize, Sequelize) => {
    const topics = sequelize.define("topics",
        {
            id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
            topic_id: { type: Sequelize.INTEGER },
            original_name: { type: Sequelize.STRING, allowNull: true },
            vi_name: { type: Sequelize.STRING },
            short_description: { type: Sequelize.TEXT, allowNull: true },
            author: { type: Sequelize.STRING, allowNull: true },
            copyright_trustee: { type: Sequelize.STRING, allowNull: true },
            keywords: { type: Sequelize.TEXT, allowNull: true },
            status_id: {
                type: Sequelize.INTEGER,
                allowNull: true
            },
            category_level_1: { type: Sequelize.INTEGER, allowNull: true },
            category_level_2: { type: Sequelize.STRING, allowNull: true },
            description: { type: Sequelize.TEXT, allowNull: true },
            agency: { type: Sequelize.TEXT, allowNull: true },
            release_date: { type: Sequelize.TEXT, allowNull: true },
            type_of_sale: { type: Sequelize.STRING, allowNull: true },
            contracted_at: { type: Sequelize.DATE, allowNull: true },
            contract_term: { type: Sequelize.STRING, allowNull: true },
            cover_price: { type: Sequelize.FLOAT, allowNull: true },
            royalty: { type: Sequelize.FLOAT, allowNull: true },
            copyright_price: { type: Sequelize.FLOAT, allowNull: true },
            translation_cost: { type: Sequelize.FLOAT, allowNull: true },
            produce_cost: { type: Sequelize.FLOAT, allowNull: true },
            control_cost: { type: Sequelize.FLOAT, allowNull: true },
            post_production_cost: { type: Sequelize.FLOAT, allowNull: true },
            buy_permission: { type: Sequelize.STRING, allowNull: true },
            partner_note: { type: Sequelize.TEXT, allowNull: true },
            voice_note: { type: Sequelize.TEXT, allowNull: true },
            contract_note: { type: Sequelize.TEXT, allowNull: true },
            cover_url: { type: Sequelize.STRING, allowNull: true },
            translation: { type: Sequelize.BOOLEAN, allowNull: true },
            tab: { type: Sequelize.INTEGER, allowNull: true },
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
            tableName: 'topics'
        });
    return topics;
};
