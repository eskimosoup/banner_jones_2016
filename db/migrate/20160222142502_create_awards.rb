class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.integer :position, null: true
      t.string :title, null: false
      t.string :image, null: false
      t.string :link, null: true
      t.integer :status, null: false, default: 1
      t.datetime :publish_at, null: false
      t.datetime :expire_at, null: true

      t.timestamps null: false
    end
  end
end
