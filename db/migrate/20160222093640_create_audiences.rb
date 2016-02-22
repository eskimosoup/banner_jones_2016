class CreateAudiences < ActiveRecord::Migration
  def change
    create_table :audiences do |t|
      t.string :title, null: false, unique: true
      t.boolean :display, null: true, default: true
      t.integer :position, null: true
      t.integer :departments_count, null: true
      t.string :suggested_url, null: true
      t.string :slug, null: true, unique: true

      t.timestamps null: false
    end
  end
end
