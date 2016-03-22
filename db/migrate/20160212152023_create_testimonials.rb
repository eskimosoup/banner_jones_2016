class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.text :content, null: false
      t.string :author_name, null: false
      t.string :author_company
      t.string :image
      t.integer :status, null: false, default: 1
      t.datetime :publish_at, null: false
      t.datetime :expire_at, null: true
      t.integer :position

      t.timestamps null: false
    end
  end
end
