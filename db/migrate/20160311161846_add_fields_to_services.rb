class AddFieldsToServices < ActiveRecord::Migration
  def change
    add_column :services, :icon, :string, null: true
    add_column :services, :colour, :string, null: true
    add_column :services, :banner_highlight, :boolean, default: false, null: true
  end
end
