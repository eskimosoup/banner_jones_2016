class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.integer :position, null: true
      t.string :title, null: false
      t.string :image, null: false
      t.string :link, null: true
      t.boolean :display, null: true, default: true

      t.timestamps null: false
    end
  end
end
