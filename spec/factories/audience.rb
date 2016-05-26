FactoryGirl.define do
  factory :audience do
    team_member
    sequence(:title) { |n| "Title #{n}" }
    summary 'MyText'
    display true
    social_share_title 'MyString'
    social_share_description 'MyString'

  end
end
