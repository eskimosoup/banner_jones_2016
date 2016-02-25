FactoryGirl.define do
  factory :team_member do
    team_member_role
    forename 'Forename'
    surname 'Surname'
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

    trait :with_additional_roles do
      after(:build) do |team_member|
        team_member.additional_roles = build_list(:team_member_role, 2)
      end
    end
    factory :team_member_with_additional_roles, traits: [:with_additional_roles]
  end
end
