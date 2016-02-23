class AddTeamMemberToDepartment < ActiveRecord::Migration
  def change
    add_reference :departments, :team_member, index: true, foreign_key: true
  end
end
