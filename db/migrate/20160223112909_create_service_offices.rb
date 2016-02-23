class CreateServiceOffices < ActiveRecord::Migration
  def change
    create_table :service_offices do |t|
      t.belongs_to :service, index: true, foreign_key: true
      t.belongs_to :office, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
