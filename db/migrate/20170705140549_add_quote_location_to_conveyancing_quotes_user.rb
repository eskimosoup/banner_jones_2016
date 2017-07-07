class AddQuoteLocationToConveyancingQuotesUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :conveyancing_quotes_users, :conveyancing_quotes_quote_location, index: { name: 'quote_location_id' }
  end
end
