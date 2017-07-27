class AmendConveyancingSalesAndPurchase < ActiveRecord::Migration[5.0]
  def up
    add_reference :conveyancing_quotes_sale_and_purchases, :conveyancing_quotes_user, foreign_key: true, index: { name: 'sales_and_purchases_user_id' }

    remove_column :conveyancing_quotes_sale_and_purchases, :title
    remove_column :conveyancing_quotes_sale_and_purchases, :forename
    remove_column :conveyancing_quotes_sale_and_purchases, :surname
    remove_column :conveyancing_quotes_sale_and_purchases, :email
    remove_column :conveyancing_quotes_sale_and_purchases, :purchase_price
    remove_column :conveyancing_quotes_sale_and_purchases, :sale_price
    add_reference :conveyancing_quotes_purchases, :conveyancing_quotes_sale_and_purchases, foreign_key: true, index: { name: 'sale_and_purchases_purchase_id' }
    add_reference :conveyancing_quotes_sales, :conveyancing_quotes_sale_and_purchases, foreign_key: true, index: { name: 'sale_and_purchases_sale_id' }
  end

  def down
    remove_column :conveyancing_quotes_sale_and_purchases, :conveyancing_quotes_user, foreign_key: true, index: { name: 'sales_and_purchases_user_id' }

    add_column :conveyancing_quotes_sale_and_purchases, :title, :string
    add_column :conveyancing_quotes_sale_and_purchases, :forename, :string
    add_column :conveyancing_quotes_sale_and_purchases, :surname, :string
    add_column :conveyancing_quotes_sale_and_purchases, :email, :string
    add_column :conveyancing_quotes_sale_and_purchases, :purchase_price, :integer
    add_column :conveyancing_quotes_sale_and_purchases, :sale_price, :integer
    remove_column :conveyancing_quotes_purchases, :conveyancing_quotes_sale_and_purchases, foreign_key: true, index: { name: 'sale_and_purchases_purchase_id' }
    remove_column :conveyancing_quotes_sales, :conveyancing_quotes_sale_and_purchases, foreign_key: true, index: { name: 'sale_and_purchases_sale_id' }
  end
end
