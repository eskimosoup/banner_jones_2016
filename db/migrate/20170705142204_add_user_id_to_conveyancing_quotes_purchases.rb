class AddUserIdToConveyancingQuotesPurchases < ActiveRecord::Migration[5.0]
  def change
    add_reference :conveyancing_quotes_purchases, :conveyancing_quotes_user, foreign_key: true, index: { name: 'user_id' }
  end
end
