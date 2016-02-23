class CreateServiceRelatedServices < ActiveRecord::Migration
  def change
    create_table :service_related_services do |t|
      t.belongs_to :service, index: true, foreign_key: true
      t.belongs_to :related_service, index: true
      t.integer :position, null: true

      t.timestamps null: false
    end
  end
end
