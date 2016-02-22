class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :title, null: false
      t.text :summary, null: true
      t.string :image, null: true
      t.string :social_share_image, null: true
      t.boolean :display, null: true, default: true
      t.string :suggested_url, null: true, unique: true
      t.string :slug, null: true, unique: true
      t.belongs_to :audience, index: true, foreign_key: true
      t.integer :services_count

      t.timestamps null: false
    end
  end
end
