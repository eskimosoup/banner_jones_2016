class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :summary, null: false
      t.text :content, null: false
      t.string :image, null: true
      t.string :social_share_title, null: true
      t.string :social_share_image, null: true
      t.string :social_share_description, null: true
      t.string :suggested_url, null: true, unique: true
      t.integer :status, null: false, default: 1
      t.datetime :publish_at, null: false
      t.datetime :expire_at, null: true
      t.boolean :home_page_highlight, default: true
      t.string :slug, null: true, unique: true

      t.timestamps null: false
    end
  end
end
