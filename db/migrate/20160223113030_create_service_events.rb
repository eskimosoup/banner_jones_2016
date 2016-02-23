class CreateServiceEvents < ActiveRecord::Migration
  def change
    create_table :service_events do |t|
      t.belongs_to :service, index: true, foreign_key: true
      t.belongs_to :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
