class CreateConveyancingQuotesRemortgages < ActiveRecord::Migration[5.0]
  def change
    create_table :conveyancing_quotes_remortgages do |t|
      t.string :title, null: false
      t.string :forename, null: false
      t.string :surname, null: false
      t.string :phone
      t.string :email, null: false
      t.string :timeframe
      t.decimal :price, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
