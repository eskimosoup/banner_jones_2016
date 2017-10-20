class AddIpAddressToConveyancingQuotesUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :conveyancing_quotes_users, :ip_address, :string
  end
end
