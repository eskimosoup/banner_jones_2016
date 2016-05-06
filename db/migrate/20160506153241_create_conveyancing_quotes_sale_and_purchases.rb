class CreateConveyancingQuotesSaleAndPurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :conveyancing_quotes_sale_and_purchases do |t|
      t.string :title, null: false
      t.string :forename, null: false
      t.string :surname, null: false
      t.string :phone
      t.string :email, null: false
      t.string :timeframe
      t.decimal :sale_price, precision: 10, scale: 2, null: false
      t.decimal :purchase_price, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
