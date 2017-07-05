class CreateConveyancingQuotesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :conveyancing_quotes_users do |t|
      t.string :title
      t.string :forename, null: false
      t.string :surname, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :token, null: false, index: true, unique: true
      t.boolean :buying, default: false
      t.boolean :selling, default: false
      t.boolean :conveyancing_email_permission, default: false

      t.timestamps
    end
  end
end
