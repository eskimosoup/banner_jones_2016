class AddFirstTimeBuyerToConveyancingQuotesPurchase < ActiveRecord::Migration[5.0]
  def change
    add_column :conveyancing_quotes_purchases, :first_time_buyer, :boolean, default: false
  end
end
