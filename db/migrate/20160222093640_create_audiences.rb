class CreateAudiences < ActiveRecord::Migration
  def change
    create_table :audiences do |t|
      t.string :title
      t.boolean :display

      t.timestamps null: false
    end
  end
end
