FactoryGirl.define do
  factory :audience do
    sequence(:id) { |n| n }
    sequence(:title) { |n| "Audience #{n}" }
    display true

    trait :with_departments do
      after(:build) do |audience|
        audience.departments = build_list(:department, 1, audience: audience)
      end
    end
    factory :audience_with_departments, traits: [:with_departments]
  end
end
