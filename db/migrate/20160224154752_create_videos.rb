class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.string :summary, null: true
      t.string :embed_code, null: false
      t.belongs_to :video_category, index: true, foreign_key: true
      t.boolean :display, null: true, default: true

      t.timestamps null: false
    end
  end
end
