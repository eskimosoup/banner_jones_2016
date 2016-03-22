class CreateDownloadCategories < ActiveRecord::Migration
  def change
    create_table :download_categories do |t|
      t.string :title, null: false
      t.string :suggested_url, null: true, unique: true
      t.string :slug, null: true, unique: true
      t.integer :status, null: false, default: 1
      t.datetime :publish_at, null: false
      t.datetime :expire_at, null: true

      t.timestamps null: false
    end
  end
end
