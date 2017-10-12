class UpdatePricePrecision < ActiveRecord::Migration[5.0]
  def change
    change_column :conveyancing_quotes_purchases, :price, :decimal, precision: 50
    change_column :conveyancing_quotes_sales, :price, :decimal, precision: 50
  end
end
