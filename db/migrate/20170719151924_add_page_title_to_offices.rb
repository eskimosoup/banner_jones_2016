class AddPageTitleToOffices < ActiveRecord::Migration[5.0]
  def change
    add_column :offices, :page_title, :string
  end
end
