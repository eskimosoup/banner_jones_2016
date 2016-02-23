class CreateEventLocations < ActiveRecord::Migration
  def change
    create_table :event_locations do |t|
      t.string :building_name, null: false
      t.string :address_line_1, null: false
      t.string :address_line_2, null: true
      t.string :city, null: false
      t.string :postcode, null: false
      t.float :latitude, null: true
      t.float :longitude, null: true

      t.timestamps null: false
    end
  end
end
