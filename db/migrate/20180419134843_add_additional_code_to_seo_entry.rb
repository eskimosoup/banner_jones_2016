class AddAdditionalCodeToSeoEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :seo_entries, :additional_code, :text
  end
end
