class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :title, null: false
      t.text :summary, null: false
      t.text :description, null: true
      t.string :file, null: false
      t.string :image, null: true
      t.belongs_to :download_category, index: true, foreign_key: true
      t.integer :status, null: false, default: 1
      t.datetime :publish_at, null: false
      t.datetime :expire_at, null: true
      t.string :suggested_url, null: true, unique: true
      t.string :slug, null: true, unique: true

      t.timestamps null: false
    end
  end
end
