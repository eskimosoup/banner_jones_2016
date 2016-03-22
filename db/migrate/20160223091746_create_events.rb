class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, limit: 150, null: false
      t.text :summary, null: false
      t.text :content, null: true
      t.datetime :event_start, null: false
      t.datetime :event_end, null: false
      t.string :booking_link, null: true
      t.datetime :booking_deadline, null: true
      t.string :image, null: true
      t.string :social_share_title, limit: 150, null: true
      t.string :social_share_description, null: true
      t.string :social_share_image, null: true
      t.string :slug, null: true
      t.string :suggested_url, null: true
      t.integer :status, null: false, default: 1
      t.datetime :publish_at, null: false
      t.datetime :expire_at, null: true
      t.belongs_to :event_category, index: true, foreign_key: true
      t.belongs_to :event_location, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :events, :slug, unique: true
    add_index :events, :suggested_url, unique: true
  end
end
