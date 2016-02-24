class CreateServiceVideos < ActiveRecord::Migration
  def change
    create_table :service_videos do |t|
      t.belongs_to :service, index: true, foreign_key: true
      t.belongs_to :video, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
