class CreateConveyancingQuotesQuoteLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :conveyancing_quotes_quote_locations do |t|
      t.string :location, index: true, unique: true
      t.string :suggested_url
      t.string :slug, index: true
      t.boolean :display, default: true

      t.timestamps
    end
  end
end
