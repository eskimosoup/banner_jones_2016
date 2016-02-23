class CreateFrequentlyAskedQuestions < ActiveRecord::Migration
  def change
    create_table :frequently_asked_questions do |t|
      t.string :question, null: false
      t.text :answer, null: false
      t.integer :position
      t.boolean :display, null: true, default: true

      t.timestamps null: false
    end
  end
end
