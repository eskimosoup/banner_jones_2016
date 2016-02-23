class CreateServiceDownloads < ActiveRecord::Migration
  def change
    create_table :service_downloads do |t|
      t.belongs_to :service, index: true, foreign_key: true
      t.belongs_to :download, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
