class CreateResourcesSections < ActiveRecord::Migration[5.0]
  def change
    create_table :resources_sections do |t|
      t.belongs_to :resource, foreign_key: true
      t.integer :position, default: 0
      t.string :title
      t.text :content
      t.string :image
      t.boolean :display, default: true
      t.string :style

      t.timestamps
    end
  end
end
