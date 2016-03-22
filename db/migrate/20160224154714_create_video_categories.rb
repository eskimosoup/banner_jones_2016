class CreateVideoCategories < ActiveRecord::Migration
  def change
    create_table :video_categories do |t|
      t.string :title, null: false
      t.integer :status, null: false, default: 1
      t.datetime :publish_at, null: false
      t.datetime :expire_at, null: true
      t.string :suggested_url, null: true
      t.string :slug, null: true

      t.timestamps null: false
    end

    add_index :video_categories, :slug, unique: true
    add_index :video_categories, :suggested_url, unique: true
  end
end
