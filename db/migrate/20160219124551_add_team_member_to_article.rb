class AddTeamMemberToArticle < ActiveRecord::Migration
  def change
    add_reference :articles, :team_member, index: true, foreign_key: true
  end
end
