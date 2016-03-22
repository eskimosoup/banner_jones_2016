class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title, limit: 150, null: false
      t.text :summary, null: false
      t.text :content, null: false
      t.string :image, null: true
      t.string :social_share_title, limit: 150, null: true
      t.string :social_share_description, null: true
      t.string :social_share_image, null: true
      t.string :slug, null: true
      t.string :suggested_url, null: true
      t.integer :status, null: false, default: 1
      t.datetime :publish_at, null: false
      t.datetime :expire_at, null: true
      t.belongs_to :team_member, index: true, foreign_key: true
      t.belongs_to :blog_category, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :blog_posts, :slug, unique: true
    add_index :blog_posts, :suggested_url, unique: true
  end
end
