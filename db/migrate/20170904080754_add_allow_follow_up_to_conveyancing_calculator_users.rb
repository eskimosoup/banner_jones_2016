class AddAllowFollowUpToConveyancingCalculatorUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :conveyancing_quotes_users, :allow_contact, :boolean
  end
end
