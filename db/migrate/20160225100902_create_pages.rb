class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :slug, unique: true
      t.string :suggested_url, unique: true
      t.string :image, null: true
      t.string :style, null: false
      t.string :layout, null: false
      t.integer :status, null: false, default: 2
      t.datetime :publish_at, null: false
      t.datetime :expire_at, null: true
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
