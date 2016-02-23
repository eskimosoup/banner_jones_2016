class CreateServiceArticles < ActiveRecord::Migration
  def change
    create_table :service_articles do |t|
      t.belongs_to :service, index: true, foreign_key: true
      t.belongs_to :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
