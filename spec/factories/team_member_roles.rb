FactoryGirl.define do
  factory :team_member_role do
    sequence(:title) { |n| "Role #{n}" }
    position 1
    display true
  end
end
