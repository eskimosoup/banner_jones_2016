class RenameDepartmentsToAudiences < ActiveRecord::Migration[5.0]
  def change
    rename_table :departments, :audiences
    rename_column :services, :department_id, :audience_id
  end
end
