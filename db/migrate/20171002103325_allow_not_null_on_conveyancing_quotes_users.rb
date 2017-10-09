class AllowNotNullOnConveyancingQuotesUsers < ActiveRecord::Migration[5.0]
  def up
    change_column :conveyancing_quotes_users, :forename, :string, null: true
    change_column :conveyancing_quotes_users, :surname, :string, null: true
    change_column :conveyancing_quotes_users, :email, :string, null: true
  end

  def down
    change_column :conveyancing_quotes_users, :forename, :string, null: false
    change_column :conveyancing_quotes_users, :surname, :string, null: false
    change_column :conveyancing_quotes_users, :email, :string, null: false
  end
end
