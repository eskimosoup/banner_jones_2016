class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :invoice_number, null: false
      t.string :name, null: false
      t.string :contact_number, null: false
      t.decimal :amount, null: false, precision: 15, scale: 2
      t.string :code, null: false

      t.timestamps
    end
  end
end
