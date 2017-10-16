class AddEmailedToConveyancingQuotesUser < ActiveRecord::Migration[5.0]
  def change
    add_column :conveyancing_quotes_users, :quote_emailed, :boolean, default: false
  end
end
