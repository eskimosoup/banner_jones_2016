class CreateArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories do |t|
      t.string :title, null: false, unique: true
      t.string :suggested_url, null: true, unique: true
      t.string :slug, null: true, unique: true
      t.integer :status, null: false, default: 1
      t.datetime :publish_at, null: false
      t.datetime :expire_at, null: true

      t.timestamps null: false
    end
  end
end
