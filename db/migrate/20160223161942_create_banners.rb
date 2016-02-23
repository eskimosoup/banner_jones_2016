class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.integer :position
      t.string :title, null: true
      t.text :summary, null: true
      t.string :image, null: false
      t.string :button_text, null: true
      t.string :button_link, null: true
      t.boolean :display, null: true, default: true

      t.timestamps null: false
    end
  end
end
