class CreateEventCategories < ActiveRecord::Migration
  def change
    create_table :event_categories do |t|
      t.string :title, null: false
      t.string :suggested_url, null: true
      t.string :slug, null: true
      t.integer :status, null: false, default: 2
      t.datetime :publish_at, null: false
      t.datetime :expire_at, null: true

      t.timestamps null: false
    end
    add_index :event_categories, :suggested_url, unique: true
    add_index :event_categories, :slug, unique: true
  end
end
