class CreateTeamMemberRoles < ActiveRecord::Migration
  def change
    create_table :team_member_roles do |t|
      t.string :name, null: false
      t.integer :position, null: true
      t.boolean :display, null: true, default: true

      t.timestamps null: false
    end
  end
end
