class AddNullToConveyancingUsersPhone < ActiveRecord::Migration[5.0]
  def change
    change_column :conveyancing_quotes_users, :phone, :string, null: true
  end
end
