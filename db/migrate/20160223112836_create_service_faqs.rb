class CreateServiceFaqs < ActiveRecord::Migration
  def change
    create_table :service_faqs do |t|
      t.belongs_to :service, index: true, foreign_key: true
      t.belongs_to :frequently_asked_question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
