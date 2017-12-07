class AddTitleAndContentToOfficeLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :office_locations, :title, :string
    add_column :office_locations, :content, :text
    add_column :office_locations, :image, :string
  end
end
