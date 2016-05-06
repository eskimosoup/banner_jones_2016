class RemoveUniqueConstraints < ActiveRecord::Migration[5.0]
  def change
    remove_index :articles, :suggested_url
    remove_index :article_categories, :suggested_url
    remove_index :case_studies, :suggested_url
    remove_index :events, :suggested_url
    remove_index :resources, :suggested_url
    remove_index :services_pages, :suggested_url
    remove_index :videos, :suggested_url
  end
end
