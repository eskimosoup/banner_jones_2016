class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.integer :position
      t.string :forename, null: false
      t.string :surname, null: false
      t.string :image
      t.string :primary_telephone
      t.string :secondary_telephone
      t.string :email_address
      t.datetime :display_from
      t.datetime :display_until
      t.boolean :display, default: true
      t.text :specialisms
      t.boolean :has_vcard_download
      t.text :profile
      t.string :google_plus
      t.string :twitter_link
      t.string :facebook_link
      t.string :mobile_number
      t.string :dx_number
      t.string :suggested_url
      t.string :slug, unique: true
      t.belongs_to :team_member_role, index: true, null: true

      t.timestamps null: false
    end
  end
end
