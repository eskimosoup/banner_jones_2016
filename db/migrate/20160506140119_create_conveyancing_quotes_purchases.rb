class CreateConveyancingQuotesPurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :conveyancing_quotes_purchases do |t|
      t.string :title, null: false
      t.string :forename, null: false
      t.string :surname, null: false
      t.string :phone
      t.string :email, null: false
      t.string :timeframe
      t.decimal :price, null: false, precision: 10, scale: 2

      t.timestamps
    end
  end
end
