class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.belongs_to :department, index: true, foreign_key: true
      t.integer :parent_id
      t.string :title, limit: 150, null: false
      t.text :summary, null: false
      t.text :content, null: true
      t.string :social_share_title, null: true
      t.text :social_share_description, null: true
      t.string :image, null: true
      t.string :social_share_image, null: true
      t.string :slug, null: true
      t.string :suggested_url, null: true
      t.integer :status, null: false, default: 1
      t.datetime :publish_at, null: false
      t.datetime :expire_at, null: true

      t.timestamps null: false
    end
    add_index :services, :slug, unique: true
    add_index :services, :suggested_url, unique: true
  end
end
