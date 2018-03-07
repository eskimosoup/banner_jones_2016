class CreateConveyancingQuotesConfigurations < ActiveRecord::Migration[5.0]
  def change
    create_table :conveyancing_quotes_configurations do |t|
      t.string :title
      t.string :location
      t.string :style
      t.boolean :email_required, default: true
      t.boolean :phone_required, default: false
      t.boolean :show_legal_fee_prices, default: false
      t.boolean :show_legal_fee_subtotal, default: false
      t.boolean :show_additional_services_prices, default: false
      t.boolean :show_additional_services_subtotal, default: false
      t.boolean :show_additional_costs_prices, default: false
      t.boolean :show_additional_costs_subtotal, default: false
      t.boolean :show_total, default: false

      t.timestamps
    end
  end
end
