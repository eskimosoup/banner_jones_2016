class AddShowContactFormToServicesPage < ActiveRecord::Migration[5.0]
  def change
    add_column :services_pages, :show_contact_form, :boolean
  end
end
