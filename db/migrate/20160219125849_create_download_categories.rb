class CreateDownloadCategories < ActiveRecord::Migration
  def change
    create_table :download_categories do |t|
      t.string :title, null: false
      t.string :suggested_url, null: true, unique: true
      t.string :slug, null: true, unique: true
      t.boolean :display, null: true, default: true

      t.timestamps null: false
    end
  end
end
