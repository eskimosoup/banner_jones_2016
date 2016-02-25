class CreateTeamMemberAdditionalRoles < ActiveRecord::Migration
  def change
    create_table :team_member_additional_roles do |t|
      t.belongs_to :team_member, index: true, foreign_key: true
      t.belongs_to :team_member_role, index: true, foreign_key: true
      t.integer :position, null: true

      t.timestamps null: false
    end
  end
end
