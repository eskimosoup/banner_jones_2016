class ChangeConveyancingQuotesPurchases < ActiveRecord::Migration[5.0]
  def up
    remove_column :conveyancing_quotes_purchases, :title
    remove_column :conveyancing_quotes_purchases, :forename
    remove_column :conveyancing_quotes_purchases, :surname
    remove_column :conveyancing_quotes_purchases, :email
    add_column :conveyancing_quotes_purchases, :second_home_or_buy_to_let, :boolean, default: false
    add_column :conveyancing_quotes_purchases, :leasehold_house, :boolean, default: false
    add_column :conveyancing_quotes_purchases, :leasehold_apartment, :boolean, default: false
    add_column :conveyancing_quotes_purchases, :help_to_buy_scheme, :boolean, default: false
    add_column :conveyancing_quotes_purchases, :help_to_buy_isa, :boolean, default: false
    add_column :conveyancing_quotes_purchases, :shared_ownership_scheme, :boolean, default: false
  end

  def down
    add_column :conveyancing_quotes_purchases, :title
    add_column :conveyancing_quotes_purchases, :forename
    add_column :conveyancing_quotes_purchases, :surname
    add_column :conveyancing_quotes_purchases, :email
    remove_column :conveyancing_quotes_purchases, :second_home_or_buy_to_let, :boolean, default: false
    remove_column :conveyancing_quotes_purchases, :leasehold_house, :boolean, default: false
    remove_column :conveyancing_quotes_purchases, :leasehold_apartment, :boolean, default: false
    remove_column :conveyancing_quotes_purchases, :help_to_buy_scheme, :boolean, default: false
    remove_column :conveyancing_quotes_purchases, :help_to_buy_isa, :boolean, default: false
    remove_column :conveyancing_quotes_purchases, :shared_ownership_scheme, :boolean, default: false
  end
end
