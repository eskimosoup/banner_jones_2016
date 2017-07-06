class ChangeConveyancingQuotesSales < ActiveRecord::Migration[5.0]
  def up
    add_reference :conveyancing_quotes_sales, :conveyancing_quotes_user, foreign_key: true, index: { name: 'sales_user_id' }

    remove_column :conveyancing_quotes_sales, :title
    remove_column :conveyancing_quotes_sales, :forename
    remove_column :conveyancing_quotes_sales, :surname
    remove_column :conveyancing_quotes_sales, :email
    add_column :conveyancing_quotes_sales, :leasehold_house, :boolean, default: false
    add_column :conveyancing_quotes_sales, :leasehold_apartment, :boolean, default: false
    add_column :conveyancing_quotes_sales, :shared_ownership_scheme, :boolean, default: false
  end

  def down
    add_column :conveyancing_quotes_sales, :title, :string
    add_column :conveyancing_quotes_sales, :forename, :string
    add_column :conveyancing_quotes_sales, :surname, :string
    add_column :conveyancing_quotes_sales, :email, :string
    remove_column :conveyancing_quotes_sales, :leasehold_house, :boolean, default: false
    remove_column :conveyancing_quotes_sales, :leasehold_apartment, :boolean, default: false
    remove_column :conveyancing_quotes_sales, :shared_ownership_scheme, :boolean, default: false
    remove_index :conveyancing_quotes_sales, name: 'user_id'
    remove_column :conveyancing_quotes_sales, :conveyancing_quotes_user_id
  end
end
