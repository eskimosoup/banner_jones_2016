class AddTextColourToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :text_colour, :string, length: 7, default: '#fff'
  end
end
