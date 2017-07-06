class CreateConveyancingQuotesAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :conveyancing_quotes_addresses do |t|
      t.belongs_to :conveyancing_quotes_user, foreign_key: true, index: { name: 'addresses_user_id' }
      t.string :address_type, null: false
      t.string :house_number, null: false
      t.string :address_line_1
      t.string :address_line_2
      t.string :town, null: false
      t.string :postcode, null: false

      t.timestamps
    end
  end
end
