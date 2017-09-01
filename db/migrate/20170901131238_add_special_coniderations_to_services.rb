class AddSpecialConiderationsToServices < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :inherit_sidebar_text, :boolean
    add_column :services, :inherit_page_layout_content, :boolean
    add_column :services, :hide_preferred_office_on_forms, :boolean
    add_column :services, :custom_page_title, :string
  end
end
