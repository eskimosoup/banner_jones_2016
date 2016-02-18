class CreateOfficeLocations < ActiveRecord::Migration
  def change
    create_table :office_locations do |t|
      t.string :name, null: false
      t.boolean :display, null: true, default: true

      t.timestamps null: false
    end
  end
end
