class AddShowContactFormToServices < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :show_contact_form, :boolean, default: false
  end
end
