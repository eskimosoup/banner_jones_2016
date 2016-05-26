FactoryGirl.define do
  factory :team_member do
    forename 'Joe'
    surname 'Bloggs'

    profile 'My Profile'
    specialisms 'My Specialisms'
    publish_at { Time.zone.now - 1.day }
    expire_at nil

    has_vcard_download false
    google_plus_link 'MyString'
    twitter_link 'MyString'
    facebook_link 'MyString'
    mobile_number 'MyString'
    dx_number 'MyString'
    primary_telephone 'MyString'
    secondary_telephone 'MyString'
    email_address 'MyString'
  end
end

