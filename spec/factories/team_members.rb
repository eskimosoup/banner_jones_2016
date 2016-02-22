FactoryGirl.define do
  factory :team_member do
    team_member_role
    forename 'MyString'
    surname 'MyString'
    primary_telephone 'MyString'
    secondary_telephone 'MyString'
    email_address 'MyString'
    display true
    specialisms '<p>MyText</p>'
    has_vcard_download false
    profile '<p>MyText</p>'
    google_plus 'MyString'
    twitter_link 'MyString'
    facebook_link 'MyString'
    mobile_number 'MyString'
    dx_number 'MyString'

    trait :with_image do
      image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    end
    factory :team_member_with_image, traits: [:with_image]
  end
end
