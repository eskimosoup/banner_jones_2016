class CreateTeamMemberRoles < ActiveRecord::Migration
  def change
    create_table :team_member_roles do |t|
      t.string :title, null: false
      t.integer :position, null: true
      t.integer :status, null: false, default: 2
      t.datetime :publish_at, null: false
      t.datetime :expire_at, null: true

      t.timestamps null: false
    end
  end
end
