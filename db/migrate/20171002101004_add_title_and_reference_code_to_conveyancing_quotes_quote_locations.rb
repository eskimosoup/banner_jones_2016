class AddTitleAndReferenceCodeToConveyancingQuotesQuoteLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :conveyancing_quotes_quote_locations, :title, :string
    add_column :conveyancing_quotes_quote_locations, :reference_code, :string, unique: true, index: true
  end
end
