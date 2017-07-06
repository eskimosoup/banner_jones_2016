class CreateConveyancingQuotesDeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :conveyancing_quotes_deeds do |t|
      t.belongs_to :conveyancing_quotes_user, foreign_key: true, index: { name: 'deeds_user_id' }
      t.string :full_name, null: false
      t.date :date_of_birth, null: false

      t.timestamps
    end
  end
end
