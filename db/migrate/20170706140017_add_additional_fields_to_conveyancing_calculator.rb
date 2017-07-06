class AddAdditionalFieldsToConveyancingCalculator < ActiveRecord::Migration[5.0]
  def change
    add_column :conveyancing_quotes_quote_locations, :details, :text
    add_column :conveyancing_quotes_users, :submitted, :boolean, default: false
  end
end
