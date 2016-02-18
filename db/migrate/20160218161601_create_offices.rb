class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :name, null: true
      t.string :building_name, null: true
      t.string :building_number, null: true
      t.string :street, null: false
      t.string :town, null: false
      t.string :county, null: false
      t.string :postcode, null: false
      t.string :phone_number, null: true
      t.string :fax_number, null: true
      t.string :email, null: true
      t.string :dx_number, null: true
      t.text :details, null: true
      t.string :image, null: true
      t.belongs_to :office_location, index: true, foreign_key: true
      t.boolean :display, null: true, default: true
      t.string :suggested_url, null: true
      t.string :slug, null: true

      t.timestamps null: false
    end
  end
end
