class CreateArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories do |t|
      t.string :title, null: false, unique: true
      t.string :suggested_url, null: true, unique: true
      t.string :slug, null: true, unique: true
      t.boolean :display, null: true, default: true

      t.timestamps null: false
    end
  end
end
