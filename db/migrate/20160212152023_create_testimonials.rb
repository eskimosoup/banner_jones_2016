class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.text :content, null: false
      t.string :author_name, null: false
      t.string :author_company
      t.string :image
      t.boolean :display, default: true
      t.integer :position

      t.timestamps null: false
    end
  end
end
