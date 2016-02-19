class AddArticleCategoryIdToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :article_category, index: true, foreign_key: true
  end
end
