class AddConveyancingQuotesConfigurationToConveyancingQuotesQuoteLocation < ActiveRecord::Migration[5.0]
  def change
    add_reference :conveyancing_quotes_quote_locations, :conveyancing_quotes_configuration, foreign_key: true, index: { name: 'index_quote_locations_on_conveyancing_quotes_configuration_id' }
  end
end
